Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EF8C6FA8B
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 11:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HYPLNvwuhfwnW8APolc6YAMZWXI9E76s7Exog8GoOg=; b=UlQ8h2P0DKJir4
	MOew3EvdDAJm+wxnLDr9j2tyRjtuxlasxA3CKSSBYpAqB5wC5R1lz/cwdcy8cJY5HbmS5nSEf4Lh1
	nLscbS/0DaX+uWrrp5kl7AeT0SqiVv3cfyR3T4RfYKuC4Deex/Ct56baSBqGxNEKiVeWRBhJ7b3UP
	+J7JLE6JfTMdJfRyv+++JnELwYluJFCudVPZRxWoVhqFUpxszIMpAmPYpYsbumniv113x4UiGto6V
	ntT1TCtSHKFP8zkEP04ctWgJVYQY5VKemzJpJZMqTKlDLslWMffbp46AYrH8JCsOdOG8zUoQeO4Zg
	cLFw9Bpe2r+SqM4c6qQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9Vq-00Cg5W-Gu; Fri, 16 Sep 2022 11:28:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9VS-00Cfnp-Ty
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 11:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663327659; x=1694863659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YhYXviQLdmzZaww64eXm52VKSDr5s7UwTuPOh/Kuq5o=;
  b=z3NP4O6y2zro1PO7ZdjfHg7GmpeMy7GBAFtKWbtI4GB/WmKa3Mq1Zukg
   AriqErabdT6JKHkf0h75vTGDHMIwbgsFFuJe1Wt4cc95hOL2BFNUkgPPA
   HCRe9jV2HZ9TtOHsahILx+DhmJiFITY8vQsPxj4zTIMwdD7TAIOsFdwk7
   Z5QIRgBUp8z/EJNlZOQU3CZms8ncbyib/DWAfOs5GXxVN7ayhVtqg1laF
   HYAQNWJkystmEFqzmqwaQeHfYgutDa5oepEYSNQOtGjmqSKUhmPP+f986
   2mfW4Jt8Ppb5yM0itEzMcWuHZb/kcNYwmJGeBwvzvqrAPZGp+CIb1lPx5
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="174187651"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Sep 2022 04:27:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 16 Sep 2022 04:27:36 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 16 Sep 2022 04:27:34 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, Hugh Breslin <hugh.breslin@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 08/10] riscv: dts: microchip: reduce the fic3 clock rate
Date: Fri, 16 Sep 2022 12:26:44 +0100
Message-ID: <20220916112645.567794-9-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220916112645.567794-1-conor.dooley@microchip.com>
References: <20220916112645.567794-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_042739_156929_93716D50 
X-CRM114-Status: UNSURE (   9.24  )
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

For the v2022.09 release of the reference design, the fic3 clock rate
been reduced from 62.5 MHz to 50 MHz as it allows timing to be closed
significantly more quickly by customers who chose to build the
reference design themselves.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 98f04be0dc6b..c2aac1a7e862 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -30,7 +30,7 @@ i2c2: i2c@40000200 {
 	fabric_clk3: fabric-clk3 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <62500000>;
+		clock-frequency = <50000000>;
 	};
 
 	fabric_clk1: fabric-clk1 {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
