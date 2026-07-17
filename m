Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE950C44523
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 14:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6AaHIjnLk93C2usqkBiuU2aWe0yc+QgRU+C7GnuUvc=; b=TKnGzoHZpXeEl7
	HXn+uYm0vvc1yIoP35dJpFcTVUO/OM1gMmRVPsYUoMHMDNvQsoI9sSGjt31L5YowbWYd44ABCx44z
	NSKjez7JL75Pjpw1YHxO5SP2d1RrV77/uxN1EXo14dC2bq/xLp6PVv21i3SPHHrqVIaG/Cf35vm3z
	CYN3hU+XNa+Y/ZRSVcbQCwqtuXY59TPsIXQY59H9yAIpE0tDekrOfInFxhYUgyyODgvu+wlF9hQU7
	XZDJ4hi3wqutC4BxMRN5KDU6eN8c3NXqcJYv4LoY2cTpum8IlKrVKNqKhQxW2VrNIQeKV/4G3M5ck
	mEQmTr78QoRalgUpJCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpi-00000002W2g-0ga0;
	Fri, 17 Jul 2026 14:46:34 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpf-00000002Vzj-1LKG
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:33 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84a2dcec51cso6788979b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 07:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299590; x=1784904390; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+70UsRe6SWCs8p1enxjrZeDqh6U8B/eywJS5RleoOQ=;
        b=EgOkRnu2u8YSQKUEtULKIyImuYCsZFa+DGXANEiIptkMykSqTH1wxfDuLU4DQjuFkL
         GZAgOBcsmWh0/QVdnGqU3aJ8unz0NyPGfc/vrSlMjKnjs3VyC+eZVpSIb6h1J2TfolzS
         qOei0VjT8S4c6Ka+KMovOij9hr7pMVT+Ms5B2/volCGr4kMvTJj7rPkm5uiXOj3/JF8l
         FFHD9N6QDjBFgx5K61gWsYs654AZ8nkC3KeuZ9Q/BivjcuH4F3HnQh7wo3OYvYjMdpqh
         xygrLCXQXH2x+eTwWKz9VQksoA/Lwd/ShEwa3fsIWxNY0Xdd9a/RcIu6yrObZbkVmC5h
         Riyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299590; x=1784904390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+70UsRe6SWCs8p1enxjrZeDqh6U8B/eywJS5RleoOQ=;
        b=c+8FlF4aXzBe+yIL3oy44qwnGMtPvAntM0IkhE+eyWEzSYn4aGRNED65Dvi+82pums
         nZEuNhNUt2icC/om0gzbQOaGq/mqxFBbZiZdLjHpZkHuOMGr9JeznfwgVmPfmiRkvyNM
         iGIyemJWc9EV4eVdU9nISSzBgiswiwvW63enkTwUPQQNZpHYpTdwWT14DeJvqL3cEVid
         35/S6jgy0GG08tiPQTvfHcZyHrAkccrVjAp9DqRo2pS4k5ZTUZB2KQfL6WIU1XPjNndc
         tV4YtP5zwwAPiN51Oc7VY98/sTWrhsl2B7DVZ+SJG68QXhmyHoL3Mco3+wnv50/XDOyU
         Z1wg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1nBhJzM1bWYdEXRq3rDXNiu3XezpDTZlGaYCXqOSp97f9jB4/T1uvQ0Hh4MiJjcQuQrxvlZhHWaKOew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZWTnW/9RZxWXx4sY5ZidvbFt/6gJEblCEpBQokpQkLUMrmPSE
	KX+5tZ+v0mI3KWkPWWH5VuhKKGsp6qXTyt6pZ1IeDbOYflV/8Il8BJ12
X-Gm-Gg: AfdE7clrzc+RUQptRKNQ+yWvwTts+CC6lFUK/is0INUaAkyM02ML2ZGRHpkGIkbjro9
	B6hoKW4VU69vwvsObwzGSyOWgZeCIWK0DUQEZW7nmpwM6WFAM0qumJaEDoYDyksrMOEtZCVXBmq
	hAWmSm/f5YOTXwrK9D2yNxoqwdDNUzfgNeIf8Uq7xQQqASJG3yWwBqlIGt9efZNdINifP1MxySP
	DqNflvLed6ePKXQ+Gh4sYM5PGfCyEDhjuKqH12qqdGGKhGXChtFEfu7Fnzn9NwYPUOFtr37oRLC
	K3m/fn/FQTqfORaBec48uwdrHZJSG5btnxxvO5b39qO2AZmZdTYUNWw6ptIcXV2Z8gEt5MIaSNq
	S8C6wYDkdDRnCCf48Spe//oc9XpRdk8cuboGIcIVdQFbflFeGWdIub1KFAmRnzFMDGE8hsQ+DUx
	t97w==
