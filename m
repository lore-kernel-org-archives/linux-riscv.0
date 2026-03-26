Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE60106F2F3
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGTiHDyTqt3Doml95kePNdtt5kXommscOcl8lwL7bew=; b=GhfOrkhrsHkU7P
	n6V3e3u6LjiVXf6whxvM8XFup1vAYhb5oQ7fMbTkKY6zsupPtv0VPnWiA+3d7IOY3+juAPfiecE9U
	j/SemsLocGiC/vT6qKcT2JF8vovFJxBUhdwFUFjt/uaRWymieapSrKgiDd579YhmFxEYfj+1Vinyt
	v3I159IF4uj9VWKk8jomZplQdldYj/6Fsr6JYxgT/l1b3JAm5BMI4OYOguZjQmfggvWByZfPPd/nt
	G5Z/uq/mE9w4cap58kKVMrzAOFpRX+Bs63X6l67V1EN+YUqUaMAiA069xjWQ7pupmdRHUXG/IOEYQ
	v2GCjGZguFuWLB8TCoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvQ-000000050mn-2NRl;
	Thu, 26 Mar 2026 08:18:44 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvN-000000050hi-2cDM
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774513093;
	bh=4HDoQydiOZHCDTR+FRvJn/63D5PYUaAMeBviZAtewek=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=vDl0Dtx9xTiWnpX4RhZGHKks2bd2V2szN5czj//99mhG4FIUo/ogA3xpEs9bJgFf0
	 1+5tEft0lxk/QFjj1+Q4vZffXhgTH1NDt24wEtkeENyqz+ZA6HfPwIwnq+ij4BmNlw
	 xbqtmQLl6nhrVYeWHCIJcbxsDelFRoRbFGgyN2Fw=
