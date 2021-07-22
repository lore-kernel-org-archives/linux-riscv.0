Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0993C6377D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 08:35:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B98A61248
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 08:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B98A61248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OH3RC/RmHhV2IVtbNjkEgg/yf1K4a1kP63EHs860DTE=; b=BUIlZFw/sOmrRD
	c9xGtEexJVkTEFM8LSYqhA4nJCdbnbEKPXh6zTsdzyDgEbLdD7Y2OaeQoQx02Qvt9/pYRZw6L/Zwm
	Xj2dsfx3S9cn2mm78gPRCh/j6yqnr2zXaXibOXjn15m1laXLK6Oos4dWdq1mOnkRDcMFlo0dJKorj
	Jlfp8898VD0V9df7N3t12tUUtIsHaQwAFbiriJkJuyZoQIM4KjFfOyDwrqrPgWlTJqBYvmBejNaZe
	jHd0zmjp7VjkB5YX/cVo4OB17zB9DV6AtthsTfKa+u38iSKb7VOoM6thi29WSIkmFuiTSfqMtEdCM
	f9DhfjgYbVQNH+KVxsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6UB9-000hnJ-CM; Thu, 22 Jul 2021 08:35:39 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6UB6-000hmj-2c
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 08:35:37 +0000
Received: by mail-yb1-xb36.google.com with SMTP id i18so7125663yba.13
 for <linux-riscv@lists.infradead.org>; Thu, 22 Jul 2021 01:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KllKHw6d+WPSOXpmvy15856ZmrjGsxW2iASdgvJx0nE=;
 b=IddLDRIXkQ8kAFb2rpcmLJS7qqi7RmdEnwI9rN3QPJguzsqXl5MXdswc1RQ7/MtkCQ
 YZQZ0XYxJo8WbCzaOsIsn4f/oYB5fNwqpqgmrJrSpnnAFhJ9nn75BnPGnUVYNxSDKts0
 OHyBUaqtV0BF9gXsqPoG6YL3QzF+Y9FuZsq7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KllKHw6d+WPSOXpmvy15856ZmrjGsxW2iASdgvJx0nE=;
 b=KpPsRmO2gQcGm8yIcawa6wNaJbkXry/OS5jSOobLQHIur4SG8b9pblOy1oAoa4JKYa
 trBIEv3WtAxZBeRkpcTPa7qWfdlrFiAv/5w5Fyp9MhTHG3p9NRVv5LGC2NGPN+/i68aQ
 V70s0Ra+MrZnSOkHHy0Dgs3lG/35LbcF1yjW3vLgikTMWSiGCKR8UH5LOCOBWfopbKkt
 Kdb0+V4Wg/oXRKS4y1F+s2qKSpLQuIWPPrcqUnxm50ar6guoHFS9VeO8Q0js+42g7BF9
 LbAtmM5TH8OtpJWuIji/lIWOBRZ1v1z4hSGxNX49UDuH2eIzVaOSRRXmWkXAM0NMQFPX
 ql4w==
X-Gm-Message-State: AOAM533JTQDnYq0XhgNq3MSzStkZICqjiCuXLSmr8s8RUzL7E6K2g75J
 IQfWSUzpbnSH8ySKn9hL+yDXWTyFQQJKhziJ7UkV
X-Google-Smtp-Source: ABdhPJyLR7b0ZrhBWqk7asdINPvehj9f9K1NUxr0+x/0+EepcQ/CJdz9tdgPDIjR+LSRsU2sVJTkGvqTuxlqCrijzzo=
X-Received: by 2002:a05:6902:1142:: with SMTP id
 p2mr48483545ybu.147.1626942934542; 
 Thu, 22 Jul 2021 01:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <87bl6yrcmd.fsf@igel.home>
 <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
In-Reply-To: <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 22 Jul 2021 01:35:23 -0700
Message-ID: <CAOnJCU+Ss0cO1mqr=GDVnpxV075uR+KipSnr7dN93099dAH+vQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, tongtiangen@huawei.com, 
 Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_013536_202176_9AEBD26B 
X-CRM114-Status: GOOD (  19.34  )
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

On Wed, Jul 21, 2021 at 11:12 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 19 Jul 2021 00:23:06 PDT (-0700), schwab@linux-m68k.org wrote:
> > On Jul 19 2021, tongtiangen wrote:
> >
> >> On 2021/7/17 14:55, Andreas Schwab wrote:
> >>> Please use
> >>> https://download.opensuse.org/repositories/home:/Andreas_Schwab:/riscv:/jeos/images/openSUSE-Tumbleweed-RISC-V-JeOS-efi.riscv64.raw.xz
> >>> and run it in qemu with u-boot as kernel.
> >>>
> >>> Andreas.
> >>>
> >>
> >> Hi andreas:
> >> I used today's latest mainline code and .config provided by you, and I
> >> can't reproduce this panic.
> >
> > Did you test it like I said above?
> >
> > Andreas.
>
> I'm getting this on and off, with just
>
> CONFIG_VMAP_STACK=y
>
> on top of defconfig, when running on QEMU.  It's not showing up right
> now: I'd thought it was an issue with that initrd patch, but it went
> away when I re-ran the tests so I'm guessing it's something
> non-deterministic.  I'll try to take a look if it comes back.
>

I got it very frequently on beagleV with the following branch & config.
https://github.com/esmil/linux/commits/beaglev

beaglev_defconfig

Disabling CONFIG_VMAP_STACK avoids the crash.

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
