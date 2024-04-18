Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DFCC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 16:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQpGxeUOgICnFu+PQMCDleC9MDVMhQeTOdoOqYSRhIk=; b=LoKmavMuvYEqvd/bserIAIDlOk
	MlAjnhkN8ZWNCPm071MgdPb06Rwx5xQhqGWeyDi0HTsbN3RoKKEc9yV7UtviVWnDHMm/uKwMZ+aFr
	KqKHAXurvT0yiYnDcySZNiqqUmxGjYfCeKu0EFlWjHUnqI27m+cOVw1X5v7i4KNwOBSoiyzONb4CS
	bL0jgUpWxEOmkPR7i4cekyy1XvVlrBHrPIWaYig7Cqhci7mP8mnyC1f7q5VIkUQU2YMv050A+aifa
	ENWt9ypkApCl0A0sX2wg6N9kdnahKbPLVjt6z8FYKBTEkzhGAMt6esez1BRv5ULezGFP2l5KNZXv4
	cvGmSZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxV1V-0000000362y-0hRW;
	Thu, 18 Apr 2024 16:54:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxV1R-0000000361m-1yBd
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 16:54:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38466CE14E4;
	Thu, 18 Apr 2024 16:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F01C113CC;
	Thu, 18 Apr 2024 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713459242;
	bh=Td96Pr2RLxCmccrLCbz0GSBYtl2efgCYqTBO4CPC85Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LR5SOtA8WsHMP6vVIvV29C88LXwY4oD+ef/jdGjbN3bb54kSGt4EoJHQg89DKFlRi
	 jJ5gOUQHX8QKRHrbQgrjvklqJroXZjGvGntVSvJ0JIClsi0k1C8TETJyXK1+EfQ9PR
	 639TjYZyOQswbawi0oVjBq77Ithr9GznM+wr4uIy93snA3jlvZ74ZbfhtOqrKLLXAi
	 42UUK6THGudljukfqbn7Tg0P1EtQCPLgssw+SO0QetYbyXIB7Q9vr862R7zLRENx88
	 TjbVtJkE5kioS84t+pzUqjwDnGciFsuX3e4akgNc6bzc/0+1lkF/jK0QX8ROzMNrae
	 oLckb+4wXzjVg==
Date: Thu, 18 Apr 2024 17:53:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Joel Granados <j.granados@samsung.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: Re: [PATCH v4 7/9] riscv: vector: adjust minimum Vector requirement
 to ZVE32X
Message-ID: <20240418-ultimatum-yam-11de4b063b83@spud>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-7-e0c45bb6b253@sifive.com>
 <20240418-brook-chili-4d3e61d1a55c@wendy>
 <20240418155256.GA2410@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20240418155256.GA2410@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_095405_881128_E5A479D7 
X-CRM114-Status: GOOD (  45.33  )
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
Content-Type: multipart/mixed; boundary="===============7726555463765683284=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7726555463765683284==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="caZE0P60wQJMi2ZH"
Content-Disposition: inline


