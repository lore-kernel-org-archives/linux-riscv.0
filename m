Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6FAC87FC5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZf7wcQW8FL3MEdIS+RhVYtqf6qAR3bEST4BQu7t/hU=; b=3CiNVjDbtDzp8O
	trItIrdlIr0cvGohl4tfiuP7K6IPbk70UVoguY4W+OyWRBeEl9OXl6mRpb+I5Dp8bZIAsxaL+87Pv
	xzbuiKVQPKS30Mu5ESb6i0fxihF30pqEVkyaM9S1/+QzgkerX5F2WuYrEh9nUmgS5gCQ7qon1NUmJ
	wrFlHdY4vWjjtSH43pOR/hgm42epmS6jJErEUvSgNFwoi3eYgIuOu3GTXw6SWGuqWOQkE63Od3Gz4
	7PerSvMk53hZgXVxOGBG2msg6oe6DGA/igo7x1rHB3gHWoCHIvH8dlXH7YrtRrja2vUIi4NK0kaxi
	MnyNzLQXHU2ZLGCLLQeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqam-0000000HOQr-2Sif;
	Mon, 21 Jul 2025 13:30:08 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpOy-0000000HED0-1lmo
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 12:13:53 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7e278d8345aso415779385a.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Jul 2025 05:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bluespec-com.20230601.gappssmtp.com; s=20230601; t=1753100031; x=1753704831; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hypDpQARvVvKtBpFWgi9odwWzFEdtItD8EptB9ZSvjY=;
        b=PQS3lKV3LEnu7+D/d+tgPwqqKhsJ9x/CyIDVfys90sOIRRw60kx7qcgDyubNtEBHMj
         Nw84dD+VIGSuYd7n5RY45RwBz9VAQyv26suTnXDsLtGLTaP4WN8Bj1najqOOfg3DPzkZ
         KG9F4Bss7o0cIX2GIWJWV6VDLNmswn2ZOaSTPNpvaYlJjV/9+M3/wBVer+LZyJlq3d73
         Udc5AOhrxSR2l/+OLxRQHjVwhwSvq32J1QnDkgwC9iG3DMuyE59eVG6ABEPWXNPIZOgv
         ifY/Oz09Jwc+Y+RrTEdeXRaP9wpzGs2WC0zMaqsc++95HSi/Cu7oBnupQnNvJC7H/Clk
         9W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753100031; x=1753704831;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hypDpQARvVvKtBpFWgi9odwWzFEdtItD8EptB9ZSvjY=;
        b=jfr+03L6ULlQwf9ft9408sCmQPbuhPEa23rdHnV6iKlrsQIWKwXTCChQRilVq/eCr5
         IuWTCSei7lAs8sbU/wtUO3cVlGlY50gOQRirUmJAbacyH2QmOOS8riw2yDa+wVgGWrG4
         FyT7op7XVbzUol34ygXG+1jdEI1gLO1WyQr7qDFKNBD37LwYVpJGunWrg3cfxr2UPD6l
         NvGv4JbyMQ1b2HHK7HU/cDtZsfRBpcw62W5GCL1R7mhovVeNuyVqcylZAeEqtoeFlkfb
         9ErdOZZDHTC1qZ4q9221RkIfzornbhxbGd/TRWNlF0I6nflTWNuwMiL1ElOn8Gw07Fp/
         HgwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp3e3qHGp4jwoDkFVMR3jqglvCReI10iHg/KVHMiJo7NXRJhts+F9kWdikkqA9CTzteN173vPzpyDS0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI/IPCy45jiLK15JwqOemcxExlv+XPXcvELBce8GyXwMzDOjH5
	wkCoCjuVlSBioRgA4szcu2HXxzq0r8moaRng0jT714I03MR4vZG7TWo5eWonOFEp
X-Gm-Gg: ASbGncvsbrAhb4CEXKDaAFCBFGSP2VvdF8UUIe5OLn8kg9dOuhaVYD7+8Se4SW+k4Zm
	Et9tOqx8pwgS5qcFLYErgDyw9tQcx+eu3TaT6Ey3PcwLomyIDPI6cZM+HAVNdpi9d2vPeqj35YJ
	m61ClW7q4qaEc0AfdOFNzm44oV5R9PoYgLfLDhMKGLCSnYVKQjLgY1UVhQXRa11CUTrBLXuHoje
	A0iP9IPzSbA58i7Oak0iw7u7y1In1hIDy/WEbjjMpDtAuMFqB/XBxrLJtfP93UjwtI33dflfv0n
	k7ChRvt3gNyTkM597JtU5NwgiOU2PHk2dbp5kZoicTR5bjLNHfCSQgpNe2cDDhDPrV94cWpw2kT
	EI6kJifmTFPfg/hWrJ7kQN+Afab6OKks=
