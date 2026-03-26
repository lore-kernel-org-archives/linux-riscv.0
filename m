Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED526106F2F3
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dExmpm+jmfeDiGRgpax9rZPNldsmj4Xa55/G7h2WHV4=; b=e/kyTJKfhqOC07
	qbmjbxO7PxJFgkrZs/z7Ge2qsScbb0ZEUqLHsAjvhmj+HF4XkhMgNAs+6vbe56K646y4RTj1/l8FD
	G8COCv2MhbseVe+5y6oftRKx8F+xSpXehcLjLUlTTEsTwrZht69+jr8YL9KHUsCt9/SV2XfEzFR5z
	EM//75mCUk4HrJEKZ19uM6zZQiFeY0ME+CifsrnX/EdUu9EEpYGBtDAw/aBDHQ5LP49ijOzQMPcz9
	Wijqcf8rcOQAK31QTmbEeaka59vCLwHV2ZhZSYv48o6H8dMmrWmtIBXMgNldENNjn6QqCy5oGPELU
	w71HYcZT3W4FfjHyQ7eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvI-000000050kD-2Vi0;
	Thu, 26 Mar 2026 08:18:36 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fvE-000000050gi-2IgP
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774513083;
	bh=JctvVoUnaYZEcUpcCeUAH/O01I6H69FJWZpg30drLls=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=SCqzprsW8Xeh8RuuxM+BBSZctjqtCAOZHj6KhkC1gJ2BqTC5AVhvsJIEU7P1+zb/E
	 9a7q2LikAHMHpZyxM228ZL5eIZPhtAync7wD9wicGxgMDnPCReVTSAp4R3UldEbxY4
	 UqDqOWfvPkB/3qv39HnTyZ3qBr1O4sfn8/SWgSYE=
X-QQ-mid: esmtpgz16t1774513081tbccfb4c0
X-QQ-Originating-IP: Mh9AT6pm+aCJmez532928YdCKW9DJR0TT1tPXVr952g=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Mar 2026 16:17:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4318848773222408251
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 26 Mar 2026 16:17:16 +0800
Subject: [PATCH v2 1/7] dt-bindings: dmaengine: Add SpacemiT K1 DMA request
 definitions
MIME-Version: 1.0
Message-Id: <20260326-k3-pdma-v2-1-ca94ca7bb595@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774513072; l=2208;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=jftuX0/6T93a2q6FaJ6IWX9yiqjzUUWE9C2UFzElo1s=;
 b=N1QynMvDYNMINgIJKUQsh18gXAceco8FcEfk9gVepp3DBY2+KntTHQeg2WysOeMF5RgFN1RNX
 KA3itSUVCXYAL0tSsOjI1Gb+NL+PEw4FLfVW6zPpW3PUAx5l6Ye25sT
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N3dgTRomRxpb14BO1baZuIkZSQL9W2Oq8QmO4L79STC+HifFH2ddI8M3
	yHlcRkFhIaxtuSy2alPco+wMQV0v3EtXtDjahmB+alsa8qslnVc91plwNQOGJkZaw0HlDpu
	ObvMgP++UyhdWG394IInDNegV0psAnrJNgEw/T/Nxszyug6jq0zfy4B0Ac0+dIwNQnb5z9I
	UEC9dmOzMueklyHwHuBmoqbRCSNAU5GH3JKYd/ZZe36VhrEa9gfNt5lIp6JGZTFSu9BgUot
	4RMwUVVt184MPpRtegItGSWR+WAnXt8DiKdsGfdJGxZKimvj1FZx588lcFYKsTp7Hg+/J3M
	FN3w27eMjPR/Au9KeY9G2yQhh5PaRDdxGw19jpTxu+iKcuSk1qBRWRwH5FmtTMtADTZrwIn
	Sua8OYE+BvJU7Js6uYbrdxXVWq6GGsWUGow5AJyiaL+GbNV7N21noQ83de/TMRTzA3M4S+Z
	Lx1JPMmirG03KHDdfh+L0YOY980IYQZ5KxY7+YjnSYq/jLop8it6TVDOmUMdobnhGR59sv8
	Y5k0qY03S6k+g9byaima24LxYwy0f9eM2QuZxTqVk8NqxnbBv6SlVlq5tRKtsPI1yMDbW4z
	sjq7kSzgjbKVdWpYqtMvFiylbsspcoGYI1LTa4+sM3kqEgd9vKWtc+axXiHZUaQpzxJSWH0
	c10eNgUNtwP6UPta/Oh2DpVmkSTOQWLx7FoE4JiqMucvS2b5xOqk1fuypUqZWUasHQIbh//
	hPeAnHC7kd6G7oolLGwlDb23avNbO51jx5xnMRC56Pk80I2riAj7XvVcWj7j9OtjUzYVbHd
	dIF9XZywLVMCTZlcsqe+KWC8diW0nsNoAtEAVUDAxMYbtWrlE1Z4DhlU5yIcTZAld0CfGB+
	1DkM/6iXswe7obeYk+yNg9IgrsysJFM3e5xRuKzc5XbKCC1TJqefi3zIlyV+xkduNpZTA0r
	psfVdwjk1DGOGvDF/Ucy5yYJRqZoHqQlUlAVEiFusmrU1EJP5s850a+PbX9nPWDXZmfs2mO
	5kwyE0+nPTxfLkzIQ/PIksNI98aMbXigOulPwI/ZY+N9wH1WD7ZpVnum7rsLlthKRMOMhqK
	Nb/gTFdWF6rCXAZpid8M+aedn9fawe+86Qu7Z7WmrosE87vI6C+XBQTxyKRg0bdvA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011833_319235_4DB373CE 
