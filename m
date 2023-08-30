Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44163C83F16
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 03:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wl9Z8dWhZEiTziC8DDa8LTp4D6fvPrWbsX82vIsZA98=; b=nLWmnt9cETg3Xr
	/ip47bkieQOUBn8XC4v1DMkPOCUD8NVY9B0YH+/EETXpPFP/EXUf/SGtNBFPPeAWDv6GRqeE1VZy3
	lm5oz3irJIDdcu/RO8UgwcfUX/5sdEaKhl2CrHe26IUbEZW2fqgG1tlPo+AzgSBlcZYNZmbsDsX4J
	p++M2pGNnXkonKnWGxrbN9oOxuwqWawJpCEFN45EmtdR7FiyCTxFM7m6vO2Hwu+L22A0wNK5IcYx8
	FlhD2iDkOOBuvOFHnkA/mvzJ8vkANgzO5IYhq5os0yeZiHj3ksyykO5x4sO6FgeuafNBV7Kg8jdzg
	x6wY4MuH+519N8pymPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbBjm-00CkAn-1n;
	Wed, 30 Aug 2023 03:19:22 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbBji-00Ck9d-04
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 03:19:20 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C644B7FD3;
	Wed, 30 Aug 2023 11:18:47 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 30 Aug
 2023 11:18:47 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 30 Aug 2023 11:18:46 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-mmc@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, William Qiu
	<william.qiu@starfivetech.com>
Subject: [PATCH v1 0/3] Change tuning implementation
Date: Wed, 30 Aug 2023 11:18:43 +0800
Message-ID: <20230830031846.127957-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_201918_205098_9DD651FF 
X-CRM114-Status: UNSURE (   8.11  )
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

Hi,

This series of patches changes the tuning implementation, from the
previous way of reading and writing system controller registers to
reading and writing UHS_REG_EXT register, thus optimizing the tuning
of obtaining delay-chain.

The patch series is based on master-next.

William Qiu (3):
  dt-bindings: mmc: Drop unused properties
  mmc: starfive: Change tuning implementation
  riscv: dts: starfive: Drop unused properties and limit frquency

 .../bindings/mmc/starfive,jh7110-mmc.yaml     |  15 --
 .../jh7110-starfive-visionfive-2.dtsi         |   4 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   2 -
 drivers/mmc/host/dw_mmc-starfive.c            | 131 +++++-------------
 4 files changed, 41 insertions(+), 111 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
