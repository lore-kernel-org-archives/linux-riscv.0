Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FB7C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 10:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnI76ntGAmAkpT1xcJvlfVEFDQQKmYPRHNV9rPiHurY=; b=u6mJL79m4V3EY7
	2dahp9zzWajIzJlhG9n6HPsm6pXtFT3znvgNPIJQP15IiYgUxViqa8s/6Z9oeZDIUQ+NyKR41L4bp
	lXO1TTmyRU8TUVhWRvy81I7/lnfVLA6nyM1db6S3pDnUuofPFfY9EatWliDrCnklOGPcmGGRwR9jo
	EFwEeLt9JeUET9IdiLKAPkq/JaCkNtcBLYFBCRNYkN2BQEhgdPOdw5tCzxheXfwDwI0ltu0r+KJ9Z
	kzOigiO6Ht5UqfggnsCf7cH7omRdjEtaP9+A1x2aa6W7tbuhAOkJRrY2ISOTXKStkPesJ+z/feGfE
	j4mlfkKHnXygDUTFhWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKbj5-00000008ou8-1H1L;
	Fri, 21 Jun 2024 10:42:39 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKbj2-00000008orl-0Yqu
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 10:42:38 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a63359aaacaso271429166b.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 03:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718966554; x=1719571354; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgz9ZmJ4s9216HaGH0t9U4xCU2tIUMWcQRC8Q7eK2T4=;
        b=A7zSoIuPZ3Pf9aOlSXoKmQ2kNE3WvPPPNUbWOQWvmE38ryhiJSURKAY1MSosUpHpoU
         Loz5j6/xMJtmK4h14SK+vyYBC1rCeI7PFt1R1e1UQo9907+aMLR13W1THkF3YsyLlUWB
         j6wTx9dLrISADoFpzIbEEX+FBrC1YRdBKq22gX7YIu2aZmjnUqWvodSMhqVEsK8r59O8
         W2gqzBrQE1lABNYr8YnlAc8tJWL5PUCZ8fAsoPC9dB5z395RSZHbGdrwkh0QVOfOxH29
         QgCNvF4yOcSb5dkfb/pJ8GyzH4efLcvtVma8oqF/TRRUpEZKElO/S/PPEDidnLuJLgAX
         NDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966554; x=1719571354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgz9ZmJ4s9216HaGH0t9U4xCU2tIUMWcQRC8Q7eK2T4=;
        b=Y0GewL+vzx+uj9CnZzV8nBHsCPSsYJFQErRnIG++OSKTdhdy4flG122LMC5f4GmpZU
         ifyq65bMh3v4eRok4HCuLVVFA9Dd1rbfUYjsJM5qlfUaqeoVmWXusMMk76muS20tuLAe
         LxkKThpsDLU1BAFuF3ZZDDMGWhdBIdoSMT34PnhoFpkVQdHMDoT4KcLuxhki4aj734V8
         t/yG0lnGokCt9yEASTsv2xdhPFZo1C8Wym0rXGjrTCkbMtCv+Zoqhci/PRbMQlrRE7+w
         WggsL9wKSmFqKaeVvs3GLXsipjbjiwnr2oAdauF7qI3owJ6xdJEmX0nUbyxdWXnw3KfI
         2oJw==
X-Forwarded-Encrypted: i=1; AJvYcCUDxcNpAyJhXcXUjdX92Ylp0KiN/Uysz46vTuLImeyzVuFUmNEdQho3LTYhs1ePhuP+0tnq3yoWfTWZVXri0MxCET8zXTipvUcG6J5UGq8j
X-Gm-Message-State: AOJu0YyoNhP1k9oJVRlxJebnnjg1hrGf9wE3Z8nfnlDFhQMQkezQkkeV
	ALQb4vMm+UWnFGFXG2SXOIRNBAPAsEBRHmz5UY+PITjp+1ZQMgIqXLsETFtYGHM=
X-Google-Smtp-Source: AGHT+IHxrHNNvxNY4qy5ocEyq6ukqomCarzZCMchwFqZYAIJwUYhqG6K9/TqPLhbvu6lrozE/uS1Hw==
X-Received: by 2002:a17:906:a28a:b0:a6f:1ad7:6875 with SMTP id a640c23a62f3a-a6fab7d0479mr422358166b.69.1718966553875;
        Fri, 21 Jun 2024 03:42:33 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf428c67sm70251066b.2.2024.06.21.03.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:42:33 -0700 (PDT)
Date: Fri, 21 Jun 2024 12:42:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, apatel@ventanamicro.com, alex@ghiti.fr, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Jinyu Tang <tjytimi@163.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, wchen <waylingii@gmail.com>, 
	Samuel Ortiz <sameo@rivosinc.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Charlie Jenkins <charlie@rivosinc.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 1/4] RISC-V: Add Svade and Svadu Extensions Support
Message-ID: <20240621-b22a7c677a8d61c26feaa75b@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-2-yongxuan.wang@sifive.com>
 <20240621-d1b77d43adacaa34337238c2@orel>
 <20240621-nutty-penknife-ca541ee5108d@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621-nutty-penknife-ca541ee5108d@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_034236_285223_3297BBB5 
X-CRM114-Status: GOOD (  35.97  )
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

