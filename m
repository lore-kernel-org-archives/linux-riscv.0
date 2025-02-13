Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AEDC021A4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 00:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXBcpK5ZbqiNCTtaQ23Ofo9zegFGgYhgbuksf1szqcI=; b=OInmT/1MeqLSG3
	SE7wh88dMOF2HfU9LqG/AJsza4YslA9tst+4SPrFE08LXVmJ/Ihma0souvqQZiKjp7yCarhAPKqaE
	Q7kQ0qnXu6jbvdAq44j7m9SPJWpD/pla3EjBseiTzg1Vtq2uTdW0uRQPsZeKnhjjiIbwABIfaOQUk
	Pq/tIeKvcDzoH7gaMDGPq1nsA/OhzkwjBeYIxtCmv4MbKedG+E1Hq51tTukaKJTKAWtqB2KMVbLe9
	EgnJY3fJW7UikLsucLYb2+7HWlRRAOIHCKM0uhT2cg71lUmHKiDvft6ElY2YYAYQlfAmeo6jZpjRY
	MMWsXicOZx5Uqvd2qG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNFz-00000009IdN-1lpk;
	Thu, 13 Feb 2025 00:39:07 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNFw-00000009Ibc-48qj
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 00:39:06 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-47191bcb2afso1951081cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 16:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739407144; x=1740011944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/dVS4QIgcS+IuNnmD54Uf/v25I+PAzsTeOUn9AzZIw=;
        b=SIr2qRhg6Zkgv3UECnEloEuweZZ7qCZedKI1TB9+lZE0OBYDIFDAX+RY/EqzYyFWIG
         Hgg+g3sfTSaNL4yKmGZLYOqYVV+st5rZMr+woZZXbnYX/NE0qY//Dl/CBl7despTg248
         i0Pn5Wr2p5cM2awipwGVTCGktWqdv9ibPOP7RL/2ExmOrqIM8t9Ne/BlIeXdZmdzBySX
         9BwxbIAZ8MatK6zKovUsVAkxt63z9SCStXqsIaSd/lEYXx8CAB6VwYymPqI64DJO0Xn7
         QGNI/XWEV09h+ebG2NBA1mvE+Ip8Yg4hW5pHzLj/6RBhSBmPkBF8qfNXfzulQNT+lHSv
         X84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739407144; x=1740011944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/dVS4QIgcS+IuNnmD54Uf/v25I+PAzsTeOUn9AzZIw=;
        b=Qd+vnDJMoJ7JnSk9bXKpa56vSZEnCg3v0Tk/KZFaKvX+/1EeG3sAymBgovo3mEVKC4
         SnS+tXwgRhQJb3i1jFOG7GQz1GXD2gB0o7vsRwf0+vbb8a/am/fpIe7bdNyWzszx+HNl
         J+RsryOa7e1Gu05BmQnb9R4KQSHto3XhtCMoVR1Mj/CIChCDkwgxlSgL3uZOsQa2fFoi
         XN8y8RAJMTa4iVxGFd+BC6EXqsKzxD5xyhnwl7RWmxbp0+p3nbrFBSO5z+rJTqUukXMv
         vvkdscbIMFCfGhjb3xgTo0wpZCNSId2NHTZyH2HoLXs3jLOZerBTTyYKshi1GaDRXnjW
         VGWg==
X-Forwarded-Encrypted: i=1; AJvYcCWE0qpWL/TrOaysT+enOzJBIEI91gnN5BmYzX0J5vC6kx49O9cH7/iP6SDm7XcRmo6sAGhQG1t/rNWWQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgcgpqErcBFf2MNnmzS6U1F/uKS7W829tD0OC6xey1IaqY8oKL
	2do2NaeuVVePNPX5BRyDiySIrV0moZVfGWaJcnSM1LDY17hspwgs
X-Gm-Gg: ASbGncuOxe0VcnHO9/LjK4fMVoyNnrurnJ5Xk9/0fPd/gmI2OOoWxeUg8izTPrb8lH2
	7IsvUcZt1xOdVroPWjJijYWLRKmTmVI6K30G292foT2lnj+/IzJkoO7DmgW5uM5d4CivQimNP+N
	gmwq9ywXyURja9jHsvctTDW6DIDbpsHltFPk9Ehx4ioPUD5S6cOz+nBmpgHO/AAphDjFVt1gAfb
	QHGBDIQfnHdqYof2RJIUqRpIl6WuoXTsyFWe7Ub+14nldt/CvTnMSHkjBn3izeGFCY=
X-Google-Smtp-Source: AGHT+IHspWsE6z8rbANPu1J4EJHGR6YUyo3bjSrXk+tx6Wy/U/d08EMp+rHEHGe9CzvstZnDSmahbQ==
X-Received: by 2002:a05:622a:1a1c:b0:466:9d0e:1920 with SMTP id d75a77b69052e-471afe5fa85mr71820871cf.24.1739407143682;
        Wed, 12 Feb 2025 16:39:03 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471c29e9261sm1302281cf.5.2025.02.12.16.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 16:39:02 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: riscv: add bfloat16 ISA extension description
Date: Thu, 13 Feb 2025 08:38:45 +0800
Message-ID: <20250213003849.147358-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213003849.147358-1-inochiama@gmail.com>
References: <20250213003849.147358-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_163905_024586_3AE643F7 
X-CRM114-Status: UNSURE (   8.97  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63b994e0763..f26997c3d34d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -329,6 +329,12 @@ properties:
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
@@ -525,6 +531,18 @@ properties:
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
@@ -673,6 +691,33 @@ properties:
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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
