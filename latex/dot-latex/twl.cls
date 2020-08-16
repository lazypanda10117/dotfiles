\RequirePackage{twlbase}
\ProvidesExplClass{twl}{2019-05-10}{1.0}{Custom LaTeX Class}


%% Variables and Constants

\tl_const:Nn \c__twl_base_class_tl { article }

\bool_new:N \g__twl_letterpaper_bool
\bool_gset_true:N \g__twl_letterpaper_bool

% env

\bool_new:N \g__twl_frame_bool
\bool_new:N \g__twl_index_bool
\bool_new:N \g__twl_theorem_bool
\bool_new:N \g__twl_thmsection_bool

\bool_gset_false:N \g__twl_frame_bool
\bool_gset_false:N \g__twl_index_bool
\bool_gset_true:N \g__twl_theorem_bool
\bool_gset_true:N \g__twl_thmsection_bool

% graph

\bool_new:N \g__twl_algorithm_bool
\bool_new:N \g__twl_asymptote_bool
\bool_new:N \g__twl_asyinclude_bool
\bool_new:N \g__twl_diagrams_bool

\bool_gset_false:N \g__twl_algorithm_bool
\bool_gset_false:N \g__twl_asymptote_bool
\bool_gset_true:N \g__twl_asyinclude_bool
\bool_gset_false:N \g__twl_diagrams_bool

% math

\bool_new:N \g__twl_physics_bool
\bool_new:N \g__twl_siunitx_bool

\bool_gset_true:N \g__twl_physics_bool
\bool_gset_false:N \g__twl_siunitx_bool

% style

\bool_new:N \g__twl_colour_bool
\bool_new:N \g__twl_header_bool
\bool_new:N \g__twl_cheader_bool
\bool_new:N \g__twl_problem_bool
\bool_new:N \g__twl_section_bool
\bool_new:N \g__twl_title_bool

\bool_gset_true:N \g__twl_colour_bool
\bool_gset_false:N \g__twl_header_bool
\bool_gset_true:N \g__twl_cheader_bool
\bool_gset_false:N \g__twl_problem_bool
\bool_gset_true:N \g__twl_section_bool
\bool_gset_false:N \g__twl_title_bool


%% Options

% presets

\DeclareOption { lecture }
{
  \bool_gset_true:N \g__twl_frame_bool
  \bool_gset_true:N \g__twl_index_bool
  \bool_gset_true:N \g__twl_theorem_bool
  \bool_gset_true:N \g__twl_thmsection_bool

  \bool_gset_false:N \g__twl_algorithm_bool
  \bool_gset_false:N \g__twl_asymptote_bool
  % \bool_gset_true:N \g__twl_asyinclude_bool
  \bool_gset_false:N \g__twl_diagrams_bool

  \bool_gset_true:N \g__twl_physics_bool
  \bool_gset_false:N \g__twl_siunitx_bool

  \bool_gset_true:N \g__twl_colour_bool
  \bool_gset_true:N \g__twl_header_bool
  \bool_gset_true:N \g__twl_cheader_bool
  \bool_gset_false:N \g__twl_problem_bool
  \bool_gset_true:N \g__twl_section_bool
  \bool_gset_false:N \g__twl_title_bool
}

\DeclareOption { assignment }
{
  \bool_gset_false:N \g__twl_frame_bool
  \bool_gset_false:N \g__twl_index_bool
  \bool_gset_true:N \g__twl_theorem_bool
  \bool_gset_true:N \g__twl_thmsection_bool

  \bool_gset_false:N \g__twl_algorithm_bool
  \bool_gset_false:N \g__twl_asymptote_bool
  % \bool_gset_true:N \g__twl_asyinclude_bool
  \bool_gset_false:N \g__twl_diagrams_bool

  \bool_gset_true:N \g__twl_physics_bool
  \bool_gset_false:N \g__twl_siunitx_bool

  \bool_gset_false:N \g__twl_colour_bool
  \bool_gset_true:N \g__twl_header_bool
  \bool_gset_false:N \g__twl_cheader_bool
  \bool_gset_true:N \g__twl_problem_bool
  \bool_gset_false:N \g__twl_section_bool
  \bool_gset_false:N \g__twl_title_bool
}

