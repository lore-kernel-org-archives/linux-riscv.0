Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AB8EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 22:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dp8dEx5v6fGMxOfzWTZn1kEuNzayvXGjqsoHodbU66k=; b=FYx7QQjF5H7BZAgxi7BRWJtFQP
	PxMOwWlE4EwiT3xSEXhOP1FAbDa+6/9KXpqu4IbYgenzB6bFQZon4ZmQlxlEND3CMfjHk9Hu24s9f
	ablcn3MyJyhb4SeBAY4LW6u7DpKgp/RW2OV11FUKH0KRaSsVySyEQMj07+hGaO4i6dWRa40Mdsmwl
	2WnqNycDRuJQttkhQs7bZ1wlJ8K51Ny59K46keQDrfE7RLrZAM7oQgExKrETvfsBYuz+wT9Q+5uWu
	ajRyYkthMIz5QN+JAb/a6Y4KFloxLXBPx0/qYWJ4c47hyGJ224a4JC96kyh0o/GiB854Tzf9czmUg
	jCy6XPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDY11-008ooJ-0a;
	Sun, 25 Jun 2023 22:15:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDY0x-008onU-2m
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 22:15:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E31FA60C00;
	Sun, 25 Jun 2023 22:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB72C433C8;
	Sun, 25 Jun 2023 22:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687731321;
	bh=zFVqf7YtgUM3F6YoG2jfwFRTpf8aCuPZPnbOJyql7oI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQWu/HyKwTHQmtgf357NogYhBahDyKX/1Jq6bAgM+m5Zo0iIokkBH1XRXky1qGyTg
	 uhh/B3cij7HKHv6wOBpA1EIG7B7lJOwbtcF9DL+wB1dGlsyY0Y4KH2k3FMhDsD0Zdp
	 Pn8HmbNqw7tdCXJwlcpp8V93ig8iSQeuR+sLgGmvggdJin3HEI7nGX87enlMtneFYB
	 y/G6dMiGUgR+ur1R/E3W2GNtynrPGKnRxw2vgUCI3Wd2hQEH4nr9MThyP3fkw7MTL3
	 JSDxPlPcZr0FbpqthgqTPF0Scgq6omh6MWCAAVAQHMXae1H0A3BM9QG37PlVjR9k8p
	 KNqe3j4L3WizQ==
Date: Sun, 25 Jun 2023 23:15:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	robh+dt@kernel.org, frowand.list@gmail.com, ajones@ventanamicro.com,
	alexghiti@rivosinc.com, mpe@ellerman.id.au, arnd@arndb.de,
	rppt@kernel.org, samuel@sholland.org, panqinglin2020@iscas.ac.cn,
	conor.dooley@microchip.com, anup@brainfault.org,
	xianting.tian@linux.alibaba.com, anshuman.khandual@arm.com,
	heiko@sntech.de, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 1/3] Revert "RISC-V: mark hibernation as nonportable"
Message-ID: <20230625-obstinate-grimy-b765a1d3d741@spud>
References: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
 <20230625140931.1266216-2-songshuaishuai@tinylab.org>
 <20230625-multiple-diaper-1db88a75314e@spud>
 <20281f01-2cc9-892e-beea-eb2bb91e3ca5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20281f01-2cc9-892e-beea-eb2bb91e3ca5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_151523_981997_70F3571C 
X-CRM114-Status: GOOD (  33.45  )
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
Content-Type: multipart/mixed; boundary="===============8652204438072085787=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8652204438072085787==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ZfynoZLMeCQs+ZJ"
Content-Disposition: inline


--6ZfynoZLMeCQs+ZJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Sun, Jun 25, 2023 at 11:09:21PM +0800, Song Shuai wrote:

> Sorry for the delayed reply,

It wasn't really delayed at all actually, you replied within an hour or
so, AFAICT.

> My tinylab email went something wrong, I'll use gmail in this thread.
>=20
> =E5=9C=A8 2023/6/25 22:18, Conor Dooley =E5=86=99=E9=81=93:
> > On Sun, Jun 25, 2023 at 10:09:29PM +0800, Song Shuai wrote:
> > > This reverts commit ed309ce522185583b163bd0c74f0d9f299fe1826.
> > >=20
> > > With the commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the
> > > linear mapping") reverted, the MIN_MEMBLOCK_ADDR points the kernel
> > > load address which was placed at a PMD boundary.
> >=20
> > > And firmware always
> > > correctly mark resident memory, or memory protected with PMP as
> > > per the devicetree specification and/or the UEFI specification.
> >=20
> > But this is not true? The versions of OpenSBI that you mention in your
> > cover letter do not do this.
> > Please explain.
> >=20
>=20
> At this time, OpenSbi [v0.8,v1.3) and edk2(RiscVVirt) indeed don't obey t=
he
> DT/UEFI spec. This statement is excerpted from "Reserved memory for resid=
ent
> firmware" part from the upcoming riscv/boot.rst. It isn't accurate for no=
w.
> How about deleting this one?

It is incorrect, so it will need to be removed, yes.
Unfortunately writing a doc does not fix the existing implementations :(

> Actually with 3335068f8721 reverted, the change of MIN_MEMBLOCK_ADDR can
> avoid the mapping of firmware memory, I will make it clear in the next
> version.

To be honest, I'd like to see this revert as the final commit in a
series that deals with the problem by actually reserving the regions,
rather than a set of reverts that go back to how we were.
I was hoping that someone who cares about hibernation support would be
interested in working on that - *cough* starfive *cough*, although maybe
they just fixed their OpenSBI and moved on.
If there were no volunteers, my intention was to add a firmware erratum
that would probe the SBI implementation & version IDs, and add a firmware
erratum that'd parse the DT for the offending regions and reserve them.

Cheers,
Conor.

> > > So those regions will not be mapped in the linear mapping and they
> > > can be safely saved/restored by hibernation.
> > >=20
> > > Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> > > ---
> > >   arch/riscv/Kconfig | 5 +----
> > >   1 file changed, 1 insertion(+), 4 deletions(-)
> > >=20
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 5966ad97c30c..17b5fc7f54d4 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -800,11 +800,8 @@ menu "Power management options"
> > >   source "kernel/power/Kconfig"
> > > -# Hibernation is only possible on systems where the SBI implementati=
on has
> > > -# marked its reserved memory as not accessible from, or does not run
> > > -# from the same memory as, Linux
> > >   config ARCH_HIBERNATION_POSSIBLE
> > > -	def_bool NONPORTABLE
> > > +	def_bool y
> > >   config ARCH_HIBERNATION_HEADER
> > >   	def_bool HIBERNATION
> > > --=20
> > > 2.20.1
>

--6ZfynoZLMeCQs+ZJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJi8cgAKCRB4tDGHoIJi
0gQGAP4zFRf+mJ/qW1QVdbXhgxrDoXAjwnQiAGH8Qr85iJdixAEAoUq/DIivnRJ8
mJWf9t+LoW93pFfGCZD7UXny7Skemgg=
=Ztmn
-----END PGP SIGNATURE-----

--6ZfynoZLMeCQs+ZJ--


--===============8652204438072085787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8652204438072085787==--

