Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6162CA0EEB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 19:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKRGrHwifGdVmAP8mev2yl5xJzicRlPrZaI/HL9CUPA=; b=2ABsLgzUrH5KIH
	RuB5gBCcwSt/h1C3JMa4zULKIUFHboqX3G01nhEASIW+l6Cxc7kur9UAfXQlzR/XMm2PzQWO7gzVO
	pRYVCaufCTrIg8nJEa7FxeVqiLni8T1PpDYIAGPKyCSbCerIN96w1VMp6N0+1bjtTsku+OUvFLJ+5
	wIYsVv4x1IiKBJtbwgjz4H9Kxef+3VFdNblKA9seWH8btB4fJhrSB6oykjQ3/rxp8E0GfGNcuO7AR
	SQNCzxof8La/VvOLPlCdAUFYTpldgOQV+M0rS6t8tiZa8hSwMsQnLtAN7vPwWyYzuuD/Fat0QeVkP
	M5Kqv7wTj8FJTlzGCjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRvI-0000000BP4t-3XZ9;
	Tue, 19 Aug 2025 19:23:08 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoPwK-0000000B58B-300y
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 17:16:06 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-74381f3a3daso2573439a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755623763; x=1756228563; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TuuWIhz3gxthyB2SlN/OhakmBPvUO7DWnkD44CfcuTk=;
        b=pJitoJrPQXzCM6aiQ7IHZ9nhPNIqR1q/iPuTz0saX+x7jz5JQT6F5yVPIlyOApgGVK
         nlPtmkeTOahVGJ5BqPx8bUCRyIxs+oPNzYsfLiK+G77cCujs3InA8hwg84L+rqR14Q9i
         s8D5aSQZHd576gCjZuKPAY932tfr9qGzzVNgMMR0DJ/wE7e+JOJnXDBgHZDHW0aJdGts
         ewGo2VaAUdNHCSGF/V6kTYzR7GZ1UpgrNhY15AhFSCG8kXSGJzT9B4SLaLmJTkxFU+n8
         SUMu8YvmAOtVyLZMxVIxerX+Uqx/Sfe745dQIoa/iaCTinJD+uS9ZHY9vRWzdaMfDvCA
         NIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755623763; x=1756228563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuuWIhz3gxthyB2SlN/OhakmBPvUO7DWnkD44CfcuTk=;
        b=ugShXs6CCAkKNpWwm3C87Rdq7P/V4iCwx7kL4YHhgKutpOj29z+KIjoN2JQkUX1oj9
         Z5RrG1fqq49VhZcA6vYSTVU8heXcZ9LRXCXfkHv++YNA9ch+znKpdRF6sHJSzihKyleY
         rQytUrFZKVr3APTUjDlinFqTpTSYBUnxlzgKikEY4BCZ6p/JD5YDTTFrFObIKoJ+9lvl
         tV2Zawy3Nb5HdikK6W0HmfN1nO+Qrnsr2oOdrERa8EZOSN+CFDpusOmpm6PrPX0FinnV
         CmcGReN39EdVsJXpZqYdsP4Ds1hw6zBILgf31VwwSXwE3yr/eypCtEtWCnGLvwnn3U3i
         Oe+A==
X-Forwarded-Encrypted: i=1; AJvYcCXF1sr4wHJyixRtYiFDpZSuwZQEEdQscLGhPp5P36mgX6dTsmHfOeogC0gILn1na614VjgGRnYAqqFNTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK1f1atcwTrXf/F33L42Olqjpp6n82r9u4ptzN/lgAl0LvfwmF
	kWEbwZOJk9VUdS7tl/xDtNDvXp/JlG+HY6S+8ohEIALLYDbodSFJznDUJIN9krF6qYo=
X-Gm-Gg: ASbGncvztM6XBGso/WGB0T60XwiS6rezQe3Haz7ho04n+OdH2JwmPkIcSAVj9IgYLzn
	HrfeS+K8IX3taPdaHAg8H28IdOReupPZveEZrVt7EkN4P8yP5BIR0KS+c2Zjr/TCdllz34gjFtb
	oy9j0i1/MKe3upU8DgN5Vz/OAStcAWIDF2PQEiCtXKfO+2+uEvMfAgpQt3bXMO8RhXxLOwATJg0
	da4tSEAFif05FYiF/ii7+ffa5hj75Tmc++PSHincnnBSqgvUQF1rNCJywdFpUd74lTrdAexw2a6
	7ekrMqAGH/gpRQHzaiSz3vevS/9z2rJ3aW8hG745I2VqlChvCiWrHb2Ja+SA5a6vbqWC8Av6Dz1
	obl3kqjKT9K47B9fjdI3PKfdi
