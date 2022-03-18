Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90F2C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 16:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2VvsdyrqBLCsMkMEptUt3zLYgtQkNUWu16GBB95EMDA=; b=XBJ6babNJ61fkV
	w/LqvGTY8RXrjmeH4Rq75G1OUhKWV9L7GCQw21hsnfP1t/4Hd+6BV8lJZGpO9sGlREb8axaifa7+X
	ccTLSNMCN2jkWZI55vOkWiQ7Q4Ps5xV88Y3cZebze8WKg4iCdSCHSPwJdeWxbGAtrZfD4Pt0Ga4N4
	SetHMB3JNaXif7agGK58z84ORNSn0bOkXqATIT56nrnAzmZWJOUEWKUQq538ZYm3FgB9USx9F/CM9
	39lTnWl6YUyRDnX34JarBtT6Arf9+kvN6jWqHNou3+TkmUB4YcUGEVhi8RRcmBu2jyv1peYoNATGL
	2ifUfnWMFUxCXJ+METDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVFMB-002O2R-4e; Fri, 18 Mar 2022 16:21:39 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVFM5-002Nxb-Uy
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 16:21:35 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E7DD23F223
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647620483;
 bh=O5YEItFojELUQ2ZVAdFWmd7QnNJFa0nT8LdWFM6nccM=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=c/fOo4zU9mb8jCYfW0YF/+tCrIWepDwaZCTXRnDu6eiyG+GMG/LwSvrSA4coqCzdX
 mg7q6D75Um+FkhqFAIUY35qd5QhMq9aD6Eb9C3DwF+JxR1Fd8/Xw0mAwo4ZLIvfEZo
 X6FDhgpw0rf3V0jchz4aEYOliC4+7nXzlN/WoxHxGBWsEyfnMJMLH4Wwlfm/NwPCL4
 yz1IVWkY98rlMSYgkNvbOPDJxov9ZXke2OSTkMMQ40XlHkG4uzKzTSw6o/3ilQkfMk
 3hq5AvlqlrRzVSzT3UT+X/0vvs+POxCZPNCSb1mb7Z9/mAmojgnIZ+XOUgBO6BihGz
 H0IIZ/wiRq0xA==
Received: by mail-lj1-f197.google.com with SMTP id
 76-20020a2e054f000000b00249606fea4fso2277631ljf.19
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 09:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O5YEItFojELUQ2ZVAdFWmd7QnNJFa0nT8LdWFM6nccM=;
 b=2p0PM4BBpsrNaw4AeP3mi0dExv13bGfeMCo9vtpAJqNexxxn3nvtm2nRDLskjKZ9KB
 nfrFN4R/AYjNWrcr7tb/07vROwM0QxcOtDazxeGYT/cLKNCK7SOgND9ae2R89jW5wjgf
 rnCt9DKKMVH2i80jrNpHxNEGC2cXKMdLOrafnU12UnRwqu7FPaNw+D3+wDcGAdlojIjq
 Yt+gx5SPTkb9uiJhUfKSqVALbVgHEPb8YAJp5l81CspbaBBmuuQQgNABPnK7jm+svH0y
 uLp97HGJCxf2KGAcoRFXSN0w3a8npskhph5WZxDR3fpr3bOR6ySn3hYlNzJRm8KCcuig
 7ZNg==
X-Gm-Message-State: AOAM5311pc+ixAuN5FHj9muWAe7YHu5dZ1xy8CuhplKs9Mis59e/dbFP
 P/ONpqw/Aj4Jfj91vsBCQvBwiBe05aofW+h4Nr7JAmr9p5rY3mFW14bEN81or5nXLj0gY6xP+fk
 w0FJ9d+7aOCCboU9psWYd9G8r7lEu89LWhpX99SvP0dLTPw==
X-Received: by 2002:a05:6512:6c1:b0:448:6291:f135 with SMTP id
 u1-20020a05651206c100b004486291f135mr6405503lff.451.1647620483087; 
 Fri, 18 Mar 2022 09:21:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7IhRjpip8ZxqWpdk/rNDzwPEQOlG6V0utFUzBi0pEzxIv6O5tJhNXTUklIfs5QHZNcJq1TQ==
X-Received: by 2002:a05:6512:6c1:b0:448:6291:f135 with SMTP id
 u1-20020a05651206c100b004486291f135mr6405475lff.451.1647620482814; 
 Fri, 18 Mar 2022 09:21:22 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 h5-20020a197005000000b00448287d1275sm906913lfc.298.2022.03.18.09.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 09:21:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Green Wan <green.wan@sifive.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Palmer Debbelt <palmer@sifive.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] dt-bindings: dmaengine: sifive,
 fu540-c000: include generic schema
Date: Fri, 18 Mar 2022 17:20:43 +0100
Message-Id: <20220318162044.169350-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_092134_309558_D88D23BC 
X-CRM114-Status: UNSURE (   9.58  )
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

Include generic dma-controller.yaml schema, which enforces node naming
and other generic properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
index 75ad898c59bc..47c46af25536 100644
--- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
@@ -22,6 +22,9 @@ description: |
 
   https://static.dev.sifive.com/FU540-C000-v1.0.pdf
 
+allOf:
+  - $ref: "dma-controller.yaml#"
+
 properties:
   compatible:
     items:
@@ -41,13 +44,12 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#dma-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-    dma@3000000 {
+    dma-controller@3000000 {
       compatible = "sifive,fu540-c000-pdma";
       reg = <0x3000000 0x8000>;
       interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>, <30>;
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
