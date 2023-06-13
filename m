Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFC1C7EE2E
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 01:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCOi8zq3LdQbbbdF7J4H/D4hZ80AET2ngQ9fVF9Xfz0=; b=HHdAkhohZm0LD2
	VyxDlREVbYBLxZZoffATgIvays23BdPk7gPaafOgeZpSjKOlI5LkU2elSJjdeaHp37AFCsAKpLoqo
	pyAnaztvjMsZzFXRZ9b8u+u/MjZ2ENXpkAtkbUSKUbPZExz2V2A2WyREhIhWeRS2D+yOPEQppcBsk
	CS8COzMQUmGVyC3rWymZPBVoBox7O8flICC8iTIftpLP45rmVavPaUh8b7RsibAvWQNyi3R3tR9JY
	wF4XOliF87/v1Lu24wCAgLYZAbt/iTg20bU28KkCmjbh3Js5HC5NzLdrr6hbQ5yRWx/vc0lZ2NbfY
	m7HKn4zAMttq8uzZDh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8swl-006aaH-02;
	Tue, 13 Jun 2023 01:35:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8swj-006aZk-11
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 01:35:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A574961228;
	Tue, 13 Jun 2023 01:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FA1C433D2;
	Tue, 13 Jun 2023 01:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686620144;
	bh=EyKtx/gDko9LOVZRYx0rrPp+HzWImhwqZmdgxYsGfHk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IEhIJZftAkwCaFLqvA0d1c++2oY5umfjfor9LtyRx62u1UWPdZZBm5XGLUHcjPPy1
	 GyG9oEw0h5y8N3HQ2UEA7sn5v4esxtoY+91sp0Iacil8GHN3ix6n4ngDlQlEf6kU/4
	 HRmEj3r6PqD2jzc3qbC8AqX0ncT7xhXTlDH0lCK0r8c2vrjkJhDTQBsS0W7Awh3vJc
	 RwyC3y+QrdshoIpWu38ckKmwmicaDm+ORMSH6fl3Hw1VD7Dek4mEkCzJewLOoZ0uk9
	 FbULImDyIUgeDrex8Imf5Bbd5hh0KKZRD+RdWrfadP4QFPYxmvYbhSm05jlh86udiK
	 3ZbRyN3zOaFQw==
Message-ID: <91c3373b5b00afc1910b704a16c1ac89.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230515054402.27633-3-frank.li@vivo.com>
References: <20230515054402.27633-1-frank.li@vivo.com> <20230515054402.27633-3-frank.li@vivo.com>
Subject: Re: [PATCH 2/3] clk: thead: add support for the T-HEAD TH1520 CCU
From: Stephen Boyd <sboyd@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Wei Fu <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, mturquette@baylibre.com
Date: Mon, 12 Jun 2023 18:35:41 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_183545_444420_43B6999A 
X-CRM114-Status: GOOD (  18.52  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Yangtao Li (2023-05-14 22:44:00)
> diff --git a/drivers/clk/clk-th1520.c b/drivers/clk/clk-th1520.c
> new file mode 100644
> index 000000000000..5dfa9e5207e2
> --- /dev/null
> +++ b/drivers/clk/clk-th1520.c
> @@ -0,0 +1,999 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Vivo Communication Technology Co. Ltd.
> + * Authors: Yangtao Li <frank.li@vivo.com>
> + */
> +
[....]
> +
> +
> +static CLK_FIXED_FACTOR_HW(pll_gmac_100m_clk, "pll-gmac-100m",
> +                          &pll_gmac_clk.common.hw,
> +                          10, 1, 0);
> +
> +static const char * const uart_parents[] = { "pll-gmac-100m", "osc24m" };
> +struct ccu_mux uart_clk = {
> +       .mux    = TH_CCU_ARG(0, 1),
> +       .common = {
> +               .reg            = 0x210,
> +               .hw.init        = CLK_HW_INIT_PARENTS("uart",

Don't use strings for clk tree topology. Instead use clk_parent_data or
clk_hw pointers directly.

> +                                             uart_parents,
> +                                             &ccu_mux_ops,
> +                                             0),
> +       }
> +};
> +};
> +
> +static const struct regmap_config config = {

Namespace this, th1520_clk_regmap_config[]

> +       .reg_bits = 32,
> +       .val_bits = 32,
> +       .reg_stride = 4,
> +       .fast_io = true,
> +};
> +
> +static int th1520_clock_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct regmap *map;
> +       void __iomem *regs;
> +       int ret, i;
> +
> +       regs = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(regs))
> +               return PTR_ERR(regs);
> +
> +       map = devm_regmap_init_mmio(dev, regs, &config);
> +       if (IS_ERR(map))
> +               return PTR_ERR(map);
> +
> +       for (i = 0; i < ARRAY_SIZE(th1520_clks); i++)
> +               th1520_clks[i]->map = map;
> +
> +       for (i = 0; i < th1520_hw_clks.num; i++) {
> +               ret = devm_clk_hw_register(dev, th1520_hw_clks.hws[i]);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +                                       &th1520_hw_clks);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id clk_match_table[] = {

Namespace this, th1520_clk_match_table[]

> +       {
> +               .compatible = "thead,th1520-ccu",
> +       },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, clk_match_table);
> +

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
