Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F640EE644F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 05:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5v3C3H573alR3dI082fW3eeBghbeBiFpMTmrTtxKiaM=; b=M/F2E01HaEyBx4
	HZR7P3SRl6ah8XLz6E2OzcMEixqYVtFzN5mR67At+4Lf/QXnbD1uvEFfaBVN2m2qM9RD1rXhMxHEl
	rxK7ClhDCmsvQvzvCPNJArKc0KmznOCWcf1FBQWtGPFlGWqEqaBF7s4eeRjS3ftcTe1FXtGojJaps
	DvKN+I82IHWffGOfvCcXhEkyaSAcK2Si2+dQHt4o+ghDWhRWtalh7ABTQHZrrVlAJY3wIEI1qJHnv
	bMgVpp66QMaE/g7wuXhIFbLzNvMkpRcVeYi9lG0SpuyrsehgaonqHkSGMPFiw38W/j5GRsd2sjMvk
	d2XOeSZGVeTYhL1tasIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soco3-0000000BvxX-0TLB;
	Thu, 12 Sep 2024 05:55:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1socnz-0000000Bvwe-24VM
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 05:55:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2054feabfc3so4857995ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 22:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120547; x=1726725347; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJ+D4p75bjfTb0EItLpHxQIjWmqIJlAlnUMhz5TxedE=;
        b=aD6NSqTTJf8ePNObO5fhPfqfbz2BZb6wPYAXxT/EDqE+R+EUS0EW/n5D9ccrSURz+w
         ZJ+cLsycj69yiyVStiMymBDIBn3+IazB58wt1CFHgTYODOCPMab+WHIG6hpwollMrfFv
         X/zeybTx7OxtITqoWyEj0s0E5ayXRLWT7VdggtBKXctkc62Whijvooq5V+uAove4IwtT
         VjCcSs5zeo/xzpfM7be928azHNDLoY/NbQRCMSVYaUM3Z5tubWXzw4OMecM8Dg9MlItE
         UJGZfywA47U9dQmtL9yISRz+WfeZqGo4nS0JnEXSV5wSIzf2B7tSWjQZHTXXsZGqBuil
         g5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120547; x=1726725347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJ+D4p75bjfTb0EItLpHxQIjWmqIJlAlnUMhz5TxedE=;
        b=QqvxQhONYDO1mlCp3LR1bLYsTJTo+BhIeQzIG4UUN/4G7vspiBk+w0LrMafdvpaIY+
         QlFbX/FuW6oFST1LX8cCTdqsFfLaXHbbVeUel4E5g5gz1CNvWWnis+6C45F1FY+G+Awv
         Ag3drLTwVfXQTNN5fgostAw32cDiwgaVGhK1JSXUazdHc7/sR29zKn3GzdyLMdXDA0Bn
         Hya020wlxu8I9CsWasy5PPG+DZZ/fz4V1W6hooiqJ2o2AkcmI1nOX+jfWaH4pHNbX2GK
         HABmnbg6AcN/dVuP0MUd9LYPHGqO4+aoXFCkGET75xD+2AwIE/R/84J8fIiBWkQxbIlc
         bbQg==
X-Gm-Message-State: AOJu0YyyNrOmIJfTyZ4wPGQ2QVLdSeoRPH81MskwaQPSAv97MwCHt/Tg
	D4x3g8u6Fx0KTfo180X/kBasP2MKPeeNsa6H8RnHmMryMLgpYgxRAmH4aNnTBP0=
X-Google-Smtp-Source: AGHT+IG9O0CsFGhPXNWP6Lh0fHcN+qnZpsCNiZQA7ou2TZYGAxKoqEVVtduYd2aqXpKrOB/KDynEnQ==
X-Received: by 2002:a17:902:bc82:b0:202:4712:e838 with SMTP id d9443c01a7336-2076e34805fmr20473945ad.14.1726120546804;
        Wed, 11 Sep 2024 22:55:46 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:55:45 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:09 -0700
Subject: [PATCH v10 01/14] dt-bindings: riscv: Add xtheadvector ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240911-xtheadvector-v10-1-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=n+1uXcpPSzDKbEZ3gf2yswWeiNf7ojNdJOC78EyvEvs=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpqgZ1w/w/ftku2TJD4uz+t+3x4iXX2BNW5b+/WQo6
 8bjN+eIdJSyMIhxMMiKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjARlTOMDF/jJh5VvijwP67J
 VKVJwXXLN+O4Ccpr4rb16DJeSYqLLGD47+eWbnRtrtIkRe/gq3cFjFfOFeOyVO+O70hJSZ+nude
 JHQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_225547_601884_A7EE2685 
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
index a06dbc6b4928..1a3d01aedde6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -556,6 +556,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -563,6 +567,12 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
     allOf:
       # Zcb depends on Zca
       - if:

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
