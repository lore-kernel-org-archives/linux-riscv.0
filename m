Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFC0CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqCvWKNBKe+kNAY2tKDeFlUEeLAbX+WtiyQP2mSimwk=; b=a6vli6VKnqblr9
	7D5eircoX2qtfNrJuNJdfUqhSBYMrDNT3XepCuoKlwdyOLReM2cyenE0IC8vAEJlkWTy2e2MW0CvF
	eaWo2GJUo0ESR1ApjFj/pBgjpGQLDtdpDGWlHC4iyuijbAEFWRVxOI15wNJ8Ad7WnvK/r98qdGGrq
	LzP6TLOhgaPtUui14lqsAc5SjplCazj2lUJJumheQyxCz8ydLKBghP1ydPuceSAb3wLc4hMKwDL0U
	3PaKg70EOMYolVQwCuFQExwj0ePxMuimAMHu/2VuZFEQ7RvLuN3tLOFa9Oo4W+Q+fnmKOnLf8bL0D
	ss7na/TNpEEOPd1l9EjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7M8-00000008m4c-2GgF;
	Sat, 02 May 2026 10:13:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7M6-00000008m3T-026O
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 10:13:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so13845055ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 02 May 2026 03:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716829; x=1778321629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xxbrEotld4A1INaWDXAQzVmz+vSmMssLxNlmQzLKGY=;
        b=m6ux2VO7G+2KK08W5IqVP+J7dYNG/L+E9mq7+vkBFENKYq7MQ8AqI/gdsQXzv7NnDT
         uqXjIwKYgqk7mgyMiFcqT02jkjm+Y6Z3faHUlXUwsSyoLQS27z1CvCAUkEe8Y8pPq5Yr
         W7AyEbuYM7up//dFR8BOktSD7FJSzczxxNWdhf2kNJtvMwk3qK4JKPWYvuVI2kan7K0g
         VCnRbi7st9H92QNhC8qHiWT6dPZsE+U5Urh1UNjzV8kth5K6Dzx1P9QrrbmW+xESvrld
         +Zt3Hl12F8CD3k35qA2lg4JEnVe/0fGxd/Kqioc5fR7mF5sXPn47g12/on8ur0d5/vo4
         N1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716829; x=1778321629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/xxbrEotld4A1INaWDXAQzVmz+vSmMssLxNlmQzLKGY=;
        b=TBt1tlsalBW2MPbf/g5b5FwGu1/CLFUpJhy8CIUtBt06ndacJbSs5hoAaYDDDLhR7l
         stMDOgv1Be+hiMDFJf1F4IhMVNjVctEsJlzzl7emuf4+ozsA8o16vw0OP8induPMzKo1
         MoaD0nVABn2kBk6x/pwmbeLy+RBn/vsXcxcXPqjMM+b8rvZgjkWKaSwTZRYdItodIjYx
         nrC0wj0+mdItkzwDrPTwrB39aYAurmAMjtzd/miPx6fNq4zYecqDRlbLyHP524uFjMyW
         HSvG7apgiev6OJWoCcDEkruSvwjkGCWSNzaSLCZwsgDCkca5P00Ams/IWpU/49wZlWUR
         BAag==
X-Forwarded-Encrypted: i=1; AFNElJ+6NwZUqZOqSU7H6uU6cfrumQrDFev78rFeZOjz9Zx2AsWXaAqe6GQqaGeA65GAFyDI8hnfh8UFfMhERg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3cJb7sHUklXyWcCpXYtO1u3KKlG3CHl5F5CN2TmTm8oo20OYE
	7o0HbgXty4zH19BAd/oZPgzXCK7w5eeFCLHV/JGz2OsErE5sIKK5SKHv
X-Gm-Gg: AeBDietdQTFwalwobNgIINPvmzXQc5es7khwApBF9SKldFeIikfElyt+2YKSY5URgcd
	s2NWXcNCAPXGIM1xCcX0jNFBcHb225n5ANWHQYV5f3Mi7V7+qPla4Uy9QbaTi68IA+GLELJDCZz
	A7CWy/T2FP1a4TwHLK8e0pN4jzHgyWqHnMB90enCBmFkZQ17mENzLxRdhbnWjY39XpobqZcEIpa
	MEtplVn6QVAiisNQ5YeGCyI0pF3DWuD6Qrc4yM3wPWddRJghRyfDZbEGiJi3jhM4MIcCm+ztLnL
	zWfv33uVE+KXDzzimNbpWhBNCNmWEU1Cq0HERxu4c6sQE7WeD4x7f8wmU6t2q0/Y/e5obsQaBLp
	ND61FLT2yxLY0tOIT5Cdlgdvxh03DsblzH4VM1yGHRhom+Z0zvENea4iGxnyJD85o9eZs9aJVFz
	6Vhls3eKoD9J4aagMTfuqbLZVmKFL48f6BldUvS7gytOO0
X-Received: by 2002:a17:902:d20c:b0:2b9:ce81:fd75 with SMTP id d9443c01a7336-2b9f25674cemr17239855ad.11.1777716829028;
        Sat, 02 May 2026 03:13:49 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae6d123sm50453575ad.84.2026.05.02.03.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/5] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for msi handle check
Date: Sat,  2 May 2026 18:13:16 +0800
Message-ID: <20260502101319.2364052-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502101319.2364052-1-inochiama@gmail.com>
References: <20260502101319.2364052-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_031350_050119_22D06D8C 
X-CRM114-Status: UNSURE (   9.47  )
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

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for msi handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..6a595207fae1 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        oneOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
