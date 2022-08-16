Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82FCC25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 18:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eailt1+mBuUpZzThGP+tOD71jgb4RPTvUahYMwnFlsI=; b=woQKiVRKWLEw2O
	lQCpdFZc1ZKsgm5XZ7Ou/+lqobfgsKOuIF14XTVQSqpJpp2/8AsxPHnNRc8HH4K4tgIjyUA/oOFsn
	2J2KjVpZDpfnZqyEtCcH8Ha0/hXb7begSnIXVLg5jlqMzZSaR1mzshp4+3M2/DZ2WYyBagfQH5920
	riJycMSazw49xlBVfT4C+6wGWTiRAHD0sY0n0lVWieTHeVzJRsYfvsL6OkxMplqLSBRPH2/zOzWMo
	RAxOUv/CmLVJHp6q3ZOH5GxMv3qKnKC4mYdxmZaGnkGWgrp89Fk1upB7UYY78jd7w+bv044Zk4Qm+
	qV33RdbgvEbbRaxMpTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GQ-005oF7-AC; Tue, 16 Aug 2022 18:26:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GJ-005o99-MH
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 18:26:02 +0000
Received: by mail-wr1-x435.google.com with SMTP id bs25so13637447wrb.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 11:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=d9TppbXdiWPs+48x7U6F2RLRbtXIB7UvU4Wm4rVvtl0=;
        b=f2AlxGScpJunozXwr3OLri+tVAp8DP91ryrotY2//J2fi1OUCt1LNagskuDqphhkZT
         YrquLa/5e3kZ0mNDTpe8BZPCqsenNm2Iz6veDpmpJ2eS1/XvlY9RG0X5z1/PE71xJM/z
         T89NIgNPpq6E+d39MQKxfD7TWO20cghUHmkysLjgO3lWV5s7Rl+R6uqjodyd8Uo9Phd8
         3Jpqpdld6ng03AVC6cciJzWfKieF0XVANREG8RAcZlM+uEsFPf0miZbDNl9GDQcXyNWL
         1Gy9OFXRx+voQGCrcVvklEEfQh2gOjJjjJeoID3OXAAvB/6mk0/QFGfKnDLEXI1kcD03
         MiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=d9TppbXdiWPs+48x7U6F2RLRbtXIB7UvU4Wm4rVvtl0=;
        b=OqbEQ2EsflyK/irB1x/nNGXtCqszGhGq5PAAw6CLD8e9a8A0tZ/0YmL71+HAfEBtdm
         nRXT81C8IQ3z5iMoD4SwXpdHnq/nXeDYldjvwcWpEZ7OpGb7rj0NAVlpZ6J+9q3sPD3d
         bYxMX9s4Yd4N5O+5w3ccLfqVJihjb12sDWI5NMdd/E0y6VbEVgQSJEDPMlO/k1u5d3r9
         Qf4BK1SZJLVCpotQmuLEdegsoS3nlOMlVZkPtWCo8tKn4dITLW+mHXqH1dx3Ea4Odwep
         4J3b8CYZKe1zNJJso4H+tZXkurE4r8vLEuaXopfnsvUHMUALt2Avx/T5SZoICBew03B3
         bSJw==
X-Gm-Message-State: ACgBeo3NkSJuBOiWD8+nUiQ6D5A+O5YHlmwXEzXEUSRUPfMq6YfQH92B
	tA+wbojqh3Vtb5GQ37EnmxBkuw==
X-Google-Smtp-Source: AA6agR5I+KbBV3e/0Gh9/t5/+sRspQ2mbNFQlQO0aX1NckIqMfw5q/VrA8Cv5/N3BXLfG6j4FPECGg==
X-Received: by 2002:a05:6000:1152:b0:220:6421:ccdc with SMTP id d18-20020a056000115200b002206421ccdcmr12322712wrx.61.1660674356514;
        Tue, 16 Aug 2022 11:25:56 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003a603fbad5bsm4015482wmc.45.2022.08.16.11.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 11:25:55 -0700 (PDT)
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
Subject: [PATCH v2 1/6] dt-bindings: PCI: fu740-pci: fix missing clock-names
Date: Tue, 16 Aug 2022 19:25:43 +0100
Message-Id: <20220816182547.3454843-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816182547.3454843-1-mail@conchuod.ie>
References: <20220816182547.3454843-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_112559_774354_97BE8780 
X-CRM114-Status: GOOD (  10.69  )
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

The commit b92225b034c0 ("dt-bindings: PCI: designware: Fix
'unevaluatedProperties' warnings") removed the clock-names property as
a requirement and from the example as it triggered unevaluatedProperty
warnings. dtbs_check was not able to pick up on this at the time, but
now can:

arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: pcie@e00000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
        From schema: linux/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml

The property was already in use by the FU740 DTS and the clock must be
enabled. The Linux driver does not use this property, but outside of
the kernel this property may have users. Re-add the property and its
"clocks" dependency.

Fixes: b92225b034c0 ("dt-bindings: PCI: designware: Fix 'unevaluatedProperties' warnings")
Fixes: 43cea116be0b ("dt-bindings: PCI: Add SiFive FU740 PCIe host controller")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2022.08 of dt-schema is required.
---
 .../devicetree/bindings/pci/sifive,fu740-pcie.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
index 195e6afeb169..c7a9a2dc0fa6 100644
--- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -51,6 +51,12 @@ properties:
     description: A phandle to the PCIe power up reset line.
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: pcie_aux
+
   pwren-gpios:
     description: Should specify the GPIO for controlling the PCI bus device power on.
     maxItems: 1
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
