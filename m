Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192C3C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mlwr+coXx1vB/gkT2LivM5DWNGiMFWhpjDXMX6apBdw=; b=ELhfoR0iWdn83d+IxEWnR3SB50
	kU4eQ24l3lmLCZfkkLBgZuKI2Ea/Obsao3orbGwjDQgbQTRwDmiXUU39gCb9bXvRQS7IFs1b2GjrF
	6UcWs+F0clXVRanlSD/JylEH2a/HomFVZALGF7yORUrjzzfTGoRX0f6L0JiqXU+dXtZyHVxAilD1I
	IaY/la0oQ5GGm/n+MszuaL1UjMDC+vBqQWqBzJic5CUH9CIzV5dqTUhGz6W+MaNewaR4JemvucXYS
	3HLxY2YqjfTSr88VIJuHagSDz82jEaDOQ/ok/86DDCRJipOzivVL2NdSJbCho9dDhp2G7Cx46wBSo
	H18ipWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q06Nn-00H8mw-1E;
	Fri, 19 May 2023 20:07:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q06Nk-00H8mO-2l
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 20:07:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B3B765A9C;
	Fri, 19 May 2023 20:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77AE2C433D2;
	Fri, 19 May 2023 20:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684526839;
	bh=GueLlvy9I6RxLVBJs0ggqGdT3GA71cYKbBJmwmHLI28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=op4dMPQhhFRa7VChtubvSx0elvgUILi0nibxjtfg8EpcH0v3uxUTdcsHSWvWMPSKU
	 EQ53cpqjb4ZYyM/RCGBSWi4pcRCbNTiG7xTU4AK+EycnpF9Wb8qmCpi421X3sGW/0s
	 htTl6KhcSlpA72nPv0xj9NiJfsszzrugbUrf0ZlnnTS3YDJqaImehoUQrAAhJkVkxq
	 qWREUA8Hlhn9UQj8QQLJR+exbKvcq52u8REdt8NpjeQTg4I0TmHSCLgJu9nVha0qp1
	 /tlQbSDRcQBMVlBM/HeeijU38tk2Lg5Q7M6SY9WIsVDtQTjiNuFK33Bexq5A9C/ucS
	 73qUhbYoGyZbA==
Date: Fri, 19 May 2023 21:07:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: JeeHeng Sia <jeeheng.sia@starfivetech.com>,
	Song Shuai <suagrfillet@gmail.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH] riscv: hibernation: Remove duplicate call of
 suspend_restore_csrs
Message-ID: <20230519-roundup-legwarmer-e26b31db3123@spud>
References: <20230519102908.253458-1-suagrfillet@gmail.com>
 <9a274a44b61345e8aba747a44250c4d8@EXMBX066.cuchost.com>
 <20230519-clarinet-collar-ba2c0fa37e11@wendy>
MIME-Version: 1.0
In-Reply-To: <20230519-clarinet-collar-ba2c0fa37e11@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_130720_971062_96CBE0AA 
X-CRM114-Status: GOOD (  25.22  )
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
Content-Type: multipart/mixed; boundary="===============5725701214523567095=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5725701214523567095==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uSefXicpntsEBwun"
Content-Disposition: inline


--uSefXicpntsEBwun
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 12:28:07PM +0100, Conor Dooley wrote:
> Hey,
>=20
> On Fri, May 19, 2023 at 11:14:27AM +0000, JeeHeng Sia wrote:
>=20
> > > The suspend_restore_csrs is called in both __hibernate_cpu_resume
> > > and the `else` of subsequent swsusp_arch_suspend.
> > >=20
> > > Removing the first call makes both suspend_{save,restore}_csrs
> > > left in swsusp_arch_suspend for clean code.

It took me embarrassingly long to wrap my head around the control flow
here again. I'm not sure that I agree with you that splitting the calls
between asm & c is cleaner, but whatever:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> > >=20
> > > Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> > > Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
>=20
> BTW, why the two email addresses? The tinylab one here seems entirely
> redundant - unless it is your employer, in which case should it be the
> only SoB address & also in the author field?

Deja vu with my questioning your email address, but does your
tinylab address actually repeat "shuai"?

> Also, Fixes tag?
>=20
> > > ---
> > >  arch/riscv/kernel/hibernate-asm.S | 1 -
> > >  1 file changed, 1 deletion(-)
> > >=20
> > > diff --git a/arch/riscv/kernel/hibernate-asm.S b/arch/riscv/kernel/hi=
bernate-asm.S
> > > index 5c76671c7e15..d698dd7df637 100644
> > > --- a/arch/riscv/kernel/hibernate-asm.S
> > > +++ b/arch/riscv/kernel/hibernate-asm.S
> > > @@ -28,7 +28,6 @@ ENTRY(__hibernate_cpu_resume)
> > >=20
> > >  	REG_L	a0, hibernate_cpu_context
> > >=20
> > > -	suspend_restore_csrs
> > >  	suspend_restore_regs
>=20
> > Good catch. This function is invoked twice to restore the CSRs.
> > I am good with removing this function from here.
>=20
> If that's a review, then please either give an R-b or A-b tag :)
>=20
> Thanks,
> Conor.



--uSefXicpntsEBwun
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGfW8gAKCRB4tDGHoIJi
0tw4AQDBfboPqCfJHjV7Ajz/a1GmKu7ftIVfnIVRkMql7569iwD/atGwcUcipdg1
g8k7p+pQvEvpeT4Jk8RmodBPZGOaaAA=
=YRPl
-----END PGP SIGNATURE-----

--uSefXicpntsEBwun--


--===============5725701214523567095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5725701214523567095==--

