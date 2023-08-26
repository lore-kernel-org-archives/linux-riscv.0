Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2065C83F01
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 09:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sy0LnWrO/4jw9rH0OzwCXErJA5uZSEmLar1cWwkLPE=; b=3NrUK41xenPTbWxQ7kiwa+mNPk
	RHduIt+ddmCW9/Exx+vpPjyK8TEPGQIJapD+4Oct+jaWS+8VA/xIlg9WHzHVokN/3vCb2WgSgUMhP
	UZJ9yphBaafwej82ufLq/qG7EXroDzIERyHMIAPrZulVZo70tSViqoajK5Vx+cU/bMctyb5bxq/qq
	IRJGCDNhBI3BUIQSCJsQRsCAUQrr/XkVhyQUT504KU+GRETDVnDccqjO+HmQBSyKL2H/iThkrWVDE
	gMepXRDv2Pa6a/9mdBTFCMQNcO64+sPiHTVDrYv7OSpBuDYZjtsRa/uJFvwOq39vA4U7+T3LXn0vW
	02coE5+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZq22-006eNB-17;
	Sat, 26 Aug 2023 09:56:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZq1z-006eMs-1W
	for linux-riscv@lists.infradead.org;
	Sat, 26 Aug 2023 09:56:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED91D604F5;
	Sat, 26 Aug 2023 09:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A135BC433C8;
	Sat, 26 Aug 2023 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693043794;
	bh=qlZJ4SptZpC3yzlNPg9RvGeSpsH0gDY6HJ2kxhhw/TY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcXdebU+QGtCLb13X/77v6ukAdI/a6OlUpm7Jlx++Mf0E3YrE2YDhVWLzWdo4Ak9n
	 LV88+EYn7SVefmnEgBTkxaC1bCbzALvbYgztwNQknPIPqDVzKntmSWq0mjntZAzhXJ
	 fpR6JZsPthKr3SRkDrHQsQOgkIgtVjAsh3lBr11Ro9ZAqXhwlEEBTIImwSj5ElOCu0
	 FvH6EluxwE89Qui8TaocibQ65mQ7s9BnNBxxUw4m3N0ZOf8qVHNF0OmaXIirikudQ2
	 vbP8Uj4bGnqe3gF9XApvm6m6CMBU+WViytPOyfVoCTPlF9EHn25L+G8Tn6BPcrFwwY
	 t03aOnvo9CzXA==
Date: Sat, 26 Aug 2023 10:56:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v5] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230826-copper-suffocate-5f4f0e67f9a7@spud>
References: <20230825231139.1145522-1-evan@rivosinc.com>
 <20230826-anguished-tutu-81d63b3081a7@spud>
MIME-Version: 1.0
In-Reply-To: <20230826-anguished-tutu-81d63b3081a7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_025635_622841_350FED75 
X-CRM114-Status: GOOD (  28.29  )
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
Content-Type: multipart/mixed; boundary="===============5877363598735198659=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5877363598735198659==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZgcPN0UduebIi3vr"
Content-Disposition: inline


--ZgcPN0UduebIi3vr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2023 at 12:26:25AM +0100, Conor Dooley wrote:
> On Fri, Aug 25, 2023 at 04:11:38PM -0700, Evan Green wrote:
> > In /proc/cpuinfo, most of the information we show for each processor is
> > specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> > compatible, and the mmu size. But the ISA string gets filtered through a
> > lowest common denominator mask, so that if one CPU is missing an ISA
> > extension, no CPUs will show it.
> >=20
> > Now that we track the ISA extensions for each hart, let's report ISA
> > extension info accurately per-hart in /proc/cpuinfo. We cannot change
> > the "isa:" line, as usermode may be relying on that line to show only
> > the common set of extensions supported across all harts. Add a new "hart
> > isa" line instead, which reports the true set of extensions for that
> > hart.
> >=20
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>=20
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Can you drop this if you repost?
>=20
> > +"isa" vs "hart isa" lines in /proc/cpuinfo
> > +------------------------------------------
> > +
> > +The "isa" line in /proc/cpuinfo describes the lowest common denominato=
r of
> > +RISC-V ISA extensions recognized by the kernel and implemented on all =
harts. The
> > +"hart isa" line, in contrast, describes the set of extensions recogniz=
ed by the
> > +kernel on the particular hart being described, even if those extension=
s may not
> > +be present on all harts in the system.
>=20
> > In both cases, the presence of a feature
> > +in these lines guarantees only that the hardware has the described cap=
ability.
> > +Additional kernel support or policy control changes may be required be=
fore a
> > +feature is fully usable by userspace programs.
>=20
> I do not think that "in both cases" matches the expectations of
> userspace for the existing line. It's too late at night for me to think
> properly, but I think our existing implementation does work like you
> have documented for FD/V. I think I previously mentioned that it could
> misreport things for vector during the review of the vector series but
> forgot about it until now.

I went and checked, and yes it does currently do that for vector. I
don't think that that is what userspace would expect, that Google
cpu_features project for example would draw incorrect conclusions.

--ZgcPN0UduebIi3vr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOnMTQAKCRB4tDGHoIJi
0nrvAPwLjbOL6r4TZW8GOS8xZlIkG4PyNOBaEqN4E33o2EgBowD/Tkd86pHiHX8a
n+M7q7/2r0Zr/7yxpNogkShnxCTCoAw=
=V3DK
-----END PGP SIGNATURE-----

--ZgcPN0UduebIi3vr--


--===============5877363598735198659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5877363598735198659==--

