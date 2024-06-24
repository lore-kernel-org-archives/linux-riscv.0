Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36551C2BD05
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CByj2pl36K/TKJijfQ2m0C6O4+S3c8WAwJcTtWa01mg=; b=I2oEqGNkfczm73
	owOHJPSMtHZ2aO1ktzzBtt0pKtWVRLN3OjKTOautmNoX9Bh6DZ+IkeAHV0/cf8V3pyzR7SmVId6PB
	V6zngIq14L6P/YK4pev6VvV1s8un/9pK6F1Fuo5cG5VKUvH9Zcf0Ab0y2qLxIkfnp+3oQ9YtwOzpJ
	eIFzwnj9+hkYpxFJ9TsYPt6+sdObIMeMCOUIJ/vtSMMaKJ2OERWUlNT3fgLTRLJpx3eT2P6H4RP8R
	lGv5DC+1afRxa8TBhjkIkYuO6rvmS0ZfJHcC7t3hE3y4kGl1FlVpLtg6lqrHe6+qq38Vpqt2lA33U
	SbC1SOwHIQy3cXXyE7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh92-0000000GSZk-0bKP;
	Mon, 24 Jun 2024 10:41:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh8w-0000000GSXB-2YNH
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Jun 2024 10:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UR5R/S4zH+LvNg75YIWJqgZSeK8Iz2vARL5qLu+rQU4=; b=g/Z8DrRMbErVbJD+JiYBPVbIbM
	TWZ2Dzin8p4HKCSYlH/V8C/LbZB16RSS6kfkekSZqnf7GZ2dOE4qDU4JpnOI6C1WiW7atsOBOXzBJ
	zNnVQeBQxaxeqITdCj1BjrZ29FmmJmWPnRGVijPVRel+mo7X3+1Xif4aL9b8CejAbNZ+vXq//6i8h
	AlwEE7bisd1y8I0/kAmvr2pobVAe9PjTVjTmltcUs1ayYp0rC5w/boqMoW8xJngNhfc98E/O/8s1i
	hQOB90dz7wFan0FD/vKGts0bwDyN6Y0zvSYEZ4qnJ0a9keE4KX0JmJf5YPmbMeJejUuZUKmfOBRK1
	U9iCAEPg==;
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh8s-00000009x8e-3t8n
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 10:41:49 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 45OAdw5X009984;
	Mon, 24 Jun 2024 19:39:59 +0900
From: FUKAUMI Naoki <naoki@milkv.io>
To: kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        FUKAUMI Naoki <naoki@milkv.io>
Subject: [PATCH v2 1/4] riscv: defconfig: enable "heartbeat" led trigger
Date: Mon, 24 Jun 2024 19:39:22 +0900
Message-ID: <20240624103925.946-1-naoki@milkv.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_114147_610050_F8DADC36 
X-CRM114-Status: UNSURE (   5.86  )
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

following JH7110 based boards have a LED for heartbeat.

- Milk-V Mars
- Pine64 Star64
- StarFive VisionFive 2

This patch adds and enables related configuration for it.

Signed-off-by: FUKAUMI Naoki <naoki@milkv.io>

Changes in v2:
- reword commit message to include other JH7110 based boards
---
 arch/riscv/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3f1f055866af..5f5582d7d7fd 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -147,6 +147,7 @@ CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
 CONFIG_CAN_RCAR_CANFD=m
+# CONFIG_INPUT_LEDS is not set
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
@@ -246,6 +247,11 @@ CONFIG_MMC_DW=y
 CONFIG_MMC_DW_STARFIVE=y
 CONFIG_MMC_SDHI=y
 CONFIG_MMC_SUNXI=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
