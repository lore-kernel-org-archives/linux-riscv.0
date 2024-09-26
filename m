Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5644DCDE01B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5MgoJZcp/AJSQAMDWcUvyEzLfK7VXyQjQ/JxzARYueU=; b=sVUOfhvh/QnB/F
	UaNEb3u9c+vzOPUsDwdLS6HIHducxLYelRIKlAXN7V0/v/2dr822bySPQSDxU75DSNQT/3k7iLgYM
	ZOkn0QaXfUOBfArOI/ZCatCucjJGlziv/pBw8iUwqfrYQRwbjOFPwTvb+YAA54rNO9kkIHNYAwWsD
	Gsk0EUGdC6o2lifglj4zSI/sOpUu5wLJBa/v1nw/7ERcfOD5z0b/aeLpB9TKARRzhR4hhaTDH15VM
	tAHibw88CRItR1O/tkIKB8UhZkH8343YIRuBjLnh6DWK7qkHjY3BHfTR/XGz5xI9JVw8tjlqbPzSE
	N9rI22kPUSHSqTbgUoEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqsm-00000008oZr-4BiQ;
	Thu, 26 Sep 2024 15:58:21 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqsk-00000008oYk-0FnV
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 15:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=KWDkrjoA6/ykzZxErd71KJi/pEVk7YvEBlCsaqgAFKM=;
	b=PkBXIQ5zu92i0OEw8adPlMF+Ud/z15PUZAcQIUxpQw0zuTrwxCICTJUxBvkspu
	yPRElNL9gwbQvBlcEDgaJ0YV09IqY6m1NBGHDreVp4AlrE8IGUrKD48g8/k/hqkV
	9cQ1vatY22Qfrx0icLtX7D+WsPJUqAdtKiuTl7ikbDP1o=
Received: from [127.0.0.1] (unknown [27.18.107.33])
	by gzsmtp3 (Coremail) with SMTP id sigvCgBHA3OFhPVmTIX3AA--.42449S2;
	Thu, 26 Sep 2024 23:57:57 +0800 (CST)
From: Ze Huang <18771902331@163.com>
Subject: [PATCH v2 0/3] Add initial support for Canaan Kendryte K230
 pinctrl
Date: Thu, 26 Sep 2024 23:57:42 +0800
Message-Id: <20240926-k230-pinctrl-v2-0-a9a36fba4b34@163.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHeE9WYC/yWO0W4CIRREf2XDczFwYQU2TVOx3Z9oTINwbYkuu
 oCNifHfpfp4JpkzcyUFc8RChu5KMv7FEo+pAbx0xP+69IM0hsYEGEhmQNA9CEZPMfmaD1Q4AWI
 bVO8UklY5ZdzFy0P3tXlyxvncrPUZkq0rSP1xmmIdOobojFZMawcQlAiao1nqgEpI5YNX2Bu5U
 /CvnrAU97gzdK8Vk8dUvwHsiknorfwY+XrFFRd2CZ9SglhzO9pRM/M+z4s2+EY2t9sdQpfY8e8
 AAAA=
X-Change-ID: 20240923-k230-pinctrl-3a323bd75a7e
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ze Huang <18771902331@163.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727366277; l=2748;
 i=18771902331@163.com; s=20240926; h=from:subject:message-id;
 bh=Z74RK6GDCBvqMvBn80RCm+M97q5yuOtMvrMvDAcm1wE=;
 b=RiVDUFaEWj4AaVpU1CxiOgApYCNY08NOdG4SO0RuHdUkQ0OkbPPblamkd5lVL6sXcCtc9mk+j
 39RFaDcgePpCI5z7QNAxg6r0MfKSMzfLhD7xOAQnQnuHwNPNIWFi4In
X-Developer-Key: i=18771902331@163.com; a=ed25519;
 pk=M4cXLTlQ3syp0aIw4PNbFtajcroq/y7WBxK2F/jsUWI=
X-CM-TRANSID: sigvCgBHA3OFhPVmTIX3AA--.42449S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGry5uF48uw1kArW7Gw48WFg_yoW5Xw15pa
	yakFZxCr1rJr4xtrWS9r4jkryaq3Z5Jr1Yg3W3K34DXF45uryDtws3Kr42qrWDGr4ayrWY
	vr4DJryxur17ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piPCztUUUUU=
X-Originating-IP: [27.18.107.33]
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiJw1momb1fqM32QAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_085818_439898_B04C8925 
X-CRM114-Status: GOOD (  10.92  )
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

This patch series introduces support for the pinctrl driver of the Canaan
K230 SoC. The K230 SoC features 64 IO pins, each of which can be configured
for up to five different functions.

The controller manages the entire pin configuration and multiplexing
through a single register, which control features such as schmitt trigger,
drive strength, bias pull-up/down, input/output enable, power source, and
mux mode.

The changes have been tested on CanMV-K230-V1.1 board.

The pin function definition can be found here [1], and most of the DTS data
was converted from the vendor's code [2].

Changes since v1:
- bindings: drop unecessary ref and drop unused labels in dt example
- driver: set remap_config to const
- driver: fix double free of of_node_put
- driver: move probe-related code closer to the probe() function
- driver: drop unlikely MMIO error message and handle correctly minor errors
- driver: replace `for_each_child_of_node` with `for_each_child_of_node_scoped`
- dts: place pinctrl nodes in canmv board level file

Link to v1: https://lore.kernel.org/linux-riscv/20240916063021.311721-1-18771902331@163.com/

Link: https://developer.canaan-creative.com/k230/dev/_downloads/a53655a81951bc8a440ae647be286e75/K230_PINOUT_V1.1_20230321.xlsx [1]
Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/uboot/arch/riscv/dts/k230_canmv.dts [2]

Signed-off-by: Ze Huang <18771902331@163.com>
---
Ze Huang (3):
      dt-bindings: pinctrl: Add support for canaan,k230 SoC
      pinctrl: canaan: Add support for k230 SoC
      riscv: dts: canaan: Add k230's pinctrl node

 .../bindings/pinctrl/canaan,k230-pinctrl.yaml      | 127 ++++
 arch/riscv/boot/dts/canaan/k230-canmv.dts          | 304 ++++++++++
 arch/riscv/boot/dts/canaan/k230-pinctrl.h          |  18 +
 arch/riscv/boot/dts/canaan/k230.dtsi               |   6 +
 drivers/pinctrl/Kconfig                            |  10 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-k230.c                     | 643 +++++++++++++++++++++
 7 files changed, 1109 insertions(+)
---
base-commit: 0eea987088a22d73d81e968de7347cdc7e594f72
change-id: 20240923-k230-pinctrl-3a323bd75a7e
prerequisite-message-id: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
prerequisite-patch-id: 704efc6e76814e1877748959d7319d558c8386c1
prerequisite-patch-id: c2144cf468c57b856830a61615ba6ba501e8ec58
prerequisite-patch-id: ced4a01ccd8ddab2fd308d543ddf47bd1641518a
prerequisite-patch-id: f8b983b301d0c14f1448b9e4c321262a509e061e
prerequisite-patch-id: 834b65b6a2b037daed5cffc6a41963622568dc9c
prerequisite-patch-id: 2401703b57448c9ea2c3dc7650b4502491a28944

Best regards,
-- 
Ze Huang <18771902331@163.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
