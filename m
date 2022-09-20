Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC0AC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 09:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/u4ijmwpvbixT1RzC++8b4RvydniTB1AZeQ89eUv3i0=; b=Jvb71LWNuO2siT
	/4MpT3kGyE1sEbFnrWlHZ7BawVyRZY9RTtWrZqxJh4RxJpseiCAXDw8nKoq6hieSudG41dLUO6LDE
	nptdTlhC/AtjyoayqwW+roxuRVkUBzdZtiB4X+3dUrx58ogzkycQ1U79tWEUnGo/XmMSvs374jy23
	M4B7NmxVxhxMHvItspfev8y4AyGOz979PvqBQQhxX3/iS0wqMNimo5Txhee2g3euwmTnTc++pP8HN
	yprSqbf/rRFFOOw04mc777gPMv6ayPrw77t9oWJHhq55jryB31vtUFG2jiV7bvmz7F+x9D99H+vG9
	Lxj2VcMsoNiATz/tdTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZlN-002X2j-RV; Tue, 20 Sep 2022 09:41:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZhh-002Toc-FX
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 09:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663666689; x=1695202689;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0eMZLKNdqVAlK3K8F04y5fR6MSFQdN2D0EBwXRCwQ9A=;
  b=OV0KdUD18BxD1Nb12XO8QP/iRFObSExagyLju8Zpa9cdFjbdTFd+QXH4
   uuGxIfSyKJnExcBjIE4p/ZgKHvslmiqyIuq7gTW6myjS8z4wIRo4GIXUC
   MjtGjk20GO16UEyPPx3DTI1B0BJtZBVovd9B15vKaRy6Pjw20O0Ajdpzq
   aAwe32hAzhoI1q+OuTnmrJlBHSCr2wMG/K93j4VVBMYd2ktbb+qHPbcUi
   85UJ719GucC8Oswn720ALGYcbWtCWaYBbzreXAhJK6gk+PRgmItprStq2
   xGJVDK1k2xhfivizygS1mn5zd0xNpV2gsomPucNvBM/tO8+VDT3TG6c8b
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="114516346"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Sep 2022 02:38:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 20 Sep 2022 02:38:06 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 20 Sep 2022 02:38:05 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Hugh Breslin <hugh.breslin@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: dts: microchip: fix fabric i2c reg size
Date: Tue, 20 Sep 2022 10:37:35 +0100
Message-ID: <20220920093734.29287-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_023809_670049_8B28EB83 
X-CRM114-Status: UNSURE (   9.52  )
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

The size of the reg should've been changed when the address was changed,
but obviously I forgot to do so.

Fixes: 7f3be227e818 ("riscv: dts: microchip: icicle: re-jig fabric peripheral addresses")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index c196bbfc0c24..917ed4c7b18f 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -17,7 +17,7 @@ core_pwm0: pwm@40000000 {
 
 	i2c2: i2c@40000200 {
 		compatible = "microchip,corei2c-rtl-v7";
-		reg = <0x0 0x40000200 0x0 0x1000>;
+		reg = <0x0 0x40000200 0x0 0x100>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		clocks = <&ccc_nw CLK_CCC_PLL0_OUT3>;
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
