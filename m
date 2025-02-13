Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F65C021A4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 10:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5dEwv6JJ+9lgBbsD6zlej0BgnD9SiS/5SvHYIUV4Ums=; b=UK4g5FsN/Lx0w3
	aRaKJ+/GP/ke+go0k2Wg1gXTD1Uop1a7adcfzITX5GFuWXxcYQcxCggYn/FpLr+LNPhuGolt+o1Ai
	G0BQ10wqVZdm68riBLvhVCMyHdDyjN6ZyALJpyLZ1Rh155R1RXAM9wjI0xueNttxCbVa9x9i37owR
	CTXo6MlYrElXgySYvR7eII384BBwqmfmISfQ/IRpUG7b4lrCbcsPO6O2i1jun8tlatNC1bV3pWB+r
	vTuGsluRMymaCy9iju6pU6goH+Q27hWNY2I+UAnhW0D0v3XpxXDR1EW+4gjbpVDBUSsS+pjScjImx
	yVolTcZpWobRIBO17euw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWwA-0000000AkEI-3KYI;
	Thu, 13 Feb 2025 10:59:18 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiWw8-0000000AkDc-08fa
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 10:59:17 +0000
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 49D01343097;
	Thu, 13 Feb 2025 10:59:11 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH RFC 0/2] soc: spacemit: add sdhci support to K1 SoC
Date: Thu, 13 Feb 2025 18:58:23 +0800
Message-Id: <20250213-20-k1-sdhci-v1-0-1f4362a980cd@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE/QrWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0MjXSMD3WxD3eKUjORMXXOzRBNLA0MDY4OUJCWgjoKi1LTMCrBp0Up
 Bbs5KsbW1ALI1TyViAAAA
X-Change-ID: 20250212-20-k1-sdhci-76a4901030db
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=KUjOvF9P/vuDVqGQh2F5bKA4gVmwZUblVLO61U/+eqQ=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnrdB1HCsrUFt90NBRwSRSbpxoBCyz7HLpYIHgp
 ywEzaSCdv+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ63QdV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aGGD/98joLcC6mB9wphN+
 FXiPW/KOgj6Tf00aKYHoPjaaDB2/lOISt9IA++IxeyP5ICmLODeULPpdN6a/T0mT23+w5M0opUa
 /WM2YjeovA+SdeUBRyTytBrmZETt7HM6N2vH64FWHEj8hlraPpa1QMSBoJRMBYNtcHJe0WO8cgU
 2kY3dwBhceVUqYS9Ppo+Jg8oV3v0LL/4kw+s/1l6VYibVjM2Lbk6sQzlKGbltnBYVdfvZ1kkMm9
 0KTtpoLTyjBsrrxS5z43VViJ+8Kzqnq4re0N7NM3T6Auf9KqlmEJbTVfIQrRQy8fhzgd62lq0oB
 3FKdCQfV6NIKbwkC1vX6VeykjrkmsOpoMaIQ2XOO0fp2OUdyuQO+/l6wf9sksDRjUmYc7S1Cehn
 5IcTl5lfz+i7NUbQVC5+LeF/JG3MjkAl6g8MJlzDFQ+dIxiRP2rhBRdNNOOpNGt3MCNPKWiJXiW
 P37fHYyzlT1R4o+xOnXr7ZnCuiKH88eHbY/XNzQBccKa6c3cCf8+la0Jv7TM8OoSsGM2iwf0c9f
 AIr/sMpJS9qk7VUlWveL7K1lHF87Lnkg3doko3WUibdHgbSmgvFynz6ebVGbvQlDIZpyBXdMlwK
 bkiPT4r4tUtdBEmBnA/T6GdHH4AEJgQgiQ64vBX9UehvW+W0JzkN9Wvh35mNjo3Hpcgw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_025916_100084_DD11D159 
X-CRM114-Status: UNSURE (   7.99  )
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

Add support for the SD/eMMC Host Controller found in SpacemiT K1 SoC,
The controller supports data transmission of MMC, SDIO, and SD protocol.

The SD/eMMC Host Controller has the following features:
- MMC/eMMC 5.1 specification compliant
- Supports PIO mode and SDMA mode data transfer
- Supports ADMA1 and ADMA 2 (64-bit addressing) data transfer
- Supports 1-bit/4-bit SD memory and SDIO
- Supports 1-bit/8-bit MMC and CE-ATA cards
- SPI mode supported for eMMC card
Full docs can be found at SpacemiT's developer web, chapter 10.4 SD/eMMC [1]

In this patch series, only MMC part has been implemented and tested.
This driver also requires clock support which currently isn't in mainline [2].

There is a WIP branch at SpacemiT's repo for people who interested [3].

I've marked this patch series as RFC, due to incomplete clock and SD/SDIO support.

Link: https://developer.spacemit.com/documentation?token=WZNvwFDkYinYx0k9jzPcMK5WnIe [1]
Link: https://lore.kernel.org/all/20250103215636.19967-2-heylenay@4d2.org/ [2]
Link: https://github.com/spacemit-com/linux/tree/k1/wip-sdhci [3]

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (2):
      dt-bindings: mmc: spacemit,sdhci: add support for K1 SoC
      mmc: sdhci-of-k1: add support for SpacemiT K1 SoC

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  53 ++++
 drivers/mmc/host/Kconfig                           |  14 +
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/sdhci-of-k1.c                     | 320 +++++++++++++++++++++
 4 files changed, 388 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250212-20-k1-sdhci-76a4901030db

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
