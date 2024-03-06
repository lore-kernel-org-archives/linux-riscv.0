Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C8DC5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 18:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFq8jBleDWI+oR1GWaK/bfT+n70mN/iAxAiQvhVM6Bs=; b=rlE7hvRQWSYoDTCh3VWX1351gi
	JN52JfQNRpsoEPxz1ymsgr6zN8wgxCrFi14qF5dJLRHwBx5h3+SWilNJWLNGtRS5HTqUgogNWj8OG
	pdGqihTyyb0umCzBbzzHqY2DnwXx7/MILZsNSez8V/eSlsXA+wkGKzrML5AHSBulHpKRvlnDOo7Zd
	XH4GoaAKzQaXgoAh6oka4cQL8Wg+4C98uC2Pg63lZJ0B5R0l07dfuleBAQSVdPxET1U/yZixEoEc7
	H+hkDc/2WPL83k7pH1Jvg/UuP+QxuKuXCdsb6+mfCDL88/SntgAHJ/UhBOqldOcm/USGm9v9Umg2U
	qMxzsz5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhw77-00000001ToX-2adv;
	Wed, 06 Mar 2024 18:35:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhw74-00000001Tko-0H13
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 18:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 02398CE2314;
	Wed,  6 Mar 2024 18:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5331C43390;
	Wed,  6 Mar 2024 18:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709750131;
	bh=zmBinXKZQKNHCz0LtnMkq9ehI1d7BPLGv1+fCXX2m6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETw2EC0J/ohU7u0K634Esd3Evhl2l9bJFPOjSMc68sb+83MbI/IApHw6vVAjo9tU0
	 r+OEkxX32lwhNtb4ksxN2IAtMLoF1WKP4JN88zQPH6ZCCJeLARyyhwzWqniFmnAo4W
	 p4Av+eD8DUBbKSHzdAHTpWYjLhSuQs8+HjugMS8/+2/JbhhgNDTZLPoc4VMbbVCLNo
	 XqaVQIu8+zFWNCHTHngltJoscx/5sdUc/956vel7Aofay5YZJ2flIowHOZ3KS6Dj3f
	 OmGO4frp+PrVt2Q/3wbrnkoxMRvIkOoTkuFirR/PCElp0Te32+IYfamV9tn9IpvmKN
	 25u0UK9k+2FmA==
Date: Wed, 6 Mar 2024 18:35:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v6 4/4] riscv: Set unaligned access speed at compile time
Message-ID: <20240306-football-payday-8c9fa3e17ee9@spud>
References: <20240301-disable_misaligned_probe_config-v6-0-612ebd69f430@rivosinc.com>
 <20240301-disable_misaligned_probe_config-v6-4-612ebd69f430@rivosinc.com>
 <20240306-bring-gullible-72ec4260fd56@spud>
 <Zei2wrx4oFB5lj6i@ghost>
MIME-Version: 1.0
In-Reply-To: <Zei2wrx4oFB5lj6i@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_103534_331724_43A5840F 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: multipart/mixed; boundary="===============4297663674047522175=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4297663674047522175==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t+tSty/uiOvKCNKB"
Content-Disposition: inline


--t+tSty/uiOvKCNKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 10:32:34AM -0800, Charlie Jenkins wrote:
> On Wed, Mar 06, 2024 at 04:19:33PM +0000, Conor Dooley wrote:
> > On Fri, Mar 01, 2024 at 05:45:35PM -0800, Charlie Jenkins wrote:

> > > +
> > > +choice
> > > +	prompt "Unaligned Accesses Support"
> > > +	default RISCV_PROBE_UNALIGNED_ACCESS
> > > +	help
> >=20
> > > +	  This selects the hardware support for unaligned accesses. This
> >=20
> > "This determines what level of support for..."

Reading this back, s/what/the/

> > > +	  information is used by the kernel to perform optimizations. It is=
 also
> > > +	  exposed to user space via the hwprobe syscall. The hardware will =
be
> > > +	  probed at boot by default.

--t+tSty/uiOvKCNKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZei3bgAKCRB4tDGHoIJi
0iu0AQD87A294NjKr8yzgLFZSsbEa1a8agxZE11Zt8Rf9X5hKwEAvdf9re1vk0l0
wSoxYqqmGV1l4EMCzZlnHdClqrtCiQ4=
=9lC8
-----END PGP SIGNATURE-----

--t+tSty/uiOvKCNKB--


--===============4297663674047522175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4297663674047522175==--

