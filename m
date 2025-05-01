Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC32C3ABA9
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fvED04LGW09IrZBYpsKOQ5BCzbGyBNWOlKIf03xl3Jc=; b=bcIKFqOmjWN2uM
	e4GeLziTyJe06SJW2WR/9yHFsrg5LiA73ROYTPj9yXVLoZHiaXObH7vKaAOwydaBPk/Uu9adL2Va/
	cgz4drawPmNdDTZz+Dx+/nbeOwsz2OiF9Kc5s/qhm47iRo1tAIxcF7pKduc1nG/3tw5YOOvak4zWz
	AKCXOXT4bM/xlQZ8ZyVIArNsn+NFH7wxYgnwtwsxE8xzyL1Vodq5ZeJXSK9mEJl57ejm1grJKWvS1
	n4gaEr5crpkHZjQIXqjtySrcPnkc7e8DZTGD3fFJl74rAu6/8ta5cpZYuRShuIaHmQvDh+vOTglKy
	aL/oBl2ZirkZlyXJ9N1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPdB-0000000F46o-1eGI;
	Thu, 01 May 2025 08:50:57 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAPd8-0000000F46M-2X2p
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 08:50:55 +0000
Received: from [127.0.0.1] (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BC823340C39;
	Thu, 01 May 2025 08:50:49 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/2] soc: spacemit: add sdhci support to K1 SoC
Date: Thu, 01 May 2025 16:50:20 +0800
Message-Id: <20250501-20-k1-sdhci-v2-0-3e7005fae29b@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMw1E2gC/1XOTQrCMBCG4auUrI3MTGtMu/Ie4iI/0zaIjSa1K
 OLdjYoLl+8H8zAPkTkFzqKrHiLxEnKIUwlaVcKNZhpYBl9aENAGCEkSyCPK7EcX5FaZpgWEGrw
 V5eKcuA+3j7Y/lB5DnmO6f/AF3+vPqf+cBSVI7JtakWk1OL8beJpjXMc0iMPzKye+XMt785cX1
 mSWLp5OYe4qMD31yjLahjTWemMVame1Mr5tFHv2oFvjdMGeL5sILsPzAAAA
X-Change-ID: 20250212-20-k1-sdhci-76a4901030db
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Alex Elder <elder@riscstar.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=7iG3g5Fpkpmnaw2P8DKAL0enzyTifLCknRgh9KOA600=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoEzXfTy59n2gtVx6jPw4KiofG2dRFcY72qANKR
 0UNuoigwqSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaBM1318UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277T4qD/9J9QVJfXVytcWb2J
 DpCJg4p11unIBM6rffhwQjI2fJVI4bnrKBDphYWMw06VX3LVWKy6vPvwUaBcfGQ6x6wgSDCZyYi
 ppdBww4//bTNtHc78DTZaYTxztm3oxNl9mI1XOO0NlsYRHvpobE1eTwjOpMR4Eay6FEQuoNTtB6
 2JxHw5vpEyZIWCt4aKbsJJ5hQZZXWFG4FXac9aTupmdJEiUSIYVSOPmQ3++YVmy+gIyEm4qPoha
 7xYJ+t6RYVzw91Bcl4GDcjYLZp1RtdebwXDm8Gvkw5zAvKtU+Yy4kyzbzARtqCKD/8yTabcwqMe
 rHodvBTMMfFFHne8sVfSgvhlRP56q+VmUSWp3xJBo2wnUFewY2X09YsPzR8EcPMLqdRdyL+N44I
 xae4jgBEUHFlueZbM8tqhh8INlhK3isYJYGsslc5uuGlwHGlK3WAInZJDUokink9yfCrTWcPvmD
 njUClyQraISF4XG/iOna4+9FuCdLw07qCKq6gv3HOGE8X70EZHcPllfy8UcYlk1fjHnMdJw8w/t
 5icbJUWtW/4slKhlNNW4VB18tnsP9DS0hprNm6f53jbncyVxTSJ//t24WXacA6sbBR119f73QmX
 pPX//ggMKyh/Q1/kV9ni/LW4GaTiyE2/R7fDVPezGveDIeXCQ/YK7ek8gpwyUn9KHM2g==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_015054_673439_5FCF6E29 
X-CRM114-Status: UNSURE (   8.73  )
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
 drivers/mmc/host/sdhci-of-k1.c                     | 306 +++++++++++++++++++++
 4 files changed, 374 insertions(+)
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
