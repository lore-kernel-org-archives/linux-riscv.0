Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B736ECD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 03:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFZ+sjHdLtPHv2B4Ib/bU8p5FwVCXNdhQv3EuQXUPGo=; b=z2YWhg7y0Ra3DP
	AN98M35qJJBOrRrfXfxu3xWSTXzCO88Atr66SHEOvXUigmjgsFhhvLbNRBSgu7aO3OiHAvoJph85+
	L0sYUd01TifAaRKp5Xagn0l7UQKXu5U98oNl7UQrsFvGJVCZlrM3u68mVx/MhzEpa5DlOaqKpxCBC
	y/QGhslNyEqKb8jAPXCQDffTDE+XItaSkXwfRm1iCWtK5ikMPJRitETvY2FkFvPEiUBl+HnfDH7Ce
	TKbQCKrXF/meltJM6ZXAkGw3VaiXynHxIFemk7w6z4FIQxXfblrj5LYuHJQuIJ5wIDpZrvFikbs40
	0jvHiLhV8E/dZLYnWNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOokD-0000000E4Dc-3uGu;
	Mon, 18 May 2026 03:34:17 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOokA-0000000E49s-2agY
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 03:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779075183;
	bh=WEgTcLNT77PCijZFbGfJuG9Q2+FviwpZN+Iidr2F1Pc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=dms/x391knk1iLj+iJsosBnFkeRnuSDkxVimkvvoAthudCLlWTjArEpD6QtBtgpC+
	 i0WTwnDVWRSg+TTRY+2zO1crfC39uiYtPL3gBtYVCZlraaPgnzSfRduWvJlJVDUtxk
	 KPvBfgsqqwV4uwKhkrNkbvYHJegm+GfCUoCoq54s=
X-QQ-mid: esmtpgz11t1779075181tc414a223
X-QQ-Originating-IP: 4aa4xy6kzyEDn/hB/3pvOYHE+oja7bSXKJIbbQWp0O8=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 May 2026 11:32:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13173599530094016733
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 18 May 2026 11:32:43 +0800
Subject: [PATCH v6 3/4] dmaengine: mmp_pdma: add SpacemiT K3 support
MIME-Version: 1.0
Message-Id: <20260518-k3-pdma-v6-3-67fdf319a8f8@linux.spacemit.com>
References: <20260518-k3-pdma-v6-0-67fdf319a8f8@linux.spacemit.com>
In-Reply-To: <20260518-k3-pdma-v6-0-67fdf319a8f8@linux.spacemit.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779075161; l=1920;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=4bfDEGXKbTnBfbIASslfHWXUB5uEewAj9IfOGNMEQGU=;
 b=35O9x039QUshxfCNVAwtdRjrlHUF1XNZmIUopflu/G8cZVfv1HaITKa6Rdeu52LOlSXMh1z0q
 uVsxDuTNImwDpSV8x+XhBphYQkHsLFMUcdsBIGtHh12i2XneJIF+U8P
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NJ/2NKTMb5Qh5VVYgj+xtVdQuUR1RKX3qnKZq9B3AJh2fRtOCq5b1Swz
	QKtQ/3K90NVDlmQOo9vBZhBGUpQSNQLcNx9Ec/I6qTTr2bHwhajPRh3PVkFjdvmvss1qHVj
	df9DMDcSANIhHzX+mrZ6CHtxc4PlaLxvwtAuLMOVtd8bPuWxuAls3ZeAgO37xLSaj1mwY/Z
	En/+Tp1qMwcfKuZcHEdCRORK7SXAuUfy2pDIj70tQl1Hy7XTgghSZOwBelW8Ur1/clQpFwi
	PrGx3IyRaXPZZ9uQXebV//Y/pr6G3X9ztyVIBRQfWxXc5dp5T6ifsaJmXHThOjiCd3ItZSm
	e78ti6fzwG48mY7DCBJkI4ep+SF06Bd9AC1/yvXuhE028L/n9Lyt7zLSt0ALfnozCcNu9hG
	H3R/Ck6rfyTDt7tZW3S9H7UpUNAsRZgN7KSTzl72HMCA6BuIjv4jA0UhzBqWFc46PBbkDv9
	GzHkL1Xiow6fkO8JX/zW1t+mqgvaLy1KBjuT9g+ZPKfSVXYRy+Nm2lpI49az0HHltgXk2ES
	q0QgdSN07NnwfaefbJgLyhdGskHSnlbcYVRuGZP5LK0+iZlkCXjydM1mKu6TWdAYuaUeWUj
	9W5vvKnD6NORAvLk7WH2YWGlHPx0NjXhplhpnpkK+pT26KNvTs5mo4inb+c0+yk3i48KkJY
	2zLM3BfgYzn05TpyZVjICm9zs/BMBiP0Jn65P79uR4YcNsms3rVS201tmA8CXnIzcC0Bn4G
	FLFGWShHy3jZPi1AoCo+l1BcH1VBRdo9Ex2UPmALyMlf1Rx5sr47oboEikTibycJTiUpqi6
	cVnyvpzdVkw5yzA+81bVQ3IgtV4Kbyy7MzYONX6lFsUWm9AVHJIxRCmGr1hG0ncjN3k4Cx3
	stIA9xcdjRlik7tc1RIiziDN0PjlsKPCwsx8m1d0NJXI23TJQDovtpM6LHxzjLujuAwRwoS
	48pF0V/dUqQlQvZS+pxv1QRm8BDrpU3NcxSfXXKwOnDjzc8G2dQ8x6Z41A8p7OyXg0kGcf4
	s0m7i81s/fIP5uhIe2c0XourDfwu0sBnEzlXGIZP1D1tjkL9WhTjkPBDdAC+XtWIeWSCjhq
	DfZ8QST9UKv2lwhEVSgJQvuYw2ON1RXpaSAz8dwmwJPOAVGVpN7rRqyOA4woSQc5UIHkxiI
	w2NL
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_203415_163592_0B0E9D26 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

