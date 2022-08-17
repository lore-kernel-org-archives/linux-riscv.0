Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979A7C32772
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a91ApCdYm/2VDetfdFHOeGqOuYWkjNIkBOJHuT3IoZ4=; b=BfNn+JJcWqm8TI
	toq/+A0EQCLECakZnwI1CKlOWQbWgrcyeC0yP00yF4cRrCX2epjBz4vGpJ6l0Wd/xsgUrNcfcsFcl
	HhLEfEl/kDPvQ0Xjl1Ahvzq2XxW4gX0WW3WPE7tXJ+nbN5dLux5KsXakDxDbGa2QlAWc5EikDhiZf
	s77fPy1wu8jLpNFgp617al5DSeFoci4V2PHn9f1SfZRgCtqfRDW97ODnkglEPb/7dRYxb/8wxzEfr
	wUBeHCptQirgRYYBwOHHS/+Uc3t3VW8F4s9mCVcJqk2zRdiU3G2+PPzCDQBOCe4Ct3QmFBKMQ8LOO
	cJeaZX2DWE7WvXZH4oIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPPB-006AKY-OX; Wed, 17 Aug 2022 20:12:46 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPP7-006AIJ-Iv
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:12:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id r83-20020a1c4456000000b003a5cb389944so1560069wma.4
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vuO3cD7vHfOoM26qaFlIa3/qXvWH4JaTB3axSBEJPBw=;
        b=QNqHEQCbHfRVGS+tAMiAeZUZwHbBaHSl0+l3elr57UhAo9n9y5kVxNnKfpGR3/bFaK
         +0au1CDmSpQEpc+SU4gk9DT+bLflPHiKU7I8q8oQr7K+iXIJMVRPppzrl+EdG1CICueI
         mETGyBRKdR/0jUMOQefFZwBRXS0F6IVfTdGwBMcn+/W4tOLw5o3k++yjoq0kYu6PUOu8
         zPeHvkIN/+xOD7MPCo5mJihWLZw9Ayb2dZz9D3SYCFb7mSsm+ctbY/v+37Sk2BkryeRN
         +keBV6AYTGq3C5eSUKwO2Ih+l7MLpNlzPwmWLNs+G4q0F/Ce1V4BLVEMj+kApmgnT9U8
         jwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vuO3cD7vHfOoM26qaFlIa3/qXvWH4JaTB3axSBEJPBw=;
        b=5hnypNUDg+TBPVjzEt1jfYrN+FpmcTMF70GZtwFt+Ak7/SO0vOOwE35zbMHcfJOi+P
         yMgQXwTMWQTlI3KqVajMk5r2TD3VNd0K3j39sDKegohjtJB9KhlCCHe/PRIVPqnAykpQ
         h1DEO91lnfXGVo8lBif65rvKhg5AShN/h4YFcxQGiep+GlyxcoAS605tkmhT3HC1PoA3
         BgKU0Bh3QbaGEwk0KQzE6ApUaiwSmqFFIKOMrKu1th6CjBIcRyjJeJhDMWWKJKqrO9fV
         /y5eqOlP5PpD7IsvxYBFat2kVZGqp7PtQrZ3jcE7h1a4YNRpqXIsdpAlDq+QL9qniIQN
         IezA==
X-Gm-Message-State: ACgBeo2rdeX7ZfXJ0im8EVnfjMALXfS36hYsqJrUP8QbCD41KlFis6XT
	tRFOmGK4DZ4fxRhfY9tpWnXH+A==
X-Google-Smtp-Source: AA6agR4uxolucIHZMbESqZVNmKY0bzNzoYEESejDuTjDSWvejaLJaV19DGDusJCVom1LcN9XAiM6Ow==
X-Received: by 2002:a1c:7407:0:b0:3a5:b81b:c5c5 with SMTP id p7-20020a1c7407000000b003a5b81bc5c5mr3038616wmc.144.1660767160200;
        Wed, 17 Aug 2022 13:12:40 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600c354f00b003a5dfd7e9eesm3029371wmq.44.2022.08.17.13.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:12:39 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/4] dt-bindings: interrupt-controller: sifive,plic: add legacy riscv compatible
Date: Wed, 17 Aug 2022 21:12:11 +0100
Message-Id: <20220817201212.990712-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817201212.990712-1-mail@conchuod.ie>
References: <20220817201212.990712-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_131241_659157_3FC38F7B 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Conor Dooley <conor.dooley@microchip.com>

While "real" hardware might not use the compatible string "riscv,plic0"
it is present in the driver & QEMU uses it for automatically generated
virt machine dtbs. To avoid dt-validate problems with QEMU produced
dtbs, such as the following, add it to the binding.

riscv-virt.dtb: plic@c000000: compatible: 'oneOf' conditional failed, one must be fixed:
        'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', 'starfive,jh7100-plic', 'canaan,k210-plic']
        'sifive,plic-1.0.0' is not one of ['allwinner,sun20i-d1-plic']
        'sifive,plic-1.0.0' was expected
        'thead,c900-plic' was expected
riscv-virt.dtb: plic@c000000: '#address-cells' is a required property

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 92e0f8c3eff2..99e01f4d0a69 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -66,6 +66,11 @@ properties:
           - enum:
               - allwinner,sun20i-d1-plic
           - const: thead,c900-plic
+      - items:
+          - const: sifive,plic-1.0.0
+          - const: riscv,plic0
+        deprecated: true
+        description: For the QEMU virt machine only
 
   reg:
     maxItems: 1
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
