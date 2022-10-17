Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4352BC43219
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 21:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z5kJ6qxRGbMKU91vkF2dqXUjGT+F5qd+NHZ5U8kb7v8=; b=cMyGvnPd+THpdv
	I93qDaznKnhI68RAoP4SQTvybwnHgHfTAkCbxUn3U97VTRPk7cuBjYMlq5+WoJvisSoMiHwxJUrqd
	czmISY2GBoNmWw/5PTcJTZe2U0RCDWBf0bhcem4agTxcoNHuzdAsVQYF+aCNSlOFnRdK8rSkSlSQ9
	WQJjM2gL66fGtxIU5qWjVUgTxmxlK4JCij/qXJtZKM5GFZXxLqiQogzIMRnx5NgexPf3NCuKVryOv
	AHYizWW3qzDwwclqhRd1PNG1u0b5PRIRyMDt5i481jNYgd+25PmemyrCsPWftCFCGv6PRwAeix4qM
	y8/WSkE1TO9rhHtyVyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okXJA-00Ew15-6y; Mon, 17 Oct 2022 21:06:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okXJ3-00EvxU-52
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 21:05:56 +0000
Received: from localhost (unknown [188.24.131.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 74FE0660229A;
	Mon, 17 Oct 2022 22:05:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666040747;
	bh=T9SO0KJzI7t9t5kHCa7qShjSy9PVO9xpWQIv8eD/WbY=;
	h=From:To:Cc:Subject:Date:From;
	b=dTR9uYjecKkmtUW+D9wQ7+Cr+YRiXo/t87DUK/2JZ6Q/MaU8pGkGSPgt1dJie1ElZ
	 3UAUDhyEo39kbkYstLTm8F024Ht7QAQb9/ZfAvM3+Ek++qVRSpk4mnjqA6rlowFPt9
	 m6JVloC3B6DtwICTS4IPRqoZHJwvNaIaYUhWNcn+ijc0IZ/cdA/PqJIX3DtLgGKtU4
	 qMlt3FnJoxMZBqRzvxlmhELbHR7/wJIyqq6b+WDIbATO23dK+xwBWcepWURiPLetiS
	 LDjEAmZFyLdacoRCS7L2/LCj+9SznAfQtUC3x62uybOjQWsNoBg+sxKC0a7hlKT87+
	 YZ3kqRof1EN+Q==
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
Subject: [PATCH v4 0/3] Enable initial support for StarFive VisionFive V1 SBC
Date: Tue, 18 Oct 2022 00:05:39 +0300
Message-Id: <20221017210542.979051-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_140553_402823_8AA3908C 
X-CRM114-Status: GOOD (  11.78  )
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

Changes in v4:
 - Rebased onto v6.1.0-rc1
 - Fixed a conflict in patch 2/3 as pinctrl-starfive.h has been renamed
   to pinctrl-starfive-jh7100.h

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


base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
