Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D667C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGx3W5b11jd1i74YuyATCbDxXiJbTLT0t5Hf2UciUUs=; b=s0xIbkh3aN3CUX
	Cr9UvmGRvdJMp6K27J5MhV4xQUFpFUjnLkuRUi9b4BHGfHd4VLzlbdRmeX+Thj8tcgDW4yVV/ixoD
	14TvDQCFkw49w5R44nbqI3yYuHD4t0Zeyb+8NxG/X5kxmbkaQkpO5Q4gcr3+UfUEyiKDghcQtm5bg
	u6n2nRWVj1ZdzNCNIw1iT3tiEFqbYTd2VFFAlMQjzF2Z1Z1zw2uJj7fu17hkso5FNAmy4iumwzk+G
	0Yd1dwMy/yJLQorO1l/l3eCi71O3tI+2owm/maAOijljdwUS9xr3MyhktKR0lqKYrRKjaEuQnDa+R
	2yGijv/+wv4MRGIVLOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqY0R-0077Kq-LN; Mon, 16 May 2022 10:31:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqY0P-0077KE-OL
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 10:31:15 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nqY08-0001ig-KU; Mon, 16 May 2022 12:30:56 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Christoph Hellwig <hch@lst.de>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, arnd@arndb.de, wens@csie.org,
 maxime@cerno.tech, gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com,
 samuel@sholland.org, cmuellner@linux.com, Wei Wu <lazyparser@gmail.com>,
 Daniel Lustig <dlustig@nvidia.com>, Bill Huffman <huffman@cadence.com>
Subject: Re: [PATCH 09/12] riscv: add RISC-V Svpbmt extension support
Date: Mon, 16 May 2022 12:30:55 +0200
Message-ID: <4710483.GXAFRqVoOG@diego>
In-Reply-To: <CAAeLtUA1FWQRot6=zHXWBa3YnfxuhL2TW-a-TNomDeUFPrrz1A@mail.gmail.com>
References: <20220511192921.2223629-1-heiko@sntech.de>
 <20220516061057.GL12339@lst.de>
 <CAAeLtUA1FWQRot6=zHXWBa3YnfxuhL2TW-a-TNomDeUFPrrz1A@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_033113_842741_3BE80AB2 
X-CRM114-Status: GOOD (  24.79  )
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

Am Montag, 16. Mai 2022, 11:09:12 CEST schrieb Philipp Tomsich:
> On Mon, 16 May 2022 at 08:11, Christoph Hellwig <hch@lst.de> wrote:
> >
> > > +config RISCV_ISA_SVPBMT
> > > +     bool "SVPBMT extension support"
> >
> > I don't think this prompt is very useful as it doesn't describe
> > what it does.  But do we even want people to disable it as it is
> > really essentially for a fully functioning kernel and a pity that
> > it took RISC-V so long to get there?
> 
> Given that RISC-V is (in some ways) an ISA construction set, there
> will be valid use cases for embedded users to disable this (e.g. if
> they have their own non-standard way to configure these).  So while
> kernels for binary distributions (and desktop, server, or
> general-purpose embedded) will always enable these, I would fully
> expect some users to want to turn these off.

Also, enabling the SVPBMT extension will pull in the alternative-patching
as well of course, and having a way to disable that was a review-request
a version in the past.


> @Heiko: I would request that we have a longer help text on this, which
> explains what it is and ends with the usual "When in doubt, say Y."

ok, will do


> > > +     depends on 64BIT && MMU
> > > +     select RISCV_ALTERNATIVE
> > > +     default y
> > > +     help
> > > +        Adds support to dynamically detect the presence of the SVPBMT extension
> >
> > overly long line here.

will fix together with Philipp's help-text wish


> > > index 5f1046e82d9f..dbfcd9b72bd8 100644
> > > --- a/arch/riscv/include/asm/errata_list.h
> > > +++ b/arch/riscv/include/asm/errata_list.h
> > > @@ -14,6 +14,9 @@
> > >  #define      ERRATA_SIFIVE_NUMBER 2
> > >  #endif
> > >
> > > +#define      CPUFEATURE_SVPBMT 0
> > > +#define      CPUFEATURE_NUMBER 1
> >
> > is errata_list.h really the right place for architectural features?

That probably stems from the alternatives being exclusively used
for erratas in the past.

I guess making this "alternative-list.h" might be a better naming?
Or are there even better suggestions?

> > Otherwise looks good:
> >
> > Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks
Heiko




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
