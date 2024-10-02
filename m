Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CABECF319C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dv3vtLtF6PuU0KkHSm4Cb4GV0teY8UyOGp+aKyuHvY=; b=CJTnptE4k8yKPN
	zqd1+3Otnw49DGRisqWHg3Yma2BgScAusfqNpQPfC1Wm4JPU/wWyNMtNDYpWnd4MHOo6JyZSUCuZH
	IUmiCizEmFQxv2DDG7IiLejnls6PlXUN8iWl3+UWCONPxK13rjMBuPk9GivI1y/FZ8SCfWwawvf85
	IMLC39YX7md7zl4y1OCb9CeXnzHHt+Uh3/QAr1dlGg/j4elumGsarmJWcjbZIOP8+goU22YsMGCfD
	5tJpYfZsscklF7ne5P7YI+/Lw0O72/iPrMkLyI+iRI/c4q4ePOP3MNn0n0lnjWpUrYpANv4ltkMLz
	fgFf3VQXeghSA1KujSXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svuwa-00000005C81-0Pjs;
	Wed, 02 Oct 2024 08:42:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svuwC-00000005BzO-2Cyt
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 08:42:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD2D05C03F4;
	Wed,  2 Oct 2024 08:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D380C4CECE;
	Wed,  2 Oct 2024 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727858543;
	bh=cDPhx8w45rGUFEl36RE2AtCWblzak7ngHuy8Z5ADAMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTlYYcBVXHtRNhy6LC7Oo34hs3AqZ56T/9WJ8wDZwPxrRwSBCFMyZ7+JbP1eBxa3g
	 HhUru/CABQm46ajGnTmI7yFEatha1ZkMMFH0L0Su2HVE5bKbIOyX0L3j2x9McRuzvn
	 S/5Bx7c4bqGfDibDZJ61gK1o/dN4QaLdZdxsiPawdLCE+kKD9ejOqWAb/KkjsR+j8d
	 ct1Hw7m1nzjxBpc6ODPNutn+DeAt+R2e34z7QZqM/loqX2ayOpYXVgHtVvIP3l0uZ3
	 QSpEOgNY/WoyiFfgzG+iNaagt17PpqlsD3M/hwWCfOrysFLDPfWusd73RLkQz+gup3
	 jZBsWEjlDQqRg==
Date: Wed, 2 Oct 2024 10:42:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Wolfram Sang <wsa@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <cnmnr23sif5trz3hiy6swzlyt36dbbemwdyxsqbjmn2nv33mgc@byu4yu4panyi>
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
 <jzkzcnd5rdprxpw734ppcr5ti23qkppfxs55nse36wcqxff7e3@4ea2lyl7feoo>
 <20241001-boring-livestock-0158ccc3fa88@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241001-boring-livestock-0158ccc3fa88@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_014224_681249_5C6A1267 
X-CRM114-Status: GOOD (  41.50  )
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

Hi Conor,

On Tue, Oct 01, 2024 at 02:02:18PM GMT, Conor Dooley wrote:
> On Tue, Oct 01, 2024 at 02:45:20PM +0200, Andi Shyti wrote:
> > Hi Conor,
> > 
> > On Mon, Sep 30, 2024 at 02:38:27PM GMT, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > At present, where repeated sends are intended to be used, the
> > > i2c-microchip-core driver sends a stop followed by a start. Lots of i2c
> > > devices must not malfunction in the face of this behaviour, because the
> > > driver has operated like this for years! Try to keep track of whether or
> > > not a repeated send is required, and suppress sending a stop in these
> > > cases.
> > > 
> > > Fixes: 64a6f1c4987e ("i2c: add support for microchip fpga i2c controllers")
> > 
> > I don't think the Fixes tag is needed here if everything worked
> > until now, unless you got some other device that requires this
> > change and you need to explain it.
> 
> I think the fixes tag is accurate, because it only happened to work on
> the limited set of devices I and others tried. This patch came about cos
> I got reports of it being broken in 6.6
> 
> > If this is more an improvement (because it has worked), then we
> > shouldn't add the Fixes tag.
> > 
> > In any case, when patches are going to stable, we need to Cc
> > stable too.
> > 
> > Cc: <stable@vger.kernel.org> # v6.0+
> > 
> > (This is specified in the
> > Documentation/process/stable-kernel-rules.rst and I'm starting to
> > enforce it here).
> 
> Yah, some maintainers want to add the tags themselves, so got into a
> (bad?) habit of leaving them out. I can add it if there's a v2.

I started adding them already from a few releases and this is the
first time I am writing it.

I won't cry if someone doesn't add it :-)

> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > ...
> > 
> > > +	/*
> > > +	 * If there's been an error, the isr needs to return control
> > > +	 * to the "main" part of the driver, so as not to keep sending
> > > +	 * messages once it completes and clears the SI bit.
> > > +	 */
> > > +	if (idev->msg_err) {
> > > +		complete(&idev->msg_complete);
> > > +		return;
> > > +	}
> > > +
> > > +	this_msg = (idev->msg_queue)++;
> > 
> > do we need parenthesis here?
> 
> I suppose not, do you want a v2 if that's the only change?

No need.

> > 
> > ...
> > 
> > > +	/*
> > > +	 * The isr controls the flow of a transfer, this info needs to be saved
> > > +	 * to a location that it can access the queue information from.
> > > +	 */
> > > +	idev->restart_needed = false;
> > > +	idev->msg_queue = msgs;
> > > +	idev->total_num = num;
> > > +	idev->current_num = 0;
> > > +
> > > +	/*
> > > +	 * But the first entry to the isr is triggered by the start in this
> > > +	 * function, so the first message needs to be "dequeued".
> > > +	 */
> > > +	idev->addr = i2c_8bit_addr_from_msg(this_msg);
> > > +	idev->msg_len = this_msg->len;
> > > +	idev->buf = this_msg->buf;
> > > +	idev->msg_err = 0;
> > > +
> > > +	if (idev->total_num > 1) {
> > > +		struct i2c_msg *next_msg = msgs + 1;
> > > +
> > > +		idev->restart_needed = next_msg->flags & I2C_M_RD;
> > > +	}
> > > +
> > > +	idev->current_num++;
> > > +	idev->msg_queue++;
> > 
> > Can we initialize only once? This part is just adding extra code.
> 
> I don't agree that it is extra code, I think it is clearer like this as
> I intentionally wrote it this way.

Yes, I understood the reason. Mine was not a binding comment.

Thanks,
Andi

> > The rest looks good. I just need to know if Wolfram has some more
> > observations here.
> > 
> > Thanks,
> > Andi



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
