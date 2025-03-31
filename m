Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B261C3600B
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGhWIYanh31x2bCckJ7GbTJQFdBZa9QOjsV5tlk3UQ8=; b=OWhj7DQU6AQw3pkJiRIVj98Gla
	FDPMRT4fKQrTBnIt2F+SIoItMiuLF5QwmfAZWuwF1dtg1oZ8K0CxL3TgSNViIKhwu7IB9HFZffgEZ
	RNoiOlmjgxGxWiN02zzd4VnCOTjbA0WTI6VgHAhQLXOBF4eznOjbI2piFwCvUUmXuKJEtVjcCV60v
	tlJK9Z0+qGBtlEyK6XABIY9y0LQORpL36Y6qvEd81BgSXDHgHQ5pl8ef16NGrSmGk6Uc/fQzk3FMg
	8rHqNzcz6qWXMp6WNDklMPmoo4BDdQeed/KEJ4psQcp3jbD/3aYBff7lDVOVfHIZFvo9xaTZ63OwN
	pefhFtRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzIuY-000000014Mc-0NI9;
	Mon, 31 Mar 2025 17:26:58 +0000
Received: from s1.sapience.com ([72.84.236.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzIuV-000000014Kh-1Ngs
	for linux-riscv@lists.infradead.org;
	Mon, 31 Mar 2025 17:26:56 +0000
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id 3D77B480A55;
	Mon, 31 Mar 2025 13:26:52 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1743442012;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=jW/JBdRB8NVtJdVKbHqszDgcHxfMaw08ONOqXYWcZss=;
 b=n+bOEWB6J9BVgTkn5Z5zoXm4VauWM0ZLc9WPlFe/Su6WhX5HDpZp/3ME2uX+Y899MId1I
 VuETbMEeS4fXKaiBw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1743442012;
	cv=none; b=TX0A0FQa2pXdXFnfNJRWVmm/UDnuWHmiivVLvzUvY0iEMmBsZ8fAsEWLHRf8miUB9dxAUWPPA+rDBMoxpiFtFijNctTPtB9POzxJMUqje5lNDPGwfILK5QSSRO6Zzhiz8C2poCWsH5bwlds+hhbuauPb9Y7BZ1xLKnAhJROsxyozcFjTGjXwO1ZzWbaUIcB4fl2vMctaXXOf/xPzOOdu9sosZkQbHBZvWl1zHciCsZt91QB3Z7zTVEA7thxBEEZxYZa8Em3gp6XtJdQXkbRFzb1g5e6BFWWYdD7vcOWS8N0juNRJ/zg0q3f5rf+2BNIZrf2ckLWpJsxxq293Pbw+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1743442012; c=relaxed/simple;
	bh=jW/JBdRB8NVtJdVKbHqszDgcHxfMaw08ONOqXYWcZss=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=myM0aPzi6i+2UikNpQGHPGdGFnpze6rxX1jRBxboLfRcWesb4jXmk8ox/+Doux0LHit+soiVlgQEaDONNygvIVI/NY0ln7N/BzrnVYLixsnKe8KBVk1ulopoVAnRhdnv9FJJpYqE+O8Ya+uFVCXSAnQ2aDhsZdMFWxiBW3kcNnxmSrmbGlX4szGZgA0mPawSzyEVeb4qi1PIXlYwYI6q6tG/hVnzIg2++VsWzgoVX5ChfVbPR1QF9IsjsJDXEi2X20hrrQ9Lwi5SiEPz/cIoKtBNLAD2De5rfpn7ase2rDHmIKB5AaIfGmNVShvFyNO7CPmiPZjcyuwTu3EZH7NLsA==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1743442012;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=jW/JBdRB8NVtJdVKbHqszDgcHxfMaw08ONOqXYWcZss=;
 b=UkbvXaGQzHXhY4xXJxlfrYY98tbbjJV21H/clpGtD87KikTFQtdZj3ltRNTLa1BbvaZzZ
 74m9nT+Hq+bojqY/hjSO1SaciggfADxvmwBuMZzMStLCYNMXqgFAl49KE9GE2D93DA/Fyql
 U9dc8KkJsMtCiZ8zTI9eLiBlFeVVh+dhinWgraXD4n6HdotwqjGJjSRe4I5yutb2SGX/v/n
 MFV0FwxJ4RDK0ZEClyoLHYDQAB20aONpjbllf/9ZoEizJWgjwqjz6IC3UKn5XcFoanCaZXa
 Oa+34d1znCOAjISQwis5+ejgzEt4kKNv5fyn2lkD6wzesHB4G+e6XUTXD57Q==
Received: by srv8.prv.sapience.com (Postfix) id 0A35C280409;
	Mon, 31 Mar 2025 13:26:52 -0400 (EDT)
Message-ID: <b508c090dced250a32f413f9ce0d65fd6457f832.camel@sapience.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix NULL pointer
 dereferences while probing
From: Genes Lists <lists@sapience.com>
To: Kurt Borja <kuurtb@gmail.com>, Henrique de Moraes Holschuh
 <hmh@hmh.eng.br>,  Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,  Mark Pearson
 <mpearson-lenovo@squebb.ca>
Cc: ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Damian Tometzki	 <damian@riscv-rocks.de>
Date: Mon, 31 Mar 2025 13:26:51 -0400
In-Reply-To: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
References: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_102655_627344_3509DBE6 
X-CRM114-Status: GOOD (  15.55  )
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
Content-Type: multipart/mixed; boundary="===============6592715448203975273=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6592715448203975273==
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-jcJqEpxabjGB+XPSzvG8"


--=-jcJqEpxabjGB+XPSzvG8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2025-03-30 at 12:39 -0300, Kurt Borja wrote:
> Some subdrivers make use of the global reference tpacpi_pdev during
> initialization, which is called from the platform driver's probe.
> However, after
>=20
> commit 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver
> initialization to tpacpi_pdriver's probe.")
>=20
> this variable is only properly initialized *after* probing and this
> can
> result in a NULL pointer dereference.
>=20
> In order to fix this without reverting the commit, register the
> platform
> bundle in two steps, first create and initialize tpacpi_pdev, then
> register the driver synchronously with platform_driver_probe(). This
> way
> the benefits of commit 38b9ab80db31 are preserved.
>=20
> Additionally,
>=20
> commit 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON
> initialization to tpacpi_hwmon_pdriver's probe")
>=20
> introduced a similar problem, however tpacpi_sensors_pdev is only
> used
> once inside the probe, so replace the global reference with the one
> given by the probe.
>=20
> ...
> base-commit: 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
> change-id: 20250330-thinkpad-fix-98db0d8c3be3
>=20
Fixed problem seen here on thinkpad.
Tested on mainline commit=C2=A04e82c87058f45e79eeaa4d5bcc3b38dd3dce7209

Tested-by: Gene C <arch@sapience.com>


--=20
Gene

--=-jcJqEpxabjGB+XPSzvG8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ+rQWwAKCRA5BdB0L6Ze
28K5AQD3tSeJ1K85S+XR6hOgTFdk9qoKdW1s858f1ngrgmOFcwEAw+VzTy7ba1f0
5REnjcigjd0wTPZYDA6Dq/nGLRjvhQI=
=lfA1
-----END PGP SIGNATURE-----

--=-jcJqEpxabjGB+XPSzvG8--


--===============6592715448203975273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6592715448203975273==--

