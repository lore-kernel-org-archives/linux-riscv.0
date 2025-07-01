Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DFFC83038
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 05:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCWhNXo1JGBEYYvGKB8kTdbB6QECN4Gyh7JQrYnIa0Y=; b=yZdP/IkwTEucMy
	ExQ62/EfbL5FRAScuS5B80mPk9GSIO+mluFOC20JbcrGXgxG0xFcY/PzIP2DnohkLlP0mQ2jKcMHV
	ACKf7W0UJ9FlvHC7vSX8Dbmhg522rXTlA9yz75pL3rl1sEljojMERjmNkGGYEaikGrucawmzgDpO8
	UpZKU0E/rmFC+ngkxn6v3dCwuT7wP3aSTJJfyukl5wXUBdSv7t6Ls5MjagCUqi9aSYcFmREtzTG7E
	K2u4k2C8OVbzIXL5IYeYXFK38jcAd+5uBNddyAIKwXip5hM2RiuSn2waUE48AkbEYRHh6d8DvMS1M
	H/XXIkJXg6XJnjKA6ciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTgg-000000043Jw-0u6t;
	Tue, 01 Jul 2025 05:37:46 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTgd-000000043Ii-397T
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 05:37:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-235d6de331fso35178005ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 22:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348263; x=1751953063; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8FP50QWAxhaRk638SaOf4ESK8SqYeIg7LMU7MbzlTw=;
        b=iAtwTbwARlwVlwxc2yzCq5RYDsqI/AC5mSFeBYYBA2TFy7n99V3ELlwYyf/pQ7Z/P4
         /fJ/MArpO2UWo1+FCPVXLi/F8PLbzKiPltU3mFHMfQ772QrFNSDWQekcjvaXsU/s+l5N
         Nm+sUo1kW8cv3oitsoBAUk8L58a/tnN31pMp0nKtXh0nFfOz1G0kUdQQ7VlHNeiWHk20
         isPdX5KvW81a1dTxlbxEHtSknLX5wX/SyhXZJ7RkV8cOt92Sw2+Raf8ijhoBFYM14dwF
         YgpT0r0XYGqD97VKlAFTqize4NsLABpYYxa0BnzGOqdNiPjgLLBe1qajmaIiQGcYPDCW
         rlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348263; x=1751953063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8FP50QWAxhaRk638SaOf4ESK8SqYeIg7LMU7MbzlTw=;
        b=IyDYA5bPijq8sHiI3SLyiD6wY/ZeBQl02jqIxdqRzVjEuHXF0NrSJL1Mf2ZOmK0T76
         KSb1iYfLKVUh+DBOJYxoiG5xVgLJdQTBdXzevJVDBeQ7G0wghkM34ldyqaugAWednZ8h
         uZq5n0RC9DQRBzy8Y+agMHEm6x04sxnKVuRzhmAIWR340JgKgMX5I2+6RynQ9pZpxEQA
         kqo7604IWR0MOo3EmRj1xqO+eXvXBlKP2U+VsKGP9TEfm1YdgCnAl+Pg777ZXHh94HYr
         aSCAjQCKdYb2aUQdm/puQUEp47MWDMoEX3K//xcWMLpTy6zqWt8nAnUTJvSft+Y+myZn
         sRWg==
X-Forwarded-Encrypted: i=1; AJvYcCV+LUhRoxQjdgqVCas9vLixASax/yk1EjlpiKTC3ilr9xp2cP1tnTRTNpmcWuQ+cLn+Vzu7upJWdxYHPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa+atoSVn6mF5dyJmFwUWUH8ZkI8+qf7TXEm7hfkubijWMyDye
	ZF9trL1GUQuNm5cjhbcgtviloQLIdi87H04MCGa6BIdZ2tid+pZgU1qP7Ol0lc9KYvRPw6rMnkW
	TI8ayQ7GJCXdt
