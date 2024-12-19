Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5DBE7718A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 07:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u3CXIJ3v4THbsan1pgOEbM+Wbrx0Fdkc4LYCavSQGfs=; b=Tj+Rg8hZ6fsRYv
	t8mCPa4o025h643zzAT2j/z2urlq424alzayPNTt9SFB18O1ywhXX2s96vIlIgaIUnPcNUqjJYno9
	Wf3mJEGqAoBdO5Mpcoef0n2TF8NPhBxXbHKgVKXimaeKw1n8qmobwoMAlvcb34Q1E4wWuh1IMkVK7
	cB34QqpQ3zOkKiYKsXVLAV14EZ6hZaI1cO+UanjZP7skPK0aCWv+n0+1ebRCJWzejoGYYAHzwdCdE
	W6OFZZ+uMwahfXTLLfHUeydvDChS9W2VgbMvc6DGzaYIqrm2V5zUHT8G0pIRpua6j1BYYee7IOEUQ
	QL1dCnAfP5BAkYYeoEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAnm-000000013cE-1IsH;
	Thu, 19 Dec 2024 07:18:30 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAnj-000000013bQ-3Frl
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 07:18:29 +0000
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/3] riscv: spacemit: add gpio support for K1 SoC
Date: Thu, 19 Dec 2024 15:17:42 +0800
Message-Id: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJfIY2cC/02Qy27DIBBFf8ViXaqZwe9V/6PKAvDgoDbGxdRKF
 Pnfi51IzezuSPfMgbtYOHpeRF/cReTVLz5MOdBbIexZTyNLP+QsCKiElloJSn6hHGcfZI3GdeQ
 6UGRFLsyRnb8esM/TI0f++c3M9Fj+I/OFHVhTvdMApdGLt3JIErVWyMzGDtSvlXgVebYayBq0F
 2c/2RS/pdJkgC0qBHyWMpClDZeLT33RtEPpVMmEWJkKG2ON44YtDICtyVO7zoBpxa599ksK8XZ
 8yYqH93G2g/L19Wv2ljU0xIbZaoaPkacUwnuIozht2/YHkExudFwBAAA=
X-Change-ID: 20240828-03-k1-gpio-61bf92f9032c
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3611; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=cSy/0z4rfqplmc3CfVSYLZJxU/ISPa5X+jCAM6Rw9tE=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnY8iu1SI5F458BZDzsrLZY31MViz4vVG5jad+H
 d25lBaDkC6JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ2PIrl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UGND/0eGR5E20nhJs1p7j
 QykABAAfgoIOw3iOtI1+89p1Sag28+TTD4M/dKt4zPgev4rK+RQMqo3SKxai7qNzAefveaS0J8w
 3zT4iEUBVmkSL7dUYW+5RxD8wcoYOPZbaEMLQ9jnmsoOM/D7PvekAnNKj2ZMZte+gxbpmnhaP2t
 aHs4BAOMt97yFOciIBowztZuGQvCpPhQqZiBc3jtJoGpQ3xHjvTPxiE0mmPc+N/hYhXVq+1qVq+
 hXAuVGwFuDU7Rz8PnQuEKhtTqCtOOOK6zxraK/P8ZbN2KUhzeIz4Cb+qdspparTN73OplUIAukJ
 NyN38da9HJr6u5G5oJHfQAX2IQ6gcxgdFB4v0LcZUXkHecZqrS3CvDNN6n+2ViTzyT4r+kSxmYE
 pPsNFYFJxCDf1iduSbAg0sCIctTg8nrUUAVLItNhKtLBgOrU81K8PvWkbSrfUL4zuBtuX46jqqE
 MNg1zx/vP7Q6mUayY6dSN7qIzlSK1P663Jx9kGm6ElVHI8/h3UC/mSRmQZwdoscPxchEEaKTyOb
 PfnYDpVxeoPJpY282gFqo8dtxCT2+pf9lxjuxFgDM0+QGym8NXShFqwd/u+PFzIY/LARzR70X5a
 UjkeQC76rhMFvKwsU3/bLSDeE/lydoJAmuNbWg3Wvo4SjzxoS0h8qP92udFYkH1+mIcg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_231827_843482_C55D81F5 
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
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
Changes in v2:
- address dt-bindings comments, simplify example
- rebase to 6.13-rc3 
- Link to v1: https://lore.kernel.org/r/20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org

---
Yixun Lan (3):
      dt-bindings: gpio: spacemit: add support for K1 SoC
      gpio: spacemit: add support for K1 SoC
      riscv: dts: spacemit: add gpio support for K1 SoC

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |  75 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  13 +
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-spacemit-k1.c                    | 454 +++++++++++++++++++++
 5 files changed, 550 insertions(+)
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
