Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1790C7EE43
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 20:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcc8WMR5jNzib75AwQOX7GSYKUlYLhgZKRJ0zy4dH1A=; b=PALB9EneuC1IaN
	pw595WMyEbMtIXVQSsixoejSFa7A6mFBKM1bOQ/vfne6rYWQ7Btyx7AXndp3p9AwFtulEEClCP1i4
	0tdNzJX/3gd/4zgo+pwGCV5cjTO4O3qLJSYZ3BtEGEU293FRZczmsdbiDL9pyt91GXC897LQ8eLBC
	HSeePw0JE3wevCNndaJRyo2qXMjeuFaltpJ1ydazY6u+DV1iwRzA3blKVvbzzpXBWYzwyRvD1OZ8A
	NizbFEGzkG5VitIKFgxQgh/G88MHmH/l6bO/ukZp/8HQon9uSM1d8rCrknqltT6VNDNiN6vH73p9X
	DMbodc5fmTMTQeaTpVNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q85Jr-00H0pk-29;
	Sat, 10 Jun 2023 20:36:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q85Jo-00H0oJ-2x;
	Sat, 10 Jun 2023 20:36:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f6e1394060so21216115e9.3;
        Sat, 10 Jun 2023 13:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429375; x=1689021375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsgeyxXBjiNCCbFnpasARFFtGQuGGzV0SKK6yZWlTDw=;
        b=oUeElQHhNEZYn7UmTCYVdAIuxvdnK05pup+LGf26JjI6Jtiz54aN912t5s9bF4NOfq
         BHjhJ3iZIVcn5/NxcOH0qvw6+6nLxkEm3dZ1xkxTlvq/C2Us/uPLKAb8FdeQq9ee/rjK
         yhkh8aL4lbbNruqdQpM4nooNdEBcx05Ndk3kUQ9vKn+/jjFeBaOuyaABt8OlOEm3zyaq
         gIOkK6ekJgZIw6qbuNDrvFD0153UCmIpIcz3GW9dJIVSUPiODl+d0ZeFZPIZz3jVEfFC
         BDisGdMneISNyl0Vi0cXnGB9JExaK0L3EzNF6A7S5dAS33f+dRTMd7rVzGZUK7wZzHLf
         IJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429375; x=1689021375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsgeyxXBjiNCCbFnpasARFFtGQuGGzV0SKK6yZWlTDw=;
        b=cWNvAvVpLXIVO5GjVhkchLIJL8lcrVqhY5yduNSzyDGsw+pp9klinAoPBOxsG3yMyU
         u9PUOyM7D4D/6jRN5hRRyXmyKNb25036VdDSG8AjV5mH7cg4JeorQNRADmZVVtrwjqZK
         U1eiZFCX3pOt+LirTT8/3mPBCQ4UosFZd73tQoc0IJ1R94DuCKaj4j3a8DGJOevpBpzk
         nK/k/nwPl32tp8uqtVY/e02Yfag2Kacop39RZ4osF+aN3iiVkQvM3y7K8ZuaxA52LstC
         ehBbf6Xsp4WHU9WO/G8o2b35nYQafQdQYpzLqWL2NC7tO3L5nOeHHTQnD0oxwYplcThq
         MyvA==
X-Gm-Message-State: AC+VfDyQgVz1CVRq1PricKrKN3SNCXHdt6Ofv2kx+VbOm27XdPzbCI0z
	rV2MDZ5NsWFj1Stk+iq0k0E=
X-Google-Smtp-Source: ACHHUZ5Nsi32LCrv1wkY3Q1YnwLUja35YD1C06qrqpyjQaRiaaIadIbfPyOvjjEdr7k5omq1qnotNw==
X-Received: by 2002:a05:600c:2144:b0:3f8:946:115d with SMTP id v4-20020a05600c214400b003f80946115dmr2992226wml.30.1686429374960;
        Sat, 10 Jun 2023 13:36:14 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bce0d000000b003f42a75ac2asm6572867wmc.23.2023.06.10.13.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:36:14 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Sat, 10 Jun 2023 23:35:42 +0300
Message-Id: <20230610203549.1127334-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610203549.1127334-1-bigunclemax@gmail.com>
References: <20230610203549.1127334-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_133616_961709_E9277BAC 
X-CRM114-Status: GOOD (  11.00  )
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
