Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7090CD98E4
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 05:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I1OxwOTrs7+ELijp1viPF1xYyz5kQA9oFCEuUEWbKPk=; b=N0mhvdOvzynw7v
	xfvPEPxJpCYfgDDVdi7APmVgjmlFS0yyhHX90KByNn7Oy3HuseNEci8HbNBpZcvrOGapEyzoNCs7x
	Igk//DrZqB4lLYG29WJDHPynOBOM+QfrzYHr1r6HxduKhrEUPoA1kgelL/arDYmTpRt8OViAUHBsr
	2JRmEJ5TQCFFx21P6f0q+1/GJqmyH9H83g811PzTPHjc+9ImhkZNSNf6PDg5/T9tn56/LFPyY++Bt
	5n1+9j1hlS42KmvcoZnzy/euC1nW7MPXz5FwfVgGbYARKn253Rh4uImEs4dUv9m3dqz3iAkfE77gg
	WseI9bDE48q4ZFjV6SBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wanwE-00000003AZ0-1Zpu;
	Sat, 20 Jun 2026 05:08:14 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wanwB-00000003AYW-0Ydy
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 05:08:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c6bc87f4d5so10825445ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jun 2026 22:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781932089; x=1782536889; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wTkwWAeY0fntOQ2aGm5ZI6wJA7Nh3ySr51xxoVIYuRM=;
        b=eQ1+67o7wvIIu/1K6jgPiBgp30X4QDEY5DbzkYv0MnL/1Llrif8BWWgPKMMgzYuTOh
         860G0tj+7RkmxtQx5fvqDbbmPUaVV62C3EnenmYAcW0+zhkb3CJTk8BdBAPIo9c5/XIA
         YF8WbuYpQ2/lpIZ/gX5YjaLvnYv7XWHfdA3c1d6la7keIzTsIyh/3ldIcicXaxVR8mHb
         G2+dJjn1x8uqfPyLPrGumzlb7X/zQDgsoB0Y5F5d9fIDJpkwvZBdW5E9qUthV/+2v/4G
         QyFpTHu5LKEz/BzC8uBgCTJx37MgfAeO5csZgc61mBKsrJofcr3L8XF+YGHM1b46ElRy
         dQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781932089; x=1782536889;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTkwWAeY0fntOQ2aGm5ZI6wJA7Nh3ySr51xxoVIYuRM=;
        b=L97p7yw8BtHiRm0dlIMPnZPr76TX6Zbv9DGIT1E0SmK+Wgfv8aeEvULpSBeJBnM04O
         2BDAmJtvPtuLR6vBNTC0lCUx47fgp6HmrpN3bcIY8xnmGHHprV1LM6KVyC4BNATYMuov
         K6na2t+9k/lEnE6iAIkTUSNtyNH0jNDoB0+m7umXUssOYife3Cl7E8Ud4F4VHhnbZzKU
         Dp/vO0RuFZRj8OnGHBqC8rXzkzwGODsuu1/pFgcc721a9cUGphi+Zt9ECy/wKhRE6UUM
         KOBREZ3bzfeeTidnHANb+1wkq3UIadxpQ7pqvrNT5IKWaLxHapt/zHVzWkkel4utM7ZT
         8utg==
X-Forwarded-Encrypted: i=1; AFNElJ9LZ9OnV/LsJIwELFcAiqT3Xjm25tb6otB6stHns69xjvhSN5DdKybp8vPr0Ch4xpjeMyC5HNcOUQ7m2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz+MmdcXbIDGfghXr6umIVpufCOeBbU2urO46//0WnpxbBHEgu
	cgZwuYYH6RfduDzbZmJPi60fPlGgA9B1/HPfkm9pg1vWFdXvF5A7vlO9
