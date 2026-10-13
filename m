Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524B9CC6B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 16:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vaTcdVbbs/DXkLOQru2uG/ZsIdHaMLbqb4FWGQGZdGo=; b=W/6useCr3E2rnx
	/d55mTkrmtMXEZTIrQsYICM7dL3+/gUSGTgPBFfL9WShlT71Ijn9+IzPupBdaBQoi2TqA4N8hG8V8
	9Zc8pZdj5KAQmL9qsdJLXsCYIIAK4O24+NqNmXdFZS1h2gFzdNNzzAw9S/f+zZl6mEVF4VOam/at6
	qEJT5R8OLuJLeQyzXOurbo2QIDg4I66HnEnpx7VG7gCjBJhDhcmumsxM26YuH3Um1auz7bgDvwWWS
	YOlUKkS4Pzj2Zj3Sj2hVgOUW7m9wWr7v6SOAaJ1rFVFtDoMViFImLy7F5uXfkEufnqfOrVyK9s3Ue
	q5FK1KXIGjI+AAVYZZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfom-0000000Dbsg-2uvT;
	Tue, 13 Oct 2026 16:57:36 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfoh-0000000Dbqu-3pez
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 16:57:33 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-8b0a921ee46so1314927b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 09:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791910650; x=1792515450; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xs8kx4XmYGQ3LYVznuwYx1llCxD9uoGbHIj5ZitGfaE=;
        b=X7fDdrHMPANv5Jhk9QShxp2X9+PKvjw71/eERPd4pzKiNbaDkDGzvrjdKhiZUOmdqf
         qaXZZkThKDRueBdTif7DUNcJ4XEcEN65BlyZkcFBmojdineojToB/5BT8zTIMFYPc9Y6
         l5qoG71kLB7WkQltDM6tlkml5ELstxNyiKGEch4BdIA/LlFSJf6jsQi8fj3XnEF47VDD
         DTWenDZc8mMILK4xwhUvtFBOTKGDwGL+UBxUx9QjjDO6sm0jPLU/cuNhuECWnxyMnR56
         m5s+8MoWtXEZLt2z6r7lQodpoX1uJ7+UV9c2vql01QTq7DFUGtiwotx03PAwOzQ+d5Cn
         8+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910650; x=1792515450;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xs8kx4XmYGQ3LYVznuwYx1llCxD9uoGbHIj5ZitGfaE=;
        b=WrnKo2e5kL6DKkyKr903m/jRUTC0yItF2xWW1y4E+hXB/FwVA+6U4hqYh+/UR1QbJM
         DdNPJFNCleRAnQsI929WbnKG14sDoDWssxjl6yN5JbGVCssqmHzLyji5/nfcF0wtgYLB
         jsKx6lnMwV8RBa50AELKhpIs9pkNTzonnc+UQ3PEPuWGSQQ87mh2ZFxFmc8hS5nf2M5N
         vGFLa6hBh09eemSttsnZ0p3hfeEYldfL0f0y7vxXwS4ze+EthE+mfWnzGrBVR/xtzfvc
         /MHGEoNSW7+tNFN4zvas4DPel2fbP1xt5sYtvMNrkrVMfJeR2bwGKu/TDxOMr4GXK8RA
         kECA==
X-Forwarded-Encrypted: i=1; AKwUvBw3Ubo3/SJdJzCpcFcdOTUhTV2vFX25YWiRIjci9WzzWxcRMfqdQ8ElpCFkspqYNrT6VNmywX/EAwTD1g==@lists.infradead.org
X-Gm-Message-State: AFq9FYK0QJxujH82t7ofLMj22V5SMDH1XLMQZxsrmFcyLSbDpMfV/o72
	LF31gms1b9MUx19bAE9tFrlOpgN9g+uMSTvzKbMSigoyFZZhJICfkFcjO72lJzZ3cGE=
X-Gm-Gg: AYBFou38NNwQ3Hs4u0S4YHxcffTXtgSvC2f/mgnglefMnTXORh5T40LpXF8qlSH1H2o
	lIGPTE8YiiXDsBQXuWpGzrmCer4gV7VnDcwSHb82kigcafCL9tr9esqeCvfKRt64yBO2zzfqUbz
	Jxxx/ERlY1lT1ZDzyxXF+wLfxClT4b8DqnDEsdLMrU7rxW0/8ST/D2S1zCKwHwuta9dOzRy3Euu
	SH0MmfU4L7Fu8MqAkHMFw1DDIBcfCF+FpEjH2jwIjMv5SOiFXcOBdN0KsbvTsCE/q2UZB9YwyRN
	EV4LvD1oWqByxH+zjkea3XUuN0V19da6Lt8fPpKAJ7cqmib+CbXDC3Gk6cRF+MoS1IJgC7/CLgx
	794UFvC8IYcn9crPAWaUMOrqGBeJFqvutWnxNiBalUKO1TrO0w0Y7JzB5L/0d9xoWBl8pnhq9wa
	CuziVG1CqAyUuaLPkq54dhWdpycMFpOcc8+9FkeIrLsSKMxafbpzpAxxTkZGWzU9IqVGmL2+rbq
	eEbWRzf8buUo7LHO6/W
X-Received: by 2002:a05:690c:e3ef:b0:8b0:ad16:71f8 with SMTP id 00721157ae682-8b0ad167c9dmr17620697b3.11.1791910650173;
        Tue, 13 Oct 2026 09:57:30 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:d01e:ebe9:3ad:261f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f21eccdsm47207617b3.30.2026.10.13.09.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:57:29 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:57:28 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] riscv: Deprecate vector state prctl/sysctl
