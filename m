Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F02EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdL1XXBXO+0/Gx+qSCO2hALZOS55qXS9wmvsAIFMfMc=; b=tSHozYjDiQc9JS
	phRzLzmqz8zXl+4xhmm3dJyl3xSgHvPcKS3HC0Q0XRtRJa33j6r+mFglVUspVXEPwAp27V/b3tOyA
	qIiZ5cGwzkHAtzwyHFhIzzD3EQwTA0fQi6UV/7RmsvXlBX+26rlzTefs1C5QIHz90rdNSMUw8WV6n
	k8xvX1/fPRp6w0RX20t0mHCQTvsFNS5WWvSDi0lab13s+BWi/4Y1XCeffYHLpovs0dWLyYqwVxvo+
	U75y/diWJnR+Nng6qfkqoi+2UowzF1Z12LCmSh94UKLuLrYe7u/bpaV/Od5/QSr8A0VjgOYN9lj6o
	vFfeTKIdsaAHXnQUzkwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVPx-00GwQp-1f;
	Wed, 12 Jul 2023 08:41:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJVPu-00GwMn-0e
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 08:41:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3094910b150so7270652f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689151302; x=1691743302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RT/Vt3RRfMq4FWYr6OtGjxwm1ECt6aNXHT5BGeUxff0=;
        b=gYPnPU3NZw9utPGclL+789aHb3o31Fbn2cEUJggsFY2ACdfcnuBKWAjFigGD/0gpDO
         eHwKw0QqyK/YPRuyAOaFskMLIjkJhWDXb1jndmGbaM8cOK+RbjkgAYFEXALOoTKzUgcG
         qPgnErIFUSnExWOiZ+H3qDiANwpt1Ci0AYavvs8PtIWDR7ZE/beHvm1/MLJ83PyK7AnY
         rXIfuD8G2m+9o5uogS8UZDn+2kGx/XtM2NvqNVcfPnIlm8s1h4f8PgOlZVQJCaQRCZB0
         /5F/AMo1W/vzP5kQZX4jvCjTRrJgI4fLsP7XIbMnoo0cUjBLdps3vjVS8cgjlnSvAQMN
         l6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689151302; x=1691743302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RT/Vt3RRfMq4FWYr6OtGjxwm1ECt6aNXHT5BGeUxff0=;
        b=HR0o2LZ1qeoNvPw8sjWbeUCwaOsjnWrD6QFttl/RurFSdrQ1bTCSE2PlKw99TU2ouo
         tCBx6006saQrx/g0dpBThErzBSE/8XlgHQPnDg5ZabJG7KXUwi3xm2grxAl2/1f4ccnp
         Hu0y97vUh15I1GVtMvocxQjRiwCTn+9U9MsUbMP6CHS1ANPkVC0iSocf6trtdIm6zlt+
         X7tvhZydB20UXGbYbCia5jD1kXYJCAekBkL8EKWt56nN433S+tRbJrerKTMGcvRwI4ZG
         LSwsAWvCFs+LD7ifS48Kb+DDrkSJxnAjCQyyeq5oXnXdWdgDaVpffvRJY3hotQGvHxlf
         JmNA==
X-Gm-Message-State: ABy/qLZTRX/8qv4RPzQhbcwi2WNLRd/FVW2OuYk363l0JsCt6zLp3Ri2
	VuRpfdAsJHXSrAr5Jo+sPTi17w==
X-Google-Smtp-Source: APBJJlG5aEliuCg0Tzq/nowgmurWqSwaYDI+IB0QIjxf7737XRRWEo6xEPUUb76lZKABoel7Q4lrxQ==
X-Received: by 2002:adf:ec8e:0:b0:314:1ebc:6e19 with SMTP id z14-20020adfec8e000000b003141ebc6e19mr16442275wrn.64.1689151302320;
        Wed, 12 Jul 2023 01:41:42 -0700 (PDT)
Received: from vermeer.tail79c99.ts.net ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id z13-20020adfe54d000000b003143ac73fd0sm4496122wrm.1.2023.07.12.01.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 01:41:42 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	sorear@fastmail.com
Subject: [PATCH v4 2/4] dt-bindings: riscv: Document the 1.0 scalar cryptography extensions
Date: Wed, 12 Jul 2023 10:41:18 +0200
Message-ID: <20230712084134.1648008-3-sameo@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712084134.1648008-1-sameo@rivosinc.com>
References: <20230712084134.1648008-1-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_014146_253674_777F48D7 
X-CRM114-Status: GOOD (  12.18  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cc1f546fdbdc..3d3d0d2f71e7 100644
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
@@ -240,6 +258,75 @@ properties:
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
+            Systems with the Zkr extension enabled must set the MSECCFG SSEED
+            bit to 1 in order for the Linux kernel to access the SEED CSR.
+            As userspace access to the entropy source is usually carefully
+            controlled and exclusively managed by the Linux kernel, M-mode
+            should set USEED to 0.
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
