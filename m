Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE0CC32772
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Aug 2022 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0u/OGtlGYp6CE37XxS7RCPtrgnWFd1HWgIaolY02E68=; b=0g8P2S9Ls+b1bQ
	Xu0/hG8vsmLa5aoM2xubeBiDzcWTgT3ulxVLzV2bNkuS4qgDtm6mlF1RLiqfeEO2aCBdqzi8e5q2X
	pcSRJJPvtoZFLPm9zNdqSGuhPfyI/q9ja5MLFg+U1yOk86S4OqXoeDUibZhkf3HtxCiZxUda/8Lk/
	OYmrlxt8kslmtJFvrngn2qMNUwP0UIFjvec1o7bqkOFKTl47XQUcuXKkH+dzfgZebpN3BTlczweKb
	cHrUxpQ2Qn/sUTstUotVD7wOtKJ8rWhWFMBqeruTEC1KWyk00gF8HzB/n8g+TLs///KdEW/kkYg5q
	n72ccoWGGrf5I+z+2p+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYiv-0084tt-Jo; Tue, 23 Aug 2022 18:34:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYis-0084s3-R0
	for linux-riscv@lists.infradead.org; Tue, 23 Aug 2022 18:34:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id u14so18009313wrq.9
        for <linux-riscv@lists.infradead.org>; Tue, 23 Aug 2022 11:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gfYO45Fhrr292YriQBgq+GL0i0hKssdiRtp+ptuTmB8=;
        b=cxhWc3M4obppLHYQ1+1dtIkL3cRvwms6r8PwhRPdHDTBOodgqvj+O9GT+FIXT+jVHM
         cLh/Qw3HVakfK6G2nWP1Yew4MJQDEtQI7QpU+r6N0eHqbjF0wJ41mxQK6Mlb8s/QZ3fy
         SdDOP+rFnRzP1U+moj1P99yf0KdJkXioTWpwRdqUa42HEjRci3ryA21S6QskbzqnjstD
         jYKuJAKEa0RgEOdq0ZSHUh/D9OU86R7A5NtNLdP2Whs8V1ITPGcIIait/JWspTt/7gUn
         VMWDd+BN7Y836i5XYRf1P+fGFGKd5HdoE2zvCUi/n6n2FMcrbn/7MFxO7ncgmhXv1wKg
         jicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gfYO45Fhrr292YriQBgq+GL0i0hKssdiRtp+ptuTmB8=;
        b=hU9KByNg1Y05wScobAXpqmpApbxP62eEnT/ajXzozhtas+I8rRO+JlZnm4zOWKMsoU
         5EPQJ5wXG7bjBYllrIyqZbEsYODwSWfPsplep06DZ0MoJNVq+URVeYo1cUitQlP6wd/n
         tp9SOwLUVsZV+XJFBhM61AzM9c8IqfUNya+RUZyQ4QSETC7x43RGHzFE6Q8nEfxo1wKB
         iWKijIKzevw+Z+a1wLuiTkWy2VyUZMPWDpiwx8uTtpdMvQJzJ6C6bnm4+rPF3HV8zq2o
         KnNDQycO598Lh+SNKg1GMuwsMb5sZx8MpDXLnuOsPZMTfvnXxcQphl85WTzXVxVIhsqd
         9+Eg==
X-Gm-Message-State: ACgBeo3/j2es21hU1nPkUyOeh3TDE7OyOW/sWgym/vSZ98U79V5ETD7h
	iT7n4EWOgNAUoSHpDHloeGqa6w==
X-Google-Smtp-Source: AA6agR7bBIo4WvfaTQmBmKbZYuyKOKLHUXCNnIkzR2yMddKcJrOEa3tcvpyzuyC0FL4VN5JT0BNR4A==
X-Received: by 2002:adf:fa0d:0:b0:225:1bd4:5d8a with SMTP id m13-20020adffa0d000000b002251bd45d8amr14077231wrr.106.1661279634905;
        Tue, 23 Aug 2022 11:33:54 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c1d9000b003a5fcae64d4sm19396556wms.29.2022.08.23.11.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 11:33:54 -0700 (PDT)
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
Subject: [PATCH v4 1/4] dt-bindings: timer: sifive,clint: add legacy riscv compatible
Date: Tue, 23 Aug 2022 19:33:17 +0100
Message-Id: <20220823183319.3314940-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823183319.3314940-1-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_113358_925459_138AE0F5 
X-CRM114-Status: UNSURE (   9.60  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
