Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF037E70704
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xygE6x4yxxVX7PqbX1yHWoe5ncWVtDD5BlcmVPrFClY=; b=lDhOgMbzXtEHru6XN6E3YTQ4sS
	oRpc2XecoQmQvyBjtO943pAdPnwvqrW93/Dz+oWqO0hEn7S/F5DBmgy/6jp4mYDvXLQZxoJRcWHoY
	PDom5vxCNFtYGoUS80BGIO3zWrbIu99YQYNrGV4fTVI/1KkipyX0i7S13iNVUdUdWoXN0yM+MxTD8
	2c4YGXhhjy0cXznR8BWLhritoQ0xE/XzgScVi1OzEunMf/ktCNBzPPxIRqJjWtjsc26mpkmyCGyuw
	qdUPB3lHdvwcXF+UFNmL2OsPXLQ6uxnAXjx0bYl0+hc3Sw3kZ/XIdAQDpSALS0H+zRyPU/PwGtwa1
	/A/adxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGbw-005frA-1Z;
	Thu, 21 Sep 2023 10:08:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGbs-005fqc-35
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 10:08:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5BFA1B81FF5;
	Thu, 21 Sep 2023 10:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52320C3278B;
	Thu, 21 Sep 2023 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695290913;
	bh=UXIb6Gtkdi+MN3kmqm7aii+87RuNa+eTtdhThpf2wtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipcVvxNyFPFQy1OBIDDP6QPuZFa/4buNI6TuQWIFFfPunszk4aJQUrzkBPM2VYscL
	 myLQxtk5aWDqZ4dBRfCDH1+SJbb0U41l8YmD8N3Fwv7YnTZq+ecvEDLnyb7luZ282D
	 bTwgAXYkIq/afeNGpTfOkF2MYzeq25rYWGDgyxBD6kIbEdnoUPrjlgJQNQqM+ESQCM
	 fMk8NyVVZr9aXpr3G0GBXlRWJnqSYMgSFC3KCqmXECZHmJC9hO24Fao1lkHgUCPfVt
	 vwfJRW/+LJw+8CZyH209dFi/4tMlyLW8WEjnjtKziESAcfZB/EjCPaOfYHlXUMH2ml
	 D5KQizM8OatCA==
Date: Thu, 21 Sep 2023 11:08:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <20230921-4a1fe80384e083c67f38dc27@fedora>
References: <20230912072232.2455-1-jszhang@kernel.org>
 <20230912-trailing-pampered-52738ec6f009@spud>
 <ZQHSLdPufI6CXApg@xhacker>
 <20230913-faster-spotted-9df41a0d7787@spud>
 <20230920-pesky-stalemate-88f5036b8084@wendy>
 <ZQwL6fxi6IkUEIMc@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZQwL6fxi6IkUEIMc@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_030837_309849_BC29B2D9 
X-CRM114-Status: GOOD (  28.75  )
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
Content-Type: multipart/mixed; boundary="===============4123982312522851602=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4123982312522851602==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bPWJGUhTeKkvs9Tb"
Content-Disposition: inline


--bPWJGUhTeKkvs9Tb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 05:24:57PM +0800, Jisheng Zhang wrote:
> On Wed, Sep 20, 2023 at 09:36:19AM +0100, Conor Dooley wrote:
> > Hey Jisheng,
> >=20
> > On Wed, Sep 13, 2023 at 04:44:18PM +0100, Conor Dooley wrote:
> > > On Wed, Sep 13, 2023 at 11:15:57PM +0800, Jisheng Zhang wrote:
> > > > On Tue, Sep 12, 2023 at 05:27:31PM +0100, Conor Dooley wrote:
> > > > > On Tue, Sep 12, 2023 at 03:22:32PM +0800, Jisheng Zhang wrote:
> > > > > > riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 i=
sn't
> > > > > > dma coherent, so set dma-noncoherent to reflect this fact.
> > > > > >=20
> > > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > > Tested-by: Drew Fustini <dfustini@baylibre.com>
> > > > > > ---
> > > > > >=20
> > > > > > Since v1:
> > > > > >  - rebase on v6.6-rc1
> > > > > >  - collect Tested-by tag
> > > > >=20
> > > > > Does this mean you're expecting me to take this?
> > > >=20
> > > > Hi Conor,
> > > >=20
> > > > I think I will take this and send PR to soc people. The reason
> > > > I send v2 is the rebasing on new rc1 and v1 wasn't in linux-riscv
> > > > mailist due to typo;
> > >=20
> > > Great, thanks. Please ask SFR to add your tree to linux-next.
>=20
> Hi Conor,
>=20
> I'm not sure how to do this. When MAINTAINERS patch is merged, send
> an email to Stephen Rothwell, are these steps correct?

Sorta, yeah. You don't need to have the MAINTAINERS patch merged first
though, just send him a link to your tree and the branch name(s) & he
will include it in linux-next.

> > I lost my main x86 box over the weekend (looks like probably a dead
> > motherboard), so I may have missed a response to this.
> >=20
> > Did you see this email? Additionally, can you add that git tree to the
> > maintainers entry for the thead devicetrees?
>=20
> I just created a tree in
> git://git.kernel.org/pub/scm/linux/kernel/git/jszhang/linux.git
>=20
> But it needs time for cgit to take place. I will send a patch
> once it appears.

Looks to be there for me now. Thanks for doing this!

--bPWJGUhTeKkvs9Tb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQwWGAAKCRB4tDGHoIJi
0sISAQC81pcK6dxRnt5vF0SO499G3v3lirfzD5lgcsGOq04gCQD/VMZGi5Cm0STf
Dp/UDzxY5lbelmR/70AByz/AYjMifwc=
=h36f
-----END PGP SIGNATURE-----

--bPWJGUhTeKkvs9Tb--


--===============4123982312522851602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4123982312522851602==--

