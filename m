Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B01CD5BD1
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 23:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSf7dVGh9cK+NyitVKukW4rl8NVx5OFr6Qq4oBNTPp8=; b=NJABCw6D72hWBJ
	+tLAGZof+Dr1bKhjLJCtQuXEnx5668/d+pZPUv+GB07Jver9bz00SPAB7+Khn/GciAai+ISGOzBKi
	hNwJDLDYxU7EXaIlkT71MdSkKK6lQ1T5D3e36A7K++vG9v0nBbr5LANWWC9nKCb7RRPCLmzBvrGZt
	vGaBolt8QQ2Lnyvq9gBnMZSur/P5hfjn1KRTrm8weyox9kORpGRAasqmbOGy2ohhZ37A+iHYdE9CB
	jt/3Cr64cxy2rHflcbozcTGAf3khpC+F1Kp3+uIskjLYj57Xw34E5tId70IknQHiWluLOJTEYOUC5
	tpzJDhHBY03K5er//1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYJE-0000000Dvj8-2NAn;
	Tue, 02 Jun 2026 23:14:08 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYJC-0000000DvhR-1WOF
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 23:14:07 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so1161469a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 16:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442045; x=1781046845; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LXe5fflvRfl48si4k2cnzpQ6FQhY8QPALZuyX6O/nI=;
        b=BkQhY16mcEOKIjRpmTvZJy1P4uPLb691VvE0yXECW7RFpm0PFC+KgP6SVgyghhi7qC
         KfQQ1bXgzLYaBIIFAqXmN/lXCvnEiF2VZkF6S1LIvxY1IIT5BgSEcodq/XW6RWMIcLxO
         wN2ftr8wBYRJfj6PxurBkfX3ahmbHT1eR3sm24KFzbPtdc/9137PehuLICWOE8pnW0zl
         iSu2tmwMTUHTaO2NxRIyXXKWPlzmRC4inPj+MuCmKoItOCiW3r92xkEK4Vr2SEt50XG0
         LxgJkALEPN6nxVOVqwvbynaChgsoAoZ6OvVenioorDppA3rxuVesvuZFWGDYBntQpf/n
         2rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442045; x=1781046845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0LXe5fflvRfl48si4k2cnzpQ6FQhY8QPALZuyX6O/nI=;
        b=pySuVCJr+zkenoXRor7EWnr4UHsPxfiVeP/EnUThTJ4dtTKsm6XUlzDu6xTrnGzFDf
         9VkAQyxVO7Fgq9ldWSDsngBgJGvG89DJHKvztcJW8DbYR4ZSrqzokzEw7MYtR2gQTjAi
         urvxruhu2rYiRaXgv7vNgT62X/3GFPMQC8aitv690KPahASIkAcJ2NflDZAPTr/ddQ3o
         Pyx28rAOAuuxxMwzzIIRBRzK5e1zVgQakS2DbKUa5wo+FZ3Jo/p6TdBeRcvxfV0C5DzS
         ff0EE4lVS48f+yxqjlYxQnOPEVsp4tjEC37ix+fxXvRw4J1GF/24EqsDE54emO1NsVzD
         nH2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Qct5BpgtZNKv7udgW+foXa+vzWZfLy+NpKcONIol+z1BJIxNpmGSDxcgKzZAd2eGWVSf+CbGFiOuqgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJdsnRoOpA528eIAzYSW2XIHA2qlAn20uWUcby6HmN9m9ZMkh8
	f571jAuXpiToI3/UN+2Y9NhMoVkR74hjQow1YWpF8Vp6FbE3kbyohA9c
X-Gm-Gg: Acq92OGKhLcoJhEU79zloLmU7V2TmfiTjDYzVbrRTDFkOPiXwvLOX2n66L28Fp8op5o
	YCTAbhBqh5VWgNOMHWCHV01svHHKyKCtO6snCRkaCyQgL09Fnh6UNNX+brWwEzYOdqTqF/It7JS
	pFVUgpHxyC0m2M6WCjiWC9y1DJfbCyky6PUjbUP6g3XvdqkyMYYwfVkVT3vy2u5BBPBPZcwvD8c
	dEymQ0ZPD/kOfFsl/HWg1dfR/v5fbwXkwH02vaUC8qbfVfE/hDR6EvFc6fEtnqIkGLHL4+rkIqW
	lAzI1Nn/h+2FeepA4V6sbfKLwYDlIm34haMHEcinNzxEqOaFVqbJd0AwdHvs/pEG0lOD9jflPWY
	POtUwlIrsKSibakMUVSRnTYjLqgbqsc8GvYr0rDH9sIJr+vpR/wRWspk+zeNnEBQB1htNkN9BRi
	e+OHwv0bzHhQ==
X-Received: by 2002:a17:902:d4c6:b0:2ba:6bd7:8efc with SMTP id d9443c01a7336-2c1644dc902mr7074735ad.40.1780442045431;
        Tue, 02 Jun 2026 16:14:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:14:05 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:02 -0400
Subject: [PATCH v3 07/15] dt-bindings: riscv: Add Zic64b extension
 description
MIME-Version: 1.0
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-7-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=iGkU1xGI6N0CG6KK3Wa2Gjx9gV+MFto48jC9Pj8TI+0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHhZX60yng3sfSKyeLnNFOnCOeau1WPd/DvXlT9Msl
 vy5zSPbUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABP5eoLhf7ZSe7qiblJtxs30
 XtUralUK+yu+KhZlh9p7rtwxO1qzgeGfHcvSFV6qKy/IL1czmcDivZPrbkamCJ/8EevA1Zzcfdz
 sAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_161406_414285_7AD48D10 
X-CRM114-Status: UNSURE (   9.54  )
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

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space.  It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions.  As
Zic64b is the architectural guarantee that the cache block size is 64
bytes, also require a hart that advertises it to report cbom/cbop/cboz
block sizes of 64, so dtbs_check rejects an inconsistent description.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb214..ec1c9473d4256 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -590,6 +590,12 @@ properties:
             in version 1.0 of RISC-V Cryptography Extensions Volume I
             specification.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1142,6 +1148,20 @@ allOf:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
 
 additionalProperties: true
 ...

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
