Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B890EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 17:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAM1BWOY4NCLMot6O+ezmOPQcchB7ABxvy1uMb9BDsc=; b=4cKstlJPguhsIxXXieNgVwO7IB
	cAw8J94ox9z1MyGStahgMhKUpcGiAH4hl5YkSvN8Mw4bRV+wKp87Zp/PpPM6fKHgrmziGg8g66aC6
	JBRc1sfSA9CK8Iq4at2W2q1qCEP6nyAWY8Wz561G1Pdk4udyjQRS+YaJPj8592DEK2vGzVZg09I/V
	Il7D/DvGe23kJAkRmpueDjZsB5WzVddcdERZdjeoe6viPiYYDoymKRv9xrXF9Hr0H4/605i8qALgr
	Yx5XzYSe/hixmAc8py8xW8kLqGhDcjjBaHDYytmp3rVEb3WNKE8vYV5sPfGdELsoI2cckM0IuIX4y
	z7mqcMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHT3o-002K1p-0v;
	Thu, 06 Jul 2023 17:46:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHT3l-002K1B-20
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 17:46:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 027A061052;
	Thu,  6 Jul 2023 17:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FF3C433C8;
	Thu,  6 Jul 2023 17:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688665588;
	bh=AWcBQfgjJEwuxCEn5C11+BRtUDDqUaFsTlfW0FoU/7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRcQooKPzDm27W2RmrSrLJlAW7JnbflJEXW9zlvj/qvFolAsjJi3q/cE+Z3PdywFB
	 efCGI4wRf03aY4wiVXAPGaXrinGIqZbVXdMK+sVWpM3C426xC8uj28V00jM+OtHag4
	 +kXlo+ZjJoUe26J+uJ3xENgY/tmjcIL+rJQQfRk5QAdD77pYi31wPHXGQdw1/dFHPG
	 l+mMXSfn0lKBUyW6VDM5yjc/X/TWOQvztGSsBsQxFWD2prCJSEJKj244d6HyOsKASg
	 /ih95XpHzgEa9HzAB46G8twh4g4/Nf6dG21InOX2dKyJSGaHPpzAgMjZ6VlxAIeNSL
	 0IobqhFdGs67A==
Date: Thu, 6 Jul 2023 18:46:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Provide a more helpful error message on invalid
 ISA strings
Message-ID: <20230706-acutely-undusted-940bf8afcdc2@spud>
References: <20230630-valiant-chimp-ba079aedffe8@spud>
 <mhng-62c3565c-43f5-4a17-940a-e02483b19c33@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-62c3565c-43f5-4a17-940a-e02483b19c33@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_104629_705382_F7A024A6 
X-CRM114-Status: GOOD (  14.86  )
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
Content-Type: multipart/mixed; boundary="===============2963206225565593007=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2963206225565593007==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UUSqAB/WlHFd6+MB"
Content-Disposition: inline


--UUSqAB/WlHFd6+MB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2023 at 10:28:21AM -0700, Palmer Dabbelt wrote:
> On Thu, 29 Jun 2023 16:17:27 PDT (-0700), Conor Dooley wrote:
> > On Thu, Jun 29, 2023 at 03:35:03PM -0700, Palmer Dabbelt wrote:

> > If you are gonna apply this for v6.5:
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Otherwise, can I take this in my series? I probably need to extend it a=
 la:
>=20
> I forgot about it and it looks like Drew pointed out some small issue.  Do
> you want to just clean that up and pick it up with your series?

Drew's issue was actually with the related error prints that I was
adding, not with your patch. Your patch is still good on its own, but I
am perfectly happy to put it in my series. (I already did...)

--UUSqAB/WlHFd6+MB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKb98QAKCRB4tDGHoIJi
0o2EAP9lgd2TiyXf/S+zus66cTMa60bkBJXk7koI6rhbfOv4ZQD8DATZfWI/fDXr
J8mD1FItK6I9RuedWrQTpKQ/dH80MQk=
=wCnC
-----END PGP SIGNATURE-----

--UUSqAB/WlHFd6+MB--


--===============2963206225565593007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2963206225565593007==--

