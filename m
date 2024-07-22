Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13479C3DA64
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 21:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sLQszs8uvBMuM7q3YsznaxRjkr+k4U7AGQHcLo4/h0=; b=ssZ4/de7Chj/8r
	AkHoPvRk1wIOakJdVfokn7OCjdozy0Y+EfuFabJcwvEd/w15mh4541i/dM7SBeuj8/dd/bqtW16bY
	fJuJG4GjPTH/DFZGSWA85lIAt740ujDDyyuZhF5wpb1BN7OK6yuWfLAA1+uFJpApfbCu2I4s6EFi5
	RzyFCvRtn1hUgUt6ARurxCziwky0R04LprVARwMze40FCfvNVqVzLhmd2zqRoutybd1DT6CEC542Y
	CV4ABWklJKU5X7JMT5cPri2Tved+ttPr8SsRYX15eN4u/L/9VjGx29qAlvtw7DBH0tINn1n2te3Ki
	6RTpdptTG1IA3WXTBPLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW12x-0000000AfLg-1S0I;
	Mon, 22 Jul 2024 21:58:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW12s-0000000AfJz-0Mkf
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 21:58:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc569440e1so917885ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 14:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685493; x=1722290293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=qCMnkaku6CD63ZdjSyfrJJz7lFvaouwgKycFpenGECFL1tFtY831nPQQQN0n7+dbv+
         fU6KexKU3WQRPy3KI3mn1Jik7EjfdkVIvjb2ZbWGy6Qlni2jLa4NN0cyqcCAKIDRer4D
         2hwbagrCJorUfIQlQZwM0dgx1O3CV0ltUcyd5/13jMOK2RZZh0QAjbbM1/M8PJH6rG0c
         bBdNLuaV6nC6Gs9QfUInpESq9dXzQtmbuhr4Cy76tEa8AQBTSqtqJz8DW9zjnEeQGlKN
         YQCr4AkTsBox4OV4Gkh/DWSDY302Lwrq9bcMJkAGHCfsHVxi7WR5XSwtutAOfGOW+hCd
         khVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685493; x=1722290293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=BFUsRD8LOH8/0xznT43F3ErPLRXyEFRcQJFubJ2GWdC5gc4dCUDzz91tk1y04wkPwI
         azRr254wb1VZQJfDA3rWD6Du5vpEsFMcHQvH7SrrY9lpKCaJyxYTjyfqGKCsKC0WX2Pa
         lYQblVTkkcMWEbzZCwpi+8N3V/22mgHRjz0P3hirw39KTvALlwapzN8owXA+GiscPLLu
         jVwzxz18OhkffO1Sr9ngFHiWDR6TvdtwHBb9yc9c/YrgbVVvn9nNJ7g2OkxQHKcQZ1k3
         2BRKsb5n0hAM5j7Q5jyUGKmnHwoW62xiGAGwIr+hfPqVK3NhFgpqNMcRkGUQVnm4PuQx
         vLuA==
X-Gm-Message-State: AOJu0YzKteZn6JeMgDYK3fS1HzTxd6GJ+tFWaOQsfSotBCIViW2darcO
	Kq2jd0jfhQQOOTfFM7JXL94bJNzG08l3O0sHv2Azw1K/G9z5Bnu15DaNO8ezeOU=
X-Google-Smtp-Source: AGHT+IHTkfkTbO9687i4Pn2+RihIVEo5h0oCdzVOneV1P9azYW/tvjOn1QPbNPDGhVqGXxDgJEBHuw==
X-Received: by 2002:a17:903:41cc:b0:1fb:7c7f:6447 with SMTP id d9443c01a7336-1fdb5f6b353mr10313025ad.25.1721685493071;
        Mon, 22 Jul 2024 14:58:13 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:12 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:05 -0700
Subject: [PATCH v6 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240722-xtheadvector-v6-1-c9af0130fa00@rivosinc.com>
References: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
In-Reply-To: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=1788;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ZzH0VgSdYutk/uKY2omj651o9v+E5HP1BijtgXJzAp0=;
 b=nZEeYwaJqqmvsjfP3STCkMzgTO0YV5QHpTcK9EbgMZdRapnAEgagfXnzOhMbcFXpInDpLxRU4
 H+rbxMq8H8mA7REaKmytn+kSbxVFuc5Ssov3TqrIQwafO799xnPzEis
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_145814_550431_F39130EA 
X-CRM114-Status: UNSURE (   8.52  )
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

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..1a3d01aedde6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -556,6 +556,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -563,6 +567,12 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
     allOf:
       # Zcb depends on Zca
       - if:

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
