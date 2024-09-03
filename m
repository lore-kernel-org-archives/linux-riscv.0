Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1B6CD3420
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NENYRoM4BPrVIFC3kdjdOCkh2w46YO79alM6Nk4B8d8=; b=HpSRNU/8UimmOd
	EdedcyPrD2vJqLY7XweHI+JzAZAEuJXdwKdG+BAi/XbQ6vLsUM+jo55gUKycVWSiH7F/zqswsD4SR
	e+nMByUXcYlSRTz1jBqA+gjblL6+8hVQ1fhjt9wQZc9O7XrFSQ4zBP0Siia+PLeo4/ZmJ5rwn+dbD
	NmyXJOzUE3KbFU5266qHPVzJjNJGH8//guo8F0iHeV4JsLm4qMcFs89ejQlgdt1VXSbY/QyeHYqvV
	1icOn6a+9ev+NgzzuykhqRMT3yBtzU15ZxnnCWkBZl34FMDDgAKDUZsxfbqcBc6Ivp6mqSKMlGAzO
	nvQ3IcXz7gIy1YTtpQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slScy-000000009CI-0d5D;
	Tue, 03 Sep 2024 12:27:20 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slScv-000000009AH-18cT
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 12:27:18 +0000
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v4 0/3] riscv: spacemit: add pinctrl support to K1 SoC
Date: Tue, 03 Sep 2024 12:26:43 +0000
Message-Id: <20240903-02-k1-pinctrl-v4-0-d76c00a33b2b@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIMA12YC/2WQy26DMBBFfwV5XVeesTGGVf+j6sKPIbHa4MRQ1
 Cri32tgkZYur61zdO/c2Ug50si66s4yzXGMaShBPVXMn+1wIh5DyQwFKtEIwwXyd+DXOPgpf3B
 p0QnyIEEAK8w1Ux+/Nt/r254z3T6LdtofH9au2pwa9SoUwJ0do+dh4mCtBCJyPmA316u3/BH36
 XKJUyknwYNWmqA32rWq7a3Upqbe18JpLUpSHp1ma4NzHKeUv7eBM2wV9i3QHrbMpQVH2Vpfu6Y
 JQb+caJhSek75tKlmfOAG6yOOBQ8hSGOlqgPgP1z+xo+XnGXBoaegLaKj1vzBl2X5AUf6Bp6rA
 QAA
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3473; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Pwn7mZql+l/6H4k0w9z5e/b4dnAhIH+ZWTPs4Uj3+QA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBm1wCR/7ec9bZkLiJChSs3C4x3sOWCBlX9YlyEs
 qb4AQXB4W2JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZtcAkV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277baEEACAMkwr8T+fb5zT2q
 9/PaffoJvsSbmWyeZZyFewVkWBu976EVHwAm6thC2+/KfusEyEBQJg78VPk+ff90EQs4Iv76CUZ
 /ghU+6OLa+o6bOW1sgimJSmyUCTduCSdZHO//Zrtw0II2hSwZ1aBNyfYcmB8pdEgUXG8xdnOF+c
 SQHLwHHK5nZOpPz7sTtoUj7EgXZiGu7lGT8S4F0giOXYAHl+2Gtx/2LsNqR5y12EC7xNjZgHBte
 el1yHTSTx3k91ifjwpuwrvvDF5SVTHwjWsg7/TPf5r1b6ceNiJz4uWrYvSLgJZzjkS5XmQFj3SZ
 CVJkhMwAR9b2pN9aZifQBjIBcj6ZgzyasQVsKbk7bbdsvnFz+fV5TIOA922pB0TiRNDGBCkMA3e
 8dzFuotCNqD9h34d6QOVbdxFq8jRyEbVcxLQfHRJPvfPso50uYauBVnOsjPQgQIGIssPRSs5agj
 dZ5XQbI4lR0MMg4BRvBZWwPVPKL203WxA3MtqQoLg58JymB7bkgHQaN0kxypq5trqXx60BZJ2xE
 /G2TQl/8Yv7IwxXuvmiuqcLZQ/CyDnrtcIDGCS0WOTU7KSEKIGp4bzU1NBUNUMsZT7NooeyQti4
 rywIXjY3kROtXx9AgC1zUXt/O7LoMfcfPugqEip/r1af+hduOrtUSW8+r0l8m8LLNgTw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_052717_377289_DA363CC7 
X-CRM114-Status: UNSURE (   9.59  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Meng Zhang <kevin.z.m@hotmail.com>, Jisheng Zhang <jszhang@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
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
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 1078 ++++++++++++++++++++
 drivers/pinctrl/spacemit/pinctrl-k1.h              |   40 +
 10 files changed, 1292 insertions(+)
---
base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
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
