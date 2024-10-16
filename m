Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2B8D2F7C9
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 21:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJVaclHieo/87KRaKaFIUoRKkEJdu/tBXs+5MWyKXRc=; b=CUeSL6YhqB12uq
	Zwp/zM4RldDd90WudcnJoyRHtmEUl1MbZM+l0uHhfea+JizafEm5luPzaMIq2DlIim43gqMSO+HZ2
	ne/M3BGbLn5AdEcByLiNO6cqjf2HEcdvxNIGFa938EEhZQGnVdxz4oQtr8mVlPcESZCXX1SYk05u/
	gLKqUx2Oz1Q1P4z6SxJW//PYSJxIWX8qoEqxXK8T3ivaV1S8VxtmcCjPfFi2I9IMQdrhc03lmetGU
	XpjdLfrGTcc5YYsxIlRFtG/4WZGj8C/+It/7wJ6TNZ4embtTHRUR4qo3pXptyrXHkB6GZMxg7z+Tc
	Sc4YoZgSY49buArQzy/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1BbZ-0000000D2uy-0g1h;
	Wed, 16 Oct 2024 21:30:53 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Ad1-0000000CwPs-3VZd
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 20:28:21 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20cdda5cfb6so2166785ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 13:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729110499; x=1729715299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olAKLc1ubtUo3zWjyBg9w1ODcp643i2ah+QLaW6GItw=;
        b=CgtJCr/Sq+p9BKI7Jeb6j4AC8xQYKKMtPnqMs3pb0xoG1IpGxCvIfFaL2PMUVEj/jF
         PHopanmZNtWvKiMCFlFVXOuOaTU+/hsaC4WEGpd70cyTfheQ48s9pMn79ByICToRDCJT
         kvFwkAq+P55cxpL4mYJUB8DiTcDUWf8sDENhb+clBL1HN7sku4FTlNeDcH8uyAKZ/jc+
         OHyQd/EwEuEQP/rJXdlEPjYqPGnRZ85CR1oJYGBjp3ECkDZrQ8Z1pXEJE8+jN8xabRRY
         xQJDFaVs+3YYvC8JHI6aE9b9r5YQB48ck/MHUp6gQ9ztqopmUdVXSZFea2QZLIT+1VZO
         crAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110499; x=1729715299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olAKLc1ubtUo3zWjyBg9w1ODcp643i2ah+QLaW6GItw=;
        b=GTgJ2hdlZAeIvt7ciPuD4BVokmkdtJs31pawjkKhfNDqFIy5DMpvyV9TuKLk7Er5cc
         psLObXED1Z5kG8eae+govIcNf0pX77xHEGJHPV58d0ERFqfLJzjD1FAuoSBZ2l2GBo3j
         grkZCmd8JiY0gxCa9/vsbmgwmAeKZgLQAdRnxiw77gpUtNGizngpgx6Bz6/aeRTGWJ+5
         CbYizhltaJUuAjkI+PWuXdigh1wFRZJB9s8goUEIOmXFZ1JSczgDE02e2d1bODuc7RE3
         ziIotRDMbcmGz7WQiJouCMI2lUKk6L8pCgKLNW9AEuR+4wfRLOWQVQAXkURq0jzlqEmf
         TPxw==
X-Forwarded-Encrypted: i=1; AJvYcCWcEMvqATTUBWrHoH0TL9NP+oz5TGvaeF3dU7cFUvLVct+5UNV7e67l79Tjh1y2DxAd8/1z/PzKj+DEsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDhwgsyIutAUwzn4QfthaWmg87kf0z+KvMSmOSFaE0tUFffINS
	UneAD5UTByUy448yay0WuZv1ELEZD8YHwe9R+LWR+rq7XvCa8O6hTqDr9L6Krr0=
X-Google-Smtp-Source: AGHT+IFM0/E+iUAS6tZ0dnNm0aBuUaS4hqVs4p2U2s4QRcOm7iZw1qqdWPovB3OjQaczkhgEOCQhtA==
X-Received: by 2002:a17:903:1108:b0:20c:ea0a:9665 with SMTP id d9443c01a7336-20cea0a98aemr161412995ad.32.1729110499094;
        Wed, 16 Oct 2024 13:28:19 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08f8f89sm228613a91.38.2024.10.16.13.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:28:18 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-kselftest@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	devicetree@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	Evgenii Stepanov <eugenis@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 01/10] dt-bindings: riscv: Add pointer masking ISA extensions
Date: Wed, 16 Oct 2024 13:27:42 -0700
Message-ID: <20241016202814.4061541-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241016202814.4061541-1-samuel.holland@sifive.com>
References: <20241016202814.4061541-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_132819_896072_F24CFF6E 
X-CRM114-Status: UNSURE (   9.33  )
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

The RISC-V Pointer Masking specification defines three extensions:
Smmpm, Smnpm, and Ssnpm. Document the behavior of these extensions as
following the ratified version 1.0 of the specification.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v5:
 - Update pointer masking spec version to 1.0 and state to ratified

Changes in v3:
 - Note in the commit message that the ISA extension spec is frozen

Changes in v2:
 - Update pointer masking specification version reference

 .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2cf2026cff57..28bf1daa1d27 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,18 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smmpm
+          description: |
+            The standard Smmpm extension for M-mode pointer masking as
+            ratified at commit d70011dde6c2 ("Update to ratified state")
+            of riscv-j-extension.
+
+        - const: smnpm
+          description: |
+            The standard Smnpm extension for next-mode pointer masking as
+            ratified at commit d70011dde6c2 ("Update to ratified state")
+            of riscv-j-extension.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
@@ -147,6 +159,12 @@ properties:
             and mode-based filtering as ratified at commit 01d1df0 ("Add ability
             to manually trigger workflow. (#2)") of riscv-count-overflow.
 
+        - const: ssnpm
+          description: |
+            The standard Ssnpm extension for next-mode pointer masking as
+            ratified at commit d70011dde6c2 ("Update to ratified state")
+            of riscv-j-extension.
+
         - const: sstc
           description: |
             The standard Sstc supervisor-level extension for time compare as
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
