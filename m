Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6DDC001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 01:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aigg2nPW4sD3Yh494E4CMyxEzjWkzbBbI/Idky0CzqY=; b=wzsa+8ez0mvMs1
	0vZuLE+oLtrS0rTrIYdYYXFwyR1Vuu+yiqVGhtAVGNVEX3rqPijxm3c93BdkISbqMnWpd373IdkIF
	1aKloCsTFwyY2pLIh2EhI/ol0Rg4PP7sQIeXZDkGCgS8InqUfTuZJu58MGylyMXFOCWkbM+w9pKgm
	GkVpb4k+jKFEWm6r7ud8iY5IwSLN2wNPgRmEh7WvRZrT/THIIOr7hFkZh0drVH0qv3SDMwGvozMfv
	zKsswOviGGfpmaja/CipVvsFTAMiQjPTF4KI7j1D3qiMOdRE6jdu+RlaOwR+3BP8U1W1b++Xu7kq4
	+ph6fS1JCi3yE0w6mzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYB5-003orN-2F;
	Wed, 09 Aug 2023 01:39:59 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYB2-003ooS-2z
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 01:39:59 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id F3DC4806C;
	Wed,  9 Aug 2023 09:39:18 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 9 Aug
 2023 09:39:19 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 9 Aug 2023 09:39:17 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v1 0/2] StarFive's MMC nodes support
Date: Wed, 9 Aug 2023 09:39:15 +0800
Message-ID: <20230809013917.81674-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_183957_180528_90C8833B 
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

Hi,

This patchset adds dts nodes for the StarFive designware mobile storage
host controller driver. In device tree, we set mmc0 to eMMC, and set
mmc1 to sd card.

William Qiu (2):
  riscv: dts: starfive: enable DCDC1&ALDO4 node in axp15060
  riscv: dts: starfive: Add mmc nodes on VisionFive 2 board

 .../jh7110-starfive-visionfive-2.dtsi         | 112 ++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  32 +++++
 2 files changed, 144 insertions(+)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
