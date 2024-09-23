Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9918ACF9C6F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 05:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Mime-Version:To:Message-Id
	:From:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kdyKzYXMmnT7rvLvymBiMquZqfb8FPKSnn8Bij6BqEc=; b=QSDQQxU6AOOnpV
	0LcF/oopPOHw18mSweX/q7YZVSp4lNkmgKlO868Dip5jcd4kKzmbV4Srw3MLBcXcR0Rp1lZZFqW3W
	c7t5eqlVgSeC1i7JjYaWe2OwcHG+NYGbdK1YwoMstqQ8FgCdPszGaEmMDIMejVox0ueXnqNq4hUaD
	qh50CoUsC2C59b7QeQioi+STHXY7GxPIcDa6K1TzanKulYUnzBFSWAlIbcHlXGp60lbMlgAT3oUu0
	djhwVq/EpUttcsPM5CU2b/EApkivtgYVHtbal8h4mhakT82fo7/fr6+Faw3/SGVVkAKahJoeJLYIp
	gqWK/i4WAZj48x1ZTG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssbka-0000000GLWP-1lAs;
	Mon, 23 Sep 2024 05:36:44 +0000
Received: from va-1-20.ptr.blmpb.com ([209.127.230.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssbkW-0000000GLU4-0KPE
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 05:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1727069788;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=aV6BkKf5lBk9jyifuv+6J+XRGBiA2WnxkCA2SCxaiWI=;
 b=qXHU7v8agvU3Rz1J+NXGp7NSek8bhPkhXB0K3AMKbZSL0y/b/9YtK9mi/GmC8eFH2EZXUZ
 IT+ut3DVKy3pk74W9D9ICdiMbsDysR8V+slccj7S4zLdFoBb4Oho4b6WI7Tg8wwWHys2hP
 jcjzraRm00X7PEwIoiiMu7PfoEuiaq/0tz/+64hN32WtqZdi8ViqylnqOqCJiXo8dUzayn
 aF3VhmDjAdIuaZSK28GLOE3NLRIFscncxEVvDfvkPIOEfzHtdDsA8GjF0ksCcjzeGNErsC
 fFUxrnvApM2Ne3jdrr1wensxd6mC0ppyA9XfxfnWfO4/zMT/jtT34Tpv5nMyUw==
Cc: "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20240923053621.1585972-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Emil Renner Berthing" <kernel@esmil.dk>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
Received: from roma-MacBookPro.. ([61.141.249.188]) by smtp.feishu.cn with ESMTPS; Mon, 23 Sep 2024 13:36:26 +0800
Subject: [PATCH 0/2] add framework dts and config
Date: Mon, 23 Sep 2024 13:36:19 +0800
X-Lms-Return-Path: <lba+266f0fe5b+f2f4f9+lists.infradead.org+sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_223640_834275_F48E2359 
X-CRM114-Status: UNSURE (   4.17  )
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

Add  dts and config to support RISC-V Framework Laptop 13 Mainboard. 
https://frame.work/products/deep-computing-risc-v-mainboard

Sandie Cao (2):
  riscv:dts:starfive:add framework dts
  riscv:configs:starfive:add framework config

 arch/riscv/boot/dts/starfive/Makefile         |   1 +
 .../boot/dts/starfive/jh7110-framework.dts    |  35 ++++
 .../starfive_jh7110_framework_defconfig       | 151 ++++++++++++++++++
 3 files changed, 187 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-framework.dts
 create mode 100644 arch/riscv/configs/starfive_jh7110_framework_defconfig


base-commit: de5cb0dcb74c294ec527eddfe5094acfdb21ff21
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
