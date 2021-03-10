Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12E0C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 02:51:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E20864FD2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 02:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E20864FD2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+vCEiwTHzFZtfK03ESpUETMdPjtkaNcpF+hra1ofxjo=; b=riJyq7G/0ELgxsnNQmBXfT/cg
	DzSUv5d3H+Lfsf1Bea416NUGPkGMOwjRUNsLUbaK1tP7c7LVFwU3SieX2kK4buoMNAajh2fbOVDaF
	ZDbWLXf7O9pA2hsFF9GGyimSrkyNIsQbnLouer0PXeS+yQ0c9vZ/5TkmerG4Rjxt6v4CfMX0PqkpB
	bnR7UQNjNZVY6sgMjYUI6ZzkoQtCsakvve2c8EL/6MpwOR5cb+rGBi2PmfirZ4wqiFduUaz6AyGMt
	WTSf9JStekcOKxdw7xQqYUPvmTCmQxaV+lZnhfQrW1wowzBhnXCViP9zXJQPs7xIxOVj45NORfK9g
	j2EhrQEgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJowS-005pry-19; Wed, 10 Mar 2021 02:51:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJowK-005ppz-3o
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 02:51:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8883D64FD8
 for <linux-riscv@lists.infradead.org>; Wed, 10 Mar 2021 02:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615344668;
 bh=Mv3izmttCIaxZNBg6j5KK8G+uj2RacC7Xfy+14CSweQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WNxa9n62Du0xP2TsfnU8xpj8Lxr7FTojC+50A95Wh/ydcPjxBEDDXCzKxTaeCSFfc
 Y27u4HQoiNihpIz1DLAuqdKyl2tGKNKauVU31BtoYXuEtB9p7k3Bl7DIpMpYDSyzKr
 oZdaK41+QSIlIzDFKxFCxvA8+BATqrBLqlIapjL6NTZg5R8jcEgevSXKSPnkJfQju3
 TsVubnppcihivMs06sxH+h5EmRBFJwSoy59zVoW1XzNB5iQPafVJvCNXaMHFIeuqUp
 S/+HvwOMtFrjn2QihAcxVt8a3w9y5cR3oCI8wZ5FftSXzXeE6NQdvQBUcY5XQtnBsr
 2Rz6eFtpdUhCw==
Received: by mail-lf1-f45.google.com with SMTP id f1so30885557lfu.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 18:51:08 -0800 (PST)
X-Gm-Message-State: AOAM530T2zonI43Vz0efVdfVOnxU/Kl86L60CGCsMvr4WwEi/92nsWrS
 94/Dor4Oee7B1YXlOnFQwtA31fdcW9ZHAI0Qhgk=
X-Google-Smtp-Source: ABdhPJzO/BFxC8uelophGBVWN1zoKWY9IDrxq+wLKRXh5UefdsmELmTMLa6Db5w7YTPtQ9T1I2wxxNOSjvAPL0bWKLg=
X-Received: by 2002:a05:6512:2288:: with SMTP id
 f8mr696968lfu.346.1615344666746; 
 Tue, 09 Mar 2021 18:51:06 -0800 (PST)
MIME-Version: 1.0
References: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
 <1615175897-23509-3-git-send-email-vincent.chen@sifive.com>
 <CAJF2gTR6e2=mL3BUt-QDt21RxJdxEPa7b+MMJ7TsDmmnDHCu1w@mail.gmail.com>
 <CAAhSdy1skWAbBJGukg-mu4kFaknn56meVi5PbbW4fCoaKGopKg@mail.gmail.com>
In-Reply-To: <CAAhSdy1skWAbBJGukg-mu4kFaknn56meVi5PbbW4fCoaKGopKg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 10 Mar 2021 10:50:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS1ygz+q-MfmZ-0K6wEg4MnUQTcudqw389f_hRSmzUgbQ@mail.gmail.com>
Message-ID: <CAJF2gTS1ygz+q-MfmZ-0K6wEg4MnUQTcudqw389f_hRSmzUgbQ@mail.gmail.com>
Subject: Re: [RFC patch 2/4] riscv: Get CPU manufacturer information
To: Anup Patel <anup@brainfault.org>
Cc: Vincent Chen <vincent.chen@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Frank.Zhao@starfivetech.com, 
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>, 
 Alan Kao <alankao@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_025112_623936_08B539D4 
X-CRM114-Status: GOOD (  25.07  )
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

Got it. Thx

