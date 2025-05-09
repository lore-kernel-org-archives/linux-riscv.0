Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289AAC3ABC3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 14:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0jghSWsmrQzplkE/SV9stkEdDjk/ccJ61JwO4h1Lmkk=; b=b0EoSpqgtQ/ALB
	Zd+BcCP38O7i3j2/TpWWrHzRUzkzliO0QiRqk1ytDiafdEIE1AesJa2JWLS4ZRknCawyH8vQ+FhfT
	xuD0lXEq7VOfNZsdNgHh+lmgeC94Rys8a3UildrtzsXZWPo1eAlE86BDwmS3Qebv39EHeYJwIw3cy
	jdQqI/caUMurvDELbHnsXDJ96hNncQ1p8/CebSinfb8XhHBDkzVSBQODLghzYv7yZTN3jSwZ7nzuv
	lhw3+Hl5X2Te5+WR5j5tthGo4DP9J6VnAy2JeMP2w14+SzNKC/cUZx5Mt92auIy7V1kC/qDCgHCuJ
	zISEoHWs6YZwJkRgjIiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDP4w-00000003zmz-27Ep;
	Fri, 09 May 2025 14:51:58 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNga-00000003kEm-0ZDH
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 13:22:45 +0000
Received: from [127.0.0.1] (unknown [116.232.147.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 59FB833BE9F;
	Fri, 09 May 2025 13:22:36 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/2] soc: spacemit: add sdhci support to K1 SoC
Date: Fri, 09 May 2025 21:22:10 +0800
Message-Id: <20250509-20-k1-sdhci-v3-0-526c35feaa20@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIIBHmgC/1WPzWrDMBAGX8XoXJXdla1IOfU9Sg76WduixGolx
 7SEvHuVhFJ8nIUZvr2KyiVxFcfuKgpvqaa8NFAvnQizWyaWKTYWBDQAIUkC+YGyxjkkedCut4C
 gIHrRjM/CY/p+1N5PjedU11x+HvEN79e/jtp1NpQgceyVJmcNhPg28bLm/JrLJO6hjf7lAXAvU
 5MVHwCG0TFZv5Nvz1mFvy7tt/W5TXhXWYZ8Pqf12IEbadSe0fdkUJnBazTBG+2i7TVHjmCsC6b
 Fbr/eqqyBMAEAAA==
X-Change-ID: 20250212-20-k1-sdhci-76a4901030db
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=9BDdQL1tGpHM9JlvlVQB77N/+lcoo3YVzx3Z06f/FTo=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoHgGS3G7h+9dQnZZHDZ8AhzN+dgX15wZmLlsnQ
 YgmuKA77tOJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaB4Bkl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Yo+EACfSRLhS9JBZskZ/Y
 MMJgqlU0KUEOqQ0lE+hCg10IanG8UTGxMPaOGqa0syLNn1/8tFMAWsIloyFjaijQUlHOzdgDEzY
 spwXK1mO4Np3H/lQTiT5XbYKeov1nnx4L2OfJ8dBEgU/moFOq85uqH6ppZ2Islh7bfQETYoBU0M
 wn0/gNpx1cbWjQ9qwx5apuZXMvDX4B0DAB6f0n2AAffq9mZ3et8ZJolTxeu86ibRVDeFgKJzw8O
 1rnq5/IU12Z3ycS9rG39l3mvFiK/QgC5p+EABRbGx0RDqoonKt2sNeqYAeAaSV90afG0J48tq2e
 5KJYQQMZ+T5m5jI+r4JVwP/4WBjfJ1MJbt1CWWXlPjsNPTRc774SF1D5Mr9IiZrw9E47+yysSOB
 KInxNYrGzlnAZHX1YUx43cwvTPMT1TDV/Jb1XGLly5Rfe7eEQjf+a9bosuc0FjyMEinR40DVf98
 KXzRnjtzxO1qwtE6+3e3/AFDxDcThB53pZNtK9cftIzbeMpstcl/skUCyvFUZQe7sJfxfmDIuP1
 2BdSU0gMMBWAhzU4yf6auKC1MwLN05zgWg89AkmrWHfb48NurB6f+2ORDUM0MQgkbH3LgpQxWFQ
 rrYVfT6wosGciNIicpvHDPd/COQ1hfQj4urCFPO3oWY0uD+XVEHnS5iQ1MQKNcWRM+qQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_062244_198322_8365A814 
X-CRM114-Status: UNSURE (   9.75  )
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
This driver also requires clock support which now is ready for v6.16 [2].

There is a WIP branch at SpacemiT's repo for people who interested [3].

Link: https://developer.spacemit.com/documentation?token=WZNvwFDkYinYx0k9jzPcMK5WnIe [1]
Link: https://lore.kernel.org/all/20250430012941-GYA288294@gentoo [2]
Link: https://github.com/spacemit-com/linux/tree/k1/wip-sdhci [3]

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- add a note to register clr/set helper() 
- drop unused struct platform_device *pdev
- drop of_match_ptr()
- Link to v2: https://lore.kernel.org/r/20250501-20-k1-sdhci-v2-0-3e7005fae29b@gentoo.org

Changes in v2:
- rebase to v6.15-rc1
- collect review tags
- drop RFC as clock driver is ready
- drop spacemit_sdhci_remove(), favor sdhci_pltfm_remove()
- update register definition using GENMASK(), FIELD_PREP()
- Link to v1: https://lore.kernel.org/r/20250213-20-k1-sdhci-v1-0-1f4362a980cd@gentoo.org

---
Yixun Lan (2):
      dt-bindings: mmc: spacemit,sdhci: add support for K1 SoC
      mmc: sdhci-of-k1: add support for SpacemiT K1 SoC

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  53 ++++
 drivers/mmc/host/Kconfig                           |  14 +
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/sdhci-of-k1.c                     | 304 +++++++++++++++++++++
 4 files changed, 372 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250212-20-k1-sdhci-76a4901030db

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
