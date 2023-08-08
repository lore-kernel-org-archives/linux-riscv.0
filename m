Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93378C001B0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yaEsr3+K1b3l37+HmtFGR4lJj1yH3/6pSgrWy18MfKM=; b=tuQgNKuKntYl/6
	DmZJqqJQV9XrlujTJd0sEqGPtynEIQnhgi6okGZrDC0lNM6tm9MjOLkJOrGoggl91L4W7KJwVYi4e
	1v39rLLY+G7oHfAICNQVAab073T09UzEi0hw4oFQiiN2uJVfHxFNHGwfDnE6ExeKS+b81E7c7QcNj
	qhROYuiEo1TKsO24uqMquKlkx7G4wyhPnjy6eEPpy2EVkwAdk1mBliSrlhg0aNQ/agkGMAC48smxP
	oqSFTXljVOr0GKSiBwfFbBYmq+sEv7up/NMwxpxL/rQ/9AbFAEhoYjIDVl5tvQbnGlrjrgZ9Rixdb
	Mt9JG9I4hdDYUjvUfAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNWB-002jDg-1J;
	Tue, 08 Aug 2023 14:17:03 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNW8-002jBa-0R
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 14:17:02 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BAE8B24E22C;
	Tue,  8 Aug 2023 22:16:17 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 8 Aug
 2023 22:16:17 +0800
Received: from ubuntu.localdomain (161.142.156.69) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 8 Aug
 2023 22:16:09 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] riscv: dts: starfive - Add crypto and trng node
Date: Tue, 8 Aug 2023 22:15:56 +0800
Message-ID: <20230808141558.296631-1-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [161.142.156.69]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_071700_434745_FC9A217A 
X-CRM114-Status: UNSURE (   7.65  )
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

The following patches add hardware cryptographic and trng module nodes
to JH7110 dts. Patches have been tested on VisionFive2 board.

v2 - Fixed dtbs_check errors on dma node in patch 1. (Conor)

Jia Jie Ho (2):
  riscv: dts: starfive - Add crypto and DMA node for JH7110
  riscv: dts: starfive - Add hwrng node for JH7110 SoC

 arch/riscv/boot/dts/starfive/jh7110.dtsi | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
