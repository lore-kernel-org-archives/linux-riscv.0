Return-Path: <SRS0=RZUB=PM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901D2C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 15:04:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DB742087F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 15:04:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GtQnMBIh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="yYqbeDmn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DB742087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtkTIUqPU9fot0PCjUVxjYRQRhFmmq6bYQi6f03LTTc=; b=GtQnMBIhwTZB40
	Ac7KfsQIjbPphb6nY1t9BGkh9P4mqTt78U5PtVDMU7TUAn+pOJ1ZeqoC1zQ5shhQrOIuw7ndp362f
	7Jv0MALNiyKruA51gSBzz7u+kFYyKcmVVbs6oFSgWv6/JRtOMMYgtDQMDavjxMA+H1hqWkiQjtFGr
	v4phl4nTDb4NqC4clsjIg7RStk36ad3aIQYWsi8fE30h3Dylo6fOw/aZfJp3hONmO75JTCgcFLMG4
	4PA8Ud7yEEpiEWL5ttKI39bX6CTCARoPju9WooMLCcX51wZoh3e/E6RkSPzT5ylnOMzYnUkSVH3ix
	BtOTOz7EkYhS1oLv6Xdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfR1K-0000TT-9S; Fri, 04 Jan 2019 15:04:22 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfR1G-0000Sp-Nb
 for linux-riscv@lists.infradead.org; Fri, 04 Jan 2019 15:04:21 +0000
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x04F3vDU017798
 for <linux-riscv@lists.infradead.org>; Sat, 5 Jan 2019 00:03:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x04F3vDU017798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1546614238;
 bh=m6SQ7ZRHH4zUiD1zcnYJ8J1KFForbdgtEfeYHhvMokc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yYqbeDmnozxypadHJWUIJ08nGVgF1/nuEx8pkUtD0TFbqXu/peudn3enU5HynLmHG
 uIzAa+2BdMpOci+b8WzjYk8COQY8Jw4cMjQkbdTBlhGx2/TDkFOgeQcZLvcT21GHk1
 0WegYJGBbkGjG0q1V6otzYeMxcC6g0TxqYxnuntTBM6fyvbTVRTmuuApEAMzHC+uvd
 nHM6ww20m9mup4RcZcKJYBs159CiTj8SLEf/QYqY9Fvob4lmPsZ2AMzP1InsDHG4B2
 o954xd0eegSG3GNVWoVkVe+jfvvGNW//qw8oIeqr4W8Xy7s1wcUV9OiybbdL55HdVo
 cfh8ypOXNLQsg==
X-Nifty-SrcIP: [209.85.221.174]
Received: by mail-vk1-f174.google.com with SMTP id w72so7993871vkd.5
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jan 2019 07:03:57 -0800 (PST)
X-Gm-Message-State: AJcUukcNPueHfhD6hz+adRahnu9crLqOjKU3q5GULy67mtCVsI3ywTZY
 z0QbgRpR0/1bS9QzQPdwYtgLnqcWPtFfJ84KEJw=
X-Google-Smtp-Source: ALg8bN4K8/0n0rDc9db+1yRHR6NvjNuMRhv73RzZBLeXcdRT9vMrW6gViV4hhh/xD9I8zvirbPimJklFmXTqUbkqG8I=
X-Received: by 2002:a1f:9350:: with SMTP id v77mr17846428vkd.64.1546614236306; 
 Fri, 04 Jan 2019 07:03:56 -0800 (PST)
MIME-Version: 1.0
References: <1544969471-14224-1-git-send-email-yamada.masahiro@socionext.com>
 <mhng-029a5523-f3c5-4e90-b679-4e10f1ba4c0f@palmer-si-x1c4>
