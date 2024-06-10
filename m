Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2A2C27C4F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 22:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQIP4HvixgiSIfMUH3PGCHmhRT/x+6C/cEyQH0/p5CQ=; b=XD2UqHuQg60zbP
	UER8rGbKjdHI94dmbYP//APxt9ElmOg64XupHg/2HpUYNlSoGctZnsRUhDw/BKcDEaaoExSdFsm1g
	8X1yePrCzb/pudR5hVghtyq9R4geP3sBHDrXRtwCBoj8Fs91jN7NkS0IM9UYZy2nZyXrHxa6lkbk8
	89tbJLyEPpgee+L866KrvjL/5Lu0RdVVdeww/NTtAiAYkHGZRdZlv4fb3ikrAVN62+k9kq9ciKIkj
	sxSZoJ1TDvsMWUPY66YNm2tHe2i+PCV0c5E/hhRmIZa93QypizLBe8H7Wzk1TI4kCZSF/GPdgPWDt
	p3BflJIFx71TFQW8MIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwh-00000006jWz-1EsU;
	Mon, 10 Jun 2024 22:56:59 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwZ-00000006jQF-2Qy1
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 22:56:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f44b441b08so3156855ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 15:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060210; x=1718665010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0+4Y1+kZj7kzyDByjbiS4FxJ2LwioSPa5gPvRUttq4=;
        b=nUZ4dFuscQ1st6+PitPZLs6IxKAZkF3IOc1FoqM+aPuCXGJynDPELYQd03VpXbtLYx
         kmkLg4P5NBzkhgMP0RuzUMXNKbbHhYwzj7jspOh1yQR+9liT/10GruMH1aHxiuc6QSvW
         yOcN5gpqVh0qNHzDrx94eg+VgvIvtwFjeZYcgY6j33hfxwz/DFnA2/7jHJtfNCQW9jfC
         Uv2NtQcNg0IN1hPlyep4xnQl0gIbdr7CDRjbnBiifRDrcPQ1mgI/azneV7idgacFCg0C
         GyOE2tQMiCeVsziYcyKtWB08h5ynnn8tdHV961c2svIi0l+5DHG7x+SvyrEys/2FnoHv
         HsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060210; x=1718665010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0+4Y1+kZj7kzyDByjbiS4FxJ2LwioSPa5gPvRUttq4=;
        b=qpzhc60NQbKUhGbNMr9kjg30Y5o5W0GOWMM6ahYPA6tUr7p/9RTdggJ6KJCM5xwg6m
         XseecFptO5dkSnSPLgulQKSOkNBZpu33yt41okGHKT+3Q8/MKSXXhTp2zB7J8ykpSy5p
         ts4JNPWB+ka/m5P5eIgiohPEKUDlP+EaKDCTUWgEc11f4HQ0BbwstpvVx1PFcpMXzQg3
         nsH50jV3YmoWu6rFCc1RXaEcgvUk9TTaGeNu3cPE8LOcLQzGNrMcSCe8XHALHX7HiLA7
         XHM2zCesBbkMQkFCHKKHzneIFSoDNtEOWcf970ijfshnJFZ2+lGFZ45Pn256UY6ZvzI7
         zxXw==
X-Gm-Message-State: AOJu0YxF8AgdkkbizGGpSYWTstPWjy3VLNxGBZ6hX7TDEOqoWSRogvy4
	ytaB5gYGa5/aIrhTILmO9vqwf5N1GFhcO6V6S9TfmCWatvwAQWAdVecaCYYqVkWQX4brOD9CBcu
	q
X-Google-Smtp-Source: AGHT+IHY9zRTc7DxB+cvmi8dhG7Q4tdFTL7Ge2pLkU2+1yqUqlGWPw0UVlqVpdnEA5wKCip5t2vlNw==
X-Received: by 2002:a17:902:c40e:b0:1f2:f090:b2c1 with SMTP id d9443c01a7336-1f6d02c05c3mr118292465ad.14.1718060210095;
        Mon, 10 Jun 2024 15:56:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:56:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:39 -0700
Subject: [PATCH v2 02/13] dt-bindings: cpus: add a thead vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240610-xtheadvector-v2-2-97a48613ad64@rivosinc.com>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=1855;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=FmiYt7nDWXyQO4kxiIrIwAfbDlksD7XmLdehRC0fezg=;
 b=j6worq4qjVrGWSrMLs8ZptH5pEOv7EhqwLLriJxX4IvyZ6q4PNQkoLqbTB+1gPxHp/ucFxW7p
 LqxKtRcAfNJBzenwMB/6ovUljV8lB8Tsp26Tv9p3U5IVmx1duDVW6tB
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_155651_904275_5615A50C 
X-CRM114-Status: GOOD (  11.03  )
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
