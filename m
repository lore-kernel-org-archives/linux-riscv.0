Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450E0C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 06:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j/JZMWWCgF82WzXDIVxqWJX0M8KGHQmL/qQmk9jN9aY=; b=voumrp21epF4s6
	eA4FYjwHjWltVJNWFIU5YG4bWOIQwiHpSrEz5vmH+JnqJCuSxsYfYbFRvGUv/eVPiFM9ZwKVVVZzb
	BrO2+5RIwitmOCJrL6oCuKNJD70B/t3KYQT99eErJyvVU6qwXIQInNBqmqobDvStG09nFm2qxmS9A
	TZmsCK3odM5CC20onwFYjLSgB5AyHJZ4SJbP5wuSa4I78pKJ1ZZDiKMjjRnaRJ9Cj6v+ZSQEhNqaj
	U/G3QjNQ5AuqTKZ3tLUNvpFAgFNY9llZ4HfDP+ZCseqsmv1gOO0cXVB60BCIkHE9V8hn4sklqC66D
	saw2coTbKBHzXoOA6aZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNpQy-0031lI-1i;
	Mon, 24 Jul 2023 06:52:44 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNpQu-0031gW-1P
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 06:52:43 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id CF6CF81DC;
	Mon, 24 Jul 2023 14:52:00 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Jul
 2023 14:52:00 +0800
Received: from SD-Server.starfivetech.com (183.27.99.135) by
 EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 24 Jul 2023 14:51:59 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Hal Feng <hal.feng@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Walker Chen <walker.chen@starfivetech.com>
Subject: [PATCH v1 0/2] Add dma and tdm nodes for StarFive JH7110 SOC
Date: Mon, 24 Jul 2023 14:51:56 +0800
Message-ID: <20230724065158.925-1-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [183.27.99.135]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_235240_672415_DDC0A0EF 
X-CRM114-Status: UNSURE (   7.35  )
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

Hi Conor,

These patches add dma and tdm nodes for the StarFive JH7110 SoC, they
are based on linux-next. I have tested them on the VisionFive2 board.
Thanks.

Best regards,
Walker

Walker Chen (2):
  riscv: dts: starfive: jh7110: add dma controller node
  riscv: dts: starfive: jh7110: add the node and pins configuration for
    tdm

 .../jh7110-starfive-visionfive-2.dtsi         | 40 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 39 ++++++++++++++++++
 2 files changed, 79 insertions(+)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
