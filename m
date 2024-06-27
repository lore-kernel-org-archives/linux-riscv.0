Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CDAC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 11:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CByj2pl36K/TKJijfQ2m0C6O4+S3c8WAwJcTtWa01mg=; b=Ro7oNJCw1Xj8RV
	qNkmPQUwiT+ZALcOIeuaacxIM7dfOZjrrpzAp+WmksBtmLuYX3eZDXzpe9zeLrgciBrtoGSU9+eXT
	ZGoc3oD2i9x4C+U5n1+J6eGpz66PluG35K17W4vq3envhfTexfXeA/HqD1eqES5EaZp4hLmHjbAvM
	NNXGKV0/hYE+7iBWIpLl97hvcQHXHVYjpH1GBppN/PjR+E8rMOzldQ8ofv3q2KP5GB7E3se0s1ilh
	GStydcGAmT942dQOlF7jeJBBo2UOIFdRwqCU3B772g2TnHl5uG+AgUPisVtkWRdxz+ycj2mqyfz55
	t87WOdJFbgE3hxIicBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnjP-0000000AEYx-2mw9;
	Thu, 27 Jun 2024 11:56:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnj4-0000000AEVg-3WxX
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Jun 2024 11:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UR5R/S4zH+LvNg75YIWJqgZSeK8Iz2vARL5qLu+rQU4=; b=janfTyg8OvugQ+zmCP62UImdI/
	HAqP7XnjW5N2ksKooyVx+pIcgfCZx9m+wbUdUI7duGRjUegV3KvBzoBP93t/uzlDGVhMOUMs/lXkI
	VOJ89WBwayP4/KCRG4qwi0kFTvwc/0GXcKSh0Pd+8H0ci8Myto4ANvncFZAb1bL88G7nW1cFuDp9W
	VhqJSbL3GDd4spLRVPxMG+zgccgIUJog9J2SE6hB4lrOxxuPMTOza7eqAy39RNp+wS0IVCgEOMS5R
	ezBh5RN5K4w+O1VkfRpJwnKoMVVRvR+Eu8+cN23wLK6ZMXYuFvLwVMGXQZ/g6YeHsH0uAqQvFNllr
	34jd/gMg==;
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnj1-0000000DVB3-1W5n
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 11:55:41 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 45RBr0rZ021179;
	Thu, 27 Jun 2024 20:53:01 +0900
From: FUKAUMI Naoki <naoki@milkv.io>
To: kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        FUKAUMI Naoki <naoki@milkv.io>
Subject: [PATCH v3 1/4] riscv: defconfig: enable "heartbeat" led trigger
Date: Thu, 27 Jun 2024 20:52:33 +0900
Message-ID: <20240627115236.618-1-naoki@milkv.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_125539_864187_73DFF72D 
X-CRM114-Status: UNSURE (   6.41  )
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
