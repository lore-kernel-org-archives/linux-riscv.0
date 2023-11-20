Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60020C197A0
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 05:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4R3IYfGdnBFM30kOnOAnP/hNaFYwUEINd7HWqklOTbw=; b=Z90XFjGmlbl6FTK5NcNIibRv3Z
	8/OrsaU+RhUGTuQElT2bNH+OZVxoQgWKkEW2F30r2tgSPLXIBmshQSHg1kILqgaBTknm3f6CyK4Tc
	ZELqkGqbQuCoDiUU5b3b4ezklnskZkxAw3UkrgGznGZyGbnOV+cP0QanosWUUqUnqEYLx91YuVppq
	Zamh/PLyhCyE7yI1R8Xf9G//uGrgS+3iHXIwH1GPAkHh6dR7A8a2q67kuDNGn+jhydmGeOmubzuFx
	MXYX2YyNxVSRHcqEGTySvfM2TUjwrr/xAhb2nofIMK5mxK0Dp8YhU8phL4oFMWN/xgf47ESOPSiyD
	GRBT0luA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4wde-00B9RK-13;
	Mon, 20 Nov 2023 05:16:02 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4wdU-00B9NV-2v
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 05:16:00 +0000
Received: from leknes.fjasle.eu ([46.142.48.251]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M7JrG-1qzSRp3Oii-007pR2; Mon, 20 Nov 2023 06:15:37 +0100
Received: from localhost.fjasle.eu (unknown [10.10.0.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by leknes.fjasle.eu (Postfix) with ESMTPS id 6B52A3EA3A;
	Mon, 20 Nov 2023 06:15:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1700457335; bh=3lMLQJorMuq6B08W72WZQdUrlPYs/kOXg6s6i91JDlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGrwYJnTiu+uRi1VfnfrQkVG7Sd06jcxvQiYF710lgVQfY2+d4vpLQz/ASzwLIt7+
	 xqgYIf/U/PBlkqN5g5GJu9AgJ9WlWMg4erPaLiNtttRtZl/IoO9SH18C2xZyz8avUG
	 0CtmE2G3bRJ37syiEUyA3PUfax75nGiODZzeNJeA=
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
	id E57F06AC; Mon, 20 Nov 2023 06:15:34 +0100 (CET)
Date: Mon, 20 Nov 2023 06:15:34 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] scripts: clean up IA-64 code
Message-ID: <ZVrrdhsjZuKJzK-l@bergen.fjasle.eu>
References: <20231118081334.1308242-1-masahiroy@kernel.org>
 <ZVp26K9b8Apuy3FD@fjasle.eu>
 <CAK7LNATj65c0beTb5oXMDskiaFnxp1hoMOF0yG15pGv7cujNEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK7LNATj65c0beTb5oXMDskiaFnxp1hoMOF0yG15pGv7cujNEg@mail.gmail.com>
X-Operating-System: Debian GNU/Linux trixie/sid
Jabber-ID: nicolas@jabber.no
X-Provags-ID: V03:K1:x0KRONtpSOd4AkYDReHWERJeRRCTo4wv5k0xPCFce0A4elJIO8O
 uHIP3X/N8VfMdOJTpNra88u8/zsotkyhztZvTorvNP4Fl2cq1gFADNla7aCQ/xc71PE9AV/
 gD0x+TevpHyvSKk45vLWNcpxSCXBW8/fNNHI2hO64YfLwQjJxPGdw9IA1pJccq9US+Zvd4T
 RYUmnqx7PxDE8CsA8A/Rg==
UI-OutboundReport: notjunk:1;M01:P0:MwsjZfvIKhs=;90MfUd8qHzx5lXzJI+BlJEhRiQJ
 1dqONYX5nDY3oVnB8eyBTOblxsAGhtsyJqml1oa7niFbhq34pAdPZqA5uEdV00EFeTqL36ADk
 bXYIWJ8YTCkQH4cGwanp5sqaQwNtVC3su5J/6oWUwo5E05nlQjjd/2iXygIuc2uW68lD0mhMQ
 zDdm2FM4rKcHdSjIRsKZNTNqJ2/OhwCDVIp5j+lU31YOWHSx86zPC4c3jpJF224bhOcYE0ve4
 WHYCXGQidkoJrX4x253w1T0mDJkP9ZhDaIaKKDX1k7kOF1oGyVQVZozs7b9cJR8WJ/fKvRvRw
 fAsN0vxYBW4k5knJ8ewonFK1cHZUfXieqcaXPPJJYG8Ja07oanQQIGp2Lv+d947se/bVJbjhf
 cSDVQY5bOPPCLILKfSSE7b3k8YhUbyJaNWj3Vgx9pfm0Yo8ULdCh/sZjs5cFNlueUTqG4NR/A
 AzTKFZ3X0Lx4NdMQvfdnaKdFEBCj0jELeoJOLCq6y0jiW4OhU39oTGtDLGLLHdAADYHm2ocTL
 EjkemPMvve/uFYgMpa1/gIxIGl+cM0G33Tsfi5q5weZ8KEDIjg+KoeNvNbWxlIDvML7cYjBHN
 Fgff69Z2FmZH7oExBGpxypJDM0F1ChKIwNA5Eejn3Ga0/u2nrDr0uFS66S3MNgOGAG3Rj2AOW
 Z6rxW0dpGVOL+VCBYwccrxtGtEWVDuqoscM8sZZQ2xHJaTQC3ykNnWTR4b8hRAMrYfESiJZzA
 hQbmnbzadzzHNx2lfnFa9hfzhaOeS6bc2XG+UPXE/LLg5EYq6Hzb424QXBXX7ezn8NA709m/I
 sGyoy7Uhl7n+f4x/c3dg6JZUArnHC7QeDaRb0XOM87d3TekAdWNzWReuU3CC3ckBu2u7rB3Gw
 vBymskN8nFvk/Ew==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_211554_516497_4EA17F4B 
X-CRM114-Status: GOOD (  18.70  )
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
Content-Type: multipart/mixed; boundary="===============0729477876201595211=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0729477876201595211==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C/HoAfnBXhbQiVdf"
Content-Disposition: inline


--C/HoAfnBXhbQiVdf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 20 Nov 2023 13:18:17 GMT, Masahiro Yamada wrote:
> On Mon, Nov 20, 2023 at 5:58=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu=
> wrote:
> >
> > On Sat, Nov 18, 2023 at 05:13:34PM +0900 Masahiro Yamada wrote:
> > > A little more janitorial work after commit cf8e8658100d ("arch: Remove
> > > Itanium (IA-64) architecture").
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  scripts/checkstack.pl        |  3 ---
> > >  scripts/gdb/linux/tasks.py   | 15 +++------------
> > >  scripts/head-object-list.txt |  1 -
> > >  scripts/kconfig/mconf.c      |  2 +-
> > >  scripts/kconfig/nconf.c      |  2 +-
> > >  scripts/package/kernel.spec  |  6 ------
> > >  scripts/package/mkdebian     |  2 +-
> > >  scripts/recordmcount.pl      |  7 -------
> > >  scripts/xz_wrap.sh           |  1 -
> > >  9 files changed, 6 insertions(+), 33 deletions(-)
> > >
> >
> > Thanks, looks good to me.  Might you want to also remove replace the la=
st
> > references in the kbuild files?
> >
> > scripts/recordmcount.c  uses cpp symbol EM_IA_64
>=20
> Thanks, I will remove it too.
>=20
> > Makefile                contains two comments with examples naming IA64
>=20
>=20
> Which line?  I could not spot them.

oh, sorry.  Something was weird on my side.  Makefile is clean, indeed.

Kind regards,
Nicolas

--C/HoAfnBXhbQiVdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmVa63EACgkQB1IKcBYm
EmkALA/+NEszFXyPP39yKOPYsCbUS8p4J0FBzA0uhdlvl+1DCBIS08+HFjxIluF1
Nzv1QZNGWSuLM5ZuQNb2QLQIsyzHIxNSp/jGe4pJq4UeJDAbzpypsFpFOp7qyIFc
8N3qlhy10SEuzkOlKPG+qHWv3bPPxacHP7I5erPV134sap/Ffs38O6f1aMNCDL9D
Kl/6KjyJFsPjDB0tJKcdaIvQhnnlLKyRgr6UOR6Fhn9U6+g2vEpstkfplt7YdoTB
5pmbrzh93qDfwMvryIWeBB2g2HQpDvALRJPIdggNbko9MhrFL7uCo0+pnJ1ttop/
Whe9OmdUHzt7cl9704YL+B4GLz1KyNxKNkxOM2Tz+wkJ8MNmqXSD5aKz0uekWbOF
mWklu0BIz5puSMO5K3YZOEd/M7jlnj+xbRJ4oa3HK2/dwpFHwjqwJRyz0PkyWcp7
dfI/fqQzE7IOJqxqyUsDnFaYQoHZyonN9iQrTllC2exdxRpp0c8E3wTcxuUxqQt7
IkrhxDJg+n9A3hLMkqjGLTXzb5e9uGg2Rpz/WRPHbu4gS8ekqchgvVvoEAwSxSg6
mxU4sNZ8sthYUextHCkklYiirpXZeE/LbFVxWDtdkxS/hH1JQ7dlChE+6lf//khT
a/iHuGMhpa51GOB/BAlh3b1LcSGlgl0ZUWbbey5lR4/rG/ENfSg=
=S12e
-----END PGP SIGNATURE-----

--C/HoAfnBXhbQiVdf--


--===============0729477876201595211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0729477876201595211==--

