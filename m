Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59AED116FB
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P2+V1woSjbncMUA/OJ5uHfkp76rqWdqPI3+kTnhxb1g=; b=BT4p0ZloOlRvC7b3H7RZte8mt0
	6L6OMrbkxzqBBeKgVfZeHaKbx57EV6+PEfQR/ky+Lc+Cgrmmc+5wYwC4ZhNyKOTmeaYERpQPJQ51N
	MPxlglYW32qaNCzKE4VpkLwotG0FLA1c4l2PY+XN+1bJrOfbNlpuM+GTnOosLjJucDJGHZQjbr6Do
	nS1wg+qHa08AIsmt271eBBY4w+waoOlMq7lfZTp5Uj1MD3zbi0MJLeL54k6eE6+zgX6F3nekDvdWv
	9K9ZXhFexzzcdW7tCaZBo7eA+iRLEsDSd9a+7gubHGlNGbwoOiCJK6tiIUprj843ol4/YnDPQ7Suu
	zUwnY68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t52C7-00000008CJY-3ZYS;
	Sun, 27 Oct 2024 12:16:31 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t52C3-00000008CJ4-2Ai5
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 12:16:29 +0000
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2C3A53F1FC
	for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1730031383;
	bh=nxuvBBl/Ikz1GUSyAopGwNtoj+wTTYNKUidSHI4Zw3c=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=cOLKETChPWegF2Gj202JyGVIBA9x2m5mL0IIQ4F7z6tIlPdKlGGIZ582GF91zbQzQ
	 AvY3uyNm7E2i1Y+U8acTQ6vuP1P3kn0D3uBwsjQcEdD66Ws+I/K5Afx5PFZjuwW5al
	 w06UzVSxpMI1qGaLu3ewpSGqtqV6zHzSNQg7MU1C01Se8O7cR90BH0eSrBmZ88GfpM
	 PzsiijipY8pD4p2OdTLI8xjEqc0vq02hpT8proFNfzIX+4x/jxrQLpyXfJY7k9Uk5D
	 zwD4DQiYSXauEYALxMgU0NYcBoq5C/abZUaTTTgb46YhoevxoDlziEHl5xIupTAUn0
	 mnWlByFrw2oNg==
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5eb649aa7ceso2797272eaf.3
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 05:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730031382; x=1730636182;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxuvBBl/Ikz1GUSyAopGwNtoj+wTTYNKUidSHI4Zw3c=;
        b=ajGAax0mzTc64FnPUU/saaI678NifqXxPCpQ1nJ1eMUJ3GRgP/hR7Khllf0KVehlLY
         kzz/ekCOq24zz/hKTnGzeKQbbTIMzC5vxkqpPvApiaLNJZiEa7fyxUjP293NhPxzjTty
         v4DtEfvp6dhukIg73dHN+bYWvj7imn9VY2UZFGbcURMkRbI2qiYDDRKrs7lvJNR9H5HQ
         zunQyW5VkjgTa6SFBNg4heSawZpfu9/3wftyXGc0+Uz8Q4c+cZ6f1PrRSF/QnpbRjHgv
         oEMGwPVRDxjXoASiuDcrQDgJo2m384EAJfFiHq5zCAtZMN9JQS/7fyt/1vGOy4usa+Xr
         8jgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwbeXSVnpYit6exsAjnY8XUxtLof4pfj95xG5v++LF8M0xJBUNm+PXCPya89Gjky24K/dtCkt/4ezYFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiP6hklc8NHVNWyFuf3etDDg0L1vHzY7GM39R/q4oeKO7CjyyA
	B1zldPaI2idJBWYgVpmoFRKLacc9ohuIK6T7U4+9cbEK3U96ZncKSHlkDQicN7pHxhMD4gkiPmj
	5pSESMk6FX7vNQIKvh4ZLeRhTgmgR6QVwDb6HPSi2974HuqsEyDOUU3wbiq2Has0mKj6qBjiaMT
	nOiF9o9SaE12iaKONk5gF4/ZiMBcoYyAYLXNXkDrU1t9kfy5eN3R6BXzE6
