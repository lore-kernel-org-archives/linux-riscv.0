Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E00C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 06:43:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FF6120657
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 06:43:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GTl2XfbE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="P1xeNk4V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FF6120657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6bNXIKU2v/UtEdTVD6NfI5SuZsDyaJCsS8+WZ3HP0U=; b=GTl2XfbESTwC1/
	vqfX/Iu6voGLc/L0lWPkp+SH0BaOZYZjgDmp4LP/XBMEw/Q0el6/zUcuTySjxMoMQZ/nIE0DbLtpA
	gjIXxJBKSTIl/Nx7D6mlBNMeAzNVUI62ld9xW+Xs2/gfkJdRARewQVU2FVoIogj+sQxZHw578iLhA
	OBEpMCFLtPP8pO7ffx+diAkwzhrmSGbKmORxi593/9FFs+6EF0gDzqcKFqV+VkZVyB4XuG1xrPdUj
	ECFSooQsZ8WV0iDeuKTQRWNaXrEA6pola9iGNoCSc18CFfONuY2VJgIWV1cIk9S8XfO406wq5Kkae
	oqH18In8xZ7KsSYZiWqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHkE7-0003vv-8a; Wed, 31 Oct 2018 06:43:39 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHkE4-0003uf-Gw
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 06:43:37 +0000
Received: by mail-lj1-x243.google.com with SMTP id t22-v6so13758437lji.7
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 23:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1fwqQ9aRSAqM7zyF84//NoXF0ruX4u0DGZ2rO3Fr/rk=;
 b=P1xeNk4VZ2KONvH+f9hoBPd4w8hoFJ3ho6asLuiQfPz/1gOlM8GOb1HWvnv3IyuaUs
 xdUD9dZ25ywaOUI/2UIaUzneVDFG4XV5kmYwoN1ZNelQHirZR5q0A+W9ENPnDLg6Sukg
 ZSsfWmZg33D/dG2pFOa3aliC1wnw6buoIfVHeEuJz5tqU6PR2beagVWL781dCc0y31yo
 j7ORoWIoprQ27QSj586FlINuTbQZM4aNYXbqEbG8y5CDmazazSe0r3GcqYCrwQMPAvj+
 dDT42wKrLWzFoqbzUFbgJRvdCuma8lXmxmlV0AAF0ey4L5J9Kgk3hPvxANsyUIU6LNcK
 SYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1fwqQ9aRSAqM7zyF84//NoXF0ruX4u0DGZ2rO3Fr/rk=;
 b=Ll7DK+uLx+zsVK55IDQ9HB4vRKYDjoZ5KU9rWj3KE0JevAu9uFrU7XyieXNpGPWI9H
 ug8gBCk5vGTWMGWKp1A0EgxBOI3BoAa+Qh4cXx2gxRRarBGPBBmQa6KYFnYs/w8TnP/Z
 YulF9Omw6YP86k4BecZyO3fRV/r0SXlCtUotcrgaKycIlPmk93ze8lJwWTXG9PFL0Sfs
 o3NFJvumG5P1RQ4IzJPOB9il90kiGJr/o7FHckOjwLzzO5S2GVm1Nif06IkX4UUDNMn0
 iOa71CCqC1Dik4fmR5H7O7rNHP+YXlLoYfAOKu8bQAvEIbPoixJ3ZLebZ75xtR0+Dk5u
 GB0g==
X-Gm-Message-State: AGRZ1gKGOkvjyTJ79QtZgLfZwD0syQdsHGF/hA+iVqIdy7qAlut4OfTW
 QdBIcBcMid6FsdtBHvTbj7vBxTjOcy2FhiuJPGHmxg==
X-Google-Smtp-Source: AJdET5cTRyqdz43/LBrXLek8MAxzVpnXYE/Q19xoaIaH3hii/9lInHPt858A3Q61EhZe4cY6iPxDJeeFdQKZo3y2NqA=
X-Received: by 2002:a2e:b1d2:: with SMTP id
 e18-v6mr1113525lja.34.1540968204058; 
 Tue, 30 Oct 2018 23:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20181031000413.30123-1-olof@lixom.net>
 <CAOesGMg6L8+=ZFbH_ThUG3VrePrbBY0Bg5HWi+AiaEbNSOn_qA@mail.gmail.com>
In-Reply-To: <CAOesGMg6L8+=ZFbH_ThUG3VrePrbBY0Bg5HWi+AiaEbNSOn_qA@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 30 Oct 2018 23:43:12 -0700
Message-ID:
 <CAOesGMh8zq=vK0ARqK-1S4MYn7kg541u+dziKqnGuswrCi=n1A@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: lib: Fix build error for 64-bit
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_234336_562039_65A3442C 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zongbox@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031064312.1D0-ZGOrmmudNxhfRiwOJrVPBC4C_aUGJpyVPcIN2eY@z>

On Tue, Oct 30, 2018 at 5:05 PM Olof Johansson <olof@lixom.net> wrote:
>
> On Tue, Oct 30, 2018 at 5:04 PM Olof Johansson <olof@lixom.net> wrote:
> >
> > Fixes the following build error from tinyconfig:
> >
> > riscv64-unknown-linux-gnu-ld: kernel/sched/fair.o: in function `.L8':
> > fair.c:(.text+0x70): undefined reference to `__lshrti3'
> > riscv64-unknown-linux-gnu-ld: kernel/time/clocksource.o: in function `.L0 ':
> > clocksource.c:(.text+0x334): undefined reference to `__lshrti3'
>
> Err, fixed the whitespace in tishift.S while I was at it. Undo if you want.

Ended up with a few more fixes, so I split this in two and will repost
as a series. Apologies for the noise.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
