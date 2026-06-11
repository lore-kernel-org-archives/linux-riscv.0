Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CC8CD98CC
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 13:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eGbXir+7Vu/RbPWsrZAlYjKe63cPFyAvtJg8E2oye0U=; b=lW02WepJC12ZpT
	ut6T7DKbzHCElOyIySwlqMHaczoHbAouD6S1rlpGXF9bVbYXGhidyUQjyFuinfMV97+SE5tqV5g1B
	ACl4j5CiNjsF7NJk2AilE6yWwZ/9dM5x2vuMkB/IYain1bX9HUYkidohwZYceUI9bA4464goDn7NC
	c+V85lRz8T1SuwULIYMtqk8n9joF0HU97cIT+H0piJEnA/RyfRbDEVAClaMeE16B0unjEQseIO+jU
	hJAojzLrjMA2GFJsUxlc7tbx1+3rMHnEtFFDOxWXtJixrTaVoMTxrjuUZcymHne22b1b9seUgpJTs
	jgu1Y26UmpHY8jH1AOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfI3-00000009VT3-3SnP;
	Thu, 11 Jun 2026 13:17:47 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfI1-00000009VSX-0frp
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 13:17:46 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8423b08b293so3502154b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 06:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781183864; x=1781788664; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P/xQJbFkRRowzEJ+ZDzKMiiLUlhrEmEVF/BkBQLOp88=;
        b=eDT7j1R4L/TzdzNyHF7yNc8VMlToZjIFjIcbuSHWn81RcxE5Fa5oYVo91GNBzhchbM
         iWRsSxufMvrzJOknBNwlHHNq0FFBLwPCk57ltWIuCZdHXxgZjhKlb97bfuJXBQ/JRF2p
         AkxMPWX+ji7NAXK6JYQQkgjhdkxizxqdpKGQb7oqQuMZE1T+vXp4yqMQzuzyw2F5+FPj
         7GmfZZTJnMwAzVLFRiViGLhaGtn303TnQb35rCp73wew4sOm19KGOQ7wj8uuUXbVVIk4
         npHxIlyti9U1yrxM0ymRQpMAwCjRZ7wxIFLQl97bjjNnZPDvfjkdLPLAQH3uiGd2ZpV4
         i/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781183864; x=1781788664;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/xQJbFkRRowzEJ+ZDzKMiiLUlhrEmEVF/BkBQLOp88=;
        b=WvtUwiQA8VcPoKhkhF1kNmiR5HLFQY5sYUFABhrMMyk1EdOD0VBOXTX9aScpx9qaT0
         JinYSZSSURTG/nZvZdc07M/XZggdEFNKhDdrzYb8pesYSF4DeV+JlJ+YhuCA7lgd5y+D
         g2fvdQDfTBYBy4fVej56xwFSw4c2ABnBq3Q+y7uwWufvxF0FCAminGh3ByerpXeu/Q3+
         X54YS7gFbqXG188BJkOPbD8j8frXinnetUj2zUXAz70AG8Y4R4406LcTsT/SGwOBn6UB
         u/DgjrYPAFzGbpkPV2w+GYak0RlVo0XwiaZKQd5MzCLsiU4a98Vl1RhGbGZ6vndxpvAp
         ReNA==
X-Forwarded-Encrypted: i=1; AFNElJ/viJ2genXaVtspQnigPSK3GTuLvmUAGobZA/qyNCqB5oFT2Pk1QwaA/le8hF1K7i9sq66ryXZgBGAatA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZzjXT5JM6wqBYK2Hi+lw1strw+QLFNc889Nt20Vmg5ak2TFpL
	yxqNDg4iFTIicJosGCrQ9UDqKGnldXR7Ja624xXbK52hXGGglEGWusq/
X-Gm-Gg: Acq92OEoqAh71GXASMVi4Jo1mptJXkv4/dd7ZMijnmNxRQigNaeaOW7tFZuE5/6Wukm
	/NS4xGLFm/IhKqLYDAwNRSGmZL2hhnVs1YlvQOPL+OFHj8po0heACuGWH9n6sCvZg2I3D1T7hKi
	oQP8dGaHJj1X5yxeoeOytkaaViS+sC7PVb+aSikXmPjC4vWQ7sTInBT7Hd+qRZLBg25wn46MFTt
	NiWGWUsR3ajBIKvHd4FxYbqE6UNjikmaY6KM5kR193+TCM1QceY6Fys0nfKYf4qO/Gt7aMR/jGo
	canQyYQAbXHf+kJYGNriZJdVt0i52RY4GYS+ThAg8IwdRWbYuFYCqy7KA1+BgN1l7zdkMHBXhuN
	mn1s1OunXzc2QCWXSd2bBiyHinObitkvgJ8u9BLoxR4mBKuOXFrAZXTju6UQokSRzOMUYj2W4i8
	9atDdxZ/Vf
