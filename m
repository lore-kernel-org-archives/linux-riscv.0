Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E607CECE57A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 12:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIS0GNPg6oGKDzQGgT0FOhLjmF8FaSROs1+wJWP7JFA=; b=x16P46Nibuh2QzcBPZCutXZNPO
	DgUTODTm9HxtIGYR/BDANKZKWySgvy7UB9HpR1VRIhvlNUy3q1UNK6Hw4VtT2zSLEVQ5kAykRmdIE
	XsSmUmTMojUJeJ2ApEu/ntwKrpgmabgAYqYyPSGkNZv6jFv8DGpb4zQ8Vc6nq3rew0BmPALSop+Eh
	8hpnXN4FIiVpmVhz/d/m2OnjwaQYHcP9+BASg1T/7mi4GQFGlAKVGgxdVVOQCDl5dYNbqsesPOGLF
	4pdyl6C9nW5ym0ajwGtiEfOGgPIx63JVJLYoMS19fixSfOg6KUyolkg/zz4fJnVRxSBeb12weXLXo
	ojz/+uhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snd7V-00000001mcI-2002;
	Mon, 09 Sep 2024 12:03:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snd7S-00000001mbn-3Uak
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 12:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725883426; x=1757419426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WKLVagKCvlej+Nkegj3NsrqkHP2IAw9hMia5vdAaZ7w=;
  b=E9GNjMEUoawgnyZzuaCzS5rc8YaFxL4X7V/by7uKMburqrshMRuW87r8
   dLuws0dkTW1MiBAGkGF+XPrl8Tz6KydwVp0rNp88NFNS9E79ZfYt8kKqw
   zsHgx9GOjt7j5ng1uF/omvtJwXgaSllGSns0yXEW6pSPcYNtlbkYltMo1
   7cqhbtNqvEnWYmFcKwOhu64XUyot2LOYB5S4lLU8CKWMo6ibKZ3hwFY8b
   7s5vaqKCehtqRqwCtco14VnjDqG/Uu5CTmNsiRE3xHJNB6ZOk1+37N3JI
   wRVrYEMwUkN3tK5fDDzI6rw3s/QO0/ZdNjCq53NJUyRzbA08hRSAMShue
   g==;
X-CSE-ConnectionGUID: G/qWnvzMSiGL2qspbnG2OA==
X-CSE-MsgGUID: X1ZbZu1KSaKuryA37AoB+g==
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="asc'?scan'208";a="198946972"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2024 05:03:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 05:03:32 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 9 Sep 2024 05:03:30 -0700
Date: Mon, 9 Sep 2024 13:02:57 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH] riscv: defconfig: Enable pinctrl support for CV18XX
 Series SoC
Message-ID: <20240909-outsell-duh-8b7c3111be9a@wendy>
References: <IA1PR20MB4953FF3C0CA0B51962DBE892BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953FF3C0CA0B51962DBE892BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_050346_962098_8107F8FF 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Hal Feng <hal.feng@starfivetech.com>, Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: multipart/mixed; boundary="===============8501055478113769328=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8501055478113769328==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r5oDv1O1gOAd5s8U"
Content-Disposition: inline

--r5oDv1O1gOAd5s8U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 04:57:38PM +0800, Inochi Amaoto wrote:
> Enable pinctrl driver for the whole CV18XX series.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

I've applied this one, I'll send it out to Arnd once it's been in
linux-next.

Cheers,
Conor.

--r5oDv1O1gOAd5s8U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt7j8QAKCRB4tDGHoIJi
0ue3AP0QNhBOpyi72GYzMwq1kpiYhmwZcXEMdnOls7RX5lU8mAEAv9P0PhlCvZIW
7GmjYyy8jZ+FYhDxjD2h6Kfa4/qYtAo=
=1B8s
-----END PGP SIGNATURE-----

--r5oDv1O1gOAd5s8U--


--===============8501055478113769328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8501055478113769328==--

