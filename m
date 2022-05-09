Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75178C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 14:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6yM/odpwwLoBJkvaXNWZ0bwXBpXqdazL9XMHsLyANM=; b=D/50/0Fq/ErFzi
	hjMEyANYeAKoUhbJFr3JT5nzN6X1Jwe/zJ7MN43R6ti2tVowEeR7kRCO2OS/VTCyCg6LrCTGRxHk7
	WVGIBxvd90PMgUtx9rqwcl1gH+RH3zUHC+usQ1um9H9DnIQHrs3K1oZEEHy3V2Z3Q+Y8kyUAuhdL6
	AXM1CytB+TZv/dO8q+zJgOqbAmlM/XSA+T7yx05Yes8XxbgpEda4pDOubC592bnYWtj66zOC/acI8
	M5MyxMObJN3u8ZS9n/oumAr6lW6GpTrbRhZnVZUzKK+uJuDPWxDJjA7NWifNPRdCdKH/5pMwHAezW
	8ENVGf1yLGVjtVjEWcJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no4Lb-00Epkh-Hb; Mon, 09 May 2022 14:26:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no4LY-00Epjo-PI
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 14:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652106408; x=1683642408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dVVRzKApVE50y12Leb73RnyQE0EWl3gk7c+UgrPbLxI=;
 b=RVwHgwm7qa77UFsi4QzMHByJ/XTcUptrV33fQuqPTA9xoVmDgHWQqnKy
 PPW5UDKMiadFJNLgNJmVkG5mpLpkU9KhWs7rijj6TqdzfeNDFLRNr95j/
 ZV3yyE5K3iWWLaj8zIgszhiUcs7trnXXFrOxntL+U9tNT0ncLPjP3dm3z
 viLQsxE4PImiyOIQFFHZTgQIKc0gzf7tsIFtYa2Lum/1GIhuSM+OR+V64
 ApwF+Ss7zifYgUypuPtPqxVT06e9YTSzGXNRijp/gvgeDvukffRgrnQ9u
 oobkzSD09I/B2ksrWioCLrRCOt6b5l3LgEaWgwDZvq4MaQNmlrtpiYTYF g==;
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="172518068"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 May 2022 07:26:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 9 May 2022 07:26:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 9 May 2022 07:26:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Cyril Jean <Cyril.Jean@microchip.com>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5 01/10] riscv: dts: microchip: remove icicle memory clocks
Date: Mon, 9 May 2022 15:26:02 +0100
Message-ID: <20220509142610.128590-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220509142610.128590-1-conor.dooley@microchip.com>
References: <20220509142610.128590-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_072648_860629_9107D177 
X-CRM114-Status: UNSURE (   8.85  )
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

The clock properties in the icicle kit's memory entries cause dtbs_check
errors:
arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: /: memory@80000000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'

Get rid of the clocks to avoid the errors.

Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
Fixes: 5b28df37d311 ("riscv: dts: microchip: update peripherals in icicle kit device tree")
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 3392153dd0f1..c71d6aa6137a 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -32,14 +32,12 @@ cpus {
 	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x2e000000>;
-		clocks = <&clkcfg CLK_DDRC>;
 		status = "okay";
 	};
 
 	ddrc_cache_hi: memory@1000000000 {
 		device_type = "memory";
 		reg = <0x10 0x0 0x0 0x40000000>;
-		clocks = <&clkcfg CLK_DDRC>;
 		status = "okay";
 	};
 };
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
