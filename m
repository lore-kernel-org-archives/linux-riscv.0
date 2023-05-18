Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEF2C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEnQenNqxMCf8UTaAwKNmfmWO3gdiMpfPnUZ+6fDm24=; b=1XOV33mcKARaBWrX5GtK2f97nt
	k9YmSdj5gbsF6TJF+bfBTEqbh2jOsyg703wTJkncishQlVBsJgpYrTnM3rw1aip/fP8lZ1Lnmqee8
	WR8Y/mujEv/2Ayprl+s2CFgogdaCsNzqZJMtfHWtFuHSIoHqkh0gOzpn2Bm338ZOdtv8VpVRW+Ql8
	1T+v5YA/HvKk4F5awi+UtVWF0wpP5qhCr16AvNr9GZo9+1lJG0Vic/8Yu3LyG/qhODMSB2ClM3WdJ
	Ug7ffLdSIptHVdB1qY61Wl00mDMuoXEJUqve1N7DI0JdRMC5hLZ2EXHKhNW5f4p59Xa5XH7xndHuY
	rcL+DsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzh5F-00DZym-2n;
	Thu, 18 May 2023 17:06:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzh5E-00DZyI-09
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 17:06:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6AAD560EFA;
	Thu, 18 May 2023 17:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2548DC433D2;
	Thu, 18 May 2023 17:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684429590;
	bh=XL8Q8LxpeG+xUSW+d2Fhz16+YABT67r3plx3O+Y35ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYDwNwjeRfNEkfoyIRyJq3Fohsc3ZIt3WbvX+OQ++ceTWjibgZ24NbiSU4vfGEufv
	 E7/MG8tjVbYn8mfTzAqH4bsSYhCAPy4wioXysSz9c9jyKzRIwkWR4YFCfxF+QkoWHa
	 SjilsAYEF5gzcKD+jg9x90stMTD6SLJsxPxhPjJZW0StGE3IfSLuaGFwHOy8eBK4OM
	 i59muo8WKsAEN4/0QTZOrGqA5Hx1JqDnrSJpknH+axhqo4xWAcFso0ezUz0FDXuSnL
	 xP1/Z3FypEnI8MGE/wgMHsOmzfJ6SUoZ43dLzibDtQNclaBobAMq0a6Jey31YekcNb
	 7Uu1mISU27XeQ==
Date: Thu, 18 May 2023 18:06:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, anup@brainfault.org,
	ajones@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	Alistair Francis <Alistair.Francis@wdc.com>,
	apatel@ventanamicro.com, atishp@atishpatra.org, jrtc27@jrtc27.com,
	rick@andestech.com, ycliang@andestech.com,
	linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
	u-boot@lists.denx.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230518-elective-mossy-1bf147f5e9b8@spud>
References: <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <mhng-95b99ff5-9024-4672-bb84-7599f7a05129@palmer-ri-x1c9>
MIME-Version: 1.0
In-Reply-To: <mhng-95b99ff5-9024-4672-bb84-7599f7a05129@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_100632_164488_507135E4 
X-CRM114-Status: GOOD (  21.25  )
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
Content-Type: multipart/mixed; boundary="===============5887288707973944682=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5887288707973944682==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TKxZvzqyNscVPD5H"
Content-Disposition: inline


--TKxZvzqyNscVPD5H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 07:41:17AM -0700, Palmer Dabbelt wrote:
> On Thu, 18 May 2023 07:06:17 PDT (-0700), Conor Dooley wrote:
> > On Thu, May 18, 2023 at 07:13:15PM +0530, Anup Patel wrote:
> > > On Thu, May 18, 2023 at 4:02=E2=80=AFPM Andrew Jones <ajones@ventanam=
icro.com> wrote:
> > > > On Thu, May 18, 2023 at 09:58:30AM +0100, Conor Dooley wrote:

> > > One downside of this new approach is it will increase the size of DTB.
> > > Imaging 50 such DT properties in 46 CPU DT nodes.
> >=20
> > I should do a comparison between 50 extensions in riscv,isa and doing
> > this 50 times and see what the sizes are.
>=20
> I'm not sure how sensitive people are to DT size (presumably it'd be DTB
> size)?
>=20
> It's also not clear what we can do about it: RISC-V has lots of extension=
s,
> that's going to take encoding space.  Sticking with an ambiguous encoding
> because it's smaller seems like a way to get burned in the long run.

I did actually go an look at this. I cheated a little and renamed the
properties to "riscv,isa-ext-foo", which is about as communicative IMO
as the longer name I currently have, but may seem more agreeable to the
size conscious.
I added 30 cpu nodes to mpfs.dtsi, each with 100 extensions of 6 chars
long. With just the string, containing "rv64imafdc_zabcde_...", it was
unreadable, but "only" took up 46k.
I then removed the multiletter extensions from riscv,isa & switched to
riscv,isa-base & 100 booleans. IMO it was more readable (although still
quite bad!), but took up 62k.
Removing all of the boolean properties, leaving me with 30 addtional harts
with "rv64imafdc" only, was 26k.

I think the generic limit for dtb files is 2 MiB? To me the size
increase doesn't sound like a bit problem.

--TKxZvzqyNscVPD5H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZbEAAKCRB4tDGHoIJi
0s2UAQC3dbtneTDqOvEpuMHz7vzTT/qCO/nEAhYVxRjH0MasoQD+IWeuh0pZj7Y/
NPtfbaq3ryBkiGdWFoAC2ls1S9xcNAo=
=0mwD
-----END PGP SIGNATURE-----

--TKxZvzqyNscVPD5H--


--===============5887288707973944682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5887288707973944682==--

