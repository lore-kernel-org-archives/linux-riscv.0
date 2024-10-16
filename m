Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF66D2A541
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=si1lFiCF8yBaJ/E3qjftiyzjj2M/1doPadwNSG70/aw=; b=0zOQNNmoiPUaS2
	Xl1ih3ljMG8L/AEjd0xrILRj4Isj4rsgRu8mrYfy71TPDo3db4VUvlgdTj02EWAkLdxgq5BLtybHy
	8MQ9lL5y4K1bx2R/A1UEa8W99NzajHEsJTr9OScKLMR+f+WoKy9tUfgm+oOAKH7DRM/SWcfDHjf1f
	pmNPY3UWO4pA6SelOAC1knqe98LWrwTjIwTm7cmRTRm0QWOrb+7BkW6TsXDavTQFzBuYbAxxfdv59
	Oomr2AsnSdXB2BRqhEQVHNPCI5XEelZveomtm2d/ZVmsiYvq8zPoE1Mw2zbGRnN9GMGx0vTwh8rUx
	GaI+TsN8H8okKfi742oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t19fB-0000000CnVC-0Meh;
	Wed, 16 Oct 2024 19:26:29 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t19f9-0000000CnUk-1YJa
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 19:26:28 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6e34fa656a2so2569567b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 12:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729106786; x=1729711586; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qF1CPFXdtiKKNkyFgCJvjZ3vw2L49qf3y345BCTNAVk=;
        b=RpjtxOacCnakXZqcTOW7MNT9vK4g9qJLnnPBwLBZioDj91uCgAld48JUoD/YXk5Q9C
         gos01DufqSBIByB5ySqQn21WgVPN04ByW586T8VuixH1aJDNe26jrCY6P1sZ9SACMP11
         NtR8GNxb0rIP1RTUr4uDcIFHrWoBcLvlAeIlBS9+aDIoyxHK1pKQeVMkn6TbrcOFkvhd
         Dx9F5qXl0QC6ESX7Hotm7alsCB+60J4/zZSrmkWFmycuCkcYUG6yz3UpsuHT5nOLleq/
         FmfIjRsEN4+1QBNdGAEkwoE1UFNGKOQKt9ca5+MecGPZN2lcTraZuP2JkkVzcUcfMwZs
         ebYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729106786; x=1729711586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qF1CPFXdtiKKNkyFgCJvjZ3vw2L49qf3y345BCTNAVk=;
        b=cpHRmgVxIxyj+kdOUHTewMHGZvbHWDDS1BxyoC0JBpgATDapKc/gBlEWkMghYNPa5J
         OOcdfCtM0UYBJyuBPrshAT/He/K69IehWVSFTKhMxPJ5NN8Ft/Fw4H3Yjn0hm8eUwaOX
         Fl+XL1bnfm9zzYjLphp9TfYUbFRl6MmgV6cD67jRkwo0zOGef2BRnVP/l5X1GwjX+7OB
         kPPpIqhPHmDU9W8If/H+e0kKRzLeAd7yDMs2X1YPV+iTHmIsO2et/yPlpPrEwPBnywj6
         EHiJ9CVOUTQbRDPdfL9qhMOHm6gZnjqu456quq5UtUyte2RGCP9nKE+t3cATBd1NW5W9
         nLRg==
X-Forwarded-Encrypted: i=1; AJvYcCUiRtEX1u2GHqn5boXWk1iPfofFZsk2S2I2LtIL5jGGPPSJKyh2uPUjH+ABuhbTLGqa6FffD8xmjE56JA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7e//4rdJTR20X6H5VMJNbR4vDFcTns/l/XXeeRDxz3e4SgUVe
	CuCzf5I00yBXYSeciZK9eggZj+opIqTkwYImdTGaXXQOOJmi3pepUN8ImvC+8es9E+XVz/zOXct
	YbDYPX/xVjJ+rX/q6Njx2VMHq3wg+rg7kKlGqbw==
X-Google-Smtp-Source: AGHT+IFXeFHfDvqW73HouL+c1fbM3uLW6xJKhKWcpriChOsEoYU7WskDnaN9ETOimjw0exomO1RbBjqJENYx33j6yHo=
X-Received: by 2002:a05:690c:ec4:b0:6e2:c5d:4edf with SMTP id
 00721157ae682-6e364100665mr136112037b3.9.1729106786143; Wed, 16 Oct 2024
 12:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
 <20241016-shallot-nerd-51eeba039ba0@spud> <20241016-dandelion-hypnosis-9d989bb2fdd1@spud>
In-Reply-To: <20241016-dandelion-hypnosis-9d989bb2fdd1@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:26:13 +0200
Message-ID: <CACRpkdbJKWcjBG5ejwsNEgnnGWj69TAtKbgaHP3NiPM5GbiGQw@mail.gmail.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_122627_440372_368CCC5C 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTI6MjnigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBXaGF0IGRvZXMgYnJpbmcgYSBuaWNlIHNpbXBsaWZpY2F0aW9u
IHRob3VnaCwgSU1PLCBpcyByZWdtYXAuIEkgYW0KPiBwcmV0dHkgc3VyZSB0aGF0IHVzaW5nIGl0
IHdhcyBvbmUgb2YgdGhlIHN1Z2dlc3Rpb25zIG1hZGUgbGFzdCB0aW1lCj4gTGV3aXMgc3VibWl0
dGVkIHRoaXMgLSBzbyBJIHRoaW5rIEknbSBnb2luZyB0byBkbyB0aGF0IGluc3RlYWQuCgpJZiB5
b3UgaGF2ZSB0aGUgdGltZS4gVXNpbmcgR1BJT19SRUdNQVAgZm9yIE1NSU8gaXMgbm90IHRoYXQK
Y29tbW9uIGFuZCBJIHRoaW5rIHRoZSBkcml2ZXIgaXMgcHJldHR5IG5lYXQgYXMgaXQgc3RhbmRz
LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
