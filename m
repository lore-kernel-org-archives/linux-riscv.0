Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94257C27C6E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajJuG6BuxlsqFU+2QTWP5oCDpAWmK0DN+GiTAy8n3/c=; b=jNo71y7836WrxD
	d1C2pFreTSGCKKaXcp/z1dPSt4gTeRsoyUN4X8FwyV0CdVda3TgTSeR+1iCSz4REjePSXEQ2I/5Rl
	by7P0mHXfDSfubjvFVcEGiU6PkhzdurljFk9bgQmAbcjUbkdlCBudEtgFd586zktvaoRZ0g/cybBW
	hHRemJuMxqnt9WIB2eOOscXtBV6dz1DPvpxhH/QjYkzKSTbbgzDwawHPZ5z4eFQ7VVQ+bdj7iPdHY
	mtva1X8sYNwJmKhDf4MgoR1GdefuuMeHA8Z2/ecuJvuXnSWU6E9obud0dBmVxeoXMUGjzkrM/KDMW
	JcBXtHDKxMNbbBLjfVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWud-00000003mPw-1ior;
	Mon, 10 Jun 2024 04:45:43 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWuY-00000003mON-30Fi
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:45:40 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-70599522368so270028b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994737; x=1718599537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=s25+TkwM0flGx/1Qz023kDnKr4+o40FBloiwCZlXMpRF/Xf87CYHxSLIDhKwtVp7wj
         S1NmrxZ8YkWFZBHFtQ7moJxpnP9R45bcDOhPiG7Mx9coCIX79MvON7iM3EAji3PicjvL
         l8gJkUrGIgA+rKxeLLObYh1Y3FG/tB32S3+F2InJspe236Q06qUehcFtweKu7wA2REr+
         526242X5c1EU6LsfFzznMRGuTtN35fMm/Dq+JYm63y//LaLhMVAVs4cNbBn7wsMnp43d
         PlOrrhHun6QwZYgwX/WhSZcKrzasGTy6IZg5DljeEq4vAiCzDkUcgInrb9YzHJLOT2Yt
         jDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994737; x=1718599537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=N/sRYxPzdTesh13YpScgqXc6t2DGhFR0/QEV9YRirwDK7+KaUVhViecjyiM5d8zf2g
         /8eWiuqiZGWfg0KEeleSk8lsNfN0zxVI82GH9DtTA3YZofH3v6iv6f9C3V7qrvhlTjdM
         gHJBpcD1STkvOeZPUSlejVoD3AZI9HaIjAOMMVlc20WXjW5NxinfuRNmtbBNyd1A/Ce7
         UuNUupHbzYuWtwjNxB2QtDm7St/k+ZAq7ubPb2gRXet/8OB2jtamw0eHjMbElp+MzbAi
         ERmxPnREmbvPhWP5AYEjXJO7ghQPu9ijMPusOQiZpqrSCCwgKXif0/4LA8X/Iv51qtpG
         CuEg==
X-Gm-Message-State: AOJu0YzNEqQq+GTLNFFZ8NfFBCZd4QlIMmBhjoHEOWomh1xln/2tTIyF
	dIdzLiu7Nar06uXtFK5Z3VHzNXKfoXCvDP5pcVjzgqGBOQh1ALCqmRIRyRDKryk=
X-Google-Smtp-Source: AGHT+IFWDInJoRdiv7yy4abVtD7rjRBD+5cj0P5U/4ieBFQEcEQDeMGkcWS+bxqhxTSZ6IUNdGy+uA==
X-Received: by 2002:a05:6300:8088:b0:1af:3715:80c8 with SMTP id adf61e73a8af0-1b2f9c72398mr7890004637.46.1717994737211;
        Sun, 09 Jun 2024 21:45:37 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:36 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:06 -0700
Subject: [PATCH 01/13] dt-bindings: riscv: Add xtheadvector ISA extension
 description
MIME-Version: 1.0
Message-Id: <20240609-xtheadvector-v1-1-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=IOAoxXefLtnxcb9/gkClYMSBjiej8R99FUDNxVj9T92yij8sj0PIqkxukBdOvfHybExsRN5MX
 8IFqt96IbAOBrlmGCI5VVCTbG5L+9+BjW8yNnuO22FIABU2PMBnuOK/
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_214538_794359_36FA7D11 
X-CRM114-Status: UNSURE (   8.00  )
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
index 468c646247aa..99d2a9e8c52d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -477,6 +477,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -484,5 +488,11 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
 additionalProperties: true
 ...

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
