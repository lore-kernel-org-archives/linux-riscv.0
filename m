Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235B1C25B4E
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 07:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w90lDtgfovdebIgZLBgPDS9WxDqnFEJ0IG5AnRq6pUI=; b=h8Eq+sUDlo+1vK
	/4MwSAC+bMCpDwCK/IGPVTLGMWC9RPpXGGrq1CXXX823eoH9EdTT1vObGRMO++nEnt2v4qmgYwlyG
	8rHjYyBXLvdYtEHjc21xMo65HUNpWWLMZ79y99AW8JcVkRqG+fyRWDjPyEbEP3kKjjWodBDJNTRCR
	fBOSfQL6kYsQQexKs9I2YBKgeH3fprONKqTwf8KkJby6DRdK6jQOcOvw6Vds28Jcy5ZvOvijvIrjW
	iK8UGryFHawr+MBFpJH5qYyEYaP3NVBpzKaAVmzo9kGRp6yYwHuk1ndos4qXXkFfSQTk9vFYMHmz6
	jJsxq4mNUUe58vY3Ip3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJUlq-00EyCW-VP; Sun, 22 Jan 2023 07:28:07 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJUlo-00EyC7-1L
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 07:28:05 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 845BC68AA6; Sun, 22 Jan 2023 08:27:59 +0100 (CET)
Date: Sun, 22 Jan 2023 08:27:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>, Prabhakar <prabhakar.csengg@gmail.com>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	guoren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	devicetree@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH v6 1/6] riscv: mm: dma-noncoherent: Switch using
 function pointers for cache management
Message-ID: <20230122072759.GA3703@lst.de>
References: <CA+V-a8uF1s+dwKC_+apL+CBiHN8w_J0n_G2dqsgiAUZVEibfqg@mail.gmail.com> <9017adf0-acd4-4c43-8aea-3579b214b477@app.fastmail.com> <CA+V-a8u6jvR=EDeE3mAbDr6-06NoBJ7mwmi_Y9qVyHT+aC-9rg@mail.gmail.com> <45d6eb0c-cbe3-4a83-aa12-3483638473ae@app.fastmail.com> <20230110070144.GG10289@lst.de> <02988e70-b099-46fd-b260-2d537c50543a@app.fastmail.com> <20230113054807.GA23179@lst.de> <ea4cb121-97e9-4365-861a-b3635fd34721@app.fastmail.com> <20230121143733.GA7415@lst.de> <6a64b0b5-0ebc-43a5-a3d8-483a845a0b5e@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a64b0b5-0ebc-43a5-a3d8-483a845a0b5e@app.fastmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_232804_414099_A0AAD72C 
X-CRM114-Status: GOOD (  24.47  )
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

On Sat, Jan 21, 2023 at 08:30:23PM +0100, Arnd Bergmann wrote:
> > That feels really odd, and might be worth a bug report to the
> > PPC maintainers.
> 
> Right, my first step would be to change all of the current
> outliers to use the same set of operations where possible.

Sounds good.

> > I'd rather avoid multiple callbacks if we can.  But maybe solve
> > the simple problem first and just pass the paddr and then
> > iterate from there.
> 
> Ok, fair enough. This means we can't easily put the kmap_atomic()
> into common code for highmem, though the per-page loop would
> still work.

Yes.  Given how messy many of the ops are I think one step at a time
is always good.

> I was thinking of using STATIC_CALL() as an optimization here, which
> I find easier to read and understand than alternatives. One advantage
> here is that this allows the actual cache operations to be declared
> locally in the architecture without letting drivers call them,
> but still update the common code to work without indirect branches.
> 
> The main downside is that this is currently only optimized on
> powerpc and x86, both of which don't actually need CPU specific
> callbacks. ARC, ARM, and MIPS on the other hand already
> have indirect function pointers, RISC-V would likely benefit the
> most from either alternatives or static_call, as it already
> uses alternatives and has one implementation that is clearly
> preferred over the others.

For now I'd just keep doing direct calls into the arch code, just
for the lower level invalidate, writeback, invalidate+writeback
calls as that helps cementinc the logic of which of those to use
in well documented core code.

And I'm not really sure I'd like to go beyond that - making it too
easy pluggable will make people feel more comfortable doing stupid
things here.  And yes, maybe that's personal because I've warned
the RISC-V people years ago that they'll need architectural
cache management instructions yesterday and the answer was that
no one is going to use them on modern CPUs.  *sigh*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