X-Gm-Gg: ASbGncs+olpF6QZU65dHLUPFrpLB7FTfzS+N+t25hV/X0OHsQ71/LzxIL0xU+MGrY+6
	lXyOT+/SF1Ll0wi4fvUpiypPMQo8zrH0sFrxuYYHEs+MITDyW+85D2pRX6jlirYB/gjPgwaOhhr
	wNP40syc5ME5Vprpty/ZVdy+o0yImKhKQ5F6gaeTargjs4SOCoybVwoiqrD8NX2sIFztESZly5j
	bStpXjMBvc/Sfh0td7Sj6moyHuEGqVY8yeaBP20/eXSBwNMKXiXgj0zY/cshQ+WaJdEXBhPc5K/
	w0NEFYdL/kOjuGocCMwrWAcyDLTD0C4otAfEEaU=
X-Google-Smtp-Source: AGHT+IFdEG/r6gnSMZ5F+fn/H12Ii9bbpF2XMMeZ4mCGdFa4TwRSqSrBT/QNNdd/8YlLJFb2+ZPknQ==
X-Received: by 2002:a17:902:e94c:b0:234:f6ba:e689 with SMTP id d9443c01a7336-23ac46341eemr214284055ad.39.1751348262985;
        Mon, 30 Jun 2025 22:37:42 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:37:42 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:36:55 +0800
Subject: [PATCH v2 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT K1
 PDMA support
MIME-Version: 1.0
Message-Id: <20250701-working_dma_0701_v2-v2-1-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_223743_828308_EFB8BB39 
X-CRM114-Status: GOOD (  11.33  )
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

Add "spacemit,k1-pdma" compatible string to support SpacemiT K1 PDMA
controller. This variant requires:
- clocks: Clock controller for the DMA
- resets: Reset controller for the DMA

Also add explicit #dma-cells property definition with proper constraints:
- 2 cells for marvell,pdma-1.0 and spacemit,k1-pdma
    - (request number + unused)
- 1 cell for other variants
    - (request number only)

This fixes "make dtbs_check W=3" warnings about unevaluated properties.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2:
- Used more specific compatible string "spacemit,k1-pdma"
- Enhanced DT bindings with conditional constraints:
  - clocks/resets properties only required for SpacemiT K1
  - #dma-cells set to 2 for marvell,pdma-1.0 and spacemit,k1-pdma
  - #dma-cells set to 1 for other variants, ie.
      marvell,adma-1.0 and  marvell,pxa910-squ
---
 .../devicetree/bindings/dma/marvell,mmp-dma.yaml   | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
index d447d5207be0436bc7fb648dffe31f8b780b491d..7b5f7ccfc9dbb69bfef250146cba5434548f3702 100644
--- a/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/marvell,mmp-dma.yaml
@@ -18,6 +18,7 @@ properties:
       - marvell,pdma-1.0
       - marvell,adma-1.0
       - marvell,pxa910-squ
+      - spacemit,k1-pdma
 
   reg:
     maxItems: 1
@@ -32,6 +33,19 @@ properties:
       A phandle to the SRAM pool
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  clocks:
+    description: Clock for the controller
+    maxItems: 1
+
+  resets:
+    description: Reset controller for the DMA controller
+    maxItems: 1
+
+  '#dma-cells':
+    description:
+      DMA specifier, consisting of a phandle to DMA controller plus the
+      following integer cells
+
   '#dma-channels':
     deprecated: true
 
@@ -52,12 +66,47 @@ allOf:
           contains:
             enum:
               - marvell,pdma-1.0
+              - spacemit,k1-pdma
     then:
       properties:
         asram: false
     else:
       required:
         - asram
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-pdma
+    then:
+      required:
+        - clocks
+        - resets
+    else:
+      properties:
+        clocks: false
+        resets: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - marvell,pdma-1.0
+              - spacemit,k1-pdma
+    then:
+      properties:
+        '#dma-cells':
+          const: 2
+          description:
+            The first cell contains the DMA request number for the peripheral
+            device. The second cell is currently unused but must be present for
+            backward compatibility.
+    else:
+      properties:
+        '#dma-cells':
+          const: 1
+          description:
+            The cell contains the DMA request number for the peripheral device.
 
 unevaluatedProperties: false
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
