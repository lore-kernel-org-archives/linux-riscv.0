Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBDDC021B2
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Feb 2025 11:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YxBtpf+mnsYK/5GOkUuQIxGTcO2sRCC6VEJxyHpTY2E=; b=1nbFr46VYlyF7P
	QWDtdcYGVXlFXWgChbzOgnwn3mPn2hRSdSKuKvRYphy5irOtG9y0l5DolrflSgi7vAVbMsGR/Zyjk
	UDJNyiVGmV6iAjhh2fYW/F5a3wohLcNt31n3tS8qr36bFkRG5H6WJYBigDgdoMI22WYxej56Iul0u
	sjmKpnHdmWyP5DR0WekoT9nscBVm4AdQatqtqQYUCYnkAOpGnPNCt3LfKUm1nTOzlim7GP2e+cSR4
	6roaXEkSE1G7ILjIww76I5h2Q4O5y0/auOtOkj3At6gCRtHSKFTb9hlS4ud4wgbGBT9N9dFt6OiyQ
	QefbfxCCDZqPffWv7cgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAV1-0000000B1UL-32L7;
	Sun, 23 Feb 2025 11:50:19 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAUy-0000000B1Tn-1FD6
	for linux-riscv@lists.infradead.org;
	Sun, 23 Feb 2025 11:50:18 +0000
Received: from [127.0.0.1] (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A2057342FA9;
	Sun, 23 Feb 2025 11:50:08 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v6 0/4] riscv: spacemit: add gpio support for K1 SoC
Date: Sun, 23 Feb 2025 19:49:31 +0800
Message-Id: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEsLu2cC/2XQTU7DMBAF4KtEXmNkj/+z4h6IRWxPUotSFyeNQ
 FXvjpMKSNTljPQ9v/GVjFgSjqRtrqTgnMaUT3XQTw0Jh+40IE2xzgQYSGbBUiboO6fDOWWque8
 d9I4JCKSCc8E+fa1hr2/3ueDnpWZO9yXx3Yg05I+PNLWNiAaiZqLrOwM1WzGOjhmNGDVHpgQXw
 mFvybZL29QmigE39w5l2Y+0z5cS8HikVllruwjcxa6dOVl6HNI45fK93lhXS5H1HMfk9pyZU0Y
 1M4AeMXTIXgY8TTk/5zKsOTP8WV4f2FmoFqyUso8APMQHKzYW1M6KxRrvjZeSRw0PVv7a+kXAd
 7ZeQKWWPDgVGHfywap/u3za1qq1sxYYBBqvzc7ebrcfzIYGQR0CAAA=
X-Change-ID: 20240828-03-k1-gpio-61bf92f9032c
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4121; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=3eCCx4Y0IbvgrAHrne90VeddDkI4NvjGwcjNSwycqT4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnuwtfg/am9C+hwF64sZ4DvTz/KGpjKdI7T/+j8
 fmHkIKFwHaJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7sLX18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Vs3D/sFNIBtvDd+LTxtWW
 Rlqz2AXrdu8ZGOu00/lzbbZOSPCb3Hw77q7VpEB1zp7ArGZ5NgFGZ5sMs8sH+p/BzltNXKC5vko
 XFOFxJDsXV989LiqtQGpqoODq8hpRG2pZ01uBC3y7iDSyLZwENwvCHZ1YptHo7OtQp5WReW1Uxz
 lBiKWhAtYr4TjgPIg5WcLcAohxQiNBb/czIyr1AhOa5npt7RlPr9gusRv6jdcmMZlkzu/1rIXHC
 +Rz3z6FYpiLILtjF3haAcVbZHSO4tOJtYtqslEQ8WUpoMLxF+WivRUG5dOr5lnJOuIswLy6TVf2
 rTgJVg/OjdEhvHKJxQqM15gTMNU2QDy1PqSTI81VETFMz2PLwIfYLNKyrqpQMZ8fwtysQU6jcFs
 Hc2WIZXknaZ5RwtC3gT8cfmBMzyFz6TG7+Mym4cltuSMHNzt/kjzw3xAN2H3BADO2qohn7dJR2R
 B/AhuQXdnKwwm/Qv0HC9MMrJ61fwHZh7clp8Q/SPl4pzQJ6HYz8k3l+QuXTQPyAw7wVyh74OF1L
 5NFATEI7ZFeIepQKLhmmIyJeEdS4KjCPUaQIjw1LqSkdoPq4pJbZ+dlQCug2cuaDQNJdtQYa1YN
 48+Lc11EflehFYmD3FF2lx6P5Nwm/nYBRUed2YwGHE+s2OKBxrPYKjMEbzmrSRdvKxGA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_035016_371068_698F1AAB 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
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
resources (IRQ, clock) are shared by all pins.

The GPIO docs of K1 SoC can be found here, chapter 16.4 GPIO [1]

Note, this patch is rebased to v6.14-rc1.

This patch series has been tested on Bananapi-F3 board,
with following GPIO cases passed:
 1) gpio input
 2) gpio output - set to high, low
 3) gpio interrupt - rising trigger, falling trigger, both edge trigger

This version should resolve DT related concern in V4, and register each bank as
indepedent gpio chip in driver, no more sub children gpio DT node needed.

One problem is still not resolved, the interrupt cells parsing isn't corect.
but it works if request gpio irq via gpiod_get() + gpiod_to_irq()

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
Link: https://lore.kernel.org/all/20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org [4]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v6:
- rebase to threecell gpio patch which proposed by LinusW at [4], 
  drop unneeded *xlate(), *add_pin_range() function
- add SPACEMIT prefix to macro
- adjust register comments
- drop 'index' member, instead calculate from offset
- add IRQCHIP_SKIP_SET_WAKE as gpio doesn't support irq wake up
- drop #ifdef CONFIG_OF_GPIO
- move interrupt mask disabling/enabling into irq_*mask()
- Link to v5: https://lore.kernel.org/r/20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org

Changes in v5:
- export add_pin_range() from gpio core, support to add custom version
- change to 3 gpio cells, model to <bank number>, <bank offset>, <gpio flag>
- fold children DT nodes into parent
- Link to v4: https://lore.kernel.org/r/20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org

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

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  81 ++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  11 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   3 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  15 ++
 drivers/gpio/Kconfig                               |   8 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-spacemit-k1.c                    | 277 +++++++++++++++++++++
 7 files changed, 396 insertions(+)
---
base-commit: 3d72d603afa72082501e9076eed61e0531339ef8
change-id: 20240828-03-k1-gpio-61bf92f9032c
prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v1
prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
prerequisite-patch-id: a166abd76d3f29768856440830c081bf40511a98

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
