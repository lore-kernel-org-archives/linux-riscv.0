Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19329C25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 20:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEVJ7lVnZ0x2GC1ADqQp9P1sj6FbxNRSizGrcm/eiw4=; b=JEahAJuOtWL7Ib8F1HgvuJJ74s
	emYY27cfuoSlw7JxYFJwdvoqW1dcyeYSfhydTcwm0XxwSXXBWWoGt/R7IAwQLAWgaYYju3vd+FG3E
	gT0X4sdu0Cck2j2cbcJEpxtfzEf5EEu4J0eqI+7s/WWCpdNcbDmYoOOxdvM6HFwgJuVXl5k5rPjQw
	5/rx4mDyYGfFlmzwsBy8UCSlAtiERN7i8xSHyVOcvIBSJz4mbZuNSaxbh9PUg2PqeGCSPGqh5TYAZ
	389RuOH79LMCUdYg73t6UvdMPUk8aA4yFDboYYml+mBnxh+zDYhW0URZfW1UOCLtVWrpbF8qCc7C8
	Fc3Or1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2GMt-0000000AcLq-0F7A;
	Wed, 01 May 2024 20:15:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2GMq-0000000AcKH-19W8;
	Wed, 01 May 2024 20:15:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 073EA619C4;
	Wed,  1 May 2024 20:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32582C4AF19;
	Wed,  1 May 2024 20:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714594550;
	bh=B1Uh4i07qA042YiuAtEnhpGxy0d/YEecRVrlZr0WYw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwu2J1/hBd8nUQDpUcCUvBJ/iE2Tt854m42ww+YyLzdRcPUswOq5X0ben9BhtzqeC
	 KOKuGrC9hV5ugEltMpZ9LOWNXx7IyJ5ph2DcYQNxdfLLfODQruyozQYBAm8PdX5uCd
	 yTaCg1bca1vKUTibNb9AFHiToLHamAtXOTlRaeXrgWVlm/yDrZONGe8lu5d69xM6Wp
	 Z62GETam1wKiei04yhW3bFHttlICDuVo6oap1jc0+w9TIxqKGdDD52njjkMnNW8rA5
	 8pUAQwLGgMJvnnOX1fzvEk4w6i/tgDG4PVqALPi6mG841Jf3Hoep8sSx9ZeeXav/4V
	 3eUPthzU83tnA==
Date: Wed, 1 May 2024 21:15:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 07/16] riscv: cpufeature: Extract common elements from
 extension checking
Message-ID: <20240501-hazy-reformist-8ff36ba53450@spud>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-7-b692f3c516ec@rivosinc.com>
 <20240501-probable-unfunded-746ef6ae1853@spud>
 <ZjKcfZsWgR1AY3AZ@ghost>
MIME-Version: 1.0
In-Reply-To: <ZjKcfZsWgR1AY3AZ@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_131552_444918_AB988427 
X-CRM114-Status: GOOD (  25.83  )
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
Content-Type: multipart/mixed; boundary="===============8742137440437717425=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8742137440437717425==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GXUDSiAct5jPEsjU"
Content-Disposition: inline


--GXUDSiAct5jPEsjU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2024 at 12:48:13PM -0700, Charlie Jenkins wrote:
> On Wed, May 01, 2024 at 12:37:14PM +0100, Conor Dooley wrote:
> > On Fri, Apr 26, 2024 at 02:29:21PM -0700, Charlie Jenkins wrote:
> > > The __riscv_has_extension_likely() and __riscv_has_extension_unlikely=
()
> > > functions from the vendor_extensions.h can be used to simplify the
> > > standard extension checking code as well. Migrate those functions to
> > > cpufeature.h and reorganize the code in the file to use the functions.
> > >=20
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  arch/riscv/include/asm/cpufeature.h        | 78 +++++++++++++++++---=
----------
> > >  arch/riscv/include/asm/vendor_extensions.h | 28 -----------
> > >  2 files changed, 44 insertions(+), 62 deletions(-)
> > >=20
> > > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include=
/asm/cpufeature.h
> > > index fedd479ccfd1..17896ec9ec11 100644
> > > --- a/arch/riscv/include/asm/cpufeature.h
> > > +++ b/arch/riscv/include/asm/cpufeature.h
> > > @@ -98,59 +98,66 @@ extern bool riscv_isa_fallback;
> > > =20
> > >  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitm=
ap);
> > > =20
> > > +#define EXT_ALL_VENDORS		0
> >=20
> > It's not really "all vendors", it's standard. Otherwise, this seems all
>=20
> This hooks up into the alternatives:
>=20
> ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)

Yeah, I know what you're using it for, I just find the naming odd.
>=20
> Where the "vendor" argument is supposed to be 0 if the alternative is
> applicable to all vendors. Is there a better way to convey this?

s/EXT_ALL_VENDORS/STANDARD_EXT/?

--GXUDSiAct5jPEsjU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjKi7wAKCRB4tDGHoIJi
0pu+AP9hEmGvtiSYMRVj8J8qm6vSD21SfEYfsPIhrXHI3zAnRwEAtYpy2rqHQbrU
hC4o62eJA24pmjxdVcu266GkK87+ywA=
=wAFW
-----END PGP SIGNATURE-----

--GXUDSiAct5jPEsjU--


--===============8742137440437717425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8742137440437717425==--

