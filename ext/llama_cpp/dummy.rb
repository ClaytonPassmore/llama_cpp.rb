# frozen_string_literal: true

# The following code is dummy for document generation.

# llama_cpp.rb provides Ruby bindings for the llama.cpp.
module LLaMACpp
  # LLaMA session magic.
  LLAMA_SESSION_MAGIC = '0x6767736e'

  # LLaMA session version.
  LLAMA_SESSION_VERSION = '2'

  # LLaMA default random seed.
  LLAMA_DEFALUT_SEED = '0xFFFFFFFF'

  # LLaMA cuda max devices.
  LLAMA_MAX_DEVICES = 1

  # LLaMA model file type.
  LLAMA_FTYPE_ALL_F32 = 0

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_F16  = 1

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q4_0 = 2

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q4_1 = 3

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q4_1_SOME_F16 = 4 # tok_embeddings.weight and output. weight are F16

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q8_0 = 7

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q5_0 = 8

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q5_1 = 9

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q2_K = 10

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q3_K_S = 11

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q3_K_M = 12

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q3_K_L = 13

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q4_K_S = 14

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q4_K_M = 15

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q5_K_S = 16

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q5_K_M = 17

  # LLaMA model file type.
  LLAMA_FTYPE_MOSTLY_Q6_K = 18

  # GrammarElement type: end of rule definition.
  LLAMA_GRETYPE_END = 0

  # GrammarElement type: start of alternate definition for rule.
  LLAMA_GRETYPE_ALT = 1

  # GrammarElement type: non-terminal element: reference to rule.
  LLAMA_GRETYPE_RULE_REF = 2

  # GrammarElement type: terminal element: character (code point).
  LLAMA_GRETYPE_CHAR = 3

  # GrammarElement type: inverse char(s) ([^a], [^a-b] [^abc]).
  LLAMA_GRETYPE_CHAR_NOT = 4

  # GrammarElement type: modifies a preceding LLAMA_GRETYPE_CHAR or LLAMA_GRETYPE_CHAR_ALT to be an inclusive range ([a-z]).
  LLAMA_GRETYPE_CHAR_RNG_UPPER = 5

  # GrammarElement type: modifies a preceding LLAMA_GRETYPE_CHAR or LLAMA_GRETYPE_CHAR_RNG_UPPER to add an alternate char to match ([ab], [a-zA]).
  LLAMA_GRETYPE_CHAR_ALT = 6

  module_function

  # Initializes the backend.
  #
  # @param numa [Boolean] The flag for NUMA optimizations.
  def backend_init(numa: false); end

  # Finalizes the backend, currently only used for MPI.
  def backend_free; end

  # Quantizes the model.
  #
  # @param input_path [String] The path to the input model file.
  # @param output_path [String] The path to the output model file.
  # @param params [ModelQuantizeParams] The paramters for model quantization.
  def model_quantize(input_path:, output_path:, params:); end

  # Prints system information.
  def print_system_info; end

  # Returns the time.
  # @return [Integer]
  def time_us; end

  # Returns the flag for supporting mmap.
  # @return [Boolean]
  def mmap_supported?; end

  # Returns the flag for supporting mlock.
  # @return [Boolean]
  def mlock_supported?; end

  # Returns the maximum number of devices.
  # @return [Integer]
  def max_devices; end
end

