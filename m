Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF72C54EAA
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 00:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crKUsNpVB31jcz0VS0p0qc7sqWoX54dB87WnW4AdiBU=; b=JtRUv3iD68NxtS
	66xZ2bHwq79F+N3uVX3qfiimv/iFfHU6rSlf/DFU9zI84sNBnp0Fbonh8xvF2elfFG3/GnVpiICWq
	S/6mfOrhhcWnM87s10u5SzFmmhBs3wO0s7snu5dpbgLFpeq5kgFuIRnZo+V4GkkPEBLYCnbOm1sSO
	kCsBib5kiw5+ItXXPkk+fec6LbNHo1cFJpX8Sco6AbsnErcco1gjpcMkld836ZE6LmmG2WXTW4ea0
	0pe5sC8p2S5IzI7jXgTg2VxjJ0NQlnNizGERkwzpVbRA3xjOU/Hm5svS7XkgT0Aqdne1+L5zkd1n2
	psEls2nmax6bhQQvXhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMefa-005v0T-Fc; Tue, 31 Jan 2023 00:38:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMefX-005uzq-O5
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 00:38:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E8B9161274;
	Tue, 31 Jan 2023 00:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFB2C433EF;
	Tue, 31 Jan 2023 00:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675125518;
	bh=KQ/jlA4qGwu/+ocBuikUEZAfj7MktGpHG+XmBQXFyco=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aAsjPIGH864XiwqbnnKzoXOeByYareroKqLejbu7xmoMNOm+DfVeGmSpjuRF6ui3e
	 YpWMzPhydFmqGzl+UMIfhtDME7FV29ZfkfLqh9S7Tid/4rZXk8wIbb6TJD7cxdw18v
	 dRpYhCDve0R0kkPduA4UK55gT7apXeR4tjFGw6C8p0ANcXZKI1O7JKEFTMn62eWTrC
	 g1Mtn0RYYdXJCff1bSCdabJHnp3GxMb3D8BBYJ/os7Q/VcWe0PX2qTDnsDHrWu1r6Q
	 Hrm3tZeCvW32Zg/bhZNZT7yxkyx++DHT9ltMi7mba38M1nbUesEXPwJstIiDe1CnUd
	 fVy+9jNbpaQGA==
Message-ID: <26437c6f0bda4dd18e16fa1f58013911.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230120024445.244345-7-xingyu.wu@starfivetech.com>
References: <20230120024445.244345-1-xingyu.wu@starfivetech.com> <20230120024445.244345-7-xingyu.wu@starfivetech.com>
Subject: Re: [PATCH v1 06/11] clk: starfive: Add StarFive JH7110 Image-Signal-Process clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Emil Renner Berthing <kernel@esmil.dk>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu <xingyu.wu@starfivetech.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Mon, 30 Jan 2023 16:38:36 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_163839_843060_C9B31D1A 
X-CRM114-Status: GOOD (  12.16  )
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

Quoting Xingyu Wu (2023-01-19 18:44:40)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
> new file mode 100644
> index 000000000000..f9fc94b4c6f8
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7110 Image-Signal-Process Clock Driver
[...]
> +
> +static int jh7110_isp_top_crg_enable(struct isp_top_crg *top)
> +{
> +       int ret;
> +
> +       ret = clk_bulk_prepare_enable(top->top_clks_num, top->top_clks);
> +       if (ret)
> +               return ret;
> +
> +       return reset_control_deassert(top->top_rsts);
> +}

This needs to be undone on driver remove.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
