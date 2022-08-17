Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4438EC2BB41
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DR7nIppwZSR/wsQ4V4hp7JNcEy5qXTLuOIGhLvkU5M=; b=Haq9y2acsG4VHM
	AXpV4suYJnc9xfZkuNyUzxn+M9gHOH3mYqG5yQefv5oAoaxdgH23/mjZuTi4W+F5IfqvYxfH82zo3
	F+FUpubnf35+1JO4wnJJP0IOTzQCvw5Tv+mTJxJ6aRWQearnAhIEJEyFdOLudqpTbXVUZiBECAp96
	eoJpmGwleWQCaV8SNGwa5cjfYDovXwM1jx4NB/4oNUI/DhmZz+/rDMBiqvlwoBneENe1DTOWPEAQ/
	AVMIb73UKK2Kl2H8tXez4fp1MS+ZaDhEUsnwGx84exQQFUMdlidW+zM/lZX0d4uDcLaC3s5slNvON
	Thimbug/TVtTm34GFmeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIo-0066cb-PY; Wed, 17 Aug 2022 20:06:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIg-0066TS-Lw
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:06:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id n7so6201002wrv.4
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
        b=AeJIiHm9h3I/Eov20f5hm9jFdNKZoOB4Jm6+CCfujHehef2vYBlAHYHSx5/YrlWtGy
         uwOBvhI96+/wdxcUYt/7toPQmj4t0R7CoZ7AyNypy40Yp4pB0wOibbFOUSqHZ/xHuZY+
         a5AbbRHn5YtRY0D0gKPtmjm/2hkhkJrpqVZ72vi2GO26mLW9PDvv9Bybx4U6HbVZQ509
         m8j1y5HSVzo5McL0PRSHDvNJfP4bGBEOmQ7YHJDmQ4AVZxCcIjWIUTSURamn6zVm0hYx
         tZIvcSQZwjZOSNVtG4bAxh1Ql8CBw+SvPUU8vlL66yaGZadxHsoKbpUfyorMa/vTna1L
         QXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
        b=hCLh+J3co+QxUzXV76boIp+tYqe5YN9dZxK+Yh/6D1Kl5HuC5nufERuUuSJYhsVkqf
         YrxFTXXkai0uAuPHRElrjhUA2DBdyqpdYnr7EfQ4vT2JJjJWJ43prxVGAjFmcKvUcptz
         MTVC48JGSvEPjiA3xiHSCRW/Y9I1O7z9hoc/4ZjqKAMPRTCpWRmMyrgTld0DyFBEGnyz
         18+dFTW5oBvaPoM2YY9p0mrlbfv+dDuIxHMmf7R+Me+c/kvk4Lfl0FVA415CfSDBNox5
         A7O5mTEMQb4H/zTyFVnCMUpTMjQRDq/bKh8HIn7P0bPOII0rAJb9FBGU2EX6GigBPIN8
         HPQw==
X-Gm-Message-State: ACgBeo3ul8JjtHwHrdff3bmLtKCtXE1UpJB1STlnHIqhdMjNHHODLbXN
	0p8Xh28r6av9M6Hkt6DKNuGXdw==
X-Google-Smtp-Source: AA6agR5ISPAA2r8H4343y7nQ1xvi4vK0fSr9VzDNPaY5Bb1ElOubBSAalLLrbPfbH95opdbBSj6WkQ==
X-Received: by 2002:a5d:67c7:0:b0:225:210b:21a4 with SMTP id n7-20020a5d67c7000000b00225210b21a4mr3350305wrw.677.1660766760597;
        Wed, 17 Aug 2022 13:06:00 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:05:59 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: timer: sifive,clint: add legacy riscv compatible
Date: Wed, 17 Aug 2022 21:05:25 +0100
Message-Id: <20220817200531.988850-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_130602_850745_D4792660 
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
