Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA81F606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ICp8VTVt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gf+kZ96c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fp58xdgDlbeqzlzuzSvR22LgrczOwk5JrCvS7tTl8UE=; b=ICp8VTVtQC6hJ4zVif8b7gHMFe
	bBXb2kqd46zMx83/ene1sYBerEnHG5djM9QtBf0Sv23S95jV14GwQnSjnmcJU0xAFYxN5qwpdD2ao
	zGssNqdZ9S8rPPrvnkZPE/yyd0G9MHJxg5zT6Lzqfx+NEts8W/uQECX463KjVXDDZ3drJMiId/KRC
	G7sl32z18Wpu58y+Ug0i6wQrUizgRqqa+iJtlUQ+Ilm8bBLWZTm6S+p/WWifv80GmbzDiJXjh724G
	q/t/0Mgluwn8tF7YjebsC1xCb3ov7YQPo4PQ5aBZ666DntYU+MuuSVScMdY4zfEHT9y+PPAaU52Jw
	xZaBaFIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWM2v-0000000BWs1-2JK9;
	Wed, 25 Nov 2026 23:05:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWM2s-0000000BWqZ-0IWI
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:04:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CFF274470B;
	Wed, 25 Nov 2026 23:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6101F000C4;
	Wed, 25 Nov 2026 23:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795647897;
	bh=pby6ROZEcPP/akhHNpSuVe8cP7V1dKMFwkUigrfM6Dc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gf+kZ96cMQj7Xh+u1vk0ntuXeSYE7xknTtR0mnnrxSZLpneP9XgrWGLjX/wKiv8Ej
	 6aAupjkobui5/nK38UtCV+52tPW/rv6vujcka8gCsmpEYgj6KegTQLA+poTPEJHuKC
	 bUAobJE5lbBj2Yrt/4LkDMdN4m4Njlg7PEMfZdv6Jjk1AdiD7APZKNpLQSxZsh8n+S
	 ZlrlX1QfpTaMiWQwRIwt9KhHqfUbxr4JxKim9C63fuejQUD/+sBXgwnsOruVkOPE5W
	 r1H1cwTk2ruHwUklKHo3SutMkb9KIPLwj6AENbONynTC3iBQy6UqzfawR6MSSXY/iJ
	 q8kNDlT+OCZ1A==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Nov 2026 23:04:38 +0000
Subject: [PATCH v2 2/2] mmc: sdhci-of-k1: Add TX tuning parameter
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-07-k3-sdhci-dts-v2-2-a069659ba025@kernel.org>
References: <20261125-07-k3-sdhci-dts-v2-0-a069659ba025@kernel.org>
In-Reply-To: <20261125-07-k3-sdhci-dts-v2-0-a069659ba025@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2618; i=dlan@kernel.org;
 h=from:subject:message-id; bh=BPnZzVNxRpMqynOCa0hbZmnCfAwLs4G7uVoGSv+TTbg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrB2mOPrDesfxBHBCsd/snwLAsnSpooR6owqqBf
 bdcdl3VoGeJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawdpjhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3QDhAAlUZQez7Xqb7KeA+vAEigusHmQyq1LUwJNYfMTCcUsH4kS1Z5cgCUm
 faXd4DaHxhud6H9pX1wNgu+wEkHvJ7GtmKZZ0KGO/JSxqXpQmvLm8/bydRL2507U8gWO5bMGqUZ
 szHIXT3Z/l17/2dusoYh7fgsi9swhOwHYFyrk2xOQ8GMobP5lW94uO3GmEDG/6a/Qs2msfMkYti
 LceGwfUWTpUHik8OpakBmP+/o/bOE0H7OfzVKNu+0/t2TnWulbvKMHMm3Sp427AbzRO7ZQoeCTB
 GP+3ArZ+6rILtGFN3oaVgtKPlwFFGA10DJiYJMAc7d/fK9PLfi6i8ssYbJYmYkv7zPkup7cvQxE
 0DG4P/D0hJDiUE7rakF1mFKBWX2Jje8JACSPEzFkCR5tCRY+dBofQs8uP+gskYnrTshTCDVVfVO
 sd1vTl2vGcN6pg3CpeUv1l33sbjNxvn7x9RRnsPFwmA1WrXI/s3gdJwvz9K0c3198VgnjGN8G+j
 Z+fnVXQMLZAoXDFx5UXOfiP3rvEEmRoQugG1pQYLe7d3UstrXVQ33JmTqgspylV/c3h3nu0H+Mb
 V7RaqCnJBvwNeiFLK6gpHKU0MiUFAilrPy3PU4kWJnrNL7accBMlfpfpYJOpNfZlxQ3qrAFelhs
 ogNjfOwXPLpwJ1e7BRGqn/eqopE0Yo=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Long Wan <long.wan@linux.spacemit.com>

Instead of setting the TX delay code via hardcoded parameter, configuring
it via device tree property, which make it able to adapt according to
board specific tuning requirement.

Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 37b0911e7cf2..ee613e1417fa 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -97,6 +97,7 @@ struct spacemit_sdhci_host {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pinctrl_default;
 	struct pinctrl_state *pinctrl_uhs;
+	u8 tx_delaycode;
 };
 
 /* All helper functions will update clr/set while preserve rest bits */
@@ -278,12 +279,15 @@ static int spacemit_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 		return 0;
 
 	if (mmc->caps2 & MMC_CAP2_NO_MMC) {
+		struct spacemit_sdhci_host *sdhst;
+
+		sdhst = sdhci_pltfm_priv(sdhci_priv(host));
 		spacemit_sdhci_set_tx_dline_reg(host, SPACEMIT_TX_TUNING_DLINE_REG);
-		spacemit_sdhci_set_tx_delay(host, SPACEMIT_TX_TUNING_DELAYCODE);
+		spacemit_sdhci_set_tx_delay(host, sdhst->tx_delaycode);
 		spacemit_sdhci_tx_tuning_prepare(host);
 
 		dev_dbg(mmc_dev(host->mmc), "TX tuning: dline_reg=%d, delaycode=%d\n",
-			SPACEMIT_TX_TUNING_DLINE_REG, SPACEMIT_TX_TUNING_DELAYCODE);
+			SPACEMIT_TX_TUNING_DLINE_REG, sdhst->tx_delaycode);
 	}
 
 	spacemit_sdhci_prepare_tuning(host);
@@ -491,6 +495,17 @@ static inline void spacemit_sdhci_get_pins(struct device *dev,
 		sdhst->pinctrl_default, sdhst->pinctrl_uhs);
 }
 
+static void spacemit_sdhci_get_tuning_params(struct device *dev,
+					     struct sdhci_pltfm_host *pltfm_host)
+{
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+
+	sdhst->tx_delaycode = SPACEMIT_TX_TUNING_DELAYCODE;
+
+	/* Override if valid from DT property */
+	device_property_read_u8(dev, "spacemit,tx-delay", &sdhst->tx_delaycode);
+}
+
 static const struct sdhci_ops spacemit_sdhci_ops = {
 	.get_max_clock		= spacemit_sdhci_clk_get_max_clock,
 	.reset			= spacemit_sdhci_reset,
@@ -566,6 +581,8 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	spacemit_sdhci_get_pins(dev, pltfm_host);
 
+	spacemit_sdhci_get_tuning_params(dev, pltfm_host);
+
 	host->mmc_host_ops.start_signal_voltage_switch = spacemit_sdhci_start_signal_voltage_switch;
 
 	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
