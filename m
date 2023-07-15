Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44239EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 11:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGsD05PptNJw1N3cNeGU9kXCo37saTEmw2WIKBNuKxY=; b=ORb1foyuFPXsfS
	YQjIjUbdSnW7l9TR16PY4ubglq2vXLwLm9iowKuad00DHUhM9ZZ8UzkF0g6wLl06NEYjN/jYWXjv0
	g0nNxb0qiy25wH0oDrgStGInBDokhCLHRN/CtZ7yG19KBQPAd4hkiKxdT/DoGdJ5yHi83Jj//bfwH
	ZRQ26sLRc+FviJ0qX3PM76N/3sSxdHWEw+ViybhC9SMp+J5tmBIXl5KXWIFrS1LpfibAxqnrm3mhF
	fDwZ4QzEfjXqUbv6vJO5dOxi0lyy+HMDp1s8W86+DlQ/4xKJZGKALmBY6WEYqbFotSjBB8PvFIgwy
	HR9wn4o2xHHVMNFGE/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKdPd-008Z7N-1q;
	Sat, 15 Jul 2023 11:26:09 +0000
Received: from out-23.mta0.migadu.com ([2001:41d0:1004:224b::17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKdPa-008Z5M-1M
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 11:26:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689420363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPF7WuMTa88q4pM2B8RLcTtpmoYLpabME/stwQ3zxw8=;
	b=CvCizP0wHXr3KbIN7dwVKFLWFHr8fmROa12Yfr1EWNbQgkKHOpztrR7FjE4CeTV+/aMjRy
	ISxaiyC+x3gyUDjl5CZOg+hFuGwZWsM0Wp6e/SwF+FAjD9oMG8ylmXuaMhFce8Lj03Z1tC
	TsKtpPGzh7GQD62V6lwsGk5YQYlTaYUb5Az3KCbIKqe8Vs4TkduXgnHLahbaHoxP7s7pXT
	74cIjgqGlBJLNPkvbL3X2RHsaJv+ORM4P3mHt84LVmOnZbtdEHZmwminN3w0ARveEABhP9
	skBnDh0t8z3efwAIBt3PKpwNRRquQVJgTMCY4MKl0IgYhKsp8gyPEDP1zgz2mA==
From: Jookia <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Cc: John Watts <contact@jookia.org>,
	devicetree@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 3/4] can: sun4i_can: Add send support for the Allwinner D1
Date: Sat, 15 Jul 2023 21:25:21 +1000
Message-ID: <20230715112523.2533742-4-contact@jookia.org>
In-Reply-To: <20230715112523.2533742-1-contact@jookia.org>
References: <20230715112523.2533742-1-contact@jookia.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_042606_600708_2E604D5C 
X-CRM114-Status: GOOD (  12.05  )
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

From: John Watts <contact@jookia.org>

The controllers present in the D1 are extremely similar to the R40
and require the same reset quirks. This alone can support sending
packets. An extra quirk is needed to support receiving packets.

Signed-off-by: John Watts <contact@jookia.org>
---
 drivers/net/can/Kconfig     | 4 ++--
 drivers/net/can/sun4i_can.c | 9 ++++++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/can/Kconfig b/drivers/net/can/Kconfig
index a5c5036dfb94..e626de33e735 100644
--- a/drivers/net/can/Kconfig
+++ b/drivers/net/can/Kconfig
@@ -185,10 +185,10 @@ config CAN_SLCAN
 
 config CAN_SUN4I
 	tristate "Allwinner A10 CAN controller"
-	depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
+	depends on MACH_SUN4I || MACH_SUN7I || RISCV || COMPILE_TEST
 	help
 	  Say Y here if you want to use CAN controller found on Allwinner
-	  A10/A20 SoCs.
+	  A10/A20/D1 SoCs.
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called sun4i_can.
diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 0827830bbf28..06f2cf05aaf5 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -774,6 +774,10 @@ static const struct sun4ican_quirks sun4ican_quirks_r40 = {
 	.has_reset = true,
 };
 
+static const struct sun4ican_quirks sun4ican_quirks_d1 = {
+	.has_reset = true,
+};
+
 static const struct of_device_id sun4ican_of_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-can",
@@ -784,6 +788,9 @@ static const struct of_device_id sun4ican_of_match[] = {
 	}, {
 		.compatible = "allwinner,sun8i-r40-can",
 		.data = &sun4ican_quirks_r40
+	}, {
+		.compatible = "allwinner,sun20i-d1-can",
+		.data = &sun4ican_quirks_d1
 	}, {
 		/* sentinel */
 	},
@@ -907,4 +914,4 @@ module_platform_driver(sun4i_can_driver);
 MODULE_AUTHOR("Peter Chen <xingkongcp@gmail.com>");
 MODULE_AUTHOR("Gerhard Bertelsmann <info@gerhard-bertelsmann.de>");
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_DESCRIPTION("CAN driver for Allwinner SoCs (A10/A20)");
+MODULE_DESCRIPTION("CAN driver for Allwinner SoCs (A10/A20/D1)");
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
