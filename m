Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612BBC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 04:25:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01844610A4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 04:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01844610A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w44VJLCBKFToQy1YxhE+itbUk3YR/RCYKijQQ+UyMlA=; b=V35qfj2D6niVKe
	jAtCnVCEM57TD7NzBf4m5jb7MS3+4UxpnGDO5nEMBt3M/ir7C8XVDBsra8MKdpr7x2Umu3zzwWSDn
	PGlZZDA+xtj8FnVo8viL+UarK+bi8XoRifJ3scOUkkXBLISfhgNMY7aR6sPP+9nD0rvP0Z9h9rMe1
	kHTmN6Bc9tYrMkfuNmisTVCxn4rfLLG7uWVjMIPtLhX63ltFcpNt+z8DzwH/cmcb6lvwijS7TYsaM
	kQ/ydKx4S63D35MPEn/gofL/VUMcdONM5GQwgH2cR5HV6nt89xmT9VgKfnjIa45gYIFkwRm/fe0VQ
	/JIHLah8UUap0TGP3Olw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQixB-00AIsv-8d; Thu, 16 Sep 2021 04:24:53 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQix8-00AIsT-NJ
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 04:24:52 +0000
Received: by mail-wr1-x42b.google.com with SMTP id d21so7194853wra.12
 for <linux-riscv@lists.infradead.org>; Wed, 15 Sep 2021 21:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3F+o0j9jxKTxiI+Asnv/VhXByAoLQ8BKv0fUB5qlTq0=;
 b=t3/5Icsh9RDoPOdDCqDC7zfKbtWPaJ0wgaKU1BJ4Z/dd8cj0/PCkM9X6W7+QXkKFbh
 iT3ZA2KEuPEQY0Dma7pyaJQJQr6Y1tHoQ/919xDOzE2l7ZF8YYlGNar6oaZjxpVWJoxf
 DIqnJUyTU+UF1L1K1a9OsN+jXfIdHeKrbxDWzIPWWLI3FHH8LiAnbgHDRjxSqC8nlVL6
 rKA/gHU3xSGcjyxN63ZCGgXcjw27hu6xp3yPwLI93eyj6i1FzjC++XxcfQZBZKw12Mca
 +OBJ/LZCsUr4ZIc5qBShY9G78PMxn69PcSEEYfxcq6OSlaPjiuBQ4+qsN5UACI+fx3Wn
 Go2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3F+o0j9jxKTxiI+Asnv/VhXByAoLQ8BKv0fUB5qlTq0=;
 b=GBW3sj7Fx6GA0s9jruJMVBY8YtLMkTsqeqCuRzTfswGoeM7SvglfKUC2prNQV5k7ka
 Ss12KsZqch0dyweTbkyxnDy2E+QfW8E7/BfOyYteDIYfssBlN0veJ+SDYNigjUsatTmZ
 BXaccu2btutNrmvFh2a+Hr/6a14WDGRsM75c4iT0JHk6493its48RY6HGlRS0bUXyM9s
 gGX4ARi+aExafH0W17mCI5kRDAv1lGJmupfGPN7sxE4Ylb+tnOG6EqPO5eAaM7U5Lnyl
 XR1U9JqXXrSvV+H22wk2W5wPtL6j7I/oGx1AIKbid2ysFBD4Sx0YcX5Ka+ZOFUhQrmq+
 YL3g==
X-Gm-Message-State: AOAM531GGiJW1wUnVARe04fdItR2xoRuc+C4zQ8PK7c4Q6Rd7zdhsNwp
 QCP375ScyBysZvT8eoK28XKjFiTfZJAfsMU14PYIag==
X-Google-Smtp-Source: ABdhPJx2cKD6nQJM73FlWA5hhY8gQepri1EBWZutYONDNBJS3CwQcDwu7fycgaovPzDCqM/S71/7KiH0VcYH/dtpP+Q=
X-Received: by 2002:adf:d084:: with SMTP id y4mr3545518wrh.249.1631766288162; 
 Wed, 15 Sep 2021 21:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-5-guoren@kernel.org>
 <20210915075007.GD20024@lst.de>
 <CAJF2gTSgbmff7aTjwTD+rhQroWeaXfjepGeEAmooBV6d4u70kg@mail.gmail.com>
In-Reply-To: <CAJF2gTSgbmff7aTjwTD+rhQroWeaXfjepGeEAmooBV6d4u70kg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Sep 2021 09:54:36 +0530
Message-ID: <CAAhSdy1hdgn94eQKkgG6WtWxf-cNEFnaxPtKTgOKeRaBO5V-zg@mail.gmail.com>
Subject: Re: [RFC PATCH V4 4/6] RISC-V: Implement arch_sync_dma* functions
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_212450_872400_56A6BA0B 
X-CRM114-Status: GOOD (  18.05  )
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

On Thu, Sep 16, 2021 at 7:03 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, Sep 15, 2021 at 3:50 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Sat, Sep 11, 2021 at 05:21:37PM +0800, guoren@kernel.org wrote:
> > > +static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> > > +{
> > > +     if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
> > > +             dma_cache_sync->cache_invalidate(paddr, size);
> > > +     else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
> > > +             dma_cache_sync->cache_clean(paddr, size);
> > > +     else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
> > > +             dma_cache_sync->cache_flush(paddr, size);
> > > +}
> >
> > Despite various snipplets this is a still pretty much the broken previous
> > versions.  These need to use the CMO instructions directly which are
> > about to go into review, and then your SBI can trap on those can call
> > whatever non-standard mess you're using.
> I think you mean put an ALTERNATIVE slot in the prologue of __dma_sync?
>
> #define ALT_DMA_SYNC()                                           \
> asm(ALTERNATIVE(".rept 64\n nop\n .endr\n", "<vendor code>",
> XXX_VENDOR_ID,        \
>                 ERRATA_XXX, CONFIG_ERRATA_XXX)  \
>                 : : : "memory")
>
> static void __dma_sync(phys_addr_t paddr, size_t size, enum
> dma_data_direction dir)
> {
>         ALT_DMA_SYNC();
>
>         /* future cmo codes */
> }

I think Christoph is suggesting to always use CMO instructions for
implementing arch specific DMA sync functions. The SBI implementation
will trap-n-emulate CMO instructions when underlying HW does not
have it. This means custom cache instructions on D1 can reside in
the platform support code of OpenSBI.

I also agree with the above suggestion. At least, this will ensure that we
have only one way of doing cache operations from S-mode perspective
which is CMO instructions.

Regards,
Anup

>
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
