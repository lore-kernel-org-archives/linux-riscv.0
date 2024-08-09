Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F3DC52D7C
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 21:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDW7f1M5hXE+J50943BjDGJj0jNM17VOAf+px75O5E4=; b=LlVb9xcIGZ7bun
	rNWWGbYMV13QroTK6bZm432AKOeErG9j/9KtbItB74P2c8EXDQU6NrbWTVUR6I9gb4gPqiVdLr1xi
	lkNVIvA6FI7yNuZ2CyB2NpOIWBIFSJ0bN4+uP8vmVznfJKkctVVbWx2sPbrj3VsbGE33yiIiusQOM
	GfUL9YPfjqIDYhh38kePyf873fQtgYbn8LactIN5BjIx+jvzuZCrYiJbiqhEDe2z34M5/1TCVlIg6
	YV236nxx3EdQx22UdLukHgqEYgP6rEWCG0k5O0RD4aff9J2ZFgwPMoZcarafchFYcE9E2SDbYzjci
	sUrhXOjXlVz3UgGXyXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scXcT-0000000CdB1-3XCN;
	Fri, 09 Aug 2024 21:57:57 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scXcQ-0000000CdAU-0sT3
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 21:57:56 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7104f939aa7so2286457b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 14:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723240672; x=1723845472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/xyikB2Ei/kP6v6qu3Dfjj4bcI3dXovVHvkmH5BSaI0=;
        b=Ux1+FODejIHgFqpJWAzivNWPwdgLVoXvyAgPILRJietII37UCv+CVf8r3967dCoZoc
         GFNHiij3GyFMPcJx0/T+Dsa8zuAMXX0zWw7FO6zwrdnk9LhGW2X9k0WQFeh9hVpIjuw0
         35mLiUxBYHCEy2z+kHps9RdEYG2XjRL82zAho4NPHlVIFCjgwOy5R4AlWhnguO/7TRRQ
         eI1YwUJwO2ECXE6zugeql3FNOOoVX/avepuXWq4VvkcpmAlkIcHHm+S/aPX5wrHEXph/
         OE0BHcj0iLBrQbL8MHlYSR0K/C8uNs+aDE7Vlg+0+kHDcou5fFB0Zwj/4mkZFCdyXzHb
         PL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723240672; x=1723845472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xyikB2Ei/kP6v6qu3Dfjj4bcI3dXovVHvkmH5BSaI0=;
        b=jBYuGUh+YPlD5G55w/hHGeWN8PSouTRlgEvS7rorRxtFuoFCv0sbgCqlom1cld31yy
         U5mKw1etHJ5nAbx0LvbSdpmWuNOQvHyIHaEAwy3/Syw+zQLtqvg3Ug1brQjH5zIMCQZk
         0KpPb8Y2n+fDGbr6IfQJj8IwRx4iMki7MGyptXuN1APb1FpqS68Mki7n3moYj/RJgWm0
         JyUtmV7V64cz8Jk0FKqAJfxHIvcvhBenhxJSfN1kmHx/3qdqOpWGfwkbEpKz31S8ES1p
         NiUZcoMRv4fp7aAQUpMqzLNwA3eC16X5jB3BNQnPqMHpd5Dr3epvGeuklKlkiPjYuxuW
         qDHg==
X-Forwarded-Encrypted: i=1; AJvYcCXb+HAirpsKprETs6L1o/ToLdnh6zmn/R4eqYPpGeo2CViktQ1scENu7YLPiS4AK4K0DhbaENIzlC1clAg3UsdzQumbNWQwdfFiSlm/llri
X-Gm-Message-State: AOJu0YzlFm758Dwc8Y+Z1Lt5JjX4CKLCEoi8EYgN5Cn1tSF/d116nnsv
	vQUHGfeQIhQ4sVqnSo7dY1yHBX934ni7e2XQ5SG/GjpAdyvOTt0ALKmnKCIR8wk=
