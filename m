Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346CBC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DrmI2xnmuSx4k3aWwkBdQG6bwzb3SI8xfmsqszWqt1Q=; b=x9pD0W6CxNrLWE
	tliK4dD8nv1yt+DA3YfOwkIfUQTYfhFkr5SiY52lr+xknBt/BzAT1fyuJ1lvvO8MFKCkhDFVgFkl4
	N7BDZS3oNA/foDyzcWVNgT0ByIgqr1NlrXZyrWRC+d0hfo0LqOjTXz1Kq/o2W2UiwOhNJeklna9lj
	ZURqsqC7S8qKEwaqFSsm+KWoZAumG8vYDWval9kXgRYhp0e6Axyoy5YnwOnRcsOlcZo/JQpl78nu7
	bLWqny7ZPnP3XqcAHG4IzYkKWPVuXuBlfGxtNKAdHE3z0zruyYfBBK1sy0bW3nSg0S1E5R9RJ95qz
	iUBJ0YeuAj31pj7tX+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaQy-00BKDb-WE; Wed, 11 Jan 2023 12:42:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaQv-00BKA8-Hz
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673440941; x=1704976941;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pq+rQQcA4VRLiAd2uAByro3JX2cinbE3qzl2fsix2yU=;
  b=cYRN/uE3b/ya07iVo62x3XRIVe/BMs5QsQOgyAKC4f5iJZxMCvp4nqfF
   wbFNM+Tn5p2+Jkg3wIzyWu79uzNtQ69LWz9UCOkr0sTbFMxFKKRlbOthE
   UMBDBTrZg6NTtt8etVPVNQ/Z/tuCp3fX0Md3TDDyvVPtvwLawKuHR5ZN1
   vrERt5zLKYzxbWutslPIRS8Am4iDriRa5OcBTnWOwX8OGEDUHDEfNw7C8
   lU47wT9f81ugQtPIbhAdXR9SZUrI9sBD9wdqWTCtZcm2ez+i4ENL3YJ+F
   fpB3ooeyJDg6l3ykJ4WYWMCE0LiaXBuEP5do2NOheDCrSiVArWMHmxr67
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="195258637"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 05:42:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 05:42:08 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 05:42:07 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 0/3] Add a devicetree for the Aldec PolarFire SoC TySoM
Date: Wed, 11 Jan 2023 12:41:04 +0000
Message-ID: <20230111124106.2417152-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_044221_693063_442F6100 
X-CRM114-Status: GOOD (  11.81  )
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

Hey All,

The board has 32 GB of DDR but the DT I have access to only has a small
bit of that mapped. I tried accessing more DDR, but it was not possible
with the FPGA design as things stand. I'd rather have the devicetree
match what the vendor is shipping, so left the design/DDR as-was.

Other than fixing some minor bits from Krzysztof, the other change is
that I dropped the PCI node as that doesn't appear to be mapped.

Thanks,
Conor.

v1: https://lore.kernel.org/linux-riscv/20220906121525.3212705-1-conor.dooley@microchip.com/

Conor Dooley (3):
  dt-bindings: vendor-prefixes: Add entry for Aldec
  dt-bindings: riscv: microchip: document the Aldec TySoM
  riscv: dts: microchip: add the Aldec TySoM's devicetree

 .../devicetree/bindings/riscv/microchip.yaml  |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/riscv/boot/dts/microchip/Makefile        |   1 +
 .../dts/microchip/mpfs-tysom-m-fabric.dtsi    |  47 +++++
 .../riscv/boot/dts/microchip/mpfs-tysom-m.dts | 165 ++++++++++++++++++
 5 files changed, 216 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts

-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
