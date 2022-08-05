Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B978C25B07
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 16:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxNigfRI6y8EwBLzEaFRnWMPeu4I54XbJkBdA3+Xu1o=; b=vVJq9LFzcJKFiP
	2rxzWS6ioRQj1YDJ1XvhpuLX1ls4xG0KxgU2TjOR8/Ij2yAzUybAQwaO8Mc0m4Tux+qrrAlgU3kGD
	ZRS5CYFZdwjVaD+jQY8w72u/UcKcEZLlmE/cLUg2vR9q/D3XbgUZpXtyvcF66z3YW5rB9n8Fs3ESu
	qKPH3X2yeaOBWwOHfkOt+OuxZprAOBC0Ze4FkzFTjx352OCvyxOnqHVxEqoya6PsK9cW82I9ZmRdp
	8LwrG2RQllfohsJpvzg3Tezg0Z0X2Jm2RH5abDBGd1Q/U/zUqKP+Q2zTuCdpdViZtU1k9DyDqy5r5
	DUT0EN3wAR1ZimIoZPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK0CI-00GkfL-5k; Fri, 05 Aug 2022 16:29:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK0CC-00GkZz-O0
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 16:29:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id h13so3813467wrf.6
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=E8iWEu7u72D4Cl4M4gSvZHsI5dQSubGoMYwsdu1FZWU=;
        b=SagV/jMHKGASMD/cT6X473mBlOlzicU0AUDh9UambssZ2tjT0QWPfzhpv5CU1qTNOe
         Ddfy8c1bQ1yG9CeR7FDMP9QknXMcfMUE+Byise52p/JiaVA4+W+VBztftsDouBAa3t2g
         2nRb2g/0ogD/BhxbNhJllKgVo1/L4hSx0dBiNp+l+3Yc7/Hwl01vZwawaVOxi2sRM6Iv
         +YjgoV+Oxr9NNxstRTgtAOzHe7S1zyhir5a1faOe3uBGBp8cVeuY5bGDp1CHzkixcPtb
         +TknqsGOz8YK3iQID272GlVw1lT7n35nGKQ+PgnmF7eMUsAREvkNRwlFU0RYzPqyT7cU
         OhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=E8iWEu7u72D4Cl4M4gSvZHsI5dQSubGoMYwsdu1FZWU=;
        b=JIronXJ6fyW2XJBU7tf5ruDLa3CKzY6dIBYw6YxrhNVKnRC3o6W9QRtr4DqndCI+lq
         GL3bHesQ4Vowib1ueP1yrI3uen+2mBmzEfB8X2nuRkm9TNwTCWonMpIKCIyoh9Gekokj
         hl/1P+6+Y5PKqxTUhygQWRvrTlU1oapy+aMwlvZios1Xh4ajV40FeAU/3evE4spyzMtH
         N6VuzcncXFC42EtAKNLYb3EGWTPbU1uK2s9AdX0L7wsV1tTub7IepFcJ+tzmoY5RRpZl
         zjivfFdeOabNSCOB/VCtBMEE2ssOQSbx45BFlPggl8PFh3ePRwymLWHTrURfkgO3Hi7L
         JeGg==
X-Gm-Message-State: ACgBeo1xIb7YJ2+iFwrOTQlP0U8PBbE3rjhkH0wABvoau2QGqfhH613w
	twpFj+8TY7xLCDaJuAfmcYmhJQ==
X-Google-Smtp-Source: AA6agR76DtGocbpsn0OQ/xj8+vFW4/LZsUFl+//i/QybfiOJkv1KkQ6JSE5TvZgiPLEA4ARS2OZxvA==
X-Received: by 2002:a05:6000:2c1:b0:220:5f91:62de with SMTP id o1-20020a05600002c100b002205f9162demr4920411wry.715.1659716944614;
        Fri, 05 Aug 2022 09:29:04 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id b10-20020a056000054a00b00220633d96f2sm5210086wrf.72.2022.08.05.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 09:29:04 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3] dt-bindings: timer: sifive,clint: add legacy riscv compatible
Date: Fri,  5 Aug 2022 17:28:43 +0100
Message-Id: <20220805162844.1554247-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805162844.1554247-1-mail@conchuod.ie>
References: <20220805162844.1554247-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_092908_837073_4951DCFA 
X-CRM114-Status: UNSURE (   9.80  )
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
index e64f46339079..9fcf20942582 100644
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
+        description: For legacy systems & the qemu virt machine only
 
     description:
       Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