X-Google-Smtp-Source: AGHT+IGBilfw4eReVwGWLB9hQLzymiOUg/hKPc9JEHB5a0oS9qZPfYxcOgqQLKshRKalDD2T65SeFA==
X-Received: by 2002:a05:6a00:6507:b0:710:e4db:a6fc with SMTP id d2e1a72fcca58-710e4dba9aemr955309b3a.27.1723240672503;
        Fri, 09 Aug 2024 14:57:52 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:c561:c8c0:63ad:403a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe9eca3sm145941a12.76.2024.08.09.14.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 14:57:51 -0700 (PDT)
Date: Fri, 9 Aug 2024 14:57:48 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Erick Archer <erick.archer@gmx.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org,
	enh <enh@google.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/2] RISC-V: hwprobe: Add SCALAR to misaligned perf
 defines
Message-ID: <ZraQ3PWOY23G2zZH@ghost>
References: <20240809214444.3257596-1-evan@rivosinc.com>
 <20240809214444.3257596-3-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240809214444.3257596-3-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_145754_282417_7492206F 
X-CRM114-Status: GOOD (  34.72  )
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

On Fri, Aug 09, 2024 at 02:44:44PM -0700, Evan Green wrote:
> In preparation for misaligned vector performance hwprobe keys, rename
> the hwprobe key values associated with misaligned scalar accesses to
> include the term SCALAR. Leave the old defines in place to maintain
> source compatibility.
> 
> This change is intended to be a functional no-op.
> 
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> ---
> 
> Changes in v4:
>  - Add the word scalar (Charlie)
> 
> Changes in v3:
>  - Leave the old defines in place (Conor, Palmer)
> 
> Changes in v2:
>  - Added patch to rename misaligned perf key values (Palmer)
> 
>  Documentation/arch/riscv/hwprobe.rst       | 28 ++++++++++++----------
>  arch/riscv/include/uapi/asm/hwprobe.h      |  5 ++++
>  arch/riscv/kernel/sys_hwprobe.c            | 10 ++++----
>  arch/riscv/kernel/traps_misaligned.c       |  6 ++---
>  arch/riscv/kernel/unaligned_access_speed.c | 12 +++++-----
>  5 files changed, 34 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index a994eed75bde..85b709257918 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -247,23 +247,25 @@ The following keys are defined:
>    the performance of misaligned scalar native word accesses on the selected set
>    of processors.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
> -    accesses is unknown.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN`: The performance of
> +    misaligned scalar accesses is unknown.

+ enh <enh@google.com>

Thanks for respinning this Evan! With this wording change the patch that
changes the wording but not the macro [1] is no longer needed.

- Charlie

Link:
https://lore.kernel.org/linux-riscv/CAJgzZorn5anPH8dVPqvjVWmLKqTi5bkLDR=FH-ZAcdXFnNe8Eg@mail.gmail.com/
[1]

>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
> -    emulated via software, either in or below the kernel.  These accesses are
> -    always extremely slow.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED`: Misaligned scalar
> +    accesses are emulated via software, either in or below the kernel.  These
> +    accesses are always extremely slow.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned native word
> -    sized accesses are slower than the equivalent quantity of byte accesses.
> -    Misaligned accesses may be supported directly in hardware, or trapped and
> -    emulated by software.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW`: Misaligned scalar native
> +    word sized accesses are slower than the equivalent quantity of byte
> +    accesses. Misaligned accesses may be supported directly in hardware, or
> +    trapped and emulated by software.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned native word
> -    sized accesses are faster than the equivalent quantity of byte accesses.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_FAST`: Misaligned scalar native
> +    word sized accesses are faster than the equivalent quantity of byte
> +    accesses.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
> -    not supported at all and will generate a misaligned address fault.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED`: Misaligned scalar
> +    accesses are not supported at all and will generate a misaligned address
> +    fault.
>  
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 635753084275..1e153cda57db 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -83,6 +83,11 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
>  #define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
>  #define RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF	9
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN		0
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED	1
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW		2
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_FAST		3
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED	4
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 2d0f4f6a32c3..cea0ca2bf2a2 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -178,13 +178,13 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  			perf = this_perf;
>  
>  		if (perf != this_perf) {
> -			perf = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> +			perf = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
>  			break;
>  		}
>  	}
>  
>  	if (perf == -1ULL)
> -		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> +		return RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
>  
>  	return perf;
>  }
> @@ -192,12 +192,12 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  {
>  	if (IS_ENABLED(CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS))
> -		return RISCV_HWPROBE_MISALIGNED_FAST;
> +		return RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
>  
>  	if (IS_ENABLED(CONFIG_RISCV_EMULATED_UNALIGNED_ACCESS) && unaligned_ctl_available())
> -		return RISCV_HWPROBE_MISALIGNED_EMULATED;
> +		return RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
>  
> -	return RISCV_HWPROBE_MISALIGNED_SLOW;
> +	return RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
>  }
>  #endif
>  
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index b62d5a2f4541..192cd5603e95 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -338,7 +338,7 @@ int handle_misaligned_load(struct pt_regs *regs)
>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  
>  #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
> -	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_EMULATED;
> +	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
>  #endif
>  
>  	if (!unaligned_enabled)
> @@ -532,13 +532,13 @@ static bool check_unaligned_access_emulated(int cpu)
>  	unsigned long tmp_var, tmp_val;
>  	bool misaligned_emu_detected;
>  
> -	*mas_ptr = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> +	*mas_ptr = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
>  
>  	__asm__ __volatile__ (
>  		"       "REG_L" %[tmp], 1(%[ptr])\n"
>  		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
>  
> -	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_EMULATED);
> +	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED);
>  	/*
>  	 * If unaligned_ctl is already set, this means that we detected that all
>  	 * CPUS uses emulated misaligned access at boot time. If that changed
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index a9a6bcb02acf..160628a2116d 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -34,9 +34,9 @@ static int check_unaligned_access(void *param)
>  	struct page *page = param;
>  	void *dst;
>  	void *src;
> -	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
> +	long speed = RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
>  
> -	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
> +	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
>  		return 0;
>  
>  	/* Make an unaligned destination buffer. */
> @@ -95,14 +95,14 @@ static int check_unaligned_access(void *param)
>  	}
>  
>  	if (word_cycles < byte_cycles)
> -		speed = RISCV_HWPROBE_MISALIGNED_FAST;
> +		speed = RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
>  
>  	ratio = div_u64((byte_cycles * 100), word_cycles);
>  	pr_info("cpu%d: Ratio of byte access time to unaligned word access is %d.%02d, unaligned accesses are %s\n",
>  		cpu,
>  		ratio / 100,
>  		ratio % 100,
> -		(speed == RISCV_HWPROBE_MISALIGNED_FAST) ? "fast" : "slow");
> +		(speed == RISCV_HWPROBE_MISALIGNED_SCALAR_FAST) ? "fast" : "slow");
>  
>  	per_cpu(misaligned_access_speed, cpu) = speed;
>  
> @@ -110,7 +110,7 @@ static int check_unaligned_access(void *param)
>  	 * Set the value of fast_misaligned_access of a CPU. These operations
>  	 * are atomic to avoid race conditions.
>  	 */
> -	if (speed == RISCV_HWPROBE_MISALIGNED_FAST)
> +	if (speed == RISCV_HWPROBE_MISALIGNED_SCALAR_FAST)
>  		cpumask_set_cpu(cpu, &fast_misaligned_access);
>  	else
>  		cpumask_clear_cpu(cpu, &fast_misaligned_access);
> @@ -188,7 +188,7 @@ static int riscv_online_cpu(unsigned int cpu)
>  	static struct page *buf;
>  
>  	/* We are already set since the last check */
> -	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
> +	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
>  		goto exit;
>  
>  	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
