Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBF5C001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HHOdo/QymojHh6Qjyc154l7zzuNzJZasJSOQ1MMZ8A=; b=Bd70rgIJGVhVL38JRhQ8XGhrKu
	iW8MMP4X7NlB+RsrxQ4QkcInJR1hMizM8nmDrGwgxNhiOlnWy8BuVpbooydvZaCJ+ZV4ejjnwSQN0
	KAbFryLW6UAqGJie3GL4VBXEHRbKkWPSWfsJT3zkw8Cp8hs6dgjiKKH7zmWw7h9uQl9wE8LoXtMYr
	n/hRfEd4hQZRv0MM8MXFOeXetHVGvJQPUkh8L98jhMJU868uyAxHQqg17lUrZFLMzOBR+w8joo2Jb
	K0/639dFqw1toTRs9CEoO1XN5pPeCdABZL8SLxc2rmF3QlHGeeemSW2PwUq2lDe8Gr9Vfh7POndIF
	w0PR8YGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0vX-0047qh-06;
	Thu, 13 Jul 2023 18:20:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK0vR-0047pg-2X
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 18:20:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C9EE61B16;
	Thu, 13 Jul 2023 18:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D20FC433C8;
	Thu, 13 Jul 2023 18:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689272421;
	bh=C34nMugqhbX0HI37ma/soGcnMlHMUnN6gOJPqexkCvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2bbDHnAUW8aBNxg2Ow1CF1eGjwnomvgOAflziTYxD8HUnQqP0o+570J/bH9IuATo
	 m0tf3lBeDZf2yIdnH/BsZfDXPl1FGtF+GRPu5UtvWLjP9/6lPN+ILVLr6uw0QFgUBf
	 TH4yRU1CWT13PgJQ/C7/gGeGntfIKORkH09/vhkE8ziU1IftyqURP22u8jUvyBhznF
	 ELmHjKl5WOyj52PKlibTFppXj2cQJpKFcZC9aLw9aWNOFApK9cdcvel21qTJeI8fPx
	 YyPuFdKDZLXsqUL2wa4ldJ0wo/VhWFJIeSVvFBCDS2ZlVl2bbvaFUpAr2MtP+tcGNL
	 XQNqtowDzZAXw==
Date: Thu, 13 Jul 2023 19:20:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, guoren@kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
Message-ID: <20230713-frantic-plug-737b95b15553@spud>
References: <ZLAoIWX+qqWvucWz@xhacker>
 <mhng-40ca9d23-1074-4f5b-8ccd-e7e919f68928@palmer-ri-x1c9a>
 <20230713-chive-undesired-269a54eb53db@spud>
 <ZLAwgLNyTiK7jbwM@xhacker>
 <20230713-mushiness-runt-0797dbb761e8@spud>
MIME-Version: 1.0
In-Reply-To: <20230713-mushiness-runt-0797dbb761e8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_112025_904555_2C5D9D31 
X-CRM114-Status: GOOD (  24.64  )
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
Content-Type: multipart/mixed; boundary="===============3580169552721650286=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3580169552721650286==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+UrYOnxsQ7vO57jH"
Content-Disposition: inline


--+UrYOnxsQ7vO57jH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 06:36:56PM +0100, Conor Dooley wrote:
> On Fri, Jul 14, 2023 at 01:12:32AM +0800, Jisheng Zhang wrote:
> > On Thu, Jul 13, 2023 at 06:04:22PM +0100, Conor Dooley wrote:
> > > Jumping on top of Palmer's reply cos I had already started replying...
> > > On Thu, Jul 13, 2023 at 09:56:34AM -0700, Palmer Dabbelt wrote:
> > > > On Thu, 13 Jul 2023 09:36:49 PDT (-0700), jszhang@kernel.org wrote:
> > > > > On Wed, Jul 12, 2023 at 06:48:02PM +0100, Conor Dooley wrote:

> > > > > this patch is provided, but can we mitigate the situation by care=
fully
> > > > > review the DTs? Per my understanding, dts is also part of linux k=
ernel.
> > > >=20
> > > > That would break compatibility with existing firmware.  It's certai=
nly
> > > > something that has happened before, but we try to avoid it where po=
ssible.
> > >=20
> > > (Mostly in reply to Jisheng again)
> > > Sure, some devicetrees are part of the kernel, but not all are - they=
 may
> > > be passed up from U-Boot or OpenSBI etc & contain "v" in riscv,isa.
> >=20
> > If so this looks like a bug of u-boot and opensbi.
> >=20
> > PS: does u-boot/opensbi modify "riscv,isa" property dynamically? Or
> > there's below usage case:
> > mainline linux kernel + dtb which is built from u-boot/opensbi source
> > code rather than linux kernel.
>=20
> Its the latter I am thinking of. If someone wants to go and double check
> that there are no vendors shipping T-Head cores with firmware that
> behaves that way, then the patch could I suppose be dropped.

I don't have one (yet), what is the boot flow in that regard with the
vendor shipped software on the lichee pi4a?
The D1 from the factory is a mess & I use Samuel's firmware/bootloaders,
so it is well behaved :)

--+UrYOnxsQ7vO57jH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLBAYQAKCRB4tDGHoIJi
0ueQAQDhIAT/1UDj4w9VMUrWQJAa5C0iQkw8lxo3/hoGoRstdQD7B6ukdCzG82T2
PsXmPtK+1bV4k67zc3YJrNC4qhXMcgU=
=VlEm
-----END PGP SIGNATURE-----

--+UrYOnxsQ7vO57jH--


--===============3580169552721650286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3580169552721650286==--

