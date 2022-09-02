Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E84DECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 10:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vCSZbeZ0ZhdYlRRpqw7k+NYmUG4P8ML3LPZS/9nP9to=; b=kyFgCSv2qaDyBI
	OFH6DVKKRL7cBs7GbUoc0nWTF1SZSDy5bL5Q1XRHsNfCMn1yBqZTtDn+Fh4attEPaxe6z5B3/vdIc
	wtuXmKd3P9zmjImw2X141pJUuK5dTom3vr5kfkmTTfzVqZsETQM+ShPTKh22Hy84esD496IKcqFRE
	Y3O7DyRAMyqa3KfI67F/KhEvol0nBkQrOWEZoOhERYB7FyzXZdDnVvxaeiSDgBux3D2mwJJmqmJiM
	zneT8dVMq/KOW4lgCcNOSYgr7perVjXdn+8nqdZI8cM6RTZj/kowmcXZVF2zxleIQNCTrhpEH/wpb
	Xi+l0WFOLj3W7h5WDYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3ay-0039Pu-UT; Fri, 02 Sep 2022 10:08:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3av-0039Ln-Sz
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 10:08:15 +0000
Received: from localhost (unknown [188.27.54.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 46A946601ECD;
	Fri,  2 Sep 2022 11:08:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662113290;
	bh=5WtGfYWS8CFBxiuhUaY9SEHVggHfZVHvWYZsLvREZXk=;
	h=From:To:Cc:Subject:Date:From;
	b=Tev0Xz6D1yn4crJHkYlrqqB26WXoinW3cbBQwtMcGQw4umbJrL7SqUBwPblNa7PId
	 EST2KQY5mQiCSqdiBZO4vjPrR5ml/sAMGkMg9uhLGZvUPQBeu5V0x+sRSM5i6stqs3
	 HUHN4SQBgfbqDXVO0nZFlvK7NQOD5fdWBnQZm2sy8VU931wHU5RmuhW5BDg5hQJWJm
	 xijn1f/yEyCBmk7BlZvHWrKzN/wpe1o2V1Ff0uu41E+JBNigY7zBNilfusfymIb1+t
	 fVFpRAI8VBvsNEFdcNPWzU8mh3BBLmX5xurmMPuWHvKinBMjRtKRK+rTkipZc4La7K
	 fXt2IB+mTULUA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 0/3] Enable initial support for StarFive VisionFive V1 SBC
Date: Fri,  2 Sep 2022 13:08:03 +0300
Message-Id: <20220902100806.2378543-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_030814_091095_1CEDBEAA 
X-CRM114-Status: GOOD (  13.27  )
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

The StarFive VisionFive V1 SBC [1] is similar with the already supported
BeagleV Starlight Beta board, both being based on the StarFive JH7100 SoC.

In addition to documenting the necessary compatibles, this patch series 
moves most of the content from jh7100-beaglev-starlight.dts to a new file
jh7100-common.dtsi, to be shared between the two boards.

No other changes are required in order to successfully boot the board.

[1] https://github.com/starfive-tech/VisionFive

Changes in v2:
 - Simplified documentation by using 'enum' instead of 'const' in 
   patch 1/3, according to Conor's review
 - Added Reviewed-by tags from Conor

Cristian Ciocaltea (3):
  dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
  riscv: dts: starfive: Add common DT for JH7100 based boards
  riscv: dts: starfive: Add StarFive VisionFive V1 device tree

 .../devicetree/bindings/riscv/starfive.yaml   |   4 +-
 arch/riscv/boot/dts/starfive/Makefile         |   2 +-
 .../dts/starfive/jh7100-beaglev-starlight.dts | 153 +----------------
 .../boot/dts/starfive/jh7100-common.dtsi      | 161 ++++++++++++++++++
 .../jh7100-starfive-visionfive-v1.dts         |  20 +++
 5 files changed, 186 insertions(+), 154 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-common.dtsi
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
