Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C841C10F1A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 17:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJbnl7KLE/7Nvu3IrQhRLoTlFEsQzUuLlTtrsO0UDIA=; b=RTA4slG/qx3BprKeR0RRoxugwS
	5SRqxAy0cjm6GOGG4pr/PLeLagJTHzUn+w541FOT51D6O5SydMr36+7nuzdsARarfMam2dHF+YmFj
	715K9BdBjLx1WAVVGCMSJQFl9tQmaUFF5O2i4BwA9fVTGWKPA5R91KMgeHs5UL7ZbMuL0vfad/Uah
	sw+qDCiqFx8EFAvTyWQ/b56y96QOUblJ8Pob1D8q3/c+EpwrobWk5zBuhiWnQjfYlaCex+iZo6Luy
	9GWqAU76zjuuUeodct5dSWUyPs8U6Wn+C8FterY8lgIA/FJ3TfhEm2oXFITJE5SG3ocyHMCrjHmJ5
	63P/6HPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DcS-0000000AIRU-0Nrx;
	Wed, 01 May 2024 17:19:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DcO-0000000AIQ8-0gHy;
	Wed, 01 May 2024 17:19:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0D14617DF;
	Wed,  1 May 2024 17:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A04C072AA;
	Wed,  1 May 2024 17:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714583981;
	bh=mJpQKEtcJ3c2v8AHUID+6FduoqIlPGmY7MH+0xeYgrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMSpGVhI8L8uDLsSJJEyFBTgsakjDAs1is1XCNC2hQxzL/c3hmNjyHKnYw9L7pnNm
	 3VrCgUo1asZ5RBoNv4kM5h9lNXbDcn//XWfzXfR8sj3XMhA6M1MgMq8QH4Gi+wWaJ5
	 0l2lDkdkGXWlXMWPo4BAyk0qBvpH9mWWcG2UvJeygxKc85jiZz0wukD31Ex0OU/5s2
	 gg6jbKOb2F7NJjqav6GG3wo7ox9dAtoBhAVqLdD5ZgpQImiveSIsKvm6tUjj1me2Xj
	 npHYon9go63e2dhegSbafdb4RQwnnOedglZqjxDB5gNnJW+9JfXd8t44tI5kKN+1dT
	 QOkkuGbs4LPzg==
Date: Wed, 1 May 2024 18:19:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240501-flagstone-zealous-2fc722bfad39@spud>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <CALs-HstM64Hy_=XVz=0sWQt=8j1u+bq6RhthUuD3P0E4=HyvcA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HstM64Hy_=XVz=0sWQt=8j1u+bq6RhthUuD3P0E4=HyvcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_101944_285296_4EF42A70 
X-CRM114-Status: GOOD (  15.80  )
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
Content-Type: multipart/mixed; boundary="===============0877436351085550002=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0877436351085550002==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mVgGewDsv8YXPdzq"
Content-Disposition: inline


--mVgGewDsv8YXPdzq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2024 at 09:44:15AM -0700, Evan Green wrote:
> On Fri, Apr 26, 2024 at 2:29=E2=80=AFPM Charlie Jenkins <charlie@rivosinc=
=2Ecom> wrote:

> > +struct riscv_isa_vendor_ext_data_list {
> > +       const struct riscv_isa_ext_data *ext_data;
> > +       struct riscv_isainfo *per_hart_vendor_bitmap;
> > +       unsigned long *vendor_bitmap;
>=20
> It took a lot of digging for me to understand this was the set of
> vendor extensions supported on all harts. Can we add that to the name,
> maybe something like isa_bitmap_all_harts? (I wonder if we could drop
> the vendor part of the name since we already know we're in a
> vendor_ext_data_list structure).

Reading this made me wonder, why is the all-hart bitmap an unsigned long
when the per hart one is a riscv_isainfo struct?

--mVgGewDsv8YXPdzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjJ5pgAKCRB4tDGHoIJi
0mvKAQDZ/PuqkdmAAHeDEhcfzV4GeMOwujPT7ib0jWzVFEvmMAEAhdzNdXJHw+cT
qfdruwRE1FLdK0IBpLEhnxWwE/OVvgc=
=uVOz
-----END PGP SIGNATURE-----

--mVgGewDsv8YXPdzq--


--===============0877436351085550002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0877436351085550002==--

