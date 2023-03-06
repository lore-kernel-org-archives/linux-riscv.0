Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB876C6FD1A
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 22:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOIfs650nIfWTKmBjcmRysYNXsFYItNSPAFM5i/PtpY=; b=mQcoDhS/BawRpw
	DuBo4FrH6UAjsJ4jtNkstcQi2PaneFh9Y8flIbhvzGCWsZ5POAvuKeYRmzrMEym8l8oo2qINCm2vV
	yW5yKLO+u1HkWrhDUdFcMbJLgRGRlzSSf0C/pRx7jlo4oswVyYtXrYbZlVCb7g1zqB+pjIo19azCb
	QsHDGluwo1fSAd43E9W53e9GGSLwEAmfnpZ68lJuR4Jtq0oRqoakwZF5N7WaT4dv87OYNkzDazBAq
	pTDTnVSni9ZFrcW5Lmwmamf/rQSAbjhkMSU8zUl1xAtFN1NnqAdGd+RYSewMTuD67f0LLmnFVQT8c
	I3/mwAT5L/8rJl3Y1blA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJSS-00FJ8x-RD; Mon, 06 Mar 2023 22:37:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJSP-00FJ7U-Cr
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 22:37:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E462860F6F;
	Mon,  6 Mar 2023 22:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454FCC433D2;
	Mon,  6 Mar 2023 22:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678142244;
	bh=ikZNIXxA3bRlatWCfivxUT2xVL8WMgX6XJ1cfOvU6l0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QrFOsNUVyVo6dSpUl589Hl4QENjJvssunhxYJfuYFVzOADr4RMByRqGZOgzPAWm8R
	 JEcGA8lgZ5ftUH+mlSyNNTkNzCocdevqsYgUOl1H2bpTYWgO2ZDJm6eyoFCHQiQ9TB
	 56NUyq0oZt3wIokiRXN11sQGjAuY74qmO0/pw+i02n6clKu/SAv8G1k0owOY/MmS8d
	 2RxAwqdUz3havCjVcrfZpOdCxV0KdnD51Om6hbtoYn9fUJeYg5g3X/3FaAc9d6DjMM
	 xdYdtFHVL4FcCydFlEAQAdXT/YhdUep8LGWIcU/B/cH/R2BjwZxhnxTxytlodETJ82
	 4/Qq4x8Dz+V0A==
Message-ID: <39d89928de4c52d10fd98bca61b549fa.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <be589843-dfc1-47dc-a488-a4fad645c638@spud>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com> <20230301002657.352637-2-Mr.Bossman075@gmail.com> <3b0a1481873a2a7c26015fcedcc673b3.sboyd@kernel.org> <be589843-dfc1-47dc-a488-a4fad645c638@spud>
Subject: Re: [PATCH v3 1/3] clk: k210: remove an implicit 64-bit division
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>, Michael Turquette <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, kernel test robot <lkp@intel.com>
To: Conor Dooley <conor@kernel.org>
Date: Mon, 06 Mar 2023 14:37:22 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_143725_491554_F5BE9896 
X-CRM114-Status: GOOD (  10.87  )
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

Quoting Conor Dooley (2023-03-06 14:35:01)
> On Mon, Mar 06, 2023 at 02:31:00PM -0800, Stephen Boyd wrote:
> > Quoting Jesse Taube (2023-02-28 16:26:55)
> > > diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> > > index 67a7cb3503c3..4eed667eddaf 100644
> > > --- a/drivers/clk/clk-k210.c
> > > +++ b/drivers/clk/clk-k210.c
> > > @@ -495,7 +495,7 @@ static unsigned long k210_pll_get_rate(struct clk_hw *hw,
> > >         f = FIELD_GET(K210_PLL_CLKF, reg) + 1;
> > >         od = FIELD_GET(K210_PLL_CLKOD, reg) + 1;
> > >  
> > > -       return (u64)parent_rate * f / (r * od);
> > > +       return div_u64((u64)parent_rate * f, r * od);
> > 
> > The equation 'r * od' can't overflow 32-bits, right?
> 
> Yah, I checked that when writing the patch. They're 4-bit fields:

Awesome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
