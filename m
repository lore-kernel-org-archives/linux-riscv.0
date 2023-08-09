Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1763BC001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 11:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drXZJtjnOX0C8m2A2Jh36p50VOx6TTno4SDPSjIR5Uo=; b=P1bM49IhVcvAtmJQMSeF4u6gGv
	W83sBECl1jN0BXuLyg2J3JeuYBIalA60pN3L/MEwM5RqyQGYq0vDQE7BO/v2/Ph2ysIcp/4twu7GB
	VIfwOSIJll9lXJoo2E/uofNfqDWhFp00M9yGI4YKUPkU/Hic3eue7U8yt2nPEo+SSoZogViu+4lLo
	5q710V6vIhMoXFhV/xSRR4g5XjdmDhMgDJOk7W50c4f7cA3gaUQ1BW4TL1d7szgaAjij2C416/Q/9
	ramSZ0YT4O7Ldqq2VI6p06OQ26tH7C4pW7XIlbcRuJT+5cewNbDu1bE6ZVftwPhrKLT+34w7xFWmR
	+1A8kq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTgzz-004jMh-2L;
	Wed, 09 Aug 2023 11:05:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTgzw-004jLw-2F
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 11:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691579105; x=1723115105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p4FORBjsEVC++BkkUwWMyRT93MEizkm2MWw3FwdJmlM=;
  b=2kx7urG40nhkborxQMPCjrCsBe9rgiIXzYUIOVrd4PYUCnBsHIiz89X0
   aHZelAe3ZFRk2Iv8Dv9wiRSATgzeRK7f1dYP1BRWr0xjnkd53wKWxe6y8
   XOivMKHSk4KYmnPcF/73q6OLoiK2PcQODf88tHp05qxUdfLe0SPYbLybk
   mwUER2UUbhsZxvLuYpQ2+UrANgk2KTCZ424ZKapbZM0FOeiTPoP7KEI8/
   DWTQ37Lf3OYwlsToX7+yt4nUOfdCEHvkNJHZDWj81FuIFKsuXcd6YH6D/
   +s0snuFHFYAdlFKXCmxeigRZkOVqCdX04Chf8zmxF/UQrEiAmNnenOAWt
   w==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="asc'?scan'208";a="228848708"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Aug 2023 04:05:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 9 Aug 2023 04:04:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 9 Aug 2023 04:04:51 -0700
Date: Wed, 9 Aug 2023 12:04:14 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
	<atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@rivosinc.com>, Song Shuai <suagrfillet@gmail.com>, Petr Tesarik
	<petrtesarik@huaweicloud.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: Re: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Message-ID: <20230809-eastcoast-glimmer-a16985ff08f0@wendy>
References: <20230802-purse-hydrant-6f44f77364b0@wendy>
 <20230802-detention-second-82ab2b53e07a@wendy>
 <3e066032031e4552b4b7903755deb669@EXMBX066.cuchost.com>
 <20230808-humility-rut-e1e46cf75708@spud>
 <3931cc7932e644bd88f9baf2beddd00d@EXMBX066.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <3931cc7932e644bd88f9baf2beddd00d@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_040504_871082_B667B5D9 
X-CRM114-Status: GOOD (  21.83  )
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
Content-Type: multipart/mixed; boundary="===============3188293044219053208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3188293044219053208==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D7xFCxRFk6Od56Zz"
Content-Disposition: inline

--D7xFCxRFk6Od56Zz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 09, 2023 at 10:24:57AM +0000, JeeHeng Sia wrote:
>=20
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Tuesday, August 8, 2023 9:13 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Cc: Conor Dooley <conor.dooley@microchip.com>; palmer@dabbelt.com; Paul=
 Walmsley <paul.walmsley@sifive.com>; Atish Patra
> > <atishp@rivosinc.com>; Anup Patel <apatel@ventanamicro.com>; Alexandre =
Ghiti <alexghiti@rivosinc.com>; Bj=F6rn T=F6pel
> > <bjorn@rivosinc.com>; Song Shuai <suagrfillet@gmail.com>; Petr Tesarik =
<petrtesarik@huaweicloud.com>; linux-
> > riscv@lists.infradead.org; linux-kernel@vger.kernel.org; stable@vger.ke=
rnel.org
> > Subject: Re: [RFT 1/2] RISC-V: handle missing "no-map" properties for O=
penSBI's PMP protected regions
> >=20
> > On Mon, Aug 07, 2023 at 12:44:07AM +0000, JeeHeng Sia wrote:
> >=20
> > > > +/* SBI implementation IDs */
> > > > +#define SBI_IMP_OPENSBI	1
> > > I would suggest to create an enum struct for the SBI Imp ID in
> > > the sbi.h file. What do you think?
> >=20
> > I'm not really sure what the advantage of doing so is.
> The macro SBI_IMP_OPENSBI seems weird (I would read it as "SBI Implementa=
tion OpenSBI").

That is what it is though, so I don't see what's weird about that.

> However, if we implement an enum struct for SBI_IMP_ID

> (There are numerous IDs available),

Ohh I know, but I didn't see the point adding those when I was only
focusing on a single implementation.

> the macro can be abbreviated to OpenSBI. By doing this, the conditional
> checking of the implementation ID would be more readable, as shown below:
> if (sbi_firmware_id !=3D OPENSBI)

I don't see that it can become that simple, it'd still need to be
prefixed with SBI_ to be consistent with any other SBI related enum, and
at that point adding the extra IMP_ makes little odds.

--D7xFCxRFk6Od56Zz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNNyrgAKCRB4tDGHoIJi
0rvGAP0SyeQqm6UAvnXOLJzlnblTo0HwOabHKj0s86xTLkhOfwD/YaRKdWFfgbVn
VGwGKCt34I07EXIAbaW33QoCY9kxkQk=
=SRBE
-----END PGP SIGNATURE-----

--D7xFCxRFk6Od56Zz--


--===============3188293044219053208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3188293044219053208==--

