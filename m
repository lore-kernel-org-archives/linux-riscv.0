Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9E9C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhnRalkemyIGj+I6kwwZt044Wroe1GL29jJYR4VrtLQ=; b=aLoP1L9pg+LIku
	P2Qi1g6sSbagZz7+Rx6ElNQh92gqjiQvj6TmoSZEkhHBY9p1cu6b3wEoV4LDjRev4c9Sp/nJ2n7nN
	+yQDG+uWnt8sWqXBpyXKqrIaRcw6i0vFWefWb/G2RcMoAyujZHQCsqy5mHuk4L9bqQc5S8Hh+QuBO
	N7Xd7us6cWTJkyGzVBDlfT64Isi93nvKUdg8xidj010AtiUfdat6BMBRpPkUz58TTWBFd3JUOzhU+
	edpe1z42j1VU3xMhnHosGi8keEZdVP+rzvZdHrDthnzm5dL1q8X5CZTY36fWLE7LXLQb3Jn5qOSaY
	lE9oQXvGAPCBsnRbwmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow03v-003o6g-68; Fri, 18 Nov 2022 12:01:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow03s-003o5p-Qv
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 12:01:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 47333B8237F;
	Fri, 18 Nov 2022 12:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA437C433D6;
	Fri, 18 Nov 2022 12:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668772894;
	bh=gHY8oh7bKt9m5LJsvFCMjLzXQtR+VjOph9E0FEYxKbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NPtmoEZ23cwe60TX4GGMt8EKk5ditunPtY2IkkyM3Hmha/8v4AqecsM8Uiyjqc5Tp
	 88Q4VRbKySxZnQbzkRs8zqGWhze60QwDd9wNe/ZSYJQl8Fa1UB6a7bYof5TToe7/E4
	 lri7CcWIZhTUU7rfTA+zaXr83l3rvHQ6Gmb4SRpfTjpxpkY3mavrU+nfA0Ifpw1Trs
	 2mHY6OnIhWsB9BzDICrx55F7YFIPNHjHXPWNXzV1yEybIvqZP5fKe0Rw5803kPe+3R
	 V6beSqI93xmjoibE4sbzlAOgl3ETr4LvWP/64fgGThp0UqGU7QuT1xgbuvn1HJ425W
	 ORNq/O2GTmZpQ==
Date: Fri, 18 Nov 2022 12:01:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Message-ID: <Y3d0GE7msiWGlRcd@spud>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-7-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221118011714.70877-7-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_040137_186918_1E7D7819 
X-CRM114-Status: GOOD (  20.73  )
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

On Fri, Nov 18, 2022 at 09:17:12AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add initial device tree for the JH7110 RISC-V SoC by StarFive
> Technology Ltd.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 437 +++++++++++++++++++++++
>  1 file changed, 437 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110.dtsi
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> new file mode 100644
> index 000000000000..c22e8f1d2640
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -0,0 +1,437 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>

@Emil, I feel like I have to ask given the 2022 date, but should this
stuff be attributed to your canonical address or is this fine?

Other than that, a cursory check /looks/ fine, other than the:

> +       gmac0_rgmii_rxin: gmac0_rgmii_rxin {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };

If you remove the clock-frequency = <0> bit, dtb validation will force
people to set the value in jh7110-board.dts which I'd prefer to rely on
than a comment.

Glad to see you sorted out the clock/reset stuff too!

Thanks,
Conor.

























































































































































































































































































































































































































































_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