X-Received: by 2002:a05:6a00:9517:b0:842:33f3:da68 with SMTP id d2e1a72fcca58-8433679e608mr3293724b3a.8.1781183863777;
        Thu, 11 Jun 2026 06:17:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843382e5caesm1986491b3a.44.2026.06.11.06.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 06:17:43 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 09:17:28 -0400
Subject: [PATCH v3] riscv: dts: spacemit: Use symbolic PDMA request numbers
 on K1
MIME-Version: 1.0
Message-Id: <20260611-b4-k1-pdma-req-macros-v3-1-ae8416052571@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGe1KmoC/4WNTQ6CMBgFr0K69jNtoa248h7GRf+AqgVskWgId
 5fiho1xOcl7MxOKNjgb0TGbULCji65rF8h3GdKNbGsLziyMKKYccyxAFXAj0BsvIdgHeKlDF+F
 gqOAGE8pNhZZvH2zlXqv3fPlyfKqr1UOSpUXj4tCF9xoeSdr9a4wEMDBFZV4yhrHQp9pLd9/rz
 qPUGOnWUv6y0GQxzAhVlkKxYmuZ5/kDFDYsGBIBAAA=
X-Change-ID: 20260607-b4-k1-pdma-req-macros-8d276d0126df
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4245; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=ioxeCNvToivxf1SJbAe6EIhY0aEComaoX+8RNwBtunE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiytrbnvZJce2757oSbnnvVLs9gtdA5sj2HeuHBP9bul/
 NbcJsdmdpSyMIhxMciKKbIcPtqSvfWVT7Tvc84fMHNYmUCGMHBxCsBE6tIY/kfE/V+SIxx451+e
 5NKwM/kq3b3dLoKG8+eunnZRuPvuP32G/3lXSuROr9onNc390cECnuzV5S68Jt0vp72MnP1EQen
 wDQ4A
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_061745_207362_488AD983 
X-CRM114-Status: GOOD (  15.32  )
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

Add a local DTS header, k1-pdma.h, that gives symbolic names to the K1
PDMA request numbers. These request numbers are hardware-fixed; their
allocation can be found in K1 manual.

Replace the hard-coded numbers in the SPI3 "dmas" property with the
K1_PDMA_SPI3_RX/TX macros.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
Add a local DTS header naming the K1 PDMA request lines and convert the
current user (the K1 SPI3 node) to the new K1_PDMA_* macros. The request
numbers come from the SpacemiT K1 User Manual [1], Chapter 9.4.3 DMA
Connectivity & Assignments.

[1]: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md

Changes in v3:
- Move the request-number macros from include/dt-bindings/dma/ to a local
  DTS header arch/riscv/boot/dts/spacemit/k1-pdma.h (Conor).
- Squash the header and its user into a single patch.
- Link to v2: https://patch.msgid.link/20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com

Changes in v2:
- Drop the #dma-cells description change in spacemit,k1-pdma.yaml; the request
  numbers are hardware-fixed and unused by the driver (Conor)
- Link to v1: https://patch.msgid.link/20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com

BR,
Guodong Xu
---
 arch/riscv/boot/dts/spacemit/k1-pdma.h | 56 ++++++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi   |  4 ++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pdma.h b/arch/riscv/boot/dts/spacemit/k1-pdma.h
new file mode 100644
index 0000000000000..65112d5847add
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pdma.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides DMA request number for non-secure peripherals of
+ * SpacemiT K1 PDMA.
+ *
+ * Copyright (c) 2026 Guodong Xu <docular.xu@gmail.com>
+ */
+
+#ifndef _DTS_SPACEMIT_K1_PDMA_H
+#define _DTS_SPACEMIT_K1_PDMA_H
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
+#endif /* _DTS_SPACEMIT_K1_PDMA_H */
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 08a0f28d011fe..7d414e15d2cc2 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -6,6 +6,8 @@
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 #include <dt-bindings/phy/phy.h>
 
+#include "k1-pdma.h"
+
 /dts-v1/;
 / {
 	#address-cells = <2>;
@@ -1094,7 +1096,7 @@ spi3: spi@d401c000 {
 				clock-names = "core", "bus";
 				resets = <&syscon_apbc RESET_SSP3>;
 				interrupts = <55>;
-				dmas = <&pdma 20>, <&pdma 19>;
+				dmas = <&pdma K1_PDMA_SPI3_RX>, <&pdma K1_PDMA_SPI3_TX>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};

---
base-commit: 793cc54475b49b5b558902b5c13e4bfe66530a50
change-id: 20260607-b4-k1-pdma-req-macros-8d276d0126df

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
