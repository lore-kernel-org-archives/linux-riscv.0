Return-Path: <SRS0=trcm=IH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE624C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 05:11:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36F0065244
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 05:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36F0065244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h0/78GW0SIeIBJbWsmZ06PrOBHORU5KEH9FOlX9p9QQ=; b=PqbqiiySucOfN5nZLOMuFA4gi
	cpHk+AIBEMviXZC9bhOnAqSXPmB934oQFctcX4BBbpZ2oYj+kRZ58i28MrLWKkJgPacFUPRXIakqL
	vwfZsc0zoMh2Mrrc0ruevCo3A7zEXxqvmChn9tG3A0pyj8s3aYD8OfsqNx2ObajEaPs9CPiQkeHNZ
	9ifn8SeU4P1MpwKwshjHtN3bv26BKV4bxkwcLxmQRBbG6j6WCTTCggIucNlq+eKWh82e/8pxWYrGz
	cJQeXGP73naoUXbEmUqmpF9V7aL/OH8M3fyushmPffmJJBql6Fi8ltVUfI+FuLJ5v2+KOKfOKnjfA
	SVTyy28nA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJUeU-003n4c-By; Tue, 09 Mar 2021 05:11:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJUeL-003n2o-Lr
 for linux-riscv@lists.infradead.org; Tue, 09 Mar 2021 05:11:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id l12so13800380wry.2
 for <linux-riscv@lists.infradead.org>; Mon, 08 Mar 2021 21:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cCeZJpfF1bO/bu/rn24bhGoNmjzLa+ozfE1tRwjqdCI=;
 b=Cj1lZXfVpqmcBb7C5QpmgmNrJksC3O/NELMaPwE3KX1cQ1nxzTzxJh/TOkUbOqK+BV
 PxaHKOwWFhLeX+/0SzjaBHdcwtm80T6JHkRdZveVqyHh3cdD4iY0dt5CopM6eRNypJbx
 gVCKp6pkoEpZn6C3wIPnzYPeJ6w2s2mIxeQ1G+WPOODiExHYHoPudLmHuhRDea3zugPt
 8jykfOYVM1r5u7Mjh453me3bUkQ+wHWiEY9Z21Z9iHTal+LkiO19EcMkGhOfb5Z18N4M
 sOQZdr+g66ALAUh7BW9qioM2Spq5/ntwa1Tjh+mc4GuZ1Gft7lp0YaIB32EUxVQzhiU/
 W3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cCeZJpfF1bO/bu/rn24bhGoNmjzLa+ozfE1tRwjqdCI=;
 b=hvkRKUhuMst5coPqaRZLLylAA7ja/1EQKqNgbJf/FS/A3a3pQOHdpLclXv1qaDwtf8
 TsfmqxKigAEypFYtYyAKO7zr+pjoyQrViK3XI0saK6ti4LLJtYgNBqU6UcERmWL/CNvP
 doHSjG549kp0z8vq26cb37fsnE/huipl9atYt4cjSQbzInm1XYwu1nFeCN7zasLHmDFx
 FBODJ+qM4hPs8jZQkLQRg9eNAHoVWsZ8HLKCreEI6HrytvrBbaqUTjTDLjkgNBO7Sh6M
 4Iyiv2pUgTbDi57lSpVMvMY/MUNLmrBXmajKq/UvwHIMmuv1PVG4g3C9ahQp/QHLeUgu
 GkNQ==
X-Gm-Message-State: AOAM53257I/yXA2mx93FyfQXkYEru9o6iHVuc4skdT4UwhXbicxn0+h4
 41PFhqZBUjqMvJT4cL2nNuUxjdwab9tqxOhHBCzQU36kMI8=
X-Google-Smtp-Source: ABdhPJyEajx/RhfNjl10fKLIFugVNpO1HBIUY+qtGryj34gBFJcOgHA7i/3vbYuLM9eYwAjf5g5ZAwETErWJtNFkgcE=
X-Received: by 2002:a5d:5744:: with SMTP id q4mr26867558wrw.390.1615266676084; 
 Mon, 08 Mar 2021 21:11:16 -0800 (PST)
MIME-Version: 1.0
References: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
 <1615175897-23509-3-git-send-email-vincent.chen@sifive.com>
 <CAJF2gTR6e2=mL3BUt-QDt21RxJdxEPa7b+MMJ7TsDmmnDHCu1w@mail.gmail.com>
In-Reply-To: <CAJF2gTR6e2=mL3BUt-QDt21RxJdxEPa7b+MMJ7TsDmmnDHCu1w@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Mar 2021 10:41:04 +0530
Message-ID: <CAAhSdy1skWAbBJGukg-mu4kFaknn56meVi5PbbW4fCoaKGopKg@mail.gmail.com>
Subject: Re: [RFC patch 2/4] riscv: Get CPU manufacturer information
To: Guo Ren <guoren@kernel.org>
Cc: Vincent Chen <vincent.chen@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Frank.Zhao@starfivetech.com, 
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>, 
 Alan Kao <alankao@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_051118_093500_0E25D292 
X-CRM114-Status: GOOD (  24.15  )
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

