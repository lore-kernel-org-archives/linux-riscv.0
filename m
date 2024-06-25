Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16694C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcHTUmNzz7Yz5Z8Asc8QoQONZF+lHDJZizrE+nhMo/s=; b=HLPOFUqifyGKlt
	l57bNRbp3Tdzt8VfxIIsiWQcloWk7iD1HunPav6TBcwjXc9ZxTtkx0kybBvySuX0bRK2Y2nOTou28
	a2BBSlSpLpGfDCFFnWwRnT9OoxX5R/pbkjU6S59sCeCUjGR5fObggGUzoddwbwsuIYc3V9TsplD4L
	nW0ZyG397i+7Bs85Xy2Ruz3m50uq2t4wEPVlScWWOeUgHCJ35OwBLmHje2qyRtETuvtHKXTNJbP6I
	+6ltSFfE20f5dtPpQsh8HJsyr8qhTZ7MlyUd/HJAu42dwoK/STaLqxOjb3Dta/O23RuzfiqCrFoGa
	W4SygxjQjPjX7N94MiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQ6-00000004V4W-2AWH;
	Tue, 25 Jun 2024 21:09:42 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQ3-00000004V2J-0h1l
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:09:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f9b52ef481so48999045ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719349777; x=1719954577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RApDUBWnH8dOo11vUms6fSIyGurtiCmTLAn99yajCOk=;
        b=DjzE/LijlkPXd2oa6vuSXpi5Yaf+sBAKuiRLWHIk8lZRAEIF8/J0KuGwcrHfjEts0o
         qXHBPPOtV0Rpfix8GjiQ2F1AbWzNhv1j0w4h4VGr2GIcbc9EPfEjkzR1DNKmuuL2I/Nc
         M7vihOfS4lY6Ip9NGt6P9LOdtEfpQbGmBIhaGFKIZEMIw+729PtjfDmXEYY8BqDiXXIh
         5ZtzMTg48Fi6/tXxcQa1d6gWcZnGMBzUN1Ko7fvKVpr+ptAPeZeg/2Q65GLY0dzrHZkA
         uhK5Ur/wDebKnh2NukNorazKzbrgeECYkGI4lTMrGbUBWl/1T1hi9QdTSU6MJsiX7Lub
         LKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719349777; x=1719954577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RApDUBWnH8dOo11vUms6fSIyGurtiCmTLAn99yajCOk=;
        b=a7zqELew2to5rn7ucKu7ZTGJnXZiGncbTa8Ei0nk5pZQA+5P9PuyuGFHgYdslQW/Br
         A+d1AOHqJqM+ah4UqBssBuq5ALycaOl3MYlIUaIcaFl3jWpHEia7fuGUmQQ23i8UXZdT
         lEfkgKCroyNQFPqda8uWd5keo37OQee+gEIZeLud458fcHrnQJMjRFvB5dKz/7Ql8yd1
         ApnvGMkPMOJXscDHPUok6hWNPmYXI1EeGqWeWglT+6V6rt2NV9aonKKllhyG5XyK4h6j
         70qGrr54H7bGcPON4egEc9PmCVYI5Hmh8ChptFppY7Z5IzM7Mu7vnckLYapLvMFjDmQw
         f+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwyGAc1dXCrw5n3V7CNrjTYwGcexhRQAJAY1Fx5z7n+6DeET3AXstq4siioAex3tsHKwzhrqyBDCLVGd8XdkLmIWi+qN4MvgH3pttAg0WJ
X-Gm-Message-State: AOJu0YzksJj26xdxtYkBcTJyjNYpCwTSdGywE2sXClP7cM35U2OJWJS/
	9EYVQhIGdpuV40BtUcTz040aT7bBXyRWH7+wzmnrmLYIJD8ppGtQumetZofjBUg=
X-Google-Smtp-Source: AGHT+IEeTn6riobaHMOyEcGvzSEs8JEyz1MxFY6peHqzdzbBPKE7rdm0nA1jgpjPUCoTtFM7TxnQ4w==
X-Received: by 2002:a17:903:230e:b0:1f9:c3a1:4b65 with SMTP id d9443c01a7336-1fa23f1d44bmr113141665ad.47.1719349777431;
        Tue, 25 Jun 2024 14:09:37 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm85873455ad.110.2024.06.25.14.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:09:37 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 01/10] dt-bindings: riscv: Add pointer masking ISA extensions
Date: Tue, 25 Jun 2024 14:09:12 -0700
Message-ID: <20240625210933.1620802-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240625210933.1620802-1-samuel.holland@sifive.com>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_140939_436922_B0419D2D 
X-CRM114-Status: UNSURE (   8.78  )
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
following the current draft of the specification, which is 1.0.0-rc2.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Update pointer masking specification version reference

 .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cfed80ad5540..b6aeedc53676 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,18 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smmpm
+          description: |
+            The standard Smmpm extension for M-mode pointer masking as defined
+            at commit 654a5c4a7725 ("Update PDF and version number.") of
+            riscv-j-extension.
+
+        - const: smnpm
+          description: |
+            The standard Smnpm extension for next-mode pointer masking as defined
+            at commit 654a5c4a7725 ("Update PDF and version number.") of
+            riscv-j-extension.
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
+            at commit 654a5c4a7725 ("Update PDF and version number.") of
+            riscv-j-extension.
+
         - const: sstc
           description: |
             The standard Sstc supervisor-level extension for time compare as
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
