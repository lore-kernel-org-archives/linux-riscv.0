Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD6A106F2F3
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ivafbVldCl1EGJoXDmFJf/vYGNLWo0P6ZjbIiQuGuA=; b=pUg/HSWXjPfJt9
	rOtJufa1MQWbDtsw+oYPst3opzMc3tb6WI6/qJQFfW4vS+gKM2cWL0nS1t+XB+iY1AUck1/r7YB0a
	cFhxx9BmsTRtJHa8LOF6g/dfyr8b28BIWXDRdrPHUlzd2nC0UxXqFXxCuWh3wApY26SMszLgMyJTB
	JA1nhO/SdX048hFF/c3/eJTtVoWNkQLRuqNcX8R/BdL2ZSybeosRBgdhh8SuYxV35bjREksapbI1+
	HJslf03lRy/K+ryylEFj2Kc5BNaLORteWvs34A6Onqqc+vqGj3l0J/Ip1UvlzHilHeNKIr5aRjIzt
	Qfd4F/JgZ1RRjxncQC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvS-000000050oH-3duX;
	Thu, 26 Mar 2026 08:18:48 +0000
Received: from bg1.exmail.qq.com ([114.132.64.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvP-000000050lQ-39dS
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774513102;
	bh=AfkHhDGLpLQTzVSA1vGgmpyjp0IbMp4aeirdAoHtZNQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ZnF8qyWd04nR6pbG5fweVA2kcWfby8ldbygL9cLIXn9yiqJ+CYFOcN7k7YL0PkcST
	 qQVNOnVBiZq/FZTeDyw0R+pGxPGPPGTwLtJghEtA4Geg4L8uk1dtMox8v5N03dI4GL
	 0fpeZYLuRBy5hJMkGIjszj4Fd+t/2O7O5BKvmke0=
X-QQ-mid: zesmtpgz5t1774513100tbfdf4f0a
X-QQ-Originating-IP: q82tvM4vTm1zwnQtZr3+sN72ee+stqENddUckWj/GKI=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Mar 2026 16:18:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2742092535896640534
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 26 Mar 2026 16:17:20 +0800
Subject: [PATCH v2 5/7] dmaengine: mmp_pdma: add Spacemit K3 support
MIME-Version: 1.0
Message-Id: <20260326-k3-pdma-v2-5-ca94ca7bb595@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774513072; l=1936;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=naSKBQlGCncc4Sjkd1TAFqDT0cym6ceyGaNaHvhlkkc=;
 b=gzJG1oV5yaKVjrZQyaBxqKdVvf3DXkLlZJXiJ6LDHZaazSTBBENlrpMm4+JzvfVmKEqLNfO9A
 FO8Grnpb3geBPvBnhnIpDxbA7MB8QodonXiw/6I0nZyk7cV85pNWkNZ
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NPmDtcYUnVcgDA3jFcLvldAQHB9ct0G//ElTaAQLtiYFncMVSdyaP4Tu
	LfIcKCVVmXX8FXTWf76ANeaklFp1zWXrNXsHbaMVNrb8TN66qPHJzEDw+nI9B+BVY+odu3d
	kbbjFXN4p6P9QoLdlVujO2EF1vWAUX5VF/DczETzXcDjxsldS7aksh6G6xD2C9aT6pYpjWI
	zjhGliYC3u9rYMtVNggUwBj0ao7Oz1jzUgBVS1s61O9r5enjzmUlP5G9tRDs1Wz6Wp4k8pX
	qd3QuLN8ZXeRlLJLkCsxMlrhFOdgTb05cD5rNXyO8bZN0Muq7577oW6ksPXuYUN9YtORz9T
	e+D35c9nyeV3taU5fmBMSxjJMrR4K4m8EGHlAvxElXTVo1kVRF4bb2PE/RoPb+AbD5Z8QC5
	C0qGqBich+fvg5VyB3K9MaI13NCGZL2uvrE0OHDST1Ouq4S4OBoMZUZTS0RR7Vfgr7HsesZ
	OA7dUodRF/AgmG9WPvXMnC1N2qIHbz1Opl4BeUHq7uEEuomdudYKGPClY8hzhDMIp0IiTeY
	zR+k1K0yym54Idacx85abH9wK0L17nAeAri5Uz+35lyY5LdSJ88WMyOALGCV511wA+DK7Bc
	TRN8TmvQU/T58JSAobED/5LZviw+uFTzrUbHpqF4vpFCIPb0Tl1qHDWGU6o76ZA+lH+yo3i
	u0b9MGOVqRpIlsM3JrEzZHsQMWc1PPp//jiPgykkZMKBWRB3HdG7PFKoHYeLZcYfs27XseU
	1Ub54G+30SzXo2jGVWkA4l+aEjFrwtxs3oTBkykNy4Ri1hIf4gOZaAWijXsz58C0qocVHMR
	cqeZjHNE/izLUPERuadaeH7igb1vuLDHjLF/wQz3u2ZyhMuwjIm43NJI291Ul5ZVEpGZAwq
	/j/ps+OCYJ+iaCsng4w48NM7vCjCI1ZDtj0gJyuVcRyzt1WVpWKizwQP3YKK6LyNg80f8Dl
	BsC05OrSstaa5CbcbkU0larwN6PsBLVop1TloghTKZJ+663QXeCjsIn1viRZa2v61JK5gtp
	Pg/NwDr2jqMvLwu/hHdeGorE3ghrNNJ7TXg13Ts/A6FksBD/uN8TmOWLMzkx7EJ7YR6UHOD
	Upqtxh2MzExBO7kVNq//8WFD9LCgUpTQYoGHU8Y5l4u
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011844_162339_D63C5F4B 
X-CRM114-Status: GOOD (  10.62  )
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

SpacemiT K3 reuses most of the PDMA IP design found on K1, with one difference
being the extended DRCMR base address. This patch adds "spacemit,k3-pdma"
compatible string and it defines a new mmp_pdma_ops for k3 pdma.

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
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
