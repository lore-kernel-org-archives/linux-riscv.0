Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A28ACF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 08:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:To:From:Subject
	:Cc:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qsv+Wy8EfF+btHs4Jr+NOwoZ0TAmCrtIom9ngHNgvzU=; b=uUn46FTqMmDXcD
	yKd2OJMBHdHJbuw0vUv/0r+Vq1MNfgRv3FX09mKSOVkry+v6UjIxAeOeZJvYq1q45CQR2Ibx0GQ5o
	KmawB8tVMJEmqlSdvEwRMtDjt7jHoaLxpVY1f1OyWUquQOYPodTquIWbpY83aaOhQNkZyHx6CSrtq
	ZcyFcdT5jsASzmjc6XzSZHbgFbwCYy8SrxQyc5jj/Gv/Cs2IgWMZclcUN+3p8lJ8p5I4U1jBlwcyv
	hqF/XJnEo8PG6cgmhhZ1aaVmeTBqB9xbVmqyuPG+CtQh5MZR9HEzMEsz5n3jdojgC8wq8JfJbF4dt
	fMgPiDveOXZIDkhuPQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st0a6-00000001X59-1xba;
	Tue, 24 Sep 2024 08:07:34 +0000
Received: from va-1-13.ptr.blmpb.com ([209.127.230.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st0a2-00000001X1d-3jvE
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 08:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1727165239;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=vGD1AH3YX//UwvtNlpt8F40Wl2KLWAnFu9Se/h7rMAI=;
 b=QcTt7vQml+nJQeObXcr2SiEvNzz60xWUTn+PX4T+IJHZzFI9Wal9qWee2xmvXTVeZy7FbU
 boQveQisac1jAsTRuy+CnAqfd65WGomGIX45PdAE+FDgpiUGZoV+H8+GKbnbBN99hLnsDJ
 LbIzaVcTwkPXDCFXse/OK1DixVf9sQMRDzAuqi5wn2uDUOxE1eza8o6GEhdO3V0uTIF4NB
 w5zqtc58On0tLkXPn+uX2NIAumyX0xCGwB5BONspctsV+KblRDJVkSmH4ph7LGqHydcvP9
 rsU1v8IXCOCqHfwdLWeLKe7Mps9cq93tK0qoL/8lgc/WybRDhLS8GoSiXbBUkA==
Date: Tue, 24 Sep 2024 16:06:47 +0800
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heiko Stuebner" <heiko.stuebner@cherry.de>, 
	"Neil Armstrong" <neil.armstrong@linaro.org>, <rafal@milecki.pl>, 
	"Linus Walleij" <linus.walleij@linaro.org>, 
	"Michael Zhu" <michael.zhu@starfivetech.com>, 
	"Drew Fustini" <drew@beagleboard.org>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<dhs@frame.work>, <ams@frame.work>, <gregkh@linuxfoundation.org>, 
	<yuning.liang@deepcomputing.io>, <huiming.qiu@deepcomputing.io>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [patch v2 0/3] Add Framework FRANME0000 dts
X-Mailer: git-send-email 2.34.1
Received: from roma-MacBookPro.. ([61.141.249.39]) by smtp.feishu.cn with ESMTPS; Tue, 24 Sep 2024 16:07:18 +0800
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+266f27337+39d0d7+lists.infradead.org+sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Conor Dooley" <conor@kernel.org>
Message-Id: <20240924080650.1345485-1-sandie.cao@deepcomputing.io>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_010731_704414_D68F72C8 
X-CRM114-Status: UNSURE (   6.57  )
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

DeepComputing is creating a RISC-V Framework Laptop 13 Mainboard 
powered by a StarFive JH7110 processor.This is a developer-focused 
product, aimed at making tinkering with RISC-V more accessible.
The Mainboard is under development and we'll share more on functionality, 
compatibility, and availability as the program progresses.

Framework Model: Framework FRANME0000
DeepComputing Model: DeepComputing fm7110

V1:
- Add framework dts and config.

V2:
- Add deepcomputing into vendor list.
- Add deepcomputing,fm7110 into model compatible list. 
- Fix the error about dtbs_check.
- Framework Config will be included in later patch.

Sandie Cao (3):
  dt-bindings: vendor: add deepcomputing
  dt-bindings: riscv: starfive: add 
  riscv: dts: starfive: add framework dts

 .../devicetree/bindings/riscv/starfive.yaml   |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../boot/dts/starfive/jh7110-framework.dts    | 34 +++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-framework.dts


base-commit: abf2050f51fdca0fd146388f83cddd95a57a008d
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
