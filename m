Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A97AC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 18:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpVevrMUfW6Uka9K0eKbht7qDbeF2rai9DYZST8qW50=; b=2/eXuGoNLtibke
	2UPgmsBJjyAB5Kgs3vSn4tFFVcqNaMnwnysaPcxm/XSp3wDoaZ40+JSW4KLDj7kMMQK7vH1aeObsP
	qCdcI0QZvL0YG4zKgGi+H2L2x7K0DkSbnLUM/hg3KWRF7gCJW0z5KXHJF+NDOU1zLQzBGsTifMOCd
	J3Qwe9/rD+e9g1k4M88EOuNgfpxRb2i6lgte8Y2Q/LO1KQ9R/w5kxvdMvZgU0FZ5MkLNkzb1IJ+1H
	j16Hupyf7OHkB/HY/sFHlGPzdhTl0Mx1BZ8Z98AviGTPNb3V5uSdErLx7HswFKRRwFzige2l8elLg
	J9eQmkcCvFdxFnKAu83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBepS-0000000G29j-1x2J;
	Mon, 27 May 2024 18:12:14 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBepO-0000000G294-3niW
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 18:12:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECA69240002;
	Mon, 27 May 2024 18:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716833526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=84tR/MeWeFcIW4v7f6DJplwGROoeC+MxszrPF8W46tc=;
	b=gbZ8nyH6pTNk7Q6vldoWwK/CoNlpxOkcJiJ5DMsp6UH91YzFPiS8OuNKTpWqe/p6bHhPK4
	4vnED5Twr6ceiP2ABdMkobMY4NBihJG/Mw5UuB4UjF4MtY7WLDOnZOsW4650dt/Vl8N+sh
	qOtKyO09LMhFg1JdHEGvrD1O46UjAYEy8JQYFk7etGuTWpE0t5tYC4jOcQYAfmaGU9l/3f
	XnOEeO58kdR0NbsI993o1UnjSywrJWrEuZGBKsOON+Z8D9OcAt6cqy7ek2XxyuhcbE9Qhp
	XPJlTZaY+ie139w7cTNLtfVAnCG/3NRgfKTX3WOE0ytNxge6BFTyzd0CzQ292w==
Message-ID: <1b1d8d54-5440-40f1-9324-8476ebf4678f@bootlin.com>
Date: Mon, 27 May 2024 20:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] riscv: dts: sophgo: Add LicheeRV Nano board device
 tree
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
 <20240527-sg2002-v1-5-1b6cb38ce8f4@bootlin.com>
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240527-sg2002-v1-5-1b6cb38ce8f4@bootlin.com>
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_111211_260820_EB6F583C 
X-CRM114-Status: GOOD (  13.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 5/27/24 12:28 PM, Thomas Bonnefille wrote:
> LicheeRV Nano [1] is an embedded development platform base on the SOPHGO
> SG2002 chip.
> 
> Add only support for UART.
> 
> Link: https://wiki.sipeed.com/hardware/en/lichee/RV_Nano/1_intro.html
> [1]
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>   arch/riscv/boot/dts/sophgo/Makefile                |  1 +
>   .../boot/dts/sophgo/sg2002-lichee-rv-nano.dts      | 25 ++++++++++++++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 57ad82a61ea6..5759b21805dc 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>...
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-lichee-rv-nano.dts

I'm really sorry, it seems that I made a mistake here with git, the 
device tree should not have an hyphen in its name, I'll send a new 
version soon to correct this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
