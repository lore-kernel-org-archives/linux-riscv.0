Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C38D277D0
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRu4mwYQZBHwiGSOJuue9fKF/56rcFcfFcnQGI+htgc=; b=stvck4V85kNsFV
	G1Oag4VBiYarGKDm1QrC+Q05M3eXCnkUWzfgyiGMq7HKrIJtBNlT87z2wiJfM4W74qVrzH2tto62A
	abgWvIC4Q0+onC7rJr00e1oioQ2MMlh5puNfc4Pu13Z+n+hS+xk0EmTLLJr5tCRy3f9n3HgXY64G5
	Vz9UmyMh1Bfi64sS/I9LauKIWExxUQyG7stF2RIBfCkT2QUB78TJZHpkIL9F2Zy9cyLtlhLhaWoeo
	Ahgz9jlsSpv+I2+ZESHxcMjRpVBhPw15yIpEq54lEO6e3R6z5eB8VSFH8LQBiSMp4VxPkXgtkAuv4
	MrxVtYjD8PpzMc3gLXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veROW-00000003G8D-1BJO;
	Sat, 10 Jan 2026 05:20:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veROT-00000003G6L-0e87
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:20:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a0ac29fca1so34429125ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022408; x=1768627208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbchAZCHr5FOjLOm2QkYq+0AjxbAU/srw4MJShYSMvo=;
        b=GQLCVow3tHqM79nF5y1+KgDPR3jUEEgte9ljBFIAuJUPjdRlsCqHfWR1I47isMdr9e
         pdeNGqoCNBmjApt5Tlv4FraD/y7kJ6b584Xg8smRcCkC/Y5+NWhveEKm36Ie6ZXfNPZh
         G7ke7pTvbHp777pv1yCGLLbhnAVqpe08whM+cmcQLIHZQwtwx8z8wK3Dh5W5QsLeYN6O
         0myOuXs4xGB969wfsbrxGX6ROBwp9C4So8wRJiyF1/ZDFz/Lz2woBTBkjhX4yizq4EYa
         pUUpNlzm0Hc6f14WBvBbz3lfpF9A+C+3zTc6zBoXTUAH56stikXbbTk9JFisQDwHVAPf
         K1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022408; x=1768627208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qbchAZCHr5FOjLOm2QkYq+0AjxbAU/srw4MJShYSMvo=;
        b=th84UecEE9qP6orVutT3KUVSGFpk5mC5pMSmbbPf0SyfqzYJKUQ1D1FGr1ajvSQtPD
         EF/IVBpN22SZxJkNkYTJXradq0L1nWaVg7shYidR72wGVuPfVc/1Z5c4hSDt0DZtY7cY
         uFdmqPxFPx/tmHm241+P5RfPERHFdCeRW2Dsq38m0rJQLp3yOzC8/SmF1vQkykVHNIhv
         hx29T9SmAHtHsjmHnECMVUR52ervhx/Qf4vOkpCluud6bXfDzG9kKA5bAempW6J8SuvJ
         SIbTiOvVSvtCUTz3woHdXqVz2Xlu85hi7yd7RcTAgFPhMoV0R+qDfkAFicR2+jbWZ0WP
         jWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9pq4fjI6+CT5kTD6xA5FrpXXHxP2pWc1d5qn1QbC/4q6CNq0b9kIJR12suC74WrRKB/mKqNbMGSzvew==@lists.infradead.org
X-Gm-Message-State: AOJu0YymUK/Ysym/2GspdUYMbwZ1fZTGwG6z2yJsUlb1u5ITnbVJHdtf
	tVCt6OIvZUOhiaS/FRBDFRUYLx6jIRjUj1lZ/IBk9P7vyx+CTt/3Ov5d1+A1MB1ivxA=
X-Gm-Gg: AY/fxX7LfL+KbUTu8dm0uwB0l+QU/I595qzrAmu8pXC47SetqimtNuFKUbrAXwsIXZG
	kMCECcnZ4pVmb0/N5p/LXkJHbwVeKQcA6Zq6BwH5OHk2gYFw3PQwKXqRgfCyf93dacCJYkQ5ffj
	gXwo4QM+VA80Rozth6fjZykdIV83AeY3zjvj9kMNsuao+lrU1nVSRK49U/a1ZuZtLbLS70D6+AL
	eLvIvoNcvw8AmaU4UcmXxteVDOuE5PswTYACETA8GmnpxWaPKp+PcdH9tXYXzZrxwIcRQS8/EHH
	s2hdsgXd4DeXsghPLsGYxLBvbYx6BJs1EjWhOSrn6fjSbZ8R9Y4s8HKy+9WXiYzrR7CBBQIJ69A
	F9C3urSxmFiulf0YMWzaxFbshckDFP/WSjnE0MPFGcRuwtuvgQ0IGfJKP7tfuE8xEYkyElUjJFy
	f3Kx1IOPFLPq08mnEcLGk33XW2cw3oVLHNNdtESWZmCQmOaJ4hNbt32Q==
