Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F7BC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxdIgPjBntlo4CYEoQffLOspI+/6WUGiepBeKPWdsfI=; b=Y2r4FBno72RIuV
	GAFY0jrZZehFRvp0yiSRuB11gb9zVnZ8o+OYe5x2KPK5aBMNx1os7EsbsAy6ZVtmPvYT6hbssO8tj
	Ip+oxcBdDv+Lq5CvPMkegcoTyn0DAoVEZNtRmlpu6PDCzlcVb0qSrD0g3FZbOC+BtGzqTuN2lYHjf
	9SuWH7oD9KbPxbldetOH8XnTlcmvfRAHWhA+SSU/WeU9QqGvGmiHw0Fnjhybq5q7Rj91L5rZiAlR+
	wWBwPTdYTRDt2TmjiGqdz+4gOLDvvzlSBDnbe2OEeX0lHQsU/HIShyiovC6ae4/JkV2FzPAlsKV5d
	wAb5fl3kuYSVr9W80l1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0T8d-0000000E3Xx-1ZbV;
	Fri, 26 Apr 2024 21:29:47 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0T8X-0000000E3Nn-34Mn
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:29:43 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5f7fc45fe1bso2083212a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714166969; x=1714771769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=cwNt6+dlSpGbWCdEkcWYto70RFJ1hUDx6GjT35xqrLdXDCJ4Sugzk30gxPpWY7QHwa
         HQ4viDkwo7LHW2cAkzosPqlo/SIerXFsGYFcXsK29huSnG2bTjnNjDiLqIF48Qbqa9va
         jvadQI45SOJG/jcTJMwEDNU99lJ2cr0TPaCKi7FS5IDc/w9h5S0fUCFX7JHAL8bkeedG
         mgzvGsZeDBkorGAykRlaYpRU0U9D7eULVm1atDYlq1Amv+WK5vMFpVJo/jtlJakbmoMc
         S3i5lkMKiBWPHQvLG3vopL2Xl8zJOJ3A5PJPiCxTBxWEFSR/U9K1/Wo6iu735lnKgbon
         FLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714166969; x=1714771769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VjeHR1eFFL9Gvz01+9XywijwOrTXSU/mr8HqBxiNzQ=;
        b=Akw1lEndhIp8e4bDr9Xt4q/ExA1twZq9VhyKGXAZDYjUieRqz2Zx0mmzwkvkQqhoWw
         Odu2qdllVgKwLiEnQK3/h2z5Haai6y9RuzqvmAj+RDV/JThlbTNRsqac0aYYIGix58eM
         j5ztB8bZwxuBpZteeZsYvZ7M5BWan4w9kGx5FjjQbKDl0l1ZITVviz3z2GT1dTvKjqmi
         xPvlwdopoz0CtTJgEeDStOAORTAicLHg09XryqiqpINYf2z8mqhipy5Rgp1NeQOyX7yS
         0syjCQDNJXjpEiXokt9qOFLJQCLDATjaNOYB6T5LXeuySES+TXhRKcW3zVaQQihY5tSb
         Q3AQ==
X-Gm-Message-State: AOJu0YyzOWslO98k4CgfT7SzU+2iuKs4at8Nao2EcR1GDxvvYL2R8P6E
	cLWHs6oN+uLHB7i0F5bjy+BuGNJZI2YJA91FaNhWiV182Nxs478SpNmh4+tSqBM=
X-Google-Smtp-Source: AGHT+IG0NLK4iE+eUG4asNWLFKpGGh4C2Wjuei7tv/cQwmtoLplQWM7s+CxqV+3nZNHhGKsZKJXClQ==
X-Received: by 2002:a17:902:f643:b0:1eb:788:b424 with SMTP id m3-20020a170902f64300b001eb0788b424mr3956494plg.43.1714166969118;
        Fri, 26 Apr 2024 14:29:29 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902650300b001ea2838fa5dsm7226720plk.76.2024.04.26.14.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:29:28 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:29:16 -0700
Subject: [PATCH v4 02/16] dt-bindings: riscv: cpus: add a vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-2-b692f3c516ec@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714166962; l=1443;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=heJ5mXr7Tx2wdFjG631ibJba5Q6SNbmXVyEpdKm9JEg=;
 b=Sv3NOp+Khbllr8+Jo15OweAuQfWJMGJSmsVQYWIPByneO4usORzy+u5Sxph4lQEGlzWYaUTCa
 Prj7RDB934ICi2CTIsEbZ+WZBC4lg45Tneo8TuIKSKFlCvLf8TPmYRa
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_142941_829989_90F346F2 
X-CRM114-Status: GOOD (  10.30  )
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