--caZE0P60wQJMi2ZH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 08:52:56AM -0700, Eric Biggers wrote:
> Hi Conor,
>=20
> On Thu, Apr 18, 2024 at 12:02:10PM +0100, Conor Dooley wrote:
> > +CC Eric, Jerry
> >=20
> > On Fri, Apr 12, 2024 at 02:49:03PM +0800, Andy Chiu wrote:
> > > Make has_vector take one argument. This argument represents the minim=
um
> > > Vector subextension that the following Vector actions assume.
> > >=20
> > > Also, change riscv_v_first_use_handler(), and boot code that calls
> > > riscv_v_setup_vsize() to accept the minimum Vector sub-extension,
> > > ZVE32X.
> > >=20
> > > Most kernel/user interfaces requires minimum of ZVE32X. Thus, programs
> > > compiled and run with ZVE32X should be supported by the kernel on most
> > > aspects. This includes context-switch, signal, ptrace, prctl, and
> > > hwprobe.
> > >=20
> > > One exception is that ELF_HWCAP returns 'V' only if full V is support=
ed
> > > on the platform. This means that the system without a full V must not
> > > rely on ELF_HWCAP to tell whether it is allowable to execute Vector
> > > without first invoking a prctl() check.
> > >=20
> > > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > > Acked-by: Joel Granados <j.granados@samsung.com>
> >=20
> > I'm not sure that I like this patch to be honest. As far as I can tell,
> > every user here of has_vector(ext) is ZVE32X, so why bother actually
> > having an argument?
> >=20
> > Could we just document that has_vector() is just a tyre kick of "is
> > there a vector unit and are we allowed to use it", and anything
> > requiring more than the bare-minimum (so zve32x?)must explicitly check
> > for that form of vector using riscv_has_extension_[un]likely()?
> >=20
> > Finally, the in-kernel crypto stuff or other things that use
> > can_use_simd() to check for vector support - do they all function corre=
ctly
> > with all of the vector flavours? I don't understand the vector
> > extensions well enough to evaluate that - I know that they do check for
> > the individual extensions like Zvkb during probe but don't have anything
> > for the vector version (at least in the chacha20 and sha256 glue code).
> > If they don't, then we need to make sure those drivers do not probe with
> > the cut-down variants.
>=20
> As far as I know, none of the RISC-V vector crypto code has been tested w=
ith
> Zve* yet.  Currently it always checks for VLEN >=3D 128, which should exc=
lude most
> Zve* implementations.
>=20
> Currently it doesn't check for EEW >=3D 64, even though it sometimes assu=
mes that.
> It looks like a check for EEW >=3D 64 needs to be added in order to exclu=
de Zve32x
> and Zve32f implementations that don't support EEW =3D=3D 64.

Cool, glad I asked then :)

> If it would be useful to do so, we should be able to enable some of the c=
ode
> with a smaller VLEN and/or EEW once it has been tested in those configura=
tions.
> Some of it should work, but some of it won't be able to work.  (For examp=
le, the
> SHA512 instructions require EEW=3D=3D64.)
>=20
> Also note that currently all the RISC-V vector crypto code only supports =
riscv64
> (XLEN=3D64).  Similarly, that could be relaxed in the future if people re=
ally need
> the vector crypto acceleration on 32-bit CPUs...  But similarly, the code=
 would
> need to be revised and tested in that configuration.
>=20
> > Eric/Jerry (although read the previous paragraph too):
> > I noticed that the sha256 glue code calls crypto_simd_usable(), and in
> > turn may_use_simd() before kernel_vector_begin(). The chacha20 glue code
> > does not call either, which seems to violate the edict in
> > kernel_vector_begin()'s kerneldoc:
> > "Must not be called unless may_use_simd() returns true."
>=20
> skcipher algorithms can only be invoked in process and softirq context.  =
This
> differs from shash algorithms which can be invoked in any context.
>=20
> My understanding is that, like arm64, RISC-V always allows non-nested
> kernel-mode vector to be used in process and softirq context -- and in fa=
ct,
> this was intentionally done in order to support use cases like this.  So =
that's
> why the RISC-V skcipher algorithms don't check for may_use_simd() before =
calling
> kernel_vector_begin().

I see, thanks for explaining that. I think you should probably check
somewhere if has_vector() returns true in that driver though before
using vector instructions. Only checking vlen seems to me like relying on
an implementation detail and if we set vlen for the T-Head/0.7.1 vector
it'd be fooled. That said, I don't think that any of the 0.7.1 vector
systems actually support Zvkb, but I hope you get my drift.

Thanks,
Conor.

--caZE0P60wQJMi2ZH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiFQIwAKCRB4tDGHoIJi
0gl8AQCH5jcR0fwp68BBBcX8uk063UxUZdEjt7Yt3nU+80K6GgEA64+MkNFk/ns9
57UBSy8tcN6JCY0eSgoJEzI8o/6y4gY=
=d1id
-----END PGP SIGNATURE-----

--caZE0P60wQJMi2ZH--


--===============7726555463765683284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7726555463765683284==--

