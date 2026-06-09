Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C780CD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 19:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IG+itEvn0UVgMOh2CZIJSw/6gcH+/HNBOiXCKyNO9k0=; b=MgW+Kq/+sS1r7O
	sY2R2cLhjLc3Nem9RM7Q8+iGF2hjcaQ80NN+FUZnetStxGhlpyZqsGksCiPrvbPou2d5zViUS3vsi
	3NHYdoRXqIP2b8JNk4/4HUcqWVjK9JPOWlpyun6LhRp6qZ6lP2RDNCJmI6O/IZyqeS5FIpYGW4R5F
	uoO4m/SPYDRuySDR6mWMEtDOAzx16ELvdjKDZAKqDO5J3weQ5DJzryWm67PhpVaNjpPs4unJhCEsJ
	sFQXNDAKnO0uCD2os9gqZXyzcVu2VrdmFC3RawQTpPWqs5ZY6cdRYihtR5cYyk/bRxj4HUaqypdkC
	jqC1yw+lewS/pFHRdOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Q7-00000006JOr-1Ns2;
	Tue, 09 Jun 2026 19:47:31 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2Q4-00000006JNz-2Kjy
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 19:47:29 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c8629bed4e7so2048858a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 12:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781034448; x=1781639248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ai+yr6kaqjO1MjNvHgFNGMTR2U+5LiRo2MrcPACWJdo=;
        b=BAIUT4/4ILX7VOqeEZM4GyuB9E+wl8bBn3T4qpAKaXtH/ekXaA3N9ciGMbeVuxYdEk
         vTE7G11iZw3JM8UUt7SzxbGzmj7CpIh86Tm/4BDeREKN3fHvfX9EyG9keLkDocI3/rYY
         LhWDgErNlokr3cMYLUGMW8d6ySnjUDIek2ZhDtzws7vumz7ePhO+otW+VNF/1LzKd9GM
         szJV5TIdDFGK6Jiz1hso54RiCdt0gw8+72JZ5jQdmKjN0nok5xnCnT4vUXU1mhz0/HvY
         3Gq2brpM9oIKDtS7i8+4tnSGgKO5e8+9mHZOzcrlP/fVr1AugVa9KIiKTvBOwBeKdm7/
         x72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781034448; x=1781639248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ai+yr6kaqjO1MjNvHgFNGMTR2U+5LiRo2MrcPACWJdo=;
        b=OOkavQKq55ZsTaaZyMSUjlPubp1QnZWzD9fbx18e2ENt50BZCZZmNSPddZ/Fl7ekqy
         kUPwqIrgKge+MtIJPwLvE6DS8KP5/yQQk8ukkqzZfSulFSYHXybau2n62IYWOzFfwNce
         iz844pB1XManbdnVBGRDylJS4rblTs0qv2h80obXMmvNw5LgFasvD4xY6mVswKfaisHC
         7H3MnPY6pjDlDEre9x1kKVlC/rRLuHjaAaLixLV2pr6B4aOJVPkvi7CV7IcnHSyTiUak
         9Xh69QS3GP3DmBiZOPpvGMfIFvUqnUX/szSS0zV//T3Uj0cSztmPei7/Sxv/UHBuFE8f
         MwOg==
X-Forwarded-Encrypted: i=1; AFNElJ9VGFUIPKFgy1HUVOLc2Ua3gRRTXNQXloIENez/JI5NJOhDO8JIRrSmK/G77yn0EwNm1QTpeDjcKMdSMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmWSveEWMjeUppmdtZ0JLbaurUFvAfMPsVQbM82umFHumr+UpF
	czgzvQZSBaw33lJzy5wG+QfPHXzm2YZFohjtJfypfJkx6wmIpe35bNl3
X-Gm-Gg: Acq92OGLbKUflh+z5pIAdfIc5/R/61J7wT3OOZ7M9MPHzVo5UH6Rqu/9si6NDKLhTZF
	LEWBGUTiNc6HLXDEWG2KlHjfPCsV++druQJDcs3nkD0HO+DyGW1mo+RM2npQXpInc14rgVJF/Tf
	jWGW2JdSrbHvTooPMQTY1xp4lqllNokMx5DvitRguZ0rVt1z9ncf566vNfINMRptK0vlR6BPFzR
	lGoFEngbPIFnj60KISooX3yhEZHWwkCaIQrj2EgtvsZ3zhVzFJl6qWGMDzasyr/I8wvWgvf6j5Z
	qjt9vbHB/mivs91zCZFeXg3Zo5+zzmTHoICIumP4weDqkJDeHoEgn9JLD7BHg5yw0yq1AkhG2zo
	kaqgZ7FtfHozj08wpwb0JpDItHlh9aY0jxwgoQs3nsikJwktqb+gsHz1+bsvbYCzbWpXlcaz3RJ
	qsu0cE2c3q
X-Received: by 2002:a05:6a21:1b81:b0:3b4:84de:aa79 with SMTP id adf61e73a8af0-3b4cd09b4f5mr26397065637.44.1781034447703;
        Tue, 09 Jun 2026 12:47:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19517121a12.14.2026.06.09.12.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:47:27 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Tue, 09 Jun 2026 15:46:38 -0400
Subject: [PATCH v2 1/2] dt-bindings: dmaengine: Add SpacemiT K1 PDMA
 request numbers
MIME-Version: 1.0
Message-Id: <20260609-b4-k1-pdma-req-macros-v2-1-5d5d7b997b54@gmail.com>
References: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
In-Reply-To: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2445; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=EzzIUT5MAy1lGbLLNCNBDiXKEEHYTWLc2oHrRYIeMQA=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiyN3KO6peH6ogFrT3w3CXzGLPg+vUyi5MExqZDtnurBm
 vzsfG87SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCK/VBkZvhxyetYgV7N7tez3
 I6qzLtu/sNNOjX8qquLUcUbj4P3D3owMi9eUpqentj1kePg61cHpZbJ18vWTvPtSTles5jmtHu3
 NBgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_124728_602571_5BBBD388 
X-CRM114-Status: GOOD (  11.27  )
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

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
V2: Drop the #dma-cells description change in spacemit,k1-pdma.yaml; the
    request numbers are hardware-fixed and unused by the driver.
---
 include/dt-bindings/dma/spacemit,k1-pdma.h | 56 ++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

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