X-CRM114-Status: UNSURE (   8.70  )
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

Add the DMA request numbers for non-secure peripherals of the K1 SoC
from SpacemiT.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/dma/k1-pdma.h | 56 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/include/dt-bindings/dma/k1-pdma.h b/include/dt-bindings/dma/k1-pdma.h
new file mode 100644
index 000000000000..061748c177dc
--- /dev/null
+++ b/include/dt-bindings/dma/k1-pdma.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides DMA request number for non-secure peripherals of
+ * SpacemiT K1 PDMA.
+ *
+ * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
+ */
+
+#ifndef __DT_BINDINGS_DMA_K1_PDMA_H__
+#define __DT_BINDINGS_DMA_K1_PDMA_H__
+
+#define K1_PDMA_UART0_TX	3
+#define K1_PDMA_UART0_RX	4
+#define K1_PDMA_UART2_TX	5
+#define K1_PDMA_UART2_RX	6
+#define K1_PDMA_UART3_TX	7
+#define K1_PDMA_UART3_RX	8
+#define K1_PDMA_UART4_TX	9
+#define K1_PDMA_UART4_RX	10
+#define K1_PDMA_I2C0_TX		11
+#define K1_PDMA_I2C0_RX		12
+#define K1_PDMA_I2C1_TX		13
+#define K1_PDMA_I2C1_RX		14
+#define K1_PDMA_I2C2_TX		15
+#define K1_PDMA_I2C2_RX		16
+#define K1_PDMA_I2C4_TX		17
+#define K1_PDMA_I2C4_RX		18
+#define K1_PDMA_SPI3_TX		19
+#define K1_PDMA_SPI3_RX		20
+#define K1_PDMA_I2S0_TX		21
+#define K1_PDMA_I2S0_RX		22
+#define K1_PDMA_I2S1_TX		23
+#define K1_PDMA_I2S1_RX		24
+#define K1_PDMA_UART5_TX	25
+#define K1_PDMA_UART5_RX	26
+#define K1_PDMA_UART6_TX	27
+#define K1_PDMA_UART6_RX	28
+#define K1_PDMA_UART7_TX	29
+#define K1_PDMA_UART7_RX	30
+#define K1_PDMA_UART8_TX	31
+#define K1_PDMA_UART8_RX	32
+#define K1_PDMA_UART9_TX	33
+#define K1_PDMA_UART9_RX	34
+#define K1_PDMA_I2C5_TX		35
+#define K1_PDMA_I2C5_RX		36
+#define K1_PDMA_I2C6_TX		37
+#define K1_PDMA_I2C6_RX		38
+#define K1_PDMA_I2C7_TX		39
+#define K1_PDMA_I2C7_RX		40
+#define K1_PDMA_I2C8_TX		41
+#define K1_PDMA_I2C8_RX		42
+#define K1_PDMA_CAN0_RX		43
+#define K1_PDMA_QSPI_RX		44
+#define K1_PDMA_QSPI_TX		45
+
+#endif /* __DT_BINDINGS_DMA_K1_PDMA_H__ */

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
