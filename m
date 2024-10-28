Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AF2D13595
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 07:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O95UFC16Tez0YTX3qpeGjj/OmUauBypQ+GmrWqkFe/I=; b=45q3POsmcJyFyb
	Fho19/a9ms9Dvi3eOmDlf9bWroT8IS+wZegHj3v30rLy1offqlUhBkDUfqqo25i7n4sXtotH1Lj9a
	tDgmXKpuDO4ImXCiW3WCGujtN+T6J7u2kLzwqbCtBU7pW3FkpyjIc85qSOOLvhCScDIP5TOIJE8U5
	/anEBRbNzrDepGFbJedy0JEiQjgU2BunRLPvqIBrDwFuA/nfAdK/sMADt7NAnUeicThURsMVWx2Y1
	Inj4XkbMPCcYjDzv5TcNQRHGM23RMzoPnT1bJaHyvoZjfnWZn2danRwgnBjLGl6r2BrfpDmGDSQ9q
	atEhZQcdtnd/ug0mZJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5K1n-00000009qGF-1UjJ;
	Mon, 28 Oct 2024 07:19:03 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5K11-00000009poq-20bQ
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 07:18:16 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so2560469b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 00:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730099894; x=1730704694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHcOCAQRVF6wDwCpz/Ofc5RAAihYPSYxf02RxaoduNk=;
        b=F3DDyND8Sf1lshcZqkEL9BUzZnEgy8eoTgajIiavJLip4CTJ8VfGYpSKImGa71nfiV
         nMDPIhNJSZ+Z5/emqkhWcsKpfHURSgxdlFUHXXf8KRgx2aTFS0jBrWeBAf4eAW+fJ/JG
         nuCBCA7TEPtbwIcI/NufLryGz/WayqVSzrYgRIr2QvzLxcReA8tEfaqNvTsCWzRx/Pl7
         EHkwXu4NtzZFFN7efpLGyr6haNpdr+q+XJ9qg06ea2+3qS5g/J6IRBRk8CMv6bmJP/mw
         qhSsxI5GUORhKfzj7LO1+v9c+DxXpHBGXLcvoHFAoDN3FLJwi3B+2UFUfPwoE+V6dek0
         wvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730099894; x=1730704694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHcOCAQRVF6wDwCpz/Ofc5RAAihYPSYxf02RxaoduNk=;
        b=kM9ay7lFgIQ4LXuTel42X9p+xfm25NLER1vf9Rs2WaXdTkSFqmH+QkTnA2N759TnKj
         JKbo3b6DaTTx0lXLnyZLTe8e6yBM1p+4E1i0iXon/XBQa2Gm0JaG3DOLEpeVC0F7rx1o
         /Kj4tPrmzpDSXWxYXhhC5qIiSFjEm+AFs4UcfSyDwLcl85KB+CEdEHs7fpPhFIXKBYRD
         OiSm440/+krNK5iEF3S2jUx4fxravINS1EbnXcSATVcRd5atLTW9LW/G4uTz5F/+tUo3
         WKxynNUJCn0miQqvMVQil7iiqXieUmN0xE26NBYY3JNy9aILV8VS2YXFIVH3ZM0nQ5+U
         YGxw==
X-Forwarded-Encrypted: i=1; AJvYcCVjvzTTFrxcbbThVASemNkelYeuVzPd+ky93scK1Hco9ja84SxwBiM302NTi0/vY8OsXTj2KVppQ5f8qQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt1WKVmY3/Pb7EaIEd/tiRGvFNvbmZThdOhmRaXVEHJihT1uWQ
	SytN3S4FHJIIWj9sv5KpDzVxUiJeFBNgA4DIg3mPMSon+T70F2Yx
X-Google-Smtp-Source: AGHT+IGxScLweOV74hsHY8ybM05gxHwS+UEjeyeywhEqzfUmk+ssuwJt1d5kawmlBhnicXPFtNf0HQ==
X-Received: by 2002:a05:6a00:845:b0:71e:6e4a:507a with SMTP id d2e1a72fcca58-72062f4f6c2mr9457615b3a.3.1730099894293;
        Mon, 28 Oct 2024 00:18:14 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a21933sm5266089b3a.173.2024.10.28.00.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 00:18:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: riscv: add bfloat16 ISA extension description
Date: Mon, 28 Oct 2024 15:17:41 +0800
Message-ID: <20241028071746.869740-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028071746.869740-1-inochiama@gmail.com>
References: <20241028071746.869740-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_001815_541567_9DDD414D 
X-CRM114-Status: UNSURE (   9.56  )
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

Add description for the BFloat16 precision Floating-Point ISA extension,
(Zfbfmin, Zvfbfmin, Zvfbfwma). which was ratified in commit 4dc23d62
("Added Chapter title to BF16") of the riscv-isa-manual.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2cf2026cff57..99d8b70fa321 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -277,6 +277,12 @@ properties:
             instructions, as ratified in commit 056b6ff ("Zfa is ratified") of
             riscv-isa-manual.
 
+        - const: zfbfmin
+          description:
+            The standard Zfbfmin extension which provides minimal support for
+            16-bit half-precision brain floating-point instructions, as ratified
+            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
+
         - const: zfh
           description:
             The standard Zfh extension for 16-bit half-precision binary
@@ -467,6 +473,18 @@ properties:
             in commit 6f702a2 ("Vector extensions are now ratified") of
             riscv-v-spec.
 
+        - const: zvfbfmin
+          description:
+            The standard Zvfbfmin extension for minimal support for vectored
+            16-bit half-precision brain floating-point instructions, as ratified
+            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
+
+        - const: zvfbfwma
+          description:
+            The standard Zvfbfwma extension for vectored half-precision brain
+            floating-point widening multiply-accumulate instructions, as ratified
+            in commit 4dc23d62 ("Added Chapter title to BF16") of riscv-isa-manual.
+
         - const: zvfh
           description:
             The standard Zvfh extension for vectored half-precision
@@ -605,6 +623,33 @@ properties:
         then:
           contains:
             const: zca
+      # Zfbfmin depends on F
+      - if:
+          contains:
+            const: zfbfmin
+        then:
+          contains:
+            const: f
+      # Zvfbfmin depends on V or Zve32f
+      - if:
+          contains:
+            const: zvfbfmin
+        then:
+          oneOf:
+            - contains:
+                const: v
+            - contains:
+                const: zve32f
+      # Zvfbfwma depends on Zfbfmin and Zvfbfmin
+      - if:
+          contains:
+            const: zvfbfwma
+        then:
+          allOf:
+            - contains:
+                const: zfbfmin
+            - contains:
+                const: zvfbfmin
 
 allOf:
   # Zcf extension does not exist on rv64
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
