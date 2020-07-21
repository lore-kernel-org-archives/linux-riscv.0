Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5738AC433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 04:19:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2355E20792
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 04:19:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fTkrdwJF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="uBaNnnrb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2355E20792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NmlqAFM57Z9lAS4F9Mb9az3IYYaWPGvJoPVEY7ZeUEw=; b=fTkrdwJF6Mdvm30HWkEk+QAUY
	dtOKQXOI3MkwdoGjYs32FqV1ei+z93YmpNjjRpylcYxwEONzkJDz0aA7Y4Yamn1GvD/kSeW3JqH7B
	hw0SerrHiP2I4fOPovghSJONcoFObd13okn5UNXezgHeePpOP4Ap/NaPSHJyu2gP2YnmCm2CJxIHF
	qJ7cEQfegFYB5/LXOXL2nhBd3Lotjt66B0dAf2/lkl5i9vSZ7hAuQ8YeK2Th7p1tJvqIojZm/wa0T
	NeD4VzJGMCzxdlrKYCTd9r+HI+KY1ph+ZTXy4NXupRe3u3LFkoR4JfkoeBY4ZGDZ+VzPv55kCpWWi
	1v9NAET9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxjjp-0005v8-BK; Tue, 21 Jul 2020 04:18:45 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxjje-0005p5-KZ
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 04:18:35 +0000
Received: by mail-wr1-x441.google.com with SMTP id f2so19732961wrp.7
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 21:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pvGyIvK+jrRG641iFQvvM5qkEd++webDM8jQoP8KAeg=;
 b=uBaNnnrbr/RkUKhJ8oRD3GenYZDoDi3q/cqa9bMRN3VnTE7n0oVpoEM5ltsbsNG8Mm
 YcZInye9jRD0m9OFGBAkKqGWKhFHt8PV0DNN4kVcv9nfxOyCwTQh2MH+0lATLa8FrwiB
 ZtX2A8eEdOIhIHU8iLdL+xj18YaTplTCST6hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pvGyIvK+jrRG641iFQvvM5qkEd++webDM8jQoP8KAeg=;
 b=jaKR+yd0wuQNZC/+uUXRpxPlZ6mtfHmHJnNK28kvHSWgghGlLk4PlTmPWBv2tBBwmF
 3GpSdUxidBa5msDcG/sytfNM2o+qj7iaLDQ7pSj/3l08Ge7hHgh4rmSiNRoFY7ZbT4CZ
 OrzF5p7/HtLhWhxG1005eEc3bmdZI+LZjErJAj+BWtR0II0fVf/+RfBJZLCjtW9uA1KD
 DFZAhIQOHnXdxPMMBO+/bZS7U0hqyL5MTozTBUgBMax/CWE1pkehghQhMVDzcKuBzfL6
 VJMXXuIyQhgdhlvZBlNEXIX8b4Rk7/4r36K9GEJt89MwTrmFcKHsvRv7aHEembYComIN
 eytg==
X-Gm-Message-State: AOAM532s8/K1hFSHTgJWNBL28x8DCGQaLUVvrKDgA3jhkh9LwWGlfsAz
 zOxQT6XqLPZBcbL5JaiOUlGqdlIJ8vG9PMCjsg/77UOxnslB
X-Google-Smtp-Source: ABdhPJyUUhI7rmyfgcUYhyAD8KTuWvoSFWEvFQf8q1YY7LKIYYImAXJmzUf5VpYShW70wWOsiDP1Rz6WLyDpwhLoHxY=
X-Received: by 2002:adf:a35e:: with SMTP id d30mr11992031wrb.53.1595305113513; 
 Mon, 20 Jul 2020 21:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200716234104.29049-1-atish.patra@wdc.com>
 <20200716234104.29049-2-atish.patra@wdc.com>
 <CAK8P3a2EesjQAs-YGrCO=cYfUVWFQ3CbJfVXJx3qZjCS_XW+wA@mail.gmail.com>
 <CAOnJCUKF-tfN-fHyRcjyAMnYVzQqp=_CLa2F4TQNO7jA4infoQ@mail.gmail.com>
 <CAK8P3a3iUdoOZrORz+aeXYiO35Lp8snrCkxSUPAY6Fh2EinaOw@mail.gmail.com>
In-Reply-To: <CAK8P3a3iUdoOZrORz+aeXYiO35Lp8snrCkxSUPAY6Fh2EinaOw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 20 Jul 2020 21:18:21 -0700
Message-ID: <CAOnJCUL2X9mK41iHLCg1_rtj7JS4p41hqXfmd=hyxK=2t5QQog@mail.gmail.com>
Subject: Re: [RFT PATCH v3 1/9] RISC-V: Move DT mapping outof fixmap
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_001834_857229_0F966B95 
X-CRM114-Status: GOOD (  25.55  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi <linux-efi@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jul 18, 2020 at 2:24 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Jul 18, 2020 at 3:05 AM Atish Patra <atishp@atishpatra.org> wrote:
> > On Thu, Jul 16, 2020 at 11:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Fri, Jul 17, 2020 at 1:41 AM Atish Patra <atish.patra@wdc.com> wrote:
> > > > +#define DTB_EARLY_SIZE         SZ_1M
> > > > +static char early_dtb[DTB_EARLY_SIZE] __initdata;
> > >
> > > Hardcoding the size in .bss seems slightly problematic both for
> > > small and for big systems. On machines with very little memory,
> > > this can lead to running out of free pages before .initdata gets freed,
> > > and it increases the size of the uncompressed vmlinux file by quite
> > > a bit.
> > >
> > > On some systems, the 1MB limit may get too small. While most dtbs
> > > would fall into the range between 10KB and 100KB, it can also be
> > > much larger than that, e.g. when there are DT properties that include
> > > blobs like device firmware that gets loaded into hardware by a kernel
> > > driver.
> > >
> > I was not aware that we can do such things. Is there a current example of that ?
>
> I worked on a product in the distant past where the host firmware
> included the ethernet controller firmware as a DT property[1] to get around
> restrictions on redistributing the blob in the linux-firmware package.
>
> For the .dts files we distribute with the kernel, that would not make
> sense, and I don't know of any current machines that do this in their
> system firmware.
>
> > > Is there anything stopping you from parsing the FDT in its original
> > > location without the extra copy before it gets unflattened?
> >
> > That's what the original code was doing. A fixmap entry was added to
> > map the original fdt
> > location to a virtual so that parse_dtb can be operated on a virtual
> > address. But we can't map
> > both FDT & early ioremap within a single PMD region( 2MB ). That's why
> > we removed the DT
> > mapping from the fixmap to .bss section. The other alternate option is
> > to increase the fixmap space to 4MB which seems more fragile.
>
> Could the original location just be part of the regular linear mapping of all
> RAM?

No. Because we don't map the entire RAM until setup_vm_final().
We need to parse DT before setup_vm_final() to get the memblocks and
reserved memory regions.

I'm not too familiar with the early mapping code myself, so it may not
> be possible, but that would be the most logical place where I'd put it.
>
>         Arnd
>
> [1] drivers/net/ethernet/toshiba/spider_net.c



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
