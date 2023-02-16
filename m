Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D07C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 22:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jY8th5gPqK8xLKE4ZvHmGJagHawNRYAHGzIZ6ofLS7c=; b=NJILZmzYdmRIBF1KDWvU/EtZrp
	ppoJNWo3brqyaujq1wcsiuCTIOya05ByigJ58qF3/gR1Oj1JyxQmzb1bk48kHZVU7hFjA4VsmXc8o
	mUwTO4BfwHM32WHNbMHSFNtugqtaN9lPlUrKjBKlv9xv5wLaLwQsDjzkNDKOIkG74Uhq+62Nx40hK
	PZ8pwG74JmvANsdIryBs6NqhaNEqfbIBRmVSoz2C6BE53PgI3/ATytWwVJi0w/ouzpoMtA0gfTmxl
	+8cczoNwcH7n55cruyH3OBp9DMUwfZmUJyoZ5MNC4tDOOyAUq/WnlWLOymRDpVKBDqFSpib/gG4Fv
	C3qGBeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSmMp-00BydM-7u; Thu, 16 Feb 2023 22:04:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSmMl-00Bycb-Ne
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 22:04:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 2B3A5CE2D90;
	Thu, 16 Feb 2023 22:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4D6C433EF;
	Thu, 16 Feb 2023 22:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676585067;
	bh=4OfXclkD5TB3DQfBzld5waapcTpqPssdaHhGHa8l04k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rcn9s7t4ikwn8nMH7TOTVJRVzmQMp0CJtPlWffl+EUQBzG52Eu9H/vj68hR/0a4Nf
	 /kRk0z4KN4Lil17CEQ/vXFpfGbnUvc/9O4wxjQ+ec5fLkKLXMA2biQjWhafAIiPSqG
	 VNNaQH8bIYUpvDGgjM9HsRNBRp8hq3wUPXawsRi74LxnZU5AstbZmGy2m59VyNxn3C
	 DmKNIfes7TP2dDscEWr4o/Yp3cmOIJFJVgKgS3SJMiVarasgz5c3H0TenVdTyuWv3P
	 KebF7du2u2MmeVqBSGvoMkqNN3sYGpKqF9T2ZSMNNIGQOp48RuP4loZTrPosk5PK7X
	 WWvCcBCU8hIgQ==
Date: Thu, 16 Feb 2023 22:04:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	jeff@riscv.org, xuyinan@ict.ac.cn, ajones@ventanamicro.com
Subject: Re: [PATCH v11 0/3] riscv, mm: detect svnapot cpu support at runtime
Message-ID: <Y+6oZ4mu1/jcfDIg@spud>
References: <mhng-cbb4813a-0cec-47f8-905e-48fa410657a5@palmer-ri-x1c9>
 <0711567e-39a4-09a4-aefa-4c5a55e196c9@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <0711567e-39a4-09a4-aefa-4c5a55e196c9@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_140435_968479_60DA73D7 
X-CRM114-Status: GOOD (  20.13  )
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
Content-Type: multipart/mixed; boundary="===============6080320505423748573=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6080320505423748573==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DqDPxayv/TxQmlx7"
Content-Disposition: inline


--DqDPxayv/TxQmlx7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2023 at 10:47:49AM +0800, Qinglin Pan wrote:
> On 2/15/23 8:02 AM, Palmer Dabbelt wrote:
> > On Thu, 15 Dec 2022 22:21:06 PST (-0800), panqinglin2020@iscas.ac.cn wr=
ote:

> > This is triggering some build failures.=A0 I sent along a fix before
> > realizing they're actually coming from this patch set:
> > https://lore.kernel.org/all/20230214201358.10647-1-palmer@rivosinc.com/
> > .=A0 If it's OK I'll just squash that in here, so I can avoid a broken
> > build.
>=20
> There is a newer v13(in [1]) based on new ISA extension API. But it still
> have conchuod/build_rv64_gcc_allmodconfig check failed in it[2].
> I have no idea whether it is caused by my patchset since the output seems
> not related to my code.. Please let me know if there is anything I
> need to modify.

Yah, looking at that it is actually just noise. For some reason the
before-the-patch build the scatterlist warnings got merged with other
warnings.
If you look at the "raw" version of the gist it's pretty easy to see:
https://gist.githubusercontent.com/conor-pwbot/0a1850594abdf3aebe4b3026a52a=
682d/raw/a5ed91502e27795c57c573824a66aff7f68f4323/stderr

I dunno what caused that, I'll have to take a look.
You can consider that one to be noise, sorry!


--DqDPxayv/TxQmlx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+6oZwAKCRB4tDGHoIJi
0oP4AP47pY9AuXkE9ceLNm3GgxbVCwG8GvPqhMxDnIHn94W7xAEA9/aJeb+VP7gv
p8jEU6eoNbrqtk20kUD+A/g0NGzqbQw=
=Wp2q
-----END PGP SIGNATURE-----

--DqDPxayv/TxQmlx7--


--===============6080320505423748573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6080320505423748573==--

