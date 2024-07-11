Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7ACC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 22:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wzx6e9XesswOnKB1NzxAULrptwnUXY2lqiJh/qz0Xzg=; b=YAyA4WSeZ78qaA
	iIpHR0UNNqwaSz4J6CIXY458yzlyrNPhenOnaSSp1w7YD47H3gdmFniELK5WHh7XwHt9ULTjSX/4h
	L8L4h1R/XD1UEb+tWtWYClrnY9c4HfwLIxqkb18ibxZmhLnIvpI+5HR+cEA4v/rfhEbKLfG0iGm4b
	DO01/d8/Dbo2uPlHRffmuctDjPTtzGqlKrsNpWyHHLjNTPAPjCrLUjejlP9as2M1bUg8igk8KlMCL
	Ll2yfBP185Tncv6E74DLMCNqOZVJgn1Qm/OFGtpeTcnmOcFAza/fzE7htDLTHiKcv1/gIdxYoAa3X
	ZGJi12EgqHIivUcSEang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS2R5-0000000FhEP-3rBr;
	Thu, 11 Jul 2024 22:38:47 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS2R2-0000000FhDv-3RIl
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 22:38:46 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70b12572bd8so1254381b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jul 2024 15:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720737524; x=1721342324; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pbNZF2S4J9drmyHueEsFFLhlbRMEBvhBMv4NoxbSMK8=;
        b=lLeLdLXkQC7yPhnoLRIRju43C7j2VzqCD8vk8ndiOEIjKdmGiSA8ktoqkuQo0SjzRc
         UrGcvUoZaHAWIDktBTh21Y8eNzknnkfebLB6c8cLyN9++h9rgrWvBFXEEfV53c2W0BFX
         lelZZ3R6nTY1u/VDsRXUk9btIVPOmrXl2Oy8YxtcwVx28cu45HcRGNg6b3ASZjDdR3pj
         l57cHtcVg9FIAbKHwpserhXd618zur3mfTiw20ae5JT9mCGrPAngr4xuJd/U9tXAcI5r
         rL9cBzQ8zdezYLTzMQqlzFshPcKcDg17slAnG6SLRtdYG88L1JyMiG+/oDnyri8FIpit
         g0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720737524; x=1721342324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbNZF2S4J9drmyHueEsFFLhlbRMEBvhBMv4NoxbSMK8=;
        b=rMzWzljuswk1ZuSM/CcTWOaX3HTUSdB2ozDpSItN94aYr/PBipFjFh9laUNzQTd5u0
         E6WbNq7FjzzfGg3qiEsLq8z2O0fFp8kz6cgbu+KsFqC13vjrbnFhZzLK7BFM9SvEGPE9
         iA7tQCuAS5Z7GlyH21SlgP1/6Q9hpjTAGgUsMKUS5emRGzq/Uae7RytcJXeX+wLDCGKQ
         WODLMKCKmBLKqY0RPFGVrWyDgWJJmJz14THbuoOzeuywN4iYTNbMnkt1OSlVv6DkroFr
         ugxIvPorQlhjg6/+EWpL7eJ60qd1ZNGg+Hed8mvcdORn6a4srs5wTMM07SZSd0eIKVan
         c57w==
X-Gm-Message-State: AOJu0YyWaGe2BSWdZhll/mlzMGYzKn9SWR1x/GuX8qxRKqyNXuOurBIP
	jsUVyEUdoTaZxcL4OL1Ec9UJCUjDI0Uzn/D5fYNjXxiSYomgVOgyMJSWpAoRivg=
X-Google-Smtp-Source: AGHT+IHnc8Zv8sfbsAY4oLFXAWbmahrHaGEf23uvgOftBM0iIylqo5S8ACJ9AZUHYcZTecSZvb2vOA==
X-Received: by 2002:a05:6a00:3d08:b0:706:5dab:83c4 with SMTP id d2e1a72fcca58-70b43576a80mr9974899b3a.14.1720737523703;
        Thu, 11 Jul 2024 15:38:43 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b8594sm6197736b3a.192.2024.07.11.15.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 15:38:43 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:38:40 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 3/7] RISC-V: Check scalar unaligned access on all CPUs
Message-ID: <ZpBe8ECHxJ9QXVB2@ghost>
References: <20240711215846.834365-1-jesse@rivosinc.com>
 <20240711215846.834365-4-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240711215846.834365-4-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_153844_886587_7D408D2D 
X-CRM114-Status: GOOD (  22.54  )
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

On Thu, Jul 11, 2024 at 05:58:42PM -0400, Jesse Taube wrote:
> Originally, the check_unaligned_access_emulated_all_cpus function
> only checked the boot hart. This fixes the function to check all
> harts.
> 
> Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwprobe")
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Cc: stable@vger.kernel.org
> ---
> V1 -> V2:
>  - New patch
> V2 -> V3:
>  - Split patch
> V3 -> V4:
>  - Re-add check for a system where a heterogeneous
>     CPU is hotplugged into a previously homogenous
>     system.
> ---
>  arch/riscv/kernel/traps_misaligned.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index b62d5a2f4541..1a1bb41472ea 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -526,11 +526,11 @@ int handle_misaligned_store(struct pt_regs *regs)
>  	return 0;
>  }
>  
> -static bool check_unaligned_access_emulated(int cpu)
> +static void check_unaligned_access_emulated(struct work_struct *unused)

Small change, can you give this a different name like "work" and instead
give it the attribute "__always_unused" like:

struct work_struct *work __always_unused

Otherwise,

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

>  {
> +	int cpu = smp_processor_id();
>  	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
>  	unsigned long tmp_var, tmp_val;
> -	bool misaligned_emu_detected;
>  
>  	*mas_ptr = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
>  
> @@ -538,19 +538,16 @@ static bool check_unaligned_access_emulated(int cpu)
>  		"       "REG_L" %[tmp], 1(%[ptr])\n"
>  		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
>  
> -	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_EMULATED);
>  	/*
>  	 * If unaligned_ctl is already set, this means that we detected that all
>  	 * CPUS uses emulated misaligned access at boot time. If that changed
>  	 * when hotplugging the new cpu, this is something we don't handle.
>  	 */
> -	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
> +	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_EMULATED))) {
>  		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
>  		while (true)
>  			cpu_relax();
>  	}
> -
> -	return misaligned_emu_detected;
>  }
>  
>  bool check_unaligned_access_emulated_all_cpus(void)
> @@ -562,8 +559,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
>  	 * accesses emulated since tasks requesting such control can run on any
>  	 * CPU.
>  	 */
> +	schedule_on_each_cpu(check_unaligned_access_emulated);
> +
>  	for_each_online_cpu(cpu)
> -		if (!check_unaligned_access_emulated(cpu))
> +		if (per_cpu(misaligned_access_speed, cpu)
> +		    != RISCV_HWPROBE_MISALIGNED_EMULATED)
>  			return false;
>  
>  	unaligned_ctl = true;
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
