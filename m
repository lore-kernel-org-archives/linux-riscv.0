Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8533EC32792
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 23:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNutFBIy+WqHl3c/7/Ogcw4WrXOYEbMoqd0JDOvk3ys=; b=zvD0RtWtagJ2H3
	a1NpdRC/r79nKWmxTywVkrELZpasj5dctAyY+fd5fcpf2M7Z3zq88zYneUErnAKo/Gs2U3YCauqu/
	mOe6AQ7wtObBUFaDTgmL7zpJlQMthf2dOUyfhJz00AcgfmLd5iVBwzREdo6q27Zkrs4E71WMkzzJS
	S2YLFOxjC7nOyF/MesZNZsWnvOM2U6e34T1GkuNMahmzk/dtzXqoGv3G+IX691HhXiUZQrWvdHfGj
	pwn84SZEy1NAHykjo9JyNOXF5cKQxMtLb2vIpMCY0NH6zHHSuU1xfEny0i1JtXmKBIfF/xQ2GUcSA
	RkV4urWXxp2xjPGMOdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBCI-00DHcX-D9; Fri, 19 Aug 2022 23:14:38 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBC9-00DHUR-Ur
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 23:14:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id d16so1410722wrr.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 16:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vN0DGeJfb4elpBHq3mALobUym6adR42yLX1wd+NKgEE=;
        b=gCzTdWMPXSugSg9LBMqCSeD3JplhT7DIWaAbxBe7JlQULZyIYqyUNrHUrxqRv1nF0O
         IlFWgdYpoXqtffeSgF9cKPNsxJpUpc/ijbHjw7YRoPH9w3KpI/SLogztqwUGA14d3my0
         d4NJZCxPDt7vfVLMkJiCIns7c4tsFotmJEjMyJF/FrXxOAJhMjWYyQ8U5tovJyt/MirR
         VoTiA0Zp75abJqzzT0sClBB3tJwSPQS7fQNkRkq7U8MZgXY4t+EmEaY+WTcZJdMj/PBL
         UUFsOfiW3XCqKP0n9OSN5aLI1LVtUp9Vu7bz+TJ+3yFGhSr84TNfBlK4kNtu6s+kjHjM
         H9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vN0DGeJfb4elpBHq3mALobUym6adR42yLX1wd+NKgEE=;
        b=cayQGTs/AlL8hnvg+C4+kKCsfsyomKKD/z5LyJ+Ddi+9Cw5X9Ozxbb54LWmoKYQ+dG
         K1aXnp3XiVFmtlzYn/xmKvXlj5pPhuJ1BrUT/xbKrJCqJZyJu3blLy9rEflLaeBlakNK
         2+Nmx/1dPPOU0DXp0SCKJzukiGokDLLxhdxlq4H8k0K4Chp1eTnN7If9DedJiczWsYza
         5KyQTrkWPBnaKgHswRwicWDKbnsSy0ZlIbHBZ5LJIXxnwSdElCpmLOB8fHTX3kts/EaW
         p/XXfBypIHM/cUHcpCN3SkEuF42Iv8or8Ry2k2qZklDN+WHHvSTu/nHBKp59C/zoDh89
         GIzg==
X-Gm-Message-State: ACgBeo2FNtLLcf18302gScEIyupWzl/6dEWCclAddVxVs2b1TxgmZX/U
	UEqAINkI8M1c+SRt3V7Fjdhepw==
X-Google-Smtp-Source: AA6agR5RqrcGo/ilIWgn0sQMbkFC+AIrrHqX1XG5e4BktUFXFPfuB61xoV/CrtIzIW8k7+CP+vOMKA==
X-Received: by 2002:a05:6000:144a:b0:220:7181:9283 with SMTP id v10-20020a056000144a00b0022071819283mr5097105wrx.158.1660950868698;
        Fri, 19 Aug 2022 16:14:28 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d46d1000000b0020fff0ea0a3sm5198522wrs.116.2022.08.19.16.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 16:14:28 -0700 (PDT)
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
Subject: [PATCH v3 4/7] riscv: dts: microchip: mpfs: fix incorrect pcie child node name
Date: Sat, 20 Aug 2022 00:14:13 +0100
Message-Id: <20220819231415.3860210-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819231415.3860210-1-mail@conchuod.ie>
References: <20220819231415.3860210-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_161430_424563_EE0286ED 
X-CRM114-Status: GOOD (  11.52  )
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
