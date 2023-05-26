Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A979AC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgyRQVw68ntqo3jCEvnaNp5dHyr714RJUHRA9FJ+2eQ=; b=HHIRgHoFvPNeAGTUKfuHmcEC1b
	jLkSs3Psk8/906QOM8I5h/RuzxceDvfqaXBNUsKN8SAFHlOcsvOgv6Hn4rZuSvBhof+zrqXdONSuN
	3UdxCqFRagf9GG/c0tJmnG8cnFPV4ilHNMlHI+6kpH0uANTr+D3qn90lib4QzTSg8vIUDMiaWNDXk
	FZES+Yuoz4vZy64PcvXcYT3TJooaGcgmoAYs7xZCQXX2nrT2PfsnGKoRVC3vvkco1BCdxg+bhEUJq
	IB58TtvXpvCZYjq/UBdrqaWyQ+ojWJ7R+hSdPGwNsuDYXPNbiWlwE2N7sBEH7HaKYWsE20uODa8tk
	LdK7H3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Up5-0023WW-09;
	Fri, 26 May 2023 10:37:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Up1-0023RK-31
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 10:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685097443; x=1716633443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jv3kgjC1n5+JrmCIQo2+tQziiqBHBuOGDCYusXZdTHk=;
  b=DVi4iqAh/rT/pfTtkFrZH5G2KBBlgFU98B/Eu99xK46nmjPg6EcXo3ht
   3b/7i5rD+8W03oUk8Ri/EqVyL1J6zcIPjY0c0BqkGkadztw1dQPMS0Zew
   S/GxEjhucXq+P/HECwCI67P+2Brb8w3IJcW3/UOM4q4s+iouRN5NlGLo4
   OkFIpSuLaXd+rCymc9+7HgPTPZfADt8q5bIpjpJV/apghTNTQbdqgrSye
   0UxyhqzjABK6m5oLyz352k0ztISEUH7UQZakNVHDkwvvuQbioFH99t0yv
   +bqJ6RTHlsvC6GzZS+Lh19ftmINw1oU4P+ghrtBCDK9HzGS3/ugeT2RHZ
   w==;
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="asc'?scan'208";a="154077255"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 May 2023 03:36:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 26 May 2023 03:36:42 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 26 May 2023 03:36:40 -0700
Date: Fri, 26 May 2023 11:36:18 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Zhangjin Wu <falcon@tinylab.org>
CC: <thomas@t-8ch.de>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <w@1wt.eu>
Subject: Re: [PATCH 06/13] selftests/nolibc: allow specify a bios for qemu
Message-ID: <20230526-clover-litter-1f41398cd820@wendy>
References: <2ab94136-d341-4a26-964e-6d6c32e66c9b@t-8ch.de>
 <20230526102518.150058-1-falcon@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230526102518.150058-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_033724_058766_0F2043BC 
X-CRM114-Status: GOOD (  14.21  )
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
Content-Type: multipart/mixed; boundary="===============4259266131545958174=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4259266131545958174==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+DgvsBgu6jRefMs1"
Content-Disposition: inline

--+DgvsBgu6jRefMs1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 06:25:18PM +0800, Zhangjin Wu wrote:

> > On 2023-05-25 01:52:29+0800, Zhangjin Wu wrote:
> > > riscv qemu has a builtin bios (opensbi), but it may not match the lat=
est
> > > kernel and some old versions may hang during boot, let's allow user p=
ass
> > > a newer version to qemu via the -bios option.
> >=20
> > Nitpick:
> >=20
> > This seems very specific and hopefully only necessary temporarily.
> >
>=20
> RISC-V is such a new ISA and the Spec (especially the SBI) changes very
> frequently ;-)


Huh. Could you please expand on which versions of QEMU will hang while
booting an upstream or stable kernel? Which kernels would be good to
know too.

Thanks,
Conor.

--+DgvsBgu6jRefMs1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHCLogAKCRB4tDGHoIJi
0kjpAPwML0wLmXcsHy9jNdLnSR8p4LF+9ZCZ/8pv1hm0Fgq9IQEA7ZLOR0N6gyxT
UTASO3uvvgtigCW04/NkCWF9NWVS1A8=
=VBPR
-----END PGP SIGNATURE-----

--+DgvsBgu6jRefMs1--


--===============4259266131545958174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4259266131545958174==--

