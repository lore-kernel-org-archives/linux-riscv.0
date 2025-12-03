Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E1AD116F3
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NtEskK4Na0rOsAbolNZ7TxKCbHVUM2sQMHw/tPYg63Q=; b=jqNMLHkzljahDi
	6WXwFxJs5TQo6+B0bBfKj5/eZQViaoVMGaw9OxZMlotCUtzqNVc3vwW8mP63aYHFe6Lmbc1cLQKnQ
	/0wYc2mCa+ytuZrnplfN9gQDdJsg1Rw9EjiKAPtdjA3qyrlU6mZZGNXpYb5GpXSVDa6Sc+5zVNkBs
	lMlZu7R8ge+8a2+pW4r2YGft3JehSLUd7hmP/YOdAOFjGXVpRzqLl818+Cmj7f2Kophq4Dpla138u
	jchxVZggbDBPThAp8uJsOkYIYIJOtQJ8N/I1NHdDadiqKSuTaqnuriqmqrlrysMFSNESsm51cb45f
	x4YhEpsYIeAjaWTxs8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQj94-00000006NtT-02Wr;
	Wed, 03 Dec 2025 09:27:34 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQj92-00000006Nsn-0kk5
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 09:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=of
	asOBwW7yCAEfyKLSniTVfvBY0Aya++4qvNjwi9o94=; b=WvvazeNe+5UZ8lCa9Y
	G30DuDyBCsIjrJ5a6Lt/oLPi/DjCrT25hDmCg6t1J/MeSf6aTw78vYzg40vqLifc
	4NE66oPg3HZdOm+tjFCOfCA4z1YgCLsCIGRZkMkfQn0Cg1FM+w7o9TKLFoBOvnBV
	l3QygXnc3DUb6w9NlWSi4ZsSo=
