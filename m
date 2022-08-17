Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD28C2BB41
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a91ApCdYm/2VDetfdFHOeGqOuYWkjNIkBOJHuT3IoZ4=; b=H5//BuWXb3UOk0
	pgEPBPT/8yp8cqylDd8EyzZqooFVZSdDQ6tzPehiTyxf6C2faekpeIGvlxFBFHkzx/Q2ok6EQkF4h
	grJ9EiA+t77j6oEDQo8ErERmd/o3+Fl5HtbXXcjRSU3n6frBXFZZiKEMwNzgMDyPPwkgccWs7Npc9
	Oj+sOML9uWfyhvY0tVmvhbjigkatMaZsbEVOmREGSeT3Fz3356pmD/5EpbqbVgXv8f4nd8C/YNf2W
	miDuCok33f30/5EOLuVdd+/Tzgl2ZMu7Gach+vrzrQcKNS+tZ3aDZzlDRWmHnx+naMIDVFGRvtReI
	kZR7Q6KUURPbOqdx8HxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIe-0066Sx-C3; Wed, 17 Aug 2022 20:06:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIY-0066N3-UY
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:05:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r16so8189069wrm.6
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vuO3cD7vHfOoM26qaFlIa3/qXvWH4JaTB3axSBEJPBw=;
        b=aLff/SU5U5NCprD2QuW81ZfqWPcaSFXlXSbnm3nBxoThVUuC+erRdVodWmcN79GWR3
         x6K8q62Y/aYgL/FZR7jCoVAQly7asoaWMM3eg4Sn7jt91w07TL5ryQcaxYoFF6mtw7x7
         WyCWzHVrw1kx1hzhuGNSQ8Z1QZLPIxrOSVAv5jzhEYz5lNvczMpa1TQU+b0Tf7qi+ALt
         tyUURhWEo6A/4e0QPQ+c9f7f1yX97VvMESe+aAoTJFbFqSFzjrwU8WvqNZnisdvUVt5J
         zfYmHcItVD5nQhI8sOUgr2pTtd/SmXdJo6yVsTj0KdxUltsCv4tc4rsYkjw0cepkFKbm
         LQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vuO3cD7vHfOoM26qaFlIa3/qXvWH4JaTB3axSBEJPBw=;
        b=tqmqg2yWv/NN1GLffZOfHNwhtCBWV470uX8WogmOXppzv2HFXXTECMs8oY5lYp50yQ
         FIfoPXso/1IpOAIHZJVnlLkpUcWHD3myjWdoXW3SOoxorDqDP48Azv8/oFPWrqrBv6Rd
         toHY+hFTMrjgaYP7+L3xSi7j6oTafZantz8EFKMRQtChIGBYqL3tX3tP8oCX+Tem/ki7
         +NjOo6Z4x8kvftVM/piI8Vb2POCPX3QEB8yGGIWsuEfeglRWeg5vKNrg3GDvv7go5zZT
         rjFwXK9YCwco+xQ/ruHbu3XJwuxAaHSg6dCv/hkL09QMqJ0fwaT3XTs2Hx3ac8iXdBw0
         J+lQ==
X-Gm-Message-State: ACgBeo2Wei+ncmBXEMVlIDzZjoeF1dkmybzfhXru3otYaLPaWSMk+EXL
	9cQrP3QGFBcHnvoyCqFAZEF+cQ==
X-Google-Smtp-Source: AA6agR6xInXHiAM2BCLKV9u+fYev1yEmFG0NjjMiZhNBeLkYTbhJq4za1Z3qh97Ys5ZCdjUKqm17DQ==
X-Received: by 2002:a05:6000:1b92:b0:220:7d86:2e30 with SMTP id r18-20020a0560001b9200b002207d862e30mr15678682wru.530.1660766752738;
        Wed, 17 Aug 2022 13:05:52 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:05:51 -0700 (PDT)
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
Subject: [PATCH 2/4] dt-bindings: interrupt-controller: sifive,plic: add legacy riscv compatible
Date: Wed, 17 Aug 2022 21:05:21 +0100
Message-Id: <20220817200531.988850-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_130555_006735_78F4F928 
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