SpacemiT K3 reuses most of the PDMA IP design found on K1, with one
difference being the extended DRCMR base address. Add "spacemit,k3-pdma"
compatible string and define a new mmp_pdma_ops for K3 PDMA.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/dma/mmp_pdma.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 6112369006ee..386e85cd4882 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -52,6 +52,7 @@
 #define DCSR_EORINTR	BIT(9)	/* The end of Receive */
 
 #define DRCMR_BASE		0x0100
+#define DRCMR_EXT_BASE_K3	0x1000
 #define DRCMR_EXT_BASE_DEFAULT	0x1100
 #define DRCMR_REQ_LIMIT		64
 #define DRCMR_MAPVLD	BIT(7)	/* Map Valid (read / write) */
@@ -1207,6 +1208,20 @@ static const struct mmp_pdma_ops spacemit_k1_pdma_ops = {
 	.drcmr_ext_base = DRCMR_EXT_BASE_DEFAULT,
 };
 
+static const struct mmp_pdma_ops spacemit_k3_pdma_ops = {
+	.write_next_addr = write_next_addr_64,
+	.read_src_addr = read_src_addr_64,
+	.read_dst_addr = read_dst_addr_64,
+	.set_desc_next_addr = set_desc_next_addr_64,
+	.set_desc_src_addr = set_desc_src_addr_64,
+	.set_desc_dst_addr = set_desc_dst_addr_64,
+	.get_desc_src_addr = get_desc_src_addr_64,
+	.get_desc_dst_addr = get_desc_dst_addr_64,
+	.run_bits = (DCSR_RUN | DCSR_LPAEEN | DCSR_EORIRQEN | DCSR_EORSTOPEN),
+	.dma_width = 64,
+	.drcmr_ext_base = DRCMR_EXT_BASE_K3,
+};
+
 static const struct of_device_id mmp_pdma_dt_ids[] = {
 	{
 		.compatible = "marvell,pdma-1.0",
@@ -1214,6 +1229,9 @@ static const struct of_device_id mmp_pdma_dt_ids[] = {
 	}, {
 		.compatible = "spacemit,k1-pdma",
 		.data = &spacemit_k1_pdma_ops
+	}, {
+		.compatible = "spacemit,k3-pdma",
+		.data = &spacemit_k3_pdma_ops
 	}, {
 		/* sentinel */
 	}

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