X-Google-Smtp-Source: AGHT+IE3azJw/I++SvkHmJwZU+zeSQFOA0tCm0OjoB2dGO96pk6muEXdu7wFCQPtmLiZleMZdyVjig==
X-Received: by 2002:a17:903:a8f:b0:2a1:3e15:380e with SMTP id d9443c01a7336-2a3ee4aae30mr108360315ad.34.1768022408419;
        Fri, 09 Jan 2026 21:20:08 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:20:08 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:19 +0800
Subject: [PATCH v4 07/11] dt-bindings: riscv: Add descriptions for Za64rs,
 Ziccamoa, Ziccif, and Zicclsm
MIME-Version: 1.0
Message-Id: <20260110-k3-basic-dt-v4-7-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_212009_566966_A4C89921 
X-CRM114-Status: GOOD (  12.35  )
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

Add descriptions for four extensions: Za64rs, Ziccamoa, Ziccif, and
Zicclsm. These extensions are ratified in RISC-V Profiles Version 1.0
(commit b1d806605f87 "Updated to ratified state.").

They are introduced as new extension names for existing features and
regulate implementation details for RISC-V Profile compliance. According
to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, they are
mandatory for the following profiles:

 - za64rs: Mandatory in RVA22U64, RVA23U64
 - ziccamoa: Mandatory in RVA20U64, RVA22U64, RVA23U64
 - ziccif: Mandatory in RVA20U64, RVA22U64, RVA23U64
 - zicclsm: Mandatory in RVA20U64, RVA22U64, RVA23U64

Ziccrse specifies the main memory must support "RsrvEventual", which is
one (totally there are four) of the support level for Load-Reserved/
Store-Conditional (LR/SC) atomic instructions. Thus it depends on Zalrsc.

Ziccamoa specifies the main memory must support AMOArithmetic, among the
four levels of PMA support defined for AMOs in the A extension. Thus it
depends on Zaamo.

Za64rs defines reservation sets are contiguous, naturally aligned, and a
maximum of 64 bytes. Za64rs is consumed by two extensions: Zalrsc and
Zawrs. Zawrs itself depends on Zalrsc too.

Based on the relationship that  "A" = Zaamo + Zalrsc, add the following
dependencies checks:
 Za64rs -> Zalrsc or A
 Ziccrse -> Zalrsc or A
 Ziccamoa -> Zaamo or A

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: Update the commit message to explain the relationship of Za64rs,
     Ziccrse, Ziccamoa, Zalrsc and A.
    Add dependency checks.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index f671299ac819..345624326e9f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -240,6 +240,12 @@ properties:
             as ratified at commit 4a69197e5617 ("Update to ratified state") of
             riscv-svvptc.
 
+        - const: za64rs
+          description:
+            The standard Za64rs extension for reservation set size of at most
+            64 bytes, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zaamo
           description: |
             The standard Zaamo extension for atomic memory operations as
@@ -381,6 +387,27 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: ziccamoa
+          description:
+            The standard Ziccamoa extension for main memory (cacheability and
+            coherence) must support all atomics in A, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: ziccif
+          description:
+            The standard Ziccif extension for main memory (cacheability and
+            coherence) instruction fetch atomicity, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
+        - const: zicclsm
+          description:
+            The standard Zicclsm extension for main memory (cacheability and
+            coherence) must support misaligned loads and stores, as ratified
+            in RISC-V Profiles Version 1.0, with commit b1d806605f87 ("Updated
+            to ratified state.")
+
         - const: ziccrse
           description:
             The standard Ziccrse extension which provides forward progress
@@ -783,6 +810,18 @@ properties:
         then:
           contains:
             const: b
+      # Za64rs and Ziccrse depend on Zalrsc or A
+      - if:
+          contains:
+            anyOf:
+              - const: za64rs
+              - const: ziccrse
+        then:
+          oneOf:
+            - contains:
+                const: zalrsc
+            - contains:
+                const: a
       # Zcb depends on Zca
       - if:
           contains:
@@ -824,6 +863,16 @@ properties:
         then:
           contains:
             const: f
+      # Ziccamoa depends on Zaamo or A
+      - if:
+          contains:
+            const: ziccamoa
+        then:
+          oneOf:
+            - contains:
+                const: zaamo
+            - contains:
+                const: a
       # Zvfbfmin depends on V or Zve32f
       - if:
           contains:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
