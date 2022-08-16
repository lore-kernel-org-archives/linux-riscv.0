Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23201C32774
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLDPR8wr+dUMy/J2dXki/7q0THLxnTk3oNFnZvT6wZs=; b=t1Pm+JA8JiSWql
	hjhFEZXFJgCAKrK/sUskygD+eYP6cEdUyMv6Mh35DDkkvOkTKooFpCXdPILzWxS/Xqi9gfigh2j+g
	NGWM2PFvCofaKGmeFR3K6dvAp7MJrYvt+YuQsv4gJblGSdOT2O7KoMbl5uVKnCcZCcMwiOajRISgs
	3Vz7+F9Ug+wmMT3qshHvAjUa5pxv47argUxtV+XGRq9LvUtxT+6DJlCmZKtqbwcmjB0m9KI49pHM7
	gqtxk2/1/cBfwT8FKPmesRDiS4s7T4fs6ZtI9wfgMNpflHhTlvOhBNcKENXAfxjOAvbYumzHiYm3G
	NMEB8kGj00I2ZqVtzqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GN-005oE6-Tb; Tue, 16 Aug 2022 18:26:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GJ-005o9N-Ha
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 18:26:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso8065738wmc.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 11:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=FMkAjTRxFynoKfy/JBCi5zISG1GRJIQTYNHeDvaDnhc=;
        b=edWE/8Om/5nhi4bDasv/LIbOVfF6WqJ+jyLjdV2U57/KWwkiAZLjuSgliTEtKV3eDm
         2Ib2XEp6RLOwpim0ssuftuMa6c6upQpytEDq0mFmszL6W3YVjVEPD1R/hNMvKUef16id
         hxV655Qk8bLCNbcVyuJIgjbIMupSeJe8pcOU3EM8Ia1PoJd31xFM8MY+1qviVmLIk0hJ
         ub5tfTuqSHLH2meS7KyNVIA0QPr6gv9/xIVaRZj2P4CiDOnfovYMg8VUp6PtTF9sYRbA
         AEqW8lHeTMVn4k0kEyt7trr4QxLSHIS6ShpD3Nu/yRwub/Ip6BbP6ZmISwP/IYQJnODt
         JmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=FMkAjTRxFynoKfy/JBCi5zISG1GRJIQTYNHeDvaDnhc=;
        b=sjW+UiHm5l9D9ry4/1CRPlo+v/0LTP/vd9/fyTQEZNq0uLsy75JIUFh0+i4FnEz6jE
         eJMOJudLiGlOWgpw2AZ8enV8QkQY/xPDFSyH498gU9GxqxJ3aqKKqOCoBuaqUcao/XhY
         Nktwl7LuzUZWZd14pKBPb/TLQmYtQQGdK8xHNVOudRQ+AB7gwFJwfRoboAAOOA4Y80pp
         ZDsS0qPKcFiFlIM9dZNSr4Tvk7VBwGMVTOMwpKtYQN08TSqUGVI7r1TMaz/tmHhWNE+P
         hCWvEx0MgQjmISHfP2DIn7XDzBWveucFlUY1LCjTGX2sgBx04it71OhulhHrq/3gwZ0B
         iWhg==
X-Gm-Message-State: ACgBeo1mATlHD4NIYWdasReQwiuZwNwxXeWpNHEJVfCWiMYCtZmvoEh/
	fOlOQlQEBG4hv9J5xP9fGTX1zg==
X-Google-Smtp-Source: AA6agR5KC3j+XouQHP1FxiS6VJD6PbM4GQLhS+ON8+YKaVfbQ51bYX6+5FkVajNHT2pNc6KNfsSAjw==
X-Received: by 2002:a05:600c:1898:b0:3a5:b467:c3ef with SMTP id x24-20020a05600c189800b003a5b467c3efmr19356925wmp.178.1660674357641;
        Tue, 16 Aug 2022 11:25:57 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003a603fbad5bsm4015482wmc.45.2022.08.16.11.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 11:25:57 -0700 (PDT)
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
Subject: [PATCH v2 2/6] dt-bindings: PCI: microchip,pcie-host: fix missing clocks properties
Date: Tue, 16 Aug 2022 19:25:44 +0100
Message-Id: <20220816182547.3454843-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816182547.3454843-1-mail@conchuod.ie>
References: <20220816182547.3454843-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_112559_622243_519346B8 
X-CRM114-Status: GOOD (  10.77  )
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

Recent versions of dt-schema warn about unevaluatedProperties:
arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
        From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml

The clocks are required to enable interfaces between the FPGA fabric
and the core complex, so add them to the binding.

Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
dt-schema v2022.08 is required to replicate
---
 .../bindings/pci/microchip,pcie-host.yaml     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index edb4f81253c8..6bbde8693ef8 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -25,6 +25,31 @@ properties:
       - const: cfg
       - const: apb
 
+  clocks:
+    description:
+      Fabric Interface Controllers, FICs, are the interface between the FPGA
+      fabric and the core complex on PolarFire SoC. The FICs require two clocks,
+      one from each side of the interface. The "FIC clocks" described by this
+      property are on the core complex side & communication through a FIC is not
+      possible unless it's corresponding clock is enabled. A clock must be
+      enabled for each of the interfaces the root port is connected through.
+      This could in theory be all 4 interfaces, one interface or any combination
+      in between.
+    minItems: 1
+    items:
+      - description: FIC0's clock
+      - description: FIC1's clock
+      - description: FIC2's clock
+      - description: FIC3's clock
+
+  clock-names:
+    description:
+      As any FIC connection combination is possible, the names should match the
+      order in the clocks property and take the form "ficN" where N is a number
+      0-3
+    minItems: 1
+    maxItems: 4
+
   interrupts:
     minItems: 1
     items:
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
