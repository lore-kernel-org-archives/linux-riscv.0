Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6979E77179
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 05:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpUzmvCyEi/cFNCKHwsBp2GTTfb4alv/+f+mBADpaSQ=; b=latIRw2zWmJeV4
	P8lhCAbhRB/9sy6BgHrq1R8ql/B+FSe903NhEGS9sKZAWSVEAC0uzhqDledWQ5qFJfL6r4f8jkvk8
	/a8Xq8uRgdLJu8esoeMlNywo/cbfLs70W/M0pYQxFEuZbiahRHRWQ36/F35kvPaXSHd5CJAm2FVAO
	Cy8Ej8jio07bDJMlTVqIhPPyxld8s6rp5v6bNs8Zd55b9yKxgSJYRrmB7ZaS4S1c3SBx84Edj+LlI
	ud9uzX9PU6vDwDxHCi87SgxncMLQqAmCcdvSywpRKC4tYhaSxqDw4pmg+fzNTvx64hZ8cAPcwzfXf
	zEIYHffHXN8uq8jKIXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRNZ-00000000f8w-2Uql;
	Fri, 06 Dec 2024 05:59:53 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRN0-00000000ex7-191b
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 05:59:19 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6d8e773ad77so3099166d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 21:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733464757; x=1734069557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8BiXrdu8AjyVxaZxHVQZLdp0cv6/V99Kwq2ArWLgVQ=;
        b=an/ucsAXSU3BcYXy6fIp93JvYP9nND2SnOpnwKDdtVE1y0PrdaQ3KdcUWOUrXAm75Y
         hZGLfqRFg4EFxSqA40vyjXgTJ+Vd5wTaPqw0izI2UD17n7JWfCxu4Ur+ue4ilVysFCX+
         xcagm9Ccj8W7FzoGkE9PCrh1mgkhvkhIzoUfohsNUwcqVOn1Vx4mAPK7VwatlO0yPyQ8
         wAMCb5Tu5vYYEuRYp/toBBPJaNwU6AHEwcxHK97Ucp2xeSCDWyy+KiZRuuiOgByt2emH
         BQOlIUX0DaxYXV1R5KlhpAxE4q8zqCOD4nlGFexwuEr9x18XGhAyf6FqEoFcgz86e3IU
         vBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733464757; x=1734069557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8BiXrdu8AjyVxaZxHVQZLdp0cv6/V99Kwq2ArWLgVQ=;
        b=EaqVfWCA88g5Lx5S3Q4UZDbEvZdCVj3o+gSu9JTyZQCXKfMQGLHSRXKGqB2/ry+tHN
         MoDS3A9atlTxo23G/q4GAEpFfDjun5IBI9oV8GEeF0TqfzfjtHoZ8EnW/4NXmN3Gr9oZ
         sBXb5xEuPEu/ksqHKcTR+ZifWIq/scwt0kcytkVvvm27KmdNgIFpor8Wpvg/rqeRxi7U
         bzKc81JnVSPu2uhP7LURGCEeikVfuWkDNowKkqi+E5izvFke64myUtL1sQv2VxgsXVY/
         NZgVryRLbstHCXO9umiS7spCz4bBHa2CoF7bfTumv56a/ty5UtIzm1VzK5oCWqLPi8ex
         3ffw==
X-Forwarded-Encrypted: i=1; AJvYcCXN63p5/cVLPgG9LebPxI9ilNy5KaDdtX+nrCkOt1erED2cJg1KOJf/5vJJmNWcFucQI6tIi+yX8XpzrA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0J5IsG8Bh5CvN42yrS5eJTYetpHIL6Yv5KG8yXvklgZJEQXLx
	Ggv/nGpW3svsEKuCwrIwzbMsPyaoMTNihLkgFIx9W5OsGXJDscA5
X-Gm-Gg: ASbGncstGWV8Bb+ND/HoizL4cFnlEoSUX3v6tXZAy+h9dnKoIOcjtCJnc4naEOPIFPg
	Of2If9iPuuz8k0XjYmiJz5HG2X+U60h4WSHKwGh+WtVZMM7PwwEuZMle/5Kab+Pc2/lCFopLMO4
	kKat4E6QZUZXVzf4vQdVs7I3eT97fYNc+R1KLS4QAeM1REX/ElSPHGdGvpmIncTfkxom6GgPM+L
	KneMeDk7C65Bg5k1MWw0ocWGw==
X-Google-Smtp-Source: AGHT+IGr4f0bbdkY7GxypZLey3m/davrnr3G1VH5MnjbXb79c+bf+NeCMvcxLFALb91XgqHliaybZQ==
X-Received: by 2002:a05:6214:f26:b0:6d8:9d1d:3a7 with SMTP id 6a1803df08f44-6d8e7168da6mr20671156d6.17.1733464757010;
        Thu, 05 Dec 2024 21:59:17 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8dac016bfsm15381436d6.116.2024.12.05.21.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 21:59:16 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: riscv: add bfloat16 ISA extension description
Date: Fri,  6 Dec 2024 13:58:27 +0800
Message-ID: <20241206055829.1059293-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206055829.1059293-1-inochiama@gmail.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_215918_329201_2A60323F 
X-CRM114-Status: UNSURE (   8.70  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 9c7dd7e75e0c..0a1f1a76d129 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -329,6 +329,12 @@ properties:
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
@@ -525,6 +531,18 @@ properties:
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
@@ -663,6 +681,33 @@ properties:
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
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
