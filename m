Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABC2E67806
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O95UFC16Tez0YTX3qpeGjj/OmUauBypQ+GmrWqkFe/I=; b=SeiDL6r/e4U6pa
	+EgDd+Y1CQFgdoFkQUnxOR7C2XYqq94LYwrcFz/IUzpVktXmyJmT8qviXoxhokyjOGHSdtUiJRYbP
	p4IAYQnEyOR6uRI8C1wY+BslxVweJ3+zsIst34l67YGw5fao48sodxJHJk1s/c6BuAKCqFF/wphKB
	ikV/N0gYYqxsqnWvtsFE4ijJVz8bp1VocHvpjdAZXhoUoXPVX5yqGJoFWPWP4ctL6gcG/D3Mss5wU
	h+7Pz/kLVlsdSCEQER/9hoz6ZiTEnGiuvjCCoZ3optXr801RNPIK8fbU2xweSCZNNQPpbtdbfaKuR
	bVaLuBijlKD0qMKoHffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7VPS-0000000B7mB-2z8d;
	Sun, 03 Nov 2024 07:52:30 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7VNe-0000000B7QK-0NV7
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 07:50:39 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-720be27db27so2481895b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 00:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730620237; x=1731225037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHcOCAQRVF6wDwCpz/Ofc5RAAihYPSYxf02RxaoduNk=;
        b=hPmIvM9K/3VyI2b0g3B0rXnz9E9tygNI/zg+giYRi2OfFC/1VjbKXz5dRhvGI5wU3B
         RHI9aLTWif8LubHDCqZhBtw3DmLazuX5D3m731SpqqelUrTmh91ybXO75q5LgU7NUrHk
         ZwsGuN9UzsnW/ht+3EJjfRcnA8vMvk7Vkt7hbmi0rYmEofamzMHm+HoRrf3+zTqxeD4d
         J+XSasYo2urP5mXU7TZqskzXByrb0tDScrQ6LKZWK0aoWDyhu7CpmyZK31ksoUcdVTZe
         rNvDRDXK9AHVMG3jjtjU7euKVzryX+/VAkQklZ2fMJigrJIWTImGJxinsHdJgsUP0LHQ
         KysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730620237; x=1731225037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHcOCAQRVF6wDwCpz/Ofc5RAAihYPSYxf02RxaoduNk=;
        b=Y2lz+IUBiQmhP+UyqyLRG2hibrpGWyvbwSr9TspD6FqpoMIsVE+JaugPuXkOKIfYtX
         qPXNCask/2jXbyaPpAu8HOS9hQlv8sfDspZ0Sgmd9/sFlP+Oz8O3jhiXBMQRHFUpkjCB
         3+9vo54StDfOvGumDdh9zch9s0qnhqoznFNdHoopSZMRVFpdArwUmk7sZgyhjhyeikYB
         t3ErTKR18Rp5ibtFNawizctMPvlx/MY0tLVxytNirKhvl3qTK4+iODeseRQNqC6eP26X
         N8X7hGxZbe4NJDevEiNAwknW6RopAlB2ryTMrIGPWye1koe8AeEp6pQgni18tUP+RtPC
         yuwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG4tCqZf2HAbSg3tAy3utunltZgNx3A3L6+WHraDkJgzZMrMDIphS4erKU6yeaDbEnA2es2TwUqk9VvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyroy0xy4ra2Cjm+ySsudRnON4292n1NAlP6JwpRB0spP92JejA
	RNgL2ngRYSjn48oKgyW5VU3grvmaEhw/KIyYG0ISkL1y5BYGRgB1
X-Google-Smtp-Source: AGHT+IG7/wFicHX9OEUYDqktOUiK/uVF+gBMW79yuPguvpjtQ5yao4SckDLDe3KLDsePTQwcfpW9kg==
X-Received: by 2002:a05:6a20:734c:b0:1db:d756:6136 with SMTP id adf61e73a8af0-1dbd7566139mr99827637.3.1730620236993;
        Sun, 03 Nov 2024 00:50:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc20f64asm5409704b3a.96.2024.11.03.00.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 00:50:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: riscv: add bfloat16 ISA extension description
Date: Sun,  3 Nov 2024 15:49:55 +0800
Message-ID: <20241103074959.1135240-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103074959.1135240-1-inochiama@gmail.com>
References: <20241103074959.1135240-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_005038_159298_7858EB15 
X-CRM114-Status: UNSURE (   8.98  )
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

Add description for the BFloat16 precision Floating-Point ISA extension,
(Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
("Added Chapter title to BF16") of the riscv-isa-manual.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2cf2026cff57..99d8b70fa321 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -277,6 +277,12 @@ properties:
             instructions, as ratified in commit 056b6ff ("Zfa is ratified") of
             riscv-isa-manual.
 
+        - const: zfbfmin
+          description:
+            The standard Zfbfmin extension which provides minimal support for
+            16-bit half-precision brain floating-point instructions, as ratified
+            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
+
         - const: zfh
           description:
             The standard Zfh extension for 16-bit half-precision binary
@@ -467,6 +473,18 @@ properties:
             in commit 6f702a2 ("Vector extensions are now ratified") of
             riscv-v-spec.
 
+        - const: zvfbfmin
+          description:
+            The standard Zvfbfmin extension for minimal support for vectored
+            16-bit half-precision brain floating-point instructions, as ratified
+            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
+
+        - const: zvfbfwma
+          description:
+            The standard Zvfbfwma extension for vectored half-precision brain
+            floating-point widening multiply-accumulate instructions, as ratified
+            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
+
         - const: zvfh
           description:
             The standard Zvfh extension for vectored half-precision
@@ -605,6 +623,33 @@ properties:
         then:
           contains:
             const: zca
+      # Zfbfmin depends on F
+      - if:
+          contains:
+            const: zfbfmin
+        then:
+          contains:
+            const: f
+      # Zvfbfmin depends on V or Zve32f
+      - if:
+          contains:
+            const: zvfbfmin
+        then:
+          oneOf:
+            - contains:
+                const: v
+            - contains:
+                const: zve32f
+      # Zvfbfwma depends on Zfbfmin and Zvfbfmin
+      - if:
+          contains:
+            const: zvfbfwma
+        then:
+          allOf:
+            - contains:
+                const: zfbfmin
+            - contains:
+                const: zvfbfmin
 
 allOf:
   # Zcf extension does not exist on rv64
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