X-Google-Smtp-Source: AGHT+IEqY5Sa4EeVRE3eUDIyfaGN2w8S8iuJbWvQsBaTQLn0TEBfS1W/KcbAkXvUZpOTzEaoHDtOXQ==
X-Received: by 2002:a05:6830:3917:b0:743:152a:114c with SMTP id 46e09a7af769-744e0a9716bmr1907472a34.13.1755623763402;
        Tue, 19 Aug 2025 10:16:03 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c947b49cesm3570660173.33.2025.08.19.10.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 10:16:02 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:16:02 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Drew Fustini <fustini@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Samuel Holland <samuel.holland@sifive.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Andy Chiu <andybnac@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Darius Rad <darius@bluespec.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Florian Weimer <fweimer@redhat.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v3] riscv: Add sysctl to control discard of vstate on
 syscall entry
Message-ID: <20250819-bb1be8c05ebdf7ea751323aa@orel>
References: <20250819-riscv_v_vstate_discard-v3-1-0af577dafdc2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250819-riscv_v_vstate_discard-v3-1-0af577dafdc2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_101604_760716_32C34566 
X-CRM114-Status: GOOD (  52.90  )
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

On Tue, Aug 19, 2025 at 02:40:21AM -0700, Drew Fustini wrote:
> From: Drew Fustini <dfustini@tenstorrent.com>
> 
> Vector registers are always clobbered in the syscall entry path to
> enforce the documented ABI that vector state is not preserved across
> syscalls. However, this operation can be slow on some RISC-V cores.
> To mitigate this performance impact, add a sysctl knob to control
> whether vector state is discarded in the syscall entry path:
> 
> /proc/sys/abi/riscv_v_vstate_discard
> 
> Valid values are:
> 
> 0: Vector state is not intentionally clobbered when entering a syscall
> 1: Vector state is always clobbered when entering a syscall
> 
> The initial state is controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.

I'm in favor of the clobbering being off by default and creating a knob
to enable it for debug purposes, but I'm not sure we need the config. I
think it's reasonable for systems that need the discard behavior to add
a sysctl toggle to their early init. The config may complicate the
documentation needed for user recommendations and potentially generate
confusion when moving from one system to another since defaults could
be flipped.

Thanks,
drew

