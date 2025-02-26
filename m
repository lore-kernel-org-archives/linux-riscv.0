Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9388BC19F32
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 23:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CsX+oVIu2eRGs7TUXrvUoiDZ/TjQvG11kANbt5YajU4=; b=XdSto0J+DCZp+1
	M3fzfDjYCsSf7/eoth9QEQY7h3Fnu7GpL1N7R2kDylkPIk1fUKAZlFypk1Bp0T5NTCB5b/In6zYfV
	0ezdhNPamWmZ1wKkhgx1UTWFyGOAaHL/+vL1h3tqcg5Hi7lRsI8VjdbU8FsMV1hz7uh6gM2qpMscp
	zvyh7T+EeFb1tfOXdR1E+X+splLmflcs+oefEmSm79AZayRHIaqusAteVUEQ3IX4CydjGqRxTmv5K
	R6P6SD2FN52qJwwdnXyqoxBxG36l4NQIoAQSkPus3g4KEdKzDjMNonxhwMlE3yqGrZyw/h2BgvXH2
	jVNyjPGxhNNqw8WE/TWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3b-00000005j5X-2QAX;
	Wed, 26 Feb 2025 23:43:15 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3Z-00000005j3u-0BQT
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 23:43:14 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4721bfdb565so4584801cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 15:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613392; x=1741218192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3n4HDnuj7FUu1RXcHOZBNiyA5B87LpLpCZ3UB1bnbY=;
        b=B89vIe1zV9C+Ps10mgu1GVsPoif8O8aZA2YckpaR2iLvZg+7LNlGsQU2K6FxQTySRb
         yYTMxZ5+POV19hWwUXrLd0Rf709R1C7GKoGe+GtlGVMXucooCWJNw2pFmPe21YXcrznw
         QxlYD3qn1JwAYXXcoKFTKHYg9eIX2mC6BQDKTZxkCUIWkGuZfpWdtFaDCxyELQS4mJCs
         +HgVIp/GxD5Cib6oxbMXRQmbbFaqDNXSAMcMECOlStxA9nz8/apfmXSFmKJMVtsUqYh+
         jSTW5kz2MJm2wBWaZGKuJRIuJAVz/7018j25S/ool62vwQxm0uI6GGDoCXvGNta/GOn8
         8BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613392; x=1741218192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3n4HDnuj7FUu1RXcHOZBNiyA5B87LpLpCZ3UB1bnbY=;
        b=eUCjKNvcTUOlu1Xp1lp8ZfIrGtfSshPtRFBTfKtH2cjA1szkXmkKrbkLrs8oRx1DvK
         iFuyaTQCrdKoSmAj0pMA+rx53QmqMAS0Kw8jRjqNj0HoOBEtOG5TGDFJNk6CPrXm3sSF
         rytJLXJvJKdDjyEqT9mJLluy5+DnAmfTRvbc3xBll5eEqM2gz4Ci8GwYxrDXQTsGdJLl
         0EIVnGWJfzbWuf45v45aH8HujW7uHRDSRQc+Ech/oofGPPjgSYXFUSviqeaB+gw7iV3G
         NcsV1O3v/pRxXU4gZ3Sgsx0QojLbtl5SPzGdkMxYDDoprlzO+N2EEUFhTm75Xj1xKLKq
         0hmw==
X-Forwarded-Encrypted: i=1; AJvYcCXSUegroCLkt9wPbORoAJWgO2n8wCH2SjsJdNaG9I4vIZ/Y0+Jl8YWHRePI5mANSQzzKFIw4LpFww9o2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVfLFXxEa1tdBVsWx6pbQLoFDW4XU67gPe3NT8eE9I/0F9a5XP
	ZVrTL0yEWic2Q1UbhM2Ls8GaiONsgD4aWOD1gpfj9hDP3uS6fVPC
X-Gm-Gg: ASbGncu1fnpMY4LuIuEDU8eRfXZf+trSa6ypaa6m4S4Vv1O2S9LO0QdbMidFuezy+RK
	ULZJ5A3+AZh7Jj6iK10Xep8HK8IoS9BtWbNyS4dck3C2I7rSVvMi4+fy/EdeaJcx1mR0m5ktPZy
	HCsVbtvoJ1nThhu4df5NzqW00kzAJapa1A5eNvRjDdAuY6k53J+VWPViaayjIzCybIHuOmMbvhM
	7NzbqBGEy4+Qxvj2VMM4I/I/ofqb1ssEIpdhoR+EahVOhh8InkbHijab+hkKbVm6oGxCgc5R1tj
	Rw==
X-Google-Smtp-Source: AGHT+IFeqficLsjiBxpez3bq2ZeY469OujQH1LvDOLIZDbUA8CBYXJPaq31DTHUVw5/VEbpfwo/VkQ==
X-Received: by 2002:ac8:7d55:0:b0:472:182d:8b4e with SMTP id d75a77b69052e-47377118710mr156337051cf.1.1740613391750;
        Wed, 26 Feb 2025 15:43:11 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-474691a1f78sm2822421cf.14.2025.02.26.15.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:43:11 -0800 (PST)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 4/5] dt-bindings: reset: simple: migrate sophgo sg2042 reset controller
Date: Thu, 27 Feb 2025 07:42:32 +0800
Message-ID: <20250226234234.125305-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226234234.125305-1-inochiama@gmail.com>
References: <20250226234234.125305-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_154313_085995_59D0006F 
X-CRM114-Status: GOOD (  10.25  )
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
 .../bindings/reset/reset-simple.yaml          |  7 +++-
 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 -------------------
 2 files changed, 6 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/reset-simple.yaml b/Documentation/devicetree/bindings/reset/reset-simple.yaml
index 86c33a608148..644884206ee4 100644
--- a/Documentation/devicetree/bindings/reset/reset-simple.yaml
+++ b/Documentation/devicetree/bindings/reset/reset-simple.yaml
@@ -30,7 +30,12 @@ description: |
 
 properties:
   compatible:
-    const: reset-simple
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2042-reset
+          - const: reset-simple
+      - const: reset-simple
 
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
