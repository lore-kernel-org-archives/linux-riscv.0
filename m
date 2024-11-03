Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE4DD11101
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIqCgQ3a5MlRFTxX9TApAn0odLlqVUBZyli1CgmUCCc=; b=24c2Jhc838Z+Dt
	wwoLe76noknnMZRWfFOnex4WOXPzMVQ3LAnoyPFrwMxwDAgqls6KuS3ZiHHSHy4XCvdkN11Ogl5OM
	711ZSSWXn+vKl/K+s0qOboyka+yvc6Q6J07FrfP9Z3Z1Z2s50ZFltBmga5B7mjTDNX+Pstuj1Q/Lm
	/OR6id62n2+im7ykBVIfJyhx9Kc2OTE22UX9nzUr+Oog5oSEZIhoTEOjZdXWp0viELdhmekYRWRQ+
	VuTs3kvesNAFItG4ZkbuJc1OMVGpS452JxGJ+yIJRQGtf33/xmZcAbYh4Ba1ViWtPuDQ9Wt/gjY9R
	fbVM0ROZ9BbG3UH5Dmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c9N-0000000BbGQ-1Oc5;
	Sun, 03 Nov 2024 15:04:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7c9F-0000000BbFZ-2Tfi
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 15:04:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4319399a411so29606805e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 07:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730646252; x=1731251052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYOR6ehP8ZUAtZy2SlX+P5w8jiHdus9J4uApBvZwtJU=;
        b=j6SnrbvDg6ZX2TNJmVPnB/QTx6u9m0mo6h7i+W2FIukgt8plgD+TTasT3hKhgkCzVO
         gsC4vYXhP7evwmqTnLkxn2ctYQ04mXFgrYS5RGnhqOfFe/xKht1oQwoG+qINdCWOLtp2
         F9C4FE9CkbQSS2EwwwWYYrqfHsmzzhvkghChB+AHk+CCtuIL+/dPaD/lC04xvAVi4Qw7
         3dgpBVACmFRqWiv3RFE78V9rwrck4yF0PBGqswy1o1zf7tYC4KsF9mlnTAjPJGEG16VY
         bSTRjjWX3xbXF1qZG5eUnOSH4ocanNRqc1SLyN+K4dU8fiBVFAinfmwztRimyigrTnU9
         EHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730646252; x=1731251052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYOR6ehP8ZUAtZy2SlX+P5w8jiHdus9J4uApBvZwtJU=;
        b=C64kthg3qZ7e7+QaaR46eMhwC+6D6QBXzIZWaPTUmqcWUTjOpaNcB7q2Rw1P5JvaHZ
         EcZixftmfgoskdhlCInvmhUat7KIsLUSyRMHeVbXbakZHY1i1WtdtvXNQfDix93AhIiy
         q/mdmvjdaNtJXavEGzwW9CReNeOWnRJT71Ok1G+nfP1T+JWbbElBs8GRyzGNtmSstpqz
         hhLHz7puvbdPCCs+WSR80LKqN8/hkuznq86tJD3e43Vrgvw4SsyJS03HJUTg+Dv8yyLf
         A+1QcoNnlCQw0lU6fOlbIEr1XX3cDbWB2NtkiNP0aMlCpq73efFoT0X9Ec019OT52rUc
         5vVQ==
X-Forwarded-Encrypted: i=1; AJvYcCURdcffX+cqABvJjgWYL3uCA5dUCuPn2Jcsr3tLa5aIop+jXZVrl26iuyISMWCpcY+PDrH+EUaOfX6cXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUv0M4xofobkJn06yVvIqtOgcyjK6W7eNsAah34QIBKDgY1O8u
	lHuMIEADCXGxZY+/mwkSSOTL0oM1G9JCvwa1Id5M4hMihOMFk2ppGxitDwp/meA=
X-Google-Smtp-Source: AGHT+IHLb+bX4JOWUSFmTs6UYPJV8WTvK/tBJRvIgcA7ae04ZGiofBjbX29h/oO76eksCbmobaHszg==
X-Received: by 2002:a05:600c:4fcb:b0:426:5269:1a50 with SMTP id 5b1f17b1804b1-4319ac9c15fmr240004605e9.11.1730646251731;
        Sun, 03 Nov 2024 07:04:11 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7b32sm10858711f8f.18.2024.11.03.07.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 07:04:11 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 12/13] dt-bindings: riscv: Add Ziccrse ISA extension description
Date: Sun,  3 Nov 2024 15:51:52 +0100
Message-Id: <20241103145153.105097-13-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_070419_042351_E0830032 
X-CRM114-Status: UNSURE (   8.19  )
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

Add description for the Ziccrse ISA extension which was ratified in
the riscv profiles specification v1.0.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index db062107823b..35a9ad1d7e63 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -296,6 +296,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: ziccrse
+          description:
+            The standard Ziccrse extension which provides forward progress
+            guarantee on LR/SC sequences, as ratified in commit b1d806605f87
+            ("Updated to ratified state.") of the riscv profiles specification.
+
         - const: zk
           description:
             The standard Zk Standard Scalar cryptography extension as ratified
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
