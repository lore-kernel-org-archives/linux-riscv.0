Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7105EC25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DR7nIppwZSR/wsQ4V4hp7JNcEy5qXTLuOIGhLvkU5M=; b=i3xFIW1yzEZe8Q
	tV3442HXtkeeoOoXrqD4Sa+gg4HoymyFcWKMTmoNP5xqgz4oqUuzVNVQhc98o7R9n3NZNIHLil+hp
	NHwVHQRVVUBObT+K+9BQVNYinucN7MR/3YowNpdXr3y7pBBCUdRCIgK8ulx8O3FrOrDL9tJHhj2/k
	TzO+ApyMVrmM+0t0N1VsRPOAfEONSanOzTtUKD13bYg8ekoh/Dc47kMGqZ1HVDlsXgb7e0H8/KMX9
	glVrdprG4jqJxYhG8PEFXjfkibNNPZX5Bry+k/OTt48UJYTNh0RAEcKPJb4+Dqt1pHjrgugu631Yv
	M536Mg5Q0C5FOAYtA6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPPN-006ATA-0R; Wed, 17 Aug 2022 20:12:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPPJ-006AHO-MK
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:12:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id m10-20020a05600c3b0a00b003a603fc3f81so1467657wms.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
        b=PwR33To0N5ui/sX2vHA5vGOkVP5CwIp7cjsA3PN3/adE8gVsnwKwcA8MYb7gioCksg
         ahw0LIbslkzwkpF5jej+bp4Yf0eOt17d57rj6NZDdo2SwIe+S6QwHLjSHV2P1MzSZIBc
         SYx4JQvjJaj8YXXwnSVR4gMkDl8Q0JCp8oTckDnqWMsTdK5gI0pMdfXPPzjOTaFzzLMQ
         12YILMe1gQQ55rA8mLmVO7Cvz9oVG8YaFarhPLW/UC6wwUTSAdaNVhcSQfB/LksZ2ARG
         6gYZLDZVb5Wsbi12Ll5V36MnebMaEECTDL38Z4MC7mvuhjAl2WJjonXIZ/KRs1DxNILj
         o4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
        b=RFp/lWKDCAkGETTZiMLWBDWlG8H5IilSoG0nqgIXUXGbrhwp8KgA2Pf5Z0M/FETB73
         YbCxd/SNWUXlTPvoGL21ohF+6/SkK8Gro9xT8mVP7PduqzBG38kOPU0fznuqQgs5Uay0
         n94FZAIayqlV7/rDrC5X2PXqCbpGoa673oMeQzu8oXSvfiLkv2Kf5sTgX5mLb/gYRvI1
         hD7NpImR8O3i92gSukjlXkxCzcqFxZAsR2m9hn59yGqpPO7P1t65TbOmfx554QRHKSAL
         ki80G/0LPjVaIIFB0iZP7EbW/LkclbGH5jg4zvCMLavZv7Rw5YUlJ5sRJOAs9P3tJHck
         YzWw==
X-Gm-Message-State: ACgBeo0GxC0qviHupHGjMOa+ghn0N4rK0v7TKConoWXdyPDwrXz4rPJA
	IDLuU5cMbVdH+am038q2A26YuQ==
X-Google-Smtp-Source: AA6agR6lJ1JCJSrjpa59CdkKTqHzSw7FSFRvF0du7bAKFhB5DFjPBDZy5X6POzzhjKmao4BdhzICzA==
X-Received: by 2002:a05:600c:4f8f:b0:3a3:4612:6879 with SMTP id n15-20020a05600c4f8f00b003a346126879mr3121447wmq.84.1660767157797;
        Wed, 17 Aug 2022 13:12:37 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600c354f00b003a5dfd7e9eesm3029371wmq.44.2022.08.17.13.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:12:37 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: timer: sifive,clint: add legacy riscv compatible
Date: Wed, 17 Aug 2022 21:12:10 +0100
Message-Id: <20220817201212.990712-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817201212.990712-1-mail@conchuod.ie>
References: <20220817201212.990712-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_131253_747566_36DACD2A 
X-CRM114-Status: UNSURE (   9.30  )
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
