Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426D3D3B7D1
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvj48KW4Blog+J18KaG4iPbQGsfd6NvVJ91R2DoWnx8=; b=AfH/hbV/yxyQnw
	ds4Bo61vH5tYUP7KVjP2cwCyjbM+2ZZTPC/1h7WK/sJ651XaSbOtnaHnU1bTWj6uMzVGn/JEKpvil
	afBNJJIupn7as643pd7vevpYaUwDOFpqDUZuxB1FJK1j7wnwXbyprSOr5psRjwEYP1m0EbkZ/VbjM
	d+E66lG2Sq1G531jBT6ahimeUKWq0x3SBvNmu8wfXckoD6Bj6vMYeiwSjHdAyAWNSZbFqYsHNsV0m
	66Zb38Y40b71C1K9KRmzgVUXQZA9BxzR3gZue4NTge0XAArfX4EDtdiYwz2SUGunyHU8sTtm3GZxS
	IUTbmUr5zl4BmEAPCVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqCf-0000000Ar7y-1mQO;
	Sat, 06 Dec 2025 11:11:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRqCc-0000000Ar7b-28zf
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 11:11:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso14956165e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 06 Dec 2025 03:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765019508; x=1765624308; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kA4dYuB49zNcflG5vvLKKvtHOONzwthyiF/LnUsNAAo=;
        b=I+VohP6dWuPoe/XsZaulRQpVfci9e4DTebortahkdhjWwS6piwYAyWgdLar4RQdtaq
         CvxNCQCKsG3R55a6QkEjUNaa26jLCzRrga0CXd406gNbgZ7o9sjBfoKyqqo/PE2qYw6z
         gxyIYeBNJ2XQb6kUrjfPlE+kV1a6ha10NDJhDPGSWgV66yrT2bm2HWrsQn02m3bRkKLv
         2wvanuVSBOslyclchD/yUFN0NZ4sMHcWW45eS+HXiRqnsR/0APHW7IecDBo9mQX/yVbp
         DbkfJZgs9Cj0lWMQ/SIoF2Ey369j7r8c1jvGbu1YwUy8UFnn7UhQzc9W/EshKvrdaQZM
         ymIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765019508; x=1765624308;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kA4dYuB49zNcflG5vvLKKvtHOONzwthyiF/LnUsNAAo=;
        b=rHLivr9ISYSK/vJWDXu4T3Ei8xEnvh7dTwUQ9Omyzq93SkJO0YCl4Kdco0ymrgN/pK
         YD16QuSO1udwFFXQfg7FjzHKQ35KtGMjNIWgbtI9BJgUUvJNCu26gLTw2iCsnSzwGpBL
         JMmAkVNOfg0iyOd8w+aRf/uSX4dFWF5f/Z8CtWZYZgTT3HZBJ4hoIdbUKWBG0Q5dpcSv
         /4TXAfGbwxAn4HWX8tENVaErQuhpSoR4jfx1UmxGoOaznK9FAG/pmE8JDRix0buPAabn
         sXAbjFb6Xmzs6UKIgogXOFCNdUzSLocWsL0ZCvM3sMH6oTWrTTgPZILaaSxDrBJ4rtKT
         f/Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUO1kv7KMG+auvMMqUUEoZd/0RzVAfIY0xe+oMFgiX8/dXl8hNGN6mn4FnKRwOPOIVM23LihHfxxuQ09Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv6d+oT/RudrxDXdozta6P02v8ZRRW9qF6so/nKof4aW5f2UPV
	e9qnC5Vs64lZTlrW2M/gS7n7MwOJXAFff9hKXKgwsvPKLxXeTltLYYLbjBVXghk09yM=
X-Gm-Gg: ASbGncv6/iCpTMYGyUpE5VRcyiRb9xXRyN5YeEZZrh6gO/R68W9G8ux+My93Kutein8
	ZCS+qEZTDt7DuhqCaChgBOSsj+gUJgVCyiQ1MjBynyXUsccWL1ZDoXCADrc8UqpS2QpaluFXMwB
	85rxEFNaFRlvqOQOZsTJUkjLaMLpeCKJOdb+zCgRoLZ1aO6pyKChiOX36vYTIZvekmX3qbhlykS
	U8bW552QVUEdozl0cAqITf8uua6wEaWCCtjC/CGkjaWyEFXHfWHtWjhUwRgm8ur6oVt5QaDfOUi
	YHKlXjO6aXDSuKcFwU5ROq7GREvLB4cKWm+VjvsTaQw+c8wHWuJ9Hqt2p1WkbSJ/80u76gN9rpw
	E+S5VgcuKEzqpAzrfgLXSuTsIKhmdStpgE46bG0TzDbjGglNedi2g+0YE8N3fJF5pJKVFMbgICi
	56ZFHSyVCrdnUhCBhyMT8=
X-Google-Smtp-Source: AGHT+IEXAY0hNz2eOSoL0Hv03FAjM8+tLdCbApP/CpVTsWfXGDNXQB9mZEeEHfi46Teq/N/IO2sImA==
X-Received: by 2002:a05:600c:621b:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-47939e50ce2mr25774055e9.35.1765019508463;
        Sat, 06 Dec 2025 03:11:48 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311fbaf4sm124579745e9.15.2025.12.06.03.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:11:47 -0800 (PST)
Message-ID: <ae7dd616-f09f-4729-a15c-411d964461d6@tuxon.dev>
Date: Sat, 6 Dec 2025 13:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] clk: microchip: drop POLARFIRE from
 ARCH_MICROCHIP_POLARFIRE
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20251117-shadow-police-56aba5d855a3@spud>
 <20251117-bulgur-wildfire-a8c5a2b417dc@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251117-bulgur-wildfire-a8c5a2b417dc@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_031150_573801_6137E708 
X-CRM114-Status: GOOD (  13.62  )
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

Hi, Conor,

On 11/17/25 17:35, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
> symbol has been defined for some time on RISCV so drop it without any
> functional change.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/microchip/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> index cab9a909893b..a0ef14310417 100644
> --- a/drivers/clk/microchip/Kconfig
> +++ b/drivers/clk/microchip/Kconfig
> @@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
>  
>  config MCHP_CLK_MPFS
>  	bool "Clk driver for PolarFire SoC"
> -	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
> -	default ARCH_MICROCHIP_POLARFIRE
> +	depends on ARCH_MICROCHIP || COMPILE_TEST
> +	default y
>  	depends on MFD_SYSCON
>  	select AUXILIARY_BUS
>  	select COMMON_CLK_DIVIDER_REGMAP

This doesn't apply on top of the current at91-next. Maybe rebase it once
6.19-rc1 is out.

Thank you,
Claudiu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
