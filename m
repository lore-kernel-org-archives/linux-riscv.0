Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1131C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 20:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jjBWPLJqsfSIdwx2Qnj6WSNyV6QzUvit/maxL/AARI=; b=wvAbe1V0qr2xygD0qSj1ZKYHbu
	TOlnkWKijS0sgQ1Z3hgdekuYqXTbW2mzD8JcyrfEb1WnGyc5CEvRPlrHu5h2iN3KSUbcRAXONUeeI
	bnk5lQ3O6dSzueqt2YunmX2MWx5jNM1XljF9VsTa/4C6YRKRHmbXWpAbRKq9OBnCqjQPROj7c82kj
	73oJzC3cuCSmTR/B0oLYW/YVp21388Yl//IO3+QA3yb2kyxI5j99gPC1unEMv4fXjd6hhHO8s/aPc
	3E5CnvvZ59FDNxHxXBMdBmVtTXJuUvx7H8HX9M1LiZfEN0R+px2BhVp8Sw5QxNY4wX9wE4echmW6R
	dZf1TRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNjc-00000001Erw-2Bea;
	Fri, 12 Apr 2024 20:42:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNjY-00000001EqX-2N9B;
	Fri, 12 Apr 2024 20:42:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 920FDCE3AA1;
	Fri, 12 Apr 2024 20:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54F2C113CC;
	Fri, 12 Apr 2024 20:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712954569;
	bh=FaCmkfXZATbbGc1AaFlo/IMENWfiiSjV1ABEmJ4XPIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJqkcLFAcTsECllx9rhUB7eW6r6kldZQq87sHenDtlvleSY+oc02M7gOBOIq2PiHf
	 pi0V3EJp4UXuUwTQp32d2dR8uv689jDwAk/GBKR9ckn3fydrzu2JhFZfRICo9hbY7Z
	 8j2dCb7X1tDUdaTe7rD1aOhV5DEFqAwC5NAVBCm+A8I7BtdYO2XNMQ94MFZs/oacFa
	 bBU8X5cJoaqgCKIxEDs5A1tIky/8KiRjIMbI2bOtOjTzUjtt1YcFjJDYhaDyhXv7BA
	 rzEJ317H0UxRsRe9RiWZWwdRI/+knA9alX+gyAQ0xu9mmAfVbenxuAsBbm/17726lS
	 h5NrCjSUio34w==
Date: Fri, 12 Apr 2024 21:42:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <20240412-scrabble-outback-dca318d44660@spud>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <CALs-HsuMZOMpDh8kwQx6FE2mawzt+qTD-WZ6Mvhrt+hUhkZimg@mail.gmail.com>
 <20240412-employer-crier-c201704d22e3@spud>
 <ZhmBfaKXMMtolwSr@ghost>
 <20240412-earmark-sanction-810b7222cae5@spud>
 <Zhma45a2I7DgD8Ni@ghost>
MIME-Version: 1.0
In-Reply-To: <Zhma45a2I7DgD8Ni@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_134252_976184_A47ACC62 
X-CRM114-Status: GOOD (  53.72  )
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
Content-Type: multipart/mixed; boundary="===============5399736392566298531=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5399736392566298531==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x8exgmtxQWZyWHHC"
Content-Disposition: inline


--x8exgmtxQWZyWHHC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 01:34:43PM -0700, Charlie Jenkins wrote:
> On Fri, Apr 12, 2024 at 08:26:12PM +0100, Conor Dooley wrote:
> > On Fri, Apr 12, 2024 at 11:46:21AM -0700, Charlie Jenkins wrote:
> > > On Fri, Apr 12, 2024 at 07:38:04PM +0100, Conor Dooley wrote:
> > > > On Fri, Apr 12, 2024 at 10:04:17AM -0700, Evan Green wrote:
> > > > > On Fri, Apr 12, 2024 at 3:26=E2=80=AFAM Conor Dooley <conor.doole=
y@microchip.com> wrote:
> > > > > >
> > > > > > On Thu, Apr 11, 2024 at 09:11:08PM -0700, Charlie Jenkins wrote:
> > > > > > > The riscv_cpuinfo struct that contains mvendorid and marchid =
is not
> > > > > > > populated until all harts are booted which happens after the =
DT parsing.
> > > > > > > Use the vendorid/archid values from the DT if available or as=
sume all
> > > > > > > harts have the same values as the boot hart as a fallback.
> > > > > > >
> > > > > > > Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT =
property on older T-Head CPUs")
> > > > > >
> > > > > > If this is our only use case for getting the mvendorid/marchid =
stuff
> > > > > > from dt, then I don't think we should add it. None of the devic=
etrees
> > > > > > that the commit you're fixing here addresses will have these pr=
operties
> > > > > > and if they did have them, they'd then also be new enough to ho=
pefully
> > > > > > not have "v" either - the issue is they're using whatever crap =
the
> > > > > > vendor shipped.
> > > > > > If we're gonna get the information from DT, we already have som=
ething
> > > > > > that we can look at to perform the disable as the cpu compatibl=
es give
> > > > > > us enough information to make the decision.
> > > > > >
> > > > > > I also think that we could just cache the boot CPU's marchid/mv=
endorid,
> > > > > > since we already have to look at it in riscv_fill_cpu_mfr_info(=
), avoid
> > > > > > repeating these ecalls on all systems.
> > > > > >
> > > > > > Perhaps for now we could just look at the boot CPU alone? To my
> > > > > > knowledge the systems that this targets all have homogeneous
> > > > > > marchid/mvendorid values of 0x0.
> > > > >=20
> > > > > It's possible I'm misinterpreting, but is the suggestion to apply=
 the
