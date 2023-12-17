Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF98AC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 21:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYEMp8fSMbtuGpn6lzjcD5/1KcYTSiANlL8+kXFYyYs=; b=RAlhBptD0+wMKq
	ga9KgJbUBMSQD7eWguBqMYPup7viCs/Nr/iqfzWsqwIdLu1mXmmwMfnUFN0aN1artuF919QOQCNXg
	HWBNu7/StUA1nGAA0O6fzsyPa+9pA3d9Uq4wIGS2VuFnpQw5eAwWeXw0hG9rDJPDagF+q/lBotgCT
	FWgqM+8zNtMNI1nlUHprYZA2aCtKkB32gFEN551BUJ06Km45u2D2JeE1BD/a/b0RhoRmmBX3e1xWV
	fQG/j6AKgwts8vH8EpQFI+cG2+Sf61/8+VYdJX62L4eeEVXfrUIrpxI0Fa2Quq/2Ac1ufbJAqFSic
	thQ7lnnop3X2zAScjI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyO3-008TNl-0s;
	Sun, 17 Dec 2023 21:09:23 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEyNw-008TKs-11;
	Sun, 17 Dec 2023 21:09:17 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-54dcfca54e0so3171534a12.1;
        Sun, 17 Dec 2023 13:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702847354; x=1703452154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxR6hF/d37at9Svy1FV0ihBmt4KDeen/lqmXip53gJA=;
        b=NIqST+799ndPbIyCB2H3zF2BCbXQXl/ZhJgenu1W1qvEFQ4CVa+KT0FHfdx+N/3bNM
         rIDhXpIe3BPU24V59lbZDzplB3wujho/4HVbpHESKOyMc/SCRBl3k4o1v+cuC9Pg5YSD
         jXzntF7jf1kSAs2ZBcFLwIwG2+9ER95T2eYulx/VHAFkNTIIAyhqoDSSuxDrMUp0P97e
         WPx84s7MaPfD9JnHBnEh6J/MUx5HMZDPhKfRyynzykSnhD4o5diZh6YgeFEDj0VZBZTb
         ytlKANXPvhEvW8/MEiIzDs3zFUTVL7MrKpWg/kkyj5mfAwHvwb8AxOQOAQw1fof01gMd
         fPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702847354; x=1703452154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxR6hF/d37at9Svy1FV0ihBmt4KDeen/lqmXip53gJA=;
        b=AjD5AJzP9Xp61jwDLzeZr6Pm5EK71x2NUlzqPsYaSEpnNFNSPhvhIJl9+i+hgcHxrg
         8bOcXhGfVvNf/Vcx39ufbQ62DAgMWIuAD3pAeAxrVg/3PexOwIxQ0yzEibDs2dzs8sQQ
         ekw+lm7tJoDv1v+zFRWGebT4nMeAAf5kPwhZ6wZpGE8BpT9uceLcV1pPkyn1rrpc0BPO
         9wLg3Y9pDULNjT/RQyf9FwaF8kKbXI0wrh1zg3kJT4WXUIn/JJ7+XGgMDtDFIv4jxP5A
         SHr5hCj5j2yZhmDijqLOWmpvGoZDKhALSuqfw79nlGAHtRyh5grAgRGpG1vIqY2dNMXB
         GM+g==
X-Gm-Message-State: AOJu0YxKNdQScWPmqSC8kARBX8qOISUph7ttvwWrqOsLl4rQ85Cuu3Ih
	6QjKHRJv17MmDLonPRCCwVk=
X-Google-Smtp-Source: AGHT+IH8rZUBNlfMGfHajr+JWoOQrRyXykFKDWSFBD2jwvMitlgbukM748ZcSk7h6iptqsxEjLQnuQ==
X-Received: by 2002:a17:907:6d07:b0:a23:5369:9890 with SMTP id sa7-20020a1709076d0700b00a2353699890mr583642ejc.79.1702847354192;
        Sun, 17 Dec 2023 13:09:14 -0800 (PST)
Received: from wpc.yadro.com (188-169-139-214.dsl.utg.ge. [188.169.139.214])
        by smtp.gmail.com with ESMTPSA id vc11-20020a170907d08b00b00a1ce58e9fc7sm13316096ejc.64.2023.12.17.13.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 13:09:14 -0800 (PST)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: 
Subject: [PATCH v6 1/3] dt-bindings: thermal: sun8i: Add binding for D1/T113s THS controller
Date: Mon, 18 Dec 2023 00:06:22 +0300
Message-Id: <20231217210629.131486-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231217210629.131486-1-bigunclemax@gmail.com>
References: <20231217210629.131486-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_130916_614705_17D54407 
X-CRM114-Status: UNSURE (   8.87  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Zhang Rui <rui.zhang@intel.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maxim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Lukasz Luba <lukasz.luba@arm.com>
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
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
