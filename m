Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2535FCC05E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 18:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIcmgUSA0WgGgM3H5oYvDq8H50WDoMmdvOsQztH3Hr8=; b=zxVZhDfGQObOSf59uXNCFUtqLu
	2x9BCVvDpmHFacs1PzHUHxJOfoSMzsB4qd757WYNE0EN1QqxJ1S0bXFf2ffdOz/01SD9/4K8K4jur
	YZV5x0KinuuPsPVzh7KTr2GLby/mT63l60OAI7mGT9vhgml+aaOS1IgAsyOU6FH6Aqivj9e3PZBYL
	vOqzRUe/WGhYw0JYOSz6d8ToJui71cKbMNkVz5Y8gnywdB+ScbgYY4dOW7nxyRc21C7lmgsV0kFX+
	wJdu3+LZlJRpbqXPcoBIOby5le0DYEgOde2WBSfbiM7+4ujdFUeObEfmwaQCr70YzHgDg86dRQq0U
	pMB7sOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaFn-00000004M20-3jTI;
	Fri, 06 Mar 2026 18:50:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaFm-00000004M1f-0qFQ;
	Fri, 06 Mar 2026 18:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5037760018;
	Fri,  6 Mar 2026 18:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80338C4CEF7;
	Fri,  6 Mar 2026 18:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772823025;
	bh=CXf+qiTuDfOz6CfipA7SxNP2+LULMzJLNMe3liFGXl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDLXsQk9ocHR6NuQ8rXOcdGiBSxfWF61GDyxN1m1bXeXtgz9zOlCePO1gf1n0mDaD
	 xze4NkFofoZlfEj9uaLLiPZ3KprYe+CkRonzasZDz9VPPsaVLhGAS7HotmRhgfAhjG
	 4is/vp7y1kg+kXM++z28Khmt4lXamB6sAZl2jmxdvS/YKCZJLhXzuw0CVPiYtgq6xr
	 1J6NAk3kR2Fxqt0t638ugju3KpeRsiAwQF5wb+FMLVJ5Ve0W0q3iRRGQjg4W/Jk/lN
	 UPylw0+h1WA0N4WZe4JggEAqRQOZSkB7KmNGuXc9XObgRzTM8gRcRgQPMB+VBPpi/H
	 E3PcAkA/ANOhA==
Date: Fri, 6 Mar 2026 18:50:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Guodong Xu <guodong@riscstar.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH v1 04/11] riscv: Add B to hwcap
Message-ID: <20260306-extradite-vexingly-707b5633ef03@spud>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
 <CAH1PCMb5YS3UzaxhHCjPJHxeTKMcdO78VTPxa7+oktbbhqQ72Q@mail.gmail.com>
 <wozbsfbvlhsqhvrvjsxyx2u5rpagwlnezythkutzqwikmzeoah@lc3brdn5cu3t>
 <CAH1PCMaAEyZVioQmyJh7oFisnFnrxhnc_exJh5=vbZSvNcieJw@mail.gmail.com>
 <z5bm4uoryuvz5cnsdl37pqmctkqrxw3kk7vqnb3vopnyg2mhl2@ctwdfkgahjfk>
MIME-Version: 1.0
In-Reply-To: <z5bm4uoryuvz5cnsdl37pqmctkqrxw3kk7vqnb3vopnyg2mhl2@ctwdfkgahjfk>
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
Content-Type: multipart/mixed; boundary="===============0750442185043509854=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0750442185043509854==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/AcnNhLeLmSnANzW"
Content-Disposition: inline


--/AcnNhLeLmSnANzW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 06, 2026 at 12:27:50PM -0600, Andrew Jones wrote:
> On Fri, Mar 06, 2026 at 10:17:19AM +0800, Guodong Xu wrote:

> > + /*
> > +  * B is functionally a bundle (Zba + Zbb + Zbs,
> > +  * no additional instructions). We use SUPERSET
> > +  * instead of BUNDLE because B needs a valid ext
> > +  * id for isa2hwcap[] to set COMPAT_HWCAP_ISA_B.

What's the actual rationale for it working like that?
Why shouldn't bundles appear in cpuinfo etc, I forget entirely why we
did it this way. Feels like it'd be easier for users, no?

2023 me might disagree, but 2026 me doesn't see the value in hiding these
extensions. All I can think of was me being very negative, and hedging
against bad software checking for zkn and not checking for the subsets,
and breaking if the dt listed the entire subset but not zkn. That, or
not wanting to implement code that looked for subset extensions and
populated the relevant bundle if the bundle itself was missing but all
components were there.

--/AcnNhLeLmSnANzW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaash0wAKCRB4tDGHoIJi
0iIAAP9oTSvcmB5/lTwaR52b6Bb1IZv+M5XS98rKIMQhw6YIUAEAjhGUgg041nll
NfMwiNs7eX/UD6TIlfQOyt46KoyXWw8=
=E4vH
-----END PGP SIGNATURE-----

--/AcnNhLeLmSnANzW--


--===============0750442185043509854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0750442185043509854==--

