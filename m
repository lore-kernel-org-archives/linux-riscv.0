Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468C8D73094
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwx1kmU6b1MKqbMtb4UTtLnRjpzp4B1Ndbf1w8ULSEY=; b=qALF1CAVEr25Nk
	rerPncYgvCp4QcVY1I2VPxYirzYKiR27nsivfJ6gF7Op3LTYvZHLHioGWyzqSzW0dK6QJc4HbqrZm
	oSIP5vxZiS+rnX8sRToo3DSecZTpjnl/Yi8jYag7XIwQjuDrM8K/mXyhcj07MuU1csPpF2SCflGD6
	Et0D2u4h1myyOw6gLeohZ/JM8cBS5fZbSDFouyG6AfxVsIyC0vPYeq1JlLBkJ0nkrtwMiOeS7bIoQ
	bWz6nu39Hv4wAGnCW8agTeAhL0o6xnTLObhmUWc4DmcIBuDYuAMAL0vTu7DwgKQMVfrxDOm1uHNot
	mVlqRiZhHIlXBBBOhOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92mw-00000003YQG-0fw3;
	Sat, 04 Apr 2026 15:19:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92mv-00000003YQ4-0JLE
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 15:19:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 095C360008;
	Sat,  4 Apr 2026 15:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232EDC19421;
	Sat,  4 Apr 2026 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775315991;
	bh=RZpBy1W8ddbDfVqW4Yh7lVZzo1IIk9BJk40f7jgPCMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9rT3Mys8dnrL+UZLBgvvxKaSDo6+VTgrt2wP6IMdYbxMIHrXDgBBuqBOrb16jcqo
	 HA+SZ3HfSbkE1ISXvLb2AClsOMa/yD8FZ7yrs74vrW2tfHti/B0Y6k32QBjnj8RzsF
	 1Bkx2WMdqSyZrn9ggWUgVJxg0yXodaYaxsB8+OznHYzgj9mI4F3yopcrfNkxKvSWI7
	 bQ4ah0r7jiPcpsxrwRQr0LuOf9+MdLzPJtrNgsSKPRem6mQKiiiPqEGqiY4vy6BvEN
	 5BsDVRNtuNmJtqY486oFJJLq19b8lNbJ+/fDsPYgZ/BQCbR/zoq1NeU6wmhkKW5ZCq
	 uEGFdFHBtWYXw==
Date: Sat, 4 Apr 2026 17:19:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, 
	soc@kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
Message-ID: <20260404-accomplished-rainbow-dragon-fce194@quoll>
References: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>
 <ac7rV0xGGVmxT-V4@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac7rV0xGGVmxT-V4@inochi.infowork>
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

On Fri, Apr 03, 2026 at 06:25:32AM +0800, Inochi Amaoto wrote:
> On Thu, Apr 02, 2026 at 11:43:43PM +0200, Arnd Bergmann wrote:
> > On Thu, Apr 2, 2026, at 04:39, Chen Wang wrote:
> > > For CV18xx serials:
> > > Just a minor patch to replace the compatible for
> > > dma-controller to allow setting DMA channel number.
> > > New bindings and driver part change are picked by
> > > DMA subsytem and this patch handles the left dts
> > > part change.
> > >
> > > Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> > >
> > > ----------------------------------------------------------------
> > > Inochi Amaoto (1):
> > >        riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set 
> > > channel number for DMA controller
> > 
> > Doesn't this change break backwards compatibility with
> > all existing kernels?
> > 
> 
> It will break if a old kernel with the new dtb. But I
> think this will break nothing since the DMA device is not
> used by any devices in the old DTB. And if a user force
> the some device with DMA in the old version, it is just
> not functional and lead to a broken system.

Then commit msg should explain that old compatible just never worked.

Please update the commit msg and fix the DCO.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
