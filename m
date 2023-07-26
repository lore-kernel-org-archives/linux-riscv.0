Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5443AC001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OWAxF9nPrOrzj6p4NdBGaZsTxrPuPWYfm3gOv4woY7M=; b=bUv8//HgLRjSU/
	JJnO8lE3xnfdrpbyBLacIMEvUA/o7WBGSVw2L4G6gCUg4VJAPL5LRs0NzuDIYFL/gtYvJEvwX8EiY
	+RsRtMvFQWmodkWsLA5TrV7P6qkc8z+hLNME9JKpENpp3SwuOFWcKLxiADSHtDbA/sU7Dhn+3uLhM
	/ohNRXuAdtyR+L6/WAGDkLJGZgsTgDI6FO8A69AluGtuk7mmmr/doXVawK+rN/UA/zKIuwOWnF0ir
	k6XTw9tjB6dARYQds3UzhIe5E3hqMf/N3faskJiS3qMHbadBzaDY25iexdWZj9qFpq7rDRs8MC5io
	9sIdjSzNN8+6yA1E/QEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qObQQ-009rRQ-2l;
	Wed, 26 Jul 2023 10:07:22 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qObQO-009rMl-0t
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 10:07:21 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4A41D24E2DD;
	Wed, 26 Jul 2023 18:06:13 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Jul
 2023 18:06:13 +0800
Received: from ubuntu.localdomain (183.27.99.135) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Jul
 2023 18:06:12 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [dt-for-next v1 0/2] Add USB PHY and USB dts node for JH7110
Date: Wed, 26 Jul 2023 03:06:07 -0700
Message-ID: <20230726100609.72550-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [183.27.99.135]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_030720_475127_74CB8777 
X-CRM114-Status: UNSURE (   6.94  )
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

Add USB and USB/PCIe PHY dts node for StarFive JH7110. The PHY
driver is in linux-phy-next tree.

Minda Chen (2):
  riscv: dts: starfive: Add USB and PCIe PHY nodes for JH7110
  riscv: dts: starfive: Add USB dts node for JH7110

 .../jh7110-starfive-visionfive-2.dtsi         |  5 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 53 +++++++++++++++++++
 2 files changed, 58 insertions(+)


base-commit: f2b539af5718bb63eb9fd913d9d4474bd1e55d07
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
