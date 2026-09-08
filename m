Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DD0C79F82
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 00:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7izUVooBPkGEOQHvD/42AM2mzx3X0QhbN+Xw2aUoLzk=; b=We2wh5bJnSYiSx
	HijDOvHlXwPTylCtmO18a+dEEoI1SJw+QdN+5TNs26/MFDovfF5cmfBUuFPScFzxbsY6+RglpSjWA
	Fb1Gy6+ylHYwNnVrggK62rXOvJE0olRmyFb0flfkal79LLR1NyFwd9vVsks1N4S4/92N+xXKENCRu
	+0XqyNP4XNcE818c25brNhA0fdXJ5nNO+iJ4cCWrJ32AgrolblgbldnXjSmYYszsAn9+wGaUC/mm5
	WDindJVemJRHfH/pF5AslyS8JLN/yWpX49RkvtSvFfckrdsEnATF6Egf98PzlG+qydme1wxB6QBT3
	0aYKssEpVeLzy6uorZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45po-0000000ATel-1oG2;
	Wed, 09 Sep 2026 00:06:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45pn-0000000ATec-1ab4
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 00:06:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F70B601DE;
	Wed,  9 Sep 2026 00:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C297F1F00A3A;
	Wed,  9 Sep 2026 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788912398;
	bh=5VkwzfEQ3AqwoySPvziM5UCoyVG+oj30LI1TinxVzSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O5Lozz++Am4VMj4wRqKD9Hlg9g5HVzhRohruRjK5ZgEmvKDb4rspoMYncO4FSJSbg
	 T+PleGFVazbelrI3vy0Apdey2iD4p+dsZEsVjmmd5/PNLfSBDMv0RQPcsmo3i8O53E
	 pnJncwfZBFtVMYBL0vB3swiA82F+iyrK3F7sKZQ8v3Tk3F1Mt7qJAUofU/DcwK8Uvx
	 Ej+5sggl8MCVS9wyoL5AZoR7s472nfnPrSMUJGOp4qM5FpKP8NXbvjWR9N9r5Bq8P8
	 6k3+m0eeIt+0VJh5XQR6A0ScV+lHzSM2p5K8angfPxYDyVKQni9KS3bgEGAbBFC/Tu
	 7zvtvMr+Q8Mdg==
Date: Wed, 9 Sep 2026 07:46:49 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 3/5] riscv: support early isa ext and use it to
 optimize pgtable_l4|l5_enabled
Message-ID: <aqCeaXYJEdW78PMV@xhacker>
References: <20260907151437.7603-1-jszhang@kernel.org>
 <20260907151437.7603-4-jszhang@kernel.org>
 <20260907-smashup-darn-93d1ee105a57@spud>
 <ap-EZ-rb7RJ5ykmG@xhacker>
 <20260908-baggie-tripping-c2cee6bb4947@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908-baggie-tripping-c2cee6bb4947@spud>
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

