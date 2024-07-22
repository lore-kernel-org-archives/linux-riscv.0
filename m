Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C07BC3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 21:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alKt62dpOT1KD875EgnNayCq/Q7UHyMp6gqX/eipFkI=; b=11+Wpr/QKImE+f
	ot6H9QVTr0z5TFVWfm2/D9jqmeO7kMfre23pWFpIAV9iA4KKrDvDJbDt7dINEp8LDN1fwvH/c3LEn
	N2pCF4OUmlxjBT/nKAXZi1q38VzIefLUogTkvXQTkC97KEHX4JZTErCrGz5GuSeK/nQdVdtDS00DI
	MRpWSv8xgHh8kvYXmwTf92fzqQq4Q3yfZ+N2SyJ9qXN1GQ9gqysQUgg016JXAzv/3kgUrPdQVm+lU
	bHKwP58UN4YjXj5EA5+Kfoiuxilvy94w/nqUdaboShwxg7iZTknxn6AGRWdgq//aLbEHmEG8wH13H
	zgiUIR9VDYTkEVohJpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW12y-0000000AfMf-1979;
	Mon, 22 Jul 2024 21:58:20 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW12u-0000000AfKU-1YfW
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 21:58:17 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso1103322b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685495; x=1722290295; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=wp279YC74A16j+cDMsGtTDldnmhM5rYYN0WGBl9TLGZMeuDu9ZL/5MXka3p6MX0VDJ
         VEMjfgGLTNPaNpX+XlXkJ9bANovnu8xvq940+rUNbAVQrltuQMSV3OotGbU/EzB+cVd9
         PXDbTEDphWrKNvpZJ3yMNDaF97QbYptRSLTirUxbPgtmyr0IRtavKVx/oBHsaT/Ey7i1
         h1zxoK9eycMJt1AKsEZ6bjdh7A5TMXbRe80oaqiINbZ4pXhIts2BbDIGQOE5v0Fz1S96
         7MNvfTjKoqUEj9rc8xI6z3YRudToigSLeWXhmnNUKtj7Kcf2CXId2YueILTvDJZC01aI
         YShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685495; x=1722290295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=UkboMusVCbJCdwD8i+hEZwLYuv23c9/aelou0pteIpltnE+X0sr6EhMONsAzIz5B2c
         eWz+YlHmhWsXGAC3dx92gKZ4TsYR07RzMX42rgrc/S7df+IhaU6lw9aLu1mbDuVOJflZ
         Z67JExpbmoQ0iLGeOx2DdNoxHLuP+nZkXKsy2VwlSUye7XU+VRNN/Yv4PhbcCgtHPRyl
         N4IkkanERHgvLRB7DzWiJ4qMYBGUt8QDm2div0WGR30jhudCvsWoWXGZqDDiCv48AwJ1
         GklrHQylyPcpu/2lekMAvy8FdytUk2S0RGUibT1gM5lnx4slU7esnHZ/J2B7JJX47iNE
         8ZuQ==
X-Gm-Message-State: AOJu0YxFmVGbLyRzjI5R7qDJsJ6T+zn1uZ4KBs3HPgaRTK6llYJhTDCu
	3pKDV3Vf6KOoCsYvaHXkPEpL1tctssYyOlhoXzyES+ixWj9hf0VHLxhneUTYh3JJQtGkiSr64PI
	p
X-Google-Smtp-Source: AGHT+IGnAoJ5NYdojrpk5kNKJAL/+A9oPWkqoZylV5Y3F1ZmyUCdRxQIgDj1CJDkY811t3vfT0g/Uw==
X-Received: by 2002:a05:6a21:612:b0:1c3:b20f:de15 with SMTP id adf61e73a8af0-1c44f9696d1mr927612637.52.1721685495398;
        Mon, 22 Jul 2024 14:58:15 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:14 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:06 -0700
Subject: [PATCH v6 02/13] dt-bindings: cpus: add a thead vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240722-xtheadvector-v6-2-c9af0130fa00@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=lK25kSvuXBbjCsm1KOScKY69sa4rMHinL5Ye8aockR0=;
 b=W8J1yxGjPC+Bnnprr/HHbu8w/Ykizyg24i4N6mFJiAW32HSh9qI/PyEGVc60fweu2c5CDTN1W
 AxCC+NW/3zQBWqBTUHCkqRhgYF2Rrr8gXrY1cDWPE5Er/t5Eit1QIdy
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_145816_461534_1E989C57 
X-CRM114-Status: GOOD (  10.88  )
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
index 8edc8261241a..c0cf6cf56749 100644
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
@@ -95,6 +107,13 @@ properties:
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
