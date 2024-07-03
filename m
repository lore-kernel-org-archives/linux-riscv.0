Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDF1C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 05:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajJuG6BuxlsqFU+2QTWP5oCDpAWmK0DN+GiTAy8n3/c=; b=gBkWM+92tNDVpI
	SE3PWKtLLBUBKS7AMYNfm6k4rc8Ra0RJNOBhGQzl9xRa1I/1+BfNxVew2YKNW4/B3nMJfgWIufGh2
	kyqyIRY2G5MCTpfHuxAF+94cCzfXj9ZpMogcIbWTpHkLRqvxzoe7TqZRUtbt9GFiUo55p4fHQOg6U
	ZHRNsEyWrJGWNhqKPZnXhBZGo7ru4t5DphS6zN9StG3eJ5wv9BjTBfJ55p0I1bGxg1XJZlyrH/hQR
	lQv+V7sTLhSczfnMfOW2X04B1Qxo9/4q6robTffxFeb9wEkLAQcH9hOxafmsGqXDhTFGkT4q72/SC
	GBzClUd/nb5k3VHQ3YhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszG-000000097Zh-1t3A;
	Wed, 03 Jul 2024 05:57:02 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszD-000000097Xr-1HnU
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 05:57:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70679845d69so3402627b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 22:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986218; x=1720591018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=j5r/AXO+BbMT+NOEu63POew8rLlKIWfa6iUNLGH6roQd8T+0XO0UcxErR0dEdOJx8K
         QSHDf82XMW7bOfEz9zClAYUflUAq+WKHF6VeicI5AIPxziEyL2o7ZeQ3wbKzB3UPamzv
         P7yXkwaw+34IAx1wYZeilSFEKzDNye/S/QMuZDjOksXpos7LIEZUFqMpgfydr6mH+R4F
         I1BtPKfwpeY6iywIRdYe56F7GVliSzMrkdTApWdB1I9Ow6EV7mnGwTvVQtI03s6N9KaI
         MLBmjWsAK2CxYmNFjnO54buqCq7OA3plz6WPG3nxiYDSJuw5NpYnDEDv3+wSHhJsZRtn
         4TrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986218; x=1720591018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gP3BTCO/eMabIcPEHZlkkrT/LBtjjbwR/exXvwDsR0=;
        b=QuAh+PfLPAFiHf03Fp/HKAQofDrQLIzA4DUkjZqi3Qkq9Kh3JIse2zZ8y+XQaoAfvY
         9jCco2aMbnB+POEXZMJyc4D82loEzxIPzA9GS36p3JBD4Snl+ZarqKSJ/sFLz3UbCOv0
         lZa5W4pTk3Itjofxd0F6VCw9lazkxfOxJjMee0LdMHc3YNxYWWzbX28OpY55tkiA44Jl
         f4N7cr9yVJkXUdsY9PIklDfExgAhneqyCGELxXJ2wxyCYyuvE93tLklamy6xNkZpmW21
         d8TXU5WmLb+RWMNGPWDMnkNDzcKU1ZG/TV5rpYacosqJFZZfZQ8GfVVqZZzuLBfRixHo
         286Q==
X-Gm-Message-State: AOJu0YyjDjwwnRp8rY9aGPWrP0lZUnYiO0van7AL2aGlv/nEk+hn0Nff
	pqeWc+ip41oVC3dvh2RNSamJaCGFIEruMxMwnj7fQg+zjfp9xbcU3doVXWqVbTw=
X-Google-Smtp-Source: AGHT+IFPk8bGhxxDiE9oF64qKKmdU13pr+uT6OiupoAHAaV7v4GIvDN9xb5Nma3yWPTn3YYLr0hhkQ==
X-Received: by 2002:a05:6a00:1d02:b0:705:cade:1f50 with SMTP id d2e1a72fcca58-70aaaf3b8c7mr9285409b3a.34.1719986218135;
        Tue, 02 Jul 2024 22:56:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:56:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:21 -0700
Subject: [PATCH v4 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240702-xtheadvector-v4-1-2bad6820db11@rivosinc.com>
References: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
In-Reply-To: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=1767;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFeF/rMqjmAL/T3qO395y21tghoeF4vuGyaBxCV02tk=;
 b=fjkJVEjEBLAONoqiHUcNpBFefDHSX2nBp5VtKJ5OXWsis/l0j13kilKZo1JDNR6OZx3nchXrc
 DUHnx4vUzbPANcO+FajO56TrbkiU7rKqHSQIij8AF4+2aTbvHjpuDP0
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_225659_380951_D03504E2 
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