X-Google-Smtp-Source: AGHT+IHp24iuvVBqyc5MF9K9vhTLFKl/PRULp6clUv25e6wBKwFRcFYT3yg8TpvCYvSSBwyJ/XQdcw==
X-Received: by 2002:a05:620a:2b8b:b0:7e3:51f5:b4d with SMTP id af79cd13be357-7e351f50ba8mr1759891885a.32.1753100030714;
        Mon, 21 Jul 2025 05:13:50 -0700 (PDT)
Received: from localhost.localdomain ([37.19.220.47])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356c6403csm418579985a.82.2025.07.21.05.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:13:50 -0700 (PDT)
Date: Mon, 21 Jul 2025 08:13:48 -0400
From: Darius Rad <darius@bluespec.com>
To: Drew Fustini <fustini@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
Message-ID: <aH4u_OHqZHZtXjn3@localhost.localdomain>
Mail-Followup-To: Drew Fustini <fustini@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250719033912.1313955-1-fustini@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250719033912.1313955-1-fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_051352_708335_C98DE16D 
X-CRM114-Status: GOOD (  39.58  )
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

On Fri, Jul 18, 2025 at 08:39:13PM -0700, Drew Fustini wrote:
> From: Drew Fustini <dfustini@tenstorrent.com>
> 
> Clobbering the vector registers can significantly increase system call
> latency for some implementations. To mitigate this performance impact, a
> policy mechanism is provided to administrators, distro maintainers, and
> developers to control vector state discard in the form of a sysctl knob:
> 
> /proc/sys/abi/riscv_v_vstate_discard
> 
> Valid values are:
> 
> 0: Do not discard vector state during syscall
> 1: Discard vector state during syscall
> 

Is the intention for this this mean "don't guarantee vector state is
clobbered" or "preserve vector state"?  I suspect it is the former, but the
wording seems unclear.  Additionally, if that's indeed the case, maybe the
documentation should more clearly articulate the tradeoff (performance vs.
security/robustness).