X-Received: by 2002:a05:6808:6492:b0:3e6:3ab2:3949 with SMTP id 5614622812f47-3e63ab23f2fmr1443472b6e.44.1730031381746;
        Sun, 27 Oct 2024 05:16:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3/p9UcQsOIF9XDrRaePo4CLioUPmMFOdhHm0S4hnuRvPrmJfiLwq408uv86dDavZhe/zgtp+drnC/1fSJ30k=
X-Received: by 2002:a05:6808:6492:b0:3e6:3ab2:3949 with SMTP id
 5614622812f47-3e63ab23f2fmr1443454b6e.44.1730031381414; Sun, 27 Oct 2024
 05:16:21 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Oct 2024 08:16:20 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAPDyKFoQsf89NeX28ms7FtM0QWNqYQ5xtt2=+G1JNCVi2z9=dg@mail.gmail.com>
References: <20241020142931.138277-1-aurelien@aurel32.net> <CAPDyKFoQsf89NeX28ms7FtM0QWNqYQ5xtt2=+G1JNCVi2z9=dg@mail.gmail.com>
Mime-Version: 1.0
Date: Sun, 27 Oct 2024 08:16:20 -0400
Message-ID: <CAJM55Z_CU5rwMBm7n10jhGk57_T_HWLKYrYaGoc7qvK9irT5yQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: take SWIOTLB memory size limitation into account
To: Ulf Hansson <ulf.hansson@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: William Qiu <william.qiu@starfivetech.com>, 
	"open list:RISC-V MISC SOC SUPPORT" <linux-riscv@lists.infradead.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, 
	"open list:SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER" <linux-mmc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Ron Economos <re@w6rz.net>, Jing Luo <jing@jing.rocks>, stable@vger.kernel.org, 
	Adam Green <greena88@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, sydarn@proton.me, 
	Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_051627_843524_6B659C55 
X-CRM114-Status: GOOD (  19.46  )
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

Ulf Hansson wrote:
> + Adam, Arnd, Shawn-Lin, sydarn
>
>
> On Sun, 20 Oct 2024 at 16:30, Aurelien Jarno <aurelien@aurel32.net> wrote:
> >
> > The Synopsys DesignWare mmc controller on the JH7110 SoC
> > (dw_mmc-starfive.c driver) is using a 32-bit IDMAC address bus width,
> > and thus requires the use of SWIOTLB.
> >
> > The commit 8396c793ffdf ("mmc: dw_mmc: Fix IDMAC operation with pages
> > bigger than 4K") increased the max_seq_size, even for 4K pages, causing
> > "swiotlb buffer is full" to happen because swiotlb can only handle a
> > memory size up to 256kB only.
> >
> > Fix the issue, by making sure the dw_mmc driver doesn't use segments
> > bigger than what SWIOTLB can handle.
> >
> > Reported-by: Ron Economos <re@w6rz.net>
> > Reported-by: Jing Luo <jing@jing.rocks>
> > Fixes: 8396c793ffdf ("mmc: dw_mmc: Fix IDMAC operation with pages bigger than 4K")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
>
> Thanks for working on this!

+1

> Looks like we have managed to mess things
> up. Besides the issue that you have been working on to fix, apparently
> there seems to be another one too [1].
>
> Unfortunately, $subject patch doesn't seem to fix the problem in [1],
> as has been reported by Adam.
>
> I have looped in some more people to this thread, hopefully we agree
> on how this should be fixed properly. Otherwise, I tend to say that we
> should simply revert the offending commit and start over.

Yes, unfortunately this patch also doesn't fix MMC when running 6.12-rc4 on the
StarFive VisionFive V1 (JH7100 SoC).

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
