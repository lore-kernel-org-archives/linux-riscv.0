Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87162D68BD5
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Dec 2025 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dp5YtAZkvamBZWFFQlv2ppjMTEYexjW1/GFzg3bZupQ=; b=R670U461wTHYc1
	ZfqPk6j0jeCUtuYOWZ/907D39ifBcHpYp4Fr90dt69Hb7h5EKOOhXWRSGyrW/dpYxwJwvg1R2l5tf
	Wi5pXeRy1IdrSFG2zIW3oV2ZQNLpJMbX9TxQAtdF5U1BKgsGcqKtA/69ROrmfsE9jTSA+dUgdYHS1
	hUMI9ff/KPGrLQ4fOabHH0Cw81RVIjmH5F3IJ/J5mIswJSQNKayANADHf5jHA3Yb6/1cjqM/+svS6
	YLyvRIIvS1F3k8EbTS1/UyTGXFDr/7JIuz+0PS7H0VcZz0zumAaPFiSUcmfIfoZiUdwwePzL207dI
	7YUGe7fOsQ1bbyxzcmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXEgi-0000000CFL7-1Jsp;
	Sun, 21 Dec 2025 08:21:12 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXEgg-0000000CFKi-1wTs
	for linux-riscv@lists.infradead.org;
	Sun, 21 Dec 2025 08:21:11 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0B7A8340FA3;
	Sun, 21 Dec 2025 08:21:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 21 Dec 2025 16:20:27 +0800
Subject: [PATCH 2/3] mmc: sdhci-of-k1: add reset support
MIME-Version: 1.0
Message-Id: <20251221-07-k1-sdhci-reset-v1-2-6780af7fa6e7@gentoo.org>
References: <20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org>
In-Reply-To: <20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Z3iYIOPo0NShh3wxil77tWS3egeNeNJQQuOhwb4xrME=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpR63Z1gUXGLoBEzoNgFK+4yuLCXK+1AQv9r22Z
 Q396AjO+y6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUet2RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0GXg/+JDplF5Mat9kwt9zddoUs6PY0KPaGtXYn+vy7mXm5MDd3DqSLaSzAd
 mO8jsQ0rnCIFzrxbG8Uz8RNgKR4hAHjXyvQjAoE8S1yuZh3rxjBBVjjQcSBdP0+Yq7u1eW766gR
 cUfClbMy4pNrU4CbOoICXik3AF9OQQqxMS7Ns8U2S8UGpIAuBmGPVgA1UXI3cYMGq1jEcL1IuBw
 Jizy9PvJrfar6CZKm7mPTTDDCNquX4NdmHbxH7D28vMqdYFGiqoe5rQpMssEdGVSc+MUvYrunZQ
 zMj5ET0ASrdjdCPMl+MLx9JctaMMlQgbvf7Qn+dkXLuSH5jjbdzl2Nc1t8FnGjUpoBHl/DDUF6y
 JAMHpJbRpOPmc99JnBnPg5VPdTUhInwRfKAETlUI+tNYcmv0FvTU4A76vOEsHgUneGoOwXDTYrm
 f5L5PkdijG/rAOrYYGup41rpMVAXNe9heilxCp6gCu2gqsiBOFwteCNP2y2TIhbcBOpKDTxDWoX
 fKr4n9hAZVEuSy+ytRQV8Ap5rzE6jC51EVotsIgToIA5vYBOmE9c97MfAN/CkDgBEk+Qk6UkgNt
 NsKpGAqjudW6wdF+4G5x4XPdCYvFlUE6/HvbeSeW0FKOFMaKb40lJ+VOSyoVnDduVL5UbldCFUJ
 OVmitAzqxIONf87cDS6+WR4HSyrj6k=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_002110_531523_C2FFDDDF 
X-CRM114-Status: GOOD (  11.02  )
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

The SDHCI controller of SpacemiT K1 SoC requires two resets, add
support to explicitly request the reset line and deassert during
initialization phase.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0cc97e23a2f9..f8330cff5b2a 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/reset.h>
 #include <linux/platform_device.h>
 
 #include "sdhci.h"
@@ -223,6 +224,21 @@ static inline int spacemit_sdhci_get_clocks(struct device *dev,
 	return 0;
 }
 
+static inline int spacemit_sdhci_get_resets(struct device *dev)
+{
+	struct reset_control *rst;
+
+	rst = devm_reset_control_get_shared_deasserted(dev, "axi");
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
+
+	rst = devm_reset_control_get_exclusive_deasserted(dev, "sdh");
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
+
+	return 0;
+}
+
 static const struct sdhci_ops spacemit_sdhci_ops = {
 	.get_max_clock		= spacemit_sdhci_clk_get_max_clock,
 	.reset			= spacemit_sdhci_reset,
@@ -284,6 +300,10 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pltfm;
 
+	ret = spacemit_sdhci_get_resets(dev);
+	if (ret)
+		goto err_pltfm;
+
 	ret = sdhci_add_host(host);
 	if (ret)
 		goto err_pltfm;

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
