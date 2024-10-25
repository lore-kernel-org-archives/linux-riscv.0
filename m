Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181A3D149D0
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 16:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfJMy1J/37JSyoyiiyeILhx2yZh9KB0sOQWUPTg8Q8k=; b=HMn7yvfkAtid9/uUwzF3UxQHj+
	iqdcn8yyntpSlfZz+EGqvnGBB4utKolQyMXHAMNj5DsLnlkR1hWD1AWvaATm32juecNzZdbUOYtCM
	YANSPaloxgQBsF+EMGu6he8RF0zRKqsPyzibMlqv7i4jmyH0DeRHJtf0Gtuln8Xdpl002GBLuLUoR
	YXa2XLgyoc1PlIKFW14vtiZFaShRPUJRvB9GWPFxgCh+uJJW0PWx5UUpCcaehT4XoClh+fvyv/dOF
	Am1Tjar3pTOg4BS08csaoByG8DSiBGGtJKCz/1SIR4Nx2mtEbUKk1auc/u1qOLSGdwFSo3L9mtG7R
	+3o8CVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NYF-00000004UYz-3kkJ;
	Fri, 25 Oct 2024 16:52:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NYC-00000004UY4-2F0T
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 16:52:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4D41FA4287A;
	Fri, 25 Oct 2024 16:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6B8C4CEE4;
	Fri, 25 Oct 2024 16:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729875154;
	bh=a7pcHGKkFVmFhrleGAGaukGyxvAok9EA+JP8hsdU0I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyOcdprTl94d2sMV8FyIj1UDHCbpmi4nAdBaCYvKLGpF+DCUSg0U3X4A3OWJw2TWu
	 hvTSpfoMTo4h7PtwWRMNuTGHKZgOaLKGE5sWPm19CqasTHnbO6u1xVQx9VJpVVKzwR
	 ridJfn67K3NNZu/Nneht0zYAaRiSkA51hk/tHzor3oitwllwXWLM+EixjVjrF5iJUd
	 AEgNLhEi4Ng14xoSPolgBulpJf7hLJMNx3t57Fi/xXS9dqP5vw9tQBQOCoa0KBc8mo
	 gtthw70aFBoJqwGi0ZFVTqvGJvfAJIAHaQaeydfKgGiOdIFk5ga+EGCEzi3rxRTKQU
	 7JjtOkUOQS9dA==
Date: Fri, 25 Oct 2024 17:52:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] RISC-V: add vector crypto extension validation
 checks
Message-ID: <20241025-angler-lyricism-83eacdadb776@spud>
References: <20241024-fanning-enrage-bcc39f8ed47d@spud>
 <20241024-bunny-unexposed-196d8da36e7a@spud>
 <20241025020810.GA1781@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20241025020810.GA1781@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_095236_777969_8DC0CF89 
X-CRM114-Status: GOOD (  15.70  )
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
Content-Type: multipart/mixed; boundary="===============6203227136035765045=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6203227136035765045==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="whY1gTwyYGrb9ong"
Content-Disposition: inline


--whY1gTwyYGrb9ong
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 07:08:10PM -0700, Eric Biggers wrote:
>=20
> On Thu, Oct 24, 2024 at 01:34:29PM +0100, Conor Dooley wrote:
> > @@ -308,12 +354,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> >  	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
> >  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
> >  	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
> > -	__RISCV_ISA_EXT_SUPERSET(v, RISCV_ISA_EXT_v, riscv_v_exts),
> > +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, r=
iscv_ext_vector_float_validate),
>=20
> This patch adds validation for not just the vector crypto extensions but =
also v,
> zve32f, zve32x, zve64d, zve64f, and zve64x.  I think that should be split=
 into a
> separate patch or at least called out explicitly in the commit message.

Sure. I think I even had it like that originally and must have
waywardly squashed it. I actually checked before sending this to make
sure that I hadn't do so by accident between v1 and v2 and I had not.

> > +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zk, riscv_zk_bundled_exts, riscv_ext_=
vector_crypto_validate),
> > +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zkn, riscv_zkn_bundled_exts, riscv_ex=
t_vector_crypto_validate),
> >  	__RISCV_ISA_EXT_DATA(zknd, RISCV_ISA_EXT_ZKND),
> >  	__RISCV_ISA_EXT_DATA(zkne, RISCV_ISA_EXT_ZKNE),
> >  	__RISCV_ISA_EXT_DATA(zknh, RISCV_ISA_EXT_ZKNH),
> >  	__RISCV_ISA_EXT_DATA(zkr, RISCV_ISA_EXT_ZKR),
> > -	__RISCV_ISA_EXT_BUNDLE(zks, riscv_zks_bundled_exts),
> > +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zks, riscv_zks_bundled_exts, riscv_ex=
t_vector_crypto_validate),
>=20
> zk* are the scalar crypto extensions, which don't require vector.

> Thanks for working on this!

Thanks for taking a look. I'm surprised I didn't make more mistakes tbh.

--whY1gTwyYGrb9ong
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxvMzQAKCRB4tDGHoIJi
0v8NAP40+2Sulb7rcAUIarG4dUUbSTIhaG9lZ2cRwwUTnBj4vwEAwbw8Is8Uhfv1
2WRlRpAI2/KCgmr020FXcOspR6SEHwI=
=xZat
-----END PGP SIGNATURE-----

--whY1gTwyYGrb9ong--


--===============6203227136035765045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6203227136035765045==--