On Tue, Mar 9, 2021 at 1:11 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Mar 9, 2021 at 6:58 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > Hi Vincent,
> >
> > On Mon, Mar 8, 2021 at 11:58 AM Vincent Chen <vincent.chen@sifive.com> wrote:
> > >
> > > Issue 3 SBI calls to get the vendor ID, architecture ID and implementation
> > > ID early in boot so we only need to take the SBI call overhead once.
> > >
> > > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > > ---
> > >  arch/riscv/include/asm/csr.h       |  3 +++
> > >  arch/riscv/include/asm/hwcap.h     |  6 ++++++
> > >  arch/riscv/include/asm/processor.h |  2 ++
> > >  arch/riscv/include/asm/soc.h       |  1 +
> > >  arch/riscv/kernel/cpufeature.c     | 17 +++++++++++++++++
> > >  arch/riscv/kernel/setup.c          |  2 ++
> > >  arch/riscv/kernel/soc.c            |  1 +
> > >  7 files changed, 32 insertions(+)
> > >
> > > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > > index caadfc1d7487..87ac65696871 100644
> > > --- a/arch/riscv/include/asm/csr.h
> > > +++ b/arch/riscv/include/asm/csr.h
> > > @@ -115,6 +115,9 @@
> > >  #define CSR_MIP                        0x344
> > >  #define CSR_PMPCFG0            0x3a0
> > >  #define CSR_PMPADDR0           0x3b0
> > > +#define CSR_MVENDORID          0xf11
> > > +#define CSR_MARCHID            0xf12
> > > +#define CSR_MIMPID             0xf13
> > >  #define CSR_MHARTID            0xf14
> > >
> > >  #ifdef CONFIG_RISCV_M_MODE
> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > > index 5ce50468aff1..b7409487c9d2 100644
> > > --- a/arch/riscv/include/asm/hwcap.h
> > > +++ b/arch/riscv/include/asm/hwcap.h
> > > @@ -44,6 +44,12 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
> > >  #define riscv_isa_extension_available(isa_bitmap, ext) \
> > >         __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
> > >
> > > +struct cpu_manufacturer_info_t {
> > > +       unsigned long vendor_id;
> > > +       unsigned long arch_id;
> > > +       unsigned long imp_id;
> > > +};
> > > +
> > >  #endif
> > >
> > >  #endif /* _ASM_RISCV_HWCAP_H */
> > > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > > index 3a240037bde2..4e11a9621d14 100644
> > > --- a/arch/riscv/include/asm/processor.h
> > > +++ b/arch/riscv/include/asm/processor.h
> > > @@ -72,6 +72,8 @@ int riscv_of_parent_hartid(struct device_node *node);
> > >
> > >  extern void riscv_fill_hwcap(void);
> > >
> > > +void riscv_fill_cpu_manufacturer_info(void);
> > > +
> > >  #endif /* __ASSEMBLY__ */
> > >
> > >  #endif /* _ASM_RISCV_PROCESSOR_H */
> > > diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
> > > index f494066051a2..03dee6db404c 100644
> > > --- a/arch/riscv/include/asm/soc.h
> > > +++ b/arch/riscv/include/asm/soc.h
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/of.h>
> > >  #include <linux/linkage.h>
> > >  #include <linux/types.h>
> > > +#include <asm/hwcap.h>
> > >
> > >  #define SOC_EARLY_INIT_DECLARE(name, compat, fn)                       \
> > >         static const struct of_device_id __soc_early_init__##name       \
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index ac202f44a670..389162ee19ea 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -12,6 +12,8 @@
> > >  #include <asm/hwcap.h>
> > >  #include <asm/smp.h>
> > >  #include <asm/switch_to.h>
> > > +#include <asm/sbi.h>
> > > +#include <asm/csr.h>
> > >
> > >  unsigned long elf_hwcap __read_mostly;
> > >
> > > @@ -22,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> > >  bool has_fpu __read_mostly;
> > >  #endif
> > >
> > > +struct cpu_manufacturer_info_t cpu_mfr_info;
> > > +
> > >  /**
> > >   * riscv_isa_extension_base() - Get base extension word
> > >   *
> > > @@ -149,3 +153,16 @@ void riscv_fill_hwcap(void)
> > >                 has_fpu = true;
> > >  #endif
> > >  }
> > > +
> > > +void riscv_fill_cpu_manufacturer_info(void)
> > > +{
> > > +#ifndef CONFIG_RISCV_M_MODE
> > > +       cpu_mfr_info.vendor_id = sbi_get_vendorid();
> > > +       cpu_mfr_info.arch_id = sbi_get_archid();
> > > +       cpu_mfr_info.imp_id = sbi_get_impid();
> > > +#else
> > > +       cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
> > > +       cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
> > > +       cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
> > > +#endif
> > How about let opensbi emulate csr_read(CSR_MXXX) for S mode, then we
> > needn't to define new sbi call.
>
> Accessing M-mode CSRs from the S-mode kernel will only make things
> complicated for hypervisors because now hypervisors will also end-up
> emulating M-mode CSRs.
>
> Best would be to only access S-mode CSRs and SBI calls from
> S-mode kernel.
>
> >
> > > +}
> > > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > > index e85bacff1b50..03621ce9092c 100644
> > > --- a/arch/riscv/kernel/setup.c
> > > +++ b/arch/riscv/kernel/setup.c
> > > @@ -278,6 +278,8 @@ void __init setup_arch(char **cmdline_p)
> > >  #endif
> > >
> > >         riscv_fill_hwcap();
> > > +
> > > +       riscv_fill_cpu_manufacturer_info();
> > >  }
> > >
> > >  static int __init topology_init(void)
> > > diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
> > > index a0516172a33c..58f6fd91743a 100644
> > > --- a/arch/riscv/kernel/soc.c
> > > +++ b/arch/riscv/kernel/soc.c
> > > @@ -6,6 +6,7 @@
> > >  #include <linux/libfdt.h>
> > >  #include <linux/pgtable.h>
> > >  #include <asm/soc.h>
> > > +#include <asm/hwcap.h>
> > >
> > >  /*
> > >   * This is called extremly early, before parse_dtb(), to allow initializing
> > > --
> > > 2.7.4
> > >
> > How
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
