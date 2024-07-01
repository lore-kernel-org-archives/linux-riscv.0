Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B04C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUpXhqEVLoEnNGqgqUwxPHMf98N/B5XcT+XScQUwWLA=; b=zgZBJFy6aYm4s3
	7QWlXs/jyRv9YZ7gtthq+CQN7s+i1L+HI3Krgbm2zZxTy/u/Wd9G8C3GVU1VlLmOshGhAe6Dg8PXG
	D/Cj1QMMdEvlgTV8Rhz6UgWmBpHVDNmYD44UEa3Q+LIOHQs+Q3HopmNV3u9INNpD/5O8cw1cXoF+W
	m943k5CspqOgTqeYg0ipq/TMYlTNpkY5FfC4YbnLfKrGSZ/YTo4i8nf0/XtKaMLDUEt/TM7O2hWz/
	gnBoQWlHOUVz3mNwE1arqZs3pN/5AV95/9oJdDjQGClYXWsLKgHoICjtfs7ci4MYfFII6c9nPE4WK
	KeKfoiHJCxdK6B5Q8wvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGGQ-00000003FxB-2Mfb;
	Mon, 01 Jul 2024 12:36:10 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFve-000000035nq-1cic
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:14:44 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7276c331f78so2582990a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719836081; x=1720440881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2JlVyvdXaf8wO0NkeSTlMZDCp7W3gnVU01+vdeONI4=;
        b=L3VqPq0VMHsstA9IFRwwex+ZgbFvRDhHP+5F39rCTm5HDzEYTfipcVSUi7lxWV4wn1
         xSHROEQXvI35pYxnQvcffjN2w2y64RqQrmUZqe/A+AMeTOCy3dx76bja6LKCQCSsMDUT
         06+7g98aPjLkKOUc8S+F5v4DcNfyFkNTc7oaZskI1FdBvXYmHlAFJomVRRFF4PQahaZv
         AA40h+ki44ucy3G9DPakj4xzmlaQ+Gip7Oc0MJcBWkBC7rziXZm9hbQIYO1Ug67t0nwt
         bhjBZ79Vzd3dd3FMGbGPVbv1+1Pd0ejLM4nb2+jn2R1PFeVka4J1I5vXnRIym0FquOoD
         AvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719836081; x=1720440881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2JlVyvdXaf8wO0NkeSTlMZDCp7W3gnVU01+vdeONI4=;
        b=IS8WPS+14M/Wzo9Gr6oEgGdU5FUh5i9xz+tOqCCM1mgiS7bAZlQZvaHqdtXlG1e3J2
         8kZe7HpUtqbyJqLBdE7f1gWe+lhWX7EZqwv6HHQ8KPV17CuJNsoZDgl/1K+V2e+orjHB
         kIL77vk3RynHdjKuYOKSYooo7tI7lZQ3L/5NjbWlDHFsf1kfZBAolLf+bWiRQHk8/3tX
         pwvo3Q8q8V8PHJIQifxcj+KnFCITpl5Ll2Qa++yVE4QiP6peiCOrhw+VOTOSXIA7/jjE
         hSS2j3Gx1R9Hf+rZsJODIlUdvBJZqOvtw2g26mrxlRNJ2tUBFRx/cVslxgeWC6ERTsq2
         OBtw==
X-Forwarded-Encrypted: i=1; AJvYcCVlsgkxLK1SUkowsryFxWpUBGtTrFJqo7/vo4gTz/wxTHSM3bLUE8aEfp5Y+iVLz3pGDChLOJ5JanzNkbwjqYegGEuAVwkcEQFOGoTWkNjz
X-Gm-Message-State: AOJu0YxnyDLFk3XVCMYwfCoTzlyPT1PVhnsl1LDdhYB4ZriEWbaNkg7S
	AFYqcj4B7GZoEtcjywNixHAPdC8Oylv273rRayJiIU+gboZMeyjv
X-Google-Smtp-Source: AGHT+IH5fZqGsM7fv4aL4Hf2OsbfmuWDVI3xrdjeGta3W/nTcuTAQXHLXW/5GIXbOraLNdXwplsgNQ==
X-Received: by 2002:a17:90a:c090:b0:2c6:f5bf:5175 with SMTP id 98e67ed59e1d1-2c93d1b99b3mr8969180a91.10.1719836081239;
        Mon, 01 Jul 2024 05:14:41 -0700 (PDT)
Received: from ga401ii.. ([223.178.83.109])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2c91ce17a77sm6613098a91.6.2024.07.01.05.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 05:14:40 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: spi: snps,dw-apb-ssi.yaml: update compatible property
Date: Mon,  1 Jul 2024 17:43:52 +0530
Message-ID: <20240701121355.262259-3-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701121355.262259-2-kanakshilledar@gmail.com>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_051442_450969_63A79FF7 
X-CRM114-Status: UNSURE (   9.42  )
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

updated compatible property to include "thead,th1520-spi" for the
TH1520 SoC SPI Controller.

Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
Changes in v2:
- Separated from a single patch file
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index fde3776a558b..bccd00a1ddd0 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -88,6 +88,10 @@ properties:
               - renesas,r9a06g032-spi # RZ/N1D
               - renesas,r9a06g033-spi # RZ/N1S
           - const: renesas,rzn1-spi   # RZ/N1
+      - description: T-HEAD TH1520 SoC SPI Controller
+        items:
+          - const: thead,th1520-spi
+          - const: snps,dw-apb-ssi
 
   reg:
     minItems: 1
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
