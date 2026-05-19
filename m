Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADBCCD5BA3
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tO4Ski9B1SfTaelRt+vj7xh7Sa3QMjk1RAPOrxxBUys=; b=sAs3N+P3S8v5ts
	i6FuO8UXOOzcjxiCGILqndgGNt2gaFD0VeA7X3Q/payO2vgxyOUuoMsgfcqbSJ+GYlaW7dORuk9fi
	AvKsj0+6W03dE/oIreV7cjhb9gTQQKubyI2K02GG3s+zQ1rhEafRfL8eBP3dhc2+06MKe9LMV0C6s
	3Z2qtllp++aqbGU3drNRAQ2H0F20K/wv6T/qVgYO+hf0M/l9R/jXb6K87043S4KIuCi3ijuJ2n+HX
	AnNndzFdoE1RIwnNeZlFRwJlb8mPhRgNX19NGM9jTdv+C8WbWTXDnNi2vyzR8IfgpkbeSxaM+NgDE
	szmhC51WQl0PP20uIl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtN-00000000x0I-30Zh;
	Tue, 19 May 2026 09:37:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtL-00000000wyA-0ZXV
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 09:37:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D929C43914;
	Tue, 19 May 2026 09:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30DBC2BCB3;
	Tue, 19 May 2026 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183454;
	bh=xE0yM6A77psZsLR6G5jWJtzbeOJz9NLGG0dttBDqrrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A5R4J9RGWZrtC+CDtgo1UQygPvsSfAnVrI4nkqLzvtvP4JC2DNGad4E6ZEZPIu00g
	 WoMia1+XVWrtrha+EDztMWJviWsEhdU2SADjzmxcrlkTceEeI9eO9/Jy+h2JrfREOy
	 2bVYQ+KzW+6hRvgI//WkZcJRKfV2qI2sBJg0Hm41Nmd4GEPbloIfvgHxEPuLXCxrwB
	 jN10QHpucT/rlb4VYaCLZxOkjqUg/nDJJQWL4EabYDuERC12M/4jVAbDhvMnEr1GlO
	 bH2l1mVjI8ZiGm0Am/ZAOHZPb7+ifh4mvXQwsmohCrpCY5UJoTi1kLIqtlig0TmpBQ
	 sLLK5jthnoa1g==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v2 3/4] pinctrl: spacemit: delete spacemit_pctrl_check_power()
Date: Tue, 19 May 2026 10:37:24 +0100
Message-ID: <20260519-absinthe-undercook-95dcc685e90e@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519-germinate-ageless-631033d22797@spud>
References: <20260519-germinate-ageless-631033d22797@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=nbzbm22qq7GdIPOZjV8ZHzX0ozzp95ML+4OpjtQggdc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFk8+sHGU3iyJrnkC3+a0tQp5SR4+rtVmljCz+NG0dl9W pxrdN93lLIwiHExyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCLenxn+6T4/LqVoo3Py1bRt n3ayPJ8xUbL81KvNGf0t2ZGqvt4C/owMb9fKyM6R4S85E/Hr3NtZM5XjC7WlvkoJJ+5r3OYwk4m ZAQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_023735_242763_6DC59F8D 
X-CRM114-Status: GOOD (  12.17  )
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

From: Conor Dooley <conor.dooley@microchip.com>

As far as I can tell spacemit_pctrl_check_power(), called during the
custom implementation of dt_node_to_map, is redundant because
the driver's implementation generate_config performs the check too.
Removing this would allow the driver to use the newly added common
function pinctrl_generic_pinmux_dt_node_to_map().

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 37 ---------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index b0be62b1c8161..95c891c4c8fb4 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -409,38 +409,6 @@ static inline u32 spacemit_get_drive_strength_mA(enum spacemit_pin_io_type type,
 	}
 }
 
-static int spacemit_pctrl_check_power(struct pinctrl_dev *pctldev,
-				      struct device_node *dn,
-				      struct spacemit_pin_mux_config *pinmuxs,
-				      int num_pins, const char *grpname)
-{
-	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct device *dev = pctrl->dev;
-	enum spacemit_pin_io_type type;
-	u32 power = 0, i;
-
-	of_property_read_u32(dn, "power-source", &power);
-
-	for (i = 0; i < num_pins; i++) {
-		type = spacemit_to_pin_io_type(pinmuxs[i].pin);
-
-		if (type != IO_TYPE_EXTERNAL)
-			continue;
-
-		switch (power) {
-		case PIN_POWER_STATE_1V8:
-		case PIN_POWER_STATE_3V3:
-			break;
-		default:
-			dev_err(dev, "group %s has unsupported power\n",
-				grpname);
-			return -ENOTSUPP;
-		}
-	}
-
-	return 0;
-}
-
 static void spacemit_set_io_pwr_domain(struct spacemit_pinctrl *pctrl,
 				      const struct spacemit_pin *spin,
 				      const enum spacemit_pin_io_type type)
@@ -548,11 +516,6 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				return dev_err_probe(dev, -ENODEV, "failed to get pin %d\n", pins[i]);
 		}
 
-		ret = spacemit_pctrl_check_power(pctldev, child, pinmuxs,
-						 npins, grpname);
-		if (ret < 0)
-			return ret;
-
 		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
 		map[nmaps].data.mux.function = np->name;
 		map[nmaps].data.mux.group = grpname;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
