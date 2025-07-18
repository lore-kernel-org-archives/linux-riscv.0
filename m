Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D818C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 08:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hpLMIRUzSmNSCI2xfO7fo+igjx+lMdajhTNUxgEtgpA=; b=wd+pY5IfwGHfJZ
	NcPzZTzZqdZwm8DXOzgL33g9vFBpGkwQ9rJGIMQEsMTcNuyyGO1S8eoZSTAIeEfmk2TsglKeQEd5t
	MP63OU9h68tEJk43PMdCAGT/x1ZZ1SDP8sqsq1e+apv+7cxPbyeozkaOXylAL6SDZoBjXFOYVn6KE
	YTdFJwmukImt/j0llU5G8LJeMpIN/VeI68T/LN6Hah8jnpuQopIGpDlyabkTqUOoPlroaCdocDTCJ
	mtEfo369ttIRIhMMUnkSha3Xiw+bzK/sFMBQHGImhKDWb8h/bqu17Hesi0ktg87DKd+SSySOkfQaQ
	GUOd0mNbD/os0NKtKEXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgw8-0000000C6RX-1W3p;
	Fri, 18 Jul 2025 08:59:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucghh-0000000C4hu-1m3C
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 08:44:31 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a52874d593so1461505f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Jul 2025 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752828266; x=1753433066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQUcoTZuNnVFMQcqVlD/dsEaFXowm3+QSDfAXy+mm2Y=;
        b=yfRNAKFPjKiNpTV/B7cKkdD4ujKPlKsEjOpJ8Vs6765XjY4us+fNXec4EdvuxG3eMb
         tQ67K8SphsRo4KjCFjvbwZhUj4+oLslFSPd2E2pnP0Pd7Yf3IWAl1b2898txxK1MKFSH
         +Q1qqPmAO8Ejap03JglqPAob7BI1HZt9v7C0Ofn00eOdkkR1dkCUDP6oEs0VoZsk5qwM
         EQHvM5MIHeUFtzYFH6sXdw339ku2rOZcyIoxvGUzDLv8+56AaB1f7WBNPFGFmCvRkumA
         uO2pM55ZGce5TiMO9BT2K9G7p8ARUPCeF4qVnlHpIukr5ZEOxoDfREj3x3sIHHTAcPTV
         i9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828266; x=1753433066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQUcoTZuNnVFMQcqVlD/dsEaFXowm3+QSDfAXy+mm2Y=;
        b=KJ+kZ1xJaNSGE2Ec2QpmV4sFiaOYLYIaKsy2vtgwx0R5pQJihYXKzh/hzPosHSgeWd
         grUwpU9E0eYCLtqWD4lul4hDH1I9FQJI9DjDhLeFUCLRkvIgcXLYiidS500+av1ZSLuz
         b+GLRmh0NXQLAvfHhc4R+nEEHTiZU/y1dSr1UGG6R+SuJZE82QHKEmTAPBWZ/n/7unUQ
         YybbuCmMTuQ+Rr/twF3qvc6tlwmjoAaK4bPXUbZmLonhYImubel7J3Qtd2wp7pJROhpn
         a7FudMFjC8C9FzIJsElb+N6P7nXN+3OwFL+SN08iWqeQ5t5qC1UukgjChVHDS/bzNgM7
         KV7w==
X-Forwarded-Encrypted: i=1; AJvYcCVIdkssCuXimF8bsKMCadjyWlwetxWrUk+ToNzTFDqsrt0W3ll5j+Br9o7GOaLhHvTJ1aEWJ/uawpQpmA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyxu00+VrTSf1ikwl0ub8/LBC0hjVyRpw7LjmazO4C6vhUkRJs
	4p66RY95R+ojHWyf6aRbmvLwvWR54MzqOqfrt9CB8w4TYTZlDYzrY7nDd79Hla+wKl0=
X-Gm-Gg: ASbGncuEimK9EfSU14XO8Ygnr2JYlIxuVWoM9tyopxY3pl7RW6HSVn//qqBCxsqN/kM
	CgTHybdDvLEqWpb0EqIu6XlJqGHJWxYl6xRIM+TFnUqF4wRH6cesNLFQXjlFJ47td2+tcqeiGOc
	ALEkkSiXhBw8Ymzg/7sTagTdQ1iGdXsW3h77AxKl+cd4CUR7EJD78Qk8GhHrTDnEas4VsBnJVw7
	Wjm5jlt3HuBpJ7Wsm/B+XgWaGD3lJVvxZffhh5HLMdgxrd9I/Pr2oaemyowJQCe2yq5xzGZgds5
	vksJjdzj76gr+uCcMtsFTpnoqLga9kvXzm73XXuE7uuMCyeSp7WT2Cvch6NFQ4VZI9XwJv6tYyW
	ZXP2kZbmreay1ocU+rfG3Uqr9uKtZCyVDG/D2n0jN/Z5x1Uhp
X-Google-Smtp-Source: AGHT+IF1DTxp68FxooAN2QX2xUqfuF3c4Mb9kU6Zx0w2YlTbaB6gQlG+uHFwhWQB3m0w5QaqnggY7g==
X-Received: by 2002:a5d:584c:0:b0:3a4:ef33:e60 with SMTP id ffacd0b85a97d-3b60e51844bmr7888727f8f.40.1752828266224;
        Fri, 18 Jul 2025 01:44:26 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:9aa9:dd5c:bad6:e31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45627962384sm58208115e9.2.2025.07.18.01.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 01:44:25 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: Add initial support for OrangePi RV2
Date: Fri, 18 Jul 2025 10:43:37 +0200
Message-ID: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_014429_714253_2FF35FFC 
X-CRM114-Status: GOOD (  13.56  )
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

This patchset adds initial device tree support for the OrangePi RV2 board.

The OrangePi RV2 [1] is marketed as using the Ky X1 SoC.
However, after research and testing, it is in fact identical to the 
SpacemiT K1 [2]. This is supported by the following:

- Similar integration in the Banana Pi kernel tree [3], which uses the 
  OrangePi RV2 and identifies it as the SpacemiT K1.
- Comparison of the device tree code showing a match to the OrangePi RV2 
  Linux tree [4].
- Locally tested the OrangePi RV2 with the SpacemiT K1 device tree, 
  confirming it boots and operates correctly.

Patch #1 documents the compatible string for the OrangePi RV2, and 
patch #2 adds its minimal device tree. This enables booting to a serial
console with UART output and blinking a LED, similar to other K1-based 
boards such as the Banana Pi BPI-F3 or the Milk-V Jupiter.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]

Changes in v2:
Patch 1: no changes.
Patch 2:
- Added aliases section to the device tree.
- Removed the memory section, as it is populated by the bootloader.
- Updated copyright header.

Here is version 1 of this series:
  https://lore.kernel.org/spacemit/20250711183245.256683-1-hendrik.hamerlinck@hammernet.be/
This series is intended for the v6.18 merge window.
I'll follow up after the v6.17-rc1 is released as suggested.

Hendrik Hamerlinck (2):
  dt-bindings: riscv: spacemit: Add OrangePi RV2 board
  riscv: dts: spacemit: Add OrangePi RV2 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 40 +++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