> The initial state is controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
> 
> Fixes: 9657e9b7d253 ("riscv: Discard vector state on syscalls")
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  Documentation/arch/riscv/vector.rst | 15 +++++++++++++++
>  arch/riscv/Kconfig                  | 10 ++++++++++
>  arch/riscv/include/asm/vector.h     |  4 ++++
>  arch/riscv/kernel/vector.c          | 16 +++++++++++++++-
>  4 files changed, 44 insertions(+), 1 deletion(-)
> 
> I've tested the impact of riscv_v_vstate_discard() on the SiFive X280
> cores [1] in the Tenstorrent Blackhole SoC [2]. The results from the
> Blackhole P100 [3] card show that discarding the vector registers
> increases null syscall latency by 25%.
> 
> The null syscall program [4] executes vsetvli and then calls getppid()
> in a loop. The average duration of getppid() is 198 ns when registers
> are clobbered in riscv_v_vstate_discard(). The average duration drops
> to 149 ns when riscv_v_vstate_discard() skips clobbering the registers
> as result of riscv_v_vstate_discard being set to 0.
> 
> $ sudo sysctl abi.riscv_v_vstate_discard=1
> abi.riscv_v_vstate_discard = 1
> 
> $ ./null_syscall --vsetvli
> vsetvli complete
>  iterations: 1000000000
>    duration: 198 seconds
> avg latency: 198.73 ns
> 
> $ sudo sysctl abi.riscv_v_vstate_discard=0
> abi.riscv_v_vstate_discard = 0
> 
> $ ./null_syscall --vsetvli
> vsetvli complete
>  iterations: 1000000000
>    duration: 149 seconds
> avg latency: 149.89 ns
> 
> I'm testing on the tt-blackhole-v6.16-rc1_vstate_discard [5] branch that
> has 13 patches, including this one, on top of v6.16-rc1. Most are simple
> yaml patches for dt bindings along with dts files and a bespoke network
> driver. I don't think the other patches are relevant to this discussion.
> 
> This patch applies clean on its own to riscv/for-next and next-20250718.
> 
> [1] https://www.sifive.com/cores/intelligence-x200-series
> [2] https://tenstorrent.com/en/hardware/blackhole
> [3] https://github.com/tenstorrent/tt-bh-linux
> [4] https://gist.github.com/tt-fustini/ab9b217756912ce75522b3cce11d0d58
> [5] https://github.com/tenstorrent/linux/tree/tt-blackhole-v6.16-rc1_vstate_discard
> 
> diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
> index 3987f5f76a9d..1edbce436015 100644
> --- a/Documentation/arch/riscv/vector.rst
> +++ b/Documentation/arch/riscv/vector.rst
> @@ -137,4 +137,19 @@ processes in form of sysctl knob:
>  As indicated by version 1.0 of the V extension [1], vector registers are
>  clobbered by system calls.
>  
> +Clobbering the vector registers can significantly increase system call latency
> +for some implementations. To mitigate the performance impact, a policy mechanism
> +is provided to the administrators, distro maintainers, and developers to control
> +the vstate discard in the form of a sysctl knob:
> +
> +* /proc/sys/abi/riscv_v_vstate_discard
> +
> +    Valid values are:
> +
> +    * 0: Do not discard vector state during syscall
> +    * 1: Discard vector state during syscall
> +
> +    Reading this file returns the current discard behavior. The initial state is
> +    controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
> +
>  1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0aeee50da016..c0039f21d1f0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -655,6 +655,16 @@ config RISCV_ISA_V_DEFAULT_ENABLE
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_V_VSTATE_DISCARD
> +	bool "Enable Vector state discard by default"
> +	depends on RISCV_ISA_V
> +	default n
> +	help
> +	  Say Y here if you want to enable Vector state discard on syscall.
> +	  Otherwise, userspace has to enable it via the sysctl interface.
> +
> +	  If you don't know what to do here, say N.
> +
>  config RISCV_ISA_V_UCOPY_THRESHOLD
>  	int "Threshold size for vectorized user copies"
>  	depends on RISCV_ISA_V
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 45c9b426fcc5..77991013216b 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -40,6 +40,7 @@
>  	_res;								\
>  })
>  
> +extern bool riscv_v_vstate_discard_ctl;
>  extern unsigned long riscv_v_vsize;
>  int riscv_v_setup_vsize(void);
>  bool insn_is_vector(u32 insn_buf);
> @@ -270,6 +271,9 @@ static inline void __riscv_v_vstate_discard(void)
>  {
>  	unsigned long vl, vtype_inval = 1UL << (BITS_PER_LONG - 1);
>  
> +	if (READ_ONCE(riscv_v_vstate_discard_ctl) == 0)
> +		return;
> +
>  	riscv_v_enable();
>  	if (has_xtheadvector())
>  		asm volatile (THEAD_VSETVLI_T4X0E8M8D1 : : : "t4");
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 184f780c932d..7a4c209ad337 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -26,6 +26,7 @@ static struct kmem_cache *riscv_v_user_cachep;
>  static struct kmem_cache *riscv_v_kernel_cachep;
>  #endif
>  
> +bool riscv_v_vstate_discard_ctl = IS_ENABLED(CONFIG_RISCV_ISA_V_VSTATE_DISCARD);
>  unsigned long riscv_v_vsize __read_mostly;
>  EXPORT_SYMBOL_GPL(riscv_v_vsize);
>  
> @@ -307,11 +308,24 @@ static const struct ctl_table riscv_v_default_vstate_table[] = {
>  	},
>  };
>  
> +static const struct ctl_table riscv_v_vstate_discard_table[] = {
> +	{
> +		.procname       = "riscv_v_vstate_discard",
> +		.data           = &riscv_v_vstate_discard_ctl,
> +		.maxlen         = sizeof(riscv_v_vstate_discard_ctl),
> +		.mode           = 0644,
> +		.proc_handler   = proc_dobool,
> +	},
> +};
> +
>  static int __init riscv_v_sysctl_init(void)
>  {
> -	if (has_vector() || has_xtheadvector())
> +	if (has_vector() || has_xtheadvector()) {
>  		if (!register_sysctl("abi", riscv_v_default_vstate_table))
>  			return -EINVAL;
> +		if (!register_sysctl("abi", riscv_v_vstate_discard_table))
> +			return -EINVAL;
> +	}
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
