Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A148EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1GOWOLD9gnU6Z+9N9tNwgrPsSnN83FcrOz/8mTNveg=; b=pmZurXGTiKnKwP
	7ElqzHoemA0se36sEyv80wXrC1Vc62gWLW4gB+y9lq2aSzNiGFGQ2hbxQ8wCAK7BkuyO712dQVlFq
	ctQzV3A8MrCn96kWoQFTUk6604eDggO4usNnrMRvtD19qLIDJdjvUwqu2X2SNr8t7ObKbWEsjy+8m
	xvXJzoqO3088H0Ad2FVl+XWYmms5oTpbi7XYcQ/by5ZV7giyM7wD9INryzAHQGcDCTkJso/rM6YAJ
	YoqvKKrckoJBRFiRpUwOKEPkyXtQHWnxWyQbxaR+FKM/7mrxOYtbNkfiLsnHQgDwh5tHzSuw+S0A/
	08vfL9HM5trGO+z4rLOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIT1O-0093gz-1l;
	Sun, 09 Jul 2023 11:56:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIT1K-0093eo-0A
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 11:56:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fc03aa6e04so14105465e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jul 2023 04:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688903764; x=1691495764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrXt7YogW8FbMMz7Y1nQxUHIxrZPDPVRkQgMwIsvUkc=;
        b=fjI5WO3rKzCRsUWPODWUh4Slpz8bGAKClyp1xQ0jeQjKwv64uNdT4ynm2g3Jnyf5/S
         eEcFPy1E+dq8fgHehaeaiCqjBs1TTuHJvNXdizOMBG7B6781lXEn6enVqKMPRTOT8d+Y
         XEPfKSaBNW6cHVluSHL+zVZBbF7xUnREb0Vb96UJ17fIkHl5tTNlH6CznuVH6Ve9VuRJ
         r7u5aE7pKw7KwIq7zV4bUH497HPmP/dOPfQQf5AGDdg6oLbXBWB6oVjKVY015zIB1i50
         T8RKeUptfDEKVqxdlo6qFEalSsxCme3rWA5XbPlBN9mACwKgSBOsBaruvNhrm89BgvdI
         rIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688903764; x=1691495764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrXt7YogW8FbMMz7Y1nQxUHIxrZPDPVRkQgMwIsvUkc=;
        b=H0FRyE63U+FxLjPMnd7mAf88mzWyGN2KhvuPFL5W1ByrKrRhE2wn3vbwwfpSw9cwp+
         n+elcFxegUjPKsm+4rJah03IELzneiXty2S5Nvx1bVrnZCoolJqcm9f2KbE+NswDlKgi
         KFtatuCuU62xRsqltagu96aDsP3Lj2LIjhlk98dGI9mS/Lc2XqHake0IxCTEe0hw2Czi
         Yn0dWVh0mhPyhcF6zieOqOy1xU2vhU8wYtGGtMycSsmJ+rO0QWutnJFHVkxmUDpbK6yh
         RBfQoVIJngovk288sC5G6Lwd8AcDf/s0ObT3RaiIuziUS2syShHYRU1FdxdxsxfBt4hk
         ZEQg==
X-Gm-Message-State: ABy/qLaKSnudLP8iky39NmeK8E0EkBlI8M9x8pvuScGObhs7jRgQTMc0
	fq+Ld6n++2H80E8kCfdIEHJymQ==
X-Google-Smtp-Source: APBJJlHTlU5RW9sJy2jgsJURFY6KnfamT/IBVAIg4n2jwBNNXN62dwt+LG7UvIXTtLT2iDmFeK9BSQ==
X-Received: by 2002:a05:600c:2247:b0:3fc:8a:7c08 with SMTP id a7-20020a05600c224700b003fc008a7c08mr6031433wmm.35.1688903764223;
        Sun, 09 Jul 2023 04:56:04 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c02c200b003fc007d8a92sm6194101wmn.45.2023.07.09.04.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 04:56:03 -0700 (PDT)
From: Samuel Ortiz <sameo@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	linux@rivosinc.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Guo Ren <guoren@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: riscv: Document the 1.0 scalar cryptography extensions
Date: Sun,  9 Jul 2023 13:55:44 +0200
Message-ID: <20230709115549.2666557-3-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230709115549.2666557-1-sameo@rivosinc.com>
References: <20230709115549.2666557-1-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_045606_086630_56844D52 
X-CRM114-Status: UNSURE (   9.56  )
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