> > > > > marchid/mvendorid we find on the boot CPU and assume it's the sam=
e on
> > > > > all other CPUs? Since we're reporting the marchid/mvendorid/mimpi=
d to
> > > > > usermode in a per-hart way, it would be better IMO if we really do
> > > > > query marchid/mvendorid/mimpid on each hart. The problem with app=
lying
> > > > > the boot CPU's value everywhere is if we're ever wrong in the fut=
ure
> > > > > (ie that assumption doesn't hold on some machine), we'll only fin=
d out
> > > > > about it after the fact. Since we reported the wrong information =
to
> > > > > usermode via hwprobe, it'll be an ugly userspace ABI issue to cle=
an
> > > > > up.
> > > >=20
> > > > You're misinterpreting, we do get the values on all individually as
> > > > they're brought online. This is only used by the code that throws a=
 bone
> > > > to people with crappy vendor dtbs that put "v" in riscv,isa when th=
ey
> > > > support the unratified version.
> > >=20
> > > Not quite,
> >=20
> > Remember that this patch stands in isolation and the justification given
> > in your commit message does not mention anything other than fixing my
> > broken patch.
>=20
> Fixing the patch in the simplest sense would be to eagerly get the
> mvendorid/marchid without using the cached version. But this assumes
> that all harts have the same mvendorid/marchid. This is not something
> that I am strongly attached to. If it truly is detrimental to Linux to
> allow a user a way to specify different vendorids for different harts
> then I will remove that code.

I think that the simple fix is all that we need to do here, perhaps
updating the comment to point out how naive we are being.
`
> >=20
> > > the alternatives are patched before the other cpus are
> > > booted, so the alternatives will have false positives resulting in
> > > broken kernels.
> >=20
> > Over-eagerly disabling vector isn't going to break any kernels and
> > really should not break a behaving userspace either.
> > Under-eagerly disabling it (in a way that this approach could solve) is
> > only going to happen on a system where the boot hart has non-zero values
> > and claims support for v but a non-boot hart has zero values and
> > claims support for v but actually doesn't implement the ratified versio=
n.
> > If the boot hart doesn't support v, then we currently disable the
> > extension as only homogeneous stuff is supported by Linux. If the boot
> > hart claims support for "v" but doesn't actually implement the ratified
> > version neither the intent of my original patch nor this fix for it are
> > going to help avoid a broken kernel.
> >=20
> > I think we do have a problem if the boot cpu having some erratum leads
> > to the kernel being patched in a way that does not work for the other
> > CPUs on the system, but I don't think this series addresses that sort of
> > issue at all as you'd be adding code to the pi section if you were fixi=
ng
> > it. I also don't think we should be making pre-emptive changes to the
> > errata patching code either to solve that sort of problem, until an SoC
> > shows up where things don't work.
> > Cheers,
> > Conor.
>=20
>=20

--x8exgmtxQWZyWHHC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhmcwgAKCRB4tDGHoIJi
0oTAAQDno++1nLt6Q8uGl7ojf9Chi1JQVMjrCW3M6+YErlW3mgEA93Ys+zCKhrrD
IDx65h0ho73Nloy8xmMLtheykAzE0go=
=90eE
-----END PGP SIGNATURE-----

--x8exgmtxQWZyWHHC--


--===============5399736392566298531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5399736392566298531==--