On Fri, Jun 21, 2024 at 11:24:19AM GMT, Conor Dooley wrote:
> On Fri, Jun 21, 2024 at 10:43:58AM +0200, Andrew Jones wrote:
> > On Wed, Jun 05, 2024 at 08:15:07PM GMT, Yong-Xuan Wang wrote:
> > > Svade and Svadu extensions represent two schemes for managing the PTE A/D
> > > bits. When the PTE A/D bits need to be set, Svade extension intdicates
> > > that a related page fault will be raised. In contrast, the Svadu extension
> > > supports hardware updating of PTE A/D bits. Since the Svade extension is
> > > mandatory and the Svadu extension is optional in RVA23 profile, by default
> > > the M-mode firmware will enable the Svadu extension in the menvcfg CSR
> > > when only Svadu is present in DT.
> > > 
> > > This patch detects Svade and Svadu extensions from DT and adds
> > > arch_has_hw_pte_young() to enable optimization in MGLRU and
> > > __wp_page_copy_user() when we have the PTE A/D bits hardware updating
> > > support.
> > > 
> > > Co-developed-by: Jinyu Tang <tjytimi@163.com>
> > > Signed-off-by: Jinyu Tang <tjytimi@163.com>
> > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > ---
> > >  arch/riscv/Kconfig               |  1 +
> > >  arch/riscv/include/asm/csr.h     |  1 +
> > >  arch/riscv/include/asm/hwcap.h   |  2 ++
> > >  arch/riscv/include/asm/pgtable.h | 14 +++++++++++++-
> > >  arch/riscv/kernel/cpufeature.c   |  2 ++
> > >  5 files changed, 19 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index b94176e25be1..dbfe2be99bf9 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -36,6 +36,7 @@ config RISCV
> > >  	select ARCH_HAS_PMEM_API
> > >  	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
> > >  	select ARCH_HAS_PTE_SPECIAL
> > > +	select ARCH_HAS_HW_PTE_YOUNG
> > >  	select ARCH_HAS_SET_DIRECT_MAP if MMU
> > >  	select ARCH_HAS_SET_MEMORY if MMU
> > >  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
> > > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > > index 25966995da04..524cd4131c71 100644
> > > --- a/arch/riscv/include/asm/csr.h
> > > +++ b/arch/riscv/include/asm/csr.h
> > > @@ -195,6 +195,7 @@
> > >  /* xENVCFG flags */
> > >  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
> > >  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> > > +#define ENVCFG_ADUE			(_AC(1, ULL) << 61)
> > >  #define ENVCFG_CBZE			(_AC(1, UL) << 7)
> > >  #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
> > >  #define ENVCFG_CBIE_SHIFT		4
> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > > index e17d0078a651..35d7aa49785d 100644
> > > --- a/arch/riscv/include/asm/hwcap.h
> > > +++ b/arch/riscv/include/asm/hwcap.h
> > > @@ -81,6 +81,8 @@
> > >  #define RISCV_ISA_EXT_ZTSO		72
> > >  #define RISCV_ISA_EXT_ZACAS		73
> > >  #define RISCV_ISA_EXT_XANDESPMU		74
> > > +#define RISCV_ISA_EXT_SVADE             75
> > > +#define RISCV_ISA_EXT_SVADU		76
> > >  
> > >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> > >  
> > > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > > index aad8b8ca51f1..7287ea4a6160 100644
> > > --- a/arch/riscv/include/asm/pgtable.h
> > > +++ b/arch/riscv/include/asm/pgtable.h
> > > @@ -120,6 +120,7 @@
> > >  #include <asm/tlbflush.h>
> > >  #include <linux/mm_types.h>
> > >  #include <asm/compat.h>
> > > +#include <asm/cpufeature.h>
> > >  
> > >  #define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
> > >  
> > > @@ -288,7 +289,6 @@ static inline pte_t pud_pte(pud_t pud)
> > >  }
> > >  
> > >  #ifdef CONFIG_RISCV_ISA_SVNAPOT
> > > -#include <asm/cpufeature.h>
> > >  
> > >  static __always_inline bool has_svnapot(void)
> > >  {
> > > @@ -624,6 +624,18 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
> > >  	return __pgprot(prot);
> > >  }
> > >  
> > > +/*
> > > + * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
> > > + * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
> > > + * DT.
> > > + */
> > > +#define arch_has_hw_pte_young arch_has_hw_pte_young
> > > +static inline bool arch_has_hw_pte_young(void)
> > > +{
> > > +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU) &&
> > > +	       !riscv_has_extension_likely(RISCV_ISA_EXT_SVADE);
> > 
> > It's hard to guess what is, or will be, more likely to be the correct
> > choice of call between the _unlikely and _likely variants. But, while we
> > assume svade is most prevalent right now, it's actually quite unlikely
> > that 'svade' will be in the DT, since DTs haven't been putting it there
> > yet. Anyway, it doesn't really matter much and maybe the _unlikely vs.
> > _likely variants are better for documenting expectations than for
> > performance.
> 
> binding hat off, and kernel hat on, what do we actually do if there's
> neither Svadu or Svade in the firmware's description of the hardware?
> Do we just arbitrarily turn on Svade, like we already do for some
> extensions:
> 	/*
> 	 * These ones were as they were part of the base ISA when the
> 	 * port & dt-bindings were upstreamed, and so can be set
> 	 * unconditionally where `i` is in riscv,isa on DT systems.
> 	 */
> 	if (acpi_disabled) {
> 		set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
> 		set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
> 		set_bit(RISCV_ISA_EXT_ZICNTR, isainfo->isa);
> 		set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
> 	}
>

Yes, I think that's reasonable, assuming we do it in the final "pass",
where we're sure svadu isn't present. Doing this is a good idea since
we'll be able to simplify conditions, as we can just use 'if (svade)'
since !svade would imply svadu. With FWFT and both, we'll want to remove
svade from the isa bitmap when enabling svadu.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
