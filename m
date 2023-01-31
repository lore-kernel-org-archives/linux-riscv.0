Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822AFC636CD
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 19:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZld/XIGWeioDcGqExubGm9Nj+XIM+vcDyz72MwliIE=; b=LcKppyoFLWfSkkcoENtAFBtvnp
	0wSv+BdLjoeXKmyW/b+lACNufhbiEozSc0Y7lrBMI/RLzFREFpDqCEeL8qjAtDGlBllQs+Y08i9ZP
	hvMlJ9MT1c5o6IPY5mtwep3ytzbZmaw2ixddZX0z2WSW09w9xdxfk9d6FaDrb+vHBMpRx7vbBaDmM
	I0Win3IeII1yTMWJENnOSAorAhwmA+ZPKDsaHpxtkp42zHcbE30g1FcJE3yCmhg5oU7GnIB1mfIqX
	77BMU019CKyfo6nZ05MJZD1O/U43ieckNi9mrnjsKoO3ociDuAOImx2FEbp0/x8q5LPJwb4KZ3LBz
	tmRQ7O7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMw8v-0096CV-38; Tue, 31 Jan 2023 19:18:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMw8s-0096C6-Fx
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 19:18:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05ABE616A0;
	Tue, 31 Jan 2023 19:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC2BC433EF;
	Tue, 31 Jan 2023 19:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675192685;
	bh=cZwQsj7zCuN/ZBXASMD3jGsWx6jEe3RSZwBQzz++cD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwXGvPxNLt3YynD5LnEctavL5Ptrr97YgRKfJQhspTo0lSEVqgkgRjqcZGSmNeClZ
	 cG+mXAgFrgeoAHDOoFZQ3Mvm4Wn3HDCoKSfmvLk55tpkUvnNPU9jEUZfI+20gtUUEM
	 nNXw1J9kHPYTR9cfqY7qkCSeLsaEfs4qqtZOcX6v6KdZ9JUcVus9AO8yclD6rCRnFT
	 vED0nZMMDryNhELQsNrvKdth7EQQRcVGZOslHBn0uKiY36xC6M64aqtEsMm7TjAviC
	 riQX+RNhMKPp0RPAjdUB5n8VY08YV/WyBZFf1ZaGmKU/0AolriyWhNCbXqpICeIg3C
	 76/gvs/9xpCsg==
Date: Tue, 31 Jan 2023 19:18:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	corbet@lwn.net, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item indent
Message-ID: <Y9lpaRqUEB2YbLyG@spud>
References: <20230129235701.2393241-1-conor@kernel.org>
 <Y9c0EU5epWCeoPB8@debian.me>
MIME-Version: 1.0
In-Reply-To: <Y9c0EU5epWCeoPB8@debian.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_111806_589406_3562EF9E 
X-CRM114-Status: GOOD (  14.02  )
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
Content-Type: multipart/mixed; boundary="===============5372130723808399135=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5372130723808399135==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KfleKO/dpQtTBG2W"
Content-Disposition: inline


--KfleKO/dpQtTBG2W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 10:05:53AM +0700, Bagas Sanjaya wrote:
> On Sun, Jan 29, 2023 at 11:57:01PM +0000, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > When adding the ISA string ordering rules, I didn't sufficiently indent
> > one of the list items.
> >=20
> > Reported-by: kernel test robot <lkp@intel.com>
> > Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA str=
ing ordering in /proc/cpuinfo")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Seems like you forget to add link to the report:
>=20
> Link: https://lore.kernel.org/linux-doc/202301300743.bp7Dpazv-lkp@intel.c=
om/

No, I didn't forget actually. I just didn't think it added any useful
information. No harm having it though I suppose, but I'll not resend to
add it.

Thanks,
Conor.


--KfleKO/dpQtTBG2W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9lpaQAKCRB4tDGHoIJi
0ih/AQC+TeHV/3+1O+NNsjnBzkujEaNpT2VXVNV6Q1vv1d1HewEAhlYO/6QyCe0s
ax/fDL8w/9YdvqqAmdR8GMrsOMqsrwg=
=v+t0
-----END PGP SIGNATURE-----

--KfleKO/dpQtTBG2W--


--===============5372130723808399135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5372130723808399135==--

