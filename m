Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F398C61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 07:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3kKkIjAoj1t2nkWhFaZEbEoPCcyQ8KWGOcruuXBALM=; b=H6rmL4bQi87HvV
	T7RqB6encvfCsL+zATvDOkRzeHStJtJ4anyVt9Hl2B1Kr6wlOZIIW4u1w7PulLfIXJihiPttnG1d+
	3FngMp08pJkEv2deFVSy8JPvSvxmDD+IQ3lnk03/291JwpUki4xEcWSMQ4JNghN797S0B8EiI6yhV
	sbCNQXb6h1+vwjGNGvleRTWb6rwSresy1JOGtafTYpgjWfYztMY+HeVeL7u6PgqJ3DJ8yw/QUD/5E
	IqF1pSU94ggqAr8sEtIP272+BmrUdGSqTACgsaLKdoKp10Q/cWjJg0mglsIvIUVfoxT0dGM22Rnwq
	9B3KKLy4YNZgUuCoN1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1f0a-0000000DteC-1fxX;
	Wed, 02 Sep 2026 07:03:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1f0Y-0000000DtdG-2ycm
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 07:03:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4240E402B3;
	Wed,  2 Sep 2026 07:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D161F000E9;
	Wed,  2 Sep 2026 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788332622;
	bh=lUttOokVdaj+xlO1pDebMWBeyODxm2bzShBudFtyHbM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I24mCWb/BPe5tiVm1lrby+PVvZO5BE9EtKZsXibdWR0uKT1lgovPgUpjyeVowbFf0
	 wKnF5CdGtd1WkXsIuN9BQ892LSdpHkuaTFfcpFT1o7P2x7zoplLETHDKHBaIC8BqIo
	 6LDNuaTJ0LTcp8q4n3ca21WqfaBxzH2KVa6od56Io8KGiDvtBXyoUEFBshd6HO+HFa
	 4CNfZSqrNHy3iWMqkxmAe6nHbLgzIAn/40I3pYJTZJyBYiMmYEokpTqZaKxOEC7ljL
	 EigvMjV3qeiVwXEZi1gtjgovNJzbR9rkeCphraCdA32Zv8htPEDr70SfdNNEdJ4Cen
	 JnqU9/WoqPbWQ==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 02 Sep 2026 07:03:14 +0000
Subject: [PATCH 3/4] mmc: sdhci-of-k1: Set clock-frequency of io clock
MIME-Version: 1.0
Message-Id: <20260902-07-k3-sdhci-dts-v1-3-4e7909cf4233@kernel.org>
References: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
In-Reply-To: <20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=dlan@kernel.org;
 h=from:subject:message-id; bh=xLGXanQt+d9K9+P5rpjtsNcl/WcWw+QwPd2e++Q7VjM=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBql8o8rJIxMWXSKnNvhZvGCO0ghhMa9Q6qdWv73
 oR2x/igg3qJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCapfKPBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+31TBAAhWDD4M27o3x0ygiN+MRZ3wkdJUMBRSV00di/rNxC8ItISahX2JFZz
 Eewi8vTxlD53D24Wmli7vui+zsTOZWZi6AZcJr5g75vl69dHSAaWCKzRh6SGqwPrEOVc2hWwJWI
 tu89GCmhM/6EMwSLqifEJA3FWkje5Y+/TbNvQXXYFWKt2PEMYdvH+rtFIp/0yi/eBZRxBdpxWV4
 mZvHXW5E8hwi9eSUENGi27OHRm54oITiea2JnRY67SvW7scoUUljYBkWLVUOz5SF8DIgLiYYRHD
 cLcwOg36UYvNYYaCyf2YFDy5ESlhcp0YlEXZSwX+MWUJUjrq66/0SX6xO1zLH7oiUb3OiHjqx8R
 HQE5NQciAwGjBGW+8aa/czQxa0ZmjTPVKJPUlT0z641LQDgMj0pjt6yrjFb8SJcBWXiG7iVzqzg
 5NDb2ruX1D5wsL9eJ6GicvzcGsZX+06S2KyxoRNTJU6mOgsTAlPZXYUcSkqVdqDayGEQBhYJQYB
 fFb5W5NMcE8L437V20M5G1wtmfRl7ZrvMjkoYwa+KgwJw7rEcDMD4/Un2WWn+Ob2PpKd1Z+rvFp
 4nDimBhzbNzcVartgA8fvDCpkqMAYdDaXDBw78tGE4ow6LZhbApKF3hmiOGVV36YkV2Posz13Lf
 vFns3EmN3Pu301Q+4o6nhrNFj8xI0M=
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

Add a clock-frequency property to set the rate of io clock, for SDIO
case, a clock frequency need to propagate down early.

Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 37b0911e7cf2..e6ab40c9a555 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -438,6 +438,8 @@ static inline int spacemit_sdhci_get_clocks(struct device *dev,
 					    struct sdhci_pltfm_host *pltfm_host)
 {
 	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+	struct device_node *np = dev->of_node;
+	u32 freq;
 
 	sdhst->clk_core = devm_clk_get_enabled(dev, "core");
 	if (IS_ERR(sdhst->clk_core))
@@ -447,6 +449,9 @@ static inline int spacemit_sdhci_get_clocks(struct device *dev,
 	if (IS_ERR(sdhst->clk_io))
 		return -EINVAL;
 
+	if (!of_property_read_u32(np, "clock-frequency", &freq))
+		clk_set_rate(sdhst->clk_io, freq);
+
 	pltfm_host->clk = sdhst->clk_io;
 
 	return 0;

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
