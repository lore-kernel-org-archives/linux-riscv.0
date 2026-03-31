Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA54FF60E9
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 08:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvpkBGtMVaP3t2Y5ncW+lDl3176WVgFS4sUpHaNJChE=; b=vYKBf5kthiGUz2
	q39uQkR1CzcmXBnVln41MRdz9dJeFqAN38q5MnyEG0Qp6CnV+Lw65wqsVL/r8q47gDAVJmlhXce+6
	NiQoZlh5h0Q8Rs+GHignqaDfW/sJWIFB7Ip6jhtPSypvqB6Mq0jGKZ+2Ltz+6XMkF7PIWVVwLUn7b
	H+EgPj55BM9UizedYMLVVLfZCil+EJpP4tLJcjJIgAUOwGO/LbmJMEFcr6Xvws5kTBWRkiBfjR/OW
	+ClDkLBFP6WdqMyuId6MGSgBZ9XCb1Yzw04EVwIPkb7xCDgzkJhvhnzad98Zh3xyrpX58h4AtWBQ2
	pBPiZaqspVHhCsijiPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7USB-0000000Carg-1jrc;
	Tue, 31 Mar 2026 08:28:03 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7US5-0000000CanJ-2cRt
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 08:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774945646;
	bh=m5PWPnBQvLfR0iomd90tSIxBbWmrGFtCtbcayo247ws=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=qOlvm8tnyTNsWw+xsSNjrx9NdYYZ1gd7GuLToAl3TLcytDQb44f11TjVX8f1tnC0Y
	 r5g885eBgmuPa4oDNu/nuLvkeYlzKQWNETasXInoecwxbJjMjvUzKPRta3kW1xR08k
	 oz2fa0zGXhls4jkeCVSQx9UrEDNUTCLYiywEcFwA=
X-QQ-mid: zesmtpsz3t1774945644t777b7ddd
X-QQ-Originating-IP: maBAG3l49WXkRB/9Ixs25r6m48QgCw9SLz5l/9N3iPw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 16:27:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 884057616769070951
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 31 Mar 2026 16:27:05 +0800
Subject: [PATCH v3 2/5] dmaengine: mmp_pdma: support variable extended
 DRCMR base
MIME-Version: 1.0
Message-Id: <20260331-k3-pdma-v3-2-a4e60dd8b4b3@linux.spacemit.com>
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
In-Reply-To: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774945629; l=3360;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=bkVzrnGk9bZIYctd0IsZBkT4x/MeOiAKSLtr4On4XHk=;
 b=pc1CMn3ozvj0KpM3e6kcSnogXEp94edjM8vtTqePUKBZlVOTAn4/UlxWWvoDtXB343vxnsVQ7
 vyc/4uq5kKnCml8fdpdxL8ZK5QEvPYl0qD8AgrJK9UOyHRxhjW6tWgu
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NLaj0qEn9iQ85GrIMHEJH3T+Kz4rrr6e5aWox4Jw4k0nJRw3/HnpssXc
	/oqHxucAxRAJHrDqeBc+z25OVMQeLHmXQYX7B3nVKI2SEE+Q/Bw4wqM3wQ1DBTnvfsYQO2f
	+DRvgH7cLoAOppn0Q3/91oONRdFO1SY3ZcmYHGR8mRt8Qn0MAgfEii7sYeJPxumasKeC3A0
	17/YATx7Nmn3d+lt5KpnWqDwZx1bILGX9tomd75L1+9kKXzmkKgAAXjcglvz4FZ1hwKnlCo
	o4Zzxg68/TtmA7aY5CT27k9c7w5wPr49QH/Wc25eQfzszE3yhnZoCMcOp9flTCVAM6zfwS4
	grrbka+45pXSOzKHMdCZvFFY/eN+Z3MLVjwMj8W0Q7JH2N+s5zjSpVsgm6c69DzAGa1SdUc
	mGySZQf8M0WYP8V/RGA6MDbi+IsQSTPUnAwjz5NeHvBwWU5CstfakjvRtoCNo8JFcaLgFOy
	GN9xcJdV3Ul2Xwa3AlhohD4Kz8NNIP/IigMVlyt19ldcjCqrqvPQFLMULh78QyLeh1HTjy2
	tV99u7waVFLiEtjObfLd/u+tLDLgLRktPW90KRhiAyBGjeqylFo4n6N3tbRcIUwOoR7GBkj
	izQQP0vu/BFVA+AXdz7ayEoS1TfsLoO58a758dRXicWN2S+cVUxsWzCRAAeTZ6NYtjcETLL
	aHvpQm201ZXt4aJlg+/r+2rJte/KudKAHdsSbjHFL6u7U5y55GjAT7+vuoOQIn3hdmMJZaH
	fNsvQa+f4xp6rW+S4P1jsHMtmbiBfA1U3SiPnjV5aSC2f358Ngu9a9Bm5VZdp1zl7zaaN+m
	5eOcQOQZG4gYUmn164MlUu5n6Qp3mSA1TSa1zK9ri0T3ohjDvUSJblyiO8JQFSZVtrNrGGq
	DgjK0u+ftJ2wx9ozfC0D7Rd3KLx8jFiMhhBVtTxBkzxUZwHQ8hK2rLs64roz5T0rQQJzQh0
	9WGtwt+tGUQaBBn0Y1HyvL4qmKuyKLvY0PiVVuTWt1HrrzSsHVx+DpriSUXah4qunlaBtAS
	QoAzvtnAG9lVcdu2xcMVHuY6pHo+KzTzToMqlucoq6oHW5hsj4QRrbad6G8YTUDnqrqeXG4
	juwdKvbOcfbgveOlvIwYu0lFk6eqFK7LWCS0PPJuuSAed0eEtUIOWYTeVrQn6Yrag==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_012758_175243_097E2872 
X-CRM114-Status: GOOD (  12.70  )
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
