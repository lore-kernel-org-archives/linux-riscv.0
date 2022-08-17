Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A42DC25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DR7nIppwZSR/wsQ4V4hp7JNcEy5qXTLuOIGhLvkU5M=; b=RmH3KGeLVXcUFT
	UanGJpG/fRZBT5Kue06tCTEKBM+VCaVK31S6YW5agBK+LFPOIUiCpkCUkY89XrKWLu20s+1sY2rAt
	Kz8do/tQVGDF8tNuziwNqA2m0m22Hx40xZnOq0wSIc7jLGi+Cq6XeS6yApsjc7yG/2nqD2FyI2IvE
	N2Zcbnh5tDym/kkTMWNgNDe0kVhmSpwE+LotkWMlcqc6f7WDmX9HPYUFjaIaBJqRWTR8sH9S0crb5
	kgZNyU6+V1imbPHANhGAKrLYdBW88BG/5SCrhunbVI7KbtcKhSvD18TLKPTLgmoU2B/ZGzh/Btrso
	s1dFVq5HHXWPBMU+39WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIa-0066Po-Ap; Wed, 17 Aug 2022 20:05:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIX-0066MU-Fr
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:05:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id s11-20020a1cf20b000000b003a52a0945e8so1449080wmc.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
        b=emUeD3umpIWMTUwimxexv6coDslOSFZdTJZAG0mzIfyT8GhTm2y8Rz5AMG9Ml/own/
         1bvWibxPC5o+FKVmvr8wtGCmKyHocGnEAsXVO0ntDOfnJcELc45X3X92yWuj0qra73+b
         bi6yS6R7rH/1tgXaH7ew6gaJvDmgi3DFVyViPwHKiEf61xl3VsSjFE8tTGYOx3T3H8sw
         YpsLPRTKDXDpfnxxhi2vf/Hvx1riYhARNlfjzVIx2UCiXKxPouZe5cn25wjO1kcjdY7J
         dx/0jJrVOlVsCGDsup/V1cmbWyP5Gx3IFcBem4yoP9MuXeSBrOcHywknEN8fvwer7khG
         mxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
        b=HxooNelxOO9YDjnY8RF7jeR/K1fXLoyW6+4Y7KCkgRYuZhZa+D4GZiqSPJnuMqhhPY
         sxheF8rKx5iIS3zFqIcNHfDoSRqKVhS4CX4wVze9BoH1yAUxR9pI/HZI/4rEb7v85nU1
         UF5l9IZAD6CLfNGLYf1HiAw7UT3sFxJO3Yf1bI/gv3PBNj0pKaiuwbfacJKfvNmncoNJ
         wcBu5lAZEaOZJFxfeEYc5cZAOC6cEYzycy4ZIlvrZQvgA16Apb17xjJglmQd0la4e8tP
         d5EqF2OTjt+U5DW2ydC6a/Vbaw8KVK66YdejMfvfWjXiquqH5kwW2N0FbIA5/vR5zkpm
         T3JQ==
X-Gm-Message-State: ACgBeo0uCafNkD3qirWofngCoIbjX+Jrmu2UBIesWZDgdYAh9LyDARCb
	V96Pvlp2eCXEk3dkev3IU5UB+w==
X-Google-Smtp-Source: AA6agR7XO9/ucBfdhxeAYi9ueBa5bQI5OkfrnAcol6y9widXC8PN67prjDo2a9PO6440GhdqtBKYaQ==
X-Received: by 2002:a05:600c:1d12:b0:3a5:eb79:edc3 with SMTP id l18-20020a05600c1d1200b003a5eb79edc3mr3104767wms.136.1660766750603;
        Wed, 17 Aug 2022 13:05:50 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:05:49 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 1/4] dt-bindings: timer: sifive,clint: add legacy riscv compatible
Date: Wed, 17 Aug 2022 21:05:20 +0100
Message-Id: <20220817200531.988850-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_130553_618524_4E8071BC 
X-CRM114-Status: UNSURE (   9.39  )
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

From: Conor Dooley <conor.dooley@microchip.com>

While "real" hardware might not use the compatible string "riscv,clint0"
it is present in the driver & QEMU uses it for automatically generated
virt machine dtbs. To avoid dt-validate problems with QEMU produced
dtbs, such as the following, add it to the binding.

riscv-virt.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index e64f46339079..bbad24165837 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -22,12 +22,18 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sifive,fu540-c000-clint
-          - starfive,jh7100-clint
-          - canaan,k210-clint
-      - const: sifive,clint0
+    oneOf:
+      - items:
+          - enum:
+              - sifive,fu540-c000-clint
+              - starfive,jh7100-clint
+              - canaan,k210-clint
+          - const: sifive,clint0
+      - items:
+          - const: sifive,clint0
+          - const: riscv,clint0
+        deprecated: true
+        description: For the QEMU virt machine only
 
     description:
       Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