> 
> Fixes: 9657e9b7d253 ("riscv: Discard vector state on syscalls")
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
> Changes in v3:
>  - Reword the Kconfig description to clarify that the sysctl can still
>    be changed during runtime regardless of the initial value chosen
>  - Improve the description of vstate clobbering and the sysctl in
>    section 3 of vector.rst
>  - v2: https://lore.kernel.org/linux-riscv/20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org/
> 
> Changes in v2:
>  - Reword the description of the abi.riscv_v_vstate_discard sysctl to
>    clarify that option '0' does not preserve the vector state - it just
>    means that vector state will not always be clobbered in the syscall
>    path.
>  - Add clarification suggested by Palmer in v1 to the "Vector Register
>    State Across System Calls" documentation section.
>  - v1: https://lore.kernel.org/linux-riscv/20250719033912.1313955-1-fustini@kernel.org/
> 
> Test results:
> I've tested the impact of riscv_v_vstate_discard() on the SiFive X280
> cores [1] in the Tenstorrent Blackhole SoC [2]. The results from the
> Blackhole P100 [3] card show that discarding the vector registers
> increases null syscall latency by 25%.
> 
> The null syscall program [4] executes vsetvli and then calls getppid()
> in a loop. The average duration of getppid() is 198 ns when registers
> are clobbered in riscv_v_vstate_discard(). The average duration drops
> to 149 ns when riscv_v_vstate_discard() skips clobbering the registers
> because riscv_v_vstate_discard is set to 0.
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
> This patch applies clean on its own mainline and riscv/for-next.
> 
> [1] https://www.sifive.com/cores/intelligence-x200-series
> [2] https://tenstorrent.com/en/hardware/blackhole
> [3] https://github.com/tenstorrent/tt-bh-linux
> [4] https://gist.github.com/tt-fustini/ab9b217756912ce75522b3cce11d0d58
> [5] https://github.com/tenstorrent/linux/tree/tt-blackhole-v6.16-rc1_vstate_discard
> 
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  Documentation/arch/riscv/vector.rst | 27 +++++++++++++++++++++++++--
>  arch/riscv/Kconfig                  | 20 ++++++++++++++++++++
>  arch/riscv/include/asm/vector.h     |  4 ++++
>  arch/riscv/kernel/vector.c          | 16 +++++++++++++++-
>  4 files changed, 64 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
> index 3987f5f76a9deb0824e53a72df4c3bf90ac2bee1..2a6b52990ee75a60d8ebd1b4b1292838358bc9f2 100644
> --- a/Documentation/arch/riscv/vector.rst
> +++ b/Documentation/arch/riscv/vector.rst
> @@ -134,7 +134,30 @@ processes in form of sysctl knob:
>  3.  Vector Register State Across System Calls
>  ---------------------------------------------
>  
> -As indicated by version 1.0 of the V extension [1], vector registers are
> -clobbered by system calls.
> +Linux adopts the syscall ABI proposed by version 1.0 of the V extension [1],
> +where vector registers are clobbered by system calls. Specifically:
> +
> +    Executing a system call causes all caller-saved vector registers
> +    (v0-v31, vl, vtype) and vstart to become unspecified.
> +
> +Linux clobbers the vector registers (e.g. discards vector state) on the syscall
> +entry path. This is done to identify userspace programs that mistakenly expect
> +vector registers to be preserved across syscalls. This can be helpful for
> +debugging and testing. However, clobbering vector state can negatively impact
> +performance on some RISC-V implementations, and is not strictly necessary.
> +
> +To mitigate this performance impact, a sysctl knob is provided that controls
> +whether vector state is always clobbered on syscall entry:
> +
> +* /proc/sys/abi/riscv_v_vstate_discard
> +
> +    Valid values are:
> +
> +    * 0: Vector state is not always clobbered in all syscalls
> +    * 1: Mandatory clobbering of vector state in all syscalls
> +
> +    Reading this file returns the current discard behavior. Write to '0' or '1'
> +    to file to change the current behavior. The initial state is controlled by
> +    CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
>  
>  1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 451eb23d86c96307422d95e233e35b97569e9816..c0c64d1a4dfe2b0058e3265082b6e3c5207755c7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -654,6 +654,26 @@ config RISCV_ISA_V_DEFAULT_ENABLE
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_V_VSTATE_DISCARD
> +	bool "Enable Vector state discard by default"
> +	depends on RISCV_ISA_V
> +	default n
> +	help
> +	  Discarding vector state (also known as clobbering) on syscall entry
> +	  can help identify userspace programs that are mistakenly relying on
> +	  vector registers being preserved across syscalls. This can be useful
> +	  for debugging and testing. However, this behavior can negatively
> +	  impact performance on some RISC-V implementations and is not strictly
> +	  necessary.
> +
> +	  Select Y here if you want mandatory clobbering of vector state even
> +	  though it can increase the duration of syscalls on some RISC-V cores.
> +	  If you don't know what to do, then select N.
> +
> +	  This choice sets the initial value of the abi.riscv_v_vstate_discard
> +	  sysctl. Regardless of whether you choose Y or N, the sysctl can still
> +	  be changed by the user while the system is running.
> +
>  config RISCV_ISA_V_UCOPY_THRESHOLD
>  	int "Threshold size for vectorized user copies"
>  	depends on RISCV_ISA_V
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index b61786d43c2054f71727356fa9718b91ec97a38b..9d236e456d608fe363cd566a526e07fea970818e 100644
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
> index 184f780c932d443d81eecac7a6fb8070ee7a5824..7a4c209ad337efd7a3995cfc7cf1700c03e55b40 100644
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
> 
> ---
> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> change-id: 20250818-riscv_v_vstate_discard-e89b3181e0ac
> 
> Best regards,
> -- 
> Drew Fustini <fustini@kernel.org>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
