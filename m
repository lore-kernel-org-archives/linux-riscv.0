Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCC0C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 19:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2kP8ctFUw77PWexNGP4atznk7P5Yh2NmXKiCQ6vqYM=; b=O7x7h+pyZrJjm3bszZXetTj+R3
	6nopUsBY6Wsxgohq5RVV7TngQg4YMflWBuPrs8mSB4/kFMKT0RKPMGArBzYeNzN10ZZXLC2whmqmn
	oEJxVPFPQ0cdMDqpmlD6filrDALRCktcaYCsBjScxBXUL5a53T5Y8a/Z+cef+x6fc4s9mwlfn8GsQ
	NOAoOKrXFOhcV/QdHG1tENgQM6r8ES3ZIb3BQeD/Gc+MqjBgq/+6Byl8k8c5VT6n6qucAKE1Nlq+8
	+xVo7W+hqDVqGFySXVm5yblFF/nSzhWlMeglSOWFSVIb9S2qzKm0siydGgpoixNSyl5VwgUjxH7Eh
	w7AsXYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtb6X-000hdh-5l; Sat, 04 Dec 2021 19:53:53 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtb6U-000hdE-Ag
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 19:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638647625;
 bh=PrgmBUyfxqtpVy1lwWQb2aVCmUol9Hr5FDzh3x1bgZo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=YY68JzKDAR19WzIfvWgVMqf8Huj64ceX+qVriZMioYecFs6YV/1kXsDgbYI2I3GD8
 TH9gVC1AK6Z3fHjwdVPOsiExXhbNId9sP3AUwCvx9YRqeA4RpdjGVdJWyDiPiqZPPW
 AqrMj6OQEZPpyV8T+UKeOlbuirSqM+b9bRE5ZQks=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzBj-1nAqv50woz-00Htgr; Sat, 04
 Dec 2021 20:48:18 +0100
Date: Sat, 4 Dec 2021 20:48:16 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Joe Perches <joe@perches.com>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: Sort entries using parse-maintainers.pl
Message-ID: <YavGALvWdsW+BO9w@latitude>
References: <20211204175255.1361385-1-j.neuschaefer@gmx.net>
 <429227f33cf14aee6f0668a3d98aa220b54383d6.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <429227f33cf14aee6f0668a3d98aa220b54383d6.camel@perches.com>
X-Provags-ID: V03:K1:Mfj+DDgT2I4N38q2aei8davRHgCE1wdFIJ1g8ujVKryRuGnw1/6
 R3Q1MR/FfJJYbiNJJjCSvuFjAhMz16vQWesCPTP5qnvjRXVSTlqpZf//kOboyarVCfJ7YoL
 RvOwyh/7qTvtQHEc7OhPyEsPKUlb3N3S0MzYPaBmXIXjL85tN/rdL0B1bTleNuDf0KEW4Lr
 j/gZc4WBkWHxXkuRW93Lg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K0JWHB2eqz4=:yq3ljFLxb5O5yxQHm42Ej3
 sbZTi1GWX8w+wnoDjaGPUYljW4zm9Ot8+vxga4nfJA0vDS0rkAGNG2E+VYYhxfK6Oi9hmUaoU
 LTz6ocypvE7ysU/iy5IxU80vw7hYqqDKZAzqRlxsQBxpvMNPHJfIrwCsnAOdCOogzJs97bewN
 aXrS19/CNp4AW1xztG5FCxP8hFnxRrjBmdUG+zj4vQfsxSBCNLHOCLyd0ev25N7t3HX/Fmu4H
 mC8cJ2pI+17Lw7OgGKWkT/Jh7ZrdZoJC4uWTP17mKNMkCyDbfZDWmwrje/ZcwUICG5rgVdlgU
 ZBGahQOwHv4nfnuvQba0kEpXLAGgzOPp6dAhRjWuykNIYmPfv2QZpTDT0yxPRyrGLkvawKwVN
 W9dl8ljUdojuqtib85RmEYsJ7GcOA3ITgVHmIU4PQA2zFa21t4b0WYxQw+dsPxNnnA/y3PHP9
 EF75mCSde4W312TTAVHaCMGj2s5segj/33MlVJgjjJSw/qgMzVKwZ2oGK2FkMt/lL3SFCbw7d
 0/2gv/w7GsiK6b13AoDRbrhCgKBzumeGYBJjYj56IYA6u792g7UpS7NB6Jg3McSA375RmbWjW
 OnG1bitdHR3/tHoorUifV3jfD/dDkkgg0OkssSpDCK7FNX0T+v2NtzDztejoemZb7AiJKcJ1f
 b+e89B5/O2H21a9QCltoz6zbvNvcAFiEUTd6MXxdQgQ1CiFK6JlUJUUuRz6ODE+yD6Iha7vwm
 EnSc0uoCuJS3aLKHwmcgVow4Elrk7VJaiRMEtwoqIv1nyP+YzSvC0QAoTYgTxJfLcaSbGoHjc
 tCOkzaSuRD2S7ZxLSQGuPCnIsUwY6SH9bzuI4MbgNV0qciSlfr4xwui6rA9rwIdH3bG/WFitY
 RGB1w/cIrYsNmHs67MKLUkJnom3d+4Fyo1/VZOV6/RQ3oXnJjUvF5bdYEjVALRsuCVjf5eT5j
 VvR71qklrY5y5NBBW549MTCPd0ng5peBHgtE2LLsZhg8lo6Oq+aeo+y4WpKmFkkzafaBRLls6
 TD+m3/Hw+wF2Vzs10ZGxnS7iD6z0gcLpS8GEzCFQ+PknD64YmWhsXuGwg1cC0bh4uDJEj2d2X
 3JDdnLkQlpOAIQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_115350_685453_2E742F5F 