Message-ID: <as5i-FZoL79anjkV@Tao-Chiu's-Mac>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261007085126.222688-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_095731_980881_2B66F01B 
X-CRM114-Status: GOOD (  28.52  )
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

On Wed, Oct 07, 2026 at 01:51:17AM -0700, Samuel Holland wrote:
> The ability to prevent userspace from executing vector instructions was
> provided as a escape hatch for software that was broken by adding vector
> state to the signal context. This appears to be unused in practice, and
> creates confusion in the extension support returned by hwprobe(), as in
> this one special case an extension reported as present by hwprobe() is
> unusable.
> 
> Since we believe it is safe to always allow vector usage, hide the prctl
> and sysctl behind a Kconfig option and mark them as deprecated, so they
> can be removed in the future. Note that significant userspace software
> like glibc already considers these controls explicitly unsupported.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
> 
>  arch/riscv/Kconfig                 | 10 ++++++++++
>  arch/riscv/include/asm/processor.h |  4 +++-
>  arch/riscv/include/asm/vector.h    | 16 ++++++++++++----
>  arch/riscv/kernel/vector.c         | 10 ++++++++++
>  4 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e26450f0d38fb..83e52a0a85ba7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -650,6 +650,16 @@ config RISCV_ISA_V
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_V_VSTATE_CTRL
> +	bool "Deprecated prctl/sysctl for disallowing userspace vector access"
> +	depends on RISCV_ISA_V
> +	help
> +	  Add prctl and sysctl interfaces to disallow userspace to execute
> +	  vector instructions. These controls are deprecated because they create
> +	  ambiguity in the ISA extension availability reported by hwprobe.
> +
> +	  If you don't know what to do here, say N.
> +
>  config RISCV_ISA_V_UCOPY_THRESHOLD
>  	int "Threshold size for vectorized user copies"
>  	depends on RISCV_ISA_V
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 815715c67f940..ad64df01417a2 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -121,7 +121,9 @@ struct thread_struct {
>  	unsigned long envcfg;
>  	unsigned long sum;
>  	u32 riscv_v_flags;
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
>  	u32 vstate_ctrl;
> +#endif
>  	struct __riscv_v_ext_state vstate;
>  	unsigned long align_ctl;
>  	struct __riscv_v_ext_state kernel_vstate;
> @@ -202,7 +204,7 @@ extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src
>  
>  extern unsigned long signal_minsigstksz __ro_after_init;
>  
> -#ifdef CONFIG_RISCV_ISA_V
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
>  /* Userspace interface for PR_RISCV_V_{SET,GET}_VS prctl()s: */
>  #define RISCV_V_SET_CONTROL(arg)	riscv_v_vstate_ctrl_set_current(arg)
>  #define RISCV_V_GET_CONTROL()		riscv_v_vstate_ctrl_get_current()

nit: consider changing the enclosing CONFIG_RISCV_ISA_V at the comment to
CONFIG_RISCV_ISA_V_VSTATE_CTRL if this needs respin.

> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index fffe72a772080..5425a25f8a196 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -404,9 +404,6 @@ static inline void __switch_to_vector(struct task_struct *prev,
>  	}
>  }
>  
> -void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
> -bool riscv_v_vstate_ctrl_user_allowed(void);
> -
>  #else /* ! CONFIG_RISCV_ISA_V  */
>  
>  struct pt_regs;
> @@ -418,7 +415,6 @@ static __always_inline bool has_xtheadvector_no_alternatives(void) { return fals
>  static __always_inline bool has_xtheadvector(void) { return false; }
>  static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
>  static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
> -static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
>  #define riscv_v_vsize (0)
>  #define riscv_v_vstate_discard(regs)		do {} while (0)
>  #define riscv_v_vstate_save(vstate, regs)	do {} while (0)
> @@ -435,6 +431,18 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
>  
>  #endif /* CONFIG_RISCV_ISA_V */
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
> +
> +void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
> +bool riscv_v_vstate_ctrl_user_allowed(void);
> +
> +#else
> +
> +static inline void riscv_v_vstate_ctrl_init(struct task_struct *tsk) {}
> +static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return true; }
> +
> +#endif /* CONFIG_RISCV_ISA_V_VSTATE_CTRL */
> +
>  /*
>   * Return the implementation's vlen value.
>   *
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 9641343732782..b35d11ff3cc89 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -20,7 +20,9 @@
>  #include <asm/ptrace.h>
>  #include <asm/bug.h>
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
>  static bool riscv_v_implicit_uacc = true;
> +#endif
>  static struct kmem_cache *riscv_v_user_cachep;
>  #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
>  static struct kmem_cache *riscv_v_kernel_cachep;
> @@ -144,6 +146,8 @@ void riscv_v_thread_free(struct task_struct *tsk)
>  #endif
>  }
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
> +
>  #define VSTATE_CTRL_GET_CUR(x) ((x) & PR_RISCV_V_VSTATE_CTRL_CUR_MASK)
>  #define VSTATE_CTRL_GET_NEXT(x) (((x) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK) >> 2)
>  #define VSTATE_CTRL_MAKE_NEXT(x) (((x) << 2) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK)
> @@ -182,6 +186,8 @@ bool riscv_v_vstate_ctrl_user_allowed(void)
>  }
>  EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
>  
> +#endif
> +
>  bool riscv_v_first_use_handler(struct pt_regs *regs)
>  {
>  	u32 __user *epc = (u32 __user *)regs->epc;
> @@ -227,6 +233,8 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
>  	return true;
>  }
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
> +
>  void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
>  {
>  	bool inherit;
> @@ -330,3 +338,5 @@ static int __init riscv_v_init(void)
>  	return riscv_v_sysctl_init();
>  }
>  core_initcall(riscv_v_init);
> +
> +#endif
> -- 
> 2.52.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
