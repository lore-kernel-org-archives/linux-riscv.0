Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8993C54EE3
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YrgTUIt5r1GYcsO3KlZZm9aPTO8kURM8q+ctJ9tQcnI=; b=fhisNBpoUITtwj
	3ATESF9OM0axCQnNTGq2uOD19c96AxqGfEOlwRnLwCOAfItfghRAYoL0YxNFaYFcXShazXrctZos6
	GsPrTGlHYNP3Z+cEmROG8sB/91CuZYs+DlnlxEcqz8QM6SwoIsNVTkV2jvuSDUubWUfWjpFr3wM5/
	nQX5GbuXA4TAFbVMXWBnnFRu1y1GJ4/6z6XG1EE5gXROwbgskPKoyAb+T5SuiRUn44PdHIsT0NPkU
	fuEoZZEj3SWoT9wQoPR2FKddqqpucVc7CcFjIkRyhA4fyFBbHs484BbPSxheR9vVKwbJjztYnSTIm
	I6795A5yGDXqChpo9VHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjGtW-0000000F9T4-09so;
	Wed, 28 Aug 2024 11:31:22 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjGtT-0000000F9S1-0WTG
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 11:31:20 +0000
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/4] riscv: spacemit: add pinctrl support to K1 SoC
Date: Wed, 28 Aug 2024 11:30:22 +0000
Message-Id: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE4Kz2YC/12Py27DIBBFf8ViXSqYMWB71f+ouuAxTlAbk2Bqt
 Yr878X2ImqWd0bn6N47mylHmtnQ3FmmJc4xTTXgS8P82U4n4jHUzEBAK4zouAD+Kfk1Tr7kL44
 WnCAvUQrJKnPNNMaf3ff+ceRMt++qLcfxYR2a3alBb0IhubNz9DwULq1FSUTOBxgWtXnrj7hPl
 0ssQ6McaRy97EdvbesBtUNhWhBth8p0Vum+0xYN2xqc41xS/t0HLnKvcGyR/dOWpbbggL31yhk
 Tgn470VRSek35tKsWeOAdqGccKh5CwM5iq4KEf/i6rn85y2uRbAEAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3376; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=S82pj7/LnMee3BQCJ5bCioZD5gySulDDB5Qfb87H/8g=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmzwpx90hthoqlbewjr0x1+YGOrdXZGs4OZD5kH
 JdX0PlXM8eJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZs8KcV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277XiYD/9HdnJJ9Dd/nf6ojN
 qtttuq+SLLJCcBSo8wsAHBpfsLibZTx4lVRL7lAcYdCmt/3m+lfQWS4oN8nOkJ0CQ43CWtSxKmR
 oTOvqXekhjqOootQNmvBTWTic/e4JZSm0CrS3PfRdsjGQ6sZ70BJuUKtt+Xwg6Gtigd2YJKUdy3
 WpOD7d+8JWgCMOrVzSrQ2KvfcUEseh34XGKCdD2bDPEy+JH83szzfZQvGY8qsn7JchjS/BeuaKL
 52nWup/EwCcWACtMSCnxj+WG0bAddNffQWs1NLOuaf4kyrmYOZKEoZ2W2wVtY0gS5TcgfEnvocI
 aDtHxIZKfTH2WRXwwskCWRXcf0zRNQIBg7lBQUgNWoqnqhTXnVNxpC3pE/oeNc520xCK74s0wON
 5YvuawWqQ+OJb4SfMKKhif9c8/eCkCg4Gooe8dRts3Bn+RZxXHaJCyAcOcijxgVG/JHP+cVvfI+
 pToQLtKYqYq8Lx8qlSYVlQCshcoB4unAMFlP3CfHaATBiXZm83tY7jQsxgJBhfkob9LIVIKg28Y
 tg3t6LJcBUIJu9R4PscK4KSp37G3aSfaVcfsj7BJPBgNlDlPUWqHM/kkB0ehBkrn2NNk5fnaPkZ
 kQRKJP74+stHm6YkZ4t/oz07DQpREgI5hesiQ0g34qOYKxPPpgM19LbMfTldz23LnxQg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_043119_223382_0639DFE2 
X-CRM114-Status: UNSURE (   9.34  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds pinctrl support to SpacemiT's K1 SoC, the controller
uses a single register to describe all pin functions, including
bias pull up/down, drive strength, schmitter trigger, slew rate,
strong pull-up, mux mode. Later, we complete the pinctrl property of
uart device for the Bananapi-F3 board.

The pinctrl docs of K1 can be found here[1], and dts data of this series
are largely converted from vendor's code[2].

Note, we rewrite this series as an independent pinctrl driver for K1 SoC,
which mean it does not use pinctrl-single driver as the model anymore,
see the suggestion from Krzysztof at [3].

Link: https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned [1]
Link: https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x_pinctrl.dtsi [2]
Link: https://lore.kernel.org/all/b7a01cba-9f68-4a6f-9795-b9103ee81d8b@kernel.org/ [3]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
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
Yixun Lan (4):
      dt-bindings: pinctrl: spacemit: add support for K1 SoC
      pinctrl: spacemit: add support for SpacemiT K1 SoC
      riscv: dts: spacemit: add pinctrl support for K1 SoC
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 127 +++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   3 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  19 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.h          | 161 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |   5 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/spacemit/Kconfig                   |  17 +
 drivers/pinctrl/spacemit/Makefile                  |   3 +
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 978 +++++++++++++++++++++
 drivers/pinctrl/spacemit/pinctrl-k1.h              | 180 ++++
 11 files changed, 1495 insertions(+)
---
base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
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
