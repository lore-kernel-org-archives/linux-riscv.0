Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB86DC74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 08:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0sOVnGgC2FzwWyT2eeJhS+8eI/r3exhrYg0gVihaEA=; b=G+gW6BcT7fzm6krXTUcqEm5UCF
	TGz5xZPGwSXHjWFsY3r8ldIhy86G59zYzRFhyrYWU2b3YUN4fp+83HzC3L5EuFK0An43Sv3GE1CWm
	GPTDcNYISlqWf25uGgBgJJ/DaSKx2ylh2n2tIM/6LcLMMV3/MLrZ4k/C4+d82sIxU5kehQyNaDfjT
	GVoIHY29Bs8PQ4Rco4NaSGF6LJ+6ebH53tdVGZpzIX1c8CJ9y2blrsw4cltbPSxUedomX6ajKdnfd
	evIuxD0MhOlpkSOBG36CBMmLOGX7WnyBZrUfCzVqaeXpYcGi/+syz+grQJmdhLoH2R9ueJwJhYtrw
	Gmnl+DrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQxW-00H2xj-0v;
	Wed, 29 Mar 2023 08:15:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQxR-00H2x1-2Z
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 08:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680077701; x=1711613701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QbNn2qOdg3KN2SXSyc2jEkL22WW9OfBopNhlEH8Wr1k=;
  b=rOJQ86w/fSoYGkgcg+CRmEs7KGGKh79yA/QzobilhaitNlC+dfJaljb7
   KWXuRleoMwb/bQzD7gEY2Ol9tcC6SAsseSStw6zMX1ny5zPQeExOWGdLl
   vFqz8D25IMTBFGg2zXn8zWGaEqUigaRYol6vpn+5DiEMoQ7oJXsASLLIp
   DeqGLO4beOk3sVHMNJ6so21j9ep7bS6YKfJmMq5inZedNbwSezDW3gU80
   TY993wdUzbNKbtMsM5o3HZHwkMq3USi3gZn6w2eVafk8ytG2hqxpDdmVj
   yzIMg7rSGQTb7fezyDlLZuZO3uEV8Zi/Hx4I6tWU1gbkAW5FerZ+bsDaL
   A==;
X-IronPort-AV: E=Sophos;i="5.98,300,1673938800"; 
   d="asc'?scan'208";a="144444774"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Mar 2023 01:15:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 01:14:59 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 29 Mar 2023 01:14:57 -0700
Date: Wed, 29 Mar 2023 09:14:44 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
	<corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -fixes 2/2] riscv: Do not set initial_boot_params to the
 linear address of the dtb
Message-ID: <234aaac9-d5d0-427f-8666-7f257d385358@spud>
References: <20230323163347.182895-1-alexghiti@rivosinc.com>
 <20230323163347.182895-3-alexghiti@rivosinc.com>
 <831ec4a4-694b-4ace-9500-9b2189a7f16d@spud>
 <08c3a597-0950-9756-9665-c017942de81f@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <08c3a597-0950-9756-9665-c017942de81f@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_011501_887779_5B352402 
X-CRM114-Status: GOOD (  17.71  )
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
Content-Type: multipart/mixed; boundary="===============7787682538640062353=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7787682538640062353==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R/pXHIszXQL98hTd"
Content-Disposition: inline

--R/pXHIszXQL98hTd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 10:09:13AM +0200, Alexandre Ghiti wrote:
> On 3/27/23 13:16, Conor Dooley wrote:
> > On Thu, Mar 23, 2023 at 05:33:47PM +0100, Alexandre Ghiti wrote:
> > > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > > index 542eed85ad2c..a059b73f4ddb 100644
> > > --- a/arch/riscv/kernel/setup.c
> > > +++ b/arch/riscv/kernel/setup.c
> > > @@ -278,10 +278,7 @@ void __init setup_arch(char **cmdline_p)
> > >   #if IS_ENABLED(CONFIG_BUILTIN_DTB)
> > >   	unflatten_and_copy_device_tree();
> > >   #else
> > > -	if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
>=20
> > btw, how come it is safe now to drop this? This feels like a separate
> > change that should be its own commit, no?
>=20
>=20
> It is safe because early_init_dt_verify is already called in parse_dtb and

Yah, that's what I figured. Cool.

> since the dtb address does not change anymore, no need to reset
> initial_boot_params. So I'll split this one, thanks.

Worth noting the point at which this became redundant in your commit
message when you do.

Thanks,
Conor.


--R/pXHIszXQL98hTd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCPzdAAKCRB4tDGHoIJi
0rSKAP9Ntw+oq3rTUBam25Gv5Uu4LY+aMFWlek/LTpoJTOruNwEA/55TL5zj0G8R
KShM5nzDlD9LAQb+NVa8Vu2dNaukUA4=
=2iF6
-----END PGP SIGNATURE-----

--R/pXHIszXQL98hTd--


--===============7787682538640062353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7787682538640062353==--

