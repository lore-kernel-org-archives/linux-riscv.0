Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD4CC41513
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 23:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aasLTXIj5SsWF+Y4Byrj8Az2A2phMUZ/AUKJ3EeQ1f4=; b=pnENye0vibHS8H
	eAMahjwvhaHih6fTKKz/8HP51/kznUApxwpHTeO/sgxS6+Id+QjMJKA92ACxniz4WbBR4xkAJRVjg
	Lsc87NZYPlmAUMmmEb5yRmfmh2N5SM5k5nKUWqvlCdYPVUz/2rfZkfdQe3HM9rOE0wRezFKiM5iFj
	zCHpJiw+fPapPTFuJU7nQJodBzF+WgD7Ghemmibm/9MMoK8ryPcjpTdnEv+MNGJiqV1dVYnCianpN
	270fRQaR2KaXJUYuRnLINU7/VsfStotP/5xlk15jtcJU9QIvmFnOjd1ftn7zZuRANp3D/PQ1bYhXH
	PYto69lh0uxbbRtLfYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BK-000000033j3-3qtw;
	Wed, 19 Jun 2024 23:57:38 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BC-000000033eB-3wVL
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 23:57:34 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1f70fdc9644so11261415ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 16:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841450; x=1719446250; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PelCoZIE6iF05n1jOzSStOEaV77ZcPwwfY9j6HR1NNo=;
        b=FkMKF6ASkvNy61G3Z7yCGBc7CjDNG+q78ZZZLu5jLLD0ZlLkzPYH8Ziae/BWUhEEHf
         7WIQ8IdCmaZ13GmyZsCX1NLsBBg4BTAX2/kiF4RjqbMrCs92G7PLyM9LlFVMOon+z1wt
         23rRPayQiUjslY9WLsmXzPJeyk/DR3ayF+ZSWFJGYdQtbMNEbIRXjeazdxlrw1E4rDep
         d3w3nwAmPkeHTbIbZXgO32K8+U/RgrO8njxPp6YZi/r/J53EAq8i+6iPONzxaNIzIT5H
         fEDxvZwp6Nk1mQNwxZTyBZMPHWM7SFXxmHnkapazJqjCUaA9jrO/VZua0D4mpdPRVTg1
         FzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841450; x=1719446250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PelCoZIE6iF05n1jOzSStOEaV77ZcPwwfY9j6HR1NNo=;
        b=oWOzIK+2KzgLXja/MluzEU2FaHRcn5ly2ZuNaDk9Mlbo1VpqKqUoDTAQV7gXTJIdFc
         hF9+JxK0Re2llkwSFJ1fuYm6BEEpYiQJAfgwixiTHVeKOdo1lCCOootFniSYA/OA0+ew
         SS0IJA+xbzlRUXOkeVOl+FwaRg+qhFlC6Dw3faZoSS+Q8Asy/PpfuISfujWT7HY0oJpq
         6ZzuWz+BhrVArt+4b+ko7cxOFMqsOdRio3S7S4thULdwVPKR+UKeT1rY17XmpCl3Sbs9
         72v/VMV5FucRGSqxI8Hg7nnIOLq5zbWEG0ciM9QrcsbJE+Qz1Ma13G2kL1i6qo0pkCg7
         9rsw==
X-Gm-Message-State: AOJu0YzRtkOQPJeeCQTaCuRZdtuzkzVNY/5T4i+xqlrOPwHgSVZl+xAs
	4PoOXTbSFfief/RN+BRhPT8DSER9JOZfJdoVzXNsTt/8YfGRz0pqDxRkFiKX8SI=
X-Google-Smtp-Source: AGHT+IGKiOHqo/xkEw31TNBwetx6wfNgMA1oKjo5fAWCMWu+48/TKV0DOjQRPhYoUq0jsmdx6frb+A==
X-Received: by 2002:a17:903:8c6:b0:1f8:50df:548e with SMTP id d9443c01a7336-1f98b28eff9mr98856635ad.33.1718841450144;
        Wed, 19 Jun 2024 16:57:30 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:29 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:15 -0700
Subject: [PATCH v3 02/13] dt-bindings: cpus: add a thead vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240619-xtheadvector-v3-2-bff39eb9668e@rivosinc.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=AcYcvjjFWiKhiKAl88lWRz1HvD4LxurkZU44w/pWvNk=;
 b=A9QBmc/bNcCzD9U62u8M5LqntgqiVYoO6pMKw58e5Ka8p8moOEMLez3mAwOBcj9EOCElapzC7
 Eek8Z+Nk9vABMXPKzFBZzvHdV3ycLm/UMw8VYhvueinEAk91PEb9I0/
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_165731_747184_6A204BFF 
X-CRM114-Status: GOOD (  11.07  )
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

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..a6bbbf658977 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -26,6 +26,18 @@ description: |
 allOf:
   - $ref: /schemas/cpu.yaml#
   - $ref: extensions.yaml
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - thead,c906
+                - thead,c910
+                - thead,c920
+    then:
+      properties:
+        thead,vlenb: false
 
 properties:
   compatible:
@@ -94,6 +106,13 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  thead,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required on
+      thead systems where the vector register length is not identical on all harts, or
+      the vlenb CSR is not available.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