In-Reply-To: <mhng-029a5523-f3c5-4e90-b679-4e10f1ba4c0f@palmer-si-x1c4>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 5 Jan 2019 00:03:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+5eOFc64SG2SKCOThVVsz6S2NPBpemdcjCcZX_zds2Q@mail.gmail.com>
Message-ID: <CAK7LNAT+5eOFc64SG2SKCOThVVsz6S2NPBpemdcjCcZX_zds2Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: remove redundant kernel-space generic-y
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190104_070418_984600_5E525298 
X-CRM114-Status: GOOD (  13.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, alankao@andestech.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, deepa.kernel@gmail.com,
 linux-riscv@lists.infradead.org, Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 4, 2019 at 11:16 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Sun, 16 Dec 2018 06:11:11 PST (-0800), yamada.masahiro@socionext.com wrote:
> > This commit removes redundant generic-y defines in
> > arch/riscv/include/asm/Kbuild.
> >
> > [1] It is redundant to define the same generic-y in both
> >     arch/$(ARCH)/include/asm/Kbuild and
> >     arch/$(ARCH)/include/uapi/asm/Kbuild.
> >
> >     Remove the following generic-y:
> >
> >       errno.h
> >       fcntl.h
> >       ioctl.h
> >       ioctls.h
> >       ipcbuf.h
> >       mman.h
> >       msgbuf.h
> >       param.h
> >       poll.h
> >       posix_types.h
> >       resource.h
> >       sembuf.h
> >       setup.h
> >       shmbuf.h
> >       signal.h
> >       socket.h
> >       sockios.h
> >       stat.h
> >       statfs.h
> >       swab.h
> >       termbits.h
> >       termios.h
> >       types.h
> >
> > [2] It is redundant to define generic-y when arch-specific
> >     implementation exists in arch/$(ARCH)/include/asm/*.h
> >
> >     Remove the following generic-y:
> >
> >       cacheflush.h
> >       dma-mapping.h
> >       module.h
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  arch/riscv/include/asm/Kbuild | 26 --------------------------
> >  1 file changed, 26 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> > index 6a646d9..f7068f3 100644
> > --- a/arch/riscv/include/asm/Kbuild
> > +++ b/arch/riscv/include/asm/Kbuild
> > @@ -1,5 +1,4 @@
> >  generic-y += bugs.h
> > -generic-y += cacheflush.h
> >  generic-y += checksum.h
> >  generic-y += compat.h
> >  generic-y += cputime.h
> > @@ -7,18 +6,12 @@ generic-y += device.h
> >  generic-y += div64.h
> >  generic-y += dma.h
> >  generic-y += dma-contiguous.h
> > -generic-y += dma-mapping.h
> >  generic-y += emergency-restart.h
> > -generic-y += errno.h
> >  generic-y += exec.h
> >  generic-y += fb.h
> > -generic-y += fcntl.h
> >  generic-y += hardirq.h
> >  generic-y += hash.h
> >  generic-y += hw_irq.h
> > -generic-y += ioctl.h
> > -generic-y += ioctls.h
> > -generic-y += ipcbuf.h
> >  generic-y += irq_regs.h
> >  generic-y += irq_work.h
> >  generic-y += kdebug.h
> > @@ -27,34 +20,15 @@ generic-y += kvm_para.h
> >  generic-y += local.h
> >  generic-y += local64.h
> >  generic-y += mm-arch-hooks.h
> > -generic-y += mman.h
> > -generic-y += module.h
> > -generic-y += msgbuf.h
> >  generic-y += mutex.h
> > -generic-y += param.h
> >  generic-y += percpu.h
> > -generic-y += poll.h
> > -generic-y += posix_types.h
> >  generic-y += preempt.h
> > -generic-y += resource.h
> >  generic-y += scatterlist.h
> >  generic-y += sections.h
> > -generic-y += sembuf.h
> >  generic-y += serial.h
> > -generic-y += setup.h
> > -generic-y += shmbuf.h
> >  generic-y += shmparam.h
> > -generic-y += signal.h
> > -generic-y += socket.h
> > -generic-y += sockios.h
> > -generic-y += stat.h
> > -generic-y += statfs.h
> > -generic-y += swab.h
> > -generic-y += termbits.h
> > -generic-y += termios.h
> >  generic-y += topology.h
> >  generic-y += trace_clock.h
> > -generic-y += types.h
> >  generic-y += unaligned.h
> >  generic-y += user.h
> >  generic-y += vga.h
>
> Thanks.  These just sort of collected there because I hadn't trimmed them.  Is
> there a script that checks these?


No script is available for now, but
I'd like to turn on warnings to catch some cases:
https://patchwork.kernel.org/patch/10746823/


BTW, can I apply this to my tree
along with other cleanups?



-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
