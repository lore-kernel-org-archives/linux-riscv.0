Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BE5C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5b2LmQwdoz8zjo+3girm5USQT+EKvNZWueB3bPUwjQ=; b=Bgb+zmVdBe9RSlCvuHKQy76L9+
	4xoRt7rXpbg346uI0KcCVVCRJl21DbAInKzVQmfONCGG4JaCIXhe26/d0HHlXpnYIbvJRdlECrEKh
	+O+JmM+OEt/7sc0Wz3GTulhFtr47SE6p0n339ZAhQtvRQcx4jWsa8Qei+FPSyzQUtGXxg/MOsnO6V
	mVKJE+JJm2nLLo/io8alx1DEve5c+6HIvisGpIxg0Thql3oYziuVVVMs63Qbvdd2sgIvWu5Sl8DV3
	RB69amPp1nr9uWU1r+KcJaR/22/ny7bjvhyfWaskKuV7ChttuI1vw8SqktOwPoqQSTA67kW7izTiJ
	6IHzvvdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD9vk-0000000BVuR-1gTP;
	Fri, 31 May 2024 21:36:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD9vi-0000000BVtz-0I3j
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 21:36:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2E426CE1CA6;
	Fri, 31 May 2024 21:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F60C116B1;
	Fri, 31 May 2024 21:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717191411;
	bh=FFToUnOuCn712quRqXbsVLVvTc5pX5hyAMtrzSFK0vA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pj+FH8bl6Gl0YqzVdbTMoK7p2XxVcg2Nc2jhOf1pQOfFcNSVUq7G+tciKkEzbprPj
	 4O45kyEW5N16DwcyT9/WJs1he3jF6xUC4TdEJB3FoSIbZaCwRI6P8aB1R0UT8CISHp
	 ++BYzy0R1Qk/OJgUITnj2SLL2SNHDxSI5TFBhF22TE6HTIOPUuNW911AC6dOrF+Gme
	 /FAyvr+gO5DA82/g2yB1H4/DKoS73Tdgj9IrOXkOYkuQddmy2pKk7gpsWYfhrKHWY5
	 O39EbvaAzx61rgfStlBHnNvu7Wzf8rWdC8nu5NgI1kjOZkdYEbjnS5yYiVsn39/Hmt
	 kn8lcRTLh2NtA==
Date: Fri, 31 May 2024 22:36:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <20240531-cough-yearling-bdfd49244885@spud>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <ZlowwohstpT0sJVl@ghost>
MIME-Version: 1.0
In-Reply-To: <ZlowwohstpT0sJVl@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_143654_495796_DFAFC6E1 
X-CRM114-Status: GOOD (  43.54  )
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
Content-Type: multipart/mixed; boundary="===============1888061758987806721=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1888061758987806721==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ggqLvOYAyQE9JuFh"
Content-Disposition: inline


--ggqLvOYAyQE9JuFh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 01:19:14PM -0700, Charlie Jenkins wrote:
> On Fri, May 31, 2024 at 06:31:09PM +0100, Conor Dooley wrote:
> > On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
> > > Dectect the Zkr extension and use it to seed the kernel base address.
> > >=20
> > > Detection of the extension can not be done in the typical fashion, as
> > > this is very early in the boot process. Instead, add a trap handler
> > > and run it to see if the extension is present.
> >=20
> > You can't rely on the lack of a trap meaning that Zkr is present unless
> > you know that the platform implements Ssstrict. The CSR with that number
> > could do anything if not Ssstrict compliant, so this approach gets a
> > nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
> > it, so you're stuck with getting that information from firmware.
>=20
> The Scalar Cryptography v1.0.1 spec says "If Zkr is not implemented, the
> [s,u]seed bits must be hardwired to zero". It also says "Without the
> corresponding access control bit set to 1, any attempted access to seed
> from U, S, or HS modes will raise an illegal instruction exception."
>=20
> There is a slight nuance here as the definition of Ssstrict is:
>=20
> "No non-conforming extensions are present. Attempts to execute
> unimplemented opcodes or access unimplemented CSRs in the standard or
> reserved encoding spaces raises an illegal instruction exception that
> results in a contained trap to the supervisor-mode trap handler."
>=20
> The trap that Jesse is relying on in the code here is related to access
> bits and not related to the CSR being unimplemented. Since the access
> bits are required to be 0 on an implementation without Zkr, it is
> required to trap if seed is accessed, regardless of Ssstrict.
>=20
> The situation here is slightly odd because the spec is defining behavior
> for what to do if the extension is not supported, and requires
> implementations to follow this aspect of the Scalar Cryptography spec
> even though they may not implement any of the instructions in the spec.

Firstly, you absolutely cannot rely on the behaviour defined by a new
extension by systems that implement a version of the ISA that predates
it. Secondly, we're talking about non-conforming implementations that
use a reserved CSR number for other purposes, you cannot rely on the
behaviour that the Scalar Crypto spec prescribes for access to the
register.

"Non-conforming" is also a moving target btw - the Andes PMU (I think
it's that) uses an interrupt number that was moved from "platform
specific use" to "reserved" by the AIA spec. If you only looked the
current specs, the Andes PMU is a "non-conforming extension" but at the
time that it was created it was compliant. I think we're gonna have a
fun conversation defining what "Ssstrict" actually means when someone
actually tries to document that.

> > For DT systems, you can actually parse the DT in the pi, we do it to get
> > the kaslr seed if present, so you can actually check for Zkr. With ACPI
> > I have no idea how you can get that information, I amn't an ACPI-ist.
>=20
> It is feasible to check if Zkr is present in the device tree at this
> stage in boot, but at first glance does not seem feasible to read the
> ACPI tables this early.
>=20
> The CSR being read is just for entropy so even if the seed CSR doesn't
> trap and provides an arbitrary value on an implementation that does not
> support Zkr, it can still be used as a source of entropy. If the
> implementation does trap, the entropy will be set to 0 which is just a
> different hard-coded arbitrary value.=20

Right. I can see value in doing something that may contain entropy, and
is at worst no better than the 0 we can currently get. But the patch
we're talking about here mentions nothing of the sort, it presents itself
as detection of Zkr and an actually random number - but all it actually
detects is whether or not the CSR at CSR_SEED traps.

To be acceptable, the patch would need to stop claiming that it is a valid
way to detect Zkr. The commit message, and a comment, must also explain
what may happen on systems that do not implement Zkr as you have done
here.
For example, `if (!riscv_has_zkr()) return 0` would have to be something
like `if (riscv_csr_seed_traps()) return 0`.

Thanks,
Conor.

--ggqLvOYAyQE9JuFh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlpC7gAKCRB4tDGHoIJi
0unPAP9+cMX5dlo+PBlNH2Xf52APZwRcdImVnnyQiYcK7srY9wD/Zg5Ccwcu5LmY
vm8TWShzC4ePfWVslctxqCd3Fr2d8Q0=
=hSYQ
-----END PGP SIGNATURE-----

--ggqLvOYAyQE9JuFh--


--===============1888061758987806721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1888061758987806721==--

