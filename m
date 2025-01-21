Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9818BC02185
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Uzhdwh49HW6p8ZvJvSYDFD2MvNI9wpXTcy0I5o9HeI=; b=BpFss3CWVWrUrV
	zl/EtTrQKUYdx1wZwXeStxrulO4jDV+tlBWuyh4ak+iyenQR73R5IdMBw1hHZESbD/hIZGnFimS3/
	X0BGQXf23B58btuVtWo7Mpf1//F+ZOHN0AL3rQq5NGiaQCW+l140/PfUweUiGZ5Cx3xUNRQiV4GCZ
	secpdSpHOszwSJN1mbwe4iFCfPssvJZeUiv0gOCGK6uocuRpvYVXOrCdHZTkXtJVWrwIxpLkEpUmO
	+SQU+EjrsH8lkMsghI00AKU+/l3GqAqInHpzrJhW8+7IumMuhTEh7nJ6aKYSquL465ru3bE66ZRPu
	/auna34rdNOJCQQnMo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta56a-00000006pA3-04Tv;
	Tue, 21 Jan 2025 03:39:08 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta56X-00000006p9a-0yAD
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 03:39:06 +0000
Received: from [127.0.0.1] (unknown [116.227.99.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0EA35342F65;
	Tue, 21 Jan 2025 03:38:56 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v4 0/4] riscv: spacemit: add gpio support for K1 SoC
Date: Tue, 21 Jan 2025 11:38:10 +0800
Message-Id: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKIWj2cC/2XOQWrDMBCF4asErasyM5IlK6veo3RhWSNHlFiJ7
 JqW4LtXcaDEdPkGvp+5iYlL4kkcDzdReElTymMd+uUg+lM3DixTqFsQkIaWWglKfqIcLilLgz4
 6ig4U9aKCS+GYvrfY+8djF75+1eb8OArfTSz7fD6n+XhQwVIwoLrYWartBpAdWMMcDDI0CpVyH
 Ftxb53SNOfys/254BbbXnKgn19aUII0YIk9c98xvA08zjm/5jJsnYX+LBK6naVqqdVax0CEffh
 n1ZOlZmfV3Vrvrdcag6GdXdf1F5nB+6ZpAQAA
X-Change-ID: 20240828-03-k1-gpio-61bf92f9032c
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=cW9ltewJeTOGIc+huI01BZ5b49aReSytJfBf7xeiGMU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnjxbARUufveWx5vLgRnoT4kGy+jV68rvs26ofq
 IOn5h+eMk+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ48WwF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UjrD/wNliGIyE9tgkWm+i
 bSR18VfQyitKEGYo6EAFDDrTkYoPXjrMeUBvyaDwBKpwaPqvrCnhbiJ7VwYpUSMB6jZHKLQPmdS
 dNly9r2wSLUAJGrqW9A9aqmqnF6rcIWJ6wjejDCfgZtRZO0u0YQMxq24qaM96eQ+X68zMIi6avJ
 yLMtrXwC+3cqpXeF3hPNCHM7qvny61oLxV1PGts1NWA3DFiggyUAJBBxlJw5HGbghB/N+6AHfrh
 9QUM8d/ggZ2mRCYvh1aZiB600LEGJLZBw8b098tKw4ds4wIJB23IBnaiyghS5eQcaMnLpyRjHL0
 f9DUclC30pA56j0+GZcSdViXkS6/T0mA5NvupVnRR5qnvwFO3AA41Nm3J5zH++fcvI2udelMCUp
 bV/1oqeS8fZ5H439CI85uZCEwja4MfDZHV9Xebo/O28YdsGpBXCnMz+8vE0Ir50lnBT7axPLJaK
 hlrHCpYqxjmCIy9CeIteoyGfrL93cVPrUd7sKl1Kop+kKY/4d2csR6bVschN34L9YsmxpHGLIkt
 Tkdva81Ov2XNLJXLxx7K08A6SwZye0/tJ293bUfMOI7MPbZ8pl4UP191yPhB63vNrzm/mIO6i9O
 HwwrtiyvPOvvR4lpgIgfNFOAPE39FtVSMxf1AJdlnEVGe/qJFTA95Tq4CPktDG0k0BGA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_193905_308002_EE05A659 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The gpio controller of K1 support basic GPIO functions,
which capable of enabling as input, output. It can also be used
as GPIO interrupt which able to detect rising edge, falling edge,
or both. There are four GPIO ports, each consisting of 32 pins and
has indepedent register sets, while still sharing IRQ line and clocks.

The GPIO controller request the clock source from APBC block,
In this series, I haven't added the clock support, but plan
to fix it after clock driver is merged.

Due to first three GPIO ports has interleave register settings, some
resources (IRQ, clock) are shared by all pins, so all GPIO ports have
been organized as sub nodes in the device tree.

The GPIO docs of K1 SoC can be found here, chapter 16.4 GPIO [1]

Note, this patch is based on 'for-next' branch of SpacemiT's SoC tree [4],
due to there is DT dependency.

This patch series has been tested on Bananapi-F3 board,
with following GPIO cases passed:
 1) gpio input
 2) gpio output - set to high, low
 3) gpio interrupt - rising trigger, falling trigger, both edge trigger

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
Link: https://github.com/spacemit-com/linux [4]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v4:
- gpio: re-construct gpio as four independent ports, also leverage gpio mmio API
- gpio interrupt: convert to generic gpio irqchip
- Link to v3: https://lore.kernel.org/r/20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org

Changes in v3:
- dt: drop ranges, interrupt-names property
- Link to v2: https://lore.kernel.org/r/20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org

Changes in v2:
- address dt-bindings comments, simplify example
- rebase to 6.13-rc3 
- Link to v1: https://lore.kernel.org/r/20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org

---
Yixun Lan (4):
      dt-bindings: gpio: spacemit: add support for K1 SoC
      gpio: spacemit: add support for K1 SoC
      riscv: dts: spacemit: add gpio support for K1 SoC
      riscv: dts: spacemit: add gpio LED for system heartbeat

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 116 ++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  11 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  55 ++++
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-spacemit-k1.c                    | 295 +++++++++++++++++++++
 6 files changed, 485 insertions(+)
---
base-commit: 3d72d603afa72082501e9076eed61e0531339ef8
change-id: 20240828-03-k1-gpio-61bf92f9032c

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
