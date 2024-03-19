Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67E6C54E68
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 21:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1u7p3hvknd7vu0mye4XdTWOSTQoC+dXEGS4jlXMhC7A=; b=JWEPaXfiJyhEE2
	K8Z2g/UGgdDmAjylXVUqwgxEwtVuW2iaewOH7EFbSjizWDMVYQa9opjtVqIjnjIb81WZOM8r/dW9K
	oYfi0tGOnOSZm1KI4an6zcH8SGJvNQUhPM0q578tU512qfsX1HMykyb85Tf2bbhywjz5S2S99bmUD
	xI4lhb5hsdXEy6vFxmqW6MC9zD1iPV1Em4X2yFknuyQLkYWklt1/XTgDbqBCZ54GPnYmN7vaxUxJq
	VqjqXvNhUvcx58C2/FbioSnVxugdNligtEa7KdFoDZIYigTFRKNkqyXslP/PpCnYOLzOGWbWzC5F8
	fp/OEL8djVrKWQ/8Mf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUZ-0000000EMju-475y;
	Tue, 19 Mar 2024 21:59:31 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUT-0000000EMeZ-2ZRe
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 21:59:27 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e73e8bdea2so1554163b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 14:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710885558; x=1711490358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mf8TbChjgkUHpdp7I/ykwc/bJc9eIQRGH4wGpVTxw4U=;
        b=KlpdTY9nSZaLnIRq/hmVdiDKj2HcCj9bZ6NQKbH1xhyRjOil6ivLSbMuI2jgg/2tzP
         aHCLKY+QGhN606Iflcb0q1FvkCzQkqFnhvDFKc81Qe4pBqANa+Emu7yIh8XEv8KlUKdG
         uVAyzScgz7CM3nbiv7Ch+5hnqg9Yl+Oj2g0suAJY/5HfuWm8fi8b6Vg6zRaaQXuZfcax
         6/U+A38+pNlV6i9RevEHwCgcsbexOd3s40VBKB4iXfunaEGfGEWmftgZ5kPltiw3E6R1
         fNrLYS7Z30KdiTublkQpSzB/oKgGYpUAAEDQavGw1iMUUTgcswjk9hKMqdmuasEphK5M
         5w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710885558; x=1711490358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mf8TbChjgkUHpdp7I/ykwc/bJc9eIQRGH4wGpVTxw4U=;
        b=RuY35+D1knvbF1UjbLI4AFo+6mitL3XjDoxXrppWrn3M8CneJ0e7FWGByQ0o9w30ml
         tkhgxjT/ngxp2vk0guiWOzs0/AwOEuh4tCSXOLodFbsgtIbGPeKGGu6jYcMujFUgSOoI
         t33wcIWMLadoAXMJckRGgnNqNv7Y923ZuX91t95CKS0ay1bv+xKJTu4b/fSMVJSQ+4WQ
         npiSSQwna1WK4StokDUEGY2nBDVb7zOJAUunS34GfQUC4F1d8b63uHx0Cqykr8NsvJdX
         26FZYaPjLPXLpnyr1pip4OS73Yq4qOOSultZcWPoBNweZzGfFdsrvaBf9Cd0/WJ4VeUb
         5dAA==
X-Forwarded-Encrypted: i=1; AJvYcCV9/LM2g2xIEAWCd1tyt5Pb58GdtX47dPxP9o8DRR8MoGUBEtcfbJNHqluavieYwHbzXMgmIMVGaFh7lNs9jEdwPjt/8LLGzyqL8c5Y+meW
X-Gm-Message-State: AOJu0YzTVe5E0Gvw7itlwx9cUu3SFOpmah0Gc9OHOvzfAP/yQH5/+e/c
	KW15vAavuQwv6h6vp9xxtqQQoGQG3ycZM3xS2ztd7OHmM4h1Rw3Q+dNXJ+n38n8=
X-Google-Smtp-Source: AGHT+IHxqp3vSJIj8u1FQnLhGGhgkkZd9sPyRN/6PCbIT9hhDxZABaPjD8SNbLUKLifMerMmPS4+xQ==
X-Received: by 2002:a05:6a00:cd5:b0:6e6:9ac4:d501 with SMTP id b21-20020a056a000cd500b006e69ac4d501mr443835pfv.25.1710885558184;
        Tue, 19 Mar 2024 14:59:18 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020aa785d9000000b006e6c61b264bsm10273892pfn.32.2024.03.19.14.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 14:59:17 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	tech-j-ext@lists.risc-v.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [RFC PATCH 1/9] dt-bindings: riscv: Add pointer masking ISA extensions
Date: Tue, 19 Mar 2024 14:58:27 -0700
Message-ID: <20240319215915.832127-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240319215915.832127-1-samuel.holland@sifive.com>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_145925_714889_B4D21173 
X-CRM114-Status: UNSURE (   8.62  )
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
Smmpm, Smnpm, and Ssnpm. Document the behavior as of the current draft
of the specification, which is version 0.8.4.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 63d81dc895e5..bb7d5d84f31f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,18 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smmpm
+          description: |
+            The standard Smmpm extension for M-mode pointer masking as defined
+            at commit a1e68469c60 ("Minor correction to pointer masking spec.")
+            of riscv-j-extension.
+
+        - const: smnpm
+          description: |
+            The standard Smnpm extension for next-mode pointer masking as defined
+            at commit a1e68469c60 ("Minor correction to pointer masking spec.")
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
+            The standard Ssnpm extension for next-mode pointer masking as defined
+            at commit a1e68469c60 ("Minor correction to pointer masking spec.")
+            of riscv-j-extension.
+
         - const: sstc
           description: |
             The standard Sstc supervisor-level extension for time compare as
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
