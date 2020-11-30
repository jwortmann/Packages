% SYNTAX TEST "Packages/Matlab/Matlab.sublime-syntax"


%---------------------------------------------
% Matlab OOP test

classdef (Sealed = false) classname < baseclass
% <- keyword.other
%         ^ variable.parameter
%                ^ keyword.operator.assignment
%                  ^ constant.language
%                         ^ entity.name.class
%                                     ^ entity.other.inherited-class
   properties (SetAccess = private, GetAccess = true)
%  ^ keyword.other
%              ^ variable.parameter
%                          ^ constant.language
%                                   ^ variable.parameter
      PropName
   end
%  ^ keyword.control
   methods
%  ^ keyword.other
      methodName
   end
   events
%  ^ keyword.other
      EventName
   end
   enumeration
%  ^ keyword.other
      EnumName
   end
end


%---------------------------------------------
% Syntax brackets/parens punctuation test

x = [ 1.76 ]
% <- source.matlab meta.variable.other.valid.matlab
% ^ source.matlab keyword.operator.assignment.matlab
%   ^ source.matlab punctuation.section.brackets.begin.matlab
%     ^^^^ source.matlab meta.brackets.matlab meta.number.float.decimal.matlab constant.numeric.value.matlab
%          ^ source.matlab punctuation.section.brackets.end.matlab


xAprox = fMetodoDeNewton( xi )
%  <- source.matlab meta.variable.other.valid.matlab
%      ^ source.matlab keyword.operator.assignment.matlab
%        ^ source.matlab meta.variable.other.valid.matlab
%                       ^ source.matlab punctuation.section.parens.begin.matlab
%                         ^ source.matlab meta.parens.matlab meta.variable.other.valid.matlab
%                            ^ source.matlab punctuation.section.parens.end.matlab


%---------------------------------------------
% Line comment test

%
%<- comment.line.percentage.matlab punctuation.definition.comment.matlab
%^ comment.line.percentage.matlab - punctuation

% comment % comment
%<- comment.line.percentage.matlab punctuation.definition.comment.matlab
%^^^^^^^^^^^^^^^^^^^ comment.line.percentage.matlab - punctuation

%%
%<- comment.line.double-percentage.matlab punctuation.definition.comment.matlab
%^ comment.line.double-percentage.matlab punctuation.definition.comment.matlab
% ^ comment.line.double-percentage.matlab - punctuation

%% comment % comment
%<- comment.line.double-percentage.matlab punctuation.definition.comment.matlab
%^ comment.line.double-percentage.matlab punctuation.definition.comment.matlab
% ^^^^^^^^^^^^^^^^^^^ comment.line.double-percentage.matlab - punctuation

%%%
%<- comment.line.percentage.matlab punctuation.definition.comment.matlab
%^^ comment.line.percentage.matlab punctuation.definition.comment.matlab
%  ^ comment.line.percentage.matlab - punctuation

%%%%% comment % comment %%%%
%<- comment.line.percentage.matlab punctuation.definition.comment.matlab
%^^^^ comment.line.percentage.matlab punctuation.definition.comment.matlab
%    ^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.percentage.matlab - punctuation

a = b % doc
%     ^ comment.line.percentage.matlab punctuation.definition.comment.matlab
%      ^^^^^ comment.line.percentage.matlab - punctuation

a = b %% doc
%     ^^ comment.line.double-percentage.matlab punctuation.definition.comment.matlab
%       ^^^^^ comment.line.double-percentage.matlab - punctuation


%---------------------------------------------
% Block comment test

% Success case
%{
x = 5
% ^ source.matlab comment.block.percentage.matlab
%}

% Invalid block
%{           Not start of block comment
%            ^ comment.line.percentage.matlab
x = 5
% ^ keyword.operator.assignment.matlab
%}

  %{
%}           Not end of block
%            ^ comment.block.percentage.matlab
x = 5
% ^ comment.block.percentage.matlab
  %}