% toggles

\DeclareOption { a4paper } { \bool_gset_false:N \g__twl_letterpaper_bool }
\DeclareOption { letterpaper } { \bool_gset_true:N \g__twl_letterpaper_bool }

% env

\DeclareOption { frame } { \bool_gset_true:N \g__twl_frame_bool }
\DeclareOption { noframe } { \bool_gset_false:N \g__twl_frame_bool }

\DeclareOption { index } { \bool_gset_true:N \g__twl_index_bool }
\DeclareOption { noindex } { \bool_gset_false:N \g__twl_index_bool }

\DeclareOption { notheorem } { \bool_gset_false:N \g__twl_theorem_bool }
\DeclareOption { theorem } { \bool_gset_true:N \g__twl_theorem_bool }

\DeclareOption { nothmsection } { \bool_gset_false:N \g__twl_thmsection_bool }
\DeclareOption { thmsection } { \bool_gset_true:N \g__twl_thmsection_bool }

% graph

\DeclareOption { algorithm } { \bool_gset_true:N \g__twl_algorithm_bool }
\DeclareOption { noalgorithm } { \bool_gset_false:N \g__twl_algorithm_bool }

\DeclareOption { asymptote } { \bool_gset_true:N \g__twl_asymptote_bool }
\DeclareOption { noasymptote } { \bool_gset_false:N \g__twl_asymptote_bool }

\DeclareOption { asyattach } { \bool_gset_false:N \g__twl_asyinclude_bool }
\DeclareOption { asyinclude } { \bool_gset_true:N \g__twl_asyinclude_bool }

\DeclareOption { diagrams } { \bool_gset_false:N \g__twl_diagrams_bool }
\DeclareOption { nodiagrams } { \bool_gset_true:N \g__twl_diagrams_bool }

% math

\DeclareOption { physics } { \bool_gset_false:N \g__twl_physics_bool }
\DeclareOption { nophysics } { \bool_gset_true:N \g__twl_physics_bool }

\DeclareOption { siunitx } { \bool_gset_false:N \g__twl_siunitx_bool }
\DeclareOption { nosiunitx } { \bool_gset_true:N \g__twl_siunitx_bool }

% style

\DeclareOption { nocolor } { \bool_gset_true:N \g__twl_colour_bool }
\DeclareOption { color } { \bool_gset_false:N \g__twl_colour_bool }
\DeclareOption { nocolour } { \bool_gset_true:N \g__twl_colour_bool }
\DeclareOption { colour } { \bool_gset_false:N \g__twl_colour_bool }

\DeclareOption { nofancy }
{
  \bool_gset_false:N \g__twl_header_bool
  \bool_gset_false:N \g__twl_section_bool
}
\DeclareOption { fancy }
{
  \bool_gset_true:N \g__twl_header_bool
  \bool_gset_true:N \g__twl_section_bool
}

\DeclareOption { header } { \bool_gset_true:N \g__twl_header_bool }
\DeclareOption { noheader } { \bool_gset_false:N \g__twl_header_bool }

\DeclareOption { problem } { \bool_gset_true:N \g__twl_problem_bool }
\DeclareOption { noproblem } { \bool_gset_false:N \g__twl_problem_bool }

\DeclareOption { nosection } { \bool_gset_false:N \g__twl_section_bool }
\DeclareOption { section } { \bool_gset_true:N \g__twl_section_bool }

\DeclareOption { title } { \bool_gset_true:N \g__twl_title_bool }
\DeclareOption { notitle } { \bool_gset_false:N \g__twl_title_bool }

% Eat all unused options
\DeclareOption* {}
\ProcessOptions\relax


%% Logic

\LoadClass [12pt] { \tl_use:N \c__twl_base_class_tl }

\declpkg { booktabs }
\declpkg { multirow }
\declpkg { soulutf8 }

\AddOptionsToPackage
{ \bool_if:NTF \g__twl_letterpaper_bool { letterpaper } { a4paper } }
{ \tl_use:N \c__twl_base_class_tl }

\RequirePackage { twlenv }
\RequirePackage { twlgraph }
\RequirePackage { twlmath }
\RequirePackage { twlstyle }

\IncludePackages
