Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79262EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 04:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xYQa9torfINQ6jAzVFkpqPn2xLz3zCpaaF6+N+Ky+aw=; b=CW/kJO0/STaybg
	oGaaKn+MnKefm1GyXaJMLudEV0FZ9ufl8s7mrtHFRPRXRep3R2hUphyFHrcqEcWVIAIBKm8qriYLl
	y+KGL4xtT6gSMT7jyyQZbmNYdKi2sre6UAtuBnNn5UBWO0hl5lmLU6eSmqCHKJJ9BbvyvvImaqj6A
	gGmGURbl0P7Ie8HtOiEepwvQGchZhie2vctDXJTYA7tkY0oJf/UdUpzy2zutH5QE1ytKUtNwdLfy9
	BbnMWo1kQj1n9DJXBVsUkcnWuZn6VS6WQRvSDp+tA+IT9M6WV2N95K7i/5lPqKVeee+fFKV5xQeA7
	/5DJiZdOi+vcbfvmS3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzEk-0055cE-0B;
	Wed, 19 Jul 2023 04:56:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzEj-0055bl-0e
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 04:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LrNbOXb5bKwFwk26Q82p3itoimpfbsXcjLkZfCcHLwE=; b=CCPnAhlaxFBBgMUo75wjOElrrk
	fXwGTAhSRn9xyqYlbeumK8bZxwGnis2xgxddYBN9KsOguHaAjjbwa2YnvXEFSSIZSFy6AefGyy2s7
	fYBqiWTDorRWvEdB2rmOINRuJeQQ09KXG+0NGXyGtoyrrhvib05sHJjQfQvL3PvzySi0yUuxq5dYQ
	aylH3OOdJqak2XvQ8ceg6YT5naIskvFyjXBQ35T1HOs08XdzFiIwDcIQJehuLOQEOnAYTg7ZN8vv2
	e27ygkk1dg5cfaE84Bnkikp/3E0OMdFP8FihVOFttklHyh4q3S2ex0YMzYbP8/8RKOXyqEtokfc7O
	NegM8aWg==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLbk6-009zZd-22
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 03:51:31 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B2DBC80A4;
	Tue, 18 Jul 2023 11:49:38 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 11:49:38 +0800
Received: from ubuntu.localdomain (113.72.147.86) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 11:49:37 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/3] riscv: dts: starfive: jh71x0: Add temperature sensor nodes and thermal-zones
Date: Tue, 18 Jul 2023 11:49:34 +0800
Message-ID: <20230718034937.92999-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_045129_422349_438AAEC0 
X-CRM114-Status: UNSURE (   7.17  )
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

Hi, Conor,

These patches add temperature sensor nodes and thermal-zones for the
StarFive JH71X0 SoC. I have tested them on the BeagleV Starlight board
and StarFive VisionFive 1 / 2 board. Thanks.

Best regards,
Hal

Hal Feng (3):
  riscv: dts: starfive: jh7100: Add temperature sensor node and
    thermal-zones
  riscv: dts: starfive: jh7110: Add temperature sensor node and
    thermal-zones
  MAINTAINERS: Add Hal as a maintainer of SFCTEMP HWMON DRIVER

 MAINTAINERS                              |  1 +
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 37 +++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 53 ++++++++++++++++++++++++
 3 files changed, 91 insertions(+)


base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