x = 5 %{ not block comment
% ^ keyword.operator.assignment.matlab
x = 5
%   ^ meta.number.float.decimal.matlab constant.numeric.value.matlab

header = ['Last Name, ',      ... comment
%        ^^^^^^^^^^^^^^^^^^^^^ meta.brackets.matlab - comment
%                             ^^^ meta.brackets.matlab punctuation.separator.continuation.matlab
%                                ^ meta.brackets.matlab - punctuation - comment
%                                 ^^^^^^^^ meta.brackets.matlab comment.line.matlab - punctuation
          'First Name, ',     ... comment
%        ^^^^^^^^^^^^^^^^^^^^^ meta.brackets.matlab - comment
%                             ^^^ punctuation.separator.continuation.matlab
%                                ^ meta.brackets.matlab - punctuation - comment
%                                 ^^^^^^^^ meta.brackets.matlab comment.line.matlab - punctuation
          'Alias Name, ',     ...
%        ^^^^^^^^^^^^^^^^^^^^^ meta.brackets.matlab - comment
%                             ^^^ punctuation.separator.continuation.matlab
%                                ^ meta.brackets.matlab - punctuation - comment
      ... 'Middle Initial, ', ...
%^^^^^ meta.brackets.matlab - comment
%     ^^^ meta.brackets.matlab punctuation.separator.continuation.matlab
%        ^ meta.brackets.matlab - punctuation - comment
%         ^^^^^^^^^^^^^^^^^^^^^^^^ meta.brackets.matlab comment.line.matlab - punctuation
          'Title']
%^^^^^^^^^^^^^^^^^ meta.brackets.matlab - comment

%---------------------------------------------
% Function

function y = average(x)
% <- keyword.other
%        ^ variable.parameter.output.function.matlab
%            ^^^^^^^ entity.name.function.matlab
%                    ^ variable.parameter.input.function.matlab
   if ~isvector(x)
%     ^ keyword.operator.logical.matlab
       error('Input must be a vector')
   end
   y = sum(x)/length(x);
end

function [m,s] = stat(x)
% <- keyword.other
%         ^ variable.parameter.output.function.matlab
%          ^ -variable.parameter.output.function.matlab
%           ^ variable.parameter.output.function.matlab
%              ^ keyword.operator.assignment.matlab
%                ^^^^ entity.name.function.matlab
%                     ^ variable.parameter.input.function.matlab
   n = length(x);
   m = sum(x)/n;
   s = sqrt(sum((x-m).^2/n));
end

function m = avg(x,n)
%        ^ variable.parameter.output.function.matlab
%            ^^^ entity.name.function.matlab
%                ^ variable.parameter.input.function.matlab
%                  ^ variable.parameter.input.function.matlab
   m = sum(x)/n;
end

function foo(bar)
% <- keyword.other.matlab
%        ^^^ entity.name.function.matlab
%            ^^^ meta.function.parameters.matlab variable.parameter.input.function.matlab
end

function x = foo
% <- keyword.other.matlab
%        ^ variable.parameter.output.function.matlab
%          ^ keyword.operator.assignment.matlab
%            ^^^ entity.name.function.matlab
end

function foo
% <- keyword.other.matlab
%        ^^^ entity.name.function.matlab
end

function foo % with comment
% <- keyword.other.matlab
%        ^^^ entity.name.function.matlab
end


%---------------------------------------------
% Built-in variables

  ans
% ^^^ variable.language.matlab

X(1:2:end) 
%     ^^^ variable.language.matlab


%---------------------------------------------
% Numbers

 1
%^ meta.number.float.decimal.matlab constant.numeric.value.matlab
 .1
%^^ meta.number.float.decimal.matlab constant.numeric.value.matlab
%^ punctuation.separator.decimal.matlab
 1.1
%^^^ meta.number.float.decimal.matlab constant.numeric.value.matlab
% ^ punctuation.separator.decimal.matlab
 .1e1
%^^^^ meta.number.float.decimal.matlab constant.numeric.value.matlab
%^ punctuation.separator.decimal.matlab
 1.1e1
%^^^^^ meta.number.float.decimal.matlab constant.numeric.value.matlab
% ^ punctuation.separator.decimal.matlab
 1e1
%^^^ meta.number.float.decimal.matlab constant.numeric.value.matlab
 1i - (4i)
%^^ meta.number.imaginary.decimal.matlab constant.numeric
%^ constant.numeric.value.matlab
% ^ constant.numeric.suffix.matlab
%      ^^ meta.number.imaginary.decimal.matlab constant.numeric
%      ^ constant.numeric.value.matlab
%       ^ constant.numeric.suffix.matlab
 1j
%^^ meta.number.imaginary.decimal.matlab constant.numeric
%^ constant.numeric.value.matlab
% ^ constant.numeric.suffix.matlab
 1e2j
%^^^^ meta.number.imaginary.decimal.matlab constant.numeric
%^^^ constant.numeric.value.matlab
%   ^ constant.numeric.suffix.matlab
 0x2A
%^^^^ meta.number.integer.hexadecimal.matlab constant.numeric
%^^ constant.numeric.base.matlab
%  ^^ constant.numeric.value.matlab
 0X2A
%^^^^ meta.number.integer.hexadecimal.matlab constant.numeric
%^^ constant.numeric.base.matlab
%  ^^ constant.numeric.value.matlab
 0b101010
%^^^^^^^^ meta.number.integer.binary.matlab constant.numeric
%^^ constant.numeric.base.matlab
%  ^^^^^^ constant.numeric.value.matlab
 0B101010
%^^^^^^^^ meta.number.integer.binary.matlab constant.numeric
%^^ constant.numeric.base.matlab
%  ^^^^^^ constant.numeric.value.matlab
 0x2Au8
%^^^^^^ meta.number.integer.hexadecimal.matlab constant.numeric
%^^ constant.numeric.base.matlab
%  ^^ constant.numeric.value.matlab
%    ^^ constant.numeric.suffix.matlab
 0x2As32
%^^^^^^^ meta.number.integer.hexadecimal.matlab constant.numeric
%^^ constant.numeric.base.matlab
%  ^^ constant.numeric.value.matlab
%    ^^^ constant.numeric.suffix.matlab

%---------------------------------------------
% Operators
% https://www.mathworks.com/help/matlab/matlab_prog/matlab-operators-and-special-characters.html

C = A + B       % Addition
%     ^ keyword.operator.arithmetic.matlab
C = +A          % Unary plus
%   ^ keyword.operator.arithmetic.matlab
C = A - B       % Subtraction
%     ^ keyword.operator.arithmetic.matlab
C = -A          % Unary minus
%   ^ keyword.operator.arithmetic.matlab
C = A.*B        % Element-wise multiplication
%    ^^ keyword.operator.arithmetic.matlab
C = A*B         % Matrix multiplication
%    ^ keyword.operator.arithmetic.matlab
x = A./B        % Element-wise right division
%    ^^ keyword.operator.arithmetic.matlab
x = B/A         % Matrix right division
%    ^ keyword.operator.arithmetic.matlab
x = B.\A        % Element-wise left division
%    ^^ keyword.operator.arithmetic.matlab
x = A\B         % Matrix left division
%    ^ keyword.operator.arithmetic.matlab
C = A.^B        % Element-wise power
%    ^^ keyword.operator.arithmetic.matlab
C = A^B         % Matrix power
%    ^ keyword.operator.arithmetic.matlab
B = A.'         % Transpose
%    ^^ keyword.operator.transpose.matlab
B = A'          % Complex conjugate transpose
%    ^ keyword.operator.transpose.matlab
A == B          % Equal to
% ^^ keyword.operator.comparison.matlab
A ~= B          % Not equal to
% ^^ keyword.operator.comparison.matlab
A > B           % Greater than
% ^ keyword.operator.comparison.matlab
A >= B          % Greater than or equal to
% ^^ keyword.operator.comparison.matlab
A < B           % Less than
% ^ keyword.operator.comparison.matlab
A <= B          % Less than or equal to
% ^^ keyword.operator.comparison.matlab
A & B           % Logical AND
% ^ keyword.operator.logical.matlab
A | B           % Logical OR
% ^ keyword.operator.logical.matlab
expr1 && expr2  % Logical AND with short-circuiting
%     ^^ keyword.operator.logical.matlab
expr1 || expr2  % Logical OR with short-circuiting
%     ^^ keyword.operator.logical.matlab
x = j:k         % Vector creation
%    ^ keyword.operator.colon.matlab
A(:,n)          % Array subscripting
% ^ keyword.operator.colon.matlab


c = a.b' % is the conjugate and transpose of the field b of structure a
%    ^ punctuation.accessor.dot.matlab
%      ^ keyword.operator.transpose.matlab
c = a.b.' % is the transpose of the field b of structure a
%    ^ punctuation.accessor.dot.matlab
%      ^^ keyword.operator.transpose.matlab
x = a[3]' + b(4)' % is the conjugate and transpose
%       ^ keyword.operator.transpose.matlab
%               ^ keyword.operator.transpose.matlab

l = {l.n}';
%        ^ keyword.operator.transpose.matlab

%---------------------------------------------
% String
a = '%'
a = '.' % .'
%         ^^^ comment.line.percentage.matlab

 'a'a'
%  ^ string.quoted.single.matlab invalid.illegal.unescaped-quote.matlab
%^ string.quoted.single.matlab punctuation.definition.string.begin.matlab
% ^ string.quoted.single.matlab
%    ^ string.quoted.single.matlab punctuation.definition.string.end.matlab

regexprep(outloc,'.+\\','')
%                ^ punctuation.definition.string.begin.matlab
%                 ^^ meta.parens.matlab string.quoted.single.matlab
%                   ^^ constant.character.escape.matlab
%                     ^ punctuation.definition.string.end.matlab

s1="00:06:57";
%  ^ punctuation.definition.string.begin.matlab
%   ^^^^^^^^ string.quoted.double.matlab
%           ^ punctuation.definition.string.end.matlab

%---------------------------------------------
parfor x = 1:10
%^ keyword.control.matlab
end
