Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED88E9D410
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r6vJ/V4gCPsNzEjr/xGsTVoVWILXrD65stsejHA4Y3A=; b=zmtQGHXxRRxaNI
	UpPtfIkcTcTgM6fMM+UM2A0F5FyfOgFHBf4pAr/o2LfAGEKBP6PiVLkUIqJJDPBB2dGTiAY/9uWak
	B6U2qjPs2RK48ZbO0UikxG/XXG6vGrZrImHXQXxF5v131k4xcS3xJlAhYCp9XZx2VtewOPJLuKJmK
	oBHMZ+KCfNZU0RSxfsi8nk5mPtXiYuslfixwpJLbThH2MBa0R/Re28XPRTmrzAelAwZoFEmfjOfsp
	rMaZ0AgBHtGdlIEyMKUpJdzU1sjvY7YtXO6iA/Ygm6LzEP4b3Ct8TKT+88+mCTFd6jABBmRr0PqH3
	cEGeaRkmygJI6twuprwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfuC-00000008m8S-0AGZ;
	Wed, 04 Feb 2026 16:39:04 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfu8-00000008m7w-2GSO
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 16:39:02 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DB3F940372
	for <linux-riscv@lists.infradead.org>; Wed,  4 Feb 2026 16:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1770223137;
	bh=Rp00X+xKKqyCYdahSrblPa7LJgKvIx3gSCIrSAbBoco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=sayAvqVn5P6+VOwBcRmV2ETINp8f2i88/Eyqon7wGOw8+qyq2EdwInRI9U4THJt9f
	 xrritaMWSTE6ARY4Ozk/nNt/fB2eKad8mWZExWHtBwaAol0UCmdpEVHeEMt8chfY4B
	 pKmWwiiFr7sGO2cb8T2906lE3LOAOtY/L90VDfJNCcaeI8DYPxnfmZ/dOPe7JZIZWL
	 aK36AM1hYRiTLpEem9OLt3z7gp+C5EjTq5rtFzzYnIgssWvaID2csSyULyrHYS2jc6
	 CHvV1/VfVjJ9+fVbES7/B6DrJ0QI5RedOLaM1lHZh2Fe49giELHecPBtcKHijEu+jb
	 z0U6QRyeyEgbrQv5QCKW8WlPxsChsieUF9uI/AUz1SueJ2GoJ0l9J7elDiesQL9gTN
	 F12tEwC89PfYY1faxWucMKEYwZVZlbMlr8QWcH9KIs8jFWAOj/8BkceZyBTlOmGlgb
	 9QwSHbXDXpSfZa53u37GHVuUwZmESoeCN/q9QbKg4CY9xd8oMpiTpAo7nC+ZUxtF23
	 XgSa5xhvE1NfVAxUwb/Fezsk6VrvEDK7tW2eWVJPLShcbMJ8tGUaQQgtBVraBPp1q+
	 iLMFBFUz7KMKqoEijYEevq68lWh2lldi5pRO3eA3zjL3aiXuZUVeBti1+8J+YBprW/
	 tr0uhWlaRV0bCiQamd8ZnEy0=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-435ab907109so29439f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 08:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770223137; x=1770827937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rp00X+xKKqyCYdahSrblPa7LJgKvIx3gSCIrSAbBoco=;
        b=bpb3v23/4DBv+kMhWJeXZoARBJ1ZQ2ovP1ubkCX3rS8x9Ccz/XKq3i+lD8wq1Aj+ZV
         3JJtQovQltH300tFdS19yOymk0ib9CW/kNgy7QNOsClijWqZyzGFiBZVvlF4v0A6Xsa4
         Jk2AmpsabG9b/MzVXejJ4gV6H73dVoElPzbpUqO4pz6PITupgXfP72fppzv814PNYUfk
         ol4iJWCy79tsmwUXW4d5dgH5WL5Oga5nysIHvwe3EnFyQ+U1Un/vQ3ZZmQzOG39F+UEx
         EYSh2tYmryF4AY1+TMTuX0GHo+4bDd94zgkFA7NEPDRnayJf2GLIGgixV21P0jve4Afl
         l8og==
X-Forwarded-Encrypted: i=1; AJvYcCU+lIyp/F3r2KU4f9JNPhH8rgZfwQMOBmfzhZaYKtA9Og/Qg+3mJ6tBZdl4f+Vs3U3TPHYK6DVrDiixsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5MP/rZjwAcTSo0XspouX/Pbgep4uSXkAIfRgLCcv8D2QV1wRh
	j5IbAfaosXV8WVJEmhs/DW+lRasDZzefGLXH9Dth+cikX0LkvWyOX2YYifkWSSPEaK//3WK50do
	Tvlab76yDTQHgCzDewr6QdScI1VEpUcceaUdMTspklrdZLnitE6jzoySbzDLW5VXXxtmGSZ9DkY
	A+N2FBwpWWaQ==
