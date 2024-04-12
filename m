Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D16C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 05:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O+YRY2lGnvN1ZiVIhsLZiKZXMOLj3RNbUBorxeEz4iM=; b=f+VpL991/kGRujZKEe7cqXDGmk
	NEk2N6Xz4RLBDQg3E/saZwPVQ9lUVe5iOLMZR44GDz90Z9MEAEsVY5Su4n3nlbONcx43/zBoejpG0
	62lT7OAZ8huy3x1t/b72kJoMYQGyoBRkEGWHY+Q2zA4b6guHy/CN+yLMoULIlulpUM4C7JUrWBMmR
	G7D2MWS2J7QP1LB91Q3J+Y737jzImSoI9hX6sL0T5arIXPODjGO9sWbIcKuwB2nEDOwNVsjDKQe70
	i6FkQ7UxMckdMRZk2yKo2Q+G590Tj4zhDXz9cis2xnkpq2YZsDIRsojoEmt8g2+A/GdzeixFm6RNw
	L21kVNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv9sV-0000000FTQk-44r9;
	Fri, 12 Apr 2024 05:55:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv9sT-0000000FTQ8-1X5s
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 05:55:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2DBA9621BD;
	Fri, 12 Apr 2024 05:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58A5C2BBFC;
	Fri, 12 Apr 2024 05:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712901307;
	bh=JQfz7/d2ng00GhHS3NyTYEkGb3OA5UK1hgQL93R0kkQ=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=o6LU2fnb99yOU2DGXXl4CaIGRYOU8kJ0Qnx4M0pnseswKGLRDhngbAk+QiLBy5BHz
	 WjRPTkYjPrDcOrbjyDcHPBfgCyTjmRyEzW85mz+28WR3Vn4h+Rbb7kzqDObhHLX0Iy
	 dY200DAjrfmrcbQI4g7YBYpAzk8bEeul9Jj62MzoHHw0i8FR0IRzkiDAXXjMHiz5L7
	 Mq9Zp4nE3y6sc6yQsG8YvIxbaPAHHfNgF7vGdRXi2w73qay4y3gb6y4V7yp6JuFBxo
	 7BY613fW8v+8IGw9S63yYpfTsnv9X8YYAtOXnr8Gd/3dasgSr2ZX6GAKjGQgbbmyMs
	 wzBinFu+Bm6/Q==
Message-ID: <58956ebc474b993e6da1d6689ecb9324.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB2822BC109267BD20922FB581FE052@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: <cover.1711692169.git.unicorn_wang@outlook.com> <816122e9f22ddd9927e81e627be7f4683ba5c9e8.1711692169.git.unicorn_wang@outlook.com> <433e01f22ce5472aeb28cf0182d951bd.sboyd@kernel.org> <MA0P287MB2822BC109267BD20922FB581FE052@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v13 4/5] clk: sophgo: Add SG2042 clock driver
From: Stephen Boyd <sboyd@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, devicetree@vger.kernel.org, guoren@kernel.org, haijiao.liu@sophgo.com, inochiama@outlook.com, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com, robh+dt@kernel.org, samuel.holland@sifive.com, xiaoguang.xing@sophgo.com
Date: Thu, 11 Apr 2024 22:55:05 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_225509_479102_A60C9DC4 
X-CRM114-Status: GOOD (  10.03  )
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

Quoting Chen Wang (2024-04-11 05:58:05)
> 
> On 2024/4/11 12:11, Stephen Boyd wrote:
> > Quoting Chen Wang (2024-03-28 23:21:40)
> >> +static const u32 sg2042_mux_table[] = {1, 0};
> >> +
> >> +static const char *const clk_mux_ddr01_p[] = {
> >> +                       "clk_div_ddr01_0", "clk_div_ddr01_1"};
> >> +static const char *const clk_mux_ddr23_p[] = {
> >> +                       "clk_div_ddr23_0", "clk_div_ddr23_1"};
> >> +static const char *const clk_mux_rp_cpu_normal_p[] = {
> >> +                       "clk_div_rp_cpu_normal_0", "clk_div_rp_cpu_normal_1"};
> >> +static const char *const clk_mux_axi_ddr_p[] = {
> >> +                       "clk_div_axi_ddr_0", "clk_div_axi_ddr_1"};
> >> +
> >> +static struct sg2042_mux_clock sg2042_mux_clks[] = {
> >> +       SG2042_MUX(MUX_CLK_DDR01, "clk_mux_ddr01", clk_mux_ddr01_p,
> > Please use struct clk_parent_data or struct clk_hw directly instead of
> > string names.
> 
> Hi, Stephen,
> 
> I understand that for clk_init_data, parent_names/parent_data/parent_hws 
> are all acceptable. Why do you only suggest me to use 
> parent_data/parent_hws here? Can you please explain?

Using parent_names requires a global string search for that clk. Using
clk_parent_data or parent_hws reduces that search significantly,
speeding things up. Not using any strings furthermore speeds it up, i.e.
using an index when the clk is external to the device and a clk_hw
pointer when the clk is internal to the device. We speed things up by
removing string comparisons, of which there are many. Any new code
should be using direct pointers or an index, no strings.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
