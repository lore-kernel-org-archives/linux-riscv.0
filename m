Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD00C982FA
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 11:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Subject:To:Mime-Version:Date:
	Message-Id:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9mW9iI7Z0LHW54GsnRRmBNdf7d5cAxSLh2QrbqdSzMw=; b=LoVOQrrCF9LGLF
	6TPKqPERr0uYd8TCADsDl49nIkIqOC6xiJxZyW9sC7V4EZ1aAfd8KN/X7i2Ax4zpEzv14m6/kKaan
	J+Wo3H3jglsdnZnlze6D3zvFQWeVFz6mCbc0V2j3cKe1X3XP4q4dzCA3q/4n81vNxGKwfj1++jksO
	DFZhZcnw5aCR2OD/HznSxmhGxytd5ZhCq3ko6HGGju+ZunR8Zcvw3mVTSX2WjoYQ140QwVxZ5LMo9
	EcPlqkRhMRvp6qkdg0Clmlo1CqxoGZ9x8sHu9SEVQmA5B9mQBtNo0aB14iErh6MiG0hpBC3q9Eeao
	lrdRerSxl2Cnhw7wlcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yH8-000000058Vl-3l1d;
	Tue, 22 Sep 2026 11:03:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yH6-000000058Up-3rXw
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Sep 2026 11:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:From:Subject
	:To:Content-Type:Mime-Version:Date:Message-Id:Cc:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=iFgJigE7aPx9rcthpS190in8b+smB38KzrjCrY8jyZE=; b=PqTmpFTMprkekEFVsT9waax0bw
	ZosoBV5C586+guUBa8lZqABFKa3W+wuZvCOU5KYZAlYJy6fVbHREglg6eHdUeOvw1HXWBR5fvMNms
	bvGEQpvPTHsMGWuMMbiZsd3dxmykbFrZOWDW1UgerNP1GzODQ6KvQv8FeGOsUsaJUcsWDfif+Iuut
	8h0KpvVLbFk5Sq2PGYNHQyLwJdEDdycszdr+GiV8XKb56joxIww9hN+jAr2xzQHiXtRjb+9c/bRsl
	STEnAf5Xsby9BH9Ii474JM+4EXgDO70u2BYcofwIu54A+cdLMvHAYwwn3+jMuvJ3o0Y2GLox95nR2
	/OzPzbZg==;
Received: from lf-2-32.ptr.blmpb.com ([101.36.218.32])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8yH1-0000000DTEE-0fjL
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 11:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790074961;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=iFgJigE7aPx9rcthpS190in8b+smB38KzrjCrY8jyZE=;
 b=0NCiP/zKr/rJgj1+Zx+mOuh2xXMNG82cVBLX/lHIs3PjGSvbamCqznwvmbTuZV0ibJs8vt
 gMDyAd/xyuNw+zDfVJiS74ke+GMi/8RuzvVF6/v6kncxkaimuSqb0iWFIe/4DnYYxG0Ihm
 onYnfRnX0Z7+pRCsTOijy1qRbnVvmEaR+jGs07mMu8ZZtUFeM2xJhNlRZv37qPNrMpvmN/
 wU9YYEnmSxhblcNnuOaY2qS/apR0cBHULle4ZyXLED+Te1nTQ1CzcuTFh/tw7jvvIQLJOB
 aM1EqeTHvWRtkZfHtwTgC/GldqYqnZK6ITghHQK2i7nNtCTtxl6ZQ3dsAd3cIQ==
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26ab2604f+55a216+lists.infradead.org+sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
Date: Tue, 22 Sep 2026 19:02:31 +0800
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.111.1]) by smtp.feishu.cn with ESMTPS; Tue, 22 Sep 2026 19:02:38 +0800
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Subject: [PATCH 0/3] Enable USB and SD for Deepcomputing FML13V05 board
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_120256_122169_EB276FFA 
X-CRM114-Status: UNSURE (   2.59  )
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

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC regulator
tree, add USB controller and USB phy, Enable SD card.

This series is based on next-20260918.

Sandie Cao (3):
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator
    tree
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller
    and USB phy support
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card
    support

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 218 ++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  66 ++++++
 2 files changed, 284 insertions(+)


base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
