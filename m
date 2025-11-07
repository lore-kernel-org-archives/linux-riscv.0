Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B2FCCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UpoF+vH03eqiaWx3zNtVHyEUymFCTzWW04QOiNQAg1M=; b=HcCSEK9EQGUXGs
	YncMjeYB1xKWyJjUBrMksiaYV8zqmt0aJ4rZo0FjNmh4/Z+CsR/LSpRDmKEq8xXKmMneayFza3CkA
	hNkyXBUsGgZPLrF6OgMKqCxtZAK7bvIH62WfNyhIdsD6tX10KmwqhhL/9yNl6oiITQZNEtv8sYoKd
	ON5tAaUmC27J+5S1j7IkolUrcrj+kabfOBSK+GDmEeKEMLijYDWiPLVrFYy7P4y9lc4dtnIxRebB0
	PGMpCzV5LD0d+m3oqn03IDJjx2h1SSI7uG/vmLv43KqXAsvZddQB+yP35AhXCrmTj4fXrE5pJAIl/
	wzmmmcY4WFW1bO1t13EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKXW-0000000HCES-15B5;
	Fri, 07 Nov 2025 11:21:58 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKXS-0000000HCDO-2nXz
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 11:21:56 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D943F4196F
	for <linux-riscv@lists.infradead.org>; Fri,  7 Nov 2025 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1762514509;
	bh=4vu1ZL+qmEbCFgVVYC+Kd3K+ffetq+SNlu+bOuuJkH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=jPKgscwNXrczObXgZcMj3VRGHqCyU+Emua1A/B+wPGaeYBu0KLD7+X03GKaDNPwE/
	 L3OnEiCNu6X6+IT/+Cf3fp3LoiW82L81cHEPq0AEMRwBOVjVAKcGYzHG0B5Ok318Iu
	 r9bXXlRmLHkGg20xkJmgcxP79fnhqrdm6RhmAE9y0AMNGib/6YumPL3r1B47WZSfTV
	 dFAeP2Kz2plg5KEn841zuGUioL90P80k/lIpePteBvYnRzI3xPVKdpNyCyh4Rfnu7Y
	 jKqvD7UPLLd1AoH9OnUJE30NhTgt8O5rcsh04Uc03LTkMbIvpw6wBpDKi2OgpLkHWR
	 MdHGoJ6JlaUM4lJYcQHC5ycTTpKKRe+pR2pJ70/xhRN6y5zQ7mizlV7+Ww9apGYdMZ
	 i078Qb5lsoudGIcDEbhE5YSSc4HhuomMgLcYKBd5e/rnV8Hr4VQ5l5Nak90qv9soAj
	 +bkiRXcANQkrBRcq+94+g8kCE5C1q+hi5GPgDL6ZrgbDbCT6P2QJRKjbs1+kcKcDpH
	 +cPNf9Wx+nfEcvcsZD5JoYFP9hrnmuTASW4nhvAIiDs1nSk1OVZK8unUn99sVxwfvS
	 0AwqZV/oHs5eIzTwZYTrFjtDlKzmLjajfgMXNz0iqhe/SsYCGQmuzsQPGYYvHQXPCf
	 896/Z6PZb5UqjhWiH37XPCVI=
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-59427500731so397400e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 03:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514509; x=1763119309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vu1ZL+qmEbCFgVVYC+Kd3K+ffetq+SNlu+bOuuJkH8=;
        b=HiVzWnMa5a1V+4G2ws52CTVcm0Az5J4csnmotLfqCcnu3uptQIpv9bKD1M1Un6OsNU
         B+zb1rAeoTWuxeS0l2ksWFVn8mrVM03LrROlzmqc2kjOwoI/rCyGROA/cnTmU6LH8v49
         hs7x0zE0OI16UfsVUosmzpYY5gu06VW56zns03xGf1ahYBQ8eeb3530Gg+FZEZ/A0FpR
         s2th9K56PRWKt8z8rD9xre6HSnJyiFtyP3aeFeEGTj3edFq8bLabrOLNutO78CHQ+2c7
         DFoVQvo/N6/dO0t+qdhBlVDjvwiLPm/lHYea5Rd2PVFjzLzhku111du9M7mKy+Q40sbo
         PAcg==
