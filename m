Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ECEC04FFE
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 02:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxdIgPjBntlo4CYEoQffLOspI+/6WUGiepBeKPWdsfI=; b=4Y8MwUok8fTmGa
	XoOi7HGE9r9t2IfUVF5OnBKKGI8+afYw+eGmoIjGvt9Iw2fz6Atpo50zSaJhM0tgnfPgTXCbASrrZ
	NTiKmD1VV7uR5GhuSfPv+Mn4oKUJ3uLd/acxPLgu/n0wQCxa3+6Z+9K6qWIfBxMAJ8RmlKyqeZ8nk
	YE9yJb2p/46hHlxbc3w0eKym6yxj/hOGlzy2LWTTQxbvqe+GGOfen5G45qGHH8yNPOolKI6Xwtlt4
	MPt2hahEtmwqSqRucs+tZ/jezjpk/VnpHt4gAtlZY+iQKgjlNO/vSRTiv+ocWvq/H38NP7EQIleb8
	XGliXNk3QdaySZedGH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryMl1-00000009ern-3Wrz;
	Sun, 21 Apr 2024 02:16:43 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLdT-00000009Vkd-3uBv
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 01:04:53 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3c750fd1202so497800b6e.2
        for <linux-riscv@lists.infradead.org>; Sat, 20 Apr 2024 18:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661490; x=1714266290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=kc1xxNK+V7iDukzwvTp7ZLDQ+dFAjyV+XB7pYKzSUJTT8GGaqBLSGa/5Uwd0CxrtBr
         MbRDn5UX6BhS9E4GmpgzErp+nhwdrKrwKPnGLd4kpdlvt7kouqzQ0VX8krS1rfFlIr6m
         ATjI+/NjFGoYTJN9d9u7jOEGLPc1zGs/SYUZdDtPPtZDSKgu/bsY4V9A4AOxtC0h9AYx
         9HmYk6zD3M3QsMX+6kFHZ8LyHWcnUYS8IZSj3elPe3SET38vokDFYXPWQrb3s68CSfrW
         o8qm+bGtkSR7eZGcIxQolzMKoK4QZDgIE0abIefiu+uSR1Tp0ywWAE6et8OBe1vFZbyY
         ha4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661490; x=1714266290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=UKHJxG/hAjNGrtMUVPuFcmNA+OfGF355vnc85gtnH4FgFTV5fBtNXuTdKcCKesDW8B
         j4GeIABvn6h/7JaXAW9kkyIZ7LU10KEWjArKUxjavw9XebKxC1rxpQxW2D+3pAW6ZvX4
         7f0klFFeLkBvFU1D4ngjOEnZwF23HqJrb1cXpPUMF+U53psFjghe0eFOEkSSaB8OCBo/
         kE3l6KmJhq8Ojp57QJoNazGmgyv3Knogrt/VSmfzhZ/EQzcOdFyAGOVCe2BE2xlFy+wA
         YERkr2wYg8O1u+JEL2dhrMkLphVGtcQjD3UiRXvGN+N2z9XOg5pXuvnklSedGvzvxaZL
         TzwQ==
X-Gm-Message-State: AOJu0YwxEJN01GOpX+ACIVgg0yN82+NTW7N1xG7yFhH39gvqOmhVJ1/v
	IX3QemJJD7THaKW3eQMhBWxa4EkfDEuUL63rD2tyJEX3zbBMSxKbsgZcBNCi+l4=
X-Google-Smtp-Source: AGHT+IHgwgu86RqEqJ440zaOibq3z3LImfEw+LLCOmkiUs5NeZODsGrPDbBsx/BKGgl/AQfbTefjSQ==
X-Received: by 2002:aca:d08:0:b0:3c7:4eff:f5a6 with SMTP id 8-20020aca0d08000000b003c74efff5a6mr5012320oin.36.1713661490626;
        Sat, 20 Apr 2024 18:04:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:04:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:35 -0700
Subject: [PATCH v3 03/17] dt-bindings: riscv: cpus: add a vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-3-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=1443;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=heJ5mXr7Tx2wdFjG631ibJba5Q6SNbmXVyEpdKm9JEg=;
 b=YEjxKtbY5d7XiWDTiqBxcSBLOYectVNJpbMqu5/jHCbEbZ5l1wJ+MUDVVz1YIIJGA01BgcnNg
 0HMrxLA6DorDn5h4tdh5RWRkwuoRsB+sKvNkmlQQwt6LlqImE4+EPn2
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_180452_047669_68970B92 
X-CRM114-Status: GOOD (  10.38  )
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

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..edcb6a7d9319 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -94,6 +94,12 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  riscv,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required in
+      systems where the vector register length is not identical on all harts.
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
