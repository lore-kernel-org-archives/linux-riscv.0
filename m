Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99253C369D1
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 02:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzlRX0vMG2JBwNH4X/XIrAOCAhPeTDx4IY/maJZzVvc=; b=zHxtZMDk9cpczz
	KzZAqwutoyUii2DshzoVDJFCJnkkCUZYreOWr5sUQJr3JeZyF9u9E/y0I9nEPEDYS1nBrXU7R4J1X
	oc5IZNlXO05G6YLdM4TtlbC8lzAMB4HEBKrO4/0tsBVF6G8HFKx1g1JvtBBshsFoWPnVwNpwPo3UQ
	MJlSLl+bVKJIPOm6aH2lQ29rjPV0u9+Z2obqQdLcjAPRaq9TPAP9QXXEpugF770pys8oIogpZhUb0
	VCrjl1MnyUBiXHP854sc5JBtje3L9rZdoJ7VahOyzOHMSliER9Kgx275O9ODZEfOj0dpSXj8t/pXq
	9U9c2OLJrgDpGipef/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88ny-0000000Fmc8-457K;
	Fri, 25 Apr 2025 02:28:42 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88nx-0000000Fmba-1bLQ
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 02:28:42 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so1455311a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 19:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745548120; x=1746152920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hvb/VP20MUGNozLWEP39Ab8rauqcNP3o7sMaDncZOMw=;
        b=jXyKS/Vpe+xXwp9OHPj8KQlgDjRyf3pwRl9DRthZOeq7RiTvbOYY+dSWq8LQSAqTYW
         ZRQjR/juS9/0eCeUSDeXE5S34u4Xcge2ebV1vhUgeK5BxLnDQCpr+Qg/OavQ6+dz6l0i
         WriD0XK3X6NQmNqKFfCL3x0/g/J7E7HZBzzLNDQc//FUwRE9pYBAqNmzxkPGFmHuiSzV
         Ops31wi2Fe3khPor0r/AiDhAntQwlvsjjzka1goG5cxnMqTQwrqbvcW8cHzZWq9p3S4N
         PD0FWBoffPyRnPX2of98uz9uLbl4aA/XNr3tyftxvkj5wP/FJ89mQaCZt+/HTVRe++Jw
         YJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745548120; x=1746152920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hvb/VP20MUGNozLWEP39Ab8rauqcNP3o7sMaDncZOMw=;
        b=kEQpgvIsplqFcTbd6k0IgRGZQ3SCv9Wm+Wc5uzDetfcgWstYplRV/+6vl34fqfZiV5
         J84gvxT60MyUA9gurjpmAc+tWqUHT6Hmxr1lfcJpnXyww6b1pZ4MRjXCs3/yqLsr/XpO
         c5oSlIz1jKR5gsILIGI/g8H2BeO3fPs3ZAjBFw22EPLLuE6NDIJmg2vFoZo12eEPmsEj
         a8TJSrjn2KUeWo6ITu4iTd6T7n8uXd0mjRyXPl6LTEAvNCErDwSw2+1LEMaThwngkuRK
         rGhqvowHnucjO7v31R1zDersvSZwgdg20OrUoxm6x452jN48QR+mfgY6nTX3ycjW5L7j
         sI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7Oszl0H8E8wQWKFJZUshadTLOnbO+9sMBkub6tAAyZdjMz3g+cRWpYUnWEb8o8fnR1vy7tGIjHlXz4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoQk278nape8n79xqcouXxNHOfKvx/zTezwC5udGb6vR8GdWFy
	m22UQabWtP+3OS8AOnh3TuC5dmwc1RPGgB8+2GbpB0uAAEImwCih
X-Gm-Gg: ASbGnct+kz+1KnTDu0VoFThVU3Lx+nNBk+SOtYisz5fdoJVSQd6ojdljH3Xa54rd6KP
	IlrMxWszgli3xgNmYC+YUryZ0emNGiP/kF+NpCehz4TP3suFwGZ9Qy8/wHwiP4nsKdYonxjBdH5
	cvbmDN7vnH+WZimjc5SJzcSY/goRyJUhmpZyGe8CeGEwpDb/idpA36mT/Y3tbyIK7ARPk/MnAhT
	Q8s4jVGnG2z9ZuPYwnYt65Y4d2cPlJOB3qRfKJw75IzC/ir6Zn2B9XwSueRdxdrXlkLjLKdB8gk
	WWyM89x4q2qxfumJZJLD8IOTCRVLtpXYpsbai7+qIbsAjQ==
X-Google-Smtp-Source: AGHT+IHYIaj7CJzLMY6PM8+BoRfshbDXB+G3kScEAt6QCPkf34bKcjCrpt7zX/Lk2ha4MMHwrFVrbw==
X-Received: by 2002:a17:90b:254b:b0:305:5f25:fcf8 with SMTP id 98e67ed59e1d1-309f8d8cd5bmr637136a91.5.1745548120083;
        Thu, 24 Apr 2025 19:28:40 -0700 (PDT)
Received: from [127.0.0.1] ([223.80.110.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d4a9sm365455a91.30.2025.04.24.19.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 19:28:39 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 25 Apr 2025 10:28:12 +0800
Subject: [PATCH v6 1/3] spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate
 compatible entry
MIME-Version: 1.0
Message-Id: <20250425-sfg-spi-v6-1-2dbe7bb46013@gmail.com>
References: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
In-Reply-To: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
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
 Zixian Zeng <sycamoremoon376@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745548101; l=2218;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=pY3vTEVbaS9arUU2DTwNLKkGCYTqxU1iZeoetYpIdvY=;
 b=JwqDiWAI4yDpO2RC2mJtTDqGMhWrFmg1Fq+7NA1CRh44u3baP6c6Qz8vK0YBRavQ9e6hAKevq
 DLeQoa/Qd4KDxhmlyFIAq1jZxFt9fyLvx+tgQQIRF9k/tRj8wZbc6Ku
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_192841_428480_D5AAC40A 
X-CRM114-Status: UNSURE (   7.88  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
