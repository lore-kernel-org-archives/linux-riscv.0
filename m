Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8F2CA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLWuC4Zivu69P2S4c9zPzv8lK5M3+3ju8NV9uPk3L0U=; b=tUBOFFesxa4JY7
	tLPG8e4BTzSjqBHKiZmG5e67XMQsMxfcdMk30pDiYWlW0I+trG7O/L/cW3NFO9mH/L3KpL+1+UqNy
	MUnXXoY/Ez3ywbHwCs+BnmLsAuRSrN1NC1CjSP30hd7jZTPfSR8W++BjVtFdrR6DeM5zQUtwtxkIN
	yrZ3Zb8XnCqblF4zmQ7pK8QRPPKpsPpnFjjn3DXzyOmpavBodqds/65d11hUmU4oPZtSYfeicd1bb
	Zz7XOgpkYeD3NuTGbNmAb3dcKRYcZfupS1HWuQhTDDYDBIfLtY3RZ+z75+ayjCWoY2xS29Ko6Rxz4
	TZnPpQoBtoOb8NcdD04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyXl-002XWT-0t;
	Tue, 12 Sep 2023 08:14:45 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyXb-002XOe-2g
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 08:14:40 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 01B8080BE;
	Tue, 12 Sep 2023 16:14:06 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Sep
 2023 16:14:06 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 12 Sep 2023 16:14:04 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-mmc@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, William Qiu
	<william.qiu@starfivetech.com>
Subject: [PATCH v2 0/3] Change tuning implementation
Date: Tue, 12 Sep 2023 16:13:59 +0800
Message-ID: <20230912081402.51477-4-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912081402.51477-1-william.qiu@starfivetech.com>
References: <20230912081402.51477-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_011436_047895_C7916669 
X-CRM114-Status: GOOD (  10.32  )
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

Hi,

This series of patches changes the tuning implementation, from the
previous way of reading and writing system controller registers to
reading and writing UHS_REG_EXT register, thus optimizing the tuning
of obtaining delay-chain.

Changes v1->v2:
- Rebased to v6.6rc1.
- Keeped "starfive,sysreg" in dt-bindings but removed from required.
- Changed the function interface name.
- Maked the code implementation more concise.

The patch series is based on v6.6rc1.

William Qiu (3):
  dt-bindings: mmc: Remove properties from required
  mmc: starfive: Change tuning implementation
  riscv: dts: starfive: Drop unused properties and limit frquency

 .../bindings/mmc/starfive,jh7110-mmc.yaml     |   2 -
 .../jh7110-starfive-visionfive-2.dtsi         |   4 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   2 -
 drivers/mmc/host/dw_mmc-starfive.c            | 137 +++++-------------
 4 files changed, 44 insertions(+), 101 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
