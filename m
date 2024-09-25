Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ABBCF9C77
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 05:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Message-Id:Cc:Mime-Version
	:Date:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M8VhD9BIT0dILHqLDCymyeOkhluSNAeC6HODLe+TlZw=; b=bG8rI1lpRTYuTG
	DgXfOdPpJ76vu9dDjyuXfM6gDGKt+a0/z0UfbdTuV7zd3SlUJTVdj8fFzNvt4y867L0nI4OXjqXFH
	wb43+JoQljIi11PvjTjwxZTYsf8eVOhCOhyqHgvK3H0+YHi//Y56fF6t9nPQwSV4aAvXrR4Cifqpr
	zJASsGDcCG9Bpz+RQRsgj6LE7b2+gf0WAy+rFGq+vpaM1yvK2NaX37IQKOCQ1sg4Y+e4EHIF71TOw
	zCsyWqulaO4MkzacDcwjXcQkRC+PA64nC3S64YLvbKbKJWDU+O/HLJ3dd4KPnDnypZtsN3PYsOgj6
	1UcG5OpXEqHn1G3fTl9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stKdi-000000043ku-1iK1;
	Wed, 25 Sep 2024 05:32:38 +0000
Received: from va-2-31.ptr.blmpb.com ([209.127.231.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stKcx-000000043ZL-3Xh5
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 05:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1727242300;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=lr3kdrCW9waJZWJ9AwRYvz8bGtYbn20hiykGW8PKbTQ=;
 b=VG0zoYAyG7R8F9681nz8ry2AqiUK8/7Mqq1ZO8Ugq2+klA203j/fO6rLLrLqSW+uxDmYOl
 8TE+jmSz6QoZEyOLK3tD7yEAsqH9nsPlI8pmma5DHobMDG9U1PZrOwNPjzeW8jAXUHkjY7
 oCtgZnflyWC9E8fB29uPkTgTqkz5VFN6b/45ZQuEEKvZ3HelTUXlt092DdHSSWoHZxYvZg
 Q/RPx/PwnYvwhBphTNDzrEXxL9YE6rCkxtDaZhRmAECgBPGphGmRjwDWLDhqPfyTY5CNQ6
 lDhFsEw7d3d5MIIosjlsueB2LkmE/fgTCQ7m7VLWnc7Ra2t9m/njeRchUdMaSg==
To: "Emil Renner Berthing" <kernel@esmil.dk>
Date: Wed, 25 Sep 2024 13:31:21 +0800
Mime-Version: 1.0
Received: from roma-MacBookPro.. ([61.141.249.39]) by smtp.feishu.cn with ESMTPS; Wed, 25 Sep 2024 13:31:38 +0800
X-Mailer: git-send-email 2.34.1
Cc: "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, 
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
	"Sandie Cao" <sandie.cao@deepcomputing.io>, 
	"Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <20240925053123.1364574-2-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 1/3] dt-bindings: vendor: add deepcomputing
X-Lms-Return-Path: <lba+266f3a03b+0d3f42+lists.infradead.org+sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_223151_994191_97AB9D83 
X-CRM114-Status: UNSURE (   1.50  )
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

Add deepcomputing into vendor list.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
