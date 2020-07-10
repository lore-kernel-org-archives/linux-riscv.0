Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BD9C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 02:44:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4146220663
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 02:44:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OZzzLftv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VJffGKFC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4146220663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5oL8059lJ0SxFpcFhqCoIlIHR0jheT8VVjIoxG7QkT0=; b=OZzzLftvwwIDUSH3AdJr8wTTW
	d0TVAnPPhnIgOciD+f28ry05cH3jkpgtupKoZx1N/PsNOBpk3tkrcAUsHC6VrAJaSRhPD2VpAV0/5
	P8MGU4jS3H59H+9dqaDYnynKNEVM/ZdAlChTjz01iXZG2hPeJ5AnKUddeTPLrVUxcv7Ds5PA7NT/v
	RgfD38vaCc+5eNiKBgVh8oKWXvFXYOkO9K5IfWTeMm/sI4GQLgDMiiTDYM1MhRpkJcttizcn0FU2V
	PoAP0WPC9JZipteS3iVl4h1OxdAHjq3j2G4zhhmyK2piEDC7RxjxwSS2qUPDk/oe1fG2MrRgs7Gd0
	7rv28+StA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtj14-0006cY-3J; Fri, 10 Jul 2020 02:43:58 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtj12-0006bd-1b
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 02:43:56 +0000
Received: by mail-ot1-x341.google.com with SMTP id d4so3201157otk.2
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 19:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2dy4AVqCcP7kztGsFeA5Fvb3GAiUWtChvdkBa1QUZbw=;
 b=VJffGKFCkiCfIhl//sN2TFR4d7nLOgxwKcao79heBIkTO6Ld6tufLnLyu/FoWWwYLP
 IARF1L4e2re0mmDqsUzYo9R0GgCiNjOBnSeVCkjQgOdxfxpmxt5pg7Oi9bos4oxMR3wi
 6xACx79JJkTqymJCNptZEVkRnBt7sRsUrErdSkBE2DLAv/rRMuJlZWWp+iF1aO3gC751
 99d6CjUBXeORsfUbyEbLYv7/Biw7XQYW5iPEFpAckftmv48DZlzbp7GtVjdP6W07PbFY
 mmOtmGIQgAiv6mxic1OoV1ezpp4EkpaKQeOGbfnSA9nUiOg2yHJXyEkp796PqHCKvIsV
 fpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2dy4AVqCcP7kztGsFeA5Fvb3GAiUWtChvdkBa1QUZbw=;
 b=bOzgN1NCZ72bxchuoc1CewHr5um6qTft4AKky2t/FH8wt3VW+r056ePqqEDX9ssqhN
 V54S3LTcLOjFBHabfQIgpS5m7qXSd/JY6+roT+HDUmJK2ryLXCv2AVdvcE/u56ABbw3i
 qZpYfvWnI0qv87ciqcPb2mw4ggBl1KsbqfML7hFLlrqmcXqc3S7GXZadvX1U9WjA6F7D
 G/EnUGQLmFBfZZpDohT3JtFbq1h1SsWU5yX4CWIvoI/OKP4w8f/0m9Viw0xxcJw63omV
 qST7hLCK2WBVIZl0UT3OBktus6ny2JirnEko/jK/j0KuneSMmqO3HioYMTPW3da4GAaS
 XIWw==
X-Gm-Message-State: AOAM531mKJQA+7ReMl1xQME70w9Ms9o3E7IJkL5AsstuJJvG5HyzJsPN
 TAgbunccE1FWhq/plWeFkeODRmUoTN/GfmJLnhjwUA==
X-Google-Smtp-Source: ABdhPJwZaTrq+TyA81izHDBuSWWhfbuw/hLqSKJNZWb3zwst8fKOn5vdHPuCZ1CGPPBJ+gbL7BlSNgImIn+EmGN7oZU=
X-Received: by 2002:a9d:222:: with SMTP id 31mr34143429otb.127.1594349034129; 
 Thu, 09 Jul 2020 19:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <7faa60aa4a606b5c5c1ae374d82a7eee6c764b38.1592292685.git.zong.li@sifive.com>
 <mhng-d4637494-2072-41f6-9a8a-1b222d89d6c4@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-d4637494-2072-41f6-9a8a-1b222d89d6c4@palmerdabbelt-glaptop1>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 10 Jul 2020 10:43:42 +0800
