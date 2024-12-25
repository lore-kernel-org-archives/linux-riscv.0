Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AD4E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Dec 2024 00:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yeZ35MZUJ+BtyjOSFd1rJ7U5j2a2RqUQt4T2C77Uu6g=; b=U5adDM8Y/GemVA
	A8+nf5YzBzfgEWZCL1QqNxQb1z1ts+sTnC+5Eb9bH/pMJsUga19puCIJ/NoZ/qAu+SZqypoGGqehi
	wChnNHlBXQS57W+fOycSGYqEVO98No8lMceKygxCGbX/D4RUqgrVURwhIH+xRkcPp5ji2lSlXPiaZ
	H31XXupQlBR38JqR85e/TuargGaK6MZG60JupZgDEzJIrWTm4tK0pUX7zRfUtWoNbbAGDjxgMA+Q9
	NDL9dT594tyY51cpYtcAMG9unyV5KucAqQp1l9V8/Zm2EQej0vU4d3oFELKwCuvmMcbiewZr/ppfC
	1zeAja5fOIj4ZAovtWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQFKz-0000000CzdM-0CrC;
	Wed, 25 Dec 2024 00:33:21 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQFKw-0000000Czcv-46zd
	for linux-riscv@lists.infradead.org;
	Wed, 25 Dec 2024 00:33:20 +0000
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/3] riscv: spacemit: add gpio support for K1 SoC
Date: Wed, 25 Dec 2024 08:32:38 +0800
Message-Id: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKdSa2cC/1WQy27EIAxFfyViXSrbkOeq/1F1EcBkUDshJWnUa
 pR/L8mM2hl2F+kcX/siZk6BZ9EVF5F4DXOIYw7qqRD21I8Dy+ByFgSkoaFGgpLvKIcpRFmh8S3
 5FhRZkYEpsQ/fh+z17ZoTf35l53L9/Fd2xSGsqNptgNL0c7DSLRL7XiEzG+uoW0txX+RG1ZBr0
 A5OYbRL+pCqJwNsUSHgDcpCljaez2Hpirpx2ivNhFiaEmtjjeeaLTjAxuRX+daAacRe+xTmJaa
 f4yQrHr2PsS3o++3X3FtWUBMbZtszvAw8LjE+xzQcnpX+WCRsH1jKLDVaa++I0LoHdtu2Xx+J6
 haYAQAA
X-Change-ID: 20240828-03-k1-gpio-61bf92f9032c
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3764; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=cxl3ajAlJqTFZVJYcvm63By6WB5fDAr1GHfv0IxtB/Q=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBna1K64x9Qk83DaIIseh3eAA9yHstXGjOvGDmsK
 pH3yjgh8S2JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ2tSul8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277RahD/9uuI9FpmUE2tmQb/
 Csw7MdmVqGup9rJ8afzNy/hVOdpx05/43R9NJrBjON+PGfwcVJXwxSE2u7BE4eG+CwwAeOGMwSH
 HPmx/kIYpG0OuFnBgEOSLD1ZzCkY8abcvM41/UbHIOkT2JQtjUezkCEaWtlPI0TXyxEBcvJKpks
 dgoD5cGLyzPBzR4p1xsViWXN2n0DQr0zQksIcdT5x2eEigYp+WexiZ94w61peYhaU3CBmvAArdt
 Alo9HuZ8YUgZ/E3WogVfJGGEyq5gESxrFu1Xb/WoXe7VbncUs284z6KRKg/qPS0Wa+73f8T05g+
 GJP1aT3AAYy5B8+p6FOOkzviMW9ekm9FBMSI5G6p+vQYU6BM7TU6YWPPFmWenI4hJres0IzZduQ
 ousCLgQN9avMOQlMlI/bpTbIDhEdb9wTmCUz8ktnQkuxa58ziJ5r3Z565Nk78QhFOjuxf5u9z69
 SkZk7At+v4g0s794eil/vPP45DEJdbvlFLZgneCGYoi6p07jMwl/LKUbmNHBtc494L+0VUUHzac
 tNY5/VRoO8bu2G9rEBQZCWJ9IRyXje9o2sy3SgqZwjuQV0MMpwXV8zjFWiXmposSidV5Obhplw/
 TSVPrSqyK0RbdIMjVN9afTF8T/pyV/qFsLBzj6Xc4fVpn18t2o7kuWD7DHvkbKekSwHw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_163319_060999_0CB0BF1F 
X-CRM114-Status: UNSURE (   9.25  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The gpio controller of K1 support basic GPIO functions,
which capable of enabling as input, output. It can also be used
as GPIO interrupt which able to detect rising edge, falling edge,
or both. There are four GPIO banks, each consisting of 32 pins.

The GPIO driver request the clock source from APBC block,
In this series, I haven't added the clock support, but plan
to fix it after clock driver is implemented/merged.

The GPIO docs of K1 SoC can be found here, chapter 16.4 GPIO [1]

Note, this patch need two prerequisite series, basic dt[2] and pinctrl[3]

This patch series has been tested on Bananapi-F3 board,
with following GPIO cases passed:
 1) gpio input
 2) gpio output - set to high, low
 3) gpio interrupt - rising trigger, falling trigger, both edge trigger

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf [1]
Link: https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org [2]
Link: https://lore.kernel.org/all/20241016-02-k1-pinctrl-v5-0-03d395222e4f@gentoo.org/ [3]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- dt: drop ranges, interrupt-names property
- Link to v2: https://lore.kernel.org/r/20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org

Changes in v2:
- address dt-bindings comments, simplify example
- rebase to 6.13-rc3 
- Link to v1: https://lore.kernel.org/r/20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org

---
Yixun Lan (3):
      dt-bindings: gpio: spacemit: add support for K1 SoC
      gpio: spacemit: add support for K1 SoC
      riscv: dts: spacemit: add gpio support for K1 SoC

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  69 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  12 +
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-spacemit-k1.c                    | 454 +++++++++++++++++++++
 5 files changed, 543 insertions(+)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20240828-03-k1-gpio-61bf92f9032c
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
prerequisite-change-id: 20240708-02-k1-pinctrl-3a2b0ec13101:v5
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
prerequisite-patch-id: 238db182251f2f79a947d16f0112a958d0837878
prerequisite-patch-id: 8c2cff9ceb9d062c91a34a39add45555bff2d545
prerequisite-patch-id: b93bb35db82d199d4d30deefbc34b8413539cf32

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
