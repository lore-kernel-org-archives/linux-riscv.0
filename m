Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A366D262B2
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jhfxf9hlFWz+bPEPtmc4zVv5R9cw8Ae8aXBEMM+zUs=; b=p3JwWTS1ZMeB4b
	jrVi75a3dUWHHJ46YfKLbcfSa6gVMyECYvPjX30aurKw+VULQLf0vyTvigoLs0fWMhhytwD1cONIL
	TeOaJwypWA94WxF39trwXFp2fV+3z1kcFHXxGdvBK90CHv42YGo5m6CD33+S73+E3+ZBvAuNhBFex
	d4ha7UeImIUnkGJ4oSiMj3I08nMgLZmnh2xwhtr1PJuOSROPW6H1sCWIcg0xo226CgPAsK/+nLFAk
	Q7b2wuv/9LyK0gXStXWFDNkiXh2BiiePA7hUja4Fv1/B/rmhUrh9gWaRVxTujRYlhhw9+UTH5lxHo
	T+EQf3anclSrQFiR8w2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSdV-000000050xC-272k;
	Wed, 21 Jan 2026 07:28:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSdT-000000050wa-0BfM
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 07:28:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E387843DF5;
	Wed, 21 Jan 2026 07:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5073C16AAE;
	Wed, 21 Jan 2026 07:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768980492;
	bh=v62227FUEh7SlB1Slighgoemv0vqLqgB0U/fyZlE6Uo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=io7o7FFrLMWCCtKWTrgyB4YHnunW9pfgEophMURZGXZXRVQ/pf4eDiajANNglpcko
	 BYNu0jOKEJqO49jvWsyQijpwy9Nr9wcwJBnvGTWWnDvzniaV7La8aDMBUxmrWrfO3c
	 sxtLD0kXLuRgHns0khGZBY7dotk9qd7kD5ibCsFjjfJF4DVs94p8Sslf4ZtlDAsqB9
	 xcz6Ttug/h1QxyGEm2r0Yi0tS7FzTIMhD680t2vEiX/CfjfXtUy7u4sR7vDkYqfXYq
	 F/dw4p2JS4ne51/VW24zyX6C875KPABpuSzhcjEVsq9fMvr0dLQlFfWnyY/qYx9xwH
	 Kxs/SYjnDZ/og==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 21 Jan 2026 15:27:36 +0800
Subject: [PATCH 2/2] mmc: sdhci-of-k1: spacemit: Add support for K3 SoC
MIME-Version: 1.0
Message-Id: <20260121-07-k3-mmc-v1-2-ff77c07bfdf6@kernel.org>
References: <20260121-07-k3-mmc-v1-0-ff77c07bfdf6@kernel.org>
In-Reply-To: <20260121-07-k3-mmc-v1-0-ff77c07bfdf6@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2036; i=dlan@kernel.org;
 h=from:subject:message-id; bh=v62227FUEh7SlB1Slighgoemv0vqLqgB0U/fyZlE6Uo=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpcIAA125EduKPyHGpyZkQWQm0Ruppw/jqojoHV
 pK8q0MbKr2JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaXCAABsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1v/Q/+IYGdvuySTpHcRs4eWwSu5b/IhDgPw/C4rXa5s2ayUbw7ILDr8oU31
 ABOBhNnakbAaFbK1bWC7/fVQ07F9rW/UHMBSC1PU4LAXNI39iHADMXIsxVXpZr2oPl11eEYdRAP
 q9OaV5rnn64nD7pAUQKSh9iXFduRzWbhIn2PiVOZb+SEHDkw69aRLvjM5Cgtq5v40+N0YAsDy86
 +1+nnPN8My81wX3Vmt46TO8e+RYbLefo6nVzu4zrme4F8p6uiEVlY2AhTQHlLvo3YM7cCYMAARx
 PU+kssSiht5S4NGjdmmJ+9vHkhUBZK9QFwvUfSShKeODsCIhv9lFI4oMoOY8pkBL/B/+N4/yWxd
 pHE7d+fP44h92ql4LaGMLNny0jpMB0/AyhxL+iAxG/cGIi4vwWtX2h4Rr7p5rYpdB7q8YlelXPy
 BGGhZVMU3wh7Dt2ppqVktPfCfNCDo+RE5HN3RmYAA2neSqbbuKO7HF2LN/gyws/BmtpjUbhW41A
 HcowFb3YfA8tVkXCpmi1iZ+tWRdOsyv3iO65EBPdNmwSmcCFcGx5ldUTQ+ZweQ/014i0N37bEbM
 i2L3g/heLu1lqU2pgWQfdrADTxVVHiZdp6C1Qv2GauglVYTW8WKSd0Hn5cghF3KpMHR8F0dDD6N
 uXaIBAwejZO28a7TRpIVCfSem+QfJk=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_232815_131513_D077380B 
X-CRM114-Status: GOOD (  12.60  )
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
 drivers/mmc/host/sdhci-of-k1.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index a160e1d5d9bd..a56cb8a36982 100644
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
@@ -271,10 +283,16 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 	struct spacemit_sdhci_host *sdhst;
 	struct sdhci_pltfm_host *pltfm_host;
 	struct sdhci_host *host;
+	const struct sdhci_pltfm_data *data;
 	struct mmc_host_ops *mops;
 	int ret;
 
-	host = sdhci_pltfm_init(pdev, &spacemit_sdhci_k1_pdata, sizeof(*sdhst));
+
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return dev_err_probe(dev, -EINVAL, "failed to get platform data\n");
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
