Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F003C636D3
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 20:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2E4RbBugk+6x1p9jwK9omM5yC5q9Q4eC8wh8lov1NU=; b=s+MXXDvKprzchzB/fA6w8GEj77
	Tb/T4/RAOiKCVdBQ23FqhVqa/PvHss0x962ljoXP38FhqoANLFx+7b3S7a+j50YSimbjJNGVS5mvb
	UCkTXeJrJsDbH+F+J7BE4roMn5XNnrzRzp6X9EZJqLyhm8yEdZWGZIyJCGXKoXmAa6JBGv2X0trBg
	ms/khuB1VL9VzNbf+t5cxXQKpu06FEG1QQ35LWg/vh7imEMxtrjjqIRBR2YEzXwk+6n7NyvBnMczF
	eocQZjUJ4Q2u3Pg+9EMtFkS7+jOoZ1ZYuE7ZWnOmx4v9TY9UVzkaDhRaHzNb1W+72Bi4sNd2hILKZ
	k5qWJNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUl7-00DLuo-V4; Tue, 07 Feb 2023 20:40:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUkw-00DLrD-Am; Tue, 07 Feb 2023 20:40:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 092F461181;
	Tue,  7 Feb 2023 20:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9A6C433EF;
	Tue,  7 Feb 2023 20:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675802396;
	bh=w+rrQhOyjX+xSn+lkCQA/ZfXpy18C9NT1orJsYu8WrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jh1hM7/xhNsp/euzJURNrI+OgX9NYfI06u2yZss0I6KDbq+5mrqpNKv8MsLvkwADB
	 lQVMSiYfmlhEGfJ8RT7Wyx1XMNSSU3n1K3AA0HyOQ/e2OrqIZTTuBA6xNg2Iy+tF+p
	 8YA7hGhyU2ppwZAdeqqXhoKcCS4xLok2D12P55uEl+xu/KT5UiW880XEbUwHpOQgG7
	 rFApPUaz18FwXMUy1KfE7zc4IygGCc3fjLTJVvn3M7OlqpfY8jiVToMNaa7ldr6YsP
	 kW6BoUPcRZb7OoxuxQGq/t6TsGqZ5s0MfMGNZVDKOqKHUv8+qM3erYHWl0G4oaO9FJ
	 YSP3OLGluXDHg==
Date: Tue, 7 Feb 2023 20:39:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: Stephano Cetola <stephano@riscv.org>, Jeff Scheel <jeff@riscv.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, pbonzini@redhat.com,
	Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com,
	anup@brainfault.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
Message-ID: <Y+K3FyGrNUQJZao8@spud>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAK9=C2X8C4yswGhDwe1OzQXTELXQxp8=ayiFxh1aVMk4TxeDjw@mail.gmail.com>
 <Y+KS16ZNXrDU+xun@spud>
 <CAOnJCUKKRRCrKN17ytczYXVLTcMkFaZsg6QXKjPUuSk=PqL6JQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCUKKRRCrKN17ytczYXVLTcMkFaZsg6QXKjPUuSk=PqL6JQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_123959_046425_941E7419 
X-CRM114-Status: GOOD (  38.98  )
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
Content-Type: multipart/mixed; boundary="===============9045515870965239635=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9045515870965239635==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zu6F9f3ZsZxSjFKz"
Content-Disposition: inline