Message-ID: <CANXhq0rOMFgr4j-oG_6G12XP2dKqWcXOKaCwOpg+FM7E+Qxx+A@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Support CONFIG_STRICT_DEVMEM
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_224356_110328_539ED3F5 
X-CRM114-Status: GOOD (  24.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 4:08 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 16 Jun 2020 00:45:47 PDT (-0700), zong.li@sifive.com wrote:
> > Implement the 'devmem_is_allowed()' interface for RISC-V, like some of
> > other architectures have done. It will be called from range_is_allowed()
> > when userpsace attempts to access /dev/mem.
>
> In fact, it's exactly the same (down to a few words of the comment) to the
> others that I checked.  I'm going to put a generic version in lib/ instead,
> I've sent out the patches.
>

OK, no problem, thanks for improving it.

> > Access to exclusive IOMEM and kernel RAM is denied unless
> > CONFIG_STRICT_DEVMEM is set to 'n'.
> >
> > Test it by devmem, the result as follows:
> >
> >  - CONFIG_STRICT_DEVMEM=y
> >       $ devmem 0x10010000
> >       0x00000000
> >       $ devmem 0x80200000
> >       0x0000106F
> >
> >  - CONFIG_STRICT_DEVMEM is not set
> >       $ devmem 0x10010000
> >       devmem: mmap: Operation not permitted
> >       $ devmem 0x80200000
> >       devmem: mmap: Operation not permitted
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  arch/riscv/Kconfig          |  1 +
> >  arch/riscv/include/asm/io.h |  2 ++
> >  arch/riscv/mm/init.c        | 19 +++++++++++++++++++
> >  3 files changed, 22 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 128192e14ff2..ffd7841ede4c 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -16,6 +16,7 @@ config RISCV
> >       select ARCH_HAS_BINFMT_FLAT
> >       select ARCH_HAS_DEBUG_VIRTUAL if MMU
> >       select ARCH_HAS_DEBUG_WX
> > +     select ARCH_HAS_DEVMEM_IS_ALLOWED
> >       select ARCH_HAS_GCOV_PROFILE_ALL
> >       select ARCH_HAS_GIGANTIC_PAGE
> >       select ARCH_HAS_MMIOWB
> > diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> > index 3835c3295dc5..04ac65ab93ce 100644
> > --- a/arch/riscv/include/asm/io.h
> > +++ b/arch/riscv/include/asm/io.h
> > @@ -147,4 +147,6 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
> >
> >  #include <asm-generic/io.h>
> >
> > +extern int devmem_is_allowed(unsigned long pfn);
> > +
> >  #endif /* _ASM_RISCV_IO_H */
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index bbe816e03b2f..5e7e61519acc 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -517,6 +517,25 @@ void mark_rodata_ro(void)
> >  }
> >  #endif
> >
> > +#ifdef CONFIG_STRICT_DEVMEM
> > +#include <linux/ioport.h>
> > +/*
> > + * devmem_is_allowed() checks to see if /dev/mem access to a certain address
> > + * is valid. The argument is a physical page number.
> > + *
> > + * Disallow access to system RAM as well as device-exclusive MMIO regions.
> > + * This effectively disable read()/write() on /dev/mem.
> > + */
> > +int devmem_is_allowed(unsigned long pfn)
> > +{
> > +     if (iomem_is_exclusive(pfn << PAGE_SHIFT))
> > +             return 0;
> > +     if (!page_is_ram(pfn))
> > +             return 1;
> > +     return 0;
> > +}
> > +#endif
> > +
> >  void __init resource_init(void)
> >  {
> >       struct memblock_region *region;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
