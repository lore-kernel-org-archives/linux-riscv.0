Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE4AC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 19:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/q+mFLkX84RWQSb/563a8uxHQ6XrnFYUduFcrKcyjTo=; b=yMAMJ5eCVk40Q/SQu/JCt058BD
	Ua5lJzxEVKSvM7P9X5xPZp9ul8htodUiPWko6QslSwoFkHToOO5Vt0uGXnq9Bshz+QmymYMCj3PAs
	ZL+Z4LZQk2b7/M2V6GnPt4lgdFWJCmasUrTHj5NPAS7p+b4/0WLES7l4kOiZpQYSbyrO6ph8jlk2d
	h5gNQt1LsEeCYwaJEGItTyPoSzcV0Px1Jr5oevtIibMC4yJXT2AsP3MSCKghoQgezUyoiSc43bLma
	qUhMStLgbsZpG6L3lMAuAasTJrMI++QIYtctkGaldFEQ10NX+Tdd2Mv55RtZrG37ZCNct4tXk/bnu
	Zbo/44og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvM8z-00000000yT7-1s5X;
	Fri, 12 Apr 2024 19:01:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvM8u-00000000yPf-20Ye;
	Fri, 12 Apr 2024 19:00:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E7E63CE3A96;
	Fri, 12 Apr 2024 19:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E802C113CC;
	Fri, 12 Apr 2024 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712948453;
	bh=zjERDaZxnJcQkN5CsXJlf2FvNFLdjHZ+EAHGDAdZ/ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fv70IH6HmhET0vREPnCPAMw7Zte6KDR18caLJzQeXRwxqTL3cawpT4GwCrOrEc4Iz
	 aDIwNQLY4iuGz2uT6ddt6Drg20rKv8pLAQY+S9iJ5MJfTkj1Slz72G5IjBok911JBa
	 OGW9Ly/6Sgpxi7thDG2JTywWye/BPbTzIr75uHA/UvcFvbE5mZNDHTZOYVjNG/hYKa
	 F2VPZREepVD5IIuM2tBNpHszwqYu1VY50G5VS/JY8jKs0687DtugQAf1/SsVJ6WGqK
	 Ti16VSTjb8XNu5k4X46LeIYUzY8u/OIUDWq0hSDH5lav6BZtioOlRauXV7ViOfCO+e
	 k26f2bOKdS9Zw==
Date: Fri, 12 Apr 2024 20:00:46 +0100
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
Subject: Re: [PATCH 12/19] riscv: Create xtheadvector file
Message-ID: <20240412-displease-sensually-33d91fc3fe63@spud>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-12-4af9815ec746@rivosinc.com>
 <20240412-thirty-sacrament-db052c7fe6fe@wendy>
 <Zhl8Y+GzTB/ip7rT@ghost>
MIME-Version: 1.0
In-Reply-To: <Zhl8Y+GzTB/ip7rT@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_120056_889245_8C29C4FC 
X-CRM114-Status: GOOD (  24.14  )
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
Content-Type: multipart/mixed; boundary="===============7790551590481824419=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7790551590481824419==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yiuYflu9z+To5kfn"
Content-Disposition: inline


--yiuYflu9z+To5kfn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 11:24:35AM -0700, Charlie Jenkins wrote:
> On Fri, Apr 12, 2024 at 12:30:32PM +0100, Conor Dooley wrote:
> > On Thu, Apr 11, 2024 at 09:11:18PM -0700, Charlie Jenkins wrote:
> > > These definitions didn't fit anywhere nicely, so create a new file to
> > > house various xtheadvector instruction encodings.
> > >=20
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  arch/riscv/include/asm/xtheadvector.h | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/include/asm/xtheadvector.h b/arch/riscv/inclu=
de/asm/xtheadvector.h
> > > new file mode 100644
> > > index 000000000000..348263ea164c
> > > --- /dev/null
> > > +++ b/arch/riscv/include/asm/xtheadvector.h
> > > @@ -0,0 +1,25 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +
> > > +/*
> > > + * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an=
 older
> > > + * encoding for vsetvli (ta, ma vs. d1), so provide an instruction f=
or
> > > + * vsetvli	t4, x0, e8, m8, d1
> > > + */
> > > +#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
> > > +#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
> > > +
> > > +/*
> > > + * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the s=
ame
> > > + * encoding as the standard vse8.v and vle8.v, compilers seem to opt=
imize
> > > + * the call resulting in a different encoding and then using a value=
 for
> > > + * the "mop" field that is not part of vector-0.7.1
> > > + * So encode specific variants for vstate_save and _restore.
> >=20
> > This wording seems oddly familiar to me, did Heiko not write this?
>=20
> Yeah, I wasn't sure how to attribute him. He wrote almost all of the
> lines in this file, but I put it together into this file. What is the
> standard way of doing that?

The original patches have his sob and authorship, so I would at least
expect co-developed-by.

--yiuYflu9z+To5kfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhmE3gAKCRB4tDGHoIJi
0pxvAP9yVWDaNANZULFGFjAROk1PKk4c4Q7mCmsZPOAQYvlN8wEA59scy5YtWI5N
LccwmxaDOXa8yoM0s7fRijgi3x//xwI=
=OBaT
-----END PGP SIGNATURE-----

--yiuYflu9z+To5kfn--


--===============7790551590481824419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7790551590481824419==--

