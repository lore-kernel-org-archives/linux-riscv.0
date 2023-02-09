Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C87BC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 23:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUXZS+vTaSEz+HPbAYy5LJSSsBu4Ft75sLAR2JlERSM=; b=Ri/TCbuoCQCW58Ca+/I+nwHftk
	6LrdjR2R+eWKl/qksL43F1VQb04LjsXxh7wBw9/93RiuVn/pFYC2542Sf+0plYPW09uEc4pkrrUsk
	DKfBG9OUesN1w8e5mpzu7E2a4HkasiSOUf2OP8CFDIrg/RKD25CS3cncQoynSQnIP6XBgs/2FLih2
	Pkt1cRPTgcGbgz56ZC4AEJhrQjeTD90NQWCtA8msgsSp9LRrHniaVM0wH1mpdj/YhBcor13+sr8NB
	NM/mqKuz6N+9gR+Oy4/7eKtTI2gw7kJ7yPQqfqr2UIaQYXitShqWRWpf1q/jFWkahh7HemSX6I/OL
	Mg4F7Jkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGO9-003XCp-4J; Thu, 09 Feb 2023 23:31:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGO6-003XB0-2x; Thu, 09 Feb 2023 23:31:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 77097B821A7;
	Thu,  9 Feb 2023 23:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0F6C433EF;
	Thu,  9 Feb 2023 23:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675985491;
	bh=O69LuhcZctd57x4lhJFdI4eIyFQSa4iSqPKotAdsMPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufFIYrT9UvLFb9qyPXt821NOnhRi4wl83XuBhkKVoT3uRaTvaXkMYdTvXuBlRiVCH
	 lL4Vxuewop0JrgU9U1VGZZ59u8rjcYnZB007pA+WN9gR7juX7RHjo6rZSxIvz78jWc
	 bWyP1tL9I1gNbOJ8fL1pkm1qYlIZmwEKboE5b8u3CnWaQcwtN7MYEJf3DqtTXwjo0f
	 YgDAFykZxjYhC1sTpsyozbKJ40tQajhzMCx9uMoL4d/1oEFrs3y8cY86s9fCB+8Svm
	 IFTjkcK9wM14PFlw1Ssh/zSpN5C/Zc5tmp/mAoOSV2cmPkqs2u1hcVwdZ8B79sswW6
	 x7IVYN87AT3VA==
Date: Thu, 9 Feb 2023 23:31:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@atishpatra.org>,
	Stephano Cetola <stephano@riscv.org>, Jeff Scheel <jeff@riscv.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, pbonzini@redhat.com,
	Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com,
	anup@brainfault.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
Message-ID: <Y+WCTDgtTwLB/8re@spud>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAK9=C2X8C4yswGhDwe1OzQXTELXQxp8=ayiFxh1aVMk4TxeDjw@mail.gmail.com>
 <Y+KS16ZNXrDU+xun@spud>
 <CAOnJCUKKRRCrKN17ytczYXVLTcMkFaZsg6QXKjPUuSk=PqL6JQ@mail.gmail.com>
 <Y+K3FyGrNUQJZao8@spud>
 <CAK9=C2VnkK5GNO4D1AWpiNcTE=OrSueN9NAyhR7rj9csuUi4Mg@mail.gmail.com>
 <Y+OcId2PZ0pi5T08@wendy>
 <CAK9=C2VeyJMHocZMQTZoULveAcH0kdH2vBKZYFt5kq9dMYP_Bw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2VeyJMHocZMQTZoULveAcH0kdH2vBKZYFt5kq9dMYP_Bw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_153134_468905_C908C9FD 
X-CRM114-Status: GOOD (  24.81  )
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
Content-Type: multipart/mixed; boundary="===============5652336093185360750=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5652336093185360750==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vv2d+yOSyM4AvbL5"
Content-Disposition: inline


--Vv2d+yOSyM4AvbL5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey all,

Just circling back to this one, since the reply from Palmer was to
another thread with a much smaller CC list.

On Wed, Feb 08, 2023 at 08:27:23PM +0530, Anup Patel wrote:
> On Wed, Feb 8, 2023 at 6:27 PM Conor Dooley <conor.dooley@microchip.com> =
wrote:
> > On Wed, Feb 08, 2023 at 09:24:28AM +0530, Anup Patel wrote:

> > > The presence of S*aia in ISA string only implies that AIA extended
> > > local interrupt CSRs are implemented by the underlying RISC-V
> > > implementation.
> >
> > Would you mind linking to where this is documented & explaining in your
> > commit message why it is okay operate on the basis of s*aia in the ISA
> > string only mandates the presence of the CSRs and nothing more.
> >
> > I think when I was reading it last night, I saw some commentary in this
> > vein in Section 1.6 of the rc2 spec. Although IIRC it noted changes in
> > interrupt behaviour there too, so I'm not sure if that section is what =
you
> > are referring to here.
> >
> > Perhaps this is all just a good argument for providing more information
> > in commit messages ;)
>=20
> Sure, I am anyway going to send v3 after rebase so I will cite the
> Section 1.6 of AIA spec in the commit description.

We had a nice conversation about this on during the weekly patchwork
sync call :)
The end result of that one was "inconclusive" and the outcome appears to
be that we will wait until the entire spec is frozen before doing
anything here.
Palmer left a comment in response to another thread to that effect:
https://lore.kernel.org/linux-riscv/mhng-474f7ecd-65b8-4cfa-8b75-e51b896cc5=
8e@palmer-ri-x1c9/

Cheers,
Conor.


--Vv2d+yOSyM4AvbL5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+WCTAAKCRB4tDGHoIJi
0q6sAP49zNucepjSQABZqre91PwzpDcltIfXd1XLoWl0qDu0CQD7BAx2at0D4LVx
XsqZPYOLysSc280F7lsVo8sayoX3Egs=
=wLGy
-----END PGP SIGNATURE-----

--Vv2d+yOSyM4AvbL5--


--===============5652336093185360750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5652336093185360750==--

