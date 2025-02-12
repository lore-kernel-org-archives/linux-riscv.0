Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C292C02198
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 08:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AOVz7Jbgstb22IwikYR7YJfYQoVwglb0W2fzeDq38Ow=; b=M+VUSos4eKstAi
	DSfq2AZrKIlRrxd0C8j+evvo2b0LbY/tcAVXf8RUQZqaOUsqd8mNRKD9Iymia1040XOB0kR0FbQ+o
	1MStG5ty3c2qaDNbv9rEGqyYPSa0bRBpEcDAhAAf1OnBMCDsqgunHXar9aHwjKbyH0+v/zRmLeBpL
	IU3n+p0oIyJPUnptmdS+mAgb9EY2lvQhI2QksDUvBFZKuIRlpJfet0gT1ZW4fklYvWQjJ6ZgdWyVH
	Wm9D3qMDumWFp32wTxoOiPc0ZIij8JP3rUMwOqAsJ1K0VD+8SNDEfBjRVTC/4sSNSBpm6rgcHTC1N
	M8i9sLXNqXztX6DK8fYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8A4-00000006dWJ-43oL;
	Wed, 12 Feb 2025 08:32:00 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti86S-00000006cfo-2P6k
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 08:28:17 +0000
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B8DB13430A9;
	Wed, 12 Feb 2025 08:28:11 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 12 Feb 2025 16:27:28 +0800
Subject: [PATCH v2] pinctrl: spacemit: enable config option
MIME-Version: 1.0
Message-Id: <20250212-k1-pinctrl-option-v2-1-bde7da0bc0d9@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAG9brGcC/32NQQ6DIBBFr2Jm3WmAYDVd9R7GhcqAkzZggJA2x
 ruXeoAu38//7++QKDIluDc7RCqcOPgK6tLAsk7eEbKpDEqoVijR4VPixn7J8YVhy7WNhtrZWHO
 btSKouy2S5ffpHMbKK6cc4ue8KPKX/rMViRKpnzrSptdC24cjn0O4huhgPI7jC8myJNOzAAAA
X-Change-ID: 20250207-k1-pinctrl-option-de5bdfd6b42e
To: Linus Walleij <linus.walleij@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
 Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=IrKptbNyGnEsWszE5Znu38EPyhXvclhSWF3aK3/HD0Q=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnrFuXkQwvpdyu8m47lqJTTAGrb7SfOF2GrOSvL
 UHu0Hsl9c6JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ6xbl18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dIvEACMYP9kQbngE6dUW3
 h6H4LM3rRAFvEA0o5jKhCwlXKiw/S4Ck+DqnVKWYBYbtsc3v072HERc3R2mVk8MgGUaA+wyDo9+
 ddkYXfXpkoCwxNwzgdweUJ87v0WCIFmKn+YbFmse7SRqNGtnmDnbE4hXI+mVLIFE4PcGWc1aCgs
 fXyUPpYWCGU/ph2WxAsFD+LSQvoXM+ROD1hd72A1e0NbIFi4yoKKcc2UafSUwIb0rhBwHYv3lCu
 zla1UUPCoVU7Hm0RNetJvncn91o2/DqnDxuhOS5+MTWEqG/TiVY5I5Bj178kt7snAPNw723PUeA
 Zdze8qsl/11y392nC1bjnTgDFJx1za7Kx+bXY3PJIfvsYBifLI4J/UMQ+2OgMJ1Tz3XuwhCSjr3
 lJVKBwN1f1P4uz8p4B8PQtRwJSP2jGTg12nmoctTsXn1P0HnQoCDxhmSriDxTM7/aSylC2wNn2k
 g81X2tjJje+cI8qgoptLoS5JzUkuO3Aoj3Fb/KFGMVlotIaRUnsnCh5PHLIOgEwSimStmcQYooL
 7Zvsx5zCPiraRRvx+80oi3qfSQC8E93Ng+lQTdnbGnu1jIGd3W6dP1V3EytBEi12kGK33u3vg3T
 3MwEIcur1df6KTJk5W/VTy8cv+9y1D7O5TymH3Dmcu8k1DhV8e5DXQBQSjZIibcKNlWQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_002816_647758_1C7E76BF 
X-CRM114-Status: GOOD (  10.53  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
when using make defconfig, thus fail to initilize uart driver which requst
pins during probe stage.
---
Changes in v2:
- set default as y
- Link to v1: https://lore.kernel.org/r/20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org
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
index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..c18d879274e72df251e0bc82a308603ce23738bd 100644
--- a/drivers/pinctrl/spacemit/Kconfig
+++ b/drivers/pinctrl/spacemit/Kconfig
@@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
 	tristate "SpacemiT K1 SoC Pinctrl driver"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on OF
+	default y
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
