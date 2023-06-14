Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E388CEB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 12:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNU7B0EW0M0F2YzTKId8GKY9/tUKE73TosIksOccV9Q=; b=hl43Hwi9GQUsvh
	GnAB/Mj5RaOMBlY3Zrvyq7yFiZl1YcNri8COoJUJPyHokQ9G73F62qegJ+Sc0QM6WkV4dMnoCmfpT
	lUc5+0RsZbf3OTkqdw2Dy4qrYwgjTIBmkL6qISY3pEtcIYi70D8ZLwC0riSEQ3HrQnEeD+uZEWe9J
	ssX9Hr1zYtImZryzxDqMKgUZD4oZqmeP35r7E4Yq4WLhTNCjVGGH/rlKlKy7RcHdHhAteZeuzA9kU
	8Xgl1SeUyZUGazqSADSMQXeshoa5FnDVu7T49mFK1t7SwdT+ZeWrP6amc0iaKnIPAkYhFVH5NNaIq
	VApOSNCg9Ax/DVUTT2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Q2X-00Bg6p-05;
	Wed, 14 Jun 2023 12:55:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Q2U-00Bg5M-0S;
	Wed, 14 Jun 2023 12:55:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f8d86db375so7521765e9.1;
        Wed, 14 Jun 2023 05:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686747352; x=1689339352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y8eii1r9u9BsE8Cxn/BFgcHPymaswarfpY9l4mkywE=;
        b=EBmpjVhBuG8USId5EMZUbNdW6u+JlW25TLBTVA9pMQyCea1mEZvHL1T4pkMx2eroiz
         O0K7NrbBzy1F5Ye+gd1WG6BETBOnQM9anZMNK8TOpHeY7qyk9drC8l5gCY0KyfFcFJSt
         QdyXal+eegewyCBm5hwUZNQ8Fa+NT4rIMZ5qdmm5xIw2tsJX3kA0U09TjWiNakdDVxfI
         gO6kIkAURmUIvWm7VLl9ezDGXyJwA34x/hAn2J90+Mlt8WAyM/E187pY7/CNjnoc94Di
         DT63aDOKKJaEP46HLELW/kyqmIUXqTE5htmlauLNrIKYAEkTIkf1X6U64mHSpQeyDQgd
         RjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747352; x=1689339352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Y8eii1r9u9BsE8Cxn/BFgcHPymaswarfpY9l4mkywE=;
        b=c4uIdeU2HhYMD+gpI5uzoM+dLJrwnqSmT4K3deZNihppsY/VcXPbCozhSGY3ooqxaM
         H/wlqx6MY29dkTgZhCT/0ZM+gT9UNHQ5m+DFpAwFCFJkCVD+FAdWqnqKW1v25fxLSMst
         7xXY6Nli85bdu3NE7Z4qk2a3KMJq+q4AIJIfDbs4q5BuFYVu8xwcJRXE0BpP3kYOBpEV
         WZ0f+uZUnS/EtVbO6Qy7F1uOep/G1b6zK3SkzskAONpGQRlt9ij1z/dZPAPOqKF29p5I
         D8RPuDUSOWSU0flQTiVbE3VeNwFwtDKfnZ1JoUvhNO461Rc93zRlffbwa+/zj/vyXo/i
         cUew==
X-Gm-Message-State: AC+VfDyTkrqaVEI/IZ7gFRsDX8+MAGuW2B5NKjn6+BCFLdS5qI87yVNL
	svftbt046nTB8NsfihsLxaw=
X-Google-Smtp-Source: ACHHUZ7SAHgLvBtL/br477qMLUb626VlO3QGqyv4Wm6I/D/QtIR5Wjs5U48AhWp5oiSwn5abyy6svQ==
X-Received: by 2002:a1c:7906:0:b0:3f7:e48b:974d with SMTP id l6-20020a1c7906000000b003f7e48b974dmr13047139wme.27.1686747352125;
        Wed, 14 Jun 2023 05:55:52 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003f7310a3ffasm17402522wmr.2.2023.06.14.05.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 05:55:51 -0700 (PDT)
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
	Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 1/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Wed, 14 Jun 2023 15:55:19 +0300
Message-Id: <20230614125530.660597-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614125530.660597-1-bigunclemax@gmail.com>
References: <20230614125530.660597-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_055554_179746_16BA4111 
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
