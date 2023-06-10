Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A52C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcc8WMR5jNzib75AwQOX7GSYKUlYLhgZKRJ0zy4dH1A=; b=UMWvOVoUEENmVd
	hPE11jeGc81RlmAVt3g8abO2dDue0JTBlB3gMW9AALJyFD8oxmuqEhCMJG1cGVUxyKy6ea0i1hZUg
	ixPFRtRElllhsI7OeUW0LZyVuiOyvTTmTmit6+e1WMtPiAcK+oH2NNQsRcrWr24gqCvVbiUNtF/Qu
	oHaeZJwEM2v8lei2UlZTcCoZorNuLLXoDbG1ot5MbjG0lizTaRzZAyhuMurr0TeJ4rz7Ig38QAHxB
	bEovoJn8BB0w/jqwnKu80nU+7Zpnuk22AqzW+GFZpyQnQ9iGyYcoO+5Sp0Qj8zCzbxeJEwnayxM1E
	mFN/nEwSNEliY6ny1odA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7zQ8-00GL5u-0t;
	Sat, 10 Jun 2023 14:18:24 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7zQ5-00GL44-2d;
	Sat, 10 Jun 2023 14:18:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30c55d2b9f3so1818403f8f.2;
        Sat, 10 Jun 2023 07:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686406700; x=1688998700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsgeyxXBjiNCCbFnpasARFFtGQuGGzV0SKK6yZWlTDw=;
        b=Rj0iUZ2JsSMmbPNyoSYt7fdUnvvw9nf6RiHw08J+SEcYgRC/iwFSL9KNJbdd3Q+zbM
         UBC8+ntx2FCVoagNvELVpTs8l6Xir7IwKaGrdYAIL0tJ+fAMzpdzLg+iKSGjxj2bZ2uU
         2f+F9WMXgjBEbxxuWGWFMLjBDTjp+V5nkv501v7Ycyd/wQt8N5AgIehxPmoK+m5G2bAD
         PBFsI5EgiiElObE7IEWbHxZrIKS1DsOwjT7UsMlDwOKRZBInEZW3GEkAqGjPoFNRdooa
         /zPO+XaI3R+hFQtPY4OKj/DqUCFEdXfW+jvnYs9CznNbNvrEbmk27jmbHFW4IH67tYDV
         luFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686406700; x=1688998700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsgeyxXBjiNCCbFnpasARFFtGQuGGzV0SKK6yZWlTDw=;
        b=cnNThL5QjZNhSxaKATs3gWS5EX6APkeaYuyjKACfgr9+FbHmK7Mh34WBpyFPkfKIwT
         LjWRtKDPNK9ojQWOIk3JLYgLERy1l57RdO+YQCmK9b+wPtkNNaCiMBfoWHUI1IdSD5p3
         l5j3J8TcOpBPAAvji6g8pt+oUuEKskbL/JiDSF9rSEGTxVmCfSMq0bzgAgEv4jzzOvt/
         v9neK/cQpdNDbHnORTI+f+PHqzzWwWVgscMkC+MP1LUIHdCnzG1oUD/5hWR3xHz17gSn
         euVWe2XPVTpO7zK4zrEOcMhhNCQQTtZJnukRDGN2c9Y9mUw1MzHcBM04PfYohu/NKU57
         UHyA==
X-Gm-Message-State: AC+VfDzqVzn3KKtoTgucyoUPRjNKdhgVuDvf/uJSBzxWU+twsxaS1JmT
	ZneE6NbyeykF3Dh/ZAyrRbc=
X-Google-Smtp-Source: ACHHUZ4vkkb5KY+PTVEJLFWo4HPZMMW0IRT2iCexNNKegDN6VCG+CWKglNTWFqypntcWouyqTLcFrg==
X-Received: by 2002:adf:f886:0:b0:30a:f0d8:e32e with SMTP id u6-20020adff886000000b0030af0d8e32emr1127222wrp.18.1686406700522;
        Sat, 10 Jun 2023 07:18:20 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f735d6fa74sm5841488wml.9.2023.06.10.07.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 07:18:20 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 3/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Sat, 10 Jun 2023 17:17:34 +0300
Message-Id: <20230610141739.999268-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610141739.999268-1-bigunclemax@gmail.com>
References: <20230610141739.999268-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_071821_853083_81295845 
X-CRM114-Status: GOOD (  11.10  )
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

From: Maxim Kiselev <bigunclemax@gmail.com>

Add a binding for D1/T113s thermal sensor controller.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index fbd4212285e2..001faa37fc27 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -16,6 +16,7 @@ properties:
       - allwinner,sun8i-a83t-ths
       - allwinner,sun8i-h3-ths
       - allwinner,sun8i-r40-ths
+      - allwinner,sun20i-d1-ths
       - allwinner,sun50i-a64-ths
       - allwinner,sun50i-a100-ths
       - allwinner,sun50i-h5-ths
@@ -61,6 +62,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun20i-d1-ths
               - allwinner,sun50i-a100-ths
               - allwinner,sun50i-h6-ths
 
@@ -84,7 +86,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun8i-h3-ths
+            enum:
+              - allwinner,sun8i-h3-ths
+              - allwinner,sun20i-d1-ths
 
     then:
       properties:
@@ -103,6 +107,7 @@ allOf:
             enum:
               - allwinner,sun8i-h3-ths
               - allwinner,sun8i-r40-ths
+              - allwinner,sun20i-d1-ths
               - allwinner,sun50i-a64-ths
               - allwinner,sun50i-a100-ths
               - allwinner,sun50i-h5-ths
@@ -159,4 +164,17 @@ examples:
          #thermal-sensor-cells = <1>;
     };
 
+  - |
+    thermal-sensor@2009400 {
+          compatible = "allwinner,sun20i-d1-ths";
+          reg = <0x02009400 0x400>;
+          interrupts = <0 90 0>;
+          clocks = <&ccu 0>;
+          clock-names = "bus";
+          resets = <&ccu 2>;
+          nvmem-cells = <&ths_calibration>;
+          nvmem-cell-names = "calibration";
+          #thermal-sensor-cells = <0>;
+    };
+
 ...
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