X-Gm-Gg: AfdE7cky9oFIU0c2fBv7HlwgnSOEr+fLMYo4/97tqGrVtDbovVATNAw405gMCKZRVKl
	dneS2SIMvci/b9AZW9rgr9ohCXN+HFyCbGMzVCd6fxCM/qpV9kT3frkghkJChUrCj2SkVg5k/+I
	+5mcvlLv+zUnpQeBJx4DYjC5JO0wgrB2Js/CACJoiiQh03APpH35Yp/EOernfg7RcscRh+ONZhi
	QPaICVavqzwI/0YwsVuFRN4DHa1u095OcHPrqlaI63dfj8f26xPVGqL/JX/P8noWnIjskcvJ6c5
	5QhzbGXqIGze/M5DyZ6lO4CminNfQV3UvugddKI1DHMceiaWRpgAezlQBis15yTfxs74Lx8SN0o
	5iEeQD3ZdffNhBC+65AxabvLM4F3WCZ8QRdFJYobGz9Tj45gTn5N7Y44e5xziXso=
X-Received: by 2002:a17:902:fc46:b0:2c6:b768:a7de with SMTP id d9443c01a7336-2c7422c36f0mr20594985ad.8.1781932089122;
        Fri, 19 Jun 2026 22:08:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aad99sm12129435ad.80.2026.06.19.22.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 22:08:08 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Sat, 20 Jun 2026 01:07:48 -0400
Subject: [PATCH v4] riscv: dts: spacemit: Use symbolic PDMA request numbers
 on K1
MIME-Version: 1.0
Message-Id: <20260620-b4-k1-pdma-req-macros-v4-1-3cf77d0bd0d6@gmail.com>
X-B4-Tracking: v=1; b=H4sIACMgNmoC/4XNTQ6CMBQE4KuYrn2mr9AWXHkP46J/YFVEWyQaw
 t2luCEmxuUkM98MJLrgXSTb1UCC63307XUK+XpFzFFdawfeTpkwygQVVILO4Yxws42C4O7QKBP
 aCIVlUliKTNiKTNtbcJV/zu7+8MnxoU/OdAlLjaOPXRte83GPqffvo0egwDVTWck5pdLs6kb5y
 8a0DUkfPVsq5S+FJcVyK3VZSs3zbyVbKIi/lAwQlCtyFJQzLnGpjOP4BkmQwFxYAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4256; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=LepUJJTxmkYMO860gHHna5A2hsGG1CLcmny62OJUIqQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwzBe3D6clH19TUS7QZ6617bLAq/x530h2p6/JKE++55
 rhsFRDqKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIkIVDAy9Lz32CdTsoZBov/u
 2vvRyzcefjqV4V+CrIuhU+ezTNfrxxgZfpznzjtwQGH7tPeMLGG69y0rP3rPiPzfb3YzY4p2pec
 lLgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_220811_205327_60362AF3 
X-CRM114-Status: GOOD (  16.07  )
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

The PDMA request numbers (DRQ) are fixed values specific to the SoC from
a hardware perspective. The detailed definition can be found in K1 User
Manual [1], Chapter 9.4.3 DMA Connectivity & Assignments. Add a DTS
header file to define the symbolic names for the DRQs of non-secure DMA
peripherals.

Convert the K1 SPI3 node to these macros.

Link: https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/key_stone/k1/k1_docs/k1_usermanual/9.Top_System.md [1]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
Changes in v4:
- Rework the commit message (Yixun Lan).
- Trim the k1-pdma.h file comment (Yixun Lan).
- Link to v3: https://patch.msgid.link/20260611-b4-k1-pdma-req-macros-v3-1-ae8416052571@gmail.com

Changes in v3:
- Move the request-number macros from include/dt-bindings/dma/ to a local
  DTS header arch/riscv/boot/dts/spacemit/k1-pdma.h (Conor).
- Squash the header and its user into a single patch.
- Link to v2: https://patch.msgid.link/20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com

Changes in v2:
- Drop the #dma-cells description change in spacemit,k1-pdma.yaml; the request
  numbers are hardware-fixed and unused by the driver (Conor)
- Link to v1: https://patch.msgid.link/20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com
---
 arch/riscv/boot/dts/spacemit/k1-pdma.h | 56 ++++++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi   |  4 ++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pdma.h b/arch/riscv/boot/dts/spacemit/k1-pdma.h
new file mode 100644
index 0000000000000..7e5ad3d7111d4
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-pdma.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * DMA request number (DRQ) definitions for non-secure peripherals of
+ * the SpacemiT K1 PDMA.
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
