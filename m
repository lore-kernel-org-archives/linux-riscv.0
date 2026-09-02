Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74D8C624D4
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3CaXihlm+KC/tw93vbCl0mfYVh1SQlPQFzGxN1zrFI=; b=wUuuhjKuweBPgs
	gmnPRvnI3l+m+9RbvqxEkNsouEY7xyVEEKtZJXiZApIK1PgkxbtY8wvYDFpzhOMfiABMxjWJEE0tk
	VVNdHg3mI97jgmy+Mf76uIkkhUWzzGDvZGcoYKiSVloGrStQtGqoP+GWTvhHUsFC9T/zaOAdX4ddp
	BTzMZLvCRCUO8eedFDSUQmUVkn9rNRG4ShwabFlnJB86S3fxCqnc1W8jbmHAb19lyATk5O8G+WDGh
	PoGxyN6Aleg7+PChKCQTUSU4RztTVWBgrRDgF2863LcrgPKGSPTYYWKINUh0V62Gw67EPhKXE9ytg
	bUo59OhHFnHEZkgLIPKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fy3-0000000E0si-1kIg;
	Wed, 02 Sep 2026 08:05:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fy2-0000000E0s3-0We2
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 08:05:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78E07602BA;
	Wed,  2 Sep 2026 08:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E801F000E9;
	Wed,  2 Sep 2026 08:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788336309;
	bh=VTBHZqMzNtfGu0/ii6nYXJrwVNlixijnWIIxoUCWQXk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ROO8Ih8PuAw0rLCyOMi8UQ8EKLb0OiVCrXqqpJfz4bOgRcjJE1MrJQqK0OIgtmLMF
	 CcOcDk6E4bB1g1N0fhYG10tQbnvCza1Np2UwW8hBfUkksiNEpSigXyVypds3QLEO3W
	 cHuE2cmI8MaOVv3JwbB7uq13KXZ1zUdvkD8eDOWEIVjF61HezQCRuqJrsbsHIX9sKE
	 YAp0GN3wrcEZ2Ovw0dr+XYm8DpF9S275O9A4iixW0cWG6e4ykKTSswxptKpm/9qyCG
	 W/Zr9HYr4j+Ad8pr0siACb9/P1FXIakgZ6Go10TsRRCKZoy8sNoK0sq552eTUoKb5g
	 ZIrkJlJjGli4A==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 02 Sep 2026 08:04:25 +0000
Subject: [PATCH 4/7] mmc: sdhci-of-k1: Improve power control
MIME-Version: 1.0
Message-Id: <20260902-07-k3-sdhci-fix-v1-4-b15c5d0f64fd@kernel.org>
References: <20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd@kernel.org>
In-Reply-To: <20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd@kernel.org>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=dlan@kernel.org;
 h=from:subject:message-id; bh=ZZnwSyRWem1cufE+ykT/c74WDL6JDGMXan1pWqJy6GA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBql9id5/j9bEGbznCN/oeX7c5UcrLyeiwrT9Z/N
 FnF9u2RecuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCapfYnRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2Enw/9FeHpWaCDIgagCZFIhkm8Y/pzQR5CPvoPpu7bpu+wTsDFQNtNR3IMz
 JQG9a+S9AyRyvNo7NVc8Dj1UhfFczYukpA4Q3BhkRMA50VxM1x7kYv0N/kjynX5jpvX1G44eiQX
 JbDfD7GqZ94q4KxXlemTVuWDytioeDIKwVsw3RAC2+mScY9cadb5Oe5ST8S6ZQZ3QPqDuTdonHC
 IPi2KvuJU23HuCD2sVQUADpc3JnW5AG/GuciRPRMQBwfj/B7hw0czRRamfhXnp1y+5jSxjXuzEh
 VaGh2DFcL4ZvDXiKUiFFfWcRyCOxFkeGLCKrYdJJDxPWsmcAwOyzyWYhTqFBbM79llVtEsR/dWk
 TSXNAI3KX6dAsNqev6VM5HEeTwHEtBHrnakr0MF+6lAhQIeLwXJ6Zv3AQo+wUFSI16FvBl7jfuj
 oS4b11PhrMvdJc0dWh2mi1AFhe5IjRG0nNX6ztWVXk/RWxyvFjW0UCn0ZqTNYUN8qmQcxOmOPjR
 MfWvlnY54ufkWsosPaGTuAs/tc4K1l6/wSmV/Xo36wzyMHfBILtHXcivTKU9EV0aG48C8ug1iDP
 Yge8qgd95ynZgTm/wVqvWPi6A2FeB11VnCE4iMeRxS1lzvvbqBD5LE430I/UaItbkaBtl/A/psc
 yi6O2byc8WesXkBwG6hWkp2xWhwYVI=
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

The default sdhci_set_power() skips the SD bus voltage select field
entirely when a vmmc regulator is present, leaving SD Bus Power in off
state of the power control register. To fix this, configure the bus
voltage explicitly.

Fixes: e5502d15b0f3 ("mmc: sdhci-of-k1: add support for SpacemiT K1 SoC")
Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 5dccdd4b217d..be770e8a9884 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -496,6 +496,7 @@ static const struct sdhci_ops spacemit_sdhci_ops = {
 	.reset			= spacemit_sdhci_reset,
 	.set_bus_width		= sdhci_set_bus_width,
 	.set_clock		= spacemit_sdhci_set_clock,
+	.set_power		= sdhci_set_power_and_bus_voltage,
 	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
 	.platform_execute_tuning = spacemit_sdhci_execute_tuning,
 };

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
