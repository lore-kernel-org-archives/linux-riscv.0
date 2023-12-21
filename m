Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1835AC35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 08:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5f5tc7RqQ8jT8Zw/1J+blpFq/cEVV83v1KK/LBmKWZk=; b=FdywsXISbFEiRy
	4z9cQbTujrJxBOiuGTPgA3AuLBHas0hYNWT/cOH1j1hiEjbAebAWGWH3i+8k9sAiK05nTaoa463Mi
	KtJ+LI6cLPxnYaAhKd2qHKsIm1HEGv+vEQGOroyTU6D0uvXv46ljQRMWLC9OPo/7hTq8sg7yV1ESv
	NRDKh8dbeTUXZe75IdEzLofhMur6CsveItnLm7koodDg5MUp2Nh7+2R4Cg0UHLRYok/HkGlBpoR0N
	IPwloJyrKR3b+9utijjLBJ4aWHoGBuQk46rNXNSAdUcKfrEzsBSQgf+eaPaiKv2itgM/ManA6Cydl
	J0fPUBVNcGOy8/j6AaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEg0-0024IK-2j;
	Thu, 21 Dec 2023 08:45:08 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEfx-00248V-1D
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 08:45:07 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 04923807B;
	Thu, 21 Dec 2023 16:44:24 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 16:44:23 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 16:44:17 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Samin Guo
	<samin.guo@starfivetech.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v5 0/2] Add StarFive JH8100 watchdog
Date: Thu, 21 Dec 2023 16:43:56 +0800
Message-ID: <20231221084358.3458713-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_004505_731469_6B0B6861 
X-CRM114-Status: UNSURE (   8.80  )
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

Changes since v4:
- Patch(1/2) expresses JH8100 compatibility to JH7110 in dt-binding,
  and adds minItems to constrain reset property.
- Patch(2/2) adds watchdog node in jh8100.dtsi. This patch depends on
  patch series [1] and [2].
[1]: Initial device tree support for StarFive JH8100 SoC
https://lore.kernel.org/all/20231201121410.95298-7-jeeheng.sia@starfivetech.com/
[2]: Basic clock and reset support for StarFive JH8100 RISC-V SoC
https://lore.kernel.org/all/20231206115000.295825-17-jeeheng.sia@starfivetech.com/

Changes since v3:
- Drop items in compatible field.
- Replace items with maxItems in reset field.
- Replace maxItems with items: -description in if else reset field

Changes since v2:
- Express JH8100 compatibility to JH7110 in dt-bindings.
- Rework min/maxItems constraint for JH8100 resets property.

Changes since v1:
- Drop "starfive,jh8100-wdt" compatible field in starfive-wdt.c,
  and express them in dt-bindings.
- Use minItems in resets field to cater for single reset signal
  in JH8100.
- Reword Watchdog reset to Core reset for JH8100.

StarFive's JH8100 watchdog reuses JH7100 register mapping.
DT-binding of JH7100 watchdog is extended to support JH8100.
Since JH8100 only uses 1 reset signal, update the binding to
support one reset for "starfive,jh8100-wdt" compatible.

Ji Sheng Teoh (2):
  dt-bindings: watchdog: starfive,jh7100-wdt: Add compatible for JH8100
  riscv: dts: starfive: jh8100: Add watchdog node

 .../watchdog/starfive,jh7100-wdt.yaml         | 40 ++++++++++++++-----
 arch/riscv/boot/dts/starfive/jh8100.dtsi      |  9 +++++
 2 files changed, 40 insertions(+), 9 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
