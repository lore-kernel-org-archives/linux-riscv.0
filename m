Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F532C02198
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 02:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6NvF6fZNLKG5CDALl4o+lFUtfjNmMP+7Bwurzh9+Wk=; b=WlNRN2NWXK6Agp
	xnXi/Oe18ppSu3tY5FPI835mQblNusjiznrxfWg2U1MvXS9bnGpg3UfDREEOQl96YgqKa7yWdmUU8
	n9bNfjmS0fDG0md0sfN0hqH1ecBL7x2DQ8yAkmAkAGThm1J/jkx7XLBw6btBQEetOFPIDusV7OzxQ
	lbatQoLf+Nld35OlIaFCxuHiXLtLlMLLWSJLiTfsDgSSAA4VT5K2Xw0yQFugkuoz6kOPw+eKygOGG
	61rKBMF+jRbTF+xpC4jujTyp+yfR/3zMvmadmwDcAfRK5rRAIhnnttojdtWkZbg3KvH0fKCKTQQHt
	A3M8zXsT2DYy3pM+awjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOfO-00000009T02-1BHp;
	Thu, 13 Feb 2025 02:09:26 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOfL-00000009Sy2-0D96
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 02:09:24 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7c05b91245fso18843885a.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 18:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739412562; x=1740017362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXFO5ZwHUw8wT3cUYBSdFuMkicgvLRpCU0vV1fZ6GT4=;
        b=aGnr82UUjxRWFWBn4L5p6K/Bwy4dQSE5r2puhWo24dAd6fh93TmgdBQSqEgIYTlxj6
         UMFvubnb6WVsnHPZy3aAUGkrNfdlNxUttWucw1jm5HA6o84qxgYZc3MQ07l3EnsUqikV
         HG7+wZBQiGrKrAP0iyxToPVQJFt4FyKJOalXlRWGaczz9xv7b3jCaaBsfZjcI8aee4Jx
         eqgsGOpwdK+3Sp9YLO+UQVMqBeyKFhGuq4mpggHUIsucyf9GYR8xETHCl00wlfdsT2OY
         tS+HIi6vhofJCo3ay5Z7yuU7axgeOjlKNdagC3obtfW7hCg942Vurnarx0QUhH6NbAXK
         uhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739412562; x=1740017362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXFO5ZwHUw8wT3cUYBSdFuMkicgvLRpCU0vV1fZ6GT4=;
        b=uP8vsTh98Pb5mOhxBEAwhqs0eY4KYKbkDitFt85F/XMFb4eLYRmLNvw13ARhHTqaWp
         nZJ1L+xFScL2mlWdl/aVxv1E2p6+pz6u2obc7dPDvfAUpP8fYFIoREOTmEdxwC3OcnHv
         OKLbx09I3cePlOVQol2lKGA2v1z9NzVTHCfonIbvLYB5LkGqWRITkObG1a1NhxRjz1Rv
         9zTShgKZZlMngfrizk5ekOZPIiNO7WLyj01E2wiDHCQBfbYKE5OvYUbX/g/ZKdTDZaIm
         w6rplicWcNlHGJPBHTo+9qq/TTSu4TRD9HoP/adYaJERdkWaRYfHpLP4DEQxOuQT5ToF
         MKHg==
X-Forwarded-Encrypted: i=1; AJvYcCVOVKGrZ3BKQCH6UtLXdVYX3HG7eDwmrZY+UwwYSMVoPdDair8PQD26k/EQiuXnpxCnBav9BQaKU4SiOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLW589PG8yiAy+sP+e4aayFNfcfAfcEc/YABkgJWzoCStoJp/3
	9nsoSwEidS+xFbT1JWDP6DZqVdBzVBydES4dZz8DP/VfVQ6/7kL5
X-Gm-Gg: ASbGncsuZ++HFp+RbC1Det2NBZGGbTXhTyWpvcRtVCh+XkRHyPgT6RVRDyYjC/OaPj3
	QAAOeaBmrw48E2BQhncwyNcs6DWShM3BDBDwkJu64zwkfi3efvxpri0l2Sr1oZLv3+Nqg62LDao
	4kgYqUQ70pr2p2exA83cJpFMhtMMg4v4DLoZIMFYYmWZzreVift4DnBdusIbv9eLFirp8/XWXpg
	M2Ucj++QYbyg6hzUULlJKrs9Tl5oJCkfS4noX26a6Mf1RhsStlnmNFWcdNJkX7A7Hg=
X-Google-Smtp-Source: AGHT+IGffmi8fZ+IosqTR1SjXnCtscNOZQQHfesnJihozSoHKlGaGPOVdWX9TagyMdQaTU4+9bkRdQ==
X-Received: by 2002:a05:6214:4013:b0:6d8:850a:4d77 with SMTP id 6a1803df08f44-6e46ed77f20mr108840476d6.7.1739412561911;
        Wed, 12 Feb 2025 18:09:21 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65dcece5esm2389976d6.115.2025.02.12.18.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 18:09:21 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/4] dt-bindings: reset: simple: migrate sophgo sg2042 reset controller
Date: Thu, 13 Feb 2025 10:08:56 +0800
Message-ID: <20250213020900.745551-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213020900.745551-1-inochiama@gmail.com>
References: <20250213020900.745551-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_180923_091219_EA66A89D 
X-CRM114-Status: GOOD (  10.26  )
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

Migrate SG2042 reset controller to reuse the simple device binding.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/reset/reset-simple.yaml          | 10 ++++--
 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 -------------------
 2 files changed, 7 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
index 77584e23e8e8..1c86b67ae190 100644
--- a/Documentation/devicetree/bindings/reset/reset-simple.yaml
+++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
@@ -16,9 +16,13 @@ description:
 
 properties:
   compatible:
-    enum:
-      - reset-simple-high
-      - reset-simple-low
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2042-reset
+          - const: reset-simple-low
+      - const: reset-simple-high
+      - const: reset-simple-low
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
deleted file mode 100644
index 76e1931f0908..000000000000
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ /dev/null
@@ -1,35 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/reset/sophgo,sg2042-reset.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Sophgo SG2042 SoC Reset Controller
-
-maintainers:
-  - Chen Wang <unicorn_wang@outlook.com>
-
-properties:
-  compatible:
-    const: sophgo,sg2042-reset
-
-  reg:
-    maxItems: 1
-
-  "#reset-cells":
-    const: 1
-
-required:
-  - compatible
-  - reg
-  - "#reset-cells"
-
-additionalProperties: false
-
-examples:
-  - |
-    rstgen: reset-controller@c00 {
-        compatible = "sophgo,sg2042-reset";
-        reg = <0xc00 0xc>;
-        #reset-cells = <1>;
-    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
