Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272DEC36008
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 22:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NkzXeApoog4F5QibOI+20yNmI2xByEFdnkjQNV5lVKw=; b=oaHXK9urb0xei6
	EGc9MiLvPqGY5ukYtRY0DviCeUfUzSPaIWMTSeuLPk0gFQM66DTrYpCV7RBRH2o3wFjmhsCkp9OKW
	d61HxQX358KYax/ZD9DBcOFVj1sujbDYUwiGGFcUOO28JvrpDdI8GeTKWEmpLTww+heGl4Titi+Cq
	x5GVjVYV39xx879Zgwqn3p1DoPy/SOsXZI9NuKXkHCLnvA2WHzuI9JWVLmUZoakMe5GYTHDxD5qwS
	GsWucJ+lYIDtSTSA5x5Jk8rfJunAe3Dn53lVZPymXAVANfJMM79Owe6WLBNd4AY1lZsNeRHfuEzuT
	KdgVl3hwmMgVir1KFEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCRD-000000078Jm-36pf;
	Tue, 25 Mar 2025 22:07:59 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCRB-000000078J4-0Ysu
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 22:07:58 +0000
Received: from [127.0.0.1] (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BF8D63433D9;
	Tue, 25 Mar 2025 22:07:51 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/2] gpio: irq: support describing three-cell interrupts
Date: Wed, 26 Mar 2025 06:06:18 +0800
Message-Id: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAMp42cC/4WPy26DMBBFfwV5XVd+Y1jlP6ouBnsASwlObIISR
 fx7DSzaLqou7x3dozMvkjEFzKStXiThEnKIUwnyrSJuhGlAGnzJRDChmRA1ZYoO1xBpSDc6jwn
 R4flMjUGOrJbOMkPK9pqwD4+d+/F55IS3e8HPR0k6yEhdvFzC3FaCceUaDX2hocTaOFCgTaMNN
 NKgkMLKnumO/NTaZpsUrw+jtPWZ9vGedierrbXgBW88tIskm8cY8hzTc3934bvIP58tnDKqAJV
 veAfg3WnAaY7xPaZhRy7iGyOZ+AtTDlSqnkvwskZQvzDrun4Bd9JOZ4oBAAA=
X-Change-ID: 20250227-04-gpio-irq-threecell-66e1e073c806
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=J5rfOXpVIm3owZCLUBgmfVivf5Y0iNB6x9OABKbRCpg=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn4ykteD52FYX8CMWYp2wA+M2dpCR+GilBReyWa
 kduqmFUEtuJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ+MpLV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277XkpEACDY0Ikr7DxW4Gkvj
 zHDZmR3TuLaqaEZ/MCKmXMOiE98vOUFdXq44xB7vGpQeOR3XEHa8bH21JKPggYtHlB/Y4iwGiBr
 p+0H7lthulKUD4GW552L8EZronwcNWDp6ZFa8RPUyHpDjqlGn9uN3glGlecv54mDxDJtXESlcSV
 lKhCIHsYJssheSwBt6+G3RsXDWySsahdpLxeHxLSskNSYyqzEFsF/n3oRXuiJjpkSKu61t+vkox
 gw1OMyWV9jPf0Uoj5bDGAkCj9ZFYNIbr07e5dCKZs5PfMgI3GDxh7Mz1LpCgy6CtFhxT7XeiAoE
 jngw/QG7yLIw70HK5FhpmSX5dSRCo0NeI3qF2Aa/ap4ibDOdPI4Qx9p+OD4MuDoXZlP11pha+do
 MpKPTSXsdRMameuHqM+nzqUHJDpupEgxPv+k8KnA+qdF3hvZE9uSizR9EQEok5P0pNFOWcbNW1r
 H9sqrV99T79wcnOjrCGdGN++kTWF1ljG5khj/2rBIA9bPwvSTuXgXqbgDr9+3t+omLmyr6CC+rU
 bHLmsb8Enfedq0S4Siu0G+9Y6M37s3dv4FRq6xRteTc3ujExK2lWIFarmUsTYu/ojKDK8HtqnCX
 a3PjlnKi34/whCfu8gdN5zETShVUcCp74wh3wVX1yBIiyhlx51/c5b2DqZn5Va+U2WCw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_150757_208636_37EDDDE9 
X-CRM114-Status: UNSURE (   8.06  )
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

In this patch [1], the GPIO controller add support for describing
hardware with a three-cell scheme:

    gpios = <&gpio instance offset flags>;

It also result describing interrupts in three-cell as this in DT:

    node {
            interrupt-parent = <&gpio>;
            interrupts = <instance hwirq irqflag>;
    }

This series try to extend describing interrupts with three-cell scheme.

The first patch will add capability for parsing irq number and flag
from last two cells which eventually will support the three-cells
interrupt, the second patch support finding irqdomain according to
interrupt instance index.

Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [1]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- explicitly introduce *_twothreecell() to support 3 cell interrupt
- Link to v2: https://lore.kernel.org/r/20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org

Changes in v2:
- introduce generic irq_domain_translate_cells(), other inline cells function 
- hide the OF-specific things into gpiolib-of.c|h
- Link to v1: https://lore.kernel.org/r/20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org

---
Yixun Lan (2):
      irqdomain: support three-cell scheme interrupts
      gpiolib: support parsing gpio three-cell interrupts scheme

 drivers/gpio/gpiolib-of.c |  8 +++++++
 drivers/gpio/gpiolib-of.h |  6 +++++
 drivers/gpio/gpiolib.c    | 22 +++++++++++++++----
 include/linux/irqdomain.h | 20 ++++++++---------
 kernel/irq/irqdomain.c    | 56 +++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 98 insertions(+), 14 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250227-04-gpio-irq-threecell-66e1e073c806
prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v3
prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
prerequisite-patch-id: 7949035abd05ec02a9426bb17819d9108e66e0d7

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
