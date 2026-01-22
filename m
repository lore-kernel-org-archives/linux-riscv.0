Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C796CC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUdQ9zU8kRWQDY16f7xNq5XacNRixH9kiZ2mLlRTAsc=; b=mjGrT72mzEgRpw
	0o50CokZ93wLqvQTS2U5NgRnqvW36bbAs9xRMQ5pWxY9kIVkQIeRkW8Ba7aeoyECc7lU6wUiGo7ya
	9k25fMjq67/6Aa+qktsmtzDyJY5PnVbKvB2IpQPdYM0/gAcE0zFocaH9uwLKaYolZ3sWgTqm8msMq
	7p8zqDshT2mBIMEVbneiHbjjRKCg36uoCBZrg68sDjWJ81sFm8Qh1o5jC4gn03IsXSlDst41S+NrD
	ZAeEtflQOCvKoZPkHlIYo7gVJzXNQUVriFtwxpt1RFNdO11Dndy5wl6ir3wtp5SBfwuDm5AIVniqN
	74zmktLJ+2DMDTXIQhAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vir91-00000006kbI-35o3;
	Thu, 22 Jan 2026 09:38:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vir8z-00000006kaW-0kBD
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 09:38:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF3AC44241;
	Thu, 22 Jan 2026 09:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8B3C19423;
	Thu, 22 Jan 2026 09:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769074704;
	bh=Hq84LpvOFf1/vQuKeAQnCqf63YBB/YXyJlBeAj5UeDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EAOSafwDF9dE3ulOzapkM5r5RTOOxZzFkjDXg0/spFi46+B4juDboTHcWWHgJ47T+
	 kUPzFQTqTDZhast/kSSQzFCBUgJrHTKlrE8IqNHdSRm026MngVShvQFwlgTcyqAcZQ
	 wT8OBU/V4teL9gmFXG710YsMDqMFD+Fn4cluLWlR6749NzRpMhEQ3Ay+ta5AGV5ulY
	 WjnF84QNFoz3HOxGQ+wXCDoJ4oX4wI7sewQ/PU3sNgtazUd80rp5eZjzj5iHJVzn8R
	 PC8V02NTzmXyaEfb59FStSimQM9hwsORbx9Hcqzst+UXK8iiSXDNM1lryXb89T3twG
	 Dg4Pv9vrTCKkA==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 22 Jan 2026 17:37:31 +0800
Subject: [PATCH v2 2/2] mmc: sdhci-of-k1: spacemit: Add support for K3 SoC
MIME-Version: 1.0
Message-Id: <20260122-07-k3-mmc-v2-2-3c3ffef25e94@kernel.org>
References: <20260122-07-k3-mmc-v2-0-3c3ffef25e94@kernel.org>
In-Reply-To: <20260122-07-k3-mmc-v2-0-3c3ffef25e94@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=dlan@kernel.org;
 h=from:subject:message-id; bh=Hq84LpvOFf1/vQuKeAQnCqf63YBB/YXyJlBeAj5UeDw=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpcfAE04NJvPNpshZPMp719z7XFGkqcX1F8qG09
 LO3iQFT2leJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaXHwBBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2rxg//XTOFckVTdAWaCqcQWPcmkXv/mT0KblDEiM+kGlOB37JXSP7NOORpt
 46ypuQNuL6uFvLD9A5lbu32qaZHNf9eu22AONUvGUN7q5jF5AKyQ38ArVihqN16a84bWQoiHYX5
 8qY/CVzND1zwX5pOA/bkaRo9DoBmblec/pn3JGLXbdIGr4WhuWdasv+54PATTh8QBnih7d5ziGD
 koX22bKSgVWkgieera7LxBT5dzRTZemFPtTR0FXEIUiJ2AtYIEp7U5ujIZSUuHmjFDkHHFsr2nU
 /GTGH47bsKhWMCV3/a2m0niYIVfF784ExfqcJpyYHyNXW7cL4IUw4o7wrQ8dT9ccjquAvEYXB1J
 9OeDc8g/yKOvUuF5k41Ev2RhAANrwlgWYX+YaMjEdTCa5cg9s+tw46dgNbmofQsMSDFECSupQxM
 HHd067bQ+uiuKaIz5O1s+O6hOXzuzribm44pMs/xUyZPM8cxi/JUjcy8kaCImVudK38cPm8+O8K
 SGhNNHpQUsgaPQ8wVvjjL8+EveKAqvJoCJV0SlHYTU72qGvrdlD37ne/gTxO7Pmxm1BoZQTcM49
 31P82i3BXnpPRy7gWPeiXrWLN1RtGVX8F5q3u/LTYff+E6qQl6O6ECoavT4YNNGbIvDRUf6gSpz
 OeZM+AiOj1xeGVOWpiWTTpy1NoMlxo=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_013825_261536_6A6F069F 
X-CRM114-Status: GOOD (  11.63  )
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

The SDHCI controller found on SpacemiT K3 SoC share the same IP with K1
generation and introduce a compatible data to denote the change that broken
64BIT DMA issue has been fixed.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index a160e1d5d9bd..455656f9842d 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -259,8 +259,20 @@ static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {
 		   SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
 };
 
+static const struct sdhci_pltfm_data spacemit_sdhci_k3_pdata = {
+	.ops = &spacemit_sdhci_ops,
+	.quirks = SDHCI_QUIRK_DATA_TIMEOUT_USES_SDCLK |
+		  SDHCI_QUIRK_NO_ENDATTR_IN_NOPDESC |
+		  SDHCI_QUIRK_32BIT_ADMA_SIZE |
+		  SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN |
+		  SDHCI_QUIRK_BROKEN_CARD_DETECTION |
+		  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
+	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN,
+};
+
 static const struct of_device_id spacemit_sdhci_of_match[] = {
-	{ .compatible = "spacemit,k1-sdhci" },
+	{ .compatible = "spacemit,k1-sdhci", .data = &spacemit_sdhci_k1_pdata },
+	{ .compatible = "spacemit,k3-sdhci", .data = &spacemit_sdhci_k3_pdata },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, spacemit_sdhci_of_match);
@@ -271,10 +283,13 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 	struct spacemit_sdhci_host *sdhst;
 	struct sdhci_pltfm_host *pltfm_host;
 	struct sdhci_host *host;
+	const struct sdhci_pltfm_data *data;
 	struct mmc_host_ops *mops;
 	int ret;
 
-	host = sdhci_pltfm_init(pdev, &spacemit_sdhci_k1_pdata, sizeof(*sdhst));
+	data = of_device_get_match_data(&pdev->dev);
+
+	host = sdhci_pltfm_init(pdev, data, sizeof(*sdhst));
 	if (IS_ERR(host))
 		return PTR_ERR(host);
 

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
