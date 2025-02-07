Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AC8C02199
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 12:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xYEev0QbaH4dZXsHiqOYR4HAfTHx0R5dlOWZpJqXcn4=; b=V//LjwhuSc1jVj
	vdnOiLAhcs4fezQ0O4qPC2KEamAxWgUz0S5pqhapFIQrjw74wJOnVHO4V+VaZHd5OOkNXYLDr8pcf
	soYXtN34eA8mdnFDj/45J70HH7BHvoAf3zHyGKcysauw+bxnr/PkgGOhKMLq6xa+6/XnGTvJgH1hT
	M6qlkxEGUbBcr9H13wCjFOsPehy+w/nrBVy5Uaugqu4/S0aWH4tKtvLweK2hvCZ1OAFZwe4axCIIH
	vEoKHFuaNSOjdQjIvYcZQjjA2y2S8zFF7ThgZaLMmpZfOBk+fvx/vcFgZqH2t4HPB9zSwvHSAVjIy
	d1F4Q8ahRPSPnJMoe2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNDX-00000009SWx-2mC3;
	Fri, 07 Feb 2025 12:12:19 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNDU-00000009SVb-30eU
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 12:12:17 +0000
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1D9FF342FDD;
	Fri, 07 Feb 2025 12:12:11 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 07 Feb 2025 20:11:42 +0800
Subject: [PATCH] pinctrl: spacemit: enable config option
MIME-Version: 1.0
Message-Id: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAH34pWcC/x2MQQqAIBAAvyJ7bsEkC/pKdKhcaylMVCIQ/550H
 JiZDJECU4RRZAj0cOTbVWgbAduxuJ2QTWVQUmmp5IBni57dlsKFt0/VRkN6Ndb0a6cIaucDWX7
 /5zSX8gFzfmeRYwAAAA==
X-Change-ID: 20250207-k1-pinctrl-option-de5bdfd6b42e
To: Linus Walleij <linus.walleij@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=JHVNcI3xg4IrPDaXnnLHrbwRcYBbXD8MmMYM+m8cIxY=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnpfiYZWflhguUmnNsz2Ee2Fm6knaCOFupVZUID
 MU7bzEB0NSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ6X4mF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277c0xD/9QSxsI/yGV+w8nXX
 IyjEUQiRt+ioHM9mdbjlpQZlxg064SV6PFNJhvuyZuXKslsnava4tySY1VwWVWggZsguyD0ZlHI
 drKklsQ19Lj7Fhr140KgPHzLldl7OSqLU0aBLkpWTEZcS4UWA2Sxh4PbLWVZZ4zOxyrDN5npP/Z
 tGgI+Eaa/BzLj5UaavGoC8uRnVPXpvcCBWDCojGT3Mm2j1rvBJNt4uCO86DT6qGo11xaFP8obJB
 ftB4g5d/W/MeMvphkXHWDFzgmYX5Q8MhGw2CwhpsuOt30JyVNmHzOqWEvHQXpQzQShWuJJakYgx
 VCrpGvlkeJhzWb6Ga2c1dsTlgZGmWZQKQH8nVN+3FOCRAqO8tWKd3zgcewPuHI5YZOt0261YL06
 x0oDhWqFkhdrA7AKMnd94Lmx1W1ZbQom2/Wg53Ap99Y8aDCVy9dK1Q2fuCJOcd1HWAcvN896506
 1JNVtB+3eWIJbYHSJr9U34dkd8vMWLZ4gYO4Ayo1q822S2N94wxv2BJ9yrgAYdNM9FbeWZr27x+
 cxUGLS1sRTXbCavDMvuPd3Hg3WybmGA6ZcsVDuQZmd4t2h5hKawvDfnAqNYMhn0gIe28ung7IyO
 D/3nwcEUsaSeJQ3W3nlzvWeFpLy4/FK0b9VKK9sgRSpok1OgK2KUeyyt+ER6f3aCLJ0w==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_041216_789641_18260164 
X-CRM114-Status: UNSURE (   9.96  )
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

Pinctrl is an essential driver for SpacemiT's SoC,
so let's enable it by default for this SoC.

The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
'make defconfig' to select kernel configuration options.
This result in a broken uart driver where fail at probe()
stage due to no pins found.

Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
Reported-by: Alex Elder <elder@kernel.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
when using make defconfig, thus fail to initilize uart driver which requst
pins during probe stage.
---
 arch/riscv/Kconfig.socs          | 1 +
 drivers/pinctrl/spacemit/Kconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5aefb50eeb982d14aa 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -26,6 +26,7 @@ config ARCH_SOPHGO
 
 config ARCH_SPACEMIT
 	bool "SpacemiT SoCs"
+	select PINCTRL
 	help
 	  This enables support for SpacemiT SoC platform hardware.
 
diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86bc555b2b90643adbdea 100644
--- a/drivers/pinctrl/spacemit/Kconfig
+++ b/drivers/pinctrl/spacemit/Kconfig
@@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
 	tristate "SpacemiT K1 SoC Pinctrl driver"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on OF
+	default ARCH_SPACEMIT
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