On Tue, Sep 08, 2026 at 02:00:18PM +0100, Conor Dooley wrote:
> On Tue, Sep 08, 2026 at 11:43:35AM +0800, Jisheng Zhang wrote:
> > On Mon, Sep 07, 2026 at 05:39:02PM +0100, Conor Dooley wrote:
> > > On Mon, Sep 07, 2026 at 11:14:35PM +0800, Jisheng Zhang wrote:
> > > > The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> > > > is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> > > > boot, we can use alternative mechanism to optimize them.
> > > > 
> > > > So the question is whether we can add RISCV_ISA_EXT_SV48/SV5 and use
> > > > riscv_has_extension_*() or not. Per [1] and [2], SV48 and SV57 are ISA
> > > > exensions too. From another side, riscv_has_extension_[un]likely() and
> > > > other related functions report whether the extension is supported and
> > > > enabled on the platform. So SV48 and SV57 can be supported with current
> > > > isa extension alternative mechanism.
> > > > 
> > > > However, to use it to optimize pgtable_l4|l5_enabled, we have support
> > > > the "early" characteristic, I.E besides risc_isa bitmap setting, we
> > > > need to support appling alternative early before MMU on.
> > > > 
> > > > After that, use it to optimize pgtable_l4|l5_enabled.
> > > > 
> > > > For the typical access_ok(addr, 1);
> > > > before the patch:
> > > > 
> > > > ...
> > > > auipc	a5,0xb43
> > > > lbu	a5,100(a5) # ffffffff80b51f68 <pgtable_l5_enabled>
> > > > bnez	a5,ffffffff8000ef46 <foo+0x56>
> > > > auipc	a5,0xb43
> > > > lbu	a5,91(a5) # ffffffff80b51f69 <pgtable_l4_enabled>
> > > > beqz	a5,ffffffff8000ef5a <foo+0x6a>
> > > > ...
> > > > 
> > > > after the patch:
> > > > These memory load and test branch instructions are replaced with only
> > > > two j or nop instructions.
> > > > 
> > > > Initial test lmbench's lat_syscall write on TH1520 platforms shows that
> > > > the write syscall latency is reduced by about 2.38%.
> > > > 
> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/profiles/profiles.adoc [1]
> > > > Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/16154732/Ratified+ISA+Extensions [2]
> > > > ---
> > > >  arch/riscv/Kconfig                   |  1 +
> > > >  arch/riscv/include/asm/alternative.h |  2 +-
> > > >  arch/riscv/include/asm/cpufeature.h  |  2 +
> > > >  arch/riscv/include/asm/hwcap.h       |  2 +
> > > >  arch/riscv/include/asm/pgtable-64.h  | 12 ++++++
> > > >  arch/riscv/kernel/alternative.c      | 24 +++++++----
> > > >  arch/riscv/kernel/cpufeature.c       | 60 ++++++++++++++++++++++------
> > > >  arch/riscv/mm/init.c                 |  9 +++++
> > > >  8 files changed, 91 insertions(+), 21 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index 13b7bb77087e..e9476b8cbeb0 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -218,6 +218,7 @@ config RISCV
> > > >  	select PCI_ECAM if (ACPI && PCI)
> > > >  	select PCI_MSI if PCI
> > > >  	select RELOCATABLE if !MMU && !PHYS_RAM_BASE_FIXED
> > > > +	select RISCV_ALTERNATIVE_EARLY if 64BIT
> > > >  	select RISCV_APLIC
> > > >  	select RISCV_IMSIC
> > > >  	select RISCV_INTC
> > > > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> > > > index 688c7d1a9ae3..6be7b2b6ade9 100644
> > > > --- a/arch/riscv/include/asm/alternative.h
> > > > +++ b/arch/riscv/include/asm/alternative.h
> > > > @@ -33,7 +33,7 @@ void __init apply_early_boot_alternatives(void);
> > > >  void apply_module_alternatives(void *start, size_t length);
> > > >  
> > > >  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > > > -				   int patch_offset);
> > > > +				   int patch_offset, bool early);
> > > >  
> > > >  struct alt_entry {
> > > >  	s32 old_offset;		/* offset relative to original instruction or data  */
> > > > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > > > index 37c9f2a0fb54..af18ba93f580 100644
> > > > --- a/arch/riscv/include/asm/cpufeature.h
> > > > +++ b/arch/riscv/include/asm/cpufeature.h
> > > > @@ -36,6 +36,8 @@ extern const struct seq_operations cpuinfo_op;
> > > >  /* Per-cpu ISA extensions. */
> > > >  extern struct riscv_isainfo hart_isa[NR_CPUS];
> > > >  
> > > > +extern DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
> > > > +
> > > >  extern u32 thead_vlenb_of;
> > > >  
> > > >  void __init riscv_user_isa_enable(void);
> > > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > > > index f8db798b2654..b6d50025cb79 100644
> > > > --- a/arch/riscv/include/asm/hwcap.h
> > > > +++ b/arch/riscv/include/asm/hwcap.h
> > > > @@ -122,6 +122,8 @@
> > > >  #define RISCV_ISA_EXT_ZICCAMOA		113
> > > >  #define RISCV_ISA_EXT_ZICCIF		114
> > > >  #define RISCV_ISA_EXT_ZA64RS		115
> > > > +#define RISCV_ISA_EXT_SV48		116
> > > > +#define RISCV_ISA_EXT_SV57		117
> > > >  
> > > >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> > > >  
> > > > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > > > index 72b8c63469fa..7e30ec0e9f6c 100644
> > > > --- a/arch/riscv/include/asm/pgtable-64.h
> > > > +++ b/arch/riscv/include/asm/pgtable-64.h
> > > > @@ -13,6 +13,7 @@
> > > >  extern bool _pgtable_l4_enabled;
> > > >  extern bool _pgtable_l5_enabled;
> > > >  
> > > > +#ifdef USE_EARLY_PGTABLE_LEVELS
> > > >  static __always_inline bool pgtable_l5_enabled(void)
> > > >  {
> > > >  	return _pgtable_l5_enabled;
> > > > @@ -22,6 +23,17 @@ static __always_inline bool pgtable_l4_enabled(void)
> > > >  {
> > > >  	return _pgtable_l4_enabled;
> > > >  }
> > > > +#else
> > > > +static __always_inline bool pgtable_l4_enabled(void)
> > > > +{
> > > > +	return riscv_has_extension_likely(RISCV_ISA_EXT_SV48);
> > > > +}
> > > > +
> > > > +static __always_inline bool pgtable_l5_enabled(void)
> > > > +{
> > > > +	return riscv_has_extension_likely(RISCV_ISA_EXT_SV57);
> > > > +}
> > > > +#endif
> > > >  
> > > >  #define PGDIR_SHIFT_L3  30
> > > >  #define PGDIR_SHIFT_L4  39
> > > > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> > > > index c0c9306022c5..bbb215349452 100644
> > > > --- a/arch/riscv/kernel/alternative.c
> > > > +++ b/arch/riscv/kernel/alternative.c
> > > > @@ -75,7 +75,8 @@ static u32 riscv_instruction_at(void *p)
> > > >  }
> > > >  
> > > >  static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
> > > > -					     u32 jalr_insn, int patch_offset)
> > > > +					     u32 jalr_insn, int patch_offset,
> > > > +					     bool early)
> > > >  {
> > > >  	u32 call[2] = { auipc_insn, jalr_insn };
> > > >  	s32 imm;
> > > > @@ -88,10 +89,15 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
> > > >  	riscv_insn_insert_utype_itype_imm(&call[0], &call[1], imm);
> > > >  
> > > >  	/* patch the call place again */
> > > > -	patch_text_nosync(ptr, call, sizeof(u32) * 2);
> > > > +	if (early) {
> > > > +		memcpy(ptr, call, sizeof(call));
> > > > +	} else {
> > > > +		patch_text_nosync(ptr, call, sizeof(call));
> > > > +	}
> > > >  }
> > > >  
> > > > -static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
> > > > +static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset,
> > > > +				      bool early)
> > > >  {
> > > >  	s32 imm;
> > > >  
> > > > @@ -103,11 +109,14 @@ static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
> > > >  	riscv_insn_insert_jtype_imm(&jal_insn, imm);
> > > >  
> > > >  	/* patch the call place again */
> > > > -	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> > > > +	if (early)
> > > > +		memcpy(ptr, &jal_insn, sizeof(u32));
> > > > +	else
> > > > +		patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> > > >  }
> > > >  
> > > >  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > > > -				      int patch_offset)
> > > > +				   int patch_offset, bool early)
> > > >  {
> > > >  	int num_insn = len / sizeof(u32);
> > > >  	int i;
> > > > @@ -131,7 +140,8 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > > >  				continue;
> > > >  
> > > >  			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
> > > > -							 insn, insn2, patch_offset);
> > > > +							 insn, insn2, patch_offset,
> > > > +							 early);
> > > >  			i++;
> > > >  		}
> > > >  
> > > > @@ -144,7 +154,7 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > > >  				continue;
> > > >  
> > > >  			riscv_alternative_fix_jal(alt_ptr + i * sizeof(u32),
> > > > -						  insn, patch_offset);
> > > > +						  insn, patch_offset, early);
> > > >  		}
> > > >  	}
> > > >  }
> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > > index 9915121e9438..ce08e7f19e2d 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -39,7 +39,7 @@ static bool any_cpu_has_zicbom;
> > > >  unsigned long elf_hwcap __read_mostly;
> > > >  
> > > >  /* Host ISA bitmap */
> > > > -static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> > > > +DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> > > >  
> > > >  /* Per-cpu ISA extensions. */
> > > >  struct riscv_isainfo hart_isa[NR_CPUS];
> > > > @@ -624,6 +624,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> > > >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > > >  	__RISCV_ISA_EXT_DATA(svrsw60t59b, RISCV_ISA_EXT_SVRSW60T59B),
> > > >  	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
> > > > +	__RISCV_ISA_EXT_DATA(sv48, RISCV_ISA_EXT_SV48),
> > > > +	__RISCV_ISA_EXT_DATA(sv57, RISCV_ISA_EXT_SV57),
> > > >  };
> > > >  
> > > >  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> > > > @@ -862,7 +864,8 @@ static void __init riscv_parse_isa_string(const char *isa, unsigned long *bitmap
> > > >  	}
> > > >  }
> > > >  
> > > > -static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> > > > +static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap,
> > > > +						    unsigned long *riscv_isa_early)
> > > 
> > > All of the "early" business in this file seems overly complicated. Can
> > > we just do something like this?
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index d2ec96843456..46715a0255c1 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -922,6 +922,11 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> > >  			set_bit(RISCV_ISA_EXT_ZIHPM, source_isa);
> > >  		}
> > >  
> > > +		if (_pgtable_l4_enabled)
> > > +			set_bit(RISCV_ISA_EXT_SV48, source_isa);
> > > +		if (_pgtable_l5_enabled)
> > > +			set_bit(RISCV_ISA_EXT_SV57, source_isa);
> > > +
> > >  		/*
> > >  		 * "V" in ISA strings is ambiguous in practice: it should mean
> > >  		 * just the standard V-1.0 but vendors aren't well behaved.
> > > @@ -1082,6 +1087,11 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> > >  			riscv_isa_set_ext(ext, source_isa);
> > >  		}
> > >  
> > > +		if (_pgtable_l4_enabled)
> > > +			set_bit(RISCV_ISA_EXT_SV48, source_isa);
> > > +		if (_pgtable_l5_enabled)
> > > +			set_bit(RISCV_ISA_EXT_SV57, source_isa);
> > > +
> > >  		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
> > >  		riscv_fill_cpu_vendor_ext(cpu_node, cpu);
> > > 
> > > The pagetable levels are the only thing we do this kind of early and
> > > probed detection for, adding a framework for them and only them that
> > > mostly just complicates the normal case seems rather excessive. Doing
> > > something simple like this is also quite explicit as to what's being
> > 
> > This assumes SV48 and SV57 are the only "early" users, but
> > other ISA ext may also need "early", who knows. So if future some extensions
> > need the "early", the code is ready, the author doesn't need to care about
> > the isa filling at all.
> > 
> > So I prefer my patch as is. What's your opinion?
> 
> We're about decade into the port being merged and this is the only thing

but the isa extension alternative is not, it was introduced by me three
years ago. But no matter how many years, 

> behaving in this way. I don't think the code in this patch is worth it on
> the off chance that something else comes along. If it does, we can

this makes sense. Let me cook a new version

> always fish this implementation back up and use it.

> 
> I'd also like to differentiate this code from "needing early", because
> this is about populating the information early in the extension bitmap,
> rather than about actually needing the information. There's no advantage

the code after arch/riscv/mm/init.c but before mmu on needs the
bitmap informaion when pgtable_l5|l4_enabled() is called (w/o
USE_EARLY_PGTABLE_LEVELS)

> gained, as far as I can tell, by setting this early and it only makes
> the code more complicated.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
