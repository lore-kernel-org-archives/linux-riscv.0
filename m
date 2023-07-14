Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49F1EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CU8xKeW2ApHm5h8JAjJOKbLqDG6/koSO8UU9YtMPC44=; b=Ohdxm76FgD7n9/
	6WpEF4m6Hy1A5Q88yXvMaypANF84wZV79wU2PK1UiHjb/kdIHzp4i0UPDeamsYH+1DrgJZMkbPK6E
	p6R0TifimBKrosRYG9AAhbjFJILQf/vMD5/6rsAEwD68ufuJG2BVK4R6FTUo9ufWEQfKDoGKkwIuX
	mI8inklwvRJCVN7v4i1my0xBTclIx+eLHR+BWTnq7KHG+iIlLj7waiML3sMOSQSlRmnMBf01Zbcyw
	x2Sd4WHXy7G+qqDfhbu/exvi5zeP964mOEpMAUp+NbUluvPFQECZJoSq7enEVdKWWRpUBv347K3ej
	xiEI9fjiNb5eEOPkxncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKGJb-005tJL-0Y;
	Fri, 14 Jul 2023 10:46:23 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKGJY-005snM-0b
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 10:46:21 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 14CEA24E21B;
	Fri, 14 Jul 2023 18:45:23 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 14 Jul
 2023 18:45:23 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX062.cuchost.com (172.16.6.62) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 14 Jul 2023 18:45:21 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu
	<joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v1 0/2] Add ethernet nodes for StarFive JH7110 SoC
Date: Fri, 14 Jul 2023 18:45:19 +0800
Message-ID: <20230714104521.18751-1-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_034620_395006_E14E77CE 
X-CRM114-Status: UNSURE (   8.53  )
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

This series adds ethernet nodes for StarFive JH7110 RISC-V SoC,
and has been tested on StarFive VisionFive-2 v1.2A and v1.3B SBC boards.

The first patch adds ethernet nodes for jh7110 SoC, the second patch
adds ethernet nodes for visionfive 2 SBCs.

This series relies on xingyu's syscon patch[1].
For more information and support, you can visit RVspace wiki[2].

[1]: https://patchwork.kernel.org/project/linux-riscv/patch/20230704020239.288500-7-xingyu.wu@starfivetech.com
[2]: https://wiki.rvspace.org


Samin Guo (2):
  riscv: dts: starfive: jh7110: Add ethernet device nodes
  riscv: dts: starfive: visionfive 2: Add configuration of gmac and phy

 .../jh7110-starfive-visionfive-2-v1.2a.dts    | 13 ++++
 .../jh7110-starfive-visionfive-2-v1.3b.dts    | 31 +++++++++
 .../jh7110-starfive-visionfive-2.dtsi         | 34 +++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 69 +++++++++++++++++++
 4 files changed, 147 insertions(+)


base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
prerequisite-patch-id: 06c3560d00fe0f65a09c09002b46cd7c1c59facc
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