The RISC-V cryptography extensions define a set of instructions, CSR
definitions, architectural interfaces and also extension shorthands for
running scalar and vector based cryptography operations on RISC-V
systems.

This documents all the dt-bindings for the scalar cryptography
extensions, including the Zk, Zkn and Zks shorthands.

Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cc1f546fdbdc..361756978da1 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -190,6 +190,24 @@ properties:
             instructions as ratified at commit 6d33919 ("Merge pull request #158
             from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
 
+        - const: zbkb
+          description: |
+            The standard Zbkb cryptography extension for bit-manipulation
+            instructions, as ratified at commit 73de909
+            ("Zvk: Update AES instruction specs") of riscv-crypto.
+
+        - const: zbkc
+          description: |
+            The standard Zbkc cryptography extension for carry-less multiply
+            instructions, as ratified at commit 73de909
+            ("Zvk: Update AES instruction specs") of riscv-crypto.
+
+        - const: zbkx
+          description: |
+            The standard Zbkx cryptography extension for crossbar permutation
+            instructions, as ratified at commit 73de909
+            ("Zvk: Update AES instruction specs") of riscv-crypto.
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -240,6 +258,70 @@ properties:
             ratified in the 20191213 version of the unprivileged ISA
             specification.
 
+        - const: zk
+          description: |
+            The standard Zk cryptography extension is a shorthand for the
+            union of the Zkn, Zkr and Zkt cryptography extensions, as ratified
+            at commit 73de909 ("Zvk: Update AES instruction specs") of
+            riscv-crypto.
+
+        - const: zkn
+          description: |
+            The standard Zkn cryptography extension covers the NIST algorithm
+            suite that other cryptography extensions support. It is the union of
+            the Zbkb, Zbkc, Zbkx, Zknd, Zkne and Zknh extensions, as ratified at
+            commit 73de909 ("Zvk: Update AES instruction specs") of riscv-crypto.
+
+        - const: zknd
+          description: |
+            The standard Zknd cryptography extension for AES block cipher
+            decryption acceleration instructions, as ratified at commit 73de909
+            ("Zvk: Update AES instruction specs") of riscv-crypto.
+
+        - const: zkne
+          description: |
+            The standard Zkne cryptography extension for AES block cipher
+            encryption acceleration instructions, as ratified at commit 73de909
+            ("Zvk: Update AES instruction specs") of riscv-crypto.
+
+        - const: zknh
+          description: |
+            The standard Zknh cryptography extension for SHA2 hash algorithm
+            functions acceleration instructions as ratified at commit 73de909
+            ("Zvk: Update AES instruction specs") of riscv-crypto.
+
+        - const: zkr
+          description: |
+            The standard Zkr cryptography extension for the entropy source CSR
+            definitions, as ratified at commit 73de909
+            ("Zvk: Update AES instruction specs") of riscv-crypto.
+
+        - const: zks
+          description: |
+            The standard Zks cryptography extension covers the ShangMi algorithm
+            suite that other cryptography extensions support. It is the union of
+            the Zbkb, Zbkc, Zbkx, Zksed and Zksh extensions, as ratified at
+            commit 73de909 ("Zvk: Update AES instruction specs") of riscv-crypto.
+
+        - const: zksed
+          description: |
+            The standard Zksed cryptography extension for SM4 block cipher
+            acceleration instructions, as ratified at commit 73de909
+            ("Zvk: Update AES instruction specs") of riscv-crypto.
+
+        - const: zksh
+          description: |
+            The standard Zksh cryptography extension for SM3 hash algorithm
+            funstions acceleration instructions, as ratified at commit 73de909
+            ("Zvk: Update AES instruction specs") of riscv-crypto.
+
+        - const: zkt
+          description: |
+            The standard Zkt cryptography extension for data independent
+            execution latency attestation, for a safe subset of instructions,
+            as ratified at commit 73de909 ("Zvk: Update AES instruction specs")
+            of riscv-crypto.
+
         - const: ztso
           description:
             The standard Ztso extension for total store ordering, as ratified
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
