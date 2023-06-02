Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4117FC7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fr5xbV/3emr71er1nvhFwNmDGIzWHw75fYxHcRWVhbU=; b=msG3J8XiTcqoiI
	zGjG8mpgrQODrhrYhhiNQ/ZvFi9CoTG4faYJUxISK/K9QulGD1jZXcj3OtdF3KVoGrR+7WIUH/ZQn
	b4WjjivVyyLlzK9Qty7oM0ojZt2r989ehEKZQR4SQvdhDK6M663wbYu1qBgS82xZ4SCmBQGU6O9Mj
	q2v+TCyDCh57BV01yhbVRfAOOJadwrcqvwqp1NYDlbSZh4wink3HOcFiXFGbl1J588F19kT71poQE
	tQuesKrCvsamuYDme0QON4vAYRIcInu6KelnC5/cpOdkLZFEE66IeIS5NrjT9KzQJRqljrKjVqbX9
	EzfesIkWuV18f2r4NKQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57ol-007QqR-0q;
	Fri, 02 Jun 2023 16:39:59 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57oi-007QpU-2A
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:39:58 +0000
Received: by verein.lst.de (Postfix, from userid 107)
	id B87BF68AFE; Fri,  2 Jun 2023 18:39:48 +0200 (CEST)
Received: from blackhole.lan (p5b33f9bb.dip0.t-ipconnect.de [91.51.249.187])
	by verein.lst.de (Postfix) with ESMTPSA id 3758768AA6;
	Fri,  2 Jun 2023 18:39:27 +0200 (CEST)
Date: Fri, 2 Jun 2023 18:39:22 +0200
From: Torsten Duwe <duwe@lst.de>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <yanhong.wang@starfivetech.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, "Rob Herring" <robh+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, "Hal Feng" <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add StarFive JH7110 PLL
 clock generator
Message-ID: <20230602183922.649b8e88@blackhole.lan>
In-Reply-To: <df43411e-8982-74f5-6148-e7281c37dada@starfivetech.com>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
	<20230512022036.97987-2-xingyu.wu@starfivetech.com>
	<20230519135733.GA10188@lst.de>
	<20230519-smokeless-guileless-2a71cae06509@wendy>
	<df43411e-8982-74f5-6148-e7281c37dada@starfivetech.com>
Organization: LST e.V.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_093956_869013_192068E7 
X-CRM114-Status: GOOD (  21.27  )
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

On Tue, 23 May 2023 10:56:43 +0800
Xingyu Wu <xingyu.wu@starfivetech.com> wrote:

> On 2023/5/19 22:16, Conor Dooley wrote:
> > On Fri, May 19, 2023 at 03:57:33PM +0200, Torsten Duwe wrote:
> >> On Fri, May 12, 2023 at 10:20:30AM +0800, Xingyu Wu wrote:
> >> [...]
> >> >  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
> >> >  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
> >> >  
> >> > +/* PLL clocks */
> >> > +#define JH7110_CLK_PLL0_OUT			0
> >> > +#define JH7110_CLK_PLL1_OUT			1
> >> > +#define JH7110_CLK_PLL2_OUT			2
> >> 
> >> In U-Boot commit 58c9c60b Yanhong Wang added:
> >> 
> >> +
> >> +#define JH7110_SYSCLK_PLL0_OUT                       190
> >> +#define JH7110_SYSCLK_PLL1_OUT                       191
> >> +#define JH7110_SYSCLK_PLL2_OUT                       192
> >> +
> >> +#define JH7110_SYSCLK_END                    193
> >> 
> >> in that respective file.
> >> 
> >> > +#define JH7110_PLLCLK_END			3
> >> > +
> >> >  /* SYSCRG clocks */
> >> >  #define JH7110_SYSCLK_CPU_ROOT			0
> >> 
> >> If the symbolic names referred to the same items, would it be possible
> >> to keep the two files in sync somehow?
> > 
> > Ohh, that's not good.. If you pass the U-Boot dtb to Linux it won't
> > understand the numbering. The headers are part of the dt-binding :/
> 
> Because PLL driver is separated from SYSCRG drivers in Linux,

Can you _please_ point me at that "PLL driver" "in Linux" ?
I seem to be unable to find it. All I can see is a stub in
drivers/clk/starfive/clk-starfive-jh7110-sys.c, which simply
sets the PLLs to 1000, 1066 and 1188 MHz fixed, respectively.

The comment above says

| They will be dropped and registered in the PLL clock driver instead.

and that's the one I'm looking for.

Thanks,

	Torsten

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
