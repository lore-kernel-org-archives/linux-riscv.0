Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28048C35FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYSDnSf9TodC0CNj2XaDFTQk4t85jN4wovT6Sfif7Zk=; b=10li+4CbTGStdH
	6ixU+ikgv8mlNV79JnUcQrOBgZKX4rSxeWx3kXzccNtbEx2Lh2WVcUZtaVYPFVwWpz1P1dmt7Ea1f
	mLd4NQumlhUUdRZy5tAbh/5kU93hWlYqmvSpcSAc4i3kfFTGs0Jm1Mh7MQ4gzULunQKCQ5taALB25
	a7z7htlye0UJhY0KJ51m8OsiOQb9SAvTFx/Gl3R9HSrDbypJZIBExU6wqTU7knWDiFGVaVSXkY1Hd
	zxLxjAMp6Pce9tfRbJFiDcQD2KQteqzU1fI9y+9jTPEzADniUwXJ2YHpcS3/DVL/KkF4pCSvMsq8O
	z9bxjYvHSVsZq9QoNMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9Vu-00000002YlV-0LZ2;
	Mon, 17 Mar 2025 12:24:14 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9Vq-00000002Yl2-3R2C
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 12:24:12 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d4436ba324so30996735ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 05:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1742214248; x=1742819048; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVqfhG4Tsr+0S9/jAXd11fujaL7v/Zv49Wi0Dvh6Q0I=;
        b=OL3++XVddXiEgYqYBTfp6vsOCnjyrSnDhiTzOICs1WAITgUZSQgUkgrfI4Mh+9U2ML
         L7Vpf5BxQkFNhtuKFXu2Co3lAccjc38g/kYO2wQzOKuwxaXkSC9VhWaQ6O0za6uq5h0/
         vLSIFDinhHNYk8NQkWhdZuLmBaSFwpxQa5G/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214248; x=1742819048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVqfhG4Tsr+0S9/jAXd11fujaL7v/Zv49Wi0Dvh6Q0I=;
        b=c3sRDaPMmzzUKs0jxhfa7Nd2P9RNpLbA1d5MOllJ7FCnzIjjpjtuw69wLjAe9VVPJR
         EWg6motpdJp0pHAxJUqcNZYuTMjMZrmjVC9f665OkAlLAsh1iEMU5+1mfURBpnVW26pK
         fsuCPwWQoq95KDnTRkkaWzQVhgxdkdizruDjabWOFSiUlOPKORp7uszc9lbXIQXS10Ai
         xaOEV/dhuOADlh6k1E1O75M5+oVuI7jAOcwjMtHUUcq/XUbrIlw5aWfWSgzRCT/1zA+L
         EIKwCF1ZqpwjFQLSSHlwsbrQyUaNni8XT8UTWsuznES8vTAmHb7pCOeH/dyDtUtOvUyG
         OjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKvigg22P1HjdbVgClTsbeALyqmSq34sTajPUp6UmwSlTTnMVz92eJp70XAVQ8l3IGzKilIKuR4ptDFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YznDA3sxgHp1BDVvjK57zc4m+kueCR9DH2XQnV/oibwIwxt6pfx
	Ujevg4/LC2Cb1ZzAV06vI0offg3dBD19YViZ06zIIZvYZhCDPda51qBHTPwaTQ==
X-Gm-Gg: ASbGncv7gth7SwWr2uuUlZBjXCGR/1x47+i+HQJPtpj6H2wQw2ktFPK88q/+07P28wt
	uiRHG/1fB5vIBfZZzE1yBUsl6bSrIv9QLl5+8UlliA+CuFL94HokA6PguqtpugU6q/SztmjcrVQ
	XacSY30vXJth00ADgPXsTfmv8uxKZH80Qqjxy/7gI3qIJ3kgbZC71V6S6UUMa66t2uxUueZSZVq
	RzW3fZvzjIJv0METMt7WgZ7fQ/kdndc8OFo4lYt9Z06r3oMhl9fcU6S/5MTGgn3JPCDuvyNhQcs
	1293U69mnko8aaNG4AD/mN9fqPtfw5fgGtzVd3PcQBQGCezZttfiCa5W+tZ+/Yr0YAM3D/6uv3Y
	Dsgk=
X-Google-Smtp-Source: AGHT+IEGGv1epbomaXX0zbh2byJd5cVeffbSyLLHslAOJ3Sd1NJhrsMaYbtUByrj99ocjeXVsSotaA==
X-Received: by 2002:a05:6e02:320f:b0:3cf:c9ad:46a1 with SMTP id e9e14a558f8ab-3d483a35280mr135008545ab.13.1742214248021;
        Mon, 17 Mar 2025 05:24:08 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d47a646abbsm26046345ab.11.2025.03.17.05.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:24:07 -0700 (PDT)
Message-ID: <4e4b85b1-bb4b-4de2-8780-a22fae6c1b8c@ieee.org>
Date: Mon, 17 Mar 2025 07:24:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default
 to y unconditionally
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Yixun Lan <dlan@gentoo.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_052410_867169_3C102166 
X-CRM114-Status: GOOD (  13.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/17/25 3:06 AM, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.
> 
> Fixes: 7ff4faba63571c51 ("pinctrl: spacemit: enable config option")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This (now) makes sense to me.  Looks good.  I'll look for other
cases like this from now on.

Tested-by: Alex Elder <elder@riscstar.com>

And if you like:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/pinctrl/spacemit/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
> index a2f98b3f8a75580d..d6f6017fd097d326 100644
> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -7,7 +7,7 @@ config PINCTRL_SPACEMIT_K1
>   	bool "SpacemiT K1 SoC Pinctrl driver"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on OF
> -	default y
> +	default ARCH_SPACEMIT
>   	select GENERIC_PINCTRL_GROUPS
>   	select GENERIC_PINMUX_FUNCTIONS
>   	select GENERIC_PINCONF


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
