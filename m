Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49487CD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 12:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6QyPZ4P2SSejuavXwxktpNvXghwqBPecDE9AS9lz46A=; b=Y2n0Itw3u2P55t
	8ox/x55t7uXT0PiUas/YZwlst2aJ0z8K4eBWE/V8i1WT93AwSGS1wyyGOzRHCiK9bGbzSEPz4Xapu
	W60RJwElgoZSvIwvISjhG7ult7IOnbfU2Lfa3/QuPMVFglwK8ZRyJIzJvBwMqK+Z+uFZnQGTeSwBd
	XabI1IkQNX/Yomw6juIWokhiwpcmJTSHOG71aAhr+BsvqRDOqIh9Oi9KY6o3/+Znm181s1ydL6Fdp
	YTFIFLn5wfdT62BnhBBGKmy52NNpxKXEJxrdn/WVzHc0t0fxiiCPie11ggNeE2U1R9JZ+rYNIY4nX
	UAZOJN3kaELsSs/PWv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Ii-0000000E9tB-3FXp;
	Mon, 15 Jun 2026 12:20:24 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Ig-0000000E9rh-1FZ3
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 12:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1240; q=dns/txt;
  s=NAESA-Selector1; t=1781526022; x=1813062022;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AXq/7QTdQmljzH1gjNuvNWvgr9Xn6XXBdRnyML2gxUQ=;
  b=mEL2+3dV3Ik7Q74/bTfkLffAX6ks0YmrpwdBSEkb69pwzW3g1Iv7mxGT
   ytJ6+BSK5LIOvnl9klhGrYWuyeCHX2Si/JlQNFin4VUYuHiMpaXiLTfxx
   lRUFLELuAEJxyfjZeFKD2BESnU7Mrfj6VPxZM0tzBbmyAHtMJ/a/xV+Dc
   Cwiy9litd+g3l4ich7UhtzpCdi1PTABTrSAm50ZRoNp8FS2cH7F2oX5Z7
   Bk9Lt7O+Ag5RKVjZM/nH+xkIXqgDUDTo18yCWhIpN4pKJLNgrwR0fQUhv
   LRmsX7D9512kS/CA2a+8A1MmCCpygFzUlnVabh29bLv02nLvQkZMdOlo5
   Q==;
X-CSE-ConnectionGUID: ySim/T6SSNm7Qs51og01Jw==
X-CSE-MsgGUID: 5DERkXE6QDKCnrPsuSEBGw==
X-IronPort-AV: E=Sophos;i="6.24,206,1774332000"; 
   d="scan'208";a="55984197"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 15 Jun 2026 06:20:17 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 15 Jun 2026 17:50:16 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH 0/7] riscv: eswin: eic7700: Add support for clocks, resets, pinctrl, HSP power domain, I2C and watchdog
Date: Mon, 15 Jun 2026 17:50:09 +0530
Message-Id: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Jun 2026 12:20:16.0751 (UTC) FILETIME=[531C17F0:01DCFCC1]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_052022_423206_F0C1E1E8 
X-CRM114-Status: UNSURE (   6.77  )
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

This series extends the ESWIN's EIC7700 SoC support beyond the
already upstreamed basic DTS and DTSI files. It introduces DT nodes
for reset, clock, pinctrl, HSP power domain, I2C and Watchdog.

As support for boot media is yet to be upstreamed, we have
boot-tested this series with initramfs on HiFive Premier P550 board
using Linux 7.1, U-Boot 2024.01 and OpenSBI 1.8.1.

[1]: https://lore.kernel.org/lkml/20251113014656.2605447-1-samuel.holland@sifive.com/

Pinkesh Vaghela (2):
  dt-bindings: mfd: syscon: add ESWIN EIC7700 compatible
  riscv: dts: eswin: add hsp power domain

Pritesh Patel (4):
  riscv: dts: eswin: add reset generator for EIC7700 SoC
  riscv: dts: eswin: add clock generator for EIC7700 SoC
  riscv: dts: eswin: add I2C controller support
  riscv: dts: eswin: add watchdog support

Yulin Lu (1):
  riscv: dts: eswin: eic7700: add pinctrl support

 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 182 ++++
 .../riscv/boot/dts/eswin/eic7700-pinctrl.dtsi | 888 ++++++++++++++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 234 +++++
 4 files changed, 1306 insertions(+)
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