# llama_cpp.rb provides Ruby bindings for the llama.cpp.
module LLaMACpp
  # Class for token data
  class TokenData
    # Create token data.
    #
    # @param id [Integer] The id of token data.
    # @param logit [Float] The logit of token data.
    # @param p [Float] The probability of token data.
    # @return [TokenData]
    def initialize(id:, logit:, p:); end

    # Sets the id of token data.
    # @param id [Integer]
    def id=(id); end

    # Returns the id of token data.
    # @return [Integer]
    def id; end

    # Sets the logit of token data.
    # @param logit [Float]
    def logit=(logit); end

    # Returns the logit of token data.
    # @return [Float]
    def logit; end

    # Sets the probability of token data.
    # @param prob [Float]
    def p=(prob); end

    # Returns the probability of token data.
    # @return [Float]
    def p; end
  end

  # Class for token data array
  class TokenDataArray
    # Create token data array.
    def initialize(arr, sorted: false); end

    # Returns the size of token data array.
    # @return [Integer]
    def size; end

    # Returns the flag for sorted.
    # @return [Boolean]
    def sorted; end
  end

  # Class for model
  class Model
    # Create model.
    #
    # @param model_path [String] The path to the model file.
    # @param params [ModelParams] The parameters for context.
    def initialize(model_path: nil, params: nil); end

    # Returns whether the model is not loaded.
    #
    # @return [Boolean]
    def empty?; end

    # Deallocates model.
    #
    # @return [NilClass]
    def free; end

    # Loads model.
    #
    # @param model_path [String] The path to the model file.
    # @param params [ModelParams] The parameters for context.
    def load(model_path:, params:); end

    # Applies LLoRa from file.
    #
    # @param lora_path [String] The path to the LoRA file.
    # @param scale [Float] The scale.
    # @param base_model_path [String] The path to the base model file.
    # @param n_threads [Integer] The number of threads.
    def apply_lora_from_file(lora_path:, scale: 1.0, base_model_path: nil, n_threads: 1); end

    # Returns the number of vocabulary.
    # @return [Integer]
    def n_vocab; end

    # Returns the number of context of training.
    # @return [Integer]
    def n_ctx_train; end

    # Returns the number of embedding.
    # @return [Integer]
    def n_embd; end

    # Returns the model's RoPE frequency scaling factor.
    # @return [Float]
    def rope_freq_scale_train; end

    # Converts token to Ruby String.
    # @param token [Integer] The token to be converted.
    # @return [String]
    def token_to_piece(token); end

    # Returns the logits.
    #
    # @param text [String] The text to be tokenized.
    # @param n_max_tokens [Integer] The maximum number of tokens.
    # @param add_bos [Boolean] The flag to add the beginning of sentence token.
    # @param special [Boolean] The flag to allow tokenizing special and/or control tokens.
    # @return [Array<Integer>]
    def tokenize(text:, n_max_tokens:, add_bos: false, special: false); end

    # Returns the model type.
    # @return [String]
    def desc; end

    # Returns the total size of all the tensors in the model in bytes
    # @return [Integer]
    def size; end

    # Returns the number of parameters in the model
    # @return [Integer]
    def n_params; end

    # Returns the text of token.
    #
    # @param token_id [Integer]
    # @return [String]
    def text(token_id); end

    # Returns the score of token.
    #
    # @param token_id [Integer]
    # @return [Float]
    def score(token_id); end

    # Returns the type of token.
    #
    # @param token_id [Integer]
    # @return [Integer]
    def type(token_id); end

    # Returns the token id the beginning of sentence token.
    # @return [Integer]
    def token_bos; end

    # Returns the token id the end of sentence token.
    # @return [Integer]
    def token_eos; end

    # Returns the token id the new line token.
    # @return [Integer]
    def token_nl; end

    # Returns the flag to add the beginning of sentence token.
    # @return [Boolean]
    def add_bos_token?; end

    # Returns the flag to add the end of sentence token.
    # @return [Boolean]
    def add_eos_token?; end

    # Returns the token id for beginning of infill prefix.
    # @return [Integer]
    def token_prefix; end

    # Returns the token id for beginning of infill middle.
    # @return [Integer]
    def token_middle; end

    # Returns the token id for beginning of infill suffix.
    # @return [Integer]
    def token_suffix; end

    # Returns the token id for end of infill middle.
    # @return [Integer]
    def token_eot; end
  end

  # Class for model parameters.
  class ModelParams
    # Sets the number of layers to stor in VRAM.
    # @param n_gpu_layers [Integer]
    def n_gpu_layers=(n_gpu_layers); end

    # Returns the number of layers to stor in VRAM.
    # @return [Integer]
    def n_gpu_layers; end

    # Sets the GPU that is used.
    # @param main_gpu [Integer]
    def main_gpu=(main_gpu); end

    # Returns the GPU that is used.
    # @return [Integer]
    def main_gpu; end

    # Returns the how layers are split across multi-GPUs.
    # @return [Array<Float>]
    def tensor_split; end

    # Sets the flag to load only vocabulary.
    # @param flag [Boolean]
    def vocab_only=(flag); end

    # Returns the flag to load only vocabulary.
    # @return [Boolean]
    def vocab_only; end

    # Sets the flag to use mmap.
    # @param flag [Boolean]
    def use_mmap=(flag); end

    # Returns the flag to use mmap.
    # @return [Boolean]
    def use_mmap; end

    # Sets the flag to force system to keep model in memory.
    # @param flag [Boolean]
    def use_mlock=(flag); end

    # Returns the flag to force system to keep model in memory.
    # @return [Boolean]
    def use_mlock; end
  end

  # Class for batch
  class Batch
    # Create batch.
    #
    # @param n_tokens [Integer] The number of tokens.
    # @param embd [Array<Float>] The number of embedding.
    # @param n_seq_max [Integer] The maximum number of sequence ids.
    def initialize(n_tokens:, embd:, n_seq_max:); end

    # Sets the number of tokens.
    # @param n_tokens [Integer]
    # @return [Integer]
    def n_tokens=(n_tokens); end

    # Returns the number of tokens.
    # @return [Integer]
    def n_tokens; end

    # Sets the all_pos_0 of llama_batch.
    # @param all_pos_zero [Integer]
    # @return [Integer]
    def all_pos_zero=(all_pos_zero); end

    # Returns the all_pos_0 of llama_batch.
    # @return [Integer]
    def all_pos_zero; end

    # Sets the all_pos_1 of llama_batch.
    # @param all_pos_one [Integer]
    # @return [Integer]
    def all_pos_one=(all_pos_one); end

    # Returns the all_pos_1 of llama_batch.
    # @return [Integer]
    def all_pos_one; end

    # Sets the all_seq_id of llama_batch.
    # @param all_seq_id [Integer]
    # @return [Integer]
    def all_seq_id=(all_seq_id); end

    # Returns the all_seq_id of llama_batch.
    # @return [Integer]
    def all_seq_id; end

    # Sets the token element.
    # @param id [Integer] The id of token array.
    # @param value [Integer] The value of token.
    # @return [Integer]
    def set_token(id, value); end

    # Returns the token element.
    # @param id [Integer] The id of token array.
    # @return [Integer]
    def get_token(id); end

    # Sets the pos element.
    # @param id [Integer] The id of pos array.
    # @param value [Integer] The value of pos.
    # @return [Integer]
    def set_pos(id, value); end

    # Returns the pos element.
    # @param id [Integer] The id of pos array.
    def get_pos(id); end

    # Sets the seq_id element.
    # @param i [Integer] The row id of seq_id array.
    # @param j [Integer] The column id of seq_id array.
    # @param value [Integer] The value of seq_id.
    # @return [Integer]
    def set_seq_id(i, j, value); end

    # Returns the seq_id element.
    # @param i [Integer] The row id of seq_id array.
    # @param j [Integer] The column id of seq_id array.
    # @return [Integer]
    def get_seq_id(i, j); end

    # Sets the logits element.
    # @param id [Integer] The id of logits array.
    # @param value [Boolean] The value of logits.
    # @return [Boolean]
    def set_logits(id, value); end

    # Returns the logits element.
    # @param id [Integer] The id of logits array.
    # @return [Boolean]
    def get_logits(id); end
  end

  # Class for context
  class Context
    # Returns the model.
    # @return [Model]
    attr_reader :model

    # Create context.
    #
    # @param model [Model] The model.
    # @param params [ContextParams] The parameters for context.
    def initialize(model:, params:); end

    # Evaluates the tokens.
    #
    # @param tokens [Array<Integer>] The tokens to be evaluated.
    # @param n_past [Integer] The number of past tokens.
    # @param n_tokens [Integer] The number of tokens to be evaluated.
    # @return [NilClass]
    def eval(tokens:, n_past:, n_tokens: nil); end

    # Evaluates the embedding.
    #
    # @param embd [Array<Float>] The embedding to be evaluated.
    # @param n_past [Integer] The number of past tokens.
    # @param n_tokens [Integer] The number of tokens to be evaluated.
    # @return [NilClass]
    def eval_embd(embd:, n_past:, n_tokens: nil); end

    # Evaluates the tokens.
    #
    # @param batch [Batch] The batch.
    # @return [NilClass]
    def decode(batch); end

    # Returns the embeddings.
    #
    # @return [Array<Float>]
    def embeddings; end

    # Returns the number of text context.
    #
    # @return [Integer]
    def n_ctx; end

    # Returns the timing information
    #
    # @return [Timings]
    def timings; end

    # Prints timings.
    #
    # @return [NilClass]
    def print_timings; end

    # Resets timings.
    #
    # @return [NilClass]
    def reset_timings; end

    # Returns the number of tokens in the kv cache.
    #
    # @return [Integer]
    def kv_cache_token_count; end

    # Clear the KV cache.
    #
    # @return [NilClass]
    def kv_cache_clear(); end

    # Removes all tokens that belong to the specified sequence and have positions in [p0, p1).
    #
    # @param seq_id [Integer] The sequence id.
    # @param p0 [Integer] The start position.
    # @param p1 [Integer] The end position.
    # @return [NilClass]
    def kv_cache_seq_rm(seq_id, p0, p1); end

    # Copies all tokens that belong to the specified sequnce to another sequence.
    #
    # @param seq_id_src [Integer] The source sequence id.
    # @param seq_id_dst [Integer] The destination sequence id.
    # @param p0 [Integer] The start position.
    # @param p1 [Integer] The end position.
    # @return [NilClass]
    def kv_cache_seq_cp(seq_id_src, seq_id_dst, p0, p1); end

    def kv_cache_seq_keep(seq_id); end

    # Adds relative position "delta" to all tokens that belong to the specified sequence and have positions in [p0, p1)
    #
    # @param seq_id [Integer] The sequence id.
    # @param p0 [Integer] The start position.
    # @param p1 [Integer] The end position.
    # @param delta [Integer] The relative position.
    # @return [NilClass]
    def kv_cache_seq_shift(seq_id, p0, p1, delta); end

    # Sets the current rng seed.
    #
    # @param seed [Integer] The rng seed.
    def set_rng_seed(seed); end # rubocop:disable Naming/AccessorMethodName

    # Loads session file.
    #
    # @param session_path [String] The path to the session file.
    # @return [Array<Integer>]
    def load_session_file(session_path:); end

    # Saves session file.
    #
    # @param session_path [String] The path to the session file.
    # @param session_tokens [Array<Integer>] The session tokens.
    # @return [Nil]
    def save_session_file(session_path:, session_tokens:); end

    # Sampling with repetition penalty.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param last_n_tokens [Array<Integer>] The last n tokens.
    # @param penalty_repeat [Float] The penalty for repetition.
    # @param penalty_freq [Float] The penalty for frequency.
    # @param penalty_present [Float] The penalty for presence.
    # @return [Nil]
    def sample_repetition_penalties(candidates, last_n_tokens, penalty_repeat:, penalty_freq:, penalty_present:); end

    # Samplling with classifier-free guidance.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param guidance [Context] The separate context from the same model.
    # @param scale [Float] The guidance strength.
    # @return [Nil]
    def sample_classifier_free_guidance(candidates, guidance:, scale:); end

    # Sorts candates by their probablities with logits.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @return [Nil]
    def sample_softmax(candidates); end

    # Top-K sampling.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param k [Integer] The top-k.
    # @param min_keep [Integer] The minimum number of tokens to keep.
    # @return [Nil]
    def sample_top_k(candidates, k:, min_keep: 1); end

    # Nucleus sampling.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param prob [Float] The probability.
    # @param min_keep [Integer] The minimum number of tokens to keep.
    # @return [Nil]
    def sample_top_p(candidates, prob:, min_keep: 1); end

    # Minimum p sampling.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param prob [Float] The probability.
    # @param min_keep [Integer] The minimum number of tokens to keep.
    # @return [Nil]
    def sample_min_p(candidates, prob:, min_keep: 1); end

    # Tail free samplling.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param z [Float] The tail free sampling parameter.
    # @param min_keep [Integer] The minimum number of tokens to keep.
    # @return [Nil]
    def sample_tail_free(candidates, z:, min_keep: 1); end

    # Typical samplling.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param prob [Float] The probability.
    # @param min_keep [Integer] The minimum number of tokens to keep.
    # @return [Nil]
    def sample_typical(candidates, prob:, min_keep: 1); end

    # Samples temeperature.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param temperature [Float] The temperature.
    # @return [Nil]
    def sample_temperature(candidates, temperature:); end

    # Samples temeperature.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param temp [Float] The temperature.
    # @return [Nil]
    def sample_temp(candidates, temp:); end

    # Returns the token with Mirostat 1.0 algorithm.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param tau [Float] The target cross-entropy value.
    # @param eta [Float] The learning rate.
    # @param m [Float] The number of tokens considered in the estimation of `s_hat`.
    # @param mu [Float] The maximum cross-entropy.
    # @return [Array<Integer, Float>] The array of token id and updated mu.
    def sample_token_mirostat(candidates, tau:, eta:, m:, mu:); end

    # Returns the token with Mirostat 2.0 algorithm.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param tau [Float] The target cross-entropy value.
    # @param eta [Float] The learning rate.
    # @param mu [Float] The maximum cross-entropy.
    # @return [Array<Integer, Float>] The array of token id and updated mu.
    def sample_token_mirostat_v2(candidates, tau:, eta:, mu:); end

    # Returns the selected token with the highest probability.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @return [Integer]
    def sample_token_greedy(candidates); end

    # Returns the randomly selected token from the candidates based on their probabilities.
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @return [Integer]
    def sample_token(candidates); end

    # Applies constraints from grammar
    #
    # @param candidates [TokenDataArray] The array of token data.
    # @param grammar [Grammar] The grammar.
    # @return [Nil]
    def sample_grammar(candidates, grammar:); end

    # Accepts the sampled token into the grammar
    #
    # @param grammar [Grammar] The grammar.
    # @param token [Integer] The token.
    # @return [Nil]
    def grammar_accept_token(grammar:, token:); end
  end

  # Class for timings
  class Timings
    # Returns the time to start.
    # @return [Float]
    def t_start_ms; end

    # Returns the time to end.
    # @return [Float]
    def t_end_ms; end

    # Returns the time to load model.
    # @return [Float]
    def t_load_ms; end

    # Returns the sampling time.
    # @return [Float]
    def t_sample_ms; end

    # Returns the time to evaluate prompt.
    # @return [Float]
    def t_p_eval_ms; end

    # Returns the time to evaluate.
    # @return [Float]
    def t_eval_ms; end

    # Returns the number of samples.
    # @return [Integer]
    def n_sample; end

    # Returns the number of prompt evaluations.
    # @return [Integer]
    def n_p_eval; end

    # Returns the number of evaluations.
    # @return [Integer]
    def n_eval; end
  end

  # Class for parameters
  class ContextParams
    # Sets the random seed.
    # @param seed [Integer]
    def seed=(seed); end

    # Return the random seed.
    # @return [Integer]
    def seed; end

    # Sets the number of text context
    # @param n_ctx [Integer]
    def n_ctx=(n_ctx); end

    # Returns the number of text context
    # @return [Integer]
    def n_ctx; end

    # Sets the batch size of prompt processing.
    # @param n_batch [Integer]
    def n_batch=(n_batch); end

    # Returns the batch size of prompt processing.
    # @return [Integer]
    def n_batch; end

    # Sets the RoPE scaling type.
    # @param scaling_type [Integer]
    def rope_scaling_type=(scaling_type); end

    # Returns the RoPE scaling type.
    # @return [Integer]
    def rope_scaling_type; end

    # Sets the RoPE base frequency.
    # @param rope_freq_base [Float]
    def rope_freq_base=(rope_freq_base); end

    # Returns the RoPE base frequency.
    # @return [Float]
    def rope_freq_base; end

    # Sets the RoPE frequency scaling factor.
    # @param rope_freq_scale [Float]
    def rope_freq_scale=(rope_freq_scale); end

    # Returns the RoPE frequency scaling factor.
    # @return [Float]
    def rope_freq_scale; end

    # Sets the YaRN extrapolation mix factor.
    # @param yarn_ext_factor [Float]
    def yarn_ext_factor=(yarn_ext_factor); end

    # Returns the YaRN extrapolation mix factor.
    # @return [Float]
    def yarn_ext_factor; end

    # Sets the YaRN magnitude scaling factor.
    # @param yarn_attn_factor [Float]
    def yarn_attn_factor=(yarn_attn_factor); end

    # Returns the YaRN magnitude scaling factor.
    # @return [Float]
    def yarn_attn_factor; end

    # Sets the YaRN low correction dim.
    # @param yarn_beta_fast [Float]
    def yarn_beta_fast=(yarn_beta_fast); end

    # Returns the YaRN low correction dim.
    # @return [Float]
    def yarn_beta_fast; end

    # Sets the YaRN high correction dim.
    # @param yarn_beta_slow [Float]
    def yarn_beta_slow=(yarn_beta_slow); end

    # Returns the YaRN high correction dim.
    # @return [Float]
    def yarn_beta_slow; end

    # Sets the YaRN original context size.
    # @param yarn_orig_ctx [Integer]
    def yarn_orig_ctx=(yarn_orig_ctx); end

    # Returns the YaRN original context size.
    # @return [Integer]
    def yarn_orig_ctx; end

    # Sets the flag to use experimental mul_mat_q kernels.
    # @param flag [Boolean]
    # @deprecated always true
    def mul_mat_q=(flag); end

    # Returns the flag to use experimental mul_mat_q kernels.
    # @return [Boolean]
    # @deprecated always true
    def mul_mat_q; end

    # Sets the flag for using fp16 for KV cache.
    # @param flag [Boolean]
    def f16_kev=(flag); end

    # Returns the flag for using fp16 for KV cache.
    # @return [Boolean]
    def f16_kev; end

    # Sets the flag to compute all logits.
    # @param flag [Boolean]
    def logits_all=(flag); end

    # Returns the flag to compute all logits.
    # @return [Boolean]
    def logits_all; end

    # Sets the flag for embedding mode only.
    # @param flag [Boolean]
    def embedding=(flag); end

    # Returns the flag for embedding mode only.
    # @return [Boolean]
    def embedding; end
  end

  # Class for quantization parameters
  class ModelQuantizeParams
    # Sets the number of threads.
    # @param n_thread [Intger]
    def n_thread=(n_thread); end

    # Returns the number of threads.
    # @return [Integer]
    def n_thread; end

    # Sets the file type of quantized model.
    # @param ftype [Integer]
    def ftype=(ftype); end

    # Returns the file type of quantized model.
    # @return [Integer]
    def ftype; end

    # Sets the flag to allow quantizing non-f32/f16 tensors.
    # @param flag [Boolean]
    def allow_quantization=(flag); end

    # Returns the flag to allow quantizing non-f32/f16 tensors.
    # @return [Boolean]
    def allow_quantization; end

    # Sets the flag to quantize output.weight.
    # @param flag [Boolean]
    def quantize_output_tensor=(flag); end

    # Returns the flag to quantize output.weight.
    # @return [Boolean]
    def quantize_output_tensor; end

    # Sets the flag to only copy tensors.
    # @param flag [Boolean]
    def only_copy=(flag); end

    # Returns the flag to only copy tensors.
    # @return [Boolean]
    def only_copy; end

    # Sets the flag to disable k-quant mixtures and quantize all tensors to the same type.
    # @param flag [Boolean]
    def prue=(flag); end

    # Returns the flag to disable k-quant mixtures and quantize all tensors to the same type.
    # @return [Boolean]
    def pure; end
  end

  # Class for grammar element.
  class GrammarElement
    # Creates a new GrammarElement.
    # @param type [Integer] The grammar element type.
    # @param value [Integer] The unicode value or rule id.
    def initialize(type: 0, value: 0); end

    # Sets the grammar element type.
    # @param type [Integer]
    def type=(type); end

    # Returns the grammar element type.
    # @return [Integer]
    def type; end

    # Sets the unicode value or rule id.
    # @param type [Integer]
    def value=(type); end

    # Returns the unicode value or rule id.
    # @return [Integer]
    def value; end
  end

  # Class for grammar.
  class Grammar
    # Creates a new Grammar.
    # @param rules [Array<Array<GrammarElement>>] The grammar rules.
    # @param start_rule_index [Integer] The index of the start rule.
    def initialize(rules:, start_rule_index:); end # rubocop:disable Style/RedundantInitialize
  end
end