X-Gm-Gg: AZuq6aJ5VacEC4TQNMJhRxVTYUsjHc61/KOCI/BB0Ubw4GT+movA72BWr2xRk0hCHpB
	VJ0Lt/fvAqt0f6bedbJA2PPFDnYlzEsqFjeafSty8nbI7qjvTg6ASO8D/l9U+EVDKQa/G97S5Xp
	H7hHvXn/7RzW8mCDlHfTN92I1fc0BMy1yXqwEOB4k9SHAoB6CCT/5ube1J40envLJ3FWnaVyJO9
	ZB5n96NKOx4eJZo6SX5/VYi7hUPkli3x2R51Qsug3FXSgOWzaXA6CuuxtgpWQSvCLAggl+X8lcs
	JKAEH5XSL32CqguXL/7KnL+RIv9QibIULoKbWHmJxF81TMKv3AWuca0YwOOnkE5X+kC13vAJhsh
	ePAwBG5ImvKJrlKj2mJcRMbJlXWZQ99QJdtwN6fMAQawo/THhMf/aMY7AOL1RqpgxgA1zT/xUYA
	hqrCX8ffM=
X-Received: by 2002:a5d:5d0d:0:b0:435:e3bd:5838 with SMTP id ffacd0b85a97d-43617e3c9bemr3476208f8f.25.1770223137437;
        Wed, 04 Feb 2026 08:38:57 -0800 (PST)
X-Received: by 2002:a5d:5d0d:0:b0:435:e3bd:5838 with SMTP id ffacd0b85a97d-43617e3c9bemr3476162f8f.25.1770223136979;
        Wed, 04 Feb 2026 08:38:56 -0800 (PST)
Received: from [192.168.103.128] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f9esm6385227f8f.28.2026.02.04.08.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:38:56 -0800 (PST)
Message-ID: <46d5d249-8cf2-46d1-a90c-1f2c5f146e15@canonical.com>
Date: Wed, 4 Feb 2026 17:38:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: dts: starfive: Milk-V Mars CM Lite broken-cd
To: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 E Shattow <e@freeshell.de>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260204101602.30184-1-heinrich.schuchardt@canonical.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20260204101602.30184-1-heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_083900_990096_4C5D84DA 
X-CRM114-Status: GOOD (  17.84  )
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

On 2/4/26 11:16, Heinrich Schuchardt wrote:
> The card detect GPIO depends on support by the base board.
> 
> Detecting an SD-card did not work for me with a Milk-V Mars CM Lite
> mounted on an Waveshare CM4-IO-BASE-A board.

The schematic of the Waveshare CM4-IO-BASE-A board is available at
https://files.waveshare.com/upload/a/aa/CM4-IO-BASE-A_V4_SchDoc.pdf
showing pin 76 is not connected.

In https://forums.raspberrypi.com/viewtopic.php?t=291041 the Raspberry 
Foundation explicitly wrote that pin 76 should not be connected when 
using a compute module socket.

E. Shattow pointed me to a board
https://github.com/NabuCasa/yellow/releases/download/v1.3c/Yellow_v1.3c_Schematic_git.8957b440adda.pdf
that actually disregarded this advice and uses pin 76 actually as 
cd-gpio. This usage of GPIO 41 is a property of the specific base board 
and not of the Milk-V Mars CM and should be described in a device-tree 
overlay if needed.

Best regards

Heinrich

> 
> According to [1] SD_SDIO0_CD_GPIO41 is connected to pin 76 reserved.
> The Raspberry Pi Compute Module 4 IO Board documentation marks that pin as
> reserved. The Raspberry Pi Compute Module 5 IO Board documentation
> marks the pin as VBAT.
> 
> Remove the cd-gpios definition and add broken-cd.
> 
> [1]  https://github.com/milkv-mars/mars-files/blob/main/Mars-CM_Hardware_Schematices/Milk-V_Mars-CM_SCH_V1.0-2023-0905_Lite.pdf
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>   arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> index 63aa94d65ab55..566b0bdc2800d 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> @@ -13,7 +13,7 @@ / {
>   
>   &mmc0 {
>   	bus-width = <4>;
> -	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	broken-cd;
>   	disable-wp;
>   };
>   




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