--zu6F9f3ZsZxSjFKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2023 at 10:15:22AM -0800, Atish Patra wrote:
> On Tue, Feb 7, 2023 at 10:05 AM Conor Dooley <conor@kernel.org> wrote:
> > On Fri, Feb 03, 2023 at 05:31:01PM +0530, Anup Patel wrote:
> > > On Fri, Feb 3, 2023 at 5:54 AM Palmer Dabbelt <palmer@dabbelt.com> wr=
ote:
> > > >
> > > > On Fri, 27 Jan 2023 23:27:32 PST (-0800), apatel@ventanamicro.com w=
rote:
> > > > > We have two extension names for AIA ISA support: Smaia (M-mode AI=
A CSRs)
> > > > > and Ssaia (S-mode AIA CSRs).
> > > >
> > > > This has pretty much the same problem that we had with the other
> > > > AIA-related ISA string patches, where there's that ambiguity with t=
he
> > > > non-ratified chapters.  IIRC when this came up in GCC the rough ide=
a was
> > > > to try and document that we're going to interpret the standard ISA
> > > > strings that way, but now that we're doing custom ISA extensions it
> > > > seems saner to just define on here that removes the ambiguity.
> > > >
> > > > I just sent
> > > > <https://lore.kernel.org/r/20230203001201.14770-1-palmer@rivosinc.c=
om/>
> > > > which documents that.
> > >
> > > I am not sure why you say that these are custom extensions.
> > >
> > > Multiple folks have clarified that both Smaia and Ssaia are frozen
> > > ISA extensions as-per RVI process. The individual chapters which
> > > are in the draft state have nothing to do with Smaia and Ssaia CSRs.
> > >
> > > Please refer:
> > > https://github.com/riscv/riscv-aia/pull/36
> > > https://lists.riscv.org/g/tech-aia/message/336
> > > https://lists.riscv.org/g/tech-aia/message/337
> >
> > All of these links seem to discuss the draft chapters somehow being
> > incompatible with the non-draft ones. I would very expect that that,
> > as pointed out in several places there, that the draft chapters
> > finalisation would not lead to meaningful (and incompatible!) changes
> > being made to the non-draft chapters.
> >
>=20
> Here is the status of all RVI specs. It states that the Smaia, Ssaia
> extensions are frozen (i.e. public review complete).
> https://wiki.riscv.org/display/HOME/Specification+Status
>=20
> I have added stephano/Jeff to confirm the same.
>=20
> AFAIK, IOMMU spec is close to the public review phase and should be
> frozen in this or next quarter.
> IIRC, this chapter in AIA will be frozen along with IOMMU spec.
>=20
> Anup: Please correct me if that's not correct.
>=20
> > Maybe yourself and Palmer are looking at this from different
> > perspectives? Looking at his patch from Friday:
> > https://lore.kernel.org/linux-riscv/20230203001201.14770-1-palmer@rivos=
inc.com/
> > He specifically mentioned this aspect, as opposed to the aspect that
> > your links refer to.
> >
> > Surely a duo-plic, if that ever comes to be, could be detected from
> > compatible strings in DT or w/e - but how do you intend differentiating
> > between an implementation of S*aia that contains the IOMMU support in
> > Chapter 9 in a finalised form, versus an implementation that may make
> > "different decisions" when it comes to that chapter of the spec?
>=20
> We will most likely have an extension specific to iommu spec as well.

Right, but unless I am misunderstanding you, that is an extension for the
IOMMU spec, not for Chapter 9 of the AIA spec?

I would say that it is likely that if you have AIA and IOMMU that you'd
want to be implementing Chapter 9, but that would not appear sufficient to
draw a conclusion from.

Maybe the RVI lads that you've added (or Anup for that matter!) can
clarify if there is a requirement that if you do AIA and IOMMU that you
must do Chapter 9.
If not, my prior question about a differentiation mechanism still applies
I think!

> > I thought that would be handled by extension versions, but I am told
> > that those are not a thing any more.
> > If that's not true, and there'll be a version number that we can pull in
> > from a DT and parse which will distinguish between the two, then please
> > correct my misunderstanding here!

--zu6F9f3ZsZxSjFKz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+K3FwAKCRB4tDGHoIJi
0nRUAQCzGk/oJbWN9mf9OIFLN+uyotpOGeyxY90lVVK4R5DBpgD/SR9y2qhD9PD/
NukTfTz4ynWyNGYdGD5ZL6W7V2x9DAg=
=ZDei
-----END PGP SIGNATURE-----

--zu6F9f3ZsZxSjFKz--


--===============9045515870965239635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9045515870965239635==--

