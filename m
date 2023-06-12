Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEEFC7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNU7B0EW0M0F2YzTKId8GKY9/tUKE73TosIksOccV9Q=; b=DjWtST1b4UIZI8
	MkpSB/R4TKycpGIHnR117q/rv0JTmbNJy6eRc7t4NJwL6bRqAYZoju+eUOHBUF89QQpi6SmEdZMHs
	Xf7ccm0R6OSAXKirZM1SFSVRv26U0eM3RFy40iYgbcmk6ICagpkC/dSmhbRz6dDC5weUgpUdair2U
	aGmUSKDpsWLM2F2Fj/BFoK/L7WoXNqgCzgG0x5wLLnAiOVZfXABvlt3+pWqBk1DuPh5ysw/sBPUhL
	x0DwSbsvWDWhpEUEg099xY2yfgWO2h3XvZ67dgYoAu7rCAUQp7DHF6tvdaUrZbOqOF/Y0d50Sg76b
	6Gras955/o0MWXHZYsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8b8i-002mPH-0Z;
	Mon, 12 Jun 2023 06:34:56 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8b8f-002mOP-2R;
	Mon, 12 Jun 2023 06:34:54 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30fbf253dc7so550961f8f.0;
        Sun, 11 Jun 2023 23:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686551692; x=1689143692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y8eii1r9u9BsE8Cxn/BFgcHPymaswarfpY9l4mkywE=;
        b=ZAaXZp4/9jJdFrlaJt//A975V5KFr18KKjaqZJL99m+R3rAUMRW75BihMX3aOuyj0X
         e8kRs9obAZYgf7I2Y3pg0oh+o1isSogPI2ujI+41SOnUu7WWfXxwBkjlL/qBYq/cYYSY
         CubUAtlXb0fhlfO+17LU0EPQ80i1crxpSRDGCN/40/pakBq7BZOQsrnR7Ra9R3nATPta
         s1WcArFjjyDA6lcWkiZpL8lQYJ7RGWlQAMafjEXMJUa6cqP9ssqDaRxaa6jUIObgLvFu
         uCnxQ5+CcGi6TNwKghMCnpv8PDgKBj5sPUbyp6/FB/z74DBnVukVF49Prxaqz9iVpc3H
         umQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686551692; x=1689143692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Y8eii1r9u9BsE8Cxn/BFgcHPymaswarfpY9l4mkywE=;
        b=iL350H8nbBsVD2KmR9cs7KGdWlYBgx0MIwYtUL/zIheQ8x7WMTmA7vhszs7NV3+jJl
         tFWxKMTlPgzgv/estRNs/O5CmMFJlV8YY6ADtDIr8pdlzQRWTGBtAGMqj9CCvxsyIEt2
         7CWov2SpMoANPP81Bp9CM1iz63PkRd7ZDntVqRwQCc4rYjnmYwE7PbFIf73NdeCM+vyV
         hat9liQRZG1Yhud6J2wZHuNzAp/D/4tHeBGO5zJGctH3vGks6lliMFjGaBRV0QMG6zg9
         5DpUzkKdXXvbHLEk2EI54x5awZiuJthJxEBshsXDA5jLhgAoMHtIR1qdzPAeI5hJVRdJ
         /0iA==
X-Gm-Message-State: AC+VfDwSPW1e7WCU+fZ4T7MAzO8YcTun7Jlh9Dnbb6ifkuOSX5xGsxrR
	CkL3YQD/jHhaCZnP874rXsk=
X-Google-Smtp-Source: ACHHUZ5nt+lzj3Wg3zQ4rD9gaZz+/l3OHW18BrkJU41XeJWwzOn3KBnOCwWtefUgvHmFM6IN7K127w==
X-Received: by 2002:a5d:514b:0:b0:30f:b8b2:5aed with SMTP id u11-20020a5d514b000000b0030fb8b25aedmr3442010wrt.11.1686551691721;
        Sun, 11 Jun 2023 23:34:51 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id o7-20020adfeac7000000b002fed865c55esm11484811wrn.56.2023.06.11.23.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 23:34:51 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Mon, 12 Jun 2023 09:34:17 +0300
Message-Id: <20230612063429.3343061-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612063429.3343061-1-bigunclemax@gmail.com>
References: <20230612063429.3343061-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_233453_796932_654C894F 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Maxim Kiselev <bigunclemax@gmail.com>

Add a binding for D1/T113s thermal sensor controller.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index fbd4212285e2..9b2272a9ec15 100644
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
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
