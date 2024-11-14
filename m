Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79623D637D8
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 02:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6GByhhG3Wov/3Io94Z9hdAoz3oXYVpH+wdP6VvqOOs=; b=er0uj4rM3t83Xr
	TNRaxhw/Q3DsR/D/lwF0mZW5B+nv9Ujv5TlRaN3n+Uc3/E06K0Y/Z9uQrPdCBbzhSEaVLrT5BWRjY
	cG9EfYGR346d5n9bbLST8gli+lPc2xspr/nzu4kaaPneb/WJTAXVKJspv6sK/mzX1I4ucOey6EsCz
	hSrJnyurqve8syS0u6obxmtfpUrimpkS8GcFi8m4SNASLp28f7M+JxX1sqTdQ6arwFn3HaOF3ZC9g
	oABBJrQMDMCBbxWTZvwyPsALpZ++3lFtxDXQx2HNZ5bJSmqs9bhAiKt7Pg29XAs+xVb7LzDkfLknf
	cpritgN4WzFycHr4KD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPUF-00000008WTM-2htV;
	Thu, 14 Nov 2024 02:21:35 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPUC-00000008WRH-2PSK
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 02:21:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20cbcd71012so770095ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 18:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731550891; x=1732155691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KA/s1VPnUH1BvCKkgOpgEavwwud/waK2bOJX2I7dv3M=;
        b=Bu7SoY3T/TJyuousXZWrQ1+1cspdqVwgyzT0ZLFtheh8rIjqnMa56yP9U7nEhBu/uo
         oo36yWQkNxzkvhKxO3r64fXRa3AO32JqOpzja0vuLBPt5KZNPxwNTLoiHQA0sHqpsXZJ
         H58VVObkk9DJX/77UK5e2rP7DiF6tz12/xVrrGqt3mDzvyKMRC2kj7oejrFQZO71B42w
         JWL7WJH49kWB86nl5Mfbw2XiJ/2NJ2WxBnxYPsYVV5yY0bXxN+YMlE0GXJMs6X+aPwBg
         QKLeO//HcQDdvPGcHmoWDCIVEt6XxEHc6ADrVtHPN/EgBwychnCTqsMRyp/B5wxTLEIX
         CSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731550891; x=1732155691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KA/s1VPnUH1BvCKkgOpgEavwwud/waK2bOJX2I7dv3M=;
        b=kbrMovwFQvW5ZfFVvZ2fYmGTr7ynuM3N+8dgizXpPzzukUzOhF9NLLbnyhuH16MJJ9
         9G4BEeX2jv7QGU8L7pjy7mKbAYDSimfcmxTJpn9cTK2IXq/p236ka/iKB7lamLx8aom0
         AUNe4h+SO9OpuBHvAz20ZvEyFWs2xEIyORjw4jARa6mz0babnfbUiskH5SeH5CbK/xLc
         nhvqy10JMJYq2K3fR3399xssHeqFrkwfbwd+8zD0UdaBFarLKQFsDQmV/3d51TIs9OjV
         xJh9nKPNMhuRNHWBViwwDhMRCJa2L4c3Y15fiVtnm5CTGQSUjXsytdC49bOfVezOqYS+
         JUtg==
X-Gm-Message-State: AOJu0Yz/Ir3gafaEOl0A8qIQZPNENhgB7qo6rwyQ3zwUHlzZRDH3OYZb
	Csqt8uExNy0jtMpepaDycYdOFwx+hgIXgTRd+i3pvOAVaz3xdd3+xOtJaTmgODQ=
X-Google-Smtp-Source: AGHT+IEU6HI6i1xSU7kMiEnEP/A+EtO2rlfElUvguwus0woSmNASZDvVnaYZJ6C9Py5xrtSyABZYoQ==
X-Received: by 2002:a17:902:c406:b0:211:aa9e:b808 with SMTP id d9443c01a7336-211c4f9ac66mr6827425ad.6.1731550891627;
        Wed, 13 Nov 2024 18:21:31 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c499c9sm406875ad.68.2024.11.13.18.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:21:30 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Nov 2024 18:21:08 -0800
Subject: [PATCH v11 02/14] dt-bindings: cpus: add a thead vlen register
 length property
MIME-Version: 1.0
Message-Id: <20241113-xtheadvector-v11-2-236c22791ef9@rivosinc.com>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
In-Reply-To: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
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
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Yangyu Chen <cyy@cyyself.name>, Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1911; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=l49h5IQ0t73S/rc0W+6cvo1w2TTL6hTuKcG/fPLfsyU=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pp3Pzti92kDtRf3HyY7+DsU7rpFdd6Hscsz11VJP21q
 fYOz2WHjlIWBjEOBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACbyeSLDP0O+RfP2M9e5Jm2T
 XiaRZW/3U0B5xj/RzAeNcz/t2ulyTIWR4b6M/tGJ7My7OwzTS7etNZPImdT35NufxG+b/PtW7Hu
 4kA8A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_182132_654752_2D0D5F9F 
X-CRM114-Status: GOOD (  10.15  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
