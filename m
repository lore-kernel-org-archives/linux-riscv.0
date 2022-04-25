Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248F0C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hU+r5v0Ia/J0zrXbeUZ8h0Vhn4b+y90i+EIlHN29Vj4=; b=DrMHpHukQ2Ogsj
	/fArzP6LZUkem2QcFVfLPNBYQPetm087YFp/3duwsONmX5m1MsnVFX3BEcS8SJXcig6OKd70OYBIc
	fudQE0eAuJR89zv8hjSMY5Naze/8DeWWVnw2ZUSXlHbG0hox0bUPNNfvhFoYUWaaXl+4ID6kiv2ec
	GKdg3C/yiBEdSf6z8Ymbu6PCUsZ9MiUn+HiB/6bxOL1SYxjbbyI3WP9ocg34ld/mXe1eZrLJy52Ol
	4Hi1nQns7sqppZSKafrA52emQQ/Jpx4msGYA7whcCc4XIIT5huw/vWDJa+g4MY4wDh+rvnvDyIeAW
	/ErmAVrv6jqskYGZx97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niwGZ-009B7R-Lq; Mon, 25 Apr 2022 10:48:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niwGW-009B6a-T4
 for linux-riscv@lists.infradead.org; Mon, 25 Apr 2022 10:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650883704; x=1682419704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hcxn67SV1WL8W3y44Hc/jdaaeJYqYeWsGFj0inQot5Y=;
 b=HBw+7gcp9aFBNk4DHNexj/8XxakwDQnT65/K7rsa2SAwKNZWESKcOE2A
 furQkYeLteLI8AL/zMVpSVXrMhddPpGJW5kJLtITjB10OJaQX6vK9P/cB
 fq4cztC0chxs/xWNxB40uUPrhrXquHsRsd5OLQkmAXxvK61ocKxtFyxbD
 iB7vhyrBbY8shlW8yZgrrvOa7MCXsUZdJrBlA1/3lf/k9mx46MVl4fphz
 oEbTHi+Yid8zPaS26/31dcnNHHjR6In214zvF3V4KzqXo1YZjUVvH7fmu
 4VN9vDRlr+fOZWe8MD+/NHa4g+XEKsRVwy/O53v5woSPuSkD/DRuC0WXF w==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643698800"; d="scan'208";a="156654228"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Apr 2022 03:48:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 25 Apr 2022 03:48:23 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 25 Apr 2022 03:48:21 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2] riscv: dts: microchip: move sysctrlr out of soc bus
Date: Mon, 25 Apr 2022 11:45:23 +0100
Message-ID: <20220425104521.132538-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220425104521.132538-1-conor.dooley@microchip.com>
References: <20220425104521.132538-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_034825_123607_8600BB3C 
X-CRM114-Status: UNSURE (   8.89  )
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

The MPFS system controller has no registers of its own, so move it out
of the soc node to avoid dtbs_check warnings:
arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': ['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']} should not be valid under {'type': 'object'}

Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
Suggested-by: Rob Herring <robh@kernel.org>
Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Rob: I assume the Suggested-by tag is appropriate here since you told me
to do it this way?

 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index c5c9d1360de0..bb420ed6965e 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -146,6 +146,11 @@ refclk: msspllclk {
 		#clock-cells = <0>;
 	};
 
+	syscontroller: syscontroller {
+		compatible = "microchip,mpfs-sys-controller";
+		mboxes = <&mbox 0>;
+	};
+
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -446,10 +451,5 @@ mbox: mailbox@37020000 {
 			#mbox-cells = <1>;
 			status = "disabled";
 		};
-
-		syscontroller: syscontroller {
-			compatible = "microchip,mpfs-sys-controller";
-			mboxes = <&mbox 0>;
-		};
 	};
 };
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
