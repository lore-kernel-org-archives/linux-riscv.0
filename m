Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1813BCCD195
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 04:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HoeiYjiI3iWarZn0yOE8UouZUUpTAIHFCKV/20vT+lY=; b=ToqoqtdIRaGoO9
	u7Y8teXcXoQKvx/bc9CinsGFk0lV3AlFsGW+vbLvv0UxKgy8Lf/0v4HQpf2MpRqyD7hwDng5vql0x
	OFZpl+lTlWiAZwPNaIrWD2LIAnsIwJaui0KkyfHBU2G5+TcVfkJh9xjTp+9Wh1ow8FTF4Jjsd671s
	xNn15TLHIINQMkAxstqh9pfjGGhIn0DDuScP3RQnFM3NDsCfN2+B7dfBFD6a3S1wJKHyJws+ZX0L2
	TKKdXPC/FJZZD+PTScTgwHI9BNJYDq8NmD7Y/73UTU0t2qBed5WVCGBEyKSDK8pWdp4l8Je/hxiYg
	1yP6+Pr3AOvhgmbLyCkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQUl-00000001QqK-2fUM;
	Wed, 22 Oct 2025 04:30:43 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBQUj-00000001Qps-0G6m
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 04:30:42 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-33db8fde85cso2952189a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 21:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107440; x=1761712240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTcnGjhUhb8jKzTF6L7XczC6QFzv26Nhm3lCxckjhLU=;
        b=XutLH8R9btF1xlTaOUoqt24vwXu7zMGbl8oTSuCHT6N9iqHdV5TsQ2oY25Be6RHi/J
         7aUBweSzQqqyWwnkn1L++IN6N+K4ZR4p4/lGyzYRGfHhKemIvaZj8TVBow+UQIUYrk8Z
         L+zO80mobgXe4UFxsxiKiHIftfJLOEQFIUHxUkQ6zojx4aul7VIwKLiBcCPrSxdonA+J
         3wyibSdfjdF+nhD+aYc6lVt6TVGXqDZg7Lrb10nN0AZc4qLpUc3vzERxm3mtrLiqF2qB
         axmbV8Vf5zvo6ezO1VUW9wzfUDF6D65fCqKjcLuydiH8+siaMrZTJAYUduHB5Pduo9+9
         +luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107440; x=1761712240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTcnGjhUhb8jKzTF6L7XczC6QFzv26Nhm3lCxckjhLU=;
        b=wa5FRTQFxhuCjgBQ7rAA9Qa+1GofT3+aN7YksxdPVsGFwNf5QyKc95egyPFAPmgnPQ
         gPMAVA9hLY4H1w5qxMnapgVwh6bmAaN8YheovEvnqTZwc9Cx8e6SWnt5jPlrVUFPr8k4
         ZpPYe0XDvpTXnsiHC2KLXm/aVBlw4ewhP8DPjnlC0aSqKcpIkWv5ZM0xQITFRIuaEs0T
         6qHbii+FdBrA1fL3Aqbe7pXhv5HA0p+7wrrfuKitZUn0CEcUVGYqqbOGBjTTCteeSCIr
         iFBJAxSpQtQPS09p9EK2tSVeao4jtA1Uqn04Ll/zPGkCHhUwQWvAJIdz3kXC2KMqXKr6
         bAKg==
X-Forwarded-Encrypted: i=1; AJvYcCUT2G5xetZ0PykcHGM1cTrldEYr762QPP1wv7E936++vPRkOY5tDdWBvAF47iyx9ogGBqqdOoZ96fDNNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCAsHW33gA5+aDS3B17cj63SOjnnQycXzdaB+/oKajs7z34yo7
	PaSa5isnjRbtep6hOeCje5pwDvrKd/QEBDZjwEZ+rN72DH0p4lh20hz8Amai05xXAsc=
X-Gm-Gg: ASbGnctquJwONcbDK5GMuMWf72e3MJL5u+a6IY4u9Yfd+VKPgA+7NpY28ERMXYYb2ml
	dmxJv6k7hA5M9+SQQG1HART1wPuK77xVwhdwaZNCybuEvKEkZO9rtUtnGGX5hA6THUYh4jxX3Np
	e4HgJ7CHEJI4pzeYjJUfDMGWnBOa6uC2sPb+v/mZj71g5J2QVXci+oCP5rOgMwr3EYbcNwKdIBh
	GXiU05IZBFIkuqi8Yzzxak1gi2HhzseF7+lDaCk2buMqwnf+iLUBYJuDs49xRBcTkQwlawSZhgC
	ibwsCa8vWImdl9gQ4/q7zpFOnKUhUi5ZF721QtN8KL4rWUAXHZw8DoQfy2qMEvd00hSB3sT0J9E
	0quQttyWDK0CiCM34aNU1cvrUuR+283/aRmbnaQHi+GbRD1CZJ0oEMyesYEgh0761YXGrr8JcsR
	AXSlxYNZnUDr3wReL7HfXSYjs=
X-Google-Smtp-Source: AGHT+IHCvLgZS4hGuZBkDCjjiv46qhxkjKqpH5V3aq6Xzke+jWUJSrYYnDrBe5cM1LQ8ndK7Tc07Cg==
X-Received: by 2002:a17:90b:3fc4:b0:33b:b453:c8f0 with SMTP id 98e67ed59e1d1-33bcf8f9008mr23774051a91.25.1761107439935;
        Tue, 21 Oct 2025 21:30:39 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223f11e1sm1236623a91.12.2025.10.21.21.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:30:39 -0700 (PDT)
Message-ID: <965a6f1f-37de-4029-ba16-cfd2de7895ed@riscstar.com>
Date: Tue, 21 Oct 2025 23:30:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: simple-mfd-i2c: remove select I2C_K1
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20251022-p1-kconfig-fix-v1-1-c142d51e1b08@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251022-p1-kconfig-fix-v1-1-c142d51e1b08@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_213041_378258_3C01A794 
X-CRM114-Status: GOOD (  16.09  )
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

On 10/21/25 8:58 PM, Troy Mitchell wrote:
> select will force a symbol to a specific value without considering
> its dependencies. As a result, the i2c-k1 driver will fail to build
> when OF or COMMON_CLK are disabled.

Should config I2C_K1 depend on COMMON_CLK then?

But you're right, the selecting config should ensure the
dependencies of the selected one are satisfied.

> The reason for removing I2C_K1 instead of adding a depends on condition
> is to keep the possibility for other SoCs to use this PMIC.

Acked-by: Alex Elder <elder@riscstar.com>

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510211523.sSEVqPUQ-lkp@intel.com/
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>   drivers/mfd/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..ea367c7e97f116d7585411fff5ba6bcd36882524 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1258,7 +1258,6 @@ config MFD_SPACEMIT_P1
>   	tristate "SpacemiT P1 PMIC"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>   	depends on I2C
> -	select I2C_K1
>   	select MFD_SIMPLE_MFD_I2C
>   	help
>   	  This option supports the I2C-based SpacemiT P1 PMIC, which
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251021-p1-kconfig-fix-6d2b59d03b8f
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
