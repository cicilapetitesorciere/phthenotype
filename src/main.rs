use clap::{Parser, Subcommand};

mod link;
mod unlink;
mod save;
mod load;
mod status;
mod ls;
mod rm;
mod styles;

use link::*;
use unlink::*;
use save::*;
use load::*;
use status::*;
use ls::*;
use rm::*;

#[derive(Subcommand)]
enum Commands {
    /// Move <FILE> to a directory in phthenotype/active and replaces the original file with a symbolic link to the file's new location.
    Link {file: String},

    /// Undo ptheno link
    Unlink {file: String},

    /// Copy the contents of phthenotype/active into a directory in phthenotype/styles so that they can be loaded later.
    Save {name: Option<String>},

    /// Replace the contents of phthenotype/active with those of phthenotype/styles/<NAME> and reloads Sway. 
    Load {name: String},

    /// Print the name of the current style (i.e. the content of phthenotype/active/name)
    Status,

    /// List availible styles (i.e. the directories in phthenotype/styles)
    Ls,

    /// Remove a directory in phthenotype/styles
    Rm {name: String},
}

#[derive(Parser)]
struct Cli {
    #[command(subcommand)]
    command: Commands,
}

fn main() {
    match Cli::parse().command {
        Commands::Link      { file:         filename        }   => (),
        Commands::Unlink    { file:         filename        }   => (),
        Commands::Save      { name: Some(   filename    )   }   => (),
        Commands::Save      { name: None                            }   => (),
        Commands::Load      { name:         filename        }   => (),
        Commands::Status    {                                       }   => (),
        Commands::Ls        {                                       }   => ls(),
        Commands::Rm        { name:         filename        }   => (),
    }
}
