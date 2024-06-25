Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FF5C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djpiIvM8TZzpgYLKuYKfDMN9YizAQPJFMRkJkEwiHB8=; b=TZQO/7PbU6KEOJ
	Yzim6YHsGFSDgjx+lBwiiQ+E5cc89wnc+6kdVoEXW7scy3A8Zybqd2ZYoO/DfyqsB23g5fxYexWJo
	+2aXGvYq8cQz0g5XI75pIqJOSlUdkeVXmCtjO3jn+8x0Y9/2jedef+SP9FpC6nuhNQPOr/QUR0d/r
	bQ6DmjjIzTxpQ3gwEdPqqESN5GZFqpzuCkJ4J98xlxR6F0k4HMGMI1wTjn8o6b82cqXzmsTWmFmOm
	OO6jjFxIIpkuEzDBMwhr+cC7UHrJQ5CNKTfRPYmeaeY81J3JLt3FfXk5V+xG4LAvtbKfIGHoB1X7f
	zqnI46gGD8OVTyNVvl6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMAyw-000000047Nh-2hHS;
	Tue, 25 Jun 2024 18:33:30 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMAyt-000000047LM-0agH
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 18:33:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1f6da06ba24so43049205ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 11:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719340406; x=1719945206; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ry9kqDT4CgcwIlwoEzItiGRVLYvMKM4MU9guIUm1Hv8=;
        b=xSDOvB801kw9DUZwcxwbduPSFsKdJS/2BRar/c/YDoTcNNN+Og/u/GSaZiHMZ8RRzR
         uSVSiJb9Qj83Kczhj/W+PUBbzOyzE3NBtOdksGvXIOnNy9DgfLZe0l1DhT7RL/5hfQU5
         /y294bgMS5nyj2fO4WIMBa4AfImIAxUYd4jZpkZw5v1gTyB/H1E+MYkgahAdiPQtbKRu
         Myrtur7WwWMvld5psWu945FmaRMI7MYlL7BpHPli2RhN+pYADyR/ql7LAxiNKu1xdRzm
         mPtMYGkeHgNBhG9NPVb7P862FEDMVDhZhS1TTEfC0/a23IijOsGqK/sjwgCsK7R+RfHg
         cD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719340406; x=1719945206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ry9kqDT4CgcwIlwoEzItiGRVLYvMKM4MU9guIUm1Hv8=;
        b=xJsPGV8owSBT0BwTB43edcHNc3FZZxxF32/rwuaer5UkNnv7eYL/g6T5JU9EDdVWnY
         EPUXnvIu6K9RkkHtGiTnm1XeKU8opm1yUJPtjZJstuYAdGnW/awSm/6TJjZQxPq50W/S
         emTrDGPfyyU8PKD64bfcOdjUXd9AekLAXHRRzmq8jkVinIpmxBeVCdrns6aprGIibkf0
         ESZ5YLh1xk0LLNPCiwh/kD5luoQQYdnvH1J/FdRN0Hc3pnZMOwndAdo1r4bbotsR1Mm6
         Cpx69PF7B0qyGhMWr+SX75TurzeYvteSL1XJtzTTh1N2RCSGOGo0BDmeVyZBOQ685f/H
         NEVw==
X-Forwarded-Encrypted: i=1; AJvYcCX3DW9ww3O5M1kRwpzFvj23wz7YWEFrRMD0RzWIB806zKgOoEhJCxuuF7PFerPdTm3XwkJE3Tm9GPt72ZsUr5AtQV4pi1R++5TI6K2ygiTs
X-Gm-Message-State: AOJu0YzNJRag6j3NLalViyTauhkUNjZ8iaEKr5bc1rheQDwMAhudQ4Im
	q5M1CP6p2E4fqg7jmkZ5XYYcAh89IjOcJoBrWbK3nReg3i5DGRfHWLkP9QnM5mo=
X-Google-Smtp-Source: AGHT+IGVxAUgKjd+btB4sbZk2hD8oYIZh+/DyvbKdEo+mV0urTB5M9FFR43SbdPOunmNPcwS0EvfCw==
X-Received: by 2002:a17:903:32ce:b0:1f8:3c9e:3ba8 with SMTP id d9443c01a7336-1fa23f07251mr90203205ad.10.1719340405618;
        Tue, 25 Jun 2024 11:33:25 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:b583:35e3:86c6:2f7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c5fdesm84885955ad.164.2024.06.25.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 11:33:25 -0700 (PDT)
Date: Tue, 25 Jun 2024 11:33:22 -0700
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
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] RISC-V: hwprobe: Add SCALAR to misaligned perf
 defines
Message-ID: <ZnsNctHQROouE1Nj@ghost>
References: <20240625165121.2160354-1-evan@rivosinc.com>
 <20240625165121.2160354-3-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240625165121.2160354-3-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_113327_307754_A60DAF05 
X-CRM114-Status: GOOD (  31.52  )
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

On Tue, Jun 25, 2024 at 09:51:21AM -0700, Evan Green wrote:
> In preparation for misaligned vector performance hwprobe keys, rename
> the hwprobe key values associated with misaligned scalar accesses to
> include the term SCALAR.
> 
> Signed-off-by: Evan Green <evan@rivosinc.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> ---
> 
> Changes in v2:
>  - Added patch to rename misaligned perf key values (Palmer)
> 
>  Documentation/arch/riscv/hwprobe.rst       | 20 ++++++++++----------
>  arch/riscv/include/uapi/asm/hwprobe.h      | 10 +++++-----
>  arch/riscv/kernel/sys_hwprobe.c            | 10 +++++-----
>  arch/riscv/kernel/traps_misaligned.c       |  6 +++---
>  arch/riscv/kernel/unaligned_access_speed.c | 12 ++++++------
>  5 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index c9f570b1ab60..83f7f3c1347f 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -215,22 +215,22 @@ The following keys are defined:
>    the performance of misaligned scalar word accesses on the selected set of
>    processors.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
> -    accesses is unknown.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN`: The performance of
> +    misaligned accesses is unknown.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED`: Misaligned accesses are
>      emulated via software, either in or below the kernel.  These accesses are
>      always extremely slow.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned word accesses are
> -    slower than equivalent byte accesses.  Misaligned accesses may be supported
> -    directly in hardware, or trapped and emulated by software.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW`: Misaligned word accesses
> +    are slower than equivalent byte accesses.  Misaligned accesses may be
> +    supported directly in hardware, or trapped and emulated by software.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned word accesses are
> -    faster than equivalent byte accesses.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_FAST`: Misaligned word accesses
> +    are faster than equivalent byte accesses.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
> -    not supported at all and will generate a misaligned address fault.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED`: Misaligned accesses
> +    are not supported at all and will generate a misaligned address fault.
>  
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 22073533cea8..e11684d8ae1c 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -66,11 +66,11 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
>  #define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> -#define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	0
> -#define		RISCV_HWPROBE_MISALIGNED_EMULATED	1
> -#define		RISCV_HWPROBE_MISALIGNED_SLOW		2
> -#define		RISCV_HWPROBE_MISALIGNED_FAST		3
> -#define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	4
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN		0
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED	1
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW		2
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_FAST		3
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED	4
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		7
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
>  #define RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF	7
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 991ceba67717..fbf952e7383e 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -170,13 +170,13 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
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
> @@ -184,12 +184,12 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
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
