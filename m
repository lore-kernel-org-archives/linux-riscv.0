Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6448EC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 07:09:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E10066501D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 07:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E10066501D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qH0uL80w2pJLYwpmu1wnF82Xly/+tHPn2Z19wRl7/KI=; b=STRCIEbpyDpzIl2QMbXh/vE2j
	TH3umsk0ohXyO8uHrzXctUtqY3TssLexbomKV8OtCShvPax5LiBMruGSQBYo4yH21gcBEzMzl7eiK
	+H3YCCQ+1Qxq3UgV2lCNBD1HO9Xkbrj0J2Q6hHkObz/+AbizrFm9t/AlCv5hg7P3qblxHsFGcQKEH
	PWR6BwARdn2cVTUI6IK6OjXk3mVkOQx18Qc9LUMXLmeu0M1ExV1HaUddF3Caawcr1D8QlA+Eo+t8r
	aNwaqJ3zIbO23o1uQf2Qyfm7QNpiPSRnSB7kZPF0hhJ1jhwE9p4X5vHKQ/kiTq1Wc9ch45f2Rn3Bd
	LBFozIcvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKFRt-008aL5-4f; Thu, 11 Mar 2021 07:09:33 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKFRn-008aJ4-8F
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 07:09:30 +0000
Received: by mail-pj1-x102f.google.com with SMTP id w8so2994938pjf.4
 for <linux-riscv@lists.infradead.org>; Wed, 10 Mar 2021 23:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3YDm9QnltVugRFkFtX8Y5r6F1uuE24N5nVMyfIZOtjI=;
 b=BFpIqDTcn4IG6WeueM3lyXMYcgWJOgBYMLZuioMEBdKn4JS255YYAuGg/wHi8FKK2q
 sKu9nlauRut2lUTSWkuzhj0a3yqIDiAFa/pL7vY2KumWeJBsJg6Ok4e904YeKREkSNCt
 YUXIdjDHwnTNQI8Ux5fkESAkKh6XQhBwR6TReYWW/qE/l27vsywPYRANrESGZP+a+vKW
 i1jdHkwaAOSV6ZF4dN+tj0c9mf9U4fmGigOHXR7E3WbiwoJt5XbgvJ748K1uAWYfiB3M
 dcvySBcijgoc91I+icOVH9/E9P9czNNDFkZTx/ICTRR9Is3dnpyTVZQeQkEAXok4KMNn
 I9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3YDm9QnltVugRFkFtX8Y5r6F1uuE24N5nVMyfIZOtjI=;
 b=NSGqJ74kc6F5c1jIKLkg2ozRPmE7z+ZdMmqn0+ZbYRUrzrMqAGKbJ9pzqOBWnPkVTl
 jImwLUebXVwWWQIFFRPOTsDjhcUJBraDTKU8gto9d2L3vsWkwyTzW70X1mTfkHl2aSJF
 K2qGywpT2B96K9jfel54yNAefANqWzV4pva5huqHhpxCjjhU6KGqx3lRcbmgWEM1La8V
 gb4cfwDBDlN9ChYoNaYLwxD8FsPNqgI+JL1i0Hhi/d/1+rFnjcAE8PhdzKXHcuVN1HUs
 LB+7yA5Q1sGaRoXlvZNy4UHxHdWO7/STth1bwTRZwmmN2hfkmrJC9WilgPrJKlktShR5
 6Eiw==
X-Gm-Message-State: AOAM532BcTscdRh7kz89INJwXxn5UeUd8gN1wks1pMNxEGHlL5iDaVP8
 HNLf3H0aQLt2WCQwWqW9F0GXwZcOki+zwMzsMZCCEQ==
X-Google-Smtp-Source: ABdhPJxsPqfLVnM+xYhETLcv++G+9WruJ3dF9Z1/ZsGFBWoxs/QpGk5ZHjv0wQyOKVxU17eQv8OG5sxGtPsfhN8tlzg=
X-Received: by 2002:a17:902:a707:b029:e6:52fd:a14d with SMTP id
 w7-20020a170902a707b02900e652fda14dmr6969190plq.34.1615446565658; Wed, 10 Mar
 2021 23:09:25 -0800 (PST)
MIME-Version: 1.0
References: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
 <mhng-75c82ab1-f0f5-4738-b020-364d1a1d295f@penguin>
In-Reply-To: <mhng-75c82ab1-f0f5-4738-b020-364d1a1d295f@penguin>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 11 Mar 2021 15:09:14 +0800
Message-ID: <CABvJ_xj185GgdPkO974mz26bPgqzHgeOcnqbDLkxxaZgicxrnw@mail.gmail.com>
Subject: Re: [RFC patch 0/4] riscv: introduce alternative mechanism to apply
 errata patches
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Frank.Zhao@starfivetech.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Guo Ren <guoren@kernel.org>, 
 Alan Kao <alankao@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_070927_437345_C151FA8F 
X-CRM114-Status: GOOD (  36.10  )
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

