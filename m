Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CF7ECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 12:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hQWqi1e7lcNDs3T/BLkzTdB6uRkygXFcXu+Hx1XjA7k=; b=OkCEvcnWcbCf5I
	EvvDBix6RuNKmiqCbgMeJCHsW74+2OeU9yTXV/5qxG63Q/Sqo8nr1AMRfB0OBWHXuCZfFmXaAMkWL
	DwzHuqV8k0u3kYg5nZQshITrEAFNLzhmOqgolvxSsse2aOh649ibPNP6nuRyWmEhgsEffW24ZhXdH
	S5i0v2ii/lNAyQ24yj9s+GrtXbfhLzs9acKE0OZvO740cxRIPlw+6Ximu2ACMIULAKRY6ClrYLBrN
	2976FZkhuSvrS5FaLOq0NZNbt5dHVxBNxlt4xhlyWOtB9mtG8rKKV7hELcq44LBhE/gIMuMbg5W9Y
	fOQcaLbiV7I7yteAdrcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXV4-00DEEQ-LR; Tue, 06 Sep 2022 12:16:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXUy-00DE8a-IU
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 12:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662466572; x=1694002572;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9o+uaFTKPFTMVpXL13wKHYNkptAH38MQewyTU/ti7Mk=;
  b=SGw+CXFd7qbztUjcddwwZdGPVYz9vje0PK/hJYyH5XavzD3LkihkFofY
   GFu0z6zXdsZ2W7pTGNbSm5lFC1pcBhc3UJF16MG6HF0RgpAsLO+q6oTLR
   15eVXM4Gtr+Y4OHBgnbMHB8NrvDK7xt2shnFFdgyLT6hqdczsw/l/2BHr
   unYVpGbQF87IkWL2BtKTHMLcUEZC8wU/MgAuTHdHFY3zVuI4EIWeAiE/y
   bexVL4sBsivj1YkscBcKnEKFQFTMgNWbeQZCgxrwFZVONlFWIGATgoA0f
   SvZ6Ii9XEJbYBXyH3B0NCvcOnpGvNXiURWE0Oglu7nSCHgU++xrY9FJUX
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="179327795"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 05:16:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 05:16:03 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 6 Sep 2022 05:16:01 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/3] Add a devicetree for the Aldec PolarFire SoC TySoM
Date: Tue, 6 Sep 2022 13:15:23 +0100
Message-ID: <20220906121525.3212705-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_051612_676210_7274D9E7 
X-CRM114-Status: UNSURE (   8.82  )
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

Hey All,

On top of my other series adding the m100pfsevp and sevkit [0], here's
yet another development kit.. This time from Aldec.

The board has 32 GB of DDR but the DT I have access to only has a small
bit of that mapped.. until I know exactly what the mapping is, I will
not be applying this.

Thanks,
Conor.

0 - https://lore.kernel.org/all/20220901133403.3392291-1-conor.dooley@microchip.com/

Conor Dooley (3):
  dt-bindings: vendor-prefixes: Add entry for Aldec
  dt-bindings: riscv: microchip: document the Aldec TySoM
  riscv: dts: microchip: add a devicetree for the Aldec TySoM

 .../devicetree/bindings/riscv/microchip.yaml  |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/riscv/boot/dts/microchip/Makefile        |   1 +
 .../dts/microchip/mpfs-tysom-m-fabric.dtsi    |  47 +++++
 .../riscv/boot/dts/microchip/mpfs-tysom-m.dts | 168 ++++++++++++++++++
 5 files changed, 219 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
