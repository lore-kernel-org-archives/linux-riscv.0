Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7C0C2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 18:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNutFBIy+WqHl3c/7/Ogcw4WrXOYEbMoqd0JDOvk3ys=; b=PVSP+jY1K06Ekc
	0Z1oiH6BLk/EC4taWfVoXN+ek6jjh6NEejn2m/6Q/O/svjQZazFCgWa2FwlKAf8p9KmiBl6SR4UHG
	8pBXif992vOpil1cOMdeQy/DivWAEAGGazdm1ngyXogYq3V6DiL7sLGutBELopYqy9cZ5pLmFPuuA
	jDug3RRGlaA0WEMrweOkU5TFb04EeJcHya3OPKDl04uXiadY9Z/xVRVrMbReHvLl53nUlR45fkvM9
	FnM4HYTdWN5BPSZHPbRxbFWzP/3/yg+LwONdglFADKpg6dvdsixyPAE3iIwF9Ex3n+Uj2P6FVPzEW
	Mhcc6mpXcRVpbZ1Qouww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GR-005oFn-Mk; Tue, 16 Aug 2022 18:26:07 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO1GK-005oAa-I1
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 18:26:02 +0000
Received: by mail-wr1-x436.google.com with SMTP id e27so8894391wra.11
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 11:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vN0DGeJfb4elpBHq3mALobUym6adR42yLX1wd+NKgEE=;
        b=PEQa+TuOt73fuVOb7T3+1Hy22N+kDixRACSlic+zJdWgAlesuDfvE1jahD01g/8cdj
         JtjLszP3D/e60G+3P/Rt5/iBz9VWfQF602riMmjeed8yuXTxodssttItwsAyz0GrBQZo
         6LmHwXV6CqeUfz64pE5IPXKtJ1n9S1FreF+47P+iL8HB8IR1vVJdH5psvqQJAAo3dCRq
         DL/y+a0eof3Bq6c8BzMHERC/3fGHJeLd1TPzHyp3//AleEyFOUblv3dKavXn72ZfaRSc
         07f2TgjpW+yB32DviJVBg2Kdf2NeR/iovjRACiByAy90F94WBIc+It5pE/ThbMRTHttV
         4HTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vN0DGeJfb4elpBHq3mALobUym6adR42yLX1wd+NKgEE=;
        b=T5F8DBLSy+Hxyi8G1mqk8yrsEq7g3ww6zoCbw7UUdiv/08xFGSVhPFwTCL4OoEJlRt
         QS83qiuHsOvnml+P1mqyb2bBYxK7CQXhgIBU7Oqdm3FunNg5D00Hbv9lIYpLX5sP6EQs
         xcMKbFurLUOFKHr6R11XqYIW7jzqNKo37+4r6Jb7kL57YlixkM8ufTywEMTpW7IoRoWa
         lWtUfqR2qyBAnJ+MEDx9cCWsaloj9sg+a4iInwgXM8VePGqqaVhHT+C9gWtqi+HwUCQR
         c40Tb3Rkx3wt4iNQnzQ+5Xmsi+3oleuPVU2+G/9ARVXg0GYI9iS28pzI9bvz71t8H81b
         itDw==
X-Gm-Message-State: ACgBeo3WqZMlpM9+GwgWKGZpl3MnZQPjkqYU6NYYRsE1EC/QkWpyLREX
	fvOoF024kgVWIhlzFlqUSZ7xcg==
X-Google-Smtp-Source: AA6agR7sTCd254G+0o5Cw9GOa0R6pQiko3YyBwBowV/CViwJLAAOXwkNioukcNooVtKoYy4ChxnydA==
X-Received: by 2002:a5d:5081:0:b0:220:6262:be0b with SMTP id a1-20020a5d5081000000b002206262be0bmr11725612wrt.228.1660674358778;
        Tue, 16 Aug 2022 11:25:58 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id s17-20020a1cf211000000b003a603fbad5bsm4015482wmc.45.2022.08.16.11.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 11:25:58 -0700 (PDT)
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
Subject: [PATCH v2 3/6] riscv: dts: microchip: mpfs: fix incorrect pcie child node name
Date: Tue, 16 Aug 2022 19:25:45 +0100
Message-Id: <20220816182547.3454843-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816182547.3454843-1-mail@conchuod.ie>
References: <20220816182547.3454843-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_112600_633479_C58A0E83 
X-CRM114-Status: GOOD (  11.44  )
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

Recent versions of dt-schema complain about the PCIe controller's child
node name:
arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
            From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
Make the dts match the correct property name in the dts.

Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2022.08 of dt-schema is required to replicate.
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 499c2e63ad35..e69322f56516 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -487,7 +487,7 @@ pcie: pcie@2000000000 {
 			msi-controller;
 			microchip,axi-m-atr0 = <0x10 0x0>;
 			status = "disabled";
-			pcie_intc: legacy-interrupt-controller {
+			pcie_intc: interrupt-controller {
 				#address-cells = <0>;
 				#interrupt-cells = <1>;
 				interrupt-controller;
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
