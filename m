Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D427FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWo0i+cyIPHfHLJmuMS8irYasiwr2lu/ih6laN1NXc0=; b=1INDs7HZdEcUkv
	PHOM3ohSXd9KrF+tJYps2Ocjs+spMYAkaixbWgktfuKNjKVue6NzA6RVg1DW0w9WHuyLownRGucOz
	wUw8RDhtIiyhhDTdNKcGJlYCjb6eIPWqXvITKWn6W7jF9gOF6vVIwNBz4IjsZigH6ej5jWBUTpmQe
	wMdIPiii6r1Zxzu39g0lh/HlimEGbUkJHJcdAgbdyDtW/HYDhpjP5RlHVvPPaabcAIEKj0nFsMuDa
	t6TYYs+CH/gO3Fjgakst0+qTLaVYxC27VwooMmAJr3nIB1FIgHEuneg4tjC078fReqHPjLNFJAk3j
	isgQ0uUGLvkXGNrmcxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EbO-004I6k-KB; Fri, 01 Jul 2022 11:14:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EbL-004I5S-RY
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 11:14:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE8FA1424;
	Fri,  1 Jul 2022 04:14:18 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 551EF3F66F;
	Fri,  1 Jul 2022 04:14:13 -0700 (PDT)
Date: Fri, 1 Jul 2022 12:14:10 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>, Conor Dooley <mail@conchuod.ie>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dillon Min <dillon.minfei@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Message-ID: <20220701111410.mzfgmdabzmfubygm@bogus>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon>
 <20220630175318.g2zmu6ek7l5iakve@bogus>
 <f228057b-7c17-e536-ce6f-6597e263f06d@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f228057b-7c17-e536-ce6f-6597e263f06d@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_041419_999950_E0BF0E15 
X-CRM114-Status: GOOD (  24.87  )
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

On Fri, Jul 01, 2022 at 06:16:14AM +0900, Damien Le Moal wrote:
> On 7/1/22 02:53, Sudeep Holla wrote:
> > On Thu, Jun 30, 2022 at 04:28:26PM +0000, Niklas Cassel wrote:
> >> On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
> >>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>
> >>> Hey all,
> >>> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> >>> based boards. To make keeping it that way a little easier, I changed the
> >>> Canaan devicetree Makefile so that it would build all of the devicetrees
> >>> in the directory if SOC_CANAAN.
> >>>
> >>> I *DO NOT* have any Canaan hardware so I have not tested any of this in
> >>> action. Since I sent v1, I tried to buy some since it's cheap - but could
> >>> out of the limited stockists none seemed to want to deliver to Ireland :(
> >>> I based the series on next-20220617.
> >>>
> >>
> >> I first tried to apply your series on top of next-20220630,
> >> but was greeted by a bunch of different warnings on boot,
> >> including endless RCU stall warnings.
> >> However, even when booting next-20220630 without your patches,
> >> I got the same warnings and RCU stall.
> >>
> > 
> > Is it possible to share the boot logs please ?
> > Conor is having issues with my arch_topology/cacheinfo updates in -next.
> > I would like to know if your issue is related to that or not ?
> 
> FYI, I see rcu warnings on boot on my dual-socket 8-cores Xeon system, but
> the same kernel does not have the rcu warnings with an AMD Epyc single
> socket 16-cores box.

And any chances of seeing the logs ?

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
