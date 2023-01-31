Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD65C54EAA
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 00:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQy5S2Q4g6ue65oKIbYZe9yl9F6ZkKmH7I7vkulrsi4=; b=EvX7epOF2vrkBO
	yy+5hejJGwl3VmHbTZ4GEha0/NM3azOGTFkLKRNOFV85g/Ih42A1BhHI9hxhn1wO/OhJGCxP1sCdn
	S7qKBDoEbZoMp6GRZrgZLIC8JSQQnxhBFpgZ3lq5icrEIP8727/Vm71v21smrr9badnPh+X7hguQ8
	g6sGOGu1eiUBHFnmtRHaDFDod8YEMm8gan3WWxc021clBP4D1Pf0Mp4AnrhlrBFudRTmtLg/wq2DQ
	9ZejUgHg1Nm6rzgLb1NjLXUEL4xUwrj+k3SPyW0oqylFe6bPX1d+6uyb3GAPlRy6d6ZuzLx58ZKkM
	UUmIaKpwv5Nyxn79V3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMed8-005ugz-6K; Tue, 31 Jan 2023 00:36:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMed0-005ufn-RP
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 00:36:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 592E861274;
	Tue, 31 Jan 2023 00:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66E7C433D2;
	Tue, 31 Jan 2023 00:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675125361;
	bh=winm19U7j/1SrLM33+LHutRtt1r14B9o9myRfOllwWM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aCyjcqCjxnVQ8w/xZDqPFiYemSX/BMOgjjM6FSRSGqmfPlinxqB+XMZrM/g8W9qTB
	 uOMQSbrtIA17dxunmnIzx/zeAoU4Im/xJ83cPHApTqD4GFzrk4tw2c5Vb+S0kpYxcp
	 f7iqLDA2tGdCnhoAwps0Ay+hPA5OBilaT3H6X+g7RkP41BgR4VHJGyWoKY51ZFiIzt
	 ixHhw6iUHd5RQJuzL6L40TcvllTvA/C/dPI4IjrATKirCaGBs/oQqHIjW3gYnWMMmT
	 HDZe81mmyl8ItKfe1CNdqNpFM7uqU+Ziv8+y+PomXb2Bm5VcQjkYJjfJgMlms3fYI7
	 W8JNFDLqBZUmw==
Message-ID: <f6f558a0daafa454c02fe29cd904cfcd.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <0e77bf23-b359-9884-6a8c-368e31d718a4@starfivetech.com>
References: <20230120024445.244345-1-xingyu.wu@starfivetech.com> <20230120024445.244345-4-xingyu.wu@starfivetech.com> <5bb5263d26b157548d7ba39f80989c69.sboyd@kernel.org> <0e77bf23-b359-9884-6a8c-368e31d718a4@starfivetech.com>
Subject: Re: [PATCH v1 03/11] clk: starfive: Add StarFive JH7110 System-Top-Group clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Emil Renner Berthing <kernel@esmil.dk>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu <xingyu.wu@starfivetech.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Mon, 30 Jan 2023 16:35:59 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_163602_981914_A7365AA2 
X-CRM114-Status: GOOD (  21.45  )
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

Quoting Xingyu Wu (2023-01-30 00:02:28)
> On 2023/1/26 10:33, Stephen Boyd wrote:
> > Quoting Xingyu Wu (2023-01-19 18:44:37)
> >> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-stg.c b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
> >> new file mode 100644
> >> index 000000000000..c2740f44e796
> >> --- /dev/null
> >> +++ b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
[...]
> >> +                               parents[i].fw_name = "nocstg_bus";
> >> +                       else if (pidx == JH7110_STGCLK_APB_BUS)
> >> +                               parents[i].fw_name = "apb_bus";
> > 
> > Can this be an array lookup instead of a pile of conditions?
> > 
> >       if (pidx < JH7110_STGCLK_END)
> >               ...
> >       else
> >               parents[i].fw_name = fw_table[pidx - JH7110_STGCLK_END];
> > 
> > Or even better, don't use strings at all and just make the 'pidx' number
> > (possibly minus the end constant) be the 'clocks' property index that
> > you want.
> 
> It seen to be a good way that there uses an array.
> Based on the another way, can I use the 'pidx' number to get the 'clock-names' property
> to be the parent clock name?

The binding is your design. It is incorrect if the binding is referencing clocks
provided by the same node though. If that's the case, simply use the hw
pointer directly.

> 
> > 
> >> +               }
> >> +
> >> +               clk->hw.init = &init;
> >> +               clk->idx = idx;
> >> +               clk->max_div = max & JH71X0_CLK_DIV_MASK;
> >> +
> >> +               ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> >> +               if (ret)
> >> +                       return ret;
> >> +       }
> >> +
> >> +       ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_stgclk_get, priv);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       return jh7110_reset_controller_register(priv, "reset-stg", 2);
> > 
> > Is this also devm-ified?
> 
> No, it need to be freed actively. I will advise Hal Feng this.
> 

Oh, that's not good.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
