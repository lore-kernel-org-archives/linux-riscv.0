Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23688E7D0B9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 06:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DbVIH4buJfZLADEPEshCMcWKdDFhLUd6f+JQTGkvTdk=; b=4Im81LxXaA9zm0
	RgfcM9H7PMYiEVexZsxGesJPOh7p+UmhPHbdJ2K8CXSRRWjQgexgQvRTI8Xq8+CNLAhRbpZIY53p8
	WDPbdSbcrD8WEs/uJXesFCIAw3IAZGV1V1JBMpFLMxnFpLXb0CCTCIIiXPIWxNsp9NmGMTCp3Sy5l
	vvKDJWsXWpkR+S4P06isKmvfOoXIDxQ//0DokL2H9Mvrcs061OYHoIQsWGWyYSm6X6U3z3V5eQZal
	oESMFVoYd9k01OH5oFvD1JL2l1aUvNpA5s9LgFaslgC2ROZWlYJeYdNKi+la08H2j0mHhwhYwZOCs
	0PnzVLEa12fRi8uo6A9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZfJ-0082v1-1q;
	Fri, 22 Sep 2023 06:29:25 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZfF-0082ph-2K
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 06:29:23 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6983424E2B1;
	Fri, 22 Sep 2023 14:28:36 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 22 Sep
 2023 14:28:36 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 22 Sep 2023 14:28:35 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-mmc@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, William Qiu
	<william.qiu@starfivetech.com>
Subject: [PATCH v3 0/3] Change tuning implementation
Date: Fri, 22 Sep 2023 14:28:31 +0800
Message-ID: <20230922062834.39212-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_232921_926545_F0C2946C 
X-CRM114-Status: UNSURE (   9.88  )
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

Changes v2->v3:
- Rebased to v6.6rc2.
- Dropped redundant criteria.
- Keeped "starfive,sysreg" in dts file.

Changes v1->v2:
- Rebased to v6.6rc1.
- Keeped "starfive,sysreg" in dt-bindings but removed from required.
- Changed the function interface name.
- Maked the code implementation more concise.

The patch series is based on v6.6rc2.

William Qiu (3):
  dt-bindings: mmc: Remove properties from required
  mmc: starfive: Change tuning implementation
  riscv: dts: starfive: add assigned-clock* to limit frquency

 .../bindings/mmc/starfive,jh7110-mmc.yaml     |   2 -
 .../jh7110-starfive-visionfive-2.dtsi         |   4 +
 drivers/mmc/host/dw_mmc-starfive.c            | 137 +++++-------------
 3 files changed, 44 insertions(+), 99 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
