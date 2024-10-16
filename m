Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EA2D20688
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FZ50D5Te46nYKlJ5v5HZsE0OiS98rIas+vjqUwXyyfY=; b=bbdIvmzC6imvYJ
	ZCrn0w1jXreb1WaUCQJNLP0IzqTntcisH3BPcGtBrP4DPwC+GHzqD5xbDb1w1y+0AfAti247tlY61
	+CHyfzCpkzHeYn8n+HorWwfbxNr5tK/PA8mi3CbsTjKpTQU79n25TnqSsAAZPNnerbhDEQG59vYbD
	EsAbgiTOMdzQEpx2xu4jX2SCROXJdCQKbSv4takocvOFdmwTb3u3odsQ4yXKad9Its5RziQT3c+7t
	c0WQFxvHWX7kkWbHPgBJ3GLEdxpoJV/TUMWBRTtfC2iBIJfC02v5sd8UlfZPeZt+PeKUYF8IGCbem
	N+VJ3rcEqSFoFEGc1nHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0sOf-0000000A3b4-0gCQ;
	Wed, 16 Oct 2024 01:00:17 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0sOc-0000000A3Yu-3Rkf
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 01:00:16 +0000
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v5 0/3] riscv: spacemit: add pinctrl support to K1 SoC
Date: Wed, 16 Oct 2024 08:59:40 +0800
Message-Id: <20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPwPD2cC/2WQy26DMBBFfwV5XVee8QPMqv9RdeHHJLHaQGooa
 hXx7zWwoCXLa+sc3+s7GygnGlhb3VmmKQ2p70rQTxULF9ediadYMkOBStSi4QL5O/Bb6sKYP7h
 06AUFkCCAFeaW6ZS+V9/r25YzfX4V7bgd7ta2Wp0GzSIUwL0bUuBx5OCcBCLyIWI76cVb7oiH/
 npNY1s1ZNEGr5UhUhisMxBRnRwZYYQmSxIsSq3Y0uCShrHPP+vACdYK2xawhy1TacFRWhe0r+s
 YzcuZurHvn/t8XlUT7niD+ohjwWOMsnFS6Qj4gMu/+PEnJ1lwOFE0DtGTbR5wteNWyCOultdrE
 4RwUnr0//B5nn8Bn6oYAOoBAAA=
X-Change-ID: 20240708-02-k1-pinctrl-3a2b0ec13101
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3718; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=m1VUI+EZECZcevasXOFd/3h0Gr5jZb+DGduOzbAYbnA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnDxAKDEkO1hSwheR+MyEDdoWYi/VA1UQtVrNEp
 QEJPIeNz/mJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZw8QCl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aEMD/oCwkOX7Sg4hz/jAT
 NhxuO0OMoZtOaimxVnbbmmu47WN5xlrC82n8EJL4Y1aOE/L9PlSNuiwrrjbPH+DIeB38C0rtMhf
 JhTb4b7dLLImJdc9OAcM7Hud0JDIzSDI+sdVWAbM5r9YNGq52sptHMJtJVmei6ZBdFfM9nfTnoI
 OPDiKpVoTM1PIxjQ/+/azPu47602PwBNHQyqs9BaaQlVV2x1k335UeTMfd/8KQ2IP22W4I5+6Di
 LB6sFFUFzwIaHfRpboTm+vynisb+sllD3FbpRcuGX0jQZMhneFgI08yXpgwrMCeM02J9rdtxOeu
 ilE6Z45r3gvjnYoLUXhcnZSFVJroVE5kUIFNZtrMvrlvLnIi/FGOof+X7Ky8Ar7qC3r73d2Jn73
 xlu9Lf+fXkmcFGW28PtzvwVX/vGw1QfWq2bgnnwVPJRcdR1IY1pUOtyw0swHVd2v0pNVfQWZ3ve
 EObktGj0P8Kwy88b5AQ86ZXKPzD9ZILQbV+F1iDtmKGvyM36Ig5Sfz/6lycp+9+iqsFAl3k17mb
 8EHatpXVDhcMZq3/20mcZV00bHM+lt5jLPj98T0WNO1n9ORO2nU/l7mFIxeUMdkt7MDCn+l6pZ5
 7cuCzR51ld2TUUaCXF63q49xXeDvRcb3yy013hxf3GcbZipXAdfuOV2et35HKcBJGO2g==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_180014_935588_28DAAD17 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds pinctrl support to SpacemiT's K1 SoC, the controller
uses a single register to describe all pin functions, including
bias pull up/down, drive strength, schmitter trigger, slew rate,
strong pull-up, mux mode. In patch #3, we add the pinctrl property of
uart device for the Bananapi-F3 board.

You can find the pinctrl docs of K1 here[1], and the original vendor's 
pinctrl dts data here[2].

Note, we rewrite this series as an independent pinctrl driver for K1 SoC,
which means it does not use pinctrl-single driver as the model anymore,
see the suggestion from Krzysztof at [3].

Link: https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned [1]
Link: https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x_pinctrl.dtsi [2]
Link: https://lore.kernel.org/all/b7a01cba-9f68-4a6f-9795-b9103ee81d8b@kernel.org/ [3]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v5:
- drop unused include header files
- convert to xx_of_node_scoped() function
- use u16 type, drop genmask
- use scoped guard lock
- Link to v4: https://lore.kernel.org/r/20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org

Changes in v4:
- squash dts patch (drop patch #3)
- collect review tags
- Patch #2
 - fix pin id mapping
 - improve pinconf debugfs
- Link to v3: https://lore.kernel.org/r/20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org

Changes in v3:
- dt-bindings: drop vendor specific properties, fix format
- rework pinctrl's gpio request function
- fix logic of slew rate & drive strength
- add power-source check
- improve debugfs info
- Link to v2: https://lore.kernel.org/r/20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org

Changes in v2:
- drop using pinctrl-single driver for K1
- rewite as independent pinctrl driver
- rebase to v6.11-rc5
- Link to v1: https://lore.kernel.org/r/20240719-02-k1-pinctrl-v1-0-239ac5b77dd6@gentoo.org

---
Yixun Lan (3):
      dt-bindings: pinctrl: spacemit: add support for K1 SoC
      pinctrl: spacemit: add support for SpacemiT K1 SoC
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  124 +++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |    3 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |    5 +
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/spacemit/Kconfig                   |   17 +
 drivers/pinctrl/spacemit/Makefile                  |    3 +
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 1051 ++++++++++++++++++++
 drivers/pinctrl/spacemit/pinctrl-k1.h              |   40 +
 10 files changed, 1265 insertions(+)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20240708-02-k1-pinctrl-3a2b0ec13101
prerequisite-change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2:v5
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
