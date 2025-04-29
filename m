Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1281C3ABA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 22:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwzLGvTHH8+04l3noojy6fwNS7BrJ33fMNXFEMmm/N8=; b=RaPn+pdfMt0dQZ
	J6dIqeV2dC6DFhjw8EqgcWKILComtXW0V4AcjGmOQmY0XqgR8o3Mh2WRl3ga+i2e8mr5aAgcxRE9Q
	bfugK+rLPz+YNxaX3AnPEWK6PTYHqSyQ/VP1itWdrYZmbbMN46EIbY1b5fQrH79v/7B/V04fLd/Jx
	iGB9N07Id6ZGx/b5a+j9LUh5SsUV8LGVSsFDNvPo3An5pErZ8sKLWcaTHyEFwZwaeeBTjYPLCEFN+
	ZyzoPOY/yM97DqNpi32ZTV2l83TELMX+JHTGUKOHwM5JJa/F2+84XOjfa1tp4Bs0Pj3k9kV0OkK62
	ppErTaCSz2ua1C3JlLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9tSZ-0000000AywU-0C93;
	Tue, 29 Apr 2025 22:29:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9tSW-0000000Ayw0-2cha
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 22:29:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 244DEA4C2DB;
	Tue, 29 Apr 2025 22:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D573C4CEE3;
	Tue, 29 Apr 2025 22:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745965787;
	bh=krVN7fbLDEgUpA3CZRaPnPrQx/YtEFqbO33A+c1lnE0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gOHSLfvdCibmwpEa/qnvyBi3DOHj6LwLBNnR5umgTyIpzr6ishK7lzagEG4u/X0A6
	 Gu7XUIaaTz0hulUcTeerC9q13qE0vQ8TX6Hd0ERoBgVtZoNPDCkOJTxYm4ILBWcZrU
	 aLma7kuKv09FpEJ8g67GOph8JOFjgufewWx/u0QH4Db4ZXvVzKBhJhsSkjnWbvKSRl
	 S1QnVz2rQGLBqz8b3VsepNJj6DwXoLFEr+L6tTH+uXurmZ7q+51ih6cjN9U3pG7/LU
	 dSaevH9O3KiPPOjUXfbrCJ3bawtVYXN0Q4mEeAmOMphYetKJ1JNR+GQyM6zx5ak3uk
	 UEl/1ZupSCyag==
Message-ID: <9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org>
MIME-Version: 1.0
In-Reply-To: <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
References: <20250403094425.876981-1-m.wilczynski@samsung.com> <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com> <20250403094425.876981-4-m.wilczynski@samsung.com> <Z/BoQIXKEhL3/q50@x1> <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
To: Drew Fustini <drew@pdp7.com>, Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 29 Apr 2025 15:29:45 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_152948_797987_670609FF 
X-CRM114-Status: GOOD (  21.97  )
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

Quoting Michal Wilczynski (2025-04-07 08:30:43)
> On 4/5/25 01:16, Drew Fustini wrote:
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> index 527336417765..d4cba0713cab 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -489,6 +489,13 @@ clk: clock-controller@ffef010000 {
> >>                      #clock-cells = <1>;
> >>              };
> >>  
> >> +            clk_vo: clock-controller@ffef528050 {
> >> +                    compatible = "thead,th1520-clk-vo";
> >> +                    reg = <0xff 0xef528050 0x0 0xfb0>;
> > 
> > Thanks for your patch. It is great to have more of the clocks supported
> > upstream.
> > 
> > The TH1520 System User Manual shows 0xFF_EF52_8000 for VO_SUBSYS on page
> > 205. Is there a reason you decided to use 0xFF_EF52_8050 as the base?
> > 
> > I see on page 213 that the first register for VO_SUBSYS starts with
> > VOSYS_CLK_GATE at offset 0x50. I figure you did this to have the
> > CCU_GATE macros use offset of 0x0 instead 0x50.
> > 
> > I kind of think the reg property using the actual base address
> > (0xFF_EF52_8000) makes more sense as that's a closer match to the tables
> > in the manual. But I don't have a strong preference if you think think
> > using 0xef528050 makes the CCU_GATE macros easier to read.
> 
> Thank you for your comment.
> 
> This was discussed some time ago. The main issue was that the address
> space was fragmented between clocks and resets. Initially, I proposed
> using syscon as a way to abstract this, but the idea wasn't particularly
> well received.
> 
> So at the start of the 0xFF_EF52_8000 there is a reset register GPU_RST_CFG
> I need for resetting the GPU.
> 
> For reference, here's the earlier discussion: [1]
> 
> [1] - https://lore.kernel.org/all/1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org/
> 

In that email I said you should have one node
clock-controller@ffef528000. Why did 0x50 get added to the address?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
