Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184A7EEE270
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 22:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRWY6Yqo5A51JPGMwKTxOuyPpDL9G7WWgh/RdCOLW5w=; b=3d6jLvb/eadwbA
	lwTKC2B0Dq8cFSZz6yrwwEpaHcR2Eg/MhlwMWQr9HiND2wFl8WXhDsjDDUNRVh5HumK4HFHyjtHAT
	la5tPEv2Sli7udertJAOx4+P6vWv8nAk3ACHbPAM01DgxaILSbuBgAT/b8ngOcyp/SzvaFKpQbwWF
	fngEwCv27MpKydFowTTKO6ziXZu9kPK7Pnd0TyImmuDQO2kJgfV6QyX3U+TZ0Wf69OEpwLfqKKb2y
	Ulq5JKM/KvE7pgy8nWIdC1nXc1yuC3ZFggWNaySWP6il0AcC+djQgsjTXaHvPDMp61Hg245oixaGm
	ZWVjCpfwqPXhGGxdm8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sosml-0000000EPP0-0c84;
	Thu, 12 Sep 2024 22:59:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sosmi-0000000EPOI-42qW
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 22:59:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20551e2f1f8so3157195ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 15:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726181972; x=1726786772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LI4dI97SWAb860LG4NezAi+gyF0moRXuDnMKm5Q9r2s=;
        b=fq4b6hTxWeomQdBbYK65LwaxnNQSzZJ/9f//3tAIVMrGKykUo2XAIgTrIbASBGfhpe
         dS60TAZ2Ab71ZXzpgyhMnIofHvPXFbFLS1T2LmJ2mos2AB5vkMMcY6wfFL9tiCTjREps
         K2SekFPrLqDs2i2UqFhrf6jvR+nKVa1zuw4hRw4AIgi07Fj8aU31/Qq7/zcdtx/rvtTt
         v6Ida0BHhDC2XyTdPxjkeUmgtpgzk76a53N46m5bG28B6bDX6AzAFbr9RPDUM0GfBKwB
         gfc/r6Ye032ZTnvsQYKZNWFRvvgx7eAVJTFrS0RWgNbsBNmFfI3K0LQv/VqD1+LxVSFP
         +77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726181972; x=1726786772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI4dI97SWAb860LG4NezAi+gyF0moRXuDnMKm5Q9r2s=;
        b=wJUEH/J6Nr4+76+SiJLdlbSerZuKZNPsf5qp6WXT7yBaSOsd2e6r+b2J0KiC/nVZUT
         h8R0KfvUXh3NVxS6RHB+fNPYOp0FOmGZRABkuXWFkCBU8FSlhGEd1LO+XRCm4KQyMxis
         XLCnk6KefnNCg9aIITlJoNVi96Xc3a2T/g61WiOFAMSpSJLQAY6KEMYsUkRBFdvsi+Gu
         N5tYmKnFtzOPKcvwY36zVDvqWPz+76lab7/0bKm4YFC9uVQ5eydovyFem3yEcgV2WRmU
         FfZwah5hOkrdYeGpYltJPszolSrsecMymR8Gj3p3qOw4stqarhiI6omb/W6VnGLvUSj3
         gt3Q==
X-Gm-Message-State: AOJu0Yzu0JNSfAf9+y8GGUnShMfdBLThkQ252H7R1W+o+asG3lm/IfUl
	ES9+PTABl5ABMLmigkLQSzO/bdpQWoQXiVW5gY+06MsKHgvCoPm1KYjmRHIDKZ4=
X-Google-Smtp-Source: AGHT+IE+CL3+oYuw4kshgAQdGS8pSbDVdFnEX/NOrpfbZgL0VyDq3X6tMQuMNJbHW68DMGighRDooA==
X-Received: by 2002:a17:90b:1c84:b0:2c9:6a2d:b116 with SMTP id 98e67ed59e1d1-2dbb9dc9551mr1002941a91.7.1726181972073;
        Thu, 12 Sep 2024 15:59:32 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af456c5sm18707335ad.65.2024.09.12.15.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 15:59:31 -0700 (PDT)
Date: Thu, 12 Sep 2024 15:59:28 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xiao Wang <xiao.w.wang@intel.com>, Zhao Ke <ke.zhao@shingroup.cn>
Subject: Re: [PATCH v4 3/3] riscv: Call riscv_user_isa_enable() only on the
 boot hart
Message-ID: <ZuNyUC8mUSp8UtfI@ghost>
References: <20240814081126.956287-1-samuel.holland@sifive.com>
 <20240814081126.956287-4-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814081126.956287-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_155933_030030_562F2CCA 
X-CRM114-Status: GOOD (  23.11  )
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

On Wed, Aug 14, 2024 at 01:10:56AM -0700, Samuel Holland wrote:
> Now that the [ms]envcfg CSR value is maintained per thread, not per
> hart, riscv_user_isa_enable() only needs to be called once during boot,
> to set the value for the init task. This also allows it to be marked as
> __init.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
> 
> Changes in v4:
>  - Rebase on riscv/for-next (v6.11-rc)
>  - Add Conor's Reviewed-by tags from v2 (missed in v3)
> 
> Changes in v3:
>  - Drop use of __initdata due to conflicts with cpufeature.c refactoring
> 
> Changes in v2:
>  - Rebase on riscv/for-next
> 
>  arch/riscv/include/asm/cpufeature.h | 2 +-
>  arch/riscv/kernel/cpufeature.c      | 4 ++--
>  arch/riscv/kernel/smpboot.c         | 2 --
>  3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 45f9c1171a48..ce9a995730c1 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -31,7 +31,7 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>  /* Per-cpu ISA extensions. */
>  extern struct riscv_isainfo hart_isa[NR_CPUS];
>  
> -void riscv_user_isa_enable(void);
> +void __init riscv_user_isa_enable(void);
>  
>  #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size, _validate) {	\
>  	.name = #_name,									\
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index df3e7e8d6d78..b3b9735cb19a 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -919,12 +919,12 @@ unsigned long riscv_get_elf_hwcap(void)
>  	return hwcap;
>  }
>  
> -void riscv_user_isa_enable(void)
> +void __init riscv_user_isa_enable(void)
>  {
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
>  		current->thread.envcfg |= ENVCFG_CBZE;
>  	else if (any_cpu_has_zicboz)
> -		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
> +		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 0f8f1c95ac38..e36d20205bd7 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -233,8 +233,6 @@ asmlinkage __visible void smp_callin(void)
>  	numa_add_cpu(curr_cpuid);
>  	set_cpu_online(curr_cpuid, true);
>  
> -	riscv_user_isa_enable();
> -
>  	/*
>  	 * Remote cache and TLB flushes are ignored while the CPU is offline,
>  	 * so flush them both right now just in case.
> -- 
> 2.45.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
