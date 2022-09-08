Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5433FC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vto/KpaXPP4bZ6NCFUEKJXCyHsB+yfDkPHl5P9kRZzc=; b=kkqVdQUUTYNQ/D
	GhthagVc7R8prAYIQTrePEW3X5xK1a8Tq3eS4s/jOYp9+MHiIu/gkkjbrugCFg0yNbPNxzGSnWRrn
	zBDm4oa4mlSEHh98sAogkSnf+KfOn9LKZcXfj7XFUjpKPUzASmK88L9TjcRTjn8PPKS1ccpbUr0mj
	KBtGjBFp/FY43+kyysEzntq6YJFz8+FsVS+vuUTQeNvuMklzXJ5wIFUMmbWutLVQVbaWxc9wsyaqc
	PyFd3QLHk9oGJQYFEafLAKyH7Pvq8VXhsMv6qe1YLCe+gZHYYTYC9vv3MyIfhXpIKdEohouzBtnzh
	1HVsQhswSK74080SAL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIX3-004gVw-RJ; Thu, 08 Sep 2022 14:29:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIX0-004gQJ-2Y
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:29:27 +0000
Received: from localhost (unknown [188.27.54.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D4436601F95;
	Thu,  8 Sep 2022 15:29:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662647359;
	bh=tpSobSIcb0QsOQnZGDIgD2ENJ2Bf9A/dSaw8KuUOnWk=;
	h=From:To:Cc:Subject:Date:From;
	b=a1QqqcXTRTWYWI0tj4ea/P4CA204KN8uwPEywASsiBS1tC6McY89UJP7TuOCsbnqw
	 VrelOfl/JCdhiX2WdrrkeJmykO3NTN9LHx+5jwpkF+DsQpLZTy9yGYaB3RUyTqEja7
	 DLNWo5HDdxJl8Majy4eXesbh5SqcSV9onaPvkwdxMoPtFasaYVk5t5jsZDsZ3EO382
	 tiB6FvUoi7zY3VyakMSsi6/Da7RYkV4SS9tuPsp0anLkQm+605jy9dAEKsIplTWl8v
	 Uys0uwfqatise9veyWe0Rl4NMlN/y750nECoCG1HkAvLX/GsNopVNESzcTRLBRPc0Q
	 PZ16qmIGxqnbw==
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
Subject: [PATCH v3 0/3] Enable initial support for StarFive VisionFive V1 SBC
Date: Thu,  8 Sep 2022 17:29:11 +0300
Message-Id: <20220908142914.359777-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_072926_354861_312812F0 
X-CRM114-Status: GOOD (  12.59  )
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

Changes in v3:
 - Added Reviewed-by tag from Krzysztof in patch 1/3
 - Optimized patch 2/3 by enabling copy detection on "git format-patch",
   as indicated by Krzysztof

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
 .../dts/starfive/jh7100-beaglev-starlight.dts | 153 +-----------------
 ...aglev-starlight.dts => jh7100-common.dtsi} |   3 -
 .../jh7100-starfive-visionfive-v1.dts         |  20 +++
 5 files changed, 25 insertions(+), 157 deletions(-)
 copy arch/riscv/boot/dts/starfive/{jh7100-beaglev-starlight.dts => jh7100-common.dtsi} (96%)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-starfive-visionfive-v1.dts

-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