Received: from duge-virtual-machine (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCXzKhLAjBph7OWEA--.1277S2;
	Wed, 03 Dec 2025 17:26:37 +0800 (CST)
From: q691800735@163.com
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	jybruceupup <q691800735@163.com>
Subject: [PATCH] dt-bindings: reset: Add Kendryte K230 reset controller bindings
Date: Wed,  3 Dec 2025 17:26:32 +0800
Message-ID: <20251203092632.219525-1-q691800735@163.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: _____wCXzKhLAjBph7OWEA--.1277S2
X-Coremail-Antispam: 1Uf129KBjvAXoWfXr43GF4rtr18Cw45JryDGFg_yoW8urykKo
	WfXF1fAr1DtryI9rWYkw13XF4DCa1DtF10k3yqq34rArnrJFZrK3ZF9rWYg398t3yj9F45
	Cr1qqr1DGFZ0kryrn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRNmiEUUUUU
X-Originating-IP: [220.196.194.129]
X-CM-SenderInfo: jtwzimyqqxjki6rwjhhfrp/xtbBcwkZMGkv-c9r6wABsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_012732_566301_327A063E 
X-CRM114-Status: GOOD (  12.24  )
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

From: jybruceupup <q691800735@163.com>

Add canaan-k230-reset.h to define reset IDs, types and register offsets
for Kendryte K230 RISC-V SoC, covering CPU, peripherals and subsystems.

Update MAINTAINERS RISC-V entry to include the new reset binding header
for proper maintenance tracking.

Signed-off-by: jybruceupup <q691800735@163.com>
---
 MAINTAINERS                                   |   1 +
 include/dt-bindings/reset/canaan-k230-reset.h | 513 ++++++++++++++++++
 2 files changed, 514 insertions(+)
 create mode 100644 include/dt-bindings/reset/canaan-k230-reset.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d83920cbc..b489ab6cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22105,6 +22105,7 @@ C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
+F:	include/dt-bindings/reset/canaan-k230-reset.h
 F:	include/dt-bindings/soc/canaan,k230_pm_domains.h
 N:	riscv
 K:	riscv
diff --git a/include/dt-bindings/reset/canaan-k230-reset.h b/include/dt-bindings/reset/canaan-k230-reset.h
new file mode 100644
index 000000000..17a9719b0
--- /dev/null
+++ b/include/dt-bindings/reset/canaan-k230-reset.h
@@ -0,0 +1,513 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) 2023, Canaan Bright Sight Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef _DT_BINDINGS_CANAAN_K230_RESET_H_
+#define _DT_BINDINGS_CANAAN_K230_RESET_H_
+
+/* reset register offset */
+#define K230_RESET_REG_OFFSET_SHIFT     16
+#define K230_RESET_REG_OFFSET_MASK      0xffff0000
+
+/* reset type */
+#define K230_RESET_TYPE_SHIFT           14
+#define K230_RESET_TYPE_MASK            0x0000c000
+
+#define K230_RESET_TYPE_CPU             0
+#define K230_RESET_TYPE_HW_AUTO_DONE    1
+#define K230_RESET_TYPE_SW_SET_DONE     2
+
+/* reset done bit */
+#define K230_RESET_DONE_BIT_SHIFT       7
+#define K230_RESET_DONE_BIT_MASK        0x00003F80
+
+/* reset assert&deassert bit */
+#define K230_RESET_ASSERT_BIT_SHIFT     0
+#define K230_RESET_ASSERT_BIT_MASK      0x0000007F
+
+/* cpu0 reset */
+#define K230_RESET_CPU0_REG_OFFSET          0x4
+#define K230_RESET_CPU0_TYPE                K230_RESET_TYPE_CPU
+#define K230_RESET_CPU0_DONE_BIT            12
+#define K230_RESET_CPU0_ASSERT_BIT          0
+
+/* cpu1 reset */
+#define K230_RESET_CPU1_REG_OFFSET          0xc
+#define K230_RESET_CPU1_TYPE                K230_RESET_TYPE_CPU
+#define K230_RESET_CPU1_DONE_BIT            12
+#define K230_RESET_CPU1_ASSERT_BIT          0
+
+/* ai reset */
+#define K230_RESET_AI_REG_OFFSET            0x14
+#define K230_RESET_AI_TYPE                  K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_AI_DONE_BIT              31
+#define K230_RESET_AI_ASSERT_BIT            0
+
+/* vpu reset */
+#define K230_RESET_VPU_REG_OFFSET           0x1c
+#define K230_RESET_VPU_TYPE                 K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_VPU_DONE_BIT             31
+#define K230_RESET_VPU_ASSERT_BIT           0
+
+/* hs reset */
+#define K230_RESET_HS_REG_OFFSET            0x2c
+#define K230_RESET_HS_TYPE                  K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_HS_DONE_BIT              4
+#define K230_RESET_HS_ASSERT_BIT            0
+
+/* hs ahb reset */
+#define K230_RESET_HS_AHB_REG_OFFSET        0x2c
+#define K230_RESET_HS_AHB_TYPE              K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_HS_AHB_DONE_BIT          5
+#define K230_RESET_HS_AHB_ASSERT_BIT        1
+
+/* sdio0 reset */
+#define K230_RESET_SDIO0_REG_OFFSET         0x34
+#define K230_RESET_SDIO0_TYPE               K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_SDIO0_DONE_BIT           28
+#define K230_RESET_SDIO0_ASSERT_BIT         0
+
+/* sdio1 reset */
+#define K230_RESET_SDIO1_REG_OFFSET         0x34
+#define K230_RESET_SDIO1_TYPE               K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_SDIO1_DONE_BIT           29
+#define K230_RESET_SDIO1_ASSERT_BIT         1
+
+/* sdio axi reset */
+#define K230_RESET_SDIO_AXI_REG_OFFSET      0x34
+#define K230_RESET_SDIO_AXI_TYPE            K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_SDIO_AXI_DONE_BIT        30
+#define K230_RESET_SDIO_AXI_ASSERT_BIT      2
+
+/* usb0 reset */
+#define K230_RESET_USB0_REG_OFFSET          0x3c
+#define K230_RESET_USB0_TYPE                K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_USB0_DONE_BIT            28
+#define K230_RESET_USB0_ASSERT_BIT          0
+
+/* usb1 reset */
+#define K230_RESET_USB1_REG_OFFSET          0x3c
+#define K230_RESET_USB1_TYPE                K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_USB1_DONE_BIT            29
+#define K230_RESET_USB1_ASSERT_BIT          1
+
+/* usb0 ahb reset */
+#define K230_RESET_USB0_AHB_REG_OFFSET      0x3c
+#define K230_RESET_USB0_AHB_TYPE            K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_USB0_AHB_DONE_BIT        30
+#define K230_RESET_USB0_AHB_ASSERT_BIT      0
+
+/* usb1 ahb reset */
+#define K230_RESET_USB1_AHB_REG_OFFSET      0x3c
+#define K230_RESET_USB1_AHB_TYPE            K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_USB1_AHB_DONE_BIT        31
+#define K230_RESET_USB1_AHB_ASSERT_BIT      1
+
+/* spi0 reset */
+#define K230_RESET_SPI0_REG_OFFSET          0x44
+#define K230_RESET_SPI0_TYPE                K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_SPI0_DONE_BIT            28
+#define K230_RESET_SPI0_ASSERT_BIT          0
+
+/* spi1 reset */
+#define K230_RESET_SPI1_REG_OFFSET          0x44
+#define K230_RESET_SPI1_TYPE                K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_SPI1_DONE_BIT            29
+#define K230_RESET_SPI1_ASSERT_BIT          1
+
+/* spi2 reset */
+#define K230_RESET_SPI2_REG_OFFSET          0x44
+#define K230_RESET_SPI2_TYPE                K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_SPI2_DONE_BIT            30
+#define K230_RESET_SPI2_ASSERT_BIT          2
+
+/* sec reset */
+#define K230_RESET_SEC_REG_OFFSET           0x4c
+#define K230_RESET_SEC_TYPE                 K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_SEC_DONE_BIT             31
+#define K230_RESET_SEC_ASSERT_BIT           0
+
+/* pdma reset */
+#define K230_RESET_PDMA_REG_OFFSET          0x54
+#define K230_RESET_PDMA_TYPE                K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_PDMA_DONE_BIT            28
+#define K230_RESET_PDMA_ASSERT_BIT          0
+
+/* sdma reset */
+#define K230_RESET_SDMA_REG_OFFSET          0x54
+#define K230_RESET_SDMA_TYPE                K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_SDMA_DONE_BIT            29
+#define K230_RESET_SDMA_ASSERT_BIT          1
+
+/* decompress reset */
+#define K230_RESET_DECOMPRESS_REG_OFFSET    0x5c
+#define K230_RESET_DECOMPRESS_TYPE          K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_DECOMPRESS_DONE_BIT      31
+#define K230_RESET_DECOMPRESS_ASSERT_BIT    0
+
+/* sram reset */
+#define K230_RESET_SRAM_REG_OFFSET          0x64
+#define K230_RESET_SRAM_TYPE                K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_SRAM_DONE_BIT            28
+#define K230_RESET_SRAM_ASSERT_BIT          0
+
+/* shrm axim reset */
+#define K230_RESET_SHRM_AXIM_REG_OFFSET     0x64
+#define K230_RESET_SHRM_AXIM_TYPE           K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_SHRM_AXIM_DONE_BIT       30
+#define K230_RESET_SHRM_AXIM_ASSERT_BIT     2
+
+/* shrm axis reset */
+#define K230_RESET_SHRM_AXIS_REG_OFFSET     0x64
+#define K230_RESET_SHRM_AXIS_TYPE           K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_SHRM_AXIS_DONE_BIT       31
+#define K230_RESET_SHRM_AXIS_ASSERT_BIT     3
+
+/* nonai2d reset */
+#define K230_RESET_NONAI2D_REG_OFFSET       0x6c
+#define K230_RESET_NONAI2D_TYPE             K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_NONAI2D_DONE_BIT         31
+#define K230_RESET_NONAI2D_ASSERT_BIT       0
+
+/* ddr controller reset */
+#define K230_RESET_MCTL_REG_OFFSET          0x74
+#define K230_RESET_MCTL_TYPE                K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_MCTL_DONE_BIT            31
+#define K230_RESET_MCTL_ASSERT_BIT          0
+
+/* isp reset */
+#define K230_RESET_ISP_REG_OFFSET           0x80
+#define K230_RESET_ISP_TYPE                 K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_ISP_DONE_BIT             29
+#define K230_RESET_ISP_ASSERT_BIT           6
+
+/* isp dw reset */
+#define K230_RESET_ISP_DW_REG_OFFSET        0x80
+#define K230_RESET_ISP_DW_TYPE              K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_ISP_DW_DONE_BIT          28
+#define K230_RESET_ISP_DW_ASSERT_BIT        5
+
+/* dpu reset */
+#define K230_RESET_DPU_REG_OFFSET           0x88
+#define K230_RESET_DPU_TYPE                 K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_DPU_DONE_BIT             31
+#define K230_RESET_DPU_ASSERT_BIT           0
+
+/* disp reset */
+#define K230_RESET_DISP_REG_OFFSET          0x90
+#define K230_RESET_DISP_TYPE                K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_DISP_DONE_BIT            31
+#define K230_RESET_DISP_ASSERT_BIT          0
+
+/* gpu reset */
+#define K230_RESET_V2P5D_REG_OFFSET         0x98
+#define K230_RESET_V2P5D_TYPE               K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_V2P5D_DONE_BIT           31
+#define K230_RESET_V2P5D_ASSERT_BIT         0
+
+/* audio reset */
+#define K230_RESET_AUDIO_REG_OFFSET         0xa4
+#define K230_RESET_AUDIO_TYPE               K230_RESET_TYPE_HW_AUTO_DONE
+#define K230_RESET_AUDIO_DONE_BIT           31
+#define K230_RESET_AUDIO_ASSERT_BIT         0
+
+/*--------------------software assert and deassert-------------------*/
+/* timer0 reset */
+#define K230_RESET_TIMER0_REG_OFFSET        0x20
+#define K230_RESET_TIMER0_TYPE              K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_TIMER0_DONE_BIT          0                   //NOT USED
+#define K230_RESET_TIMER0_ASSERT_BIT        0
+
+/* timer1 reset */
+#define K230_RESET_TIMER1_REG_OFFSET        0x20
+#define K230_RESET_TIMER1_TYPE              K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_TIMER1_DONE_BIT          0                   //NOT USED
+#define K230_RESET_TIMER1_ASSERT_BIT        1
+
+/* timer2 reset */
+#define K230_RESET_TIMER2_REG_OFFSET        0x20
+#define K230_RESET_TIMER2_TYPE              K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_TIMER2_DONE_BIT          0                   //NOT USED
+#define K230_RESET_TIMER2_ASSERT_BIT        2
+
+/* timer3 reset */
+#define K230_RESET_TIMER3_REG_OFFSET        0x20
+#define K230_RESET_TIMER3_TYPE              K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_TIMER3_DONE_BIT          0                   //NOT USED
+#define K230_RESET_TIMER3_ASSERT_BIT        3
+
+/* timer4 reset */
+#define K230_RESET_TIMER4_REG_OFFSET        0x20
+#define K230_RESET_TIMER4_TYPE              K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_TIMER4_DONE_BIT          0                   //NOT USED
+#define K230_RESET_TIMER4_ASSERT_BIT        4
+
+/* timer5 reset */
+#define K230_RESET_TIMER5_REG_OFFSET        0x20
+#define K230_RESET_TIMER5_TYPE              K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_TIMER5_DONE_BIT          0                   //NOT USED
+#define K230_RESET_TIMER5_ASSERT_BIT        5
+
+/* timer apb reset */
+#define K230_RESET_TIMER_APB_REG_OFFSET     0x20
+#define K230_RESET_TIMER_APB_TYPE           K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_TIMER_APB_DONE_BIT       0                   //NOT USED
+#define K230_RESET_TIMER_APB_ASSERT_BIT     6
+
+/* hdi reset */
+#define K230_RESET_HDI_REG_OFFSET           0x20
+#define K230_RESET_HDI_TYPE                 K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_HDI_DONE_BIT             0                   //NOT USED
+#define K230_RESET_HDI_ASSERT_BIT           7
+
+/* wdt0 reset */
+#define K230_RESET_WDT0_REG_OFFSET          0x20
+#define K230_RESET_WDT0_TYPE                K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_WDT0_DONE_BIT            0                   //NOT USED
+#define K230_RESET_WDT0_ASSERT_BIT          12
+
+/* wdt1 reset */
+#define K230_RESET_WDT1_REG_OFFSET          0x20
+#define K230_RESET_WDT1_TYPE                K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_WDT1_DONE_BIT            0                   //NOT USED
+#define K230_RESET_WDT1_ASSERT_BIT          13
+
+/* wdt0 apb reset */
+#define K230_RESET_WDT0_APB_REG_OFFSET      0x20
+#define K230_RESET_WDT0_APB_TYPE            K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_WDT0_APB_DONE_BIT        0                   //NOT USED
+#define K230_RESET_WDT0_APB_ASSERT_BIT      14
+
+/* wdt1 apb reset */
+#define K230_RESET_WDT1_APB_REG_OFFSET      0x20
+#define K230_RESET_WDT1_APB_TYPE            K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_WDT1_APB_DONE_BIT        0                   //NOT USED
+#define K230_RESET_WDT1_APB_ASSERT_BIT      15
+
+/* temper sensor apb reset */
+#define K230_RESET_TS_APB_REG_OFFSET        0x20
+#define K230_RESET_TS_APB_TYPE              K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_TS_APB_DONE_BIT          0                   //NOT USED
+#define K230_RESET_TS_APB_ASSERT_BIT        16
+
+/* mailbox reset */
+#define K230_RESET_MAILBOX_REG_OFFSET       0x20
+#define K230_RESET_MAILBOX_TYPE             K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_MAILBOX_DONE_BIT         0                   //NOT USED
+#define K230_RESET_MAILBOX_ASSERT_BIT       17
+
+/* system timer counter reset */
+#define K230_RESET_STC_REG_OFFSET           0x20
+#define K230_RESET_STC_TYPE                 K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_STC_DONE_BIT             0                   //NOT USED
+#define K230_RESET_STC_ASSERT_BIT           18
+
+/* pmu reset */
+#define K230_RESET_PMU_REG_OFFSET           0x20
+#define K230_RESET_PMU_TYPE                 K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_PMU_DONE_BIT             0                   //NOT USED
+#define K230_RESET_PMU_ASSERT_BIT           19
+
+/* ls apb reset */
+#define K230_RESET_LS_APB_REG_OFFSET        0x24
+#define K230_RESET_LS_APB_TYPE              K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_LS_APB_DONE_BIT          0                   //NOT USED
+#define K230_RESET_LS_APB_ASSERT_BIT        0
+
+/* uart0 reset */
+#define K230_RESET_UART0_REG_OFFSET         0x24
+#define K230_RESET_UART0_TYPE               K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_UART0_DONE_BIT           0                   //NOT USED
+#define K230_RESET_UART0_ASSERT_BIT         1
+
+/* uart1 reset */
+#define K230_RESET_UART1_REG_OFFSET         0x24
+#define K230_RESET_UART1_TYPE               K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_UART1_DONE_BIT           0                   //NOT USED
+#define K230_RESET_UART1_ASSERT_BIT         2
+
+/* uart2 reset */
+#define K230_RESET_UART2_REG_OFFSET         0x24
+#define K230_RESET_UART2_TYPE               K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_UART2_DONE_BIT           0                   //NOT USED
+#define K230_RESET_UART2_ASSERT_BIT         3
+
+/* uart3 reset */
+#define K230_RESET_UART3_REG_OFFSET         0x24
+#define K230_RESET_UART3_TYPE               K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_UART3_DONE_BIT           0                   //NOT USED
+#define K230_RESET_UART3_ASSERT_BIT         4
+
+/* uart4 reset */
+#define K230_RESET_UART4_REG_OFFSET         0x24
+#define K230_RESET_UART4_TYPE               K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_UART4_DONE_BIT           0                   //NOT USED
+#define K230_RESET_UART4_ASSERT_BIT         5
+
+/* i2c0 reset */
+#define K230_RESET_I2C0_REG_OFFSET          0x24
+#define K230_RESET_I2C0_TYPE                K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_I2C0_DONE_BIT            0                   //NOT USED
+#define K230_RESET_I2C0_ASSERT_BIT          6
+
+/* i2c1 reset */
+#define K230_RESET_I2C1_REG_OFFSET          0x24
+#define K230_RESET_I2C1_TYPE                K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_I2C1_DONE_BIT            0                   //NOT USED
+#define K230_RESET_I2C1_ASSERT_BIT          7
+
+/* i2c2 reset */
+#define K230_RESET_I2C2_REG_OFFSET          0x24
+#define K230_RESET_I2C2_TYPE                K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_I2C2_DONE_BIT            0                   //NOT USED
+#define K230_RESET_I2C2_ASSERT_BIT          8
+
+/* i2c3 reset */
+#define K230_RESET_I2C3_REG_OFFSET          0x24
+#define K230_RESET_I2C3_TYPE                K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_I2C3_DONE_BIT            0                   //NOT USED
+#define K230_RESET_I2C3_ASSERT_BIT          9
+
+/* i2c4 reset */
+#define K230_RESET_I2C4_REG_OFFSET          0x24
+#define K230_RESET_I2C4_TYPE                K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_I2C4_DONE_BIT            0                   //NOT USED
+#define K230_RESET_I2C4_ASSERT_BIT          10
+
+/* jamlink0 apb reset */
+#define K230_RESET_JAMLINK0_APB_REG_OFFSET  0x24
+#define K230_RESET_JAMLINK0_APB_TYPE        K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_JAMLINK0_APB_DONE_BIT    0                   //NOT USED
+#define K230_RESET_JAMLINK0_APB_ASSERT_BIT  11
+
+/* jamlink1 apb reset */
+#define K230_RESET_JAMLINK1_APB_REG_OFFSET  0x24
+#define K230_RESET_JAMLINK1_APB_TYPE        K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_JAMLINK1_APB_DONE_BIT    0                   //NOT USED
+#define K230_RESET_JAMLINK1_APB_ASSERT_BIT  12
+
+/* jamlink2 apb reset */
+#define K230_RESET_JAMLINK2_APB_REG_OFFSET  0x24
+#define K230_RESET_JAMLINK2_APB_TYPE        K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_JAMLINK2_APB_DONE_BIT    0                   //NOT USED
+#define K230_RESET_JAMLINK2_APB_ASSERT_BIT  13
+
+/* jamlink3 apb reset */
+#define K230_RESET_JAMLINK3_APB_REG_OFFSET  0x24
+#define K230_RESET_JAMLINK3_APB_TYPE        K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_JAMLINK3_APB_DONE_BIT    0                   //NOT USED
+#define K230_RESET_JAMLINK3_APB_ASSERT_BIT  14
+
+/* codec apb reset */
+#define K230_RESET_CODEC_APB_REG_OFFSET     0x24
+#define K230_RESET_CODEC_APB_TYPE           K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_CODEC_APB_DONE_BIT       0                   //NOT USED
+#define K230_RESET_CODEC_APB_ASSERT_BIT     17
+
+/* gpio db reset */
+#define K230_RESET_GPIO_DB_REG_OFFSET       0x24
+#define K230_RESET_GPIO_DB_TYPE             K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_GPIO_DB_DONE_BIT         0                   //NOT USED
+#define K230_RESET_GPIO_DB_ASSERT_BIT       18
+
+/* gpio apb reset */
+#define K230_RESET_GPIO_APB_REG_OFFSET      0x24
+#define K230_RESET_GPIO_APB_TYPE            K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_GPIO_APB_DONE_BIT        0                   //NOT USED
+#define K230_RESET_GPIO_APB_ASSERT_BIT      19
+
+/* adc reset */
+#define K230_RESET_ADC_REG_OFFSET           0x24
+#define K230_RESET_ADC_TYPE                 K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_ADC_DONE_BIT             0                   //NOT USED
+#define K230_RESET_ADC_ASSERT_BIT           20
+
+/* adc apb reset */
+#define K230_RESET_ADC_APB_REG_OFFSET       0x24
+#define K230_RESET_ADC_APB_TYPE             K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_ADC_APB_DONE_BIT         0                   //NOT USED
+#define K230_RESET_ADC_APB_ASSERT_BIT       21
+
+/* pwm apb reset */
+#define K230_RESET_PWM_APB_REG_OFFSET       0x24
+#define K230_RESET_PWM_APB_TYPE             K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_PWM_APB_DONE_BIT         0                   //NOT USED
+#define K230_RESET_PWM_APB_ASSERT_BIT       22
+
+/* cpu0 flush reset */
+#define K230_RESET_CPU0_FLUSH_REG_OFFSET    0x4
+#define K230_RESET_CPU0_FLUSH_TYPE          K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_CPU0_FLUSH_DONE_BIT      0  //need review
+#define K230_RESET_CPU0_FLUSH_ASSERT_BIT    4
+
+/* cpu1 flush reset */
+#define K230_RESET_CPU1_FLUSH_REG_OFFSET    0xc
+#define K230_RESET_CPU1_FLUSH_TYPE          K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_CPU1_FLUSH_DONE_BIT      0  //need review
+#define K230_RESET_CPU1_FLUSH_ASSERT_BIT    4
+
+/* shrm apb reset */
+#define K230_RESET_SHRM_APB_REG_OFFSET      0x64
+#define K230_RESET_SHRM_APB_TYPE            K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_SHRM_APB_DONE_BIT        0  //need review
+#define K230_RESET_SHRM_APB_ASSERT_BIT      1
+
+/* csi0 apb reset */
+#define K230_RESET_CSI0_REG_OFFSET          0x80
+#define K230_RESET_CSI0_TYPE                K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_CSI0_DONE_BIT            0  //need review
+#define K230_RESET_CSI0_ASSERT_BIT          0
+
+/* csi1 apb reset */
+#define K230_RESET_CSI1_REG_OFFSET          0x80
+#define K230_RESET_CSI1_TYPE                K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_CSI1_DONE_BIT            0  //need review
+#define K230_RESET_CSI1_ASSERT_BIT          1
+
+/* csi2 apb reset */
+#define K230_RESET_CSI2_REG_OFFSET          0x80
+#define K230_RESET_CSI2_TYPE                K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_CSI2_DONE_BIT            0  //need review
+#define K230_RESET_CSI2_ASSERT_BIT          2
+
+/* csi dphy apb reset */
+#define K230_RESET_CSI_DPHY_REG_OFFSET      0x80
+#define K230_RESET_CSI_DPHY_TYPE            K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_CSI_DPHY_DONE_BIT        0  //need review
+#define K230_RESET_CSI_DPHY_ASSERT_BIT      3
+
+/* vi ahb reset */
+#define K230_RESET_ISP_AHB_REG_OFFSET       0x80
+#define K230_RESET_ISP_AHB_TYPE             K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_ISP_AHB_DONE_BIT         0  //need review
+#define K230_RESET_ISP_AHB_ASSERT_BIT       4
+
+/* sensor0 reset */
+#define K230_RESET_M0_REG_OFFSET            0x80
+#define K230_RESET_M0_TYPE                  K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_M0_DONE_BIT              0  //need review
+#define K230_RESET_M0_ASSERT_BIT            7
+
+/* sensor1 reset */
+#define K230_RESET_M1_REG_OFFSET            0x80
+#define K230_RESET_M1_TYPE                  K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_M1_DONE_BIT              0  //need review
+#define K230_RESET_M1_ASSERT_BIT            8
+
+/* sensor2 reset */
+#define K230_RESET_M2_REG_OFFSET            0x80
+#define K230_RESET_M2_TYPE                  K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_M2_DONE_BIT              0  //need review
+#define K230_RESET_M2_ASSERT_BIT            9
+
+/* spi2axi reset */
+#define K230_RESET_SPI2AXI_REG_OFFSET       0xa8
+#define K230_RESET_SPI2AXI_TYPE             K230_RESET_TYPE_SW_SET_DONE
+#define K230_RESET_SPI2AXI_DONE_BIT         0   //need review
+#define K230_RESET_SPI2AXI_ASSERT_BIT       0
+
+#endif
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