X-CRM114-Status: GOOD (  13.39  )
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
Content-Type: multipart/mixed; boundary="===============6990687861418591562=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6990687861418591562==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ROvq4wnVg2ILd55W"
Content-Disposition: inline


--ROvq4wnVg2ILd55W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 10:20:24AM -0800, Joe Perches wrote:
> On Sat, 2021-12-04 at 18:52 +0100, Jonathan Neusch=C3=A4fer wrote:
> > The MAINTAINERS file got slightly out of order again, making it
> > difficult to put new entries at the right (alphabetical) position.
> >=20
> > Run parse-maintainers.pl to restore the alphabetical order.
> []
> > Checkpatch warns about a few unordered "F:" lines within sections, but I
> > left those alone because I wanted this patch to be as automated as poss=
ible.
>=20
> The --order option does that.
>=20
> $ ./scripts/parse-maintainers.pl --order --output MAINTAINERS

Ah, good point.

Unfortunately, the result of parse-maintainers.pl --order currently
produces a (small) merge conflict when merged/cherry-picked on top of
-next, so it might be better to start without --order. (Not sure.)


Jonathan

--ROvq4wnVg2ILd55W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmGrxcIACgkQCDBEmo7z
X9tVJA//aISsE+7K0fQ3JOcW81DBxVamtjIVwDlgWZY4/GydoC2/Ixgyab2/SNX+
+sKYYtB1zlrkYtDQFG7UQ7b2dATpwntvZuLMM9j+MtZ9ZxXDmDZz52omGGlZlMIp
XIVpoglmN9YTWOc0p2iCi2P9wMwdZSghfpjSBdzyp4iZ2OCYpI+Rzuo0Mh+sKpV2
l5DTv8+kV9gjRgoQGNktF/grwyJZVF5tJqXex5rQg+cftse+cOi5/awVepvG6czD
w7OrbVzbyt+/M47hI81XtnNsP3nTEXQW8fJsbEIeBpdP+OUwWtP+FI0et1Q4jnaG
6I0+4xFZcg87jbD/2FpIuEyCvWiw1YBJ52nkfcOFTSjLkuBTdqGc+DmJbZrZEe52
ZdSmN2l36IKA1Rw+quMe8eCNAI4eiSqtR8M+tar9ydhUxKBiCcVExpraEhXW5E4I
jBJnzwxb3FFHopI97VhXvTTqdSxVov2cU7vDLoLdGz1LDQr8/ni6pMj8tCkLmYoj
s3eQ5mdnb86hpObpkbRViFymzJPtxYq/pUzgz0JDubJhUjOVtvqixO+JkP2Uy1qP
locYLqWcgHoJVXH5k9d6Sbo16FB3ZAPhDGO0mkQhVOHjr2zX/gbqIqeuXO86vSQ2
IYDaxBZQBPLhgs5v0Na3yyFa51K9/706r+eJYCtvGPboGUwFUx4=
=7ALR
-----END PGP SIGNATURE-----

--ROvq4wnVg2ILd55W--


--===============6990687861418591562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6990687861418591562==--

