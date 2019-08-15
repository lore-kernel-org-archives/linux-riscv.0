Return-Path: <SRS0=oAuQ=WL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CFAC32753
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2019 02:54:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B552084F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2019 02:54:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GZ0QwA8M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WAY8orSq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56B552084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sk0hmZm6MB04syzITIKrtJmebZp0bx8SBOup2UNCors=; b=GZ0QwA8MO4UifA
	RYWUbKhzmOArM84PDNzkHc5G0DcW7O71de40Jn/GFJqzol9Ugl4z4x26g02WK5avs7XrQunIyzz5F
	2e34Sq2xkNKiYKGSdev0WoznjYltCb3n867Ka+YWKtQfjCi6qY6hjjKvb/8yjScvzVG3AgZ5qghwZ
	BdVMhOEiMIIGQ3GYlhbGaa1MN+cQAqEYHKFVq7mPo0uyMzdHlTE+Xrf2L8lz+lXN75TdCE729J5fz
	BytOLaH/4HmrFLguZSfN6GgImvyyEzNj/WXN0KlrGaH19RGOOpBQEoBqwPcD5IklnmDn+iZYTfSgP
	/W7IOejlAJ/YOWC53Q+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hy5tk-0008CS-AZ; Thu, 15 Aug 2019 02:53:56 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hy5tg-0008Bc-W3
 for linux-riscv@lists.infradead.org; Thu, 15 Aug 2019 02:53:54 +0000
Received: by mail-ot1-x342.google.com with SMTP id j7so2933350ota.9
 for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2019 19:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hdb0nH13oEr6nRIXzGT4/+HAUBVeTsgqLpq+7aKP03Y=;
 b=WAY8orSqrakMS/XtmJpC2hS3YEV9zeu+kWvcto/2HdUAbGMKfH8/Ea81r2vzPlglB0
 HVVTUM/mMunfKiuGsu9W/C7CcdEUhiMiOv3aGIvO7VjNz5HeeRFDI5JGhxHjcapluMeS
 SbMADSrANmNhcedz/64VntyqWFL1nKrRHTEmY5BNQxA1GappLw1sVV9zjBefCn8s9uqd
 E/WC0mhGDjAxQ9LhVXY1k50D9/urECCnfGgHb6/EoDnj4nzrNueTPQQCg7z0Ao2kuScv
 REFKuuRP7jdohRgqAm8hgg2+biS+kdVEr+idLx/TvaYe6LxPr2+eBde1SClOh6Z/37k0
 z2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hdb0nH13oEr6nRIXzGT4/+HAUBVeTsgqLpq+7aKP03Y=;
 b=EmBjtCnxVOs/VU4OuZ6wSZ44qGQCN2/5Ryp0OxhJ/a+zGPgY4SygGZul7/G2F/qlnF
 yC6kt/uMbGq3ws3WlRr6l1U7wcqLH4BQrhWZ3brQwLaR3wFh5UU5sTon0EYFTocR3mXq
 7grxq0vGEDnIaqAcAOMN995SJNQqMrNYMpUSiU118eJlpwt3Hri5omCWvRqE3k5Nq129
 8QyfK4PKSt2p0wIbyabN3xi5HnZm+Vv+LTMxUG16Bi59voi5e0b1upTw627jolwpmTh2
 jwF4hi0wGWdAQiV/1zcPKLZjy+hlfQiBJKx9Sc1shYBAg0Z+x18pagH9+CXsvQq0QMfe
 +8ig==
X-Gm-Message-State: APjAAAWqTYrZ91xW/LUPp81DdIf353pab+/BO/xXdMX7Z+mIpHH3I/wV
 YOiyozY2zJMD3fA/P94ZESsSjib5dFfWB7wloI6QPKBJC+I=
X-Google-Smtp-Source: APXvYqw/iFDJnYcGgE5J8uAV0NYHZbpRwRf5evy2jBuuR9WT/cCD4jA2QAF4eEWu/w6jnSFkqwKZMlEFZHtBtq+Tgho=
X-Received: by 2002:a05:6602:219a:: with SMTP id
 b26mr2811877iob.55.1565837628423; 
 Wed, 14 Aug 2019 19:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1908141328440.18249@viisi.sifive.com>
 <mhng-4eded486-d381-4822-abc5-4023bf7ba591@palmer-si-x1c4>
 <87mugbv1ch.fsf@igel.home>
In-Reply-To: <87mugbv1ch.fsf@igel.home>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 15 Aug 2019 10:53:37 +0800
Message-ID: <CABvJ_xgfuXzO0-vDB6LYggNchjP=vUvnreLEYuV=w=eb+bhVXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: Make __fstate_clean() work correctly.
To: Andreas Schwab <schwab@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_195353_061409_CC3A8A9B 
X-CRM114-Status: GOOD (  13.33  )
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
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 15, 2019 at 6:17 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Aug 14 2019, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> > On Wed, 14 Aug 2019 13:32:50 PDT (-0700), Paul Walmsley wrote:
> >> On Wed, 14 Aug 2019, Vincent Chen wrote:
> >>
> >>> Make the __fstate_clean() function correctly set the
> >>> state of sstatus.FS in pt_regs to SR_FS_CLEAN.
> >>>
> >>> Fixes: 7db91e5 ("RISC-V: Task implementation")
> >>> Cc: linux-stable <stable@vger.kernel.org>
> >>> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> >>> Reviewed-by: Anup Patel <anup@brainfault.org>
> >>> Reviewed-by: Christoph Hellwig <hch@lst.de>
> >>
> >> Thanks, I extended the "Fixes" commit ID to 12 digits, as is the usual
> >> practice here, and have queued the following for v5.3-rc.
> >
Thank Paul for correcting my mistake.

> > For reference, something like "git config core.abbrev=12" (or whatever you
> > write to get this in your .gitconfig)
> >
> >    https://github.com/palmer-dabbelt/home/blob/master/.gitconfig.in#L23
> >
> > causes git to do the right thing.
>
> Actually, the right setting is core.abbrev=auto (or leaving it unset).
> It lets git chose the appropriate length depending on the repository
> contents.  For the linux repository it will chose 13 right now.
>
> Andreas.
>
Thanks to Palmer and Andreas for sharing this useful information.

> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
