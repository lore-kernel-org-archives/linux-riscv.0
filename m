Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31991C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 17:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLfkkbm+9eo+HTCmgQEGiw+cEm6zhQETKWuRKDG5DyU=; b=5BSNQ57NP7umKZ
	fHdVp7Jaem8VCNCfUVjtWoBQowo2wkhZcIDUnB/7LpLMsiYQiHbgGdJg1Mak0F/BB6GyLop79JXe1
	MtdYZOXULLCd3ezgHjkso8W9GUsrQHbvjq118V+nQP+OI4jnu7QodDijAhKyVXSPAQCXGoRw58BiP
	iE9n/CpJh/mQEHC7jhzrA7t7ZxZvPRXBDzdx3mAgWQ63RZ58lA4VrRKgG/MRR9TKQJQ3zyMRqmpSu
	QurPFp6/ou7zIPeB1rjaMIgaT7AWhM29iMaK7wMACHC7ADb2uwsJQDPjG+k6w4ohIkumg4vazhyOK
	rthvL+XefR4ZoAx82BvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6yNG-000woP-4c; Thu, 30 Jun 2022 17:54:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6yND-000wne-1u
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 17:54:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DEB31063;
	Thu, 30 Jun 2022 10:54:35 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 713CA3F5A1;
	Thu, 30 Jun 2022 10:54:29 -0700 (PDT)
Date: Thu, 30 Jun 2022 18:53:18 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Conor Dooley <mail@conchuod.ie>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
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
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
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
Message-ID: <20220630175318.g2zmu6ek7l5iakve@bogus>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yr3PKR0Uj1bE5Y6O@x1-carbon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_105439_238114_E37DA33E 
X-CRM114-Status: GOOD (  23.69  )
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

On Thu, Jun 30, 2022 at 04:28:26PM +0000, Niklas Cassel wrote:
> On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > Hey all,
> > This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> > based boards. To make keeping it that way a little easier, I changed the
> > Canaan devicetree Makefile so that it would build all of the devicetrees
> > in the directory if SOC_CANAAN.
> > 
> > I *DO NOT* have any Canaan hardware so I have not tested any of this in
> > action. Since I sent v1, I tried to buy some since it's cheap - but could
> > out of the limited stockists none seemed to want to deliver to Ireland :(
> > I based the series on next-20220617.
> > 
> 
> I first tried to apply your series on top of next-20220630,
> but was greeted by a bunch of different warnings on boot,
> including endless RCU stall warnings.
> However, even when booting next-20220630 without your patches,
> I got the same warnings and RCU stall.
>

Is it possible to share the boot logs please ?
Conor is having issues with my arch_topology/cacheinfo updates in -next.
I would like to know if your issue is related to that or not ?

> So I tested your series on top of v5.19-rc4 +
> commit 0397d50f4cad ("spi: dt-bindings: Move 'rx-sample-delay-ns' to
> spi-peripheral-props.yaml") cherry-picked,
> (in order to avoid conflicts when applying your series,)
> and the board was working as intended, no warnings or RCU stalls.
>

If possible can you give this branch[1] a try where my changes are and doesn't
have any other changes from -next. Sorry to bother you.

Conor seem to have issue with this commit[2], so if you get issues try to
check if [3] works.

Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/c/ae85abf284e7
[2] https://git.kernel.org/sudeep.holla/c/155bd845d17b
[3] https://git.kernel.org/sudeep.holla/c/009297d29faa

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
