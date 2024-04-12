Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0238C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 21:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PR4t07Cdzon+Kyu6M3HZEhpljzeKvPgofjIRygA+qvI=; b=hemODG3mtjGJs8Kkwlhv4ECNpZ
	UAU5AWJlZZNgQxHSfKX01luObuRluP6hYF0ScuBfcjjUWFxhZ5xp3kkvpSuSYNsznrkI5ZIqr+3LW
	typ0uJpeExBasAo5LqKUPuY3VL+xQE8dPPMTcQ4KxMpxvTs5knQcJvHaaM2PJSJdBCjkkkZuF/mol
	ba1UeeAQ10E2ojbBcKvMmPyhSPqP/kqXJ0GR5KYbne50dhYpRNI0zC6/kUItpZ0F8jU0OTUWxZcfs
	kz4pE9Lr0801euOHYdRuXaH+T3xJNVscIgy+TgxxoJbkQJCofQOze+UCqu/BXRofqZzmSJATcce9h
	qasjmF1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvOXO-00000001PLT-1U56;
	Fri, 12 Apr 2024 21:34:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvOXJ-00000001PJd-3eFO;
	Fri, 12 Apr 2024 21:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12A0B61D41;
	Fri, 12 Apr 2024 21:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A7AC113CC;
	Fri, 12 Apr 2024 21:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712957656;
	bh=RPMZISUCpRH7rGFvp7EbdpEtkFygpiRP/bPV6ApwRUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQSf3PB42KVUAVL/1+OQDtLauoAha7gpWFLEfP7EkJZ7N4u8sjm1TXZET0lcr99if
	 p323/cwpgZUxDFoAN0LtJD/WtUmkAowRMfrHXs2ADEs+POp65FYXDmivZLLbSGNrbU
	 cK7psxBkc2pNWhws+T+BLn4rvwbGtErI3pKePtDRrrXtxg4SlAkty9qCRKwyAvaK4o
	 4J1TYby7DtMN0iDHmvtIaHgU/2W7PPaw1EGmkk8oxy7YqdZ0CGvX2zAsbQmuPAc1vv
	 Sybl6gdQ0nD7yXd8jpir5Kgy9dj6jXo2NV/g5uxXJoISW/2Z2e9/7qwwU4KNgSB4f8
	 bogQT43yfNq2A==
Date: Fri, 12 Apr 2024 22:34:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 08/19] riscv: Introduce vendor variants of extension
 helpers
Message-ID: <20240412-geranium-monotone-b47f414715d1@spud>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-8-4af9815ec746@rivosinc.com>
 <20240412-dwarf-shower-5a7300fcd283@wendy>
 <ZhlypvTdsFPZBr08@ghost>
 <20240412-drab-french-55d8ff2c8cfa@spud>
 <ZhmhtLS5NuRrPOfu@ghost>
MIME-Version: 1.0
In-Reply-To: <ZhmhtLS5NuRrPOfu@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_143418_072788_682A3611 
X-CRM114-Status: GOOD (  37.88  )
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
Content-Type: multipart/mixed; boundary="===============8373466966399355667=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8373466966399355667==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SiZFDomrOPZV4p3t"
Content-Disposition: inline


--SiZFDomrOPZV4p3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 02:03:48PM -0700, Charlie Jenkins wrote:
> On Fri, Apr 12, 2024 at 09:40:03PM +0100, Conor Dooley wrote:
> > On Fri, Apr 12, 2024 at 10:43:02AM -0700, Charlie Jenkins wrote:
> > > On Fri, Apr 12, 2024 at 12:49:57PM +0100, Conor Dooley wrote:
> > > > On Thu, Apr 11, 2024 at 09:11:14PM -0700, Charlie Jenkins wrote:
> > > > > Create vendor variants of the existing extension helpers. If the
> > > > > existing functions were instead modified to support vendor extens=
ions, a
> > > > > branch based on the ext value being greater than
> > > > > RISCV_ISA_VENDOR_EXT_BASE would have to be introduced. This addit=
ional
> > > > > branch would have an unnecessary performance impact.
> > > > >=20
> > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > >=20
> > > > I've not looked at the "main" patch in the series that adds all of =
the
> > > > probing and structures for representing this info yet beyond a curs=
ory
> > > > glance, but it feels like we're duplicating a bunch of infrastructu=
re
> > > > here before it is necessary. The IDs are all internal to Linux, so =
I'd
> > > > rather we kept everything in the same structure until we have more =
than
> > > > a handful of vendor extensions. With this patch (and the theadpmu s=
tuff)
> > > > we will have three vendor extensions which feels like a drop in the
> > > > bucket compared to the standard ones.
> > >=20
> > > It is not duplicating infrastructure. If we merge this into the exist=
ing
> > > infrastructure, we would be littering if (ext > RISCV_ISA_VENDOR_EXT_=
BASE)
> > > in __riscv_isa_extension_available. This is particularily important
> > > exactly because we have so few vendor extensions currently so this ch=
eck
> > > would be irrelevant in the vast majority of cases.
> >=20
> > That's only because of your implementation. The existing vendor extensi=
on
> > works fine without this littering. That's another thing actually, you
> > forgot to convert over the user we already have :)
>=20
> Oh right, I will convert them over. The fundemental goal of this patch
> is to allow a way for vendors to support their own extensions without
> needing to populate riscv_isa_ext. This is to create separation between
> vendors so they do not impact each other.

The one that needs converting is xandespmu. As I said on the other patch
a minute I don't think isolating vendors for the internal representation
is needed and can be left in hwprobe. I also don't think we can rely on
a behaviour of "SiFive CPUs will always have SiFive's mvendorid" or that
kinda thing, I've heard talk of the SoC vendor getting their mvendorid
for custom CPU cores instead of the CPU vendor and it's possible for
the SBI implementation to "adjust" the values also.

> xlinuxenvcfg does not fit into this scheme however. This scheme assumes
> that a hart cannot have multiple vendors which that extension breaks.
> xlinuxenvcfg is really filling a hole in the standard isa that is
> applicible to all vendors and does not appear in the device tree so it
> is okay for that to live outside this scheme.

Ye, xlinuxenvcfg is an internal psuedo-extension that should be treated
more like a standard one than something vendor.

> > > It is also unecessary to push off the refactoring until we have some
> > > "sufficient" amount of vendor extensions to deem changing the
> > > infrastructure when I already have the patch available here. This does
> > > not introduce any extra overhead to existing functions and will be ab=
le
> > > to support vendors into the future.
> >=20
> > Yeah, maybe that's true but this was my gut reaction before reading the
> > other patch in detail (which I've still yet to do).
>=20
> - Charlie
>=20

--SiZFDomrOPZV4p3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhmo0QAKCRB4tDGHoIJi
0sB2AP9FeUoact1liM4pnP8xEk+uEek2FyqTjYcZiaib0RlcGwD/RBzXv10rgGru
eAFY4Rmq36PhVYfHdF4UI+zCC4yTAgw=
=xSsQ
-----END PGP SIGNATURE-----

--SiZFDomrOPZV4p3t--


--===============8373466966399355667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8373466966399355667==--

