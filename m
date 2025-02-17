Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0308CC021AA
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpBd/kkDEX15ubb3c+0ZeUgXQK5Nlgbp7uQBZ1USdFI=; b=4mJSoeX5z6jpdD
	M2wY95d1QVjGCbvNmF92/uzpaYDIlnt/C7fJflSKg0/RIQvFAx9/WTECHKAAh553vDtE0k4mOWLA/
	S6/pqbVBzMDuKr+rkGJwAsB2InH5/pAkD8L4bZYh/mLSdQazfOgVRsiSNmFWMutUgjkEhZ11ZqWCt
	/1ie+gD3ZwvxluSQ3jsJB5lm8+5448BQlFJEUaZBIwi7BmW/l3khiZmmMb2+ulUFN0x//XAUdTkCs
	+YZpg0LBCdcHVFmLtdKJawFxSrO3WKp33iPqh7ofhp3/xH5Ykrfa4TqBkT8ZliQF6ZVuJc6ZHspte
	qtd9g8msPjFDpzaLybGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0hl-00000004Xwo-1GJu;
	Mon, 17 Feb 2025 12:58:33 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0hj-00000004Xvv-1LnY
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 12:58:32 +0000
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 02793343083;
	Mon, 17 Feb 2025 12:58:24 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 17 Feb 2025 20:57:44 +0800
Subject: [PATCH v5 1/5] gpio: of: support to add custom add pin range
 function
MIME-Version: 1.0
Message-Id: <20250217-03-k1-gpio-v5-1-2863ec3e7b67@gentoo.org>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=SnBbFKKogB6q+Vfb+jj9D2g8pT9iPHj1lIkWDDf73vU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnszJZrRNIp7anNjnH/aex/U9yqm+zBBqIhG0UO
 70eO8vlSJSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7MyWV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277T1qEACUaWQ2Yh3Eyo4GHf
 M926L5dBdaPRFOEH9/qyF0vb3PKCzwYT6CN87Ko/nLpf7KP3PI3CZFY/dvo1+vB47iw2rC5h0Cj
 T1HgI2dmu+mk/uXZsH5Ky5kFO90ehQOxSYCvaTdcRyThI3oejMO4KhaCab5U+CSgDRl6dCeoAa9
 Frd11USieyet8rAz+8J8GZK7XhLI99sdi36o6zd+MzGWjmJGc9lCQli/jY6wK6nyD3zn6uSPXl+
 70WdKwjJeba/ANsA+pd/o/hgwUTtOQWutHmdgkdAb5BYQAffhBmxehQ+ClFwquCTtIOKESAdjKg
 iPQcEr83zWj88bNbX1oN/5OP1WmEsg4EJ0Vk7uObqczrK/ekzXRbp3PmOZrvM1k5Z5OoxMz4Fky
 8Aaj/6cxEqKd2bhkpLFJGeF8uzLZjG+bx1p4e3wg1In5AmucGd9n0SgVRoLlZ74QWi/1OMSHiFT
 UpqEgKY8e19f05DaaaMMgdSUs4Mjuv250ES1sfpCvyZQAyycUqmLzswGDbW+ZRsEO7rklpX6Gfk
 cQPsaWoo226evDaNjfmSK47cJjHTvO0sTOpj9j/2AK1mHq/PR/M9mSfSG30hrwpkI/iIPh/80ge
 3XHB3YW1VLLfzlbESpUv4tUKSdm/b2GzPEQzy0k0xD/NvZibsUkBVmDSghcCDFtMMWWQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_045831_393002_5DDCDCEA 
X-CRM114-Status: GOOD (  11.69  )
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

Export custom function to add gpio pin range from pinctrl
subsystem. This would make it possible to add pins to multi
gpio chips.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/gpio/gpiolib-of.c   | 5 ++++-
 include/linux/gpio/driver.h | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2e537ee979f3e2b6e8d5f86f3e121a66f2a8e083..64c8a153b823d65faebed9c4cd87952359b42765 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1170,7 +1170,10 @@ int of_gpiochip_add(struct gpio_chip *chip)
 	if (chip->of_gpio_n_cells > MAX_PHANDLE_ARGS)
 		return -EINVAL;
 
-	ret = of_gpiochip_add_pin_range(chip);
+	if (!chip->of_add_pin_range)
+		chip->of_add_pin_range = of_gpiochip_add_pin_range;
+
+	ret = chip->of_add_pin_range(chip);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..a7b966c78a2f62075fb7804f6e96028564dda161 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -528,6 +528,13 @@ struct gpio_chip {
 	 */
 	int (*of_xlate)(struct gpio_chip *gc,
 			const struct of_phandle_args *gpiospec, u32 *flags);
+
+	/**
+	 * @of_add_pin_range:
+	 *
+	 * Callback to add pin ranges from pinctrl
+	 */
+	int (*of_add_pin_range)(struct gpio_chip *chip);
 #endif /* CONFIG_OF_GPIO */
 };
 

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
