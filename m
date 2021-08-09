Return-Path: <SRS0=KDuJ=NA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD43C4338F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 19:20:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 012BA60F35
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 19:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 012BA60F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alykYbCP2TFe+2IlJn5JrpvW6w6LV8oYMT0OLxUxmQo=; b=noJTaPpegZLPc9
	BOSquEjPkU8mlincHcu5IpeMGVGo3JogsgWwjzZ8HzE1xnzTo/eku/rwKtVTBQVt4tPBer3YLYzGJ
	Wqmv6Fv+0yNIfRLYfeJgUgJJZ9jfiyAzLvdWDu3/WtcsJYz53ZpVpl7U6FYGSra4IDG5LR051yTqE
	uggT+ovVfIU0cHYCTiwuaYyrDr4wGhsXdHPMqnYehnRrKeWq5W7KUycCxZe0REKi98kWkejO2nNMv
	XhI9grI+DSAi3deGE3BHoGmBFWiVPR4WhHKPMTeSuHgIpF8vSKTl5W8iwkUzSYy/3WeR9yjZGvGT5
	ByFAKoKXlDqK3kAUt7Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDAoG-001q3r-3I; Mon, 09 Aug 2021 19:19:40 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDAoA-001q2z-In
 for linux-riscv@lists.infradead.org; Mon, 09 Aug 2021 19:19:38 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id z5so29786159ybj.2
 for <linux-riscv@lists.infradead.org>; Mon, 09 Aug 2021 12:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q5FbAj8r6tE8vWXCnXxzRL0+yywGEKOj7p8jnbK86Ew=;
 b=rXNDKWW1qrP9MQi43TIvNTtXHxgAHW7/OVH9i6E3+nr2TNdcOl1DnLemafRNeAuOni
 YcwihQFrpM6HC8mFNB2dZlgPpKBiLGWEuq1ao1Hlza/AXJ7vjsKhrlU18G9xC4SeGtiY
 p093jZkWPWdrMkL7vhazLsCVFXN+IpacvQiD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q5FbAj8r6tE8vWXCnXxzRL0+yywGEKOj7p8jnbK86Ew=;
 b=A5T2Ghx4F2ACm0giG7sKhgEep0qlgj633ivIjiKreKFA6k5yvF5XQXp1viAQYosjSZ
 OPD3tI6DmI451qFnCGNKhJibDlo5Mf7MoxnAoHx5s5AOPgLaYkXCCsjFcso9pwm5mOV8
 u76KpVMSXcfvilcIxvGGeME/ia+GJMPZx0w2bCK9EdYyTpF7Ecyoq3p2ZCm5Er39f3BP
 43wLnvT3lA+y4PINbXbN9W5zFVDvnAobd7OsCPCrLy3jtyJJneBz+Nm1RLQBQgEFnHBg
 9T67RfxEBdYK2emITIljKZTQHhksAfDbamf6UsF2YSRWWfM6a4D+w0TARxaRatjqGjCK
 48TQ==
X-Gm-Message-State: AOAM532vDQQGQVFDCBz5VqvMeJc9Y6LuLAfm50WDCf7/+YaT3lmZTe+Q
 7x5Rl/O+pHYo9r+hFr1mPKfp4AbWd+7ebGPC00qx
X-Google-Smtp-Source: ABdhPJz4U2Wrj5qOv21GHijYD7/uOCOLFk5QRJH7kt2VLiP2xkxjDpNwOXkCNZ8vTCfggjjfAZ6Mbl3nP+Tavrxks5Y=
X-Received: by 2002:a25:7a03:: with SMTP id v3mr33382775ybc.202.1628536771106; 
 Mon, 09 Aug 2021 12:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210807145537.124744-1-xianting.tian@linux.alibaba.com>
 <20210809003044.6692ddce@xhacker>
 <c09fc86d-1e6a-3315-7489-9e269935ba55@linux.alibaba.com>
 <CAK8P3a1wyhLp1hUUotzwqc1pyCyfWhO7O_pvt5O_U=qZp-ZhnA@mail.gmail.com>
