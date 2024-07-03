Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D208C31D97
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 05:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C34G7eiB1usLtlLES2Z4r8lR1ZDtF4BDhgZJTjs04cc=; b=02rM44V72BfsVj
	IirFky72vgYZi8hVkaSHHFTdJmL029b8dWPJGVTM255hId9W4jo6IYD0+rfLEmrb4VsRDfjk5UtfN
	1QG3VizapXFnwXxEx4/kHv0pMmSPE9FLLorFItlTLzVHyflUpP4oK9aEPUTwSbRud+bbQyVljiVJl
	kJqTamH3pTYctk/DtI6gwLWMEfYDAVXckVeE8FI4/1tezbp3o5w4AuNMlQXd6u/47sMq1lmQfGALD
	sGQVrL8clCaiui9ODR4v4p7OxoVV9OD9A8rfcYGNX0Iz/Ncw60QEfM2O1JmaAsviBDSdf4noeGh2E
	LGCuKOZ77F6Y8FgGn2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszI-000000097bi-2NGm;
	Wed, 03 Jul 2024 05:57:04 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszF-000000097YP-0CMA
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 05:57:02 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7066463c841so3374221b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986220; x=1720591020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvb4pMcEXXX1e5OzNfenqDPpdltXx8EJmOCnYZEkYzU=;
        b=V2YieTqx5fOl3UYWXWHADvq1/c5Khj5LXLYgfVxoVO2pAqvQo0+1YGUMBJ9hVQ16w7
         B3aZ24uwqb/5Lu5c1H9Q5oW+Cwdjt/p4Y83pyIdRjsy6/AJZ9EA3uCfHiSHNbi7s664+
         itkkzh+LNCetZZonN09n5dOhhBdNbxyxZn2ZmZD9WG2n3J0E1H0+p6G+kZ9Sd7mp9pO4
         LJVIOWsJe4RKr1wNDsHJbnYyQDNbRPSvH43Lo6vyzlbMFVr839Upw+b/cg8sTK7Pw/8Q
         Wzlzq+UF0URo8vdnOQaL9IrrftmW3J6uZQsSkegmjQ0/Ab0G+BTqM/fPHpbNOg7WWaPW
         aZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986220; x=1720591020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvb4pMcEXXX1e5OzNfenqDPpdltXx8EJmOCnYZEkYzU=;
        b=l1sH7q6jPoeAUUrpA63Rvm5sAltXP3yIbPkMiKIAoYyHLJhxyumrtOv0i4wZeUjSPA
         GZ0qA9+vrF2fXyGa27BDVQz6fSIg6wP0ktv/gjDKTiHAKANk+Kyzefz6JhMRSx+FMsVL
         jk96ieuom/M9gCcpS+GZ7lBNK1+jxb3dFCDVBc03IB1dZ8liesKUjBlZweGCKx/Hchve
         wES4VsVU2QsowmGhGFo8rRTiZ2KFyniQXCUuJ94kIkW6MxcFtymD0Q5OqHUi1FoN2Ycw
         //5ybkl1Qsz/Wm4YOA1vjdAbH5PBHuguhTTYy5pFjYDu/Iee0Br8LHX3cChwilJCv9gt
         jF9w==
X-Gm-Message-State: AOJu0Yw8DwnCo2HNLN/+3JeNynLAthA3eIfODy38hOQqKa5h79sSEIei
	DmiUsnzLvUZntR0nLW1FPgyhz6e9XyXFyT7U/ngzY2qjWC+09c7pW0HxHlVxWU8=
X-Google-Smtp-Source: AGHT+IHLVcP+5wCJ2jwS/CgMPoNMxQPrRJSB9/pQwha3z8vJTHncXe0AeYe1DVxk7ScihGO5viYKrw==
X-Received: by 2002:a05:6a00:2182:b0:704:2f65:49a0 with SMTP id d2e1a72fcca58-70aaad29ae4mr9792181b3a.5.1719986220111;
        Tue, 02 Jul 2024 22:57:00 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:56:59 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:22 -0700
Subject: [PATCH v4 02/13] dt-bindings: cpus: add a thead vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240702-xtheadvector-v4-2-2bad6820db11@rivosinc.com>
References: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
In-Reply-To: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=t0lKihrW53hhAaTgt1IOAxGTxDQ1PTzmyeVPgG0X6VA=;
 b=F9natkpNQeWQ0v/3ry0X4JGFFC5bIc/Zo5uS4eTscrupHmc6YgR2ogYd/qmhlUPN7U2yO4UGh
 F7phnYCGJPvAFwA0cHczIEScc249KA14Dra3bP4QwloPgtx3Y+Q/a3e
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_225701_140064_C051EDDD 
X-CRM114-Status: GOOD (  10.96  )
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

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..a6bbbf658977 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -26,6 +26,18 @@ description: |
 allOf:
   - $ref: /schemas/cpu.yaml#
   - $ref: extensions.yaml
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - thead,c906
+                - thead,c910
+                - thead,c920
+    then:
+      properties:
+        thead,vlenb: false
 
 properties:
   compatible:
@@ -94,6 +106,13 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  thead,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required on
+      thead systems where the vector register length is not identical on all harts, or
+      the vlenb CSR is not available.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
