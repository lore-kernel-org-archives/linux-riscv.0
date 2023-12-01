Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25B9C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 11:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CEv3nYeMFxuVGt1bgqIt+j1auZ3IajSfO2MxQ3xB6N0=; b=mE+J0eghvsmfa2
	uAsE8+sASZd7uBfYlf5xR8Ux3OFF3U7NItZfshwX0wutjOqas451irO1n11dfnsMM5fspRjRn76CL
	E11XbmQom7mwGvQ5qZhTBFjcnezCIRBmvJGAF9pklSZM3QgbxNvWYIYRJguz88MYfMCuNyNMKMB9w
	eJHaZhFW4+L+mZ65yP7/3+kGdV5YIseiSb49xVaBARbhhy7x5gwq45uWq6elh/0A5RBqkhbEEUS/N
	usFFbCgf48tXVoNFXBrvXOL9mENvyq1QlRMbnbbxE/ws6Lfuo5z4Q555EQoR64ySahwRyJ0EASa6I
	JXOnFeNaq4ExRlBOXChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r91OE-00DILk-0p;
	Fri, 01 Dec 2023 11:08:58 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r91OA-00DIKT-30
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 11:08:56 +0000
X-IronPort-AV: E=Sophos;i="6.04,241,1695654000"; 
   d="scan'208";a="185005220"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2023 20:08:47 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B9FDA40108F2;
	Fri,  1 Dec 2023 20:08:42 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/6] Add DA9062 PMIC and built-in RTC support for RZ/G2UL SMARC EVK
Date: Fri,  1 Dec 2023 11:08:34 +0000
Message-Id: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_030855_104505_45A7245C 
X-CRM114-Status: UNSURE (   8.56  )
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

The patch series aims to add support for DA9062 PMIC and built-in RTC found
on RZ/{G2UL,Five} SMARC EVK. On these platforms there is no IRQ populated
by default. Add irq optional support and convert the bindings to
json-schema.

Biju Das (6):
  rtc: da9063: Make IRQ as optional
  rtc: da9063: Use device_get_match_data()
  rtc: da9063: Use dev_err_probe()
  dt-bindings: mfd: Convert da9062 to json-schema
  arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and built-in RTC
  arm64: defconfig: Enable Renesas DA9062 defconfig

 .../devicetree/bindings/mfd/da9062.txt        | 124 ----------
 .../devicetree/bindings/mfd/dlg,da9062.yaml   | 220 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi |  29 +++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/rtc/rtc-da9063.c                      |  88 ++++---
 5 files changed, 290 insertions(+), 173 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9062.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/dlg,da9062.yaml

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
