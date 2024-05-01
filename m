Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A192EC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 17:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlL9bMOzixILAOFmRWyk6BV0cnodE9txVQ5WLEZeW58=; b=4GLOJk1v0tnTGwHbNsqwIN73iL
	Yr7BolYJETq8b64AUX5H+8p5VMZlhGddh0CMo1aXL59ELDGhK/jb33yon0Ssm9OX+7hh6XSpHi6eE
	xlF0G0quOze1BeWeoSnvVVBT8vLYy0bTjTlx14DOkz0J9g3fBiHJ6z/GZqYWYUdNriaVcyXYp10M4
	jLRYs75VPkysszbA+NCzV9B48DbwTyd4Ki+/i0ieNwxUQfXvVG991OHtNzd0wxenuBAmnuswi8t9s
	8uCZ1HeaYFrtqpceYSnkHhQWyUjHEoxDVKHNak31Vyt0eWHZL3klNDy78TS5QWmeSNPd14SgO+Mpf
	z1iGLMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DW1-0000000AHOS-2piR;
	Wed, 01 May 2024 17:13:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DVw-0000000AHLc-1nlq;
	Wed, 01 May 2024 17:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A059619DD;
	Wed,  1 May 2024 17:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A3CC072AA;
	Wed,  1 May 2024 17:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714583582;
	bh=IPz3/aYgNNtTogx2QM/gCrHuFcu+FzM5abaZXdd4Yz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tkwq10iKy65p80Ifjsox/DLLayxuj+nXv/KiaiaLvUT7iXX3Lsb/vXUKbej837y6+
	 oFP+d24cLqsoV3YN+nD9qskRfyG4+hXDqDaoRaVlUza1aio4ef9rNxlOCWxtQvKao2
	 hxfQpL3nt0+VPUHXaFRYC2KVeXXPG2VGBnPj9M8Dn/WCAnceBWQsYMEfrwDuI6vi3Y
	 NpGSZW3z8srrJh0iKwVNS8cYydXi8ii4cJO0cVWwY/cLtZofBPJomJQ1VLOopgiSeg
	 OPpOAETa2Cin4x7krMLph7NXP8rnqXSLtuWMKv7cuoGwfEu8Ke8+qdVuhFtU0Cb06O
	 YIvRyEzwbv9XA==
Date: Wed, 1 May 2024 18:12:56 +0100
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
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240501-drained-gradation-28fbca0cb566@spud>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <20240501-drivable-deviation-0a493511770c@spud>
 <ZjJ3oaFWhbLc39sz@ghost>
MIME-Version: 1.0
In-Reply-To: <ZjJ3oaFWhbLc39sz@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_101304_591184_80B1EA75 
X-CRM114-Status: GOOD (  19.61  )
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
Content-Type: multipart/mixed; boundary="===============2287407247129827276=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2287407247129827276==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/qzKnHYGdUVhk0nf"
Content-Disposition: inline


--/qzKnHYGdUVhk0nf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2024 at 10:10:57AM -0700, Charlie Jenkins wrote:
> On Wed, May 01, 2024 at 12:40:38PM +0100, Conor Dooley wrote:
> > On Fri, Apr 26, 2024 at 02:29:19PM -0700, Charlie Jenkins wrote:
> > > Separate vendor extensions out into one struct per vendor
> > > instead of adding vendor extensions onto riscv_isa_ext.
> > >=20
> > > Add a hidden config RISCV_ISA_VENDOR_EXT to conditionally include this
> > > code.
> > >=20
> > > The xtheadvector vendor extension is added using these changes.
> > >=20
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  arch/riscv/Kconfig                               |  2 +
> > >  arch/riscv/Kconfig.vendor                        | 19 ++++++
> > >  arch/riscv/include/asm/cpufeature.h              | 18 ++++++
> > >  arch/riscv/include/asm/vendor_extensions.h       | 26 ++++++++
> > >  arch/riscv/include/asm/vendor_extensions/thead.h | 19 ++++++
> > >  arch/riscv/kernel/Makefile                       |  2 +
> > >  arch/riscv/kernel/cpufeature.c                   | 77 ++++++++++++++=
++++------
> > >  arch/riscv/kernel/vendor_extensions.c            | 18 ++++++
> > >  arch/riscv/kernel/vendor_extensions/Makefile     |  3 +
> > >  arch/riscv/kernel/vendor_extensions/thead.c      | 36 +++++++++++
> >=20
> > I see no modifications to cpu.c here, is it intentional that vendor
> > stuff isn't gonna show up in /proc/cpuinfo?
>=20
> I wasn't sure if that's something we were wanting to support since
> hwprobe is the prefered api, but I can add that if it is desired.

Desired API for programmatic consumption, sure, but for human users
I think it's good to have the info there.

--/qzKnHYGdUVhk0nf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjJ4GAAKCRB4tDGHoIJi
0j3QAQDeC/2mrXk6dao/g67mzgn2Smh9xCv61aljEa2yPZ5CnAEAgL6ApCxtDfzO
MGOVAm2ywft3ZaZrWjs6YI+O9CVW4gw=
=YR4z
-----END PGP SIGNATURE-----

--/qzKnHYGdUVhk0nf--


--===============2287407247129827276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2287407247129827276==--

