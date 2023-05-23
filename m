Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CF9C7EE26
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 11:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHyzmrGoc+uDc9fs8jFuViRaJ0Ikp0gzgbsTtNO/yQw=; b=nRWAjP6uUMUMRt
	WmnOho0ezoh09AxoXQQ3u8zcoqaLd5Tk8j/tN4AY3VpycTo5HiLoUYlVCsg9lYXtJqdkgXXQnrfdj
	vmqSnwy6Uhz6wKZKl/7JyFw/5Lq46eRJFVaglmBMsmEC3AMtdplIISeLQuIYJ/ZQLHaUiF91C6rl6
	1gOqO+C31ni0AfWIMoH7qIh6yHJ+em/DZcKShJHwKanxeDykirhSfj4J4ajNt+x2bx87ywk3DaVE2
	jZkA/1NbVqBTVpLNLaUrQzRKHKoxybBS4zV5XMYryS0oCYqLtGply3LPGBldGhnz1uskR0kuUMucJ
	bfov3AxDiSSvF4bMRH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Pug-00A2L0-2K;
	Tue, 23 May 2023 11:10:46 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Puc-00A2Im-06
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 11:10:44 +0000
Received: by verein.lst.de (Postfix, from userid 107)
	id 5E36668AFE; Tue, 23 May 2023 13:10:30 +0200 (CEST)
Received: from blackhole.lan (p5b33fa9c.dip0.t-ipconnect.de [91.51.250.156])
	by verein.lst.de (Postfix) with ESMTPSA id 676E867328;
	Tue, 23 May 2023 13:10:11 +0200 (CEST)
Date: Tue, 23 May 2023 13:10:06 +0200
From: Torsten Duwe <duwe@lst.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <yanhong.wang@starfivetech.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, William Qiu
 <william.qiu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add StarFive JH7110 PLL
 clock generator
Message-ID: <20230523131006.46997d84@blackhole.lan>
In-Reply-To: <20230523-fondue-monotype-0c751a8f0c13@wendy>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
	<20230512022036.97987-2-xingyu.wu@starfivetech.com>
	<20230519135733.GA10188@lst.de>
	<20230519-smokeless-guileless-2a71cae06509@wendy>
	<df43411e-8982-74f5-6148-e7281c37dada@starfivetech.com>
	<20230523-fondue-monotype-0c751a8f0c13@wendy>
Organization: LST e.V.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_041042_373536_A3966520 
X-CRM114-Status: GOOD (  22.15  )
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

On Tue, 23 May 2023 09:28:39 +0100
Conor Dooley <conor.dooley@microchip.com> wrote:

> On Tue, May 23, 2023 at 10:56:43AM +0800, Xingyu Wu wrote:
> > On 2023/5/19 22:16, Conor Dooley wrote:
> > > On Fri, May 19, 2023 at 03:57:33PM +0200, Torsten Duwe wrote:
> > >> On Fri, May 12, 2023 at 10:20:30AM +0800, Xingyu Wu wrote:
> > >> [...]

> > >> > +/* PLL clocks */
> > >> > +#define JH7110_CLK_PLL0_OUT			0
> > >> > +#define JH7110_CLK_PLL1_OUT			1
> > >> > +#define JH7110_CLK_PLL2_OUT			2
> > >> 
> > >> In U-Boot commit 58c9c60b Yanhong Wang added:
> > >> 
> > >> +
> > >> +#define JH7110_SYSCLK_PLL0_OUT                       190
> > >> +#define JH7110_SYSCLK_PLL1_OUT                       191
> > >> +#define JH7110_SYSCLK_PLL2_OUT                       192
> > >> +
> > >> +#define JH7110_SYSCLK_END                    193
[...]
> > > Ohh, that's not good.. If you pass the U-Boot dtb to Linux it
> > > won't understand the numbering. The headers are part of the
> > > dt-binding :/

In fact, the clock index >= 190 makes linux hang on boot, waiting with
EPROBE_DEFER for every device's clock, because the sysclk driver errors
out with EINVAL (jh7110_sysclk_get()).

> > Because PLL driver is separated from SYSCRG drivers in Linux, the
> > numbering starts from 0. But in Uboot, the PLL driver is included
> > in the SYSCRG driver, and the number follows the SYSCRG.
> 
> Unfortunately, how you choose to construct your drivers has nothing to
> do with this.
> These defines/numbers appear in the dts and are part of the DT ABI.
> The same dts is supposed to work for Linux & U-Boot.

The JH7110 has 6 blocks of 64k iomem in that functional area:
{SYS,STG,AON} x {CRG,SYSCON}. None of these has 190 clocks.
The good news: the current DTS, as proposed here and in U-Boot master,
provides nodes for all 6 entities. The bad news is that the clock
assignments to those nodes and their numbering is messed up.

AFAICT PLL{0,1,2} _are_ generated in SYS_SYSCON and thus U-Boot gets it
wrong, in addition to the erroneous DTS.

	Torsten

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
