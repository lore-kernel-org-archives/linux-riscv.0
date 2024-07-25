Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D98CC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 04:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alKt62dpOT1KD875EgnNayCq/Q7UHyMp6gqX/eipFkI=; b=B8ZblZ4hnRYAEe
	lGRRpmXE0JUEAsnmNV/+/tdZYX+ymcBWP8xgUqVWCLms1yPrfM/iXfCniKMstrBjIyJ3bFhpVJL4T
	BFevCw6lZEKqy5nS9ice4qAePAZ9SFYTa7xAGRuWsX7RLBsO2To/+TZnlVMzzJc2HRwPoxJDukmL3
	2EKfMISfkdHsdPp7cUnaJ8gED/9jq9RPiL9vtyk3/8j5oInEwaLi16Xv+WaVsSpDerFCft3nbqVyZ
	GykiwNJIXu8niHCbjb46wyy6ayL7yW7+72HOMQ+BOzmpwN8O7r1B2Zxgu1JiV6C8tyHWGCKsH5SoH
	KoAdZeUAPeY/QJduYGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpuH-0000000HIKX-0cSf;
	Thu, 25 Jul 2024 04:16:45 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpuC-0000000HIIZ-1s0g
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 04:16:41 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7a1215dd114so359650a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 21:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721880999; x=1722485799; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=z/CfLpJxn4IyxhSJ9roAqycljvBpNVeay/SIMVO8+FxEAJl/U8tFYz4VIzDNv/AQDh
         a52u47GxuXloIzr4bG8IvJFeCqggduyRJk62amKwFALHD99jA30jISSSfWwSbTSqMW6p
         QSm0WjiUZvRqC0akfyQnn8dGhfaP4xr2o50xdg2AWWIwXdcEOMqbzpYQdhGynfgo8es4
         Zwq8gWLeF/3RvB6JXddAuz6cqqEQLWVaCEszedEp4WwkgBlBoWIWCubUYuaCl68F3fPR
         svQravrnkqOA7e6w6hL/RUXOpqwza+4YmQnQnCwb+sRxfdoP5bEbRIFpW/+aGKKT7T4+
         KSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721880999; x=1722485799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=IQWHkc+fCN28myNr6AzG36E4CImbK1UepPFG9d9/TqkDSxjT/mEReMQF04GYZb8BtW
         BQdKu+f9Gc+iFzME/LyA+W4HDGGSgpK4ilieyo8o+2XRyngqapWQCfwghqiMs0w47Ymc
         Aso7jzhFTdiurK5WzLsMXENJ5ZzT/0VP4Oj2mhESceAP6wm5cDrjWGqop+QAHwfd4d6D
         vPmZoGGEOGlyV5RdHhE4XQq/MuWMLXtU+q5IUqLkoEkBA7bmLJ0q0y8L/JXOuvxiiFGA
         M4qzY+LXX7Vpwddw1pZ5DDdvYNmKqZjS8X1AqlkewJUR4hNCj93H9feWypOfAT+dVO9P
         iYBQ==
X-Gm-Message-State: AOJu0YxNouZIeiFL8XXsxv0wP0dFcqt5byj5XiECGvH1S56IPaBX/jct
	pg+KrdQzwbUTgwg4vN5ZRpFFBwOtqkPnjMUUTifHOwXnlc4rmlTk8sShcx0p1nU=
X-Google-Smtp-Source: AGHT+IHBqouUd60StUuFY3y20z9rotElPmPvr8np0xp/cOd/5D5tZBs9q3oV3mBGdN2o0+1sfhUmuQ==
X-Received: by 2002:a05:6a21:99a1:b0:1c4:231e:8ee5 with SMTP id adf61e73a8af0-1c47b229b19mr919358637.29.1721880999516;
        Wed, 24 Jul 2024 21:16:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:38 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:19 -0700
Subject: [PATCH v8 02/13] dt-bindings: cpus: add a thead vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240724-xtheadvector-v8-2-cf043168e137@rivosinc.com>
References: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880992; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=lK25kSvuXBbjCsm1KOScKY69sa4rMHinL5Ye8aockR0=;
 b=U6hkM0vK7Fw/IQIGJFsZnHJIDTo03z/90pw0ylmD8Hl1YapQisvOP8xIEUjrga2P3in7QNuEq
 K4vTINX6W0gBsmwtfDrGgJt9ujpdnjnf1swACzykXFrMVEH2Gorza/1
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_211640_498325_A1FAD394 
X-CRM114-Status: GOOD (  10.88  )
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
index 8edc8261241a..c0cf6cf56749 100644
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
@@ -95,6 +107,13 @@ properties:
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
