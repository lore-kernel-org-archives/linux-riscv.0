Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2BAC7EE43
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 20:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXLxg+9mKZ+IIPp6lfE/bZ58s9HM9ufVPy7C2AiFFhg=; b=1D7vF+QXZxjSsY
	PykXHtYbj2jlXhEl+Ewws+uK9KihSU975d5nC0elzdfuQmT0gZn3fgiSr7sKML3bw1zQrrgN0NvjM
	3+GP+r0duu42BIXpuAQVccoBNh2NTJfoWVOBq7xz1d723KAw61XlKwI/PSWKXxP9bvBeq5CKSy+C7
	mWJnzSLj37kzHxHJX07/mBUiPYpPDi3lTlZ58SLbu/9yWycR75d5jERjYkQDatQMYYmvmjSt61MgV
	pnpqXSwGY0BtrvIcgGPFwnc40ZSYvp31LhQsn5GewJPfILG/t/HCFKUe0spV7YzvuQT7Oo9OTx/T8
	py+TLJz7BDndSN2QyaHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q85QD-00H1q6-0F;
	Sat, 10 Jun 2023 20:42:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q85Q9-00H1oG-2F;
	Sat, 10 Jun 2023 20:42:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f732d37d7bso21313145e9.0;
        Sat, 10 Jun 2023 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686429768; x=1689021768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hJFlrCte5GBR7MpsYIzaf+ErbhQyTaUpl+j1hGve08=;
        b=hAGLVXUPDF5zyNI17sP6N86ZIevxQyBN2PRxHG+BXQcTj+CJCRxJmBXJWVIbW/RGox
         6odcZPSmqTpaMgwsFcFJA9RpPKihrTA5F7KLJH5TuI4s0QlMpeRaqtUggy/0Zk43ofWH
         4gFihZMNwpaJyZmr+Kbb4Om4g0+yWemPhiw63/x1JMLepoFwqvccLGfhm+/cYoEXbf5X
         c4iSVQkbjRkUk1QWP4RbME58NEhBcUK80MKaq+W73JlPlGdTox3d6CIE/m/HXZdetro4
         UkwHDWB1djzvqd60Xekl0NenCKkppmD3ifKoAzCdGL0MoYqEHcPopwuW3AOcNAtV85Dr
         VMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686429768; x=1689021768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hJFlrCte5GBR7MpsYIzaf+ErbhQyTaUpl+j1hGve08=;
        b=W9imHlmVD8rvZxbIqTIGza8QZY7Vr/WoY4p837LncGRiMZaJr3xvNfSFmfBDdh1VR6
         jztfr6R70jefbq7wUHTd3jLzygdu3cFvlOSIRO21z/JEvcX+PFachB2Wnkg7QA1e7vLR
         cE6wRZCg1+ZzbWNSraMemNhhgMH2w6ScQijqCOpR3Rryz9UoHPOk2xNO2ij/YZy17xC/
         SXxdef6Iyw2M4PMy6QeEnf57I7Kbsbuli5/4U0m0uDkW9PbKcZL4QE7Os4TmxQiOWxvU
         9hDTXwx26syBxSpzZtZMp4dBHKeEQNmFYZwyYSiDkXnvZjd0dOt4bCFV7NVChRUGXj4M
         VepQ==
X-Gm-Message-State: AC+VfDzqeVMOCI0XDrNZtGwOMNOmrl8bl53UCiFH12mdl/d2LlDv5Tth
	F5b6YktHeSxK51Hr62dvi58=
X-Google-Smtp-Source: ACHHUZ7VpOD/P9K1c9pzM/fet25ba5bKHkDD2WlG/ssQv8LH2i8o061I1aGWlrW6vmqAo8m/dVIn3g==
X-Received: by 2002:a05:600c:211:b0:3f7:ed1e:5a21 with SMTP id 17-20020a05600c021100b003f7ed1e5a21mr3426704wmi.38.1686429767895;
        Sat, 10 Jun 2023 13:42:47 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f605566610sm6547733wma.13.2023.06.10.13.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:42:47 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Sat, 10 Jun 2023 23:42:18 +0300
Message-Id: <20230610204225.1133473-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610204225.1133473-1-bigunclemax@gmail.com>
References: <20230610204225.1133473-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_134249_737856_00A03D34 
X-CRM114-Status: GOOD (  10.90  )
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
