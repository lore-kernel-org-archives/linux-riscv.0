Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B507CC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JyxBZ8hycaVnlIACA/IZmJ4FAFws+7Nkzgi2P5olvII=; b=S78H9KCNnNFnl1
	giMLKVm8h/GjaJx6LJ+TxibYlr+Q93VMn3ToXhwxSkNViYkPqJd2Dj64bdCKuCesQuBCUY7XmGc8O
	PS6HUyb4jRuPJs/b7Dnv3DLlRnElJLriiuhY8aFn2pwhe9fvTX4PMCGtXsjdBMIfeEDTF8qNic8Il
	/0JsdERtq3oQ/oEMoaK71wLqxZIJDNAGNXJ4sR86UbVjtH1qcFNdQ1K+FFsRXfTJWp3+ABkUSFKG8
	pEniE86iddmWjcJl6T2xqCLO9uruvqpPUeP03kMwNTxV4ZyzkSCAg/aRGSmj+ePWew0VKFyLPZg84
	z98b/om02ICV7A3AdQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquf5-00DAor-UN; Tue, 17 May 2022 10:42:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquf2-00DAn1-7B
 for linux-riscv@lists.infradead.org; Tue, 17 May 2022 10:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652784160; x=1684320160;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WBs2eI6X8CZ5YiF7kldg80ncAuzPV9s8G23gHoKP1l0=;
 b=ivVNoJGpW1YXUfQ4R6fn78IJcoF+LD7pW4ZeWVF30k1in9tmTIxQWkkA
 F0dC5jJioUxB1SslmzgFyzYNELooZc0lCg9T8LATqLVbiRxy7otbClmVR
 dd+zEpiGJRPIxdskPlp4GHOjzeS8F9tJKcLNYAh7MXL5UZoy+B0YyJ57G
 NQrD75bTmXP61TppfkwRWQjKsSz5uIos9t/m1rNHAl74kRIv9vBjC3WoT
 UN4p+wfsWTTzYysASqGiBPVM1F6rSFd6svJnq6v0nXq8U9Gopk6uZNqYL
 5M/bH/qVmwMFbgxBfsYr1+7q1QaLwosg+4ILkcUakU2x5LsiVtJt9h9Sg A==;
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="156367300"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 May 2022 03:42:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 17 May 2022 03:42:34 -0700
Received: from conor-HP-Z240-Tower-Workstation.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 id
 15.1.2375.17 via Frontend Transport; Tue, 17 May 2022 03:42:32 -0700
From: Conor Paxton <conor.paxton@microchip.com>
To: <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Lewis Hanly <lewis.hanly@microchip.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Conor Paxton <conor.paxton@microchip.com>
Subject: [PATCH] riscv: dts: microchip: fix gpio1 reg property typo
Date: Tue, 17 May 2022 11:40:58 +0100
Message-ID: <20220517104058.2004734-1-conor.paxton@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_034240_354687_DFB83929 
X-CRM114-Status: UNSURE (   9.02  )
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

Fix reg address typo in the gpio1 stanza.

Signed-off-by: Conor Paxton <conor.paxton@microchip.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 746c4d4e7686..cf2f55e1dcb6 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -366,7 +366,7 @@ gpio0: gpio@20120000 {
 
 		gpio1: gpio@20121000 {
 			compatible = "microchip,mpfs-gpio";
-			reg = <000 0x20121000 0x0 0x1000>;
+			reg = <0x0 0x20121000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