In-Reply-To: <CAK8P3a1wyhLp1hUUotzwqc1pyCyfWhO7O_pvt5O_U=qZp-ZhnA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 9 Aug 2021 12:19:20 -0700
Message-ID: <CAOnJCU+YQOF2+_FNa5Hpig_dnymNA-ZvtgU4-B5eisTyB9GT6Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: add ARCH_DMA_MINALIGN support
To: Arnd Bergmann <arnd@kernel.org>
Cc: Xianting TIan <xianting.tian@linux.alibaba.com>, 
 Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_121934_740700_4488FB5C 
X-CRM114-Status: GOOD (  32.03  )
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

On Mon, Aug 9, 2021 at 12:50 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Aug 9, 2021 at 8:20 AM Xianting TIan
> <xianting.tian@linux.alibaba.com> wrote:
> >
> > >> +#define ARCH_DMA_MINALIGN   L1_CACHE_BYTES
> > > It's not a good idea to blindly set this for all riscv. For "coherent"
> > > platforms, this is not necessary and will waste memory.
> >
> > I checked ARCH_DMA_MINALIGN definition,  "If an architecture isn't fully
> > DMA-coherent, ARCH_DMA_MINALIGN must be set".
> >
> > so that the memory allocator makes sure that kmalloc'ed buffer doesn't
> > share a cache line with the others.
> >
> > Documentation/core-api/dma-api-howto.rst
> >
> > 2) ARCH_DMA_MINALIGN
> >
> >     Architectures must ensure that kmalloc'ed buffer is
> >     DMA-safe. Drivers and subsystems depend on it. If an architecture
> >     isn't fully DMA-coherent (i.e. hardware doesn't ensure that data in
> >     the CPU cache is identical to data in main memory),
> >     ARCH_DMA_MINALIGN must be set so that the memory allocator
> >     makes sure that kmalloc'ed buffer doesn't share a cache line with
> >     the others. See arch/arm/include/asm/cache.h as an example.
> >
> >     Note that ARCH_DMA_MINALIGN is about DMA memory alignment
> >     constraints. You don't need to worry about the architecture data
> >     alignment constraints (e.g. the alignment constraints about 64-bit
> >     objects).
>
> The platform spec [1] says about this:
>
> | Memory accesses by I/O masters can be coherent or non-coherent
> | with respect to all hart-related caches.
>
> So the kernel in its default configuration can not assume that DMA is
> cache coherent on RISC-V. Making this configurable implies that
> a kernel that is configured for cache-coherent machines can no longer
> run on all hardware that follows the platform spec.
>
> We have the same problem on arm64, where most of the server parts
> are cache coherent, but the majority of the low-end embedded devices
> are not, and we require that a single kernel ran run on all of the above.
>
> One idea that we have discussed several times is to start the kernel
> without the small kmalloc caches and defer their creation until a
> later point in the boot process after determining whether any
> non-coherent devices have been discovered. Any in-kernel structures
> that have an explicit ARCH_DMA_MINALIGN alignment won't
> benefit from this, but any subsequent kmalloc() calls can use the
> smaller caches. The tricky bit is finding out whether /everything/ on
> the system is cache-coherent or not, since we do not have a global
> flag for that in the DT. See [2] for a recent discussion.

Can we add a new DT property to indicate the system is fully cache-coherent ?
That will be helpful for RISC-V as well. We already have platforms like hifive
unleashed/unmatched that are coherent while beagleV is not.

The workaround to support both platforms in a single image was not
very pretty [1].

[1] https://patchwork.kernel.org/project/linux-riscv/list/?series=520541

>
>        Arnd
>
> [1] https://github.com/riscv/riscv-platform-specs/blob/main/riscv-platform-spec.adoc#architecture
> [2] https://lore.kernel.org/linux-arm-kernel/20210527124356.22367-1-will@kernel.org/
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
