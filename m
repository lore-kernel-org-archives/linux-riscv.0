Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91C2106F2EA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvpkBGtMVaP3t2Y5ncW+lDl3176WVgFS4sUpHaNJChE=; b=QOBEjJKYO7wk4W
	xw7ia9lV1LA27v7NfuAjcuxHsVEcN6VCTDFJhO2p+AdY7F+fxRtUJcWzdx1SDB9ATTN/GXHy13MgM
	7g1wV7sYsGNvqmN6zEfFSqwpNpuA0evnUvODZ4OuOE44YsxvS+mRuR00Q/R8DMjJu9ytj3aVwKulJ
	lqQGqx3r8VXoZWc8nApvgdUXpfVzoXQ8+M7r9CBulQ3NBJxP1JUmDAP6e4VgsgbAfEhdS73Nogf/N
	znuAO4RVBhHNwT38PJV2QviNULLo8pnQD1MbJLwik23xfotAMoRCXMm9eQ0wxd3hs1T8Xp3ts19X2
	/INuWuDpbHptItn4vBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvV-000000050pw-3RuI;
	Thu, 26 Mar 2026 08:18:49 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvS-000000050id-0txk
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774513097;
	bh=m5PWPnBQvLfR0iomd90tSIxBbWmrGFtCtbcayo247ws=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=YDB271VFeX81Bz/guWUMIjGgKNCklfADV+xMOYY+lTRr+Nuvcs6/IsHCP1e/kdQCs
	 wMY+By8mV6lI/F/VaaNbWEBZhmVKG5JwnVVm4hm5yGT8fbqoi5dpWOxex0ZWSpPeOo
	 NIJpMyafOEEekmdICLC2/cJ5ihH8hsRfKpMmoqsY=
X-QQ-mid: zesmtpgz4t1774513095tf4b95636
X-QQ-Originating-IP: MLG/4cQa9fTlETy0q6JlXGxJJ0NXRsbM+d638VJCojM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Mar 2026 16:18:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1769004808767929823
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 26 Mar 2026 16:17:19 +0800
Subject: [PATCH v2 4/7] dmaengine: mmp_pdma: support variable extended
 DRCMR base
MIME-Version: 1.0
Message-Id: <20260326-k3-pdma-v2-4-ca94ca7bb595@linux.spacemit.com>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
In-Reply-To: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774513072; l=3360;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=bkVzrnGk9bZIYctd0IsZBkT4x/MeOiAKSLtr4On4XHk=;
 b=0d03RiQJeIucgARexiViZldHvy/GmpOndf05AIzD7aPAhcd8XveNAh6ZZDGm5evT+V5fUb0SS
 sVACPel7RJzA35wNTL39qSsCKBA389y+pCmkNiegesnbqceik6YrBJO
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M8hK3+dbYzF1mmeBWQlfDKKsYzeliPpE48yCw4MDZbMX1vqhmK0u34Vr
	UXLe1gJ3QDA0oI10tNsBYQvpJUyWvJ5SV+JRU8ArTT1JgscoX7+1PE4OFqiDl1bdtCQJrpK
	mhL1/QzU8h/HAVuT1s4x2NS7blgrBxirDTaVWSAILKykSp/Rx/LeYjdBAMgHf72RNMoSs/o
	uUmEPiOEiFFggB+ZijfMVNKMVi1Y9hR6cOHSPbRK3bhLSVCeNfxtLGe88hqPSPdbm0CiKhY
	MGYoKn0Nnsp55RdlP61xWGp/rYsXNiPSnImdplzmDtH0su7Fivl+bDgXi4yxapvuSrN3mbS
	RJPMMvCG2b0bJ1DLxSm3AVd4E0S3g2xK6/cD+ak1j3TmyIdcEhXzlf6pXHbMzXsEV+6mFB5
	tFlxHRb2c6oon8woLXyFMA30FKqaz3fkuNsYeUtN3SOWC7qsILCVuOG75q1yAf0w79uYTDq
	wKkgwOBwhkGizeiTsGx7raMr/CWQ5P0gSRl52+jKdWgO+FacqGMdUFZDp/+TyvF9WzUu4ck
	93YVeVa1pZ07X9uhmCqjRVjlvQigRISPB4gD2c34fEYhtMJ5F9HcXWBX/OSOez0I3PuT73H
	kjYP76H9goqZ6W1gI5NOrxiigJwzV1N/LOv68jVmVfO0JIkAC2YWXarJjj4TQAiBGtDPxQM
	AifNl55UeuEUaWWOI1FEq22Dse9l+bbyGK3NSvD+TGlkbcNV3ZBLc2qZnD3f9hkkX73EKDM
	7yHekhf0EXaQDqxVNfDlKsZUZ2VeIMd7rgt79pdViSuNAXdGcHT1y9HwHIBSIINDCt+KG8n
	Z+cDYC5s2ndCoriirvXRNSJO5SctQ1pAJDDYGkfLBW8sq8CQhszNC18+qQwFo2raXdj6Sy5
	2BPbyEaGs50UPgKS2HEMhqA3NASxgzmycGNIERhKHymNuzLVu8Jlpf/5KYubTDykbpzjGVN
	EO7fPSeiVF4v6HYep+LqX8mfzbN684BDGhbq4xMPbTTNtGGER9zh9/AP1gYjbPLyRxXFEtD
	6MmY1kg9Q7UUlPFc5XYWPmd/59qXp0ODExyO6BJSW42YlWWiys1RJtDgPqEUDy8RfjSH1j/
	zA4oTu+b2Z1sx6XLe+sElSyesgT1V6c8gjaRBSIiX7PU6zs66e9YNZmarVD6X1o0A==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011846_644240_223482D5 
