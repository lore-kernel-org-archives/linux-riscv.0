Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7F5C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 22:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajJuG6BuxlsqFU+2QTWP5oCDpAWmK0DN+GiTAy8n3/c=; b=gZ+Smq4PJu4Tmp
	9XpHRBdlTzNJTA85XLkvp4q5C9mpIWyjcFSc6aDBV9qNTvqSFt0gDLUYsvENlkI25y2nkK1OkfKJd
	OUF2hmseNtSnUapDQOF+HXaNtvJy2Rhnln0rBeLg1zcobpe/7wB0MEaru942xCXrBlWXyAwcq8mfW
	HiVOxa+nWrB4zrYLsgPTkRXaj6xzvbP4FZ17FUjKVXau9cVOz5vDh49jyYgdeAWQ7trip3A4RODK6
	cQBFJdiILM5jYsKHa+GtCQxj96hX0QRLKIMATE0qAj+nq5pxAbk0BSRL75hLZxHViWmaP4F+9KcY0
	MqQ/Uhe0hUEPEo6seIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwe-00000006jTY-0Mvx;
	Mon, 10 Jun 2024 22:56:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwX-00000006jPe-3Pk9
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 22:56:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7046e87e9afso392823b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 15:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060208; x=1718665008; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=JY3LCH5ELZ7QralDDSvwME/nTjoCAqE8OIFq0EOqQMWhbKy+bpP7xw7YOUnOLlDWPx
         Yelk/j8GaVLqCSSKYRsx3Wsc14qe6eO32ryTT9FR9xXnBnQ7ty+adULebcMd+NQKaN8j
         qyg7oCcN70rhOTtx6b5XMtmT/RGpxCbbXTAxSBMSrj5OGLXLedr1XiWGuhCYlZeZAr51
         TrR0RNQaVHAoau3SSuKstL+gWscORlKnZ1D3r6K4HFlxE6NcWQlcQn4yASXx69pxCNtZ
         O+5yyZnX7RQUDvoe/+h0Vl3UPVBjeR68nvY6oVGMaFJWCGIXfHx1BFuMeBJOTnxf4dHn
         H3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060208; x=1718665008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=i38vm2ny5GL/6rY8o/LdZ8CocpBAqAwEkMG2eyfOdrDSHZqG0NP3/tRr+GGIfHa/kA
         RbHCdVVQzafNL0ATVTKg26GR2TmtxN955L01kIxGE4XItlYLyvR9HZd2Y87TeN681o4L
         128y+hGHF1PK6pxiPK+FpEa56dQFV3kOFHqNVBBdIa0H9lqV8b9ktPghAurLF9vbpPtb
         gy0ARCyhQ/z+bA1WqCe9at+jBMAAzyrbmdyuZiTP57jhshPAtANY6RSoVKvl9gbvvl3a
         NhHg72yYEDttR3jL2OzudqHSjbGdrrR9uAp7+beTMhhY2Bfwh+KRuwpHcE61+qMvfChp
         MqJA==
X-Gm-Message-State: AOJu0YzDg9dmdSpOik6oV9q3bgFizAEjySJ9Kll6NGM52qA6tjwPdABM
	k28wF1qjVmcixeb7hA7nXzXHkKXix4UVbqwbeBgqrFvUH6NUIj5dUB9eHIYM3+xwMQrJIz9pJ9D
	I
X-Google-Smtp-Source: AGHT+IHTScRC6npLyMuiznHwgZ/G81KfDT5NElI6OEIE3NMqZ0s8az3fTA0+aduaOIuSYA45KLIADw==
X-Received: by 2002:a05:6a20:9c91:b0:1b8:6383:dee9 with SMTP id adf61e73a8af0-1b86383e2c6mr1326576637.47.1718060208075;
        Mon, 10 Jun 2024 15:56:48 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:56:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:38 -0700
Subject: [PATCH v2 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240610-xtheadvector-v2-1-97a48613ad64@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=mbyCO06LEziXabJRwA0QrR1tvxFI1gB5h8SNd3p3WMt0inTqc+ASsfLiJiyJb5P5ynG4xIGKs
 L3OoiPaYjkdC5ZD3vvpW0fx5bUdLT6GOM5axMfpSweVCy2O9ODt8uud
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_155651_796976_42EFEA48 
X-CRM114-Status: UNSURE (   8.08  )
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
