Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D43C61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdsWjBV/cUqulyiH9kh6uVGdYEniIBHPKpH1al2kIIA=; b=ufFF9zocydxaZx
	YB5N2dR+66uTlZy4CECVGkbjCqMyVCRAbckJXsD4GhjmHJTg7Gj4z7m6SJQQ/8nh+BMa/c56KrK29
	zFAQVeDBV+iFed7dF6epQC+WyH0/zxVgQpxR9IOuPYou5jMa0cMnMWD6IfMXwHnbiZH4TYH5b8QS/
	2uPMU6oD4TyKFOcXfF1ftgGKG6O0li3gCmf8j5btcGyr/7/O3bYkJIZbFY9i9dyNVQbyDQgChqIDn
	mh5mfKo7QYV/+l9pqCsZ2ixf6jwCtu5b20uQYTblfirWHkE2Ys1dxUP0xQEJGp/SK+4xdQVSdg2qc
	jwHjC0GAlgNDgBEZ8mzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fy1-0000000E0rX-1Kcm;
	Wed, 02 Sep 2026 08:05:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fy0-0000000E0r0-0pkc
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 08:05:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A33856022F;
	Wed,  2 Sep 2026 08:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9B81F00A3A;
	Wed,  2 Sep 2026 08:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788336307;
	bh=POBeg5oYSCo+FIQDgbq/vxgIQF5Bm0qqPNwWPMShsUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XvlTbvekBbQsDRT9x9URH+yjddUxu44FY3AuDSSfhDjCn347ZrPt4ZnpCjCI2AjDx
	 HKKIKCXqlpyrKMRp4xbCyVsWEQYi61hghQaHnm3+gOgzZx7p1TCC7QopI6Jhtw5l2u
	 vRqr4+Or0CVxQZZLhhcDIGwhr4Nd2ZqcmhtS9ex33Nkl+vYV8IDUu8fk6sN7o6+FlJ
	 p/CN5xxcOXa6YTCb2WQ9xXbbUxmfxQFC246+APtpOOjtGBhhykrZsL/3R5XitOu3qz
	 Y20Tdcsar6heuwzAXDDrZwiyCbBhTsOq224swnXziV0n7U9dgWpjtQVNbqjVoUsPGc
	 dlWJZXDefjllw==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 02 Sep 2026 08:04:24 +0000
Subject: [PATCH 3/7] mmc: sdhci-of-k1: configure PHY mode
MIME-Version: 1.0
Message-Id: <20260902-07-k3-sdhci-fix-v1-3-b15c5d0f64fd@kernel.org>
References: <20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd@kernel.org>
In-Reply-To: <20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd@kernel.org>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2220; i=dlan@kernel.org;
 h=from:subject:message-id; bh=Jj2IrYEAi5D0nXnzkcztq1+cyG4TMVNHVzNCRfauSlw=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBql9iaaM4UZp/vQE0cYI7qdKb/qkdldb2BP3Yok
 ZkLj5AwgG+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCapfYmhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0Msw/+I23tD+FYekZsEEvIjt4vcC+6cm3wV2ysurUvKd4XlKf1zCiQ9cB03
 HB+bim6LQ+d4xzQqxagvtewZU4V1P7Lj1cd91eul7iZMYGefmAYQ0LXqDXt6E3MJr5ALW9bqMyZ
 V3BYHXQF7DvQHLIqNrTerfSI3w6pWmj9CBCd/mlutgF1oC4sYTfEEGTnPKrHXU+X4VgPDNjEzys
 1ewJaiPdAYZ8z6FaIEOpyKSPkfObAAjDtbAEZjz0X/g+xBPWAWILN9sPYMe4t9RXtPlXfYU5oTs
 1liU5+kMPJ0Pl7CXvo50E+s4C1XRHk0cq+teFSngkGjxYJfict9E7/pghly/t5eP+khEdvYMASs
 ojG3DoCCSoEgU827w2uyZB+z6RQjjG86O1b40K2I+2l5/gDLn7FeN0LftODzpBJJw02kRfis2uX
 ziMFQEgRwlUW8tFh4ZZAdz3shf1SH69Ir9n+aMUdwOp9/vnbuA6UqPH6zut4i2XkYvycGedb6tu
 AdK2FFCBSgz6TYxiHTdcOiCbwxQKy+K+/YYRQUPaW5iKr0hxzpKSe4Z4P86wzbNPG7teOkYljOP
 4oGCdOCJnZZ5ZAtx62u8unPe9jHYMJSTSVB+1MtALer1nXfSGF4joEwQQOnj9FVFB0F1WLTQX58
 AVnx2jzs6BvE2XwpPeFPc0SfLXlRx8=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

From: Long Wan <long.wan@linux.spacemit.com>

Apply PHY configuration only for eMMC hosts which enable PHY function mode,
and configure drive strength and bias. While for SD/SDIO hosts mode, bypass
the PHY mode and select TX internal clock instead.

Fixes: f87b273e4b6d ("mmc: sdhci-of-k1: enable essential clock infrastructure for SD operation")
Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index afd9536f2368..5dccdd4b217d 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -169,21 +169,23 @@ static void spacemit_sdhci_reset(struct sdhci_host *host, u8 mask)
 	if (mask != SDHCI_RESET_ALL)
 		return;
 
-	spacemit_sdhci_setbits(host, SDHC_PHY_FUNC_EN | SDHC_PHY_PLL_LOCK,
-			       SPACEMIT_SDHC_PHY_CTRL_REG);
-
-	spacemit_sdhci_clrsetbits(host, SDHC_PHY_DRIVE_SEL,
-				  SDHC_RX_BIAS_CTRL | FIELD_PREP(SDHC_PHY_DRIVE_SEL, 4),
-				  SPACEMIT_SDHC_PHY_PADCFG_REG);
-
-	if (!(host->mmc->caps2 & MMC_CAP2_NO_MMC))
-		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTRL_REG);
-
-	spacemit_sdhci_setbits(host, SDHC_GEN_PAD_CLK_ON, SPACEMIT_SDHC_LEGACY_CTRL_REG);
+	if (host->mmc->caps2 & MMC_CAP2_NO_MMC) {
+		/* SD/SDIO: bypass PHY, use TX internal clock */
+		spacemit_sdhci_setbits(host, SDHC_TX_INT_CLK_SEL, SPACEMIT_SDHC_TX_CFG_REG);
 
-	if (host->mmc->caps2 & MMC_CAP2_NO_MMC)
 		spacemit_sdhci_setbits(host, SDHC_OVRRD_CLK_OEN | SDHC_FORCE_CLK_ON,
 				       SPACEMIT_SDHC_OP_EXT_REG);
+	} else {
+		/* eMMC: use PHY function mode */
+		spacemit_sdhci_setbits(host, SDHC_PHY_FUNC_EN | SDHC_PHY_PLL_LOCK,
+				       SPACEMIT_SDHC_PHY_CTRL_REG);
+
+		spacemit_sdhci_clrsetbits(host, SDHC_PHY_DRIVE_SEL,
+					  SDHC_RX_BIAS_CTRL | FIELD_PREP(SDHC_PHY_DRIVE_SEL, 4),
+					  SPACEMIT_SDHC_PHY_PADCFG_REG);
+
+		spacemit_sdhci_setbits(host, SDHC_MMC_CARD_MODE, SPACEMIT_SDHC_MMC_CTRL_REG);
+	}
 }
 
 static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
