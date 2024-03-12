Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46A8C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 13:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRJ+mKogjVvsVNzJPK5saZniy7LZ9iGd0NmcItudNcE=; b=qxxHhXJf0o9RTSb2Q6ccy4vaDP
	aSg35Oys1NaHi9cV7P73DOmo2MP5IIAlEf9++g2ZXygnf54CX3R2qlOBSl5Ixb1t+Ywik+paK2A8d
	R+MdCGcoiSVpUtBcxNrADL4EjRePUfb9mL3A5J8ZEnta/lyWbUzbJxsoFlx5hI/eddJw7qk8lJ8qb
	wcfAxoXr0GSPBTIGsJ2wf73nnwjGmC0HO84sMDTsZB3NgmUhj5ghyqb17Ag06L1MVECMJDv3srNcy
	dmgdwG13B43b7+Y5aenqEZYsC9DIRsk20dDFgaLyTj2d/Nqk9wiBUQnV8VtIY1QgN8anfIcaRqOkA
	f/kxw1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1sp-00000005sYD-08K7;
	Tue, 12 Mar 2024 13:09:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1sm-00000005sXl-2DDX
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 13:09:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37BA0CE171B;
	Tue, 12 Mar 2024 13:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E512C433F1;
	Tue, 12 Mar 2024 13:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710248964;
	bh=kDPAAUYqtHGW/XmFNx+/atYvOH0ApHTe0ivu8X8yg14=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=kOeobsF2KAVHPHX/9ITeFVb22pGa9qScG5xgt/iWuPrjNMe8CL2rPAo4ntOg7B5zj
	 ehwsraYw/s1vm7yRmOaPX6vfolGfEdfDZE1EF6Aj5GtwkV8zufNnHRysi+nsJ9rWKp
	 SAFeooc4ECVd4xcX2QHLwaZmS3I591xCmCxAuyoYABUJn4OIfTs/OFHH7wEV3rHW7x
	 tLn7BKNG1kD6RjLxwdiPdCFCwTxgqlA1os3J+h09r3UTAK338qe8+YFRgqo1UlMCKh
	 TAeDOUgDZgCsHXdq4pCn4kyM8NVBT7io9lnGawCoxyMOEnWC4SwFmczCeDsI7ryZh7
	 Qf7ak8PekmEAQ==
Date: Tue, 12 Mar 2024 13:09:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Devicetree fixes for v6.8-final
Message-ID: <20240312-squad-evaluate-e96191870035@spud>
References: <20240306-waltz-facial-9e4e1b792053@spud>
 <1f827492-2a68-4753-aac2-fcbdca51e460@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <1f827492-2a68-4753-aac2-fcbdca51e460@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_060928_765394_DF5F0111 
X-CRM114-Status: GOOD (  15.11  )
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
Content-Type: multipart/mixed; boundary="===============5260482872120477956=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5260482872120477956==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RrxIwo4lJjZ8GknO"
Content-Disposition: inline


--RrxIwo4lJjZ8GknO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 09:12:08AM +0100, Arnd Bergmann wrote:
> On Wed, Mar 6, 2024, at 19:08, Conor Dooley wrote:
> > Hey Arnd,
> >
> > I know it is pretty late in the day here for fixes, and I would've kept
> > the builtin dtb fix as v6.9 material, but Geert reported yesterday that
> > boot was broken on the jh7100 platforms due to a fix that I sent in my
> > last PR.
>=20
> Sorry I missed them last week. I added this to the soc/dt branch
> for 6.9 now. You might want to ask stable@vger.kernel.org for a
> backport after -rc1 is out if they don't automatically pick them
> up.

Right, it was an unexpected PR and late in the cycle. It's only the
jh7100 patch that'd need a backport. I'll request a backport if one
doesn't happen automagically, which it probably will, even though I
didn't have a cc: stable on it.

--RrxIwo4lJjZ8GknO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfBUAAAKCRB4tDGHoIJi
0ne/AP9RXiCdRyrvJCnyKLscaY9tjyTicYP8kd03je+6JEiVnQEAs6J5HLyVzHhm
NB+TjIYzUiEMgzYlF9CjunrwF5qe0gc=
=Pjex
-----END PGP SIGNATURE-----

--RrxIwo4lJjZ8GknO--


--===============5260482872120477956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5260482872120477956==--