On Tue, Mar 9, 2021 at 6:58 AM Guo Ren <guoren@kernel.org> wrote:
>
> Hi Vincent,
>
> On Mon, Mar 8, 2021 at 11:58 AM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > Issue 3 SBI calls to get the vendor ID, architecture ID and implementation
> > ID early in boot so we only need to take the SBI call overhead once.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> > ---
> >  arch/riscv/include/asm/csr.h       |  3 +++
> >  arch/riscv/include/asm/hwcap.h     |  6 ++++++
> >  arch/riscv/include/asm/processor.h |  2 ++
> >  arch/riscv/include/asm/soc.h       |  1 +
> >  arch/riscv/kernel/cpufeature.c     | 17 +++++++++++++++++
> >  arch/riscv/kernel/setup.c          |  2 ++
> >  arch/riscv/kernel/soc.c            |  1 +
> >  7 files changed, 32 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> > index caadfc1d7487..87ac65696871 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -115,6 +115,9 @@
> >  #define CSR_MIP                        0x344
> >  #define CSR_PMPCFG0            0x3a0
> >  #define CSR_PMPADDR0           0x3b0
> > +#define CSR_MVENDORID          0xf11
> > +#define CSR_MARCHID            0xf12
> > +#define CSR_MIMPID             0xf13
> >  #define CSR_MHARTID            0xf14
> >
> >  #ifdef CONFIG_RISCV_M_MODE
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 5ce50468aff1..b7409487c9d2 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -44,6 +44,12 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
> >  #define riscv_isa_extension_available(isa_bitmap, ext) \
> >         __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
> >
> > +struct cpu_manufacturer_info_t {
> > +       unsigned long vendor_id;
> > +       unsigned long arch_id;
> > +       unsigned long imp_id;
> > +};
> > +
> >  #endif
> >
> >  #endif /* _ASM_RISCV_HWCAP_H */
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index 3a240037bde2..4e11a9621d14 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -72,6 +72,8 @@ int riscv_of_parent_hartid(struct device_node *node);
> >
> >  extern void riscv_fill_hwcap(void);
> >
> > +void riscv_fill_cpu_manufacturer_info(void);
> > +
> >  #endif /* __ASSEMBLY__ */
> >
> >  #endif /* _ASM_RISCV_PROCESSOR_H */
> > diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
> > index f494066051a2..03dee6db404c 100644
> > --- a/arch/riscv/include/asm/soc.h
> > +++ b/arch/riscv/include/asm/soc.h
> > @@ -10,6 +10,7 @@
> >  #include <linux/of.h>
> >  #include <linux/linkage.h>
> >  #include <linux/types.h>
> > +#include <asm/hwcap.h>
> >
> >  #define SOC_EARLY_INIT_DECLARE(name, compat, fn)                       \
> >         static const struct of_device_id __soc_early_init__##name       \
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index ac202f44a670..389162ee19ea 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -12,6 +12,8 @@
> >  #include <asm/hwcap.h>
> >  #include <asm/smp.h>
> >  #include <asm/switch_to.h>
> > +#include <asm/sbi.h>
> > +#include <asm/csr.h>
> >
> >  unsigned long elf_hwcap __read_mostly;
> >
> > @@ -22,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> >  bool has_fpu __read_mostly;
> >  #endif
> >
> > +struct cpu_manufacturer_info_t cpu_mfr_info;
> > +
> >  /**
> >   * riscv_isa_extension_base() - Get base extension word
> >   *
> > @@ -149,3 +153,16 @@ void riscv_fill_hwcap(void)
> >                 has_fpu = true;
> >  #endif
> >  }
> > +
> > +void riscv_fill_cpu_manufacturer_info(void)
> > +{
> > +#ifndef CONFIG_RISCV_M_MODE
> > +       cpu_mfr_info.vendor_id = sbi_get_vendorid();
> > +       cpu_mfr_info.arch_id = sbi_get_archid();
> > +       cpu_mfr_info.imp_id = sbi_get_impid();
> > +#else
> > +       cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
> > +       cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
> > +       cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
> > +#endif
> How about let opensbi emulate csr_read(CSR_MXXX) for S mode, then we
> needn't to define new sbi call.

Accessing M-mode CSRs from the S-mode kernel will only make things
complicated for hypervisors because now hypervisors will also end-up
emulating M-mode CSRs.

Best would be to only access S-mode CSRs and SBI calls from
S-mode kernel.

>
> > +}
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index e85bacff1b50..03621ce9092c 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -278,6 +278,8 @@ void __init setup_arch(char **cmdline_p)
> >  #endif
> >
> >         riscv_fill_hwcap();
> > +
> > +       riscv_fill_cpu_manufacturer_info();
> >  }
> >
> >  static int __init topology_init(void)
> > diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
> > index a0516172a33c..58f6fd91743a 100644
> > --- a/arch/riscv/kernel/soc.c
> > +++ b/arch/riscv/kernel/soc.c
> > @@ -6,6 +6,7 @@
> >  #include <linux/libfdt.h>
> >  #include <linux/pgtable.h>
> >  #include <asm/soc.h>
> > +#include <asm/hwcap.h>
> >
> >  /*
> >   * This is called extremly early, before parse_dtb(), to allow initializing
> > --
> > 2.7.4
> >
> How
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
