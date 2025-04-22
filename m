Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42081C369D6
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 03:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1jdavlBtwL+N7bd730qSTvKSrdYnq3cRtpYGEdITC0=; b=0f49Ka8AGe/9uv
	VqvCZEaCsCk2uw26nunruG8amY31mRvkrTUAHPYUQQNqAyvan9YZn+mdpmzxHqXT8n5JGI8+JNXC3
	j8s3fIcx/mNT9ngbLFLsaThyE1G8eZog3EnVKKJtJd76Wq/tRHAIvHNaCr98Cbrj4deh2cQ/D6b/T
	2L5IpmoOBiEduHzxNqVJU6r2hgCNemhGvd8/bkr+i5sPju5lU66DdEmRv9IO/7fzXZJiQPc/dhnyq
	xTTp7iMx0vIvjE2yjKE2QCb57VOIz3qZb/HblL5BLKSpPurIrmwd9WXk9RhCEHXWXUlyy3qJQPyOd
	cnXAC6eFxViMEnSSzblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u74ft-00000005k7y-3tCI;
	Tue, 22 Apr 2025 03:51:57 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73M7-00000005c3i-1tK6
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 02:27:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-227cf12df27so40389045ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 19:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745288847; x=1745893647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/Rkn8NRc4ZG4GduUL35RYohUYa7cO/V2efDHxSNHpQ=;
        b=mQMFPui0xMeA2tngThgGGGPfg1gLaWE03I+Ag82XpaSUIGAVhw++mAy2yKPhic4TZq
         tp5NJ9t2wXw9TSqMPxGnTWkD5MCuKVtV6QrZKZKd69rssUCd6jioubaNj6PDT0tpQWJE
         BFZzyskTQrJTq/RFb9eqiMEKBOXWRa7E3nYgOwKOVDN+KNm6Qc9rZQWXTo/naVFUs2Ll
         8I3BNxNJoX699gmp+C/yphyi5l7cwMUYIGM7/ugHzE4aUYEF3KqlFl3diVRWAyo9zN/5
         BStbfaF3RalT5Fs1WIkzP4eWchT91PhFA9405KV1eXH/KH3DHw744eA+oXGoqQrqSsEx
         nCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745288847; x=1745893647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/Rkn8NRc4ZG4GduUL35RYohUYa7cO/V2efDHxSNHpQ=;
        b=Pyw989AH6wiXXY3c8M8L1v6QcugnyPb2si4d4ajkE5AORpBj/5Fb8/vX50vLTaRQeT
         XVt3ESUnButXg6jcDVWctqqi+rEZheWO+30dFL5SoiaS7aBV+LsfxI8rPdCVyhg0nCqV
         /q8Qrm48Y2hpJNcF2y2H0Pqa4GZvtCcxNtdgwJSAF0mgOEceptLwqs8dlvTjJzlMKXl4
         xpRWcRUTE2ZmlvqgPqSAbi4vKubaMWTkgMPviMXHOQhsXwTb8yErJDbIzK0s/UWIem3h
         Uhi+fds7IzxpInBBEqxt5nTAhe8ORBZmlCumamFpLrG+TWwsbqm/qp5adXhBD/ZLbuRy
         mkfA==
X-Forwarded-Encrypted: i=1; AJvYcCXzQl2stT4F+WtJwmuAEhgWHkrOPdeBvRzZiqxxI8TqClD+AoQGAKKN41iDZCsWByG+MXtQMhE3eUxQMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoNCeE0cg+rOyXlj/4Vf4FMO17HWL9tlF3wgPJRVA1PdwoYxnr
	20h7RNfPYH26UkQObAaZSnxR5rmi+IUDIWEabnrjfL66FOJu0X2O