On Wed, Mar 10, 2021 at 12:39 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Sun, 07 Mar 2021 19:58:13 PST (-0800), vincent.chen@sifive.com wrote:
> > With the emergence of more and more RISC-V CPUs, the request for how to
> > upstream the vendor errata patch may gradually appear. In order to resolve
> > this issue, this patch introduces the alternative mechanism from ARM64 and
> > x86 to enable the kernel to patch code at runtime according to the
> > manufacturer information of the running CPU. The main purpose of this patch
> > set is to propose a framework to apply vendor's errata solutions. Based on
> > this framework, it can be ensured that the errata only applies to the
> > specified CPU cores. Other CPU cores do not be affected. Therefore, some
> > complicated scenarios are unsupported in this patch set, such as patching
> > code to the kernel module, doing relocation in patching code, and
> > heterogeneous CPU topology.
> >
> > In the "alternative" scheme, Users could use the macro ALTERNATIVE to apply
> > an errata to the existing code flow. In the macro ALTERNATIVE, users need
> > to specify the manufacturer information (vendor id, arch id, and implement
> > id) for this errata. Therefore, kernel will know this errata is suitable
> > for which CPU core. During the booting procedure, kernel will select the
> > errata required by the CPU core and then patch it. It means that the kernel
> > only applies the errata to the specified CPU core. In this case, the
> > vendor's errata does not affect each other at runtime. The above patching
> > procedure only occurs during the booting phase, so we only take the
> > overhead of the "alternative" mechanism once.
> >
> > This "alternative" mechanism is enabled by default to ensure that all
> > required errata will be applied. However, users can disable this feature by
> > the Kconfig "CONFIG_RISCV_ERRATA_ALTERNATIVE".
>
> This all generally seems OK to me, though I have a few comments in the actual
> patches.
>
> >
> > The last patch is to apply the SiFive CIP-453 errata by this "alternative"
> > scheme. Therefore, It can be regarded as an example. According to the
> > results of running this image on the QEMU virt platform, kernel does not
> > apply this errata at run-time because the CPU manufacturer information
> > does not match the specified SiFive CPU core. Therefore, this errata does
> > not affect any CPU core except for the specified SiFive cores.
>
> Looking at the documentation for that I also saw CIP-1200.  That one seems way
> scarier, and also probably a better driver for building an errata framework as
> it has more than one caller.  Is that in this chip?  It's in a document just
> titled "Errata_FU740-C000_20210205".
>
This chip has the CIP-1200 issue, and we had a patch using this
alternative scheme to apply this errata. The code is like below:
 static inline void local_flush_tlb_page(unsigned long addr)
 {
-        __asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
+       __asm__ __volatile__(
+       ALTERNATIVE("sfence.vma %0", "sfence.vma",SIFIVE_VENDOR_ID,
ERRATA_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)
+       :
+       : "r" (addr)
+       : "memory");
 }
We originally plan to send this errata patch after each vendor accepts
this alternative framework.

> >
> > Vincent Chen (4):
> >   riscv: Add 3 SBI wrapper functions to get cpu manufacturer information
> >   riscv: Get CPU manufacturer information
> >   riscv: Introduce alternative mechanism to apply errata solution
> >   riscv: sifive: apply errata "cip-453" patch
> >
> >  arch/riscv/Kconfig                          |   1 +
> >  arch/riscv/Kconfig.erratas                  |  32 ++++++++
> >  arch/riscv/Kconfig.socs                     |   1 +
> >  arch/riscv/Makefile                         |   1 +
> >  arch/riscv/errata/Makefile                  |   2 +
> >  arch/riscv/errata/alternative.c             |  69 +++++++++++++++++
> >  arch/riscv/errata/sifive/Makefile           |   2 +
> >  arch/riscv/errata/sifive/errata.c           |  56 ++++++++++++++
> >  arch/riscv/errata/sifive/errata_cip_453.S   |  34 +++++++++
> >  arch/riscv/include/asm/alternative-macros.h | 110 ++++++++++++++++++++++++++++
> >  arch/riscv/include/asm/alternative.h        |  44 +++++++++++
> >  arch/riscv/include/asm/asm.h                |   1 +
> >  arch/riscv/include/asm/csr.h                |   3 +
> >  arch/riscv/include/asm/errata_list.h        |   9 +++
> >  arch/riscv/include/asm/hwcap.h              |   6 ++
> >  arch/riscv/include/asm/processor.h          |   2 +
> >  arch/riscv/include/asm/sbi.h                |   3 +
> >  arch/riscv/include/asm/sections.h           |   2 +
> >  arch/riscv/include/asm/soc.h                |   1 +
> >  arch/riscv/include/asm/vendorid_list.h      |   6 ++
> >  arch/riscv/kernel/cpufeature.c              |  17 +++++
> >  arch/riscv/kernel/entry.S                   |  12 ++-
> >  arch/riscv/kernel/sbi.c                     |  15 ++++
> >  arch/riscv/kernel/setup.c                   |   2 +
> >  arch/riscv/kernel/smpboot.c                 |   4 +
> >  arch/riscv/kernel/soc.c                     |   1 +
> >  arch/riscv/kernel/vmlinux.lds.S             |  14 ++++
> >  27 files changed, 448 insertions(+), 2 deletions(-)
> >  create mode 100644 arch/riscv/Kconfig.erratas
> >  create mode 100644 arch/riscv/errata/Makefile
> >  create mode 100644 arch/riscv/errata/alternative.c
> >  create mode 100644 arch/riscv/errata/sifive/Makefile
> >  create mode 100644 arch/riscv/errata/sifive/errata.c
> >  create mode 100644 arch/riscv/errata/sifive/errata_cip_453.S
> >  create mode 100644 arch/riscv/include/asm/alternative-macros.h
> >  create mode 100644 arch/riscv/include/asm/alternative.h
> >  create mode 100644 arch/riscv/include/asm/errata_list.h
> >  create mode 100644 arch/riscv/include/asm/vendorid_list.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