X-CRM114-Status: GOOD (  13.33  )
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

From: Guodong Xu <guodong@riscstar.com>

DRCMR base address for extended DMA request numbers (which means bigger
or equal to 64) varies in different PMDA hardware implementation.

One such different PDMA implementation is found in SpacemiT's K3. In
this patch is for preparation the adding of K3 PDMA support.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/dma/mmp_pdma.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index d12e729ee12c..6112369006ee 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -51,7 +51,9 @@
 #define DCSR_CMPST	BIT(10)	/* The Descriptor Compare Status */
 #define DCSR_EORINTR	BIT(9)	/* The end of Receive */
 
-#define DRCMR(n)	((((n) < 64) ? 0x0100 : 0x1100) + (((n) & 0x3f) << 2))
+#define DRCMR_BASE		0x0100
+#define DRCMR_EXT_BASE_DEFAULT	0x1100
+#define DRCMR_REQ_LIMIT		64
 #define DRCMR_MAPVLD	BIT(7)	/* Map Valid (read / write) */
 #define DRCMR_CHLNUM	0x1f	/* mask for Channel Number (read / write) */
 
@@ -154,6 +156,7 @@ struct mmp_pdma_phy {
  * @run_bits:   Control bits in DCSR register for channel start/stop
  * @dma_width:  DMA addressing width in bits (32 or 64). Determines the
  *              DMA mask capability of the controller hardware.
+ * @drcmr_ext_base: Base DRCMR address for extended requests
  */
 struct mmp_pdma_ops {
 	/* Hardware Register Operations */
@@ -174,6 +177,7 @@ struct mmp_pdma_ops {
 	/* Controller Configuration */
 	u32 run_bits;
 	u32 dma_width;
+	u32 drcmr_ext_base;
 };
 
 struct mmp_pdma_device {
@@ -195,6 +199,13 @@ struct mmp_pdma_device {
 #define to_mmp_pdma_dev(dmadev)					\
 	container_of(dmadev, struct mmp_pdma_device, device)
 
+static u32 mmp_pdma_get_drcmr(struct mmp_pdma_device *pdev, u32 drcmr)
+{
+	if (drcmr < DRCMR_REQ_LIMIT)
+		return DRCMR_BASE + (drcmr << 2);
+	return pdev->ops->drcmr_ext_base + ((drcmr - DRCMR_REQ_LIMIT) << 2);
+}
+
 /* For 32-bit PDMA */
 static void write_next_addr_32(struct mmp_pdma_phy *phy, dma_addr_t addr)
 {
@@ -301,7 +312,7 @@ static void enable_chan(struct mmp_pdma_phy *phy)
 
 	pdev = to_mmp_pdma_dev(phy->vchan->chan.device);
 
-	reg = DRCMR(phy->vchan->drcmr);
+	reg = mmp_pdma_get_drcmr(pdev, phy->vchan->drcmr);
 	writel(DRCMR_MAPVLD | phy->idx, phy->base + reg);
 
 	dalgn = readl(phy->base + DALGN);
@@ -437,7 +448,7 @@ static void mmp_pdma_free_phy(struct mmp_pdma_chan *pchan)
 		return;
 
 	/* clear the channel mapping in DRCMR */
-	reg = DRCMR(pchan->drcmr);
+	reg = mmp_pdma_get_drcmr(pdev, pchan->drcmr);
 	writel(0, pchan->phy->base + reg);
 
 	spin_lock_irqsave(&pdev->phy_lock, flags);
@@ -1179,6 +1190,7 @@ static const struct mmp_pdma_ops marvell_pdma_v1_ops = {
 	.get_desc_dst_addr = get_desc_dst_addr_32,
 	.run_bits = (DCSR_RUN),
 	.dma_width = 32,
+	.drcmr_ext_base = DRCMR_EXT_BASE_DEFAULT,
 };
 
 static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
@@ -1192,6 +1204,7 @@ static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
 	.get_desc_dst_addr = get_desc_dst_addr_64,
 	.run_bits = (DCSR_RUN | DCSR_LPAEEN),
 	.dma_width = 64,
+	.drcmr_ext_base = DRCMR_EXT_BASE_DEFAULT,
 };
 
 static const struct of_device_id mmp_pdma_dt_ids[] = {

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