X-Received: by 2002:a05:6a00:420d:b0:837:e9cc:d474 with SMTP id d2e1a72fcca58-84c2923a653mr3262541b3a.2.1784299590120;
        Fri, 17 Jul 2026 07:46:30 -0700 (PDT)
Received: from [127.0.1.1] ([192.220.14.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6d519sm1166408b3a.40.2026.07.17.07.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:29 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Fri, 17 Jul 2026 07:45:25 -0700
Subject: [PATCH 1/4] riscv: dts: spacemit: add K3 PDMA request numbers
MIME-Version: 1.0
Message-Id: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-1-969a1b0f783f@gmail.com>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Zhengyu He <hezhy472013@gmail.com>, 
 wefu@redhat.com, liyeshan <yeshan.li@spacemit.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=Bvj9DyzO8CkDeYsF7QvGrDf4qFZaWq59anKSe1ahYuA=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqWkAvRC1PdSak0AmQY19oVbVQd4dwrxvtWN8Wr
 WzfboxWA6CJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalpALwAKCRDN9pw2gLgN
 2IIJD/9EPUVLcR51uLU+wJn2/P4pQprJeuvmAK6VF3BOBRxoDcVbiIvWKKabDJqEyN6eJReC+AS
 isiQEj98LKPh3dvjeJJ4WAdo1rg2H6MvNHfKKKjIHRgOkZO0MzCMiavxt+KqHLUF7XKCjH9P4Ka
 VPWzhrdJY4zlX9IafN3L5byPuuAmNGoME8Sq4SZnPEzI/ue6GJMRHDyA0TkCfM8LODW7uNIDVM3
 x/kcvYGb2Wp2OfKMvSiNTpt0dxMV90YGpzQp1ikI2qGDY4KnvlKvhcqgaIPS26V8kO5m5IsANan
 XUPJPNFA57N6Xz0locRXukBzzh4GUdXU5f+dz8v7ALmAzg9kR27SrLjpi8EfBqPEIPhUuBB+jKt
 KhtdkAxG7Eu0a2zuo7Il3M0pRTnBHqLQMuqLsZWW7aCy+88IRUn5cI+rEd5/4l7Pc90lXGIytQR
 Q1IFO3chMGmCg4IOXJaCF+6rm/E6oFdXCwGKR/0L7G6ZnOrHynSwGsuW8fLQLgrvDLjNJ3n09gb
 VqB2mNkvj585HTR5BUrjFvS4McUW1eZit1o5miF08MX4B+jtMRacb/qeRPsmtD/O0aHbozh88pr
 fLlpNxLss3fOFoobP6MmdH/wQqHfBI6HSLK4aK+bnDamsgeDdlO+UDaFp3mMSDZPNO9hIacAgMW
 23NVd2kekezmXjA==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074631_367966_BA4F4D90 
X-CRM114-Status: GOOD (  10.65  )
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

Add a local DTS header that gives symbolic names to the SpacemiT K3
PDMA request lines of the non-secure peripherals. Device trees can use
these K3_PDMA_* macros instead of hard-coded request numbers when wiring
a peripheral "dmas" property.

Signed-off-by: liyeshan <yeshan.li@spacemit.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pdma.h | 83 ++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pdma.h b/arch/riscv/boot/dts/spacemit/k3-pdma.h
new file mode 100644
index 000000000000..a5b723ad616a
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pdma.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * DMA request number (DRQ) definitions for non-secure peripherals of
+ * the SpacemiT K3 PDMA.
+ *
+ * Copyright (c) 2025 SpacemiT
+ * Copyright (c) 2026 Guodong Xu <docular.xu@gmail.com>
+ */
+
+#ifndef _DTS_SPACEMIT_K3_PDMA_H
+#define _DTS_SPACEMIT_K3_PDMA_H
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
+#endif /* _DTS_SPACEMIT_K3_PDMA_H */

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
