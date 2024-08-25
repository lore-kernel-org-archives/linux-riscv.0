Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6AEC5321E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V3n90Og6t2EMd0wTDIDMyZBANJQqmWcEZp8lxIA369I=; b=WGCsgWj7HeGjCF
	vCtTMiUgbKSVRBBn9QdsYEtXBCZxQhRIQNAR8nvjWhZiRYa41yaONReLnHj+LX5OtMQP9ejdAEYd9
	F3/nqFSi2xcKAT31OoX8BbKyM+zgToXC4TMffkZfMY/xADXEwmYx+X9dIRQF44Csu1F2bvoJHoOUs
	KrFCfdO5T9futolt1IZUWJsGJE+M6NZTsmOM/6mR3mfUAHeMzkVVU1rmuzrlDvqRKqGsg8nuEDihT
	H7pS6S2+8HSmYF2qzznnvxvMjHfgFbLKpQt3W1Zr+iTnyW8ueHHl6wsR9eAUAvwTydeH50Ph3EoKW
	3+dehAMsFYZUqSCKSEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siD17-00000004MCj-3V0D;
	Sun, 25 Aug 2024 13:10:49 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siD13-00000004MBw-3iY0
	for linux-riscv@lists.infradead.org;
	Sun, 25 Aug 2024 13:10:48 +0000
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/4] riscv: spacemit: add pinctrl support to K1 SoC
Date: Sun, 25 Aug 2024 13:10:01 +0000
Message-Id: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACkty2YC/12Py26EMAxFfwVlXVdxAgmw6n9Us8jDMFE7ZCZJU
 asR/94Ai0pdXls+PvfJMqVAmY3NkyVaQw5xqUG8NMxdzTITBF8zE1y0XPMeuIAPhHtYXEmfII2
 wnBxK5MjqzT3RFL4P3vvlzIkeXxVbzuEftT7ZmUqoHcgRrMnBgS+AxkgkIuu8GNdu59YdgYu3W
 yhj01lScnI4TM6Y1gmprOS6FbztZad706mhV0ZqthtcQy4x/RwFVzwUzi44/OuyVgsQcjCus1p
 7r95mWkqMrzHN7LJt2y8RxdaHLQEAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3078; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Mb2l/czd6BaayP/ofbPCL9dm1Wu0Kio9yNMkYFZ5ohQ=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmyy0+A+C8AVtH97JWOv0N6fm/REYW1Z+2mlBhv
 tWuSBXXD1iJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZsstPl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dyKD/4yb+nUy1tuI3F2DJ
 YEP5LSyuSHjmb6XKB4Nnr9UO6LAjJ6JVq3w3Q69k6CoaGFFzQZ3myWOU2BsfXHP3usJK740EPMc
 JIoPYAihX47pwlTcDgwOAWef8K2HQl8gFYH9oSyj80369W5cxAbCwBO3BWGhEaQhmU5eLBx3Rnh
 nLDAYnn9DvYCRhVDwNNYQAL4tWsd/CcZNsCR2d/ThwEcKHZkQ9YRcsIMbU0GhJFpGOQxAsvLaEj
 2tu9xOhYy6nMNwuT3+f4+4tk4LejJ9EEcxND5O85aTFH+CoseKyfHqRYx7yhZZ58K5Vl41cSAfE
 NNp8JfxJ0v9wmzISAX1XZgFzG8iBBLNdUXl8Rxoxer3pKqNRO6LXeMlXohJlWNIerzj2JiHqmlP
 FWOVJun3tP7xVolgzD7186CJluZLmo35nWXxmuG3nxTr/0vOT/Mc+Vh5Hi6xzfaJGn0B9Et/r6y
 Lx7k4CGSmRyDU06to6if2ptONOsyI2wmU7L0WKeQTEjuQ+s8GyTmncnGf3E1ftYUNinbAYtGRFE
 nNzM5RMH1bw+8tKCVf0MD68g/r9uN/+K5eP/DRJzHgeEOuSB+VMvvulj6fVqmQNXeq0wvlkgyqS
 S0VgblZdwa3MFtGANm57A6ruwAY8B8dl+Eef48OyJrT3GFdd0jnNDMU0+wF36HZsYZ1Q==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_061045_998098_5BB1DD82 
X-CRM114-Status: UNSURE (   8.19  )
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
Changes in v2:
- drop using pinctrl-single driver for K1
- rewite as independent pinctrl driver
- rebase to v6.11-rc5
- Link to v1: https://lore.kernel.org/r/20240719-02-k1-pinctrl-v1-0-239ac5b77dd6@gentoo.org

---
Yixun Lan (4):
      dt-binding: pinctrl: spacemit: add documents for K1 SoC
      pinctrl: spacemit: add support for SpacemiT K1 SoC
      riscv: dts: spacemit: add pinctrl support for K1 SoC
      riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  134 +++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |    3 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   19 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |    5 +
 drivers/pinctrl/Kconfig                            |    1 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/spacemit/Kconfig                   |   17 +
 drivers/pinctrl/spacemit/Makefile                  |    3 +
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 1012 ++++++++++++++++++++
 drivers/pinctrl/spacemit/pinctrl-k1.h              |   36 +
 include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h  |  161 ++++
 11 files changed, 1392 insertions(+)
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
