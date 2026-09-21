Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D00C982ED
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wt3jbKFpz1pj4AkGPyW5gMAd/eIAY19UqD1VLBbtqwU=; b=Vw6ofF4uA158ug
	DOFEWb0/u/SJuCXioBBS7G0QwglVHvoTkkRPpk8ExkjfahAAd7o+BhI2Hj+0wbYdKxAFn4oSCHvfx
	okD6ZOAgA1XMtLR7NECd2m9OcNrwUI3qEcWBFEQGCqqz/7YHLXzy+6I8ezk5wfdJeZWZ1bKBRRkvF
	hcOaRntSSilC1CTvsan9O8lNxklKjbFArFr8OS3MF2M5klk2AKvXpujkRjXpBJnRgq1PyxBm+4jmc
	XvpdPVNmFZWDey9PKzrhopqtyhUzN//T5BJmhHnKnIX2Q3tAtXG6/G3c79lw8Y6qdRIsG67P3cda9
	IQG1SQZGqtgf0eg7Qr/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d39-000000022vv-0Z02;
	Mon, 21 Sep 2026 12:23:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d37-000000022vN-0Gbg;
	Mon, 21 Sep 2026 12:23:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14F26600C8;
	Mon, 21 Sep 2026 12:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06F31F00898;
	Mon, 21 Sep 2026 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789993386;
	bh=hprppKHCfx956tGWLLpTJh/cnENHJFIjsCE8h2soIgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WzRQwlc+/TdVeTWsxmpuRnDm0LcNh/rY1+nPr9NNpc0iYbwMQZlTcWErUGCehKwbc
	 RugJpaMhXBKhCUJOZ184DPl/Q9d1rgVLTngcP7T71b0IWw4WBo+MGaICBsGU5h0Rr6
	 7jeHPexgEWPc8WHKS6LvH8zg92McQxWx3D5WKEH3RCyBotBB4b/rNG4yx5xogbMc7/
	 8353ajU/3TnQopexLFgwmPiUEtfuP/ElhBxAKFslso4PTsHR1WUuIwsLecNLqNZ/dW
	 RMS2JhUOQK9v0MQiEBG5hFkFniGtyYvuXGglTdXlfvk6zwSSB317V9JMDAdnuJQURG
	 xL4vqz4CtIQDA==
Date: Mon, 21 Sep 2026 13:22:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v3 14/20] kbuild: batch module finalisation
Message-ID: <arEhI9mP0S6L6JV7@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-14-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-14-9ecf4163ff36@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

+cc Petr

FYI that were some discussion on this in the v2 thread at [0], which will result
in some changes for v4.

[0]:https://lore.kernel.org/all/arEZrFmXeCO4hZpP@gremlin

On Thu, Sep 17, 2026 at 05:06:24PM +0100, Lorenzo Stoakes (ARM) wrote:
> With the .mod.S change in place, module finalisation on allmodconfig builds
> consists of a large number of very short-lived jobs.
>
> For allmodconfig x86-64 this can be on the order of ~22,000 jobs of a few
> milliseconds in duration each.
>
> Each job entails processing ~22k .cmd files, so the combination of heavy
> overhead and small individual job results in a lot of unnecessary and
> repeated work even with all cores being utilised.
>
> The solution is to batch by a number of jobs. Determining which value makes
> sense was done empirically.
>
> On a 128-thread threadripper box doing an allmodconfig build, best of
> 2, *.ko, *.mod.o deleted each time:
>
>     modules per chunk    instances    wall
>     -----------------    ---------    ------
>                     1        11171    10.22s
>                     2         5586     6.72s
>                     4         2793     4.97s
>                     8         1397     4.26s
>                    16          699     4.05s
>                    32          350     4.05s
>                    64          175     4.07s
>                   128           88     4.05s
>                   256           44     4.03s
>                   512           22     4.18s
>
> Wall time flattens for 16-256 module batches.
>
> A slower/lower core machine will do better with fewer modules-per-batch, a
> faster/higher core machine will do better with more modules-per-batch.
>
> Therefore, take the midpoint which works in the most margin in either
> direction - 128 modules per batch.
>
> This naturally scales with module count too as the optimum gains are
> obtained with higher module count, so fewer batches in this case costs less
> overhead.
>
> Each instance holds only its own modules' variables and the top-level one
> reads no per-module .cmd files at all, the same rules serve both levels,
> and an instance is told its chunk with modfinal-first=<index>.
>
> Only the top-level instance builds .module-common.o, to the chunks it is a
> plain prerequisite, so no two instances ever write it.
>
> "make modules" with every *.mod.o and *.ko deleted goes from 28.9s to 15.9s
> with clang 22. No-op "make modules" goes from 5.6s to 4.8s, as checking the
> 22,000 targets is spread over the chunks too.
>
> Whole build, 128-thread Threadripper 9980X, best of N runs:
>
>                                          before   after     delta
>                                          -------------------------------
>   x86 allmodconfig, no-op make, gcc         2.3s     1.4s    -0.85s (-38%)
>   x86 allmodconfig, no-op make, clang       2.8s     1.8s    -0.94s (-34%)
>   x86 allmodconfig, clean, gcc            306.6s   294.1s     -12.6s (-4%)
>   x86 allmodconfig, clean, clang          290.2s   283.9s     -6.4s (-2%)
>
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  scripts/Makefile.modfinal | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 75e9effdf02c..4d5e6e1a0ff9 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -13,9 +13,30 @@ include $(srctree)/scripts/Makefile.lib
>  # find all modules listed in modules.order
>  modules := $(call read-file, modules.order)
>
> +modfinal-chunk-size := 128
> +
> +ifdef modfinal-first
> +
> +# this instance handles the chunk of modules.order starting at $(modfinal-first)
> +modules := $(wordlist $(modfinal-first), $(words $(modules)), $(modules))
> +modules := $(wordlist 1, $(modfinal-chunk-size), $(modules))
> +
>  __modfinal: $(modules:%.o=%.ko)
>  	@:
>
> +else
> +
> +modfinal-chunks := $(addprefix chunk-, $(shell seq 1 $(modfinal-chunk-size) $(words $(modules))))
> +
> +PHONY += $(modfinal-chunks)
> +$(modfinal-chunks): .module-common.o
> +	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal modfinal-first=$(@:chunk-%=%)
> +
> +__modfinal: $(modfinal-chunks)
> +	@:
> +
> +endif
> +
>  # modname and part-of-module are set to make c_flags define proper module flags
>  modname = $(notdir $(@:.mod.o=))
>  part-of-module = y
> @@ -29,8 +50,11 @@ quiet_cmd_as_mod_o = AS [M]  $@
>  %.mod.o: %.mod.S FORCE
>  	$(call if_changed,as_mod_o)
>
> +# Built by the top-level instance alone, the chunks take it as a plain file.
> +ifndef modfinal-first
>  .module-common.o: $(srctree)/scripts/module-common.c FORCE
>  	$(call if_changed_rule,cc_o_c)
> +endif
>
>  ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),)
>  cmd_check_tracepoint = $(objtree)/scripts/tracepoint-update --module $<;
> @@ -58,7 +82,11 @@ ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>  endif
>  	+$(call cmd,check_tracepoint)
>
> -targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) .module-common.o
> +ifdef modfinal-first
> +targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o)
> +else
> +targets += .module-common.o
> +endif
>
>  # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
>  # ---------------------------------------------------------------------------
>
> --
> 2.55.0
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
