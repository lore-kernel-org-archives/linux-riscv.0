Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA67D277C1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 22:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eePNT7uzMppDAVYkH4BFU2rofiG74zaCSZ5kdQQMP+c=; b=InPYUsUSmU1nyK
	0V7KP9mPtZJqklXTxPzflLzwe+hJotb2fq7GmRToWy0CqHc5Okom/KXsfZES7jwwqnBPmpCzVT1au
	m7or7/bT02XidqHctOzFUYFTMboKULFWXDe0d+6BTBqIlrtKqiwvqxuFW787pu1pXDJARZRJ+0cgG
	3/pSbu6b2lJ6M6BdmrcmkIb1PNkthN8njkOxo0Jx+FkTRlY6NhsFjCCegsuvYY+5i6/9hkaDMw8bi
	8UfAqfQ+S6hrIJZTj7IetXKFVjNGyYTf5WCFaYbGt60QclOxPfqSs8gITjwBVHBjKak2Ky3gaPHl1
	OZAOUqvNkuaWvWRdlvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veLB7-000000035PE-44XJ;
	Fri, 09 Jan 2026 22:41:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veLB4-000000035Os-1ATj
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 22:41:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 32C864E42038;
	Fri,  9 Jan 2026 22:41:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD93D606C6;
	Fri,  9 Jan 2026 22:41:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 216C5103C871E;
	Fri,  9 Jan 2026 23:41:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767998511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=TIRiQ/9qPrMYe45souwMPpzx4Adluli5Fo5XiSxDj8E=;
	b=R99jXx+XP+4vPtOEEGfigxKx8uVgoC7/rDcMSFgAbHGkvdVwY4OFtNYvuzr84eG8rBp+yk
	gtBWCJV2yPWp2hOV0iRnDXU+5tIksWagEIXuvBpuNVT4x8gw6oGd7m3j8P8zotB6Hiplpn
	WAThoJfKpVeQcgeXBs1eIaAh2nIrx+SL23PUKhEtCTjviQorSDKzxBxgoVbyHPE8HAU2Ts
	x4yi7bOt+PNdTiXoy+Q5a5W9K36jGQInV53E6VfJGCENbg0C4yrZ5UYhsYzIVsfFrx9ENz
	W60h8Xbdm0Qby6kxd2GAtAXaDAVp2T2xp7FKzJTd7kvYbmDjDE5gMhLFGB775w==
Date: Fri, 9 Jan 2026 23:41:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 1/3] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Message-ID: <20260109224147267169ba@mail.local>
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-1-6fe19f460269@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-p1-kconfig-fix-v5-1-6fe19f460269@linux.spacemit.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_144154_472539_E6DC5104 
X-CRM114-Status: GOOD (  16.69  )
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

On 08/01/2026 16:38:54+0800, Troy Mitchell wrote:
> REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.
> 
> Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
> in REGULATOR_SPACEMIT_P1 is now redundant.
> 
> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Change log in v5:
> - nothing
> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-1-44b6728117c1@linux.spacemit.com/
> 
> Change log in v4:
> - default m if MFD_SPACEMIT_P1 instead of default MFD_SPACEMIT_P1
> Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com/
> 
> Changelog in v3:
> - modify commit message
> - change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
> - Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
> ---
>  drivers/regulator/Kconfig | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d2335276cce5ffbd500bbaf251d1761a9116aee9..b51888a9a78f399a6af3294fc19f60792576332c 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1496,9 +1496,8 @@ config REGULATOR_SLG51000
>  config REGULATOR_SPACEMIT_P1
>  	tristate "SpacemiT P1 regulators"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on I2C
> -	select MFD_SPACEMIT_P1
> -	default ARCH_SPACEMIT
> +	depends on MFD_SPACEMIT_P1
> +	default m if MFD_SPACEMIT_P1

default MFD_SPACEMIT_P1 is certainly enough here.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
