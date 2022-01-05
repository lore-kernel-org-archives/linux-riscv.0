Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F28FC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jan 2022 05:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRopf0xe16SQq09s7qpXTFk2MNE2Y4qrkouBxgap2Y0=; b=UixSCbSefa3+Qo
	gby0vO7RjrbdzFGuShbcOEn0/fuo2xPEE2RMnoub2bZxR6GZnNsBJ2iUGxS0EWnW/hJTuva8xZNfd
	1WuapBwd+qD7E4z4r0Qd4EmnKSEW8Xz31pGT3Wzvp2JNuxDngMVRrUUM74cIauUzHbEVAlX8WS9Kw
	3Q0FNp5Pd5F6J85/j7QigJBsoL2ECNxvVsz8zFiPj04uo2BDnU7d0WqlW/Bdlo+RUhXYWlIer1ajT
	4y71hE03OrHeGljCkgsuwgxyBY5DdMJFiMuWnRUOdR0+SfRVqaXF7qQKaHrydLeN+lYDMo9yPg2dx
	a+kqumQymJJoWrGt2shQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4z5x-00Db3d-I1; Wed, 05 Jan 2022 05:44:21 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4z5u-00Db36-LJ
 for linux-riscv@lists.infradead.org; Wed, 05 Jan 2022 05:44:19 +0000
Received: by mail-pg1-x534.google.com with SMTP id t32so3050726pgm.7
 for <linux-riscv@lists.infradead.org>; Tue, 04 Jan 2022 21:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yHcajqg9Gpb6lA1mDgUhgvp80/uagYog9aG622RiQkc=;
 b=SXWvmyRxMnnFXzxISs/uv6T0FSxXr7ReBtqaa2rXzPMFtO8arE8D4c8WrHXjhAbg6Z
 v2c4RiXXuVBhRixsMwtb0oh/msiXOUOqR2xcIe05pOTPFave691aYvDAreElkAHO/qmV
 npekYShKlN1zlPyATGx0vCT8zizon1ZVZ/3vWVh0SyNKLGCjDW7n27KVsjHZLbE5nSJ4
 hPBAWPYa631/lrk5bvqOTHRE0fb4VShSE/cC5jdYtdUowhJg1iY4jqUsPc28v1X8pJav
 oQyzuMHJPkdm4C/CS+Eod40alD/52qa9habh4+2v6wnK55S1BikOMhuBm0fmQ5itm6io
 alQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yHcajqg9Gpb6lA1mDgUhgvp80/uagYog9aG622RiQkc=;
 b=rfG7GAZAgi0Y8GmwxbvYvKp+v79pMkNHlaidPSNmfYjBOrI+kPAlfhUJWQVI17P8Pi
 f2QhTM2yYrAP6WdA2L+kskRHlppESqFcEDz/+zpZxYcSuzUkgkSL2hny/n+abnvlhiYs
 rJQgNevWW4xygne/Ew1/t6iNSBf/VRKF9JAWF2qJyrZT8cN3wvjDpdjZ1J8ToEJk/mVi
 GmcsLKF395npRHFR4RKqDcVwsJcBfK94OaBjRc1OwVpj9tGEcPDjwU609UST/0Q2oytn
 yoxQbyLHg1fkknmStic+MRwHARDBRTdjSrqgirw1p9sNaNDFaE/o5c1ipq5XQ5bnPXS4
 O7RA==
X-Gm-Message-State: AOAM530teA6gmJ3oyrDsODtiEXhy5yyzUMnaMQWRV238RXapJQwuD160
 e401pINbiCFSpWKKhFywDhzNjTwt3APP9w==
X-Google-Smtp-Source: ABdhPJxb4U73W3VbaLmfSuss/ZkajAODH5FlLZNrkJE4VhGjoI6/tg9nwj4cGqHa4kBqzMHl7MUOng==
X-Received: by 2002:a63:745d:: with SMTP id e29mr32203035pgn.213.1641361457962; 
 Tue, 04 Jan 2022 21:44:17 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cu18sm1000574pjb.53.2022.01.04.21.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 21:44:17 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 2/3] dt-bindings: Add dma-channels for pdma device node
Date: Wed,  5 Jan 2022 13:43:59 +0800
Message-Id: <0419b2865c87f72adeb4edee9113a959e468b4a5.1641289490.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641289490.git.zong.li@sifive.com>
References: <cover.1641289490.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_214418_721338_3833A2C7 
X-CRM114-Status: UNSURE (   7.91  )
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

Add dma-channels property, then we can determine how many channels there
by device tree, rather than statically defines it in PDMA driver

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
index d32a71b975fe..256bcb111d57 100644
--- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
@@ -34,12 +34,17 @@ properties:
     minItems: 1
     maxItems: 8
 
+  dma-channels:
+    minimum: 1
+    maximum: 4
+
   '#dma-cells':
     const: 1
 
 required:
   - compatible
   - reg
+  - dma-channels
   - interrupts
   - '#dma-cells'
 
@@ -50,6 +55,7 @@ examples:
     dma@3000000 {
       compatible = "sifive,fu540-c000-pdma";
       reg = <0x3000000 0x8000>;
+      dma-channels = <4>;
       interrupts = <23 24 25 26 27 28 29 30>;
       #dma-cells = <1>;
     };
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
