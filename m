Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7E8C2BB48
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3276224B0
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3276224B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=py62y4fWjhq+O0jIf9E2w59WCaaHRK+aCf61IUUWojA=; b=hLJtmEabYVnqOdAa0MW8xq7ja
	yt7QdVRK3dAEMvbo7gAG/48ygNwukOgX3OcdjUXHhAb0clW23AFGuNLGe/fCxUWz2Nlo4wNkFlUlP
	+zY5sR1Sh3++F9QndUgQTViXzLMrdMTBEAt7WL7qHGcR10Z3FZQNxXkACjcv1qlwCNi9Xz5fedCPk
	ikiUgyIKB3Ao7C0tKmpnkIvm1Zr4gNOkIvN7GYxUnzfJbS0RqE6IzQqlGg9S/ClfAno6C4G7783qG
	zQMdQ7PB/boW1RbmyZGsRpIWLuovEHWmpWKKrrXBDkhonAL+KYLEvz46LriaLhDFOXOTGNnhI1jfx
	yZcRHGcrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koRmN-0000DT-5o; Sun, 13 Dec 2020 13:51:15 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koRmK-0000AJ-Kv
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 13:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607867473; x=1639403473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NMOaX7nnqHG5Nvk9gqNKok5Ph5Os8Tyr372uplmj7Zk=;
 b=gw6uN1iwlOPgIYS5C/I34WPPctPB53cLs/M5nXOWOdWahOCDyQBOpHMW
 9ko/JvcEdnDGrr5XIbZmfkeuZfBMud86RTtHFH00wwpTEjj7GPX+eAccu
 Nv5xOkR4U/j5qjvaHpIxrg+wkh2P13Kzs5U7tklDETFt6CNsu8BJmPQCN
 tzNcA71v78kFIgfh+QLIN0158oWRXNkS2S5bvECgRX/yedDz7F8wJyhHL
 tVAsETJjQAUOfOWuv0uEeeh2RE/TjIrnqJFGt5YFdQAIVrsMMwLQzT4hZ
 gX4x8f/wS1TML9NzBKpKP6pKf0ZjLvZhlPUR0vvmIVT3oNbHK/wrX2wml g==;
IronPort-SDR: 8zU/WPuG642F9saKY2EXbPR5FY5dnWbP+XcD3cMjtb12hZixJlKeb/eDWi6ZfQWA8UNPQ8yMEl
 b3wwYOrOxy9AeuhuFkHva1j93HwjZiN6Tx4D6lyl3xhJsQX0hByUTakmvBefBquWxB9tXdHti9
 xWIPj3vez7cYtJIlctbMCzGvfD5vRmFky+xetEH0+DfUnQFksopoGPy9HCwbBSvnqXhWVarL/I
 Z4xiVWpfjuhOBS3Au2tfrG+veE+Hg/xCSlfM0ziq0vF+W7U/Xkv/4EYMVJJ767c9u+0tWiQXwI
 qOM=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; d="scan'208";a="156242562"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:13 +0800
IronPort-SDR: Y1+toaGqsJ5r67tpZ/Uayxji91HOT9+ufC9MKiGdsw/ER35OCgEgfPs18xUIRxi7f+ELuNqTVg
 7qucVilektVvIzWWgCLiT7XCyJ4YAZXOtneuN6nh7h+6sIvQXyhjf6V8v2KoZmVnmI402jhSZE
 0Nek3Gi1v9j3NKo/7p5U/SkHe85Uk9csTzhcJ6LSH6o297R9o5MK+nZxK5pCG7jYGiDEvlkx4q
 wbQlLblf6erLZgyzVpPko2kaDpUbRuwY5jp+ebXWBiNAX+oy//G8xBBZrQ6YyQojoQHBI4YbFP
 Syf8/DWw1l+8hha3oHt53gPf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 05:34:57 -0800
IronPort-SDR: IJsD/MpnNU/E0sI0QTn7PtJBBa/rZb8u6wNxKXFJ6F1ldYnWc6CDAFDeSyF6RO0FTU95D5oay1
 s4k12NUYqt89FnqwuvNGzfMsIC3aLf99HxB/FX6u7/DTXDSUyIWpf4vxdK9JctFR8xsISxjWTr
 Kx1P8BsMbtVjJP7ljHDmGX7gclUxNN+oSX1RzKb7Rn7JGm8FdJhRjrtUf2I9ho1Znun+thNkus
 1X4MD5u4kcswGI7LJ76TDS+StijOK6DqcFoOgyWPeYg4nPVnQWH6yERhXAYQ2bZA1ZR1cHi4xX
 qhM=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:10 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 06/23] riscv: Fix Canaan Kendryte K210 device tree
Date: Sun, 13 Dec 2020 22:50:39 +0900
Message-Id: <20201213135056.24446-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_085112_842571_6B83532E 
X-CRM114-Status: GOOD (  10.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Remove the clocks property from the cpu and clint nodes as these are
ignored. Also remove the clock-frequency property from the cpu nodes as
riscv relies on the timebase-frequency property.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index d2d0ff645632..354b263195a3 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -38,8 +38,6 @@ cpu0: cpu@0 {
 			i-cache-block-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-block-size = <64>;
-			clocks = <&sysctl K210_CLK_CPU>;
-			clock-frequency = <390000000>;
 			cpu0_intc: interrupt-controller {
 				#interrupt-cells = <1>;
 				interrupt-controller;
@@ -56,8 +54,6 @@ cpu1: cpu@1 {
 			i-cache-block-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-block-size = <64>;
-			clocks = <&sysctl K210_CLK_CPU>;
-			clock-frequency = <390000000>;
 			cpu1_intc: interrupt-controller {
 				#interrupt-cells = <1>;
 				interrupt-controller;
@@ -101,7 +97,6 @@ clint0: clint@2000000 {
 			reg = <0x2000000 0xC000>;
 			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
 						&cpu1_intc 3 &cpu1_intc 7>;
-			clocks = <&sysctl K210_CLK_ACLK>;
 		};
 
 		plic0: interrupt-controller@c000000 {
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
