Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C263E6B26E
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 02:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84hi1oRXVeJPro8uKvnQvkDmKfMLoWjaxnkGq4bpA5M=; b=ErYQGzr/3eHOPm
	FeLf3NBd9VNK7hYwBkn0cxjvjxb+dY57d8PNnGMQXOPHzqtgBN6W7ds+SNLRHch0p9BgOGrGAXKaR
	xPKEqFgCzBL6xKS1hoR6hlPszxIDLWokfDuFtu0ksjcAfhNTqSmS1iMOCZYCy/9qgsPLXv4rFkxVw
	ozb1ss9e3IlhgqYJ9qR5mdsykWmiqls1PCELuHNjib+VyXpETcYHxNcexgXJaCSDpYIyyBGEPABOR
	i4UHC8QNztZbDOAUn7dviLTwmy99BrJYm1BxCgCB4uOs9wKyn+FBob8t5KLYnAa8mJSlxSl+GVWtS
	I7d193/mKtpIgyX9TAAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXs6G-0000000EQZc-1sHZ;
	Tue, 23 Dec 2025 02:26:12 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXs6D-0000000EQYZ-3bD3
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 02:26:10 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C4511340EA8;
	Tue, 23 Dec 2025 02:25:49 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 23 Dec 2025 10:24:50 +0800
Subject: [PATCH v2 2/3] mmc: sdhci-of-k1: add reset support
MIME-Version: 1.0
Message-Id: <20251223-07-k1-sdhci-reset-v2-2-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=ce4+Y523rDAIPKLiYiVpepgukJhlsG9n/nV8mNpv9ac=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpSf2RfD2WwXFPXDLAErvhZvwCQk/JdthhMjeBu
 ZTBA+ana8iJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUn9kRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1j7w//WGx4F5u5HzGEmjh06B8CmVMVWyJYbEA9sutT2S4yyhY9+sfDGp/CW
 pShubJaaMJXUqQcBvOV1cugEmFLOQsYwEGhSuck5HScWZljcRkUyVf+QYjm8z0rJXlamzI7qu2x
 Iu6DGdvvnjkT39Px5+UdVpbQfsI5ESh5KC7oVuqSJM1i1AjclD62J5vpJtiyzZGqw13IM22x6Ka
 xXPVOzF1tuE9z0VpcRVsaQsdWn1jZSMr1I3Olwp6eJsZtwoKVgP/H4o7mIbTTMctiPnnlc20yAK
 vBK8ZbVOBtmRdMAyJ+3VtJOQC3J9rCFFojZLj8DGvEOAn3zckuOXi9oXz/1dC3ex+Z+BF28ndDp
 JFtZUKQs3/OD0v8Gyl16pYJ5USrZ2gLwLZNqVHFlZWDgb8Wlb93o2sIfoRI3V1Gor+hb56+blah
 vKmVdI4SluGKxdyGa6Fb6ifnHgrFXpDZFjN3RAxLf7+N5+kzRHf5mxqY+bnBkFZCahk6MGQ/69p
 Dp/n2xyccnexDvLaLucA5wZg/hdMugmvvZBf/u0AklAxM7P6ATct8/TMIS3JXz5eOz16m2DoBtC
 sYpdO2Nx1aARwRHlP41enF51owypBFg462pknnqKZw3PP9fgcpXddonGMPfn/GpkZURYM3jX0VI
 EoaFshwS6a0yuct3YjW5itkS83d+n0=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_182609_944581_3FCEB22E 
X-CRM114-Status: GOOD (  11.69  )
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
initialization phase. Still using devm_xx_get_optional() API to
make the request optional.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0cc97e23a2f9..a160e1d5d9bd 100644
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
+	rst = devm_reset_control_get_optional_shared_deasserted(dev, "axi");
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
+
+	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, "sdh");
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
