Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF80C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 00:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlzR9XUC3RaBimlQ+O2vV/DOBZKH2DUoCQWEZOBWwi4=; b=u6rrlly1comfgU
	hVtpymOqLaCdKeuzMQJgbvaXN+V37Dw8obd+fKS+mLCJjsTl0XShcyl6o3IqACYX9gU8pNJ14GnQ2
	tuFi8tmw2Iu+MWisZi94W9GoA+p/9L8mIEUgnevIrcNNtrELlQp/4FXTu7E0JrEmUSekxY6UsoX1q
	LrM0oUw38jiXQs3+7uuCNBgDKC6l2S7rdpgRpe/e7b3Biuxxr5gHarKdGouTr2/6X0qKyGodxM7+U
	3Sq5KFqlUoU4GQp5+uu+NamidU4u4eDKvU0j69uNRKNs/+8X4lOIBE1ZAIeOgkqqRs9P2EE8aBjL4
	me4gcFlJ1sBfkOU5/6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUal-00000003Qm8-0VCG;
	Wed, 07 Aug 2024 00:31:51 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUai-00000003Qkx-3tIa
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 00:31:50 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70d399da0b5so1004914b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 17:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990708; x=1723595508; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8a31h58dvirjjptvxje9y9Mqcx9iPDZwg1ciuyTglV0=;
        b=g/JdNXUL6ym972kJaSmOLesukbCCpK/8JaW5Q2pBo+bwVIPssz8TmjSt/2qPpx4YDl
         eOy4ucf6k6CRTTknzdSHFiUmkLJJJ9GFiOT53sSpLGmwU1qNNUIGH1+IuuoCBOj2sDLh
         SjO8avpRc8hS0/wDfo+8vQUOVPgjMRAj4NLlJwpcA0QkNTdJWN+zl5LorJ9bcjTIuxmK
         /lYsNZGKwqm1th74IIQUKsLhMCaU/GgEjy4TiVfUdTRv5tJWjXbkkVznsc5uWxIJ7MeG
         jvXtKgYwqL3bib8vh6CEkjccFNj6aDDHlJ59zBVO5O7FTWNiPydcQt2WVJqH0QWbfcmP
         /BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990708; x=1723595508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8a31h58dvirjjptvxje9y9Mqcx9iPDZwg1ciuyTglV0=;
        b=Gs1FHEAEiaS486do9RUOZeSvA4sJB9/KLewWSzU2KK3X/va70gPVaHL+A06CtmIwcm
         7Fut9OYvylCC/QtDV0RVj61LUs+z0WsoBddWgD5CeyDQVReN9ECEbJKTHh1ay8rz7ETH
         qlLRroJ0JM3m7wPUcb4mCgyNV6qPrm5Ne/wrE4M2oyr5ZBKUMYFzIP0/+b4jV+cZfDq3
         yDAirnwx0o0CdBlrGc/k87QZu2X8t4md+M9MaUF638z+4DL3BJLmURZlJAWytcBveIwJ
         CB6UYGOf2spJ6vsE4Xx8a9e5Qapo4YB3gNtY5FGP9oa3FxaT6dUIgD8EM48oPDpcm4s2
         uUqw==
X-Gm-Message-State: AOJu0YxNoPmbyYoUkF5SvQamKSyI1r2D/vUExiL9JMX8B9OeQhFssABy
	2Cfz/1WcB+WanO+xo5JkHrp72f4QBtflxJqSAkpG+2oKKlenSdOXF3pR+92QcQ8=
X-Google-Smtp-Source: AGHT+IFlZgOw01pjcMoUd+dM92axczabu39jYLZiTwPJF7kvu/LR+bRd7eVCTv14rSm6HVWFrxdAGA==
X-Received: by 2002:a05:6a00:140b:b0:70e:8dfd:412e with SMTP id d2e1a72fcca58-7106cfd9d29mr20899556b3a.18.1722990707845;
        Tue, 06 Aug 2024 17:31:47 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:31:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:38 -0700
Subject: [PATCH v9 02/13] dt-bindings: cpus: add a thead vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240806-xtheadvector-v9-2-62a56d2da5d0@rivosinc.com>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=g0Gsy+5TQh3RSmd39xewdNDSsmzEd+HtR+40T1Y+noY=;
 b=N+0Xga663TzEPFBOSLMhnRrEEwkQ/6SLmoDaPhoQWHjLrgqgonGuO5TdqDaKrTXvQOAb1J3CO
 rYW8rc78xHSAy4uY9OvfHUczaGdel8ciuSTRy72vsYUO4dE58ItO39R
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_173149_009704_7BF919BE 
X-CRM114-Status: GOOD (  10.67  )
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
