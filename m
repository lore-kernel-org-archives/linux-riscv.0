Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D67C10F16
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 19:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxdIgPjBntlo4CYEoQffLOspI+/6WUGiepBeKPWdsfI=; b=Hayqa10edRl7S6
	xoYmRydw7YPsAkdlIPhKtf2TB2dJlCbxObOVUfnbl1d1CIRWRi7FuzHKqcsQjMEPHOZn8d3z2QCxX
	eLrExHyqcRMec5qNwDQCcT5fkTJGPw951DuOMCoyVVr1F8DFd+neLb3AWNFUh+dii5i4WqyCjg/WA
	0KiL7W8WEjttvniqdNjj4uNyKVsbzHuDv/orFZgOS/YlaKQhU3UgD2zqmkFEFbZWz5qKmH8NER2at
	fzRs/u9I4YXHLnbQ2SszgCF+M0t8fMG9+CKO+fEMyOlgW4UIqx7pn3GKkTgYHZRQzIPS5Ips+Ax80
	IKYvXe4gVDpo91JKqsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2yd4-00000000Aje-0ZrB;
	Fri, 03 May 2024 19:31:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUi-0000000HWuA-0pas
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 18:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=; b=RWQO5by3YyB0yVklztiD4JXqr0
	fCRcPFlSXAazmeF1hcJJqUwQMVffeyaUjnfx7XqK0mr8u9mZrrtHag/XriUhJzmI2bfup0hjFPRBr
	2E3cq4HSreshyzUQJmScjji1YwZoroMJkB0kLI/FvWC2zYkKU2E04lv8xTxInEINv+6388gNomXeF
	zlJpnpuLM9LlH6Uh6yv8bzqeQHO+XptB0URLqMAYVk6wWtUM+59egktSuFhhWbiYAi8GupVC5EbC2
	5Gk5MDFc1i8t4wjxXUaGQKw9jyiFJoXcqpt1swSC5yqXqqLKxa22u2xlZcjimUwriBK7WRqHwQSnm
	JIJ1sEoQ==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUe-00000000dn2-1YvW
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:18:50 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6f450f43971so638b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760325; x=1715365125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=UVFQyTiBAK1STSlOPNzR47l5V/oxxaEzsGKt5rY1Iu243nVc6dAAdEPP/oGYfifMFx
         rlTCscHz7WaWG7f8ZnDxjqIny4MsNJUTv77jTeHw4RbwZ/2YB+hTUYfcZzbVCW4b2hn4
         E1EThqBo7s2ZsoQaeceXjOmRsFl9GAQvU0RjjgEbrtTECQlUDFYHR75NZrzkmxAqhPRC
         kQrcrWN5twcEWMvs+D3LrfcG9ZR0p+zk8PX8dONWM2m5DP93pFOp8c/2T+H+SvSrQmcF
         WDM63Zm3I5Eygvvf2t42yFoFO2zAb3AC6jkKQAuAjHTloPdYbP5KEvLzbJJnMmaOWhL5
         xhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760325; x=1715365125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=UD/ejt8Feratch+pgf8jA+IhYys06/TcQMrdf7yc57HIJKB545UchBcormThRvY0hz
         QMoITW1geN4PWFdDyGWp6dnvowUSwyo6sWJSFZzcO+NAjAW50WYup76/D1vgqoYNy7wu
         lfShFivyyh8LYrCYxs1Sd5p5G6TAyhUiZU8UAjjw2POWWMLrbEoEkxQBNqQ7/YbgbbKE
         NAhDx82Gj8NAVxvlHaDuJEbJpmMmE3A3VsjBt27zlv34z/0IUMYkoX8bqtMufA/mW5gM
         NIvw/CzyFimcP1PkHwyJI5c/5e8F3fA7JpLWkAGmYhqpNph1fD0HwySfP6QrO6LhZSxS
         jeEA==
X-Gm-Message-State: AOJu0YzzgFpZzlkx2hXZsKq5b9Zs4u8StPyIlx1qOi+uE8r84v6vrPWZ
	vVkjxLi2ZDxKi/aSLmHhZK9p+gPKvjU+DwTlA36i31ewVJMZYHY98cgm06X99Nc=
X-Google-Smtp-Source: AGHT+IHI30fGwc5aCXifihplnCqF21Ywud7b+pXK0ZB29mwiXSifKnIROgJMcOan1fwlZbT+pmL24A==
X-Received: by 2002:a05:6a00:22cc:b0:6f3:ea4b:d24d with SMTP id f12-20020a056a0022cc00b006f3ea4bd24dmr3830280pfj.9.1714760325524;
        Fri, 03 May 2024 11:18:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:17 -0700
Subject: [PATCH v6 02/17] dt-bindings: riscv: cpus: add a vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-2-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=1443;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=heJ5mXr7Tx2wdFjG631ibJba5Q6SNbmXVyEpdKm9JEg=;
 b=MANeivyUeAYOzXwSGR3gfRRzHTw6Pw61Zb5xoor65at3CiK4Ie+9408tjDxmq/csHeP+IJG6P
 N8Zi0GEi+JoCtDK4iOsRWQHVE5uARUc0GT4i6BEO2Bc0gyaUqRWDOaf
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_191848_493412_A1E1C6E4 
X-CRM114-Status: GOOD (  10.49  )
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
