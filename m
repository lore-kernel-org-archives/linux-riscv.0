Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C7DC001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZeiIF74cz0lLu2N+/+QUwQiZWFhWXT07Opm3uK+blk=; b=qrSmJFM1botDde
	XrSPSnAcUlN49uVzvdluZ+jvryleM8ZJ5IKmoP61Nb8tIgIY35UzgmpOgtdUCx7orUApN4/D9YUS/
	ge953b8Fa68GESlMcIfzTRgdlw8jnKovPLD2gswAfpELty5ATJRYGDzCmKJztAyCKlLG93ocOJP5X
	FVzK3SEMV0pCUTDeYG6K6ACINKtGZ29fK8LHD2wi3SeP92c+j5/hPz3bZTLro3QY5Nk0tQQfIuMU0
	vQLgfVJgt29QWuI0hUCfgxK/zUHVh8UVVqGmljd2V3dVjxi7erkt/iLXdCcPn15q1hW49q1sC4gRN
	iSulRzm39IaQhu9GHYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3hh-00GTR9-1a;
	Thu, 27 Jul 2023 16:19:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3he-00GTOe-1b
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 16:19:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC96161DC5;
	Thu, 27 Jul 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480EAC433C7;
	Thu, 27 Jul 2023 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690474741;
	bh=cJ2cDKD5pRIvYteZ8B5krBjQ4B4gVvlooKDjuLtiIhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoEWnIFD83r351XEsxp9P0RXdeJV9VdRPJaqQPVxSVr+jN5IyccVQ+/S7XbnWF1Xd
	 Fi+dY6eaQa23fbjGqg2iiL5vy4lk5My42x+IeOBgu6/Vz6lhzioUngM6bqQFiGNu0u
	 wgRlTKneUqioguLi9gLciGvCkezMfKq77xSpfiEVbeBMvcEdXBnuz0eBMOKi9D4ZTo
	 KqUZn6yavNDS4R4qWv8utnfN/dvR3VaY2wxM2oAx98sOa1SVtQn0Wv55LyLTdWCfej
	 P7s8JBf02WimlJBXF6drFLzt7hynejm9FD0sQgC5VonCyvwRzgAuIXXGEA3y4z85Dc
	 pYP+KCwIP6b6g==
Date: Fri, 28 Jul 2023 00:07:23 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Kwanghoon Son <k.son@samsung.com>
Cc: 'Drew Fustini' <dfustini@baylibre.com>,
	'Conor Dooley' <conor@kernel.org>, 'Guo Ren' <guoren@kernel.org>,
	'Fu Wei' <wefu@redhat.com>, 'Rob Herring' <robh+dt@kernel.org>,
	'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
	'Conor Dooley' <conor+dt@kernel.org>,
	'Paul Walmsley' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt' <palmer@dabbelt.com>,
	'Albert Ou' <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	'Robert Nelson' <robertcnelson@beagleboard.org>,
	'Jason Kridner' <jkridner@beagleboard.org>
Subject: Re: [PATCH 1/3] riscv: dts: thead: add BeagleV Ahead board device
 tree
Message-ID: <ZMKWO2vksQn8dUR4@xhacker>
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v1-1-ccda511357f4@baylibre.com>
 <20230723-savor-trolling-e35ed4a7a751@spud>
 <ZL1jlacHj7sgNg8M@x1>
 <CGME20230724003542epcas1p4c6c8dbd042af792bc168e10c6e81e45d@epcas1p4.samsung.com>
 <ZL3Eenj4lGZDhZTM@xhacker>
 <000001d9c070$82638290$872a87b0$@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000001d9c070$82638290$872a87b0$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_091902_577297_B5FB4283 
X-CRM114-Status: GOOD (  17.57  )
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

On Thu, Jul 27, 2023 at 06:55:37PM +0900, Kwanghoon Son wrote:
> > On Sun, Jul 23, 2023 at 10:29:57AM -0700, Drew Fustini wrote:
> > > On Sun, Jul 23, 2023 at 11:32:17AM +0100, Conor Dooley wrote:
> > > > On Sat, Jul 22, 2023 at 02:55:39PM -0700, Drew Fustini wrote:
> > > >
> > > > > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > > @@ -0,0 +1,61 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > >
> > > > Hmm, should this not be dual licensed?
> > > > I notice the other th1520 stuff isn't either..
> > >
> > > Good point, I'll resubmit with a dual license.
> > >
> > > Jisheng: are you okay with the other arch/riscv/boot/dts/thead files
> > > changing to a dual license?
> > 
> > When cooking the initial patch, I wrote the lpi4a dts files from
> > scratch based on sipeed opened sch file, and currently only I made
> > contributions to them, so it's easy to make the lpi4a dts files
> > dual license.
> 
> Thanks for your work.
> Is there any datasheet or user manual can get on public?

Sorry I can't help on datasheet.

> I'm going to contribute drivers in my spare time,
> but it's hard to know the register file and dma information.
>  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
