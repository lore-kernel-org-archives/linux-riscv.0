Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD310C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xb7Iuxruy3kFd0mUK/LUXLp2eNJsKhiGCF1KV9eRfEM=; b=WC8H61R78UZ933
	HtD26s2JJXuUZxrQC+/8AFQmgMZHpl2ut1sQuv4BeALxt+0KM0NTGZoypEjh3aRYfWtm4fwUSOotS
	HkwxmUVB+LoOd34PK4rkWPFIyzJ1qvM0P7P39P1OW/ROrXA55aQMnG0RltcR0drHNeuYj0APtG7Jv
	O2IRsH7vY1zbv+Aoa7Z2CMY+KUjHl7ZbaS7A1OUwfbAc9KWn9mSyf9B1Wr5ECthaOqv/EuVLh3/MB
	xzVu5WtZeMMsguqZtexTtOES1cYUZlQmUHwLJ0ELvLkW2Q3gbdy6B1fl7cvuyfOJwrLm0qHNUKSry
	3X0JbJAg54MDGk6DVtEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwP6D-003gOt-0C;
	Tue, 09 May 2023 15:17:57 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwP68-003gLX-39
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 15:17:56 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 80C8C24E083;
	Tue,  9 May 2023 23:17:24 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 9 May
 2023 23:17:24 +0800
Received: from localhost.localdomain (183.27.98.219) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 9 May
 2023 23:17:23 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] Add watchdog nodes in StarFive JH7100/JH7110 DTS
Date: Tue, 9 May 2023 23:17:21 +0800
Message-ID: <20230509151723.84989-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_081753_212264_7303F20A 
X-CRM114-Status: UNSURE (   8.04  )
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

Hi, this patch serises add watchdog nodes in DTS for the StarFive JH7100
and JH7110 SoCs. Patch 1 adds the node in JH7100 dts and Patch 2 adds it
in JH7110 dts. This patch serises are based on Linux 6.4-rc1.

Xingyu Wu (2):
  riscv: dts: starfive: jh7100: Add watchdog node
  riscv: dts: starfive: jh7110: Add watchdog node

 arch/riscv/boot/dts/starfive/jh7100.dtsi | 10 ++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 10 ++++++++++
 2 files changed, 20 insertions(+)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
