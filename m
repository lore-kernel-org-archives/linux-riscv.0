Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9898EC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 21:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2YTNN3YhfNvxAfbBLDA0t7PiUXZzwpI1TaLbpSXUZ4=; b=cxElOdlKSnrKMo/+Av8HIcpgfL
	PEzZGB/2E7mH7iXRPtHKKrF2gcPkqFESmUNSLrLaurtpwk0mih+FXQptm/ev2WCCmwj9KxHZtzz0p
	xEezxWYduQffcTxItgDnStUiCotBlc/Z0ziSTUV3tWJhMMKwJTGDDay1BQU0Lcq2D13l8bgsVGKiq
	PbNa5T8AUxzaTtVXoA4KWJ0XP0R/AEntBelkV5tyOTjDO+GIFpYzUbD+EXaIQMtmGfFz+Fqk0trYn
	i7VVFhoijzM+YY6QzimYJffdHU7LbD7NbLAd+67BJgEUBCUWCmuXyNzJIjxi1GJNGxvdLx9nUqaHd
	BEiEjZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDASB-00Cq2z-2v;
	Tue, 12 Dec 2023 21:38:11 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDAS7-00CpzV-2f
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 21:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702417080;
	bh=fvRCGNHhInfrca07PkN6n9fo3WBgL+C2V/czG3LgI6o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KUkMEO8R0i7Wa1ufMi6lexwcEjqPNrQG5aNDi8Bzdo/avKU80eHkcTANG5sAtqa0T
	 Qh8ghOl+9gNc+/IrxPagtmYac0hzEXyssM0LOTFShpvjXTR0OJDRafgb2dRjg+7woN
	 xT5KAGeV5ZDUJoPt3NP6CxJgsfDwYwmcEzrv4jliJG3o27C3lUYQl6l3pq7C7ldcqu
	 T9FKxi22dwTBJImanc0NgQ5h2zjE+6tM8EdZS9OVk/eb8LwFiOWX8oVTYZh7OdizeE
	 UHj7kbE02tphhAKyiA2YYqrWBHv1tFgGXEs9oB8D4VNfsG1nY1mlSf/dBirX/DiIAG
	 AHxEmmKq78xMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SqX6048vVz4wcX;
	Wed, 13 Dec 2023 08:38:00 +1100 (AEDT)
Date: Wed, 13 Dec 2023 08:37:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for Dec 11 (drivers/perf/riscv_pmu_sbi.c)
Message-ID: <20231213083759.738f0798@canb.auug.org.au>
In-Reply-To: <CAHVXubitXvkWmvHd7JXs5kTZC4L2VvOD2B_ue3D5hUhevOpwfA@mail.gmail.com>
References: <20231211172504.058ad6b6@canb.auug.org.au>
	<846f4d8a-16ad-4ce2-9bcc-34e03f057421@infradead.org>
	<CAHVXubitXvkWmvHd7JXs5kTZC4L2VvOD2B_ue3D5hUhevOpwfA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_133808_005916_9616C8A9 
X-CRM114-Status: GOOD (  13.85  )
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
Content-Type: multipart/mixed; boundary="===============7700577222801666269=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7700577222801666269==
Content-Type: multipart/signed; boundary="Sig_/qbFGRDteV3hlvbqKI=wJrAu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qbFGRDteV3hlvbqKI=wJrAu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 12 Dec 2023 08:24:54 +0100 Alexandre Ghiti <alexghiti@rivosinc.com>=
 wrote:
>
> On Mon, Dec 11, 2023 at 10:22=E2=80=AFPM Randy Dunlap <rdunlap@infradead.=
org> wrote:
> >
> > on riscv32:
> >
> > ../drivers/perf/riscv_pmu_sbi.c:1015:35: error: initialization of 'int =
(*)(const struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int =
(*)(const struct ctl_table *, int,  void *, unsigned int *, long long int *=
)'} from incompatible pointer type 'int (*)(struct ctl_table *, int,  void =
*, size_t *, loff_t *)' {aka 'int (*)(struct ctl_table *, int,  void *, uns=
igned int *, long long int *)'} [-Werror=3Dincompatible-pointer-types]
> >  1015 |                 .proc_handler   =3D riscv_pmu_proc_user_access_=
handler,
> >       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
> > ../drivers/perf/riscv_pmu_sbi.c:1015:35: note: (near initialization for=
 'sbi_pmu_sysctl_table[0].proc_handler')
>
> I already sent a fix for that here:
> https://lore.kernel.org/all/20231207083512.51792-1-alexghiti@rivosinc.com/

I have added that patch to linux-next today and will keep it until it
turns up in the sysctl tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/qbFGRDteV3hlvbqKI=wJrAu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV40rcACgkQAVBC80lX
0GxV7Af/QwhYbcoWsMdJIIFO0tko1rCwK/E6gTa1AFUsTcmChBp8DqtUyZLBwFX9
E3HXxUvLoEAra02Icv+m5r2ngYJTbRN+uzvqhE14XrifnRZxaziquztjC6s/U/h7
OeLeOArcDrsT3yIZREl1Hee7M9g+V7j7VfYQjBrXU+K1Gr8H8WWSw579dVw++I4e
w9rPGbUorYwtQiv47BXUUSbRXCcWs+6A3mvjFmXIkUSL5E+6F4C+KmxvAW1CZOg1
2CD0L1sjj9+9vig5ssrAz8nuDviPQ0pHdzCm30tYPxNFVfl62mhVwD5Igx2M5Jrt
scG4B/UIqJ8HKCxEeZfPtYXgZVKsxQ==
=CDKO
-----END PGP SIGNATURE-----

--Sig_/qbFGRDteV3hlvbqKI=wJrAu--


--===============7700577222801666269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7700577222801666269==--

