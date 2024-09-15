Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC27C35FE4
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 14:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=klPN9FzymcJM+IMaCZevgKEiyGxAV4v5e4+On1/D8J4=; b=iu+PsjL0q60luv
	w7pcWUiaP9cf9zn1cQ8dpzIMS1fg+XnlGa5rvFkmNBPq79Z/bAxQBXD8nlTQI8tvHaBLTJfS6BaRV
	cV1FHz66yiOBxLnjHfFUXa+jxSRlSvLHQNY74sCtiZOacoyHED3RE0ozMiksu2otwP5OD3PYtDmpW
	r10+LwU7lA3eYnY/FDFvk8jAee+msbvFcZijjk5sG/wfE4TV58xc3/sc02EBOPuTp+8uuN1cQPN17
	Rf5PyeC0PLMNBp+T52i0u7LaHyobH1HQwmvMF7D1ghxAILvFvJ/dJI8lGSpsMSozf/vIzW2+VnNGq
	j8MUMZ1ZE03LkOXwcNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spq9n-00000002BqD-0SxF;
	Sun, 15 Sep 2024 14:23:19 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spq9j-00000002BpL-1tS2
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 14:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TKFcsOdhek0MQQPDbf+d7h1KvB9ASf45xqz2FA0Pvtw=;
	b=kxEeo9F9quII4RERyftAooA6a1sJkTQAfSl47OAWc36+x1KG7EvXN/TjrEUBP7
	bf/hsr7c1j7Yz+D7G6UyCJlKSHHai1bg9GwaXIjDoij1ngUkT4ztAYBm0CtCLpeU
	thNnP0IzmpplGkfIwfSukHaEufUb4n89D0g6KnkbHv4O8=
Received: from localhost (unknown [27.18.168.209])
	by gzga-smtp-mta-g3-0 (Coremail) with SMTP id _____wAnblZk7eZmaNI2Aw--.11240S2;
	Sun, 15 Sep 2024 22:21:24 +0800 (CST)
Date: Sun, 15 Sep 2024 22:21:24 +0800
From: Ze Huang <18771902331@163.com>
To: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, conor@kernel.org
Subject: [PATCH 0/3] Add initial support for Canaan Kendryte K230 pinctrl
Message-ID: <ZubtZKlxqejnCFx_@jean.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CM-TRANSID: _____wAnblZk7eZmaNI2Aw--.11240S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFW3uFyxWrW8WFWrCr18AFb_yoW8AF1Upa
	13CF9xGrnrGr4SkrWft3Wv9ry3Can7Jr1Y93Way3srXF43ZFyqywnxKrW5Xw4DGr47Z3yY
	9r4rtry8Wr15AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziU5r7UUUUU=
X-Originating-IP: [27.18.168.209]
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiNxxbomXAnRCLnwAEsq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_072315_942714_FE7B27E9 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: 18771902331@163.com, devicetree@vger.kernel.org, dlan@gentoo.org, zhangmeng.kevin@spacemit.com, linux-kernel@vger.kernel.org, jesse@rivosinc.com, cyy@cyyself.name, inochiama@outlook.com, jszhang@kernel.org, kevin.z.m@hotmail.com, linux-riscv@lists.infradead.org
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

The changes have been tested on the K230 development board.
							
The pin function definition can be found here [1], and most of the DTS data
was converted from the vendor's code [2].

Link: https://developer.canaan-creative.com/k230/dev/_downloads/a53655a81951bc8a440ae647be286e75/K230_PINOUT_V1.1_20230321.xlsx [1]
Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/uboot/arch/riscv/dts/k230_canmv.dts [2]

Ze Huang (3):
  dt-bindings: pinctrl: Add support for canaan,k230 SoC
  pinctrl: canaan: Add support for k230 SoC
  riscv: dts: canaan: Add k230's pinctrl node

 .../bindings/pinctrl/canaan,k230-pinctrl.yaml | 128 ++++
 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi  | 318 +++++++++
 arch/riscv/boot/dts/canaan/k230-pinctrl.h     |  18 +
 arch/riscv/boot/dts/canaan/k230.dtsi          |   2 +
 drivers/pinctrl/Kconfig                       |  10 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-k230.c                | 674 ++++++++++++++++++
 7 files changed, 1151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
 create mode 100644 drivers/pinctrl/pinctrl-k230.c

-- 
2.46.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
