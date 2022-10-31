Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C83AC38A02
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 08:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bC6ED5CohXMD+fFOhUB+d0KcD/u/fSPPWqsQRliXps=; b=2Ck0n3/wPADZBJ
	gPSmMNXQWe8+9OpZooA0Aq1S7TnbKPLG3++LbbLjkqjoA5mHEBSJ7/km3aVLVqz3THExgGnN0MZJI
	Ro0cja2NQTd4yu+BMoNSQTLRgROT+gU+nNfyKHZDCzKU9kJfdhTexKZQY5hN+9D2z0Kb8nAD11bgc
	1QZieyg5V6C5RvvrMa4EYw34iFWGk1VuaMWqRq58HXdxfdSfBKfoz5xyVVeOd11fQbwAaqPdUuA8d
	GGJrOSYFDcaHmQ9N3VQWcWpGEdjp6WdDE6m5oJ3QOy790XkjrHZJeOOPtg2ZBfCekPKIhHl8EYMJ0
	VPXLr4pIXTQEkSbfYFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opPua-009TUE-W8; Mon, 31 Oct 2022 08:12:49 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opPuX-009TIV-H6
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 08:12:47 +0000
Received: by mail-ej1-x62d.google.com with SMTP id q9so27517975ejd.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Oct 2022 01:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bkdlt4kI8k6PiasTf/8ooOQstDw+UvLuqzKwgGWZ988=;
        b=df6S29X/eVkZ0hoWX95JjUSiQYG43TOsH1XwNz9Purn4Ef4mbd4d+3NvDgngeQRRvL
         twwzDSpUC+pkhamwpI+tF0h5BSASye9gOic+zL5IYCCFaG6lZh2u/qiSa6Ove7sd/1RP
         906zryM1V3p8fGIweowTvrX7PR6ikoujQNk5w2y7mkorPBOK42UhemBmIx6PPozjIK14
         qkhMXix3AZXMhXzEJ5XglGz06Nh9B12LAEAWnRgZsjmnGDQZ6t8iv4jp3A/hqEvODo6H
         fpmH5m+8I3ilrQL6kV6KFTv2ckqJ0uUptAH4YDdn1YVAmMbqqId4LgcQNLvArRHSgwBv
         D+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkdlt4kI8k6PiasTf/8ooOQstDw+UvLuqzKwgGWZ988=;
        b=0bbBMotW+JBaPwNHufDnXnMScgIy4BqcSQfrJwd7hzBB/gKyxeAVUtVV/T+k/YAlAg
         NLOk5eDjwi4cLk8PB0Kum2OWpl9whrtSha5BWcKbx7r6t9KaMTloFU/ZFrfk15D3EbBY
         UIDyIAPMe+NAXD8IJLKp4wRI/xepqDufTZFnLsMt94TFIzhRNWL8m0JBXFVpZL5Gpjgm
         Pvz9Xx7hDoWwTikBqUShKey0+RXSxyk8x0pVJA4Qqgw/Xa2pXl/ujcOFP4UfmTK1qCeh
         wNR94HQTkKvvQkV/gign+AmpdNbFvIv6uarD5CBiHCgASDQCff+3A1ZgZlgtjgMn5vrI
         25dA==
X-Gm-Message-State: ACrzQf3it9vfMnx7SooIfPPCY+1KZuXr4UtnbXDQgbT/hCM9LBeUR+13
	LJHO2TrJ7vAtLS3325ow4QvUPw==
X-Google-Smtp-Source: AMsMyM74lgekSlh1dSsvXUBjuL2Mr2aZjUDz8d/AnKmQaVCf5jUDjIo/WF1MiZ+wLHrXxrGheHf11g==
X-Received: by 2002:a17:907:1ca7:b0:7ad:9227:5288 with SMTP id nb39-20020a1709071ca700b007ad92275288mr11398225ejc.62.1667203955949;
        Mon, 31 Oct 2022 01:12:35 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id dy14-20020a05640231ee00b00461621cae1fsm2930729edb.16.2022.10.31.01.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 01:12:35 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:12:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 2/9] RISC-V: Add Zicboz detection and block size parsing
Message-ID: <20221031081234.tununsmvhyfr4fl2@kamzik>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-3-ajones@ventanamicro.com>
 <Y17i8sRf4KXLFkrK@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y17i8sRf4KXLFkrK@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_011245_691331_4005EA6F 
X-CRM114-Status: GOOD (  33.75  )
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

On Sun, Oct 30, 2022 at 08:47:46PM +0000, Conor Dooley wrote:
> On Thu, Oct 27, 2022 at 03:02:40PM +0200, Andrew Jones wrote:
> > Mostly follow the same pattern as Zicbom, but leave out the toolchain
> > checks as we plan to use the insn-def framework for the cbo.zero
> > instruction.
> 
> nit: I'd prefer to see a commit message that stands on it's own without
> relying on someone knowing how zicbom has been wired up.

Sure, I'll rewrite this for v2.

