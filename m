Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F45CC282C6
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Mar 2025 23:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eAYglcH4Q8hHxm7IFlIsJp1IH/LYHpirMJYMc3EC3nA=; b=bhqL8uQVgbA+PS
	lJCt6yduZTM/DUkr5q1Nkft7x0WvPKmG3NK3wuf6kKEFyakmmxN+BE7FTNNPvG4QEw9db6BXymN7Z
	pjoa4F9gBOQBs3L3BZxOpfVH/7Vt1TCl8FeaTL6oLKYeCWOl5K+X0+HI08kSZ6WoLc5tOlLcj+8zW
	4amXku3iRrSNiffRg3AND/TI4PwXeP8Cre2i4Cvy3ImE9f3EKcybgfcXIUoZiEifcFtCt6rnl6Aq8
	6Zk6LsKVnu7+FdfwzuvaveAh2qTBv7rTKk/SHEa16IpUgeEGPZVQK0eaffN40lWpV/v//TKP0SNTl
	N7YjsYb+4lSU8UK48GHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toW3v-0000000F41F-12Km;
	Sat, 01 Mar 2025 23:16:03 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toW3s-0000000F40o-1lfI
	for linux-riscv@lists.infradead.org;
	Sat, 01 Mar 2025 23:16:01 +0000
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B03F9342FA1;
	Sat, 01 Mar 2025 23:15:55 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/2] gpio: irq: support describing three-cell interrupts
Date: Sun, 02 Mar 2025 07:15:31 +0800
Message-Id: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABSVw2cC/4WPTW7DIBSErxKxLhX/hqxyjyqLZ3i2kRKTALFaR
 b57sb3prssZaWa+eZOCOWIh59ObZFxiiWluQnyciJ9gHpHG0DQRTGgmREeZouMjJhrzk9YpI3q
 83agxyJF10ltmSMs+Mg7xe+/9uh464/PV6uthkh4KUp/u91jbHOPKOw1Da0OJnfGgQBunDThpU
 Ehh5cB0T/5ibbENincHUd78Qof0yjuT1dZaCIK7AOdFko1jiqWm/LPfXfgO8s+zhVNGFaAKjvc
 AwV9GnGtKnymP5Lqu6y9OfPKyQwEAAA==
X-Change-ID: 20250227-04-gpio-irq-threecell-66e1e073c806
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1865; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=so9PRmptskHbOFYIWe2JX2iUt5C4l77HzSi62jfpQMo=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnw5UhTFh03pEtuGT1fh5CNzoD7XrtexFESEOci
 KJY1G1CekeJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ8OVIV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aRRD/oDYbxDwhPB4+ObLy
 9O5VeFjcL41cY7FdWUA0LVSXuLNPDqGBw2KCtyvK8Z/grbuay6/J+NbjYjIE0u2FDlxHaMPkwqC
 t+PfdO5UP9EdtDD7FwMBLu9WF3clFMOhJspNn0RGIr/z8nOPLqV230rLmpNNFgyBBRxK3oVYAx8
 a99NRCAh5awd/OkRI3Q35UH6vVxhXk70b56rjBNm/H9bPYMObDLGBw4UoONDpPNt9kiCuQYVsMG
 tp98AcbqVsCpOyDgC7qB+0tptCSrpQ9HfUr1syBEO78RmyhB6ab0BbaTiHWwEOuEoTY5JlFsx2F
 jWIcO1r5DjEAWhsYaYZT+Q40frA16sa7ypDk5tJxE/NOpgzN5HYEqHSUUNdIs6hhVoNbQ1Q3r2T
 VGuIw2UxuUHBdl01MZUJRqCZ04a+FI4NcNli5WRRHG/DtfuhI9mwBdAeFLln4LgTbRHDn1sKbiG
 z6k1N71x7LJsI7zB7AKYbh62vMDNc2wBIg5kzj6MkwIhIa/ltgYYpcLfs8tZpxyMi7l0UlzWw8L
 o5NGmLI7WJ3ed0dcOomR1vaC0mHWNthj8YqegKvMjN8rncQWk3XqgoqMW0TDmop/O8HM2sTWyzs
 ivQ8L9QsqYjCrkXqRlzGmsNghRbbt/+JbqblPvnoYc3kV3tGgS4fW+l1Z+7lmW33mfiw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_151600_494771_86A4839C 
X-CRM114-Status: UNSURE (   7.52  )
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
 drivers/gpio/gpiolib.c    | 23 +++++++++++++++----
 include/linux/irqdomain.h | 37 +++++++++++++++++++++++--------
 kernel/irq/irqdomain.c    | 56 +++++++++++++++++++----------------------------
 5 files changed, 83 insertions(+), 47 deletions(-)
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