X-QQ-mid: esmtpgz15t1774513091t83fea2d2
X-QQ-Originating-IP: isfwicqU9QpqGG3DKUWwcuIz0qdEDCv8uB5gNdNV1V4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Mar 2026 16:18:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4668696482951093507
EX-QQ-RecipientCnt: 21
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 26 Mar 2026 16:17:18 +0800
Subject: [PATCH v2 3/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA request
 definitions
MIME-Version: 1.0
Message-Id: <20260326-k3-pdma-v2-3-ca94ca7bb595@linux.spacemit.com>
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
 liyeshan <yeshan.li@spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774513072; l=3027;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=adZDW2pZlag8F0MozvpqFlsQylZC9Q3Cmhte/nPUn3s=;
 b=/qPUi8PzPiuQUchYFmaLuzqm8fGmM4pb/88oHx66rI1c9AsqI0xCDub1zeUwaD6Or7KJz4F6O
 d7WMkhjTa4LAC48zCTggJLC/IVXtvVlNjyCvmuVkgVP8QkuAThgd+Ml
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mlhj+zxRobshU1X5r8weBBEZ6VOpOc+66MAe2w+zX6q6hFRHwRp9IWbh
	l/95KazVCZz0nasdfO47TLRbM1ax4lwp2vNdt5EPeyCYyeBncYzgJAuIiIC9aqqciSPDDAn
	ruF+2Y/zVUDSuo0XXZrggNXrqTMTC3g9niq5R+AcTGCRBsrpIIAkzrnaruxVqShX7KXezoH
	pTqMPvaJhUt3y2LjkPC5Ui2PE03yU37egyrpeSyZvazqisvvuEUiUgoilNqhb/1sVUPCpXM
	ddp0/piiTPAp2+283D8/JAnUP4mgfmvQj2XXySmAKswEnKdp8JfK9BymrJ0d/Vqmf+YqBLn
	GqpGnrSxWDwRJUOnFDPAgm2xoxq1WtUv2wNl1KtUUkdqs7Ec5mbpAXaonzUK8rBWh5U5jwa
	3D4zUTTGaxqhADRPKf1JTNIt/VA7M9bjkpMuv3G56WklYt0PG5414eBITYrQGyWNvpu02kQ
	o0PuEJRXQMcc8Asz+MYZzNiEDkd3dsaUNACw/uykpmu9V7Q1A1eCp5FQ6ssUTOC7c4H50e9
	El3dZBgSuvUe51zMMTa5gbTAbrRzv7cg4pjk8KAgWWDPgHlQ/AlmlGJlmBr+aWfZoE37KcF
	j5p4ACN1bhOpcueONIKbLkuc6YOKOVcfB4rMRm2B/h8D46R6pQA5uJnc0EjcJYhVRJj/+Y9
	rOq6OO80X/s6IuWc0uOu0g9RL+q8W/XMqmDYrKBqpcywldC+w7hZ5eUCJMrY3noYdQrDB0T
	QSIg0EgY3d4LmK7xEu5/YdmkXveoB1tra76UAo2DIBlE7+tfsZjwRUSYzHG0Yq1qHPsOzsI
	SDbR+tScI+5Ek1u29a0RYulsVdjPtnJttWsJ57CTnUKhR5LKw9u4WbIa/tsU35sr0roIErt
	vIIq8esNxrbelsZ6z+AEaxGMVwB70QPBAdhvColzaRIlubPhvcftnvcK65Qz5ynW8UYdhl5
	KFmhZnSGIWGtu/K/PwnKa7RjCYwHafxsdMFXvox8WDR5bOU7sLT602tYZCz//gOy2hlOLp9
	YibBKxp52Wq5XqDGBM7F6s7zAL8vurm2aEeSUju7GQXAhwsIgd8pq/w7aObCivGzz7GBNX1
	3ewmS0Zx+tQiloTcgesHtKtuJHssRgBADPPIkTVcv5P4KfE03MeQfA=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011842_090434_4E3887F3 
X-CRM114-Status: UNSURE (   8.67  )
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

From: liyeshan <yeshan.li@spacemit.com>

Add device tree binding header for SpacemiT k3 DMA request numbers. This
defines the DMA request mapping for non-secure peripherals including UART,
I2C, SSP/SPI, CAN, and QSPI.

Signed-off-by: liyeshan <yeshan.li@spacemit.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/dma/k3-pdma.h | 83 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/include/dt-bindings/dma/k3-pdma.h b/include/dt-bindings/dma/k3-pdma.h
new file mode 100644
index 000000000000..05541a9a9973
--- /dev/null
+++ b/include/dt-bindings/dma/k3-pdma.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides DMA request number for non-secure peripherals of
+ * SpacemiT K3 PDMA.
+ *
+ * Copyright (c) 2025 SpacemiT
+ * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
+ */
+
+#ifndef __DT_BINDINGS_DMA_K3_PDMA_H__
+#define __DT_BINDINGS_DMA_K3_PDMA_H__
+
+/* UART DMA request numbers */
+#define K3_PDMA_UART0_TX	3
+#define K3_PDMA_UART0_RX	4
+#define K3_PDMA_UART2_TX	5
+#define K3_PDMA_UART2_RX	6
+#define K3_PDMA_UART3_TX	7
+#define K3_PDMA_UART3_RX	8
+#define K3_PDMA_UART4_TX	9
+#define K3_PDMA_UART4_RX	10
+#define K3_PDMA_UART5_TX	25
+#define K3_PDMA_UART5_RX	26
+#define K3_PDMA_UART6_TX	27
+#define K3_PDMA_UART6_RX	28
+#define K3_PDMA_UART7_TX	29
+#define K3_PDMA_UART7_RX	30
+#define K3_PDMA_UART8_TX	31
+#define K3_PDMA_UART8_RX	32
+#define K3_PDMA_UART9_TX	33
+#define K3_PDMA_UART9_RX	34
+#define K3_PDMA_UART10_TX	53
+#define K3_PDMA_UART10_RX	54
+
+/* I2C DMA request numbers */
+#define K3_PDMA_I2C0_TX	11
+#define K3_PDMA_I2C0_RX	12
+#define K3_PDMA_I2C1_TX	13
+#define K3_PDMA_I2C1_RX	14
+#define K3_PDMA_I2C2_TX	15
+#define K3_PDMA_I2C2_RX	16
+#define K3_PDMA_I2C4_TX	17
+#define K3_PDMA_I2C4_RX	18
+#define K3_PDMA_I2C5_TX	35
+#define K3_PDMA_I2C5_RX	36
+#define K3_PDMA_I2C6_TX	37
+#define K3_PDMA_I2C6_RX	38
+#define K3_PDMA_I2C8_TX	41
+#define K3_PDMA_I2C8_RX	42
+
+/* SSP/SPI DMA request numbers */
+#define K3_PDMA_SSP3_TX	19
+#define K3_PDMA_SSP3_RX	20
+#define K3_PDMA_SSPA0_TX	21
+#define K3_PDMA_SSPA0_RX	22
+#define K3_PDMA_SSPA1_TX	23
+#define K3_PDMA_SSPA1_RX	24
+#define K3_PDMA_SSPA2_TX	56
+#define K3_PDMA_SSPA2_RX	57
+#define K3_PDMA_SSPA3_TX	58
+#define K3_PDMA_SSPA3_RX	59
+#define K3_PDMA_SSPA4_TX	60
+#define K3_PDMA_SSPA4_RX	61
+#define K3_PDMA_SSPA5_TX	62
+#define K3_PDMA_SSPA5_RX	63
+
+/* CAN DMA request numbers */
+#define K3_PDMA_CAN0_RX	43
+#define K3_PDMA_CAN1_RX	44
+#define K3_PDMA_CAN2_RX	51
+#define K3_PDMA_CAN3_RX	52
+
+/* SSP0/1 DMA request numbers */
+#define K3_PDMA_SSP0_TX	64
+#define K3_PDMA_SSP0_RX	65
+#define K3_PDMA_SSP1_TX	66
+#define K3_PDMA_SSP1_RX	67
+
+/* QSPI DMA request numbers */
+#define K3_PDMA_QSPI_RX	84
+#define K3_PDMA_QSPI_TX	85
+
+#endif /* __DT_BINDINGS_DMA_K3_PDMA_H__ */

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
