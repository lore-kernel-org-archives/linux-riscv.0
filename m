Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657E0C3ABA2
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 15:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQVXEWfF1RJcdHMxae0YFNF+lfcdN/ZNytJ9Yn7FSSI=; b=Xtxqo6M2o0MW07vfGmwJrMK4oA
	U2tTLeD2TajSOpu9p7aKSxycusQKqwqAYQMPyq+9WuB2wiXPPLAEouwKOOjfv82CLfOVW+1WF5QF4
	3AKrJ+Y/UBrjVzZMmYQzhB49uSU1oBO93hm8dS67IaiUogtqoOMjfZaejjXqUyIztqk/c+cHsrCW/
	mzedZgCsF4z4w331+ci4GVVE8LeuTm6QoMPhNN6mA+C5POSYzDcaz8b+8+ZrVK2U5O1H+r/cOD9zR
	OOGlSe34o6KxwsvmmzP7tR+K3/ScgAul3DTZTer8ba0XN1wSp/XrRwWKwiV0hfPqSlgjZ+vFkXsl0
	8wxoDwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spr6D-00000002HZ3-0hGb;
	Sun, 15 Sep 2024 15:23:41 +0000
Received: from mail-8160.188.com ([60.191.81.60])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spr68-00000002HYS-3zik
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 15:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=jhD688CQbLc0SgiirmxYMH+D8GnL0RP+FKCVpC17j0E=;
	b=ia+ggAojH5GWYwIbVcVPtBoqXAMoGSJTBzlomTvN0jfeaLRm2WZ/77TJyakGvs
	URyNede2eGfnPCOw2cMGxyOMWKCy9hEG4ECDlo7+uldvINmyRmJUhTL3pIU4h0nB
	Zv5doD5ZytrYlWNmY/Kw5rUmceJvTwDiwOZp7m6Sd01Dw=
Received: from [10.79.243.159] (unknown [113.57.237.78])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wAHcFio++ZmTyV3Bg--.6237S2;
	Sun, 15 Sep 2024 23:22:17 +0800 (CST)
Message-ID: <320c1fd8-2f8d-414d-a6a5-23280955b9b8@163.com>
Date: Sun, 15 Sep 2024 23:22:16 +0800
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 0/3] Add initial support for Canaan Kendryte K230 pinctrl
To: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, conor@kernel.org
References: <ZubtZKlxqejnCFx_@jean.localdomain>
Content-Language: en-US
From: Ze Huang <18771902331@163.com>
In-Reply-To: <ZubtZKlxqejnCFx_@jean.localdomain>
X-CM-TRANSID: _____wAHcFio++ZmTyV3Bg--.6237S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFWxCry5Jr48Kw4DJw15CFg_yoW8uFW3pa
	yfCrZxCr13Gr4ftFWSy3WDKry3Aan7Jr4Ygw1aq34UXF43ZFyDuwn3KrW5XrWDWr47Xw4j
	9rZ5t348ur15Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UKeHgUUUUU=
X-Originating-IP: [113.57.237.78]
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiNwtbomXAnREu7AAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_082337_644530_7BE21AE2 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: devicetree@vger.kernel.org, dlan@gentoo.org, zhangmeng.kevin@spacemit.com, linux-kernel@vger.kernel.org, jesse@rivosinc.com, cyy@cyyself.name, inochiama@outlook.com, jszhang@kernel.org, kevin.z.m@hotmail.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 9/15/24 10:21 PM, Ze Huang wrote:
> This patch series introduces support for the pinctrl driver of the Canaan
> K230 SoC. The K230 SoC features 64 IO pins, each of which can be configured
> for up to five different functions.
> 							
> The controller manages the entire pin configuration and multiplexing
> through a single register, which control features such as schmitt trigger,
> drive strength, bias pull-up/down, input/output enable, power source, and
> mux mode.
>
> The changes have been tested on the K230 development board.
> 							
> The pin function definition can be found here [1], and most of the DTS data
> was converted from the vendor's code [2].
>
> Link: https://developer.canaan-creative.com/k230/dev/_downloads/a53655a81951bc8a440ae647be286e75/K230_PINOUT_V1.1_20230321.xlsx [1]
> Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/uboot/arch/riscv/dts/k230_canmv.dts [2]
>
> Ze Huang (3):
>    dt-bindings: pinctrl: Add support for canaan,k230 SoC
>    pinctrl: canaan: Add support for k230 SoC
>    riscv: dts: canaan: Add k230's pinctrl node
>
>   .../bindings/pinctrl/canaan,k230-pinctrl.yaml | 128 ++++
>   arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi  | 318 +++++++++
>   arch/riscv/boot/dts/canaan/k230-pinctrl.h     |  18 +
>   arch/riscv/boot/dts/canaan/k230.dtsi          |   2 +
>   drivers/pinctrl/Kconfig                       |  10 +
>   drivers/pinctrl/Makefile                      |   1 +
>   drivers/pinctrl/pinctrl-k230.c                | 674 ++++++++++++++++++
>   7 files changed, 1151 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
>   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>   create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
>   create mode 100644 drivers/pinctrl/pinctrl-k230.c
>

lost base commit and prerequisite patch id here:

base-commit: 0eea987088a22d73d81e968de7347cdc7e594f72
prerequisite-patch-id: 740cbeb9fc3f3e3fd30df4914cd31e9eb148a581
prerequisite-patch-id: b5cc919a7e8e2f852569d5918944dbe4f21e6912
prerequisite-patch-id: 554cb838b7264109437359e88443cc3497ed344c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
