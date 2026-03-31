Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABCEFF60C0
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 03:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:From:Mime-Version:Date:To:Cc
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sZMTjNYYrKkcT93cSvM3ldP4ujIahbwzhs64/1+6whQ=; b=kdU1kLqjO58VI8
	1lbkhvk6iT21cIGqRyLFyE7pjdyU0i4nbDU6iS9FJJgnC1gZXGDQYdAHG+jYLbYlBlg71deYWJaGs
	Ovz3lUxOjUDkI03K9RLsRrb3KY6uXb5c/vdfrrMS0TamWDmiC8JIpQ3EfgdeaL5mHNNBVPFT9Kro1
	cUg1fHcNG25kR01Ua5wcD6lGwbuorgVlXBZRhmCQ2gh1Ugc52nuTc8WxcBVpBK4RWfk1IirGZHCTi
	Pzc/mf039cBf83XRu9v4Q5U6gFNHawuJQW84yxZQ3A5wsu5CyfbERULKLYjAdklft009Xn7MVe+nW
	5PI3MgbcfKqA4PdhnpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Q79-0000000CFSB-3vPT;
	Tue, 31 Mar 2026 03:50:03 +0000
Received: from sg-3-27.ptr.tlmpb.com ([101.45.255.27])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Q76-0000000CFRS-1PMb
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 03:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774928682;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=uxHkUdFeg/FwNhES/kW73MVWxcRL8iwer3YLvVez//k=;
 b=HyTzhb7b/RkD6DuxO0T3sFM9vkwzchwHdkgenoZZXcNpCCr3OyztYnacAUjJSo4OUPj7tn
 Bq15KJCyQv1awjQcD9bfwCT1pBrX8IVpjgCZCROJM2Bdn/frQ4vbWUmQxkaVn6DCPI+EeX
 y3ZqvGaFg86446diohCVni3jVA3nt4a9TcS6VxlYdLeesknayF3a+m9/yOBjpx2l22F8Jh
 d9O6ohieLPRQrBFyKa6XFLFcZLa/AdWyPJNbKtKe7Sv57s1hIo8ziGSiFdIEyEihuyynGV
 BbCgcTD85nUFGYmkvzMXocRiCnICZkFFeZJrbJuJpMVANmM41lQyUeFvrIcUwg==
Subject: [PATCH v1 0/2]  Add DeepComputing FML13V05 board dts
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Tue, 31 Mar 2026 11:44:40 +0800
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Yixun Lan" <dlan@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
To: "Conor Dooley" <conor+dt@kernel.org>
Date: Tue, 31 Mar 2026 11:44:23 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+269cb4328+709997+lists.infradead.org+sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_205001_153249_3A3E6C57 
X-CRM114-Status: UNSURE (   4.53  )
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

This series updates Device Tree related files to introduce the
FML13V05 board from DeepComputing, which incorporates a Spacemit
K3 SoC.  This board is designed for use on the Framework Laptop 13
Chassis, which has (Framework) SKU FRANHQ0001.

The series is based on riscv-dt-for-next.

sandiecao (2):
  dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
  riscv: dts: spacemit: add DeepComputing FML13V05 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 28 +++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts


base-commit: 4a1739c30fc66a59450c1f78923f94607e786882
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
