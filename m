Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986F4C3F6B0
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Aug 2022 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqgHBJV0u5npRv54Od1fvAwNiP+zaVDi6va4CVfFDik=; b=elOssKU9jEPYRg
	kVtqgEx0YV6mLN4EESBw5gL0xDFky+BW+1U99PqWLC49IWRQngvxdDf8IXRVmwKGbSHvyKdmt3Mjd
	2JC2G2vGt6W71imy10FbiujQrrM6xlXT7SGNlB5EmKp7xwX/UsVXZOWXDe4VfxMVhePoYeEyG/McW
	rlmKtIS9IdBJnZ8/j3KP7TQgFHQGKck2HM4BjhKzlKB0j4Tv1IXwDlcmJQC7quo8WFSMfDHVqhZGD
	ab69UlYwUUqbgm2rWSLMAeuMp4sGWNsrlLimWL9HSgxP9MPcgR1qlRH5hLiScW3RD8g/Slgj2HcS4
	/X1Eguh/hDoHuDbJD+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYiz-0084v7-5v; Tue, 23 Aug 2022 18:34:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYit-0084sA-Cr
	for linux-riscv@lists.infradead.org; Tue, 23 Aug 2022 18:34:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id v7-20020a1cac07000000b003a6062a4f81so10085817wme.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 Aug 2022 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SXjC+1eAipiwLVckozeddO7uqjToKvtGjqOQeotcMjA=;
        b=KbX0skZMzo1dHORnO1cN91HQwYl5fklrhtHhR2L7O0pjBR2WQcmbC6+6QCsRSVABqj
         suGNDT5zgBvkiN83Nia7Fxsj/GUe4ZrlfG1UmMEwbcLoXEmvZ6cUjQlSkDHA5N85GJ7D
         MXdfh/3k36Gh681xIxzhAcU5D3VniKUKc7tEsODBfWdS6vC/28mqYdr0qmBYnIIijOqQ
         6o4C9Z6SGB/f+JumjLGTtaD8bu4/rwOJUdJ+qMjZPi23lOHvE9w6+/bt9ug4xdsaXDcL
         0nTVKQhWqBAP3808O62VC5jQ8sGAcXbvQgO/aibQ4HwTyaZ5rV1mI4kilaKf0RQQhBgU
         q44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SXjC+1eAipiwLVckozeddO7uqjToKvtGjqOQeotcMjA=;
        b=JQ91nDJVZLcqYBFnxrO4qUC25K953CIOl7a1DQ2+VKqiRxWdvWB/b7W5wnMovCVEAs
         exz9lEOcWasWGuXRoZNd8+MlYI3GCjQRlexTf2R5SHHq/ZDjCOnXwLHxaw67/ZYFpTeg
         y3EzBBTiS9vLqaZ5ZTBo/sVdKkoQ5bbHJaC6ceCzaBtnvHE5by1HWB6Au7qdCGZhaC7T
         dkDRfi8+0ps5/72rGuTFwxtid5rgqow/VXLIXf4F1vZ33pDMUUZhNpf1rGVS4wSoVNcB
         gXqtdCkPjUDAhh1xFepjHF06GkCjYQo7L7Oks6Y3dZZKh2IXYndkt0WPgQoH/dQDLH8i
         GpPw==
X-Gm-Message-State: ACgBeo34bahT9DmvCBHC/OvnjEaq/aR9+omPhHRgEo2QnSZ4WmYIX4Gb
	7lywVv7Y1rXQq7tqoqZF2C/DeQ==
X-Google-Smtp-Source: AA6agR5q5Ekkbe1X55VNXuzYGucNAP21vgIbfd9u4MP8ILX9K+hq65/YrNIaCt5ZG3XgVMMwVoDaHA==
X-Received: by 2002:a05:600c:2c47:b0:3a6:4623:4ccf with SMTP id r7-20020a05600c2c4700b003a646234ccfmr3142126wmg.85.1661279636305;
        Tue, 23 Aug 2022 11:33:56 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c1d9000b003a5fcae64d4sm19396556wms.29.2022.08.23.11.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 11:33:55 -0700 (PDT)
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
Subject: [PATCH v4 2/4] dt-bindings: interrupt-controller: sifive,plic: add legacy riscv compatible
Date: Tue, 23 Aug 2022 19:33:18 +0100
Message-Id: <20220823183319.3314940-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823183319.3314940-1-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_113359_456055_2FF169F2 
X-CRM114-Status: UNSURE (   9.60  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