X-Gm-Gg: ASbGncvZJMRqWmjxmv1b/5DQBQ5PMD23AKr4eZFORFSoP3Rh7tKOm2DC0e6cHrIT/BF
	ZJDrmBXVvqeqXw3llDbTmv+994l+kITlXhDL6thvBPc7hIfxkRChSUuj75cZ++/wMGf1ySK30dK
	h8qg5rg9RFmOOqlnquSUuCVjgVKX/6c3HclL7YZt0KW3UvWpiSN78uHrYT0Njdufei+PrJCVI8l
	sN7VJf//qWcUJx/+Xk66ZemV5KIqpKJOKKiNO46ghqvGM+763TsCqSNqnVPf52e/YKd+r1fYajc
	wMAkYxH2DTnxt43k/2QAJpdz6JSAmy761Ex/iq9efs+mgpToab3ELNIDe+Y=
X-Google-Smtp-Source: AGHT+IEPAwuuwQrRGZYJq83HctY7QlqrADDz0rh531sa64aWa3MYpM1PtKkX9z1DF5vIkTNuvMowHw==
X-Received: by 2002:a17:903:3205:b0:221:1356:10c5 with SMTP id d9443c01a7336-22c50bf0412mr206415465ad.9.1745288846372;
        Mon, 21 Apr 2025 19:27:26 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4ae9sm72962905ad.110.2025.04.21.19.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 19:27:26 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 22 Apr 2025 10:27:08 +0800
Subject: [PATCH v5 1/3] spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate
 compatible entry
MIME-Version: 1.0
Message-Id: <20250422-sfg-spi-v5-1-c7f6554a94a0@gmail.com>
References: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
In-Reply-To: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, linux-renesas-soc@vger.kernel.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745288836; l=2151;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=tfDazU3c4sCQTaha2KecC0sDtKELmF14aksargEQ4Mg=;
 b=tXUv/M8pocPmmvC1U2LatuGZKb4BwdUqCC1TVuXTQS2li6wJWH1xcRg999MU2WaCt+8Aa6xMF
 wsVnNvcfojdCZYREQuLeLz9gUrMc/10m6Qk0kWd3jcxeOpk8eOOqMj6
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_192727_492662_51C47614 
X-CRM114-Status: UNSURE (   8.20  )
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

Microsemi Ocelot/Jaguar2, Renesas RZ/N1 and T-HEAD TH1520
SoC-specific compatibles, which eventually fallback to the
generic DW ssi compatible, it's better to combine them in single entry

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml       | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index bccd00a1ddd0ad92b437eed5b525a6ea1963db57..a43d2fb9942d85b1482a52782c0a97cd5c6edd99 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -56,19 +56,17 @@ properties:
         enum:
           - snps,dw-apb-ssi
           - snps,dwc-ssi-1.01a
-      - description: Microsemi Ocelot/Jaguar2 SoC SPI Controller
-        items:
-          - enum:
-              - mscc,ocelot-spi
-              - mscc,jaguar2-spi
-          - const: snps,dw-apb-ssi
       - description: Microchip Sparx5 SoC SPI Controller
         const: microchip,sparx5-spi
       - description: Amazon Alpine SPI Controller
         const: amazon,alpine-dw-apb-ssi
-      - description: Renesas RZ/N1 SPI Controller
+      - description: Vendor controllers which use snps,dw-apb-ssi as fallback
         items:
-          - const: renesas,rzn1-spi
+          - enum:
+              - mscc,ocelot-spi
+              - mscc,jaguar2-spi
+              - renesas,rzn1-spi
+              - thead,th1520-spi
           - const: snps,dw-apb-ssi
       - description: Intel Keem Bay SPI Controller
         const: intel,keembay-ssi
@@ -88,10 +86,6 @@ properties:
               - renesas,r9a06g032-spi # RZ/N1D
               - renesas,r9a06g033-spi # RZ/N1S
           - const: renesas,rzn1-spi   # RZ/N1
-      - description: T-HEAD TH1520 SoC SPI Controller
-        items:
-          - const: thead,th1520-spi
-          - const: snps,dw-apb-ssi
 
   reg:
     minItems: 1

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
