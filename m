Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA69C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 06:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rKCVDxWNkaPEu06bi0iYLVXj8nry8CosuOqsepv+5KY=; b=Dm8NtrP8v85czn
	BGWM3oBMuNz7e7NNQUZ0nbgdzhhJ7TIjTLQV3vtYHAelUwcbZONs6ViZbOdQ4d15DtlYD8aa8U/gt
	RWVYHS24slQd8Yx3kiZZadKftcHKB+DNLn/r8LGvvCmtMcgrpg9FuOf7ENJMaU8yeZmnjCcel7ENv
	LbmEGGDR8ntBBWqmRop0T8UHvW35cbBIh4XdmXp3zO0fABVvCr0/f6knYX94O4x/HsPdmERZb3h8F
	3g5MGzVofbrKqSArezCdozkf5YAI5U8jS8YXjQqx5tX4jmopSXPgM2oq6RuZeJlOvh7LXEXEAhL+4
	i4fe7pGnqL5Ix6nau5Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTBO-005GSm-MR; Tue, 07 Jun 2022 06:59:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyT94-005FHj-Ia
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 06:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654585014; x=1686121014;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rfXrKiFGD0AlQe3r4r6Rd9SATgPVEgPxA7mb2k6vpY8=;
  b=CeOeBZhynbgKU0B7f39owdeSte+HbDWdQQkI64h4VbjddWjTDewhgAxN
   TdnycLwgI9OiKg+8xKAf1Q+cPXILTXGTfeX+il/TlauVa9ilEPcoHmLTY
   /bKDApWfXKUX+KDwCF5GEZrKvZElQdLHpscY9MqJ8PRGYILER4nPgDGSc
   zzZx8PO9A+ZESmRuh+939yHG78vJAXC/HZaX2tE3AeVd/swn9V/1sZXcD
   aUPI5Co3IzkwMW2+dNN2AH6/+L/7AwmkY/OZGYZcWCDgby6tjaTQ7sDFQ
   uoR0wOAIt1GquqUEBivMGX3IHD1oKaIHFCUb/31VAqeY5jVLYr6apGIQO
   A==;
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="167365805"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2022 23:56:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Jun 2022 23:56:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 6 Jun 2022 23:56:50 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde
	<mkl@pengutronix.de>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-can@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH net-next 0/2] Document PolarFire SoC can controller
Date: Tue, 7 Jun 2022 07:54:58 +0100
Message-ID: <20220607065459.2035746-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_235654_677292_1941A6AB 
X-CRM114-Status: UNSURE (   5.42  )
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

Hey,
When adding the dts for PolarFire SoC, the can controllers were omitted,
so here they are...

Thanks,
Conor.

Conor Dooley (2):
  dt-bindings: can: mpfs: document the mpfs can controller
  riscv: dts: microchip: add mpfs's can controllers

 .../bindings/net/can/microchip,mpfs-can.yaml  | 45 +++++++++++++++++++
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 18 ++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
