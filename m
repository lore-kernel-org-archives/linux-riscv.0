Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484D9C369D5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 06:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O4jqxFHA9SwV2W41Am54YOc4ZP333RSFzInH/qTRads=; b=XF5SpcDosWVqwX
	YoU6kDhq/zxb42bMhqg7JgoFNlhJibNijrghGOyG01VnsGjFTqHwnWB/j8Lgl7lJUDqSWo+vRv7Ig
	mPGS2M5Ccufec7syRuyCjJ7gOQtAB60BSRuP1RyZJW1QHVHK0x0TdwGqDB3IHUUZfX9e8aNVpxdFc
	y+bKoKts7ay179wm7vDh/EQbvGKZEpYHgpSI0AVqR81wRKfTEDbnP//oIzqxPEWkYYoJ/9wSQTjEP
	zCHfRNwHi0pq/iV59fBeoZvX6w89ApfMhoVgDUv2B7MGWiV+udxK+CgSo4sD6L3yPhR7l3goGsxSg
	m2L9tfXn9UIFmdTJVg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pwt-0000000Cxzq-3MMg;
	Thu, 24 Apr 2025 06:20:39 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pwr-0000000CxzA-1H9Z
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 06:20:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745475632; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZgWdWs6T4jDSmg8fPAFKBv3su7BYKlvoYG1bfveGbzjx7mstJAZVg7h/94HHVEemi1FjPlR7MyjS1sxI6XCxO4JcamM3/mMPtx9eXSYrn/DdQeNOJDpEh3LkDyN727VDE+OhAECv0sW+JfyLzfKeAI1pk8PlN/gQHWSkUNb2euE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745475632; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a7HW1AHqiaoZotNjYh30I6Q8Dv5nJzE7H5N8Hb9REWM=; 
	b=IwnTKoSg3U5E1ojVPfpbqcd5JbFncewrn2LzJf5MLCCzBcvjtuEMuvsbZmZ7JF3Phcu6nEZwtpElz92m3wObDCdsC9KmIU8lByu7y35tBhS5Aom9lbFqoxypc78/aR229cNDKpPxykU3RobLQ71rjwTnC97R8pbyz1+hDJIAVWo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745475632;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=a7HW1AHqiaoZotNjYh30I6Q8Dv5nJzE7H5N8Hb9REWM=;
	b=jtlCVo/au+kCuKDcnZvatUtMmtYJ+kaNW5G9/GsFpOADTN6NFoeWN4uSFrrUTbwT
	/AYg68byV6+qz0B8+uTePracXzNCMCRIl43yW3lTj9MdgAYcRvWkHBcib7ugUoGzMIx
	vuD2TJmdMBfoKNCPneXjQ2Kxg3RS9YvuC1OtoG5EZot5p5rviKuMWcAfKxLasYEkz/T
	KQ5Wya3mD5VHJ4HmLi5D7VRGFwT7oppwUaR74GYtkbB4zAxdNpJ96iaoFNZwkLEEv/E
	Q8N+lOWvgeJ8ynCmXRCco/GTHtno4laff/f7OHvDDpmyFQV0P6fPUQu1B22ueYt1tuY
	z7dPgxf1ug==
Received: by mx.zohomail.com with SMTPS id 1745475629816913.3831701579998;
	Wed, 23 Apr 2025 23:20:29 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 0/3] pinctrl: starfive: jh7110: support force inputs
Date: Thu, 24 Apr 2025 14:20:14 +0800
Message-ID: <20250424062017.652969-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232037_399697_FF6305F4 
X-CRM114-Status: UNSURE (   8.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The input signals inside the JH7110 SoC (to be routed by the pin
controller) could be routed to GPIOs and internal fixed low/high levels.
As the total GPIO count of JH7110 is not very high, it's sometime
feasible to omit some hardwiring outside the SoC and do them in the pin
controller. One such example is the USB overcurrent_n signal, which
defaults to low at SoC reset, needs to be high for the USB controller to
correctly work (the _n means low indicates overcurrent situation) and
gets omitted on the Pine64 Star64 board.

Add the support for hardwiring GPI signals inside the JH7110 pin
controllers, via two virtual "pins" which mean fixed low/high.

Changes in v2:
- Use virtual pins instead of special properties.
- No longer RFC.

Icenowy Zheng (3):
  dt-bindings: pinctrl: starfive,jh7110: add PAD_INTERNAL_* virtual pins
  pinctrl: starfive: jh7110: add support for PAD_INTERNAL_* for GPI
  riscv: dts: starfive: jh7110-pine64-star64: force no USB overcurrent

 .../dts/starfive/jh7110-pine64-star64.dts     |  7 ++++
 .../starfive/pinctrl-starfive-jh7110.c        | 41 +++++++++++++++----
 .../pinctrl/starfive,jh7110-pinctrl.h         |  4 ++
 3 files changed, 45 insertions(+), 7 deletions(-)

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
