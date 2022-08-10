Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94FBC00140
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eGUzYnZT8KEUHMlD2AmEufzsleIB/w1cnj+qsXgdig=; b=q8DjdWs2VFLHsy
	vyrlgXwIs2po8MwJXTR3t7oMUNZMlHNsHRVNZO+Hz5nVOS+lcCsfsVmWQy3HDG1X3Z5WEJBA6KSTG
	lXDvdw6zE1kXYVtuwZgTX4DV1ELVIKtIzEkGOyIkLW8aw6ZaKLjSLfSQVaYCdlNpdlfv885BVBGEl
	xAS7zTozxt5Ye3LSq2xYMhH9u3CFDK51E7dqQiFahxMndsoR+1dK59kBvTdQtDtKThc2JOirGVa0T
	Yl9smpRqvF8twz0YK4XEcpOfC1X8bGZvkgvHpTWz785m8Xvti9auNN7jnSz34RTJIoHzAIvu3M9jP
	pv/d1zvwUBUv9MZjIjDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmJi-00CDFD-Kv; Wed, 10 Aug 2022 14:04:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmJd-00CD6k-Br
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 14:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660140249; x=1691676249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=essceR54I1P1+uwnMKusOBNBSYj2G5avgwzUHp9FtEE=;
  b=maxWKfJ7NkDpa3HvXwkrz4jAxN+MBn77S3CrPD9n2EKmD1BRg5XCPkFy
   1UFJxSeIYH7Od4i83EaHEF0wzLu8bnJSOlaJM1eRXXTyzror4u6uxR/7E
   x47ijTIotaAVGBPICI1tVLs18LbmvF/sP/WGihv+k4ac68TnTANUyVe6p
   4YjkOBhRo3kXTC/CBqPjL8NCtO1FLfZkvaVGEpedml33OA8Hn98fZfqFZ
   WY784DZay/slOWziwM9cHI89qmF1QO+84Gi61XYMs0Tl5f6KVmlgxRrM0
   me+R8irhT9dbK8jWtWpu3w+LHz4FasYsWIG/L07bFGula2WDQ0bf4leAy
   g==;
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="108428032"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 07:04:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 07:03:52 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 10 Aug 2022 07:03:48 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <soc@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>, <linux-i2c@vger.kernel.org>
Subject: [RESEND PATCH 2/2] MAINTAINERS: add the Polarfire SoC's i2c driver
Date: Wed, 10 Aug 2022 15:02:44 +0100
Message-ID: <20220810140243.2685416-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810140243.2685416-1-conor.dooley@microchip.com>
References: <20220810140243.2685416-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_070409_533395_F4590E77 
X-CRM114-Status: UNSURE (   8.44  )
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

Add the newly added i2c controller driver to the existing entry for
PolarFire SoC.

Acked-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: linux-i2c@vger.kernel.org

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd0f10a110e7..148c9b03759a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17524,6 +17524,7 @@ F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs.c
+F:	drivers/i2c/busses/i2c-microchip-core.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
 F:	drivers/soc/microchip/
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