X-Forwarded-Encrypted: i=1; AJvYcCUs/FcqAfzUQmGy/NvwH70rquGooxBvMpkk3YnwdEAMnNZ3o2b0Z3EoT6IMw9b8bBPP6m7NRetOSMzwpA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkz1qNye8GQtTkIp7h/WkVd8b0fXGX8eRKxM18mNX4a8RW/fll
	VOKb9g3gfhvFEDoL2FJfAgZ94ppegpguHzsS3ijP43d5Edhi9PtDoyxAm21QOrVPRNgbJM/nnWX
	WQ8pS5w/QGE64JiW0Mu5vgf5uw6AG+1C2g2RggEpZwNKG6zuc0rFzMF+/DshvwOGUoFDesASZUh
	wggm5bzct9Mg==
X-Gm-Gg: ASbGnctfDK6amBZK9ntZ1CHcQm3ET0Hjt3idYD/ewjIou1LGoI/33VjXSgNBsT+8kih
	bfJPjcS0CbAEIAyFxyn3X6pJG9+saD2G+sLfZGOXTOADgZQeIU8LmRKh8o5DgUMbrO/2hRcQuhm
	YkNi0du2vjs6yf7ENCzsm7LA1kIODxPWNrCfkxxYxoS/tk1wDivvrK1urZT6z1SgWH0669JBUio
	bGdPmWnEWEryueQGzCf57bXhbhESBrYxeeIgZRpMe2E/ilgchOKyAQlrz9lQhF+2ewIbvTMVAEb
	GL5Tg+7P2kqCnq7yRsl2Ng8rpDpA++jAT2ttPImIsCLkxWkC6oskFuT7vW8ERHwABDQ6uLCqPdk
	ZbLUtgbGOm2Le0q+YfgyPRnlSLRXfseObnCr9kLVTTySYFA==
X-Received: by 2002:a05:6512:6c9:b0:594:2e9b:f291 with SMTP id 2adb3069b0e04-59456b4d9c7mr941855e87.9.1762514509105;
        Fri, 07 Nov 2025 03:21:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMxJiPYMbXhmyW6GmkAmacMyTL5nlXaV1J2L1emWF3kyohSqrskKsInlGn9YLKNL5Se+Juzg==
X-Received: by 2002:a05:6512:6c9:b0:594:2e9b:f291 with SMTP id 2adb3069b0e04-59456b4d9c7mr941835e87.9.1762514508612;
        Fri, 07 Nov 2025 03:21:48 -0800 (PST)
Received: from [172.25.183.149] ([93.94.208.154])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a019d2asm1378089e87.26.2025.11.07.03.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 03:21:47 -0800 (PST)
Message-ID: <6d0fb6aa-6d88-4069-a5e5-9e910523888e@canonical.com>
Date: Fri, 7 Nov 2025 12:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
To: E Shattow <e@freeshell.de>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <c05d8bcc-3024-45cd-8630-b0595682e778@freeshell.de>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <c05d8bcc-3024-45cd-8630-b0595682e778@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_032155_105957_5E7F748B 
X-CRM114-Status: GOOD (  22.41  )
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

