Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2486ECA0EC4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 03:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oM/dRTODRPQie/G/2710QQiL+sEUx1r8UOPeYMhZVrQ=; b=UJAcXVOKED3W0q
	ph65WLSe0zUYYYRYjFLiTB2maJOX0Q0tpSzIZ6O3HbeVZoURpwdl8ssQcrUiCRAYTA2Nc+eI4Gnrw
	sgrdK37x8zM2arWAcdAaHSoujE5FZmx09zm3YlKBuFfxBiHc5gXZqbc1NX4dH1DPkAL1oiosAdypi
	1gW1RFO/2nlqIKebP3ODV2w9UW1z8YaVjt7PAn6HEPqblUaZ8Wc+TXrl3KVzrK4WCW3zAK5bXfxjO
	HIJrZEuFrPCxHhQia3PcilVtMuQtOn1ndjfQ9mRZsheZeJ46I2IQMmBuHFSGYTEVT1SfN3yUFdTPE
	bvmc3ZrqJ4/1VuQYw/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um269-0000000CVlB-0iAY;
	Wed, 13 Aug 2025 03:24:21 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um23n-0000000CVSp-1TCo
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 03:21:56 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3e3f449fa6fso57677635ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 20:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755055314; x=1755660114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZh5F0QX3EknECzCmYMfb9xtWVRUzlviyKurejiq7Q4=;
        b=ZmtroKH6y4MtVC4+/aJYd9nQbEATdI0ZY4qfgTvodDYCWSUMYCgsuB7qLbmJDcCDS2
         vMkqx+XeVIWPqMTW2aqPX/0vEjPg/uNaOanGe6oH7JLi52KM/VfvpzSIWiR63uz5sZvt
         4/kNbOU03GD0gJn7fsXTBX8FJJAs8GA3sZ/3qsWekCQOaH2H4lVMaboaNe8X/Y5q5O4/
         wsiYE5kyahmhVimxGe5aEx4nvjoXh1RkUkYR4gVaowroslEedf2oQDj38H1jsnh0LXM6
         878aUqVPIXZZaucCUOtxy5/6TDqgBLieht9tPwIMmnxwc6DzVB4VZ3uHxX5TgCMwYhFq
         Gg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755055314; x=1755660114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZh5F0QX3EknECzCmYMfb9xtWVRUzlviyKurejiq7Q4=;
        b=r3sjooDLnu4ZX/vo5tRkhZIN1cTSsQLsO0AUSRuiGrYhG/hsvBYpahk/hVjJfASxuU
         Ba0u4JdaucGjkEjMMUMePVe+lPFugZWzgbn7gMI18Oitkg/sn3qcoiHxIz+5r5plhlj8
         BrrOYa9qsBnQ9oJCv3byMsv1F31uxFHHmiEgsAE3bP+y0ymWEL55jdL+UkaXI44bjq3P
         ZP1MkVozi3Y9JtErBp3Xgu/c6sBQ98aYzqxOSr0wtPHkDcRDyyvzv3bzDM9czxBWSmOm
         ornOQnFaPK7xi1V4WHN+A7NmpZts1SlsYQPwRd6guVPOb6O+jAJe3PItjn56TlMnf0Dr
         WSXw==
X-Forwarded-Encrypted: i=1; AJvYcCVaM4bul6Hz8ovAw8zO4i0EgXxoYSVw20bgWWU/L7EoTmOSKCFHvLBzq1SlZ99TtLlBcf8DWnhSCuNZUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9PsEOxvaVum+V9ZQhJVBlyJ6BfW+6OsucBAP2r0pl6n+pyw7W
	2MDXeDaY8xiu1hAaD6VLM6EUVJx27Vq5IwKJQcXSbCiB1/Zyx1cLV1wC1N8c3wc5Amw=
X-Gm-Gg: ASbGncuHiZLsO7r99Tlf1Hws1ZSug+gMbhmm4iz7hE031LIS/g7R0DrPcW+AvTemOs8
	bu5LK7jQnAlTsXqFu3/cYZLFUgi33B7yyHqTaLR3MPHxrWt//EbhH+QjI8iFxxxxzN/AT2QnzjQ
	F3sC4yg2MBetj/vBtrnfVTbhE69ZYGDpGdog3zfjHvHhf5947dXezbweFtBgtMMc1EXRA7L2c1T
	hdGWN9NR/5DtK2BczRj0eD2LG2uXnooYKGvz+8rDkdiYLNYEKTOQypan4xBnrNbRoKY2F1khwv6
	AfdxBwWP7+DYMStL3ZJljKk8J0V0titmoLMDZsaEW0wN5iMhnpaWK3rk0/XV65nemHiOU24T8Jd
	lt6zkJ6b5zGNhJcVmKRW5MMYvr08gNs8gVcuZzyfBAhkCzfiwratE57O3HwdMhFXhyA==
X-Google-Smtp-Source: AGHT+IEGjkB4ovYyLSKxeQ7O4Oh8jWvGVbE2gJKsffKwKHW4yl0n/kstE9uKuxUw+5W4Y4U9OyRJLQ==
X-Received: by 2002:a05:6e02:17ca:b0:3e5:4c7d:b799 with SMTP id e9e14a558f8ab-3e5674713f6mr23473385ab.13.1755055314466;
        Tue, 12 Aug 2025 20:21:54 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9cee258sm3453085173.99.2025.08.12.20.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 20:21:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: dlan@gentoo.org,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH] dt-bindings: serial: 8250: move a constraint
Date: Tue, 12 Aug 2025 22:21:50 -0500
Message-ID: <20250813032151.2330616-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_202155_386831_576FA1DA 
X-CRM114-Status: UNSURE (   8.57  )
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

A block that required a "spacemit,k1-uart" compatible node to
specify two clocks was placed in the wrong spot in the binding.
Conor Dooley pointed out it belongs earlier in the file, as part
of the initial "allOf".

Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
Reported-by: Conor Dooley <conor@kernel.org>
Closes: https://lore.kernel.org/lkml/20250729-reshuffle-contented-e6def76b540b@spud/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 46 +++++++++----------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index e46bee8d25bf0..f59c0b37e8ebb 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -48,7 +48,6 @@ allOf:
       oneOf:
         - required: [ clock-frequency ]
         - required: [ clocks ]
-
   - if:
       properties:
         compatible:
@@ -66,6 +65,28 @@ allOf:
           items:
             - const: core
             - const: bus
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - spacemit,k1-uart
+              - nxp,lpc1850-uart
+    then:
+      required:
+        - clocks
+        - clock-names
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
 
 properties:
   compatible:
@@ -264,29 +285,6 @@ required:
   - reg
   - interrupts
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - spacemit,k1-uart
-          - nxp,lpc1850-uart
-then:
-  required:
-    - clocks
-    - clock-names
-  properties:
-    clocks:
-      minItems: 2
-    clock-names:
-      minItems: 2
-else:
-  properties:
-    clocks:
-      maxItems: 1
-    clock-names:
-      maxItems: 1
-
 unevaluatedProperties: false
 
 examples:

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