> 
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/Kconfig                  | 13 +++++++++++++
> >  arch/riscv/include/asm/cacheflush.h |  3 ++-
> >  arch/riscv/include/asm/hwcap.h      |  1 +
> >  arch/riscv/kernel/cpu.c             |  1 +
> >  arch/riscv/kernel/cpufeature.c      | 10 ++++++++++
> >  arch/riscv/kernel/setup.c           |  2 +-
> >  arch/riscv/mm/cacheflush.c          | 23 +++++++++++++++--------
> >  7 files changed, 43 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 6b48a3ae9843..c20e6fa0c0b1 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -433,6 +433,19 @@ config RISCV_ISA_ZICBOM
> >  
> >  	   If you don't know what to do here, say Y.
> >  
> > +config RISCV_ISA_ZICBOZ
> > +	bool "Zicboz extension support for faster zeroing of memory"
> > +	depends on !XIP_KERNEL && MMU
> > +	select RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Adds support to dynamically detect the presence of the ZICBOZ
> > +	   extension (cbo.zero instruction) and enable its usage.
> > +
> > +	   The Zicboz extension is used for faster zeroing of memory.
> > +
> > +	   If you don't know what to do here, say Y.
> > +
> >  config FPU
> >  	bool "FPU support"
> >  	default y
> > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> > index f6fbe7042f1c..5b31568cf5e6 100644
> > --- a/arch/riscv/include/asm/cacheflush.h
> > +++ b/arch/riscv/include/asm/cacheflush.h
> > @@ -43,7 +43,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
> >  #endif /* CONFIG_SMP */
> >  
> >  extern unsigned int riscv_cbom_block_size;
> > -void riscv_init_cbom_blocksize(void);
> > +extern unsigned int riscv_cboz_block_size;
> > +void riscv_init_cbo_blocksizes(void);
> >  
> >  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> >  void riscv_noncoherent_supported(void);
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 5d6492bde446..eaa5a972ad2d 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -45,6 +45,7 @@
> >  #define RISCV_ISA_EXT_ZIHINTPAUSE	29
> >  #define RISCV_ISA_EXT_SSTC		30
> >  #define RISCV_ISA_EXT_SVINVAL		31
> > +#define RISCV_ISA_EXT_ZICBOZ		32
> >  
> >  #define RISCV_ISA_EXT_ID_MAX		RISCV_ISA_EXT_MAX
> >  
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index fa427bdcf773..bf969218f609 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -144,6 +144,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
> >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> > +	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> >  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> >  };
> >  
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 18b9ed4df1f4..e13b3391de76 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -78,6 +78,15 @@ static bool riscv_isa_extension_check(int id)
> >  			return false;
> >  		}
> >  		return true;
> > +	case RISCV_ISA_EXT_ZICBOZ:
> > +		if (!riscv_cboz_block_size) {
> > +			pr_err("Zicboz detected in ISA string, but no cboz-block-size found\n");
> > +			return false;
> > +		} else if (!is_power_of_2(riscv_cboz_block_size)) {
> > +			pr_err("cboz-block-size present, but is not a power-of-2\n");
> > +			return false;
> > +		}
> > +		return true;
> >  	}
> >  
> >  	return true;
> > @@ -225,6 +234,7 @@ void __init riscv_fill_hwcap(void)
> >  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> >  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> >  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> > +				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
> >  			}
> >  #undef SET_ISA_EXT_MAP
> >  		}
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index a07917551027..26de0d8fd23d 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -296,7 +296,7 @@ void __init setup_arch(char **cmdline_p)
> >  	setup_smp();
> >  #endif
> >  
> > -	riscv_init_cbom_blocksize();
> > +	riscv_init_cbo_blocksizes();
> >  	riscv_fill_hwcap();
> >  	apply_boot_alternatives();
> >  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index f096b9966cae..208e0d58bde3 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -91,6 +91,9 @@ void flush_icache_pte(pte_t pte)
> >  unsigned int riscv_cbom_block_size;
> >  EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> >  
> > +unsigned int riscv_cboz_block_size;
> > +EXPORT_SYMBOL_GPL(riscv_cboz_block_size);
> > +
> >  static void cbo_get_block_size(struct device_node *node,
> >  			       const char *name, u32 *blksz,
> >  			       unsigned long *first_hartid)
> > @@ -113,19 +116,23 @@ static void cbo_get_block_size(struct device_node *node,
> >  	}
> >  }
> >  
> > -void riscv_init_cbom_blocksize(void)
> > +void riscv_init_cbo_blocksizes(void)
> >  {
> > +	unsigned long cbom_hartid, cboz_hartid;
> > +	u32 cbom_blksz = 0, cboz_blksz = 0;
> >  	struct device_node *node;
> > -	unsigned long cbom_hartid;
> > -	u32 probed_block_size;
> >  
> > -	probed_block_size = 0;
> >  	for_each_of_cpu_node(node) {
> > -		/* set block-size for cbom extension if available */
> > +		/* set block-size for cbom and/or cboz extension if available */
> >  		cbo_get_block_size(node, "riscv,cbom-block-size",
> > -				   &probed_block_size, &cbom_hartid);
> > +				   &cbom_blksz, &cbom_hartid);
> > +		cbo_get_block_size(node, "riscv,cboz-block-size",
> > +				   &cboz_blksz, &cboz_hartid);
> >  	}
> >  
> > -	if (probed_block_size)
> > -		riscv_cbom_block_size = probed_block_size;
> > +	if (cbom_blksz)
> > +		riscv_cbom_block_size = cbom_blksz;
> 
> As in patch 1, can you stick with s/blksz/block_size/ please.

Will do.

> My poor OCD!!! Other than those minor things:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
drew

> 
> > +
> > +	if (cboz_blksz)
> > +		riscv_cboz_block_size = cboz_blksz;
> >  }
> > -- 
> > 2.37.3
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
