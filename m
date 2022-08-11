Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5CDC19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 20:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91WlDesrH1XJ1MWUQFFadKw8XvdzUQ0I3tYcIY7ykn4=; b=yIg3uMO/3JIARr
	rIQx96ph+Z4UMprNFiIhLiE0+QTbgSyRs4XFXgmoGd1jAjETgnjGhtsDle2SLxIS28ZTF0zdiKnTt
	sF6OqZnjvRv88QkIjHbvHIheScBe7X4ZMbCojhO+Wn2AbY1iStQdKhQvTUNOr2NICg+txR83CV/2+
	6/Ow69DBL+LKnPt1pn+cJwSR+yguxeIBfUlwIMEA27MBI2mzKAPo8ujkRlHXFWObK4nv/qEpnPyom
	XtLXWGblHcx8qubMrnNSfCSjeupPU2koLXH/FVkSl/hlxPqLKwIu2/uWzU2YZJEt/XloD7xiIRtkH
	iQZQcklV8MgBBSQcB0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMErr-0056Yw-IH; Thu, 11 Aug 2022 20:33:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMErn-0056U0-Ly
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 20:33:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id z12so22544068wrs.9
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=BMoCBhZDWFVbCIulovqGFO1GGwjU3Gb2EjVAgLDr/kM=;
        b=e1haM7gYHDueJmKbGFqDqB0CwdhTeSa2E4wt4JmEDSJbRCc95HOzVyhmhAR1aZMqqx
         WxkA1FzPGcrae9KDWdzDMQHZEb1i39i7aAL9rQ0/XQMl0cjzp27sbySRBMnLhzbUHVO9
         p7YPgrN5/LQYBe6cKzpCPAwLYeTnzOked1Fp12KP22d+INh+NSfPUx4OvjJU/VCDd81U
         gwIKYZTkvJayzWTODqIsBm7Mc+j7idl/i5AbrnvDIsmPMmT2pRhWCHNWRNL/NjJQmAK3
         REtDrCKW9kfVEhaxxP06EjHEUcaXvACDZ9Cu7GF6pF7rHNRdKy1UlQE0Abl+CgWbWCRX
         qlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=BMoCBhZDWFVbCIulovqGFO1GGwjU3Gb2EjVAgLDr/kM=;
        b=U6gIJPN8aGZ/TgtNU7eGWDrWA+STbQahHEaeZ7NE5dvEjVpAnLeL/PG/FNEgVHC2WL
         v3JYAco1ciZkyeQeM64VYl7V/txtz2IFIMvn6Nv8PIxB7eRmIM2h3xWKgxsmX+tet1+K
         iSvSYM3d4qJYxNRM4UCKcbrUZXW0Js1oDb0Ma3Q410DszENslDZueDyvSFFoXL3kxJgP
         fWj24+glcE9CYFzzhngS5QSXPSeiYF57dLG398A3779MuDaacSxWob4X8MX8xMY8FSMW
         glh+TVdaE7sgVeCY/gUpUHucQaXQqID6uMgCSupVHDZ4fc6KqJNS/vvdZfCCzmALWET7
         dNXA==
X-Gm-Message-State: ACgBeo1J30UufDt2EEK30exe3Vw9cGE7b5nZsuon+uHAHtxoM1Rx4r4Q
	BuNkudcrX2VxmcyULZdih8EGbg==
X-Google-Smtp-Source: AA6agR7XEt/HJ/k3HAKtCMICn0MmET4kycwS554nxvopStvc3/5uFdV66pz7zYk7eLXXULU8iWeBFw==
X-Received: by 2002:a5d:44c8:0:b0:21e:b750:2bda with SMTP id z8-20020a5d44c8000000b0021eb7502bdamr351862wrr.338.1660249999075;
        Thu, 11 Aug 2022 13:33:19 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i12-20020adfefcc000000b0021f1ec8776fsm86643wrp.61.2022.08.11.13.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 13:33:18 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/4] dt-bindings: PCI: microchip,pcie-host: fix incorrect child node name
Date: Thu, 11 Aug 2022 21:33:06 +0100
Message-Id: <20220811203306.179744-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811203306.179744-1-mail@conchuod.ie>
References: <20220811203306.179744-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_133319_765730_45CC9F44 
X-CRM114-Status: GOOD (  12.96  )
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

v2022.08 of dt-schema improved checking of unevaluatedProperties, and
exposed a previously unseen warning for the PCIe controller's interrupt
controller node name:

arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
        From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml

Make the property in the binding match the node name actually used in
the dts.

Fixes: dcd49679fb3a ("dt-bindings: PCI: Fix 'unevaluatedProperties' warnings")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
This is another one Rob where I feel like I'm doing the wrong thing.
The Linux driver gets the child node without using the name, but
another OS etc could in theory (or reality), right?
---
 .../devicetree/bindings/pci/microchip,pcie-host.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index 2a2166f09e2c..9b123bcd034c 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -71,7 +71,7 @@ properties:
   msi-parent:
     description: MSI controller the device is capable of using.
 
-  interrupt-controller:
+  legacy-interrupt-controller:
     type: object
     properties:
       '#address-cells':
@@ -125,7 +125,7 @@ examples:
                     msi-controller;
                     bus-range = <0x00 0x7f>;
                     ranges = <0x03000000 0x0 0x78000000 0x0 0x78000000 0x0 0x04000000>;
-                    pcie_intc0: interrupt-controller {
+                    pcie_intc0: legacy-interrupt-controller {
                         #address-cells = <0>;
                         #interrupt-cells = <1>;
                         interrupt-controller;
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