On 11/7/25 12:11, E Shattow wrote:
> 
> 
> On 11/7/25 01:55, Hal Feng wrote:
>> VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S industrial
>> SoC which can run at -40~85 degrees centigrade and up to 1.25GHz.
>>
>> Board features:
>> - JH7110S SoC
>> - 4/8 GiB LPDDR4 DRAM
>> - AXP15060 PMIC
>> - 40 pin GPIO header
>> - 1x USB 3.0 host port
>> - 3x USB 2.0 host port
>> - 1x M.2 M-Key (size: 2242)
>> - 1x MicroSD slot (optional non-removable 64GiB eMMC)
>> - 1x QSPI Flash
>> - 1x I2C EEPROM
>> - 1x 1Gbps Ethernet port
>> - SDIO-based Wi-Fi & UART-based Bluetooth
>> - 1x HDMI port
>> - 1x 2-lane DSI
>> - 1x 2-lane CSI
>>
>> VisionFive 2 Lite schematics: https://doc-en.rvspace.org/VisionFive2Lite/PDF/VF2_LITE_V1.10_TF_20250818_SCH.pdf
>> VisionFive 2 Lite Quick Start Guide: https://doc-en.rvspace.org/VisionFive2Lite/VisionFive2LiteQSG/index.html
>> More documents: https://doc-en.rvspace.org/Doc_Center/visionfive_2_lite.html
>>
>> Changes since v1:
>> - Drop patch 1 because it is applied.
>> - Rename jh7110.dtsi to jh711x.dtsi.
>> - Move the content of jh7110-common.dtsi to the new file
>>    jh711x-common.dtsi and move opp table to jh7110-common.dtsi.
>> patch 4:
>> - Move the uncommon nodes to jh7110-common.dtsi instead of board dts.
>> patch 5:
>> - Add jh7110s-common.dtsi and include it in jh7110s-starfive-visionfive-2-lite.dtsi.
>>
>> Changes since RFC:
>> - Add jh7110s compatible to the generic cpufreq driver.
>> - Fix the dtbs_check error by adding the missing "enable-gpios" property
>>    in jh7110 pcie dt-bindings.
>> - Rebase on the latest mainline.
>> - Add VisionFive 2 Lite eMMC board device tree and add a common board dtsi
>>    for VisionFive 2 Lite variants.
>> - Add usb switch pin configuration (GPIO62).
>> - Improve the commit messages.
>>
>> History:
>> v1: https://lore.kernel.org/all/20251016080054.12484-1-hal.feng@starfivetech.com/
>> RFC: https://lore.kernel.org/all/20250821100930.71404-1-hal.feng@starfivetech.com/
>>
>> Hal Feng (8):
>>    dt-bindings: PCI: starfive,jh7110-pcie: Add enable-gpios property
>>    dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite
>>      board
>>    riscv: dts: starfive: Rename jh7110.dtsi to jh711x.dtsi
>>    riscv: dts: starfive: Split jh7110-common.dtsi and move opp table to
>>      it
>>    riscv: dts: starfive: jh711x-common: Move out some nodes to jh7110
>>      common dtsi
>>    riscv: dts: starfive: Add common board dtsi for JH7110s and VisionFive
>>      2 Lite variants
>>    riscv: dts: starfive: Add VisionFive 2 Lite board device tree
>>    riscv: dts: starfive: Add VisionFive 2 Lite eMMC board device tree
>>
>>   .../bindings/pci/starfive,jh7110-pcie.yaml    |   4 +
>>   .../devicetree/bindings/riscv/starfive.yaml   |   6 +
>>   arch/riscv/boot/dts/starfive/Makefile         |   3 +
>>   .../boot/dts/starfive/jh7110-common.dtsi      | 653 +----------------
>>   .../boot/dts/starfive/jh7110s-common.dtsi     |  27 +
>>   ...h7110s-starfive-visionfive-2-lite-emmc.dts |  22 +
>>   .../jh7110s-starfive-visionfive-2-lite.dts    |  20 +
>>   .../jh7110s-starfive-visionfive-2-lite.dtsi   | 126 ++++
>>   .../boot/dts/starfive/jh711x-common.dtsi      | 656 ++++++++++++++++++
>>   .../dts/starfive/{jh7110.dtsi => jh711x.dtsi} |  16 -
>>   10 files changed, 879 insertions(+), 654 deletions(-)
>>   create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-common.dtsi
>>   create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite-emmc.dts
>>   create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts
>>   create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
>>   create mode 100644 arch/riscv/boot/dts/starfive/jh711x-common.dtsi
>>   rename arch/riscv/boot/dts/starfive/{jh7110.dtsi => jh711x.dtsi} (99%)
>>
>>
>> base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
> 
> Small nit that "lite-emmc" is confusing together. In patches to U-Boot
> dev mailing list the EEPROM product id is demonstrated to be with "SL"
> suffix when compared to VisionFive 2 (JH7110) so I suggest avoid
> confusion in upstream and use for VisionFive 2 Lite (JH7110S) these
> compatible names:
> 
> starfive,visionfive-2sl-lite
> starfive,visionfive-2sl-emmc
> 
> Also filenames:
> 
> jh7110s-starfive-visionfive-2sl-lite.dts
> jh7110s-starfive-visionfive-2sl.dtsi
> jh7110s-starfive-visionfive-2sl-emmc.dts
> 
> What do you think?
> 

This is a serial number for the Lite board:
VF7110SL-2310-D002E000-xxxxxxxx

Here E000 encodes that we have no eMMC.

The S is part of 7110S which we already have in 'jh7110s'. And the L is 
already decoded as 'lite' in this patch series. Duplicating this 
information as 'sl' as you suggested provides no benefit.

Let's just stick with Hal's suggestion.

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
