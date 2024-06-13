Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8782C27C77
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 02:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PwSIi6zq0tBPzpzMkYB8jmXoVlxCsjdSzNs3Q/1aJ6M=; b=flxPKLGn/3DLlw
	yTcM8w1+9KtwJyWQVjyGJDvaNBXlYQJcO/fMjtVpc6ujMw6TZbim38rdc8mym4UFD/dsPSDq5NCKc
	YiOjTZZvB0Smb/qw6Y1Rvnq70Fh88rjkJA1eOjae9HaxBtSsA82AjPJx2+N5/jn2T77E9e8dOYayB
	5B/7cblfuf48+wX4ebZtsRyCy+M+Iz0P0WQ4yQrCciU7npOpXWm2ZtOCl5aylEQQbK4ReUSSyI9yd
	4VGTPmM+4OUyIAdANeR4Hr93GZn+54TEzlHiJYNy1Haar8fsAuvJPCesrHJRwES7kdbV+/GPhn2ix
	xa0rcJ0EyhxXzmn8DIvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaX0-0000000Etpn-3c0f;
	Thu, 13 Jun 2024 02:49:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaWz-0000000Etpa-1lYS
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Jun 2024 02:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rdtAZL5gT+l6G8MvWIeNDapygfw2sVR6eebubKB6JpI=; b=OYjFh1GTe9b3XVlgBcpdWSkO3N
	aJIMNBY6dsMF/JpxLczrvqYxRsHSs7XRRIU8Y9wAFNbUFrsiwggdRChjMkLx87zZCYioQMDjDukWT
	gm6E4Y9OuoGrSmvRnvNYpiKS0br+rheh5c8CpDswJ6F2kx+KWSfYqiw8JzHw9nBCunE7kNCqQnGog
	nd7lz1vMJlcH00MJ788qMYsFV8g8a/3JN8zRdU5b1oFbPg44K+XBHtHPc6oiCcCGO8Sl+fYH9dkg3
	i8yamdUcHOuynSbEYPvFNRekzuF896ic74mcO+dPhmq85hqFjtrQcn/BEGFVLGzYALQc8PnTWlNO2
	nc1QrJmA==;
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaWv-0000000FJsB-11uV
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 02:49:39 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 45D2n0mo000957;
	Thu, 13 Jun 2024 11:49:00 +0900
From: FUKAUMI Naoki <naoki@milkv.io>
To: kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        FUKAUMI Naoki <naoki@milkv.io>
Subject: [PATCH 1/2] riscv: defconfig: enable "heartbeat" led trigger
Date: Thu, 13 Jun 2024 11:48:25 +0900
Message-ID: <20240613024827.36512-1-naoki@milkv.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_034937_909957_503D227A 
X-CRM114-Status: UNSURE (   5.81  )
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

Milk-V Mars has a green LED for heartbeat. This patch adds and enables
related configuration for it.

Signed-off-by: FUKAUMI Naoki <naoki@milkv.io>
---
 arch/riscv/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 12dc8c73a8ac..dce53f36e68d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -144,6 +144,7 @@ CONFIG_STMMAC_ETH=m
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_CAN_RCAR_CANFD=m
+# CONFIG_INPUT_LEDS is not set
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
@@ -223,6 +224,11 @@ CONFIG_MMC_DW=y
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
