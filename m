Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13222CD8C9D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZrY99DPQmgcmp61ankN3Q4uB2WcN4olj0QpQALAhUw=; b=r42ymrcHwnHFYY
	ZLEix7JOXxEMeXXO4I3OdGnQMWKoZwn2P7d7mOHvLZaL889PZSmRu/vr2CKWfUK5i3hk1EnTym//V
	tmrPIbBmjNVWQvYJC3EYXFibwTep1itgPjXWszzyIgBdunkBvU6bVh3w57vBzL3ywdNx4I7CEiIsd
	c04AfPCPloJqqvManotSB+uWac9CtfzQTF0OS9DKcSOTwHVh99WY6agb/gA6PIsiUW23SXr5FvgvX
	ua0hLODGch76eAxwNbC80Z7knJiXajNjd0a2AxyP5r+wIYn2X52N/6ou//mPIopkU+bUVObBedFaB
	UgkHdgOcidxYdzQdPKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHXP-00000002N3J-0fqS;
	Sun, 07 Jun 2026 17:43:55 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHXM-00000002N2h-1X9o
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 17:43:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf20f6be6bso26596115ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jun 2026 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780854231; x=1781459031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzT+dLha/Dk9hG0MT19SMdgwaEdfoohDSe4reE53O0w=;
        b=c5tCQM42oxa6sZ03IQB0baC6l7WvAtb8rpGcRW83YLSPu/r3MxWgHbX+B012qPnCuz
         RDL1sYrS9RTWSLsPhFi387psv5D9tJO4HjYQpZ3JMmkIeDiJsj3cfqogPxEPNmM5rfFi
         6147vIX7yxaAaavDeZlOgj+bVYpTqSoYRpJpgPVyoy1bp1H9qzHA4XXkNcoG07Wj+Xja
         rK7J3IzKaRYt5a//WzFnxDwJ6yKjkk0eL7FG46MEiB/u/j09KdGOazn3l7rGQ7U1U3SN
         TmK9tnS/4lx0KEm8RM8FSTqMlFEER9rKngLBwk6MA8uO1hdmsOBA8MLKqPs9EWwGYFdA
         kdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780854231; x=1781459031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GzT+dLha/Dk9hG0MT19SMdgwaEdfoohDSe4reE53O0w=;
        b=B8GnokWKeMQggJ/Z6EENDqbL/R3WbsdvM1NJu69l54LRqXQiFelIH1+YEjAW1l9ZzN
         zZdlh3rLaQ4ogivJDWKHgqaL0jUy3sMDpo3L5ASuEFhjNsIHrjMknQKU3jN6wmg/TUMr
         LpmbcYpiwZa50seTKfLFc0NnM/Og5bRpOftKbxZTsKIfeFQuxzPbBwDTl7pkOm6ylMDu
         yXHmFsbQHVj85Q95CgGnDMlBOvFqpEnCI7Kor3BGjCCKX29m8rrlp06vWUcyjMRUANgA
         3LrLMJre8UhonVMsiNiYA2E94tJvX2ZWJz64EtBbAvNaJNRx6kq7MMmMb9N7JjNTKk+/
         EGVw==
X-Forwarded-Encrypted: i=1; AFNElJ/oW3O7ljAajlOhT5u+dpSYdm2PkM7Ha29mOGtvWanWy3tiNtfHSzsbf1JRyFoAuOL3FA+5aZ7W3/ry7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRIj9Zm42XifdNqpVlooDfqs4aStl0ViQ96as656RHLXm5/kgi
	JTj/dKJnn1YIAeu0964CHvZUYJVsb6uHu3hAWBKEcLCUQW82dCsycYue
X-Gm-Gg: Acq92OFPx18GF+8mlluy8iXF1avcu7wmk+g65/LbHmzlfX3xUICCw3v5FMsiciO5aY7
	rYkXWSbdUuKfEH1Bg8g886e40mqCVhpcZlbDm7xmhlfIVHX5xliM6l+clZsEIO3AgSdsBay7WrT
	hNKrwj5skhEJu/E+dXbge7irG5VmDDMlqOM/69eCDuA54xRpyFk2LG6V8wT1OrAP1aXVoGCEZ9O
	98rWctMEdyyO513+GXjIN9sez6kyLWSGRPdZmsa4Rlpvy/fj1huMi6I7zDUtJcNnmUTqPo8bgO8
	CmSAuukAm6CBDw5blh9D9JrCyzmkvZ/nyEtPLNOJmmxjfZXHLdMoiYGrYiYSLBhWZRtCE+Nk1AW
	LONLpQVIgCG/tTd2dYSGatMgnh7LkuEfDbw7KQDaGXIxyX6un4xIAVrawERncEs0jJikBJKHgCa
	AwKwRiW8/I
X-Received: by 2002:a17:902:ccc3:b0:2b4:59bf:5728 with SMTP id d9443c01a7336-2c1e80ec2abmr129153755ad.25.1780854231461;
        Sun, 07 Jun 2026 10:43:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::305d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ab01sm149171185ad.71.2026.06.07.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 10:43:51 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Sun, 07 Jun 2026 13:41:30 -0400
Subject: [PATCH 1/2] dt-bindings: dmaengine: Add SpacemiT K1 PDMA request
 numbers
MIME-Version: 1.0
Message-Id: <20260607-b4-k1-pdma-req-macros-v1-1-5b2a3955007c@gmail.com>
References: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
In-Reply-To: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3119; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=8mqihYrCWS2UpbQrM26fudrazKOvNiE04KKmAJLxu3k=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhizVtWdTW1yfxFrzbTj8v+HD9/re5c4dm+YL1VWyM394v
 235/rN7O0pZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiyVcZ/gr9LH/KsD5SIzhR
 VSN76qnbE0/9m/dQ/f025eVb/X+LzPrI8L/ycJbu80Rdq+M7bh+ub7z7zSd+91yToFnvJ+3or/H
 3s+IAAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_104352_559885_1C0FC7CA 
X-CRM114-Status: GOOD (  14.07  )
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

Add a dt-bindings header that gives symbolic names to the SpacemiT K1
PDMA request lines of the non-secure peripherals. Device trees can use
these K1_PDMA_* macros instead of magic numbers.

Point the spacemit,k1-pdma binding's #dma-cells description at the new
header.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 +-
 include/dt-bindings/dma/spacemit,k1-pdma.h         | 56 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
index ec06235baf5ca..0d4ac9849e27b 100644
--- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
@@ -35,7 +35,9 @@ properties:
   '#dma-cells':
     const: 1
     description:
-      The DMA request number for the peripheral device.
+      The single cell is the DMA request number for the peripheral device.
+      See <dt-bindings/dma/spacemit,k1-pdma.h> for the list of valid request
+      numbers.
 
 required:
   - compatible
diff --git a/include/dt-bindings/dma/spacemit,k1-pdma.h b/include/dt-bindings/dma/spacemit,k1-pdma.h
new file mode 100644
index 0000000000000..491976516550a
--- /dev/null
+++ b/include/dt-bindings/dma/spacemit,k1-pdma.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides DMA request number for non-secure peripherals of
+ * SpacemiT K1 PDMA.
+ *
+ * Copyright (c) 2026 Guodong Xu <docular.xu@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_
+#define _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_
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
+#endif /* _DT_BINDINGS_DMA_SPACEMIT_K1_PDMA_H_ */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
