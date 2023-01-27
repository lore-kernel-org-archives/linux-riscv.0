Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06585C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFFDsJ5kVHT3qCjSNNqLna5HNLvNXBBjy7nbOqOJC9E=; b=ruCic+GNf+shLoQdKYQ89XckJk
	o9gEC/w/dccLBrvXNhkSLUhcsGG6ucWfoClqcBh+COZm+AJ+wAf5rfS1KKYvPQcmDdUxFSYxWKHRM
	xNhzwHB7hVZJCFPvU/cgtAGNtQW4GgdmANXB8OhHpdaLF2eg+RLeycVU9slg+5WFEhc0zLJoD8I/C
	szqgQJCordQ0l3HDFNnIR1TtWiGHW0HNvPRG0n6G+eETXuX4ExwScXoIvhaCKevgjI1r7VAHtfIhf
	vhd4PLUYPYZ6cITm2OSGnDgbzBYJ6/vKJj42UN+pCQM0l7GJGBcmyf5z6H/QFr1ZncynO388HqM5v
	pI9XX2xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPbI-00FFjI-7T; Fri, 27 Jan 2023 14:21:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPbA-00FFgr-IT
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 14:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674829260; x=1706365260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qRi/ydqT7NbsVpsX89s+hti2aWqBktbxWkTgajSS8xY=;
  b=eslIitcz1yYc6Uvh4qfECvSEdiJdmjx4sn0+XSNZN7ip0VT1DGf1wC4h
   isXL1tw/ApVLkrI4tv+BoG7g7TdeAAUb+hIArwbYZrgxVOt/aQTeSJsOI
   64K6qIINPbYQPCD/PAeuYuri/WP7buXu6cwAi6Wmgv8bBgekt4cEEh+sH
   wxpy6w3IOKMHfaGTd3ybQXoUkoP0e9JvQaTk1epCl9U0+3KHCmiUGd60B
   cwv0/kwPPcHqQ9KjZaqqZ6g6Wd3OuMjMme7igV+LhGzGHOXCEqXcJ06hB
   KlCFePr4ngSkPn9L3LNXGgAxGCaU8i9AEBGbcGY+HWwiq8OkY1oM3UlXl
   A==;
X-IronPort-AV: E=Sophos;i="5.97,251,1669100400"; 
   d="asc'?scan'208";a="198299614"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2023 07:20:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 27 Jan 2023 07:20:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 27 Jan 2023 07:20:52 -0700
Date: Fri, 27 Jan 2023 14:20:28 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/9] RISC-V: Add AIA related CSR defines
Message-ID: <Y9PdrOvb8bYXpgVw@wendy>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-2-apatel@ventanamicro.com>
 <Y7YGp/7ufyRPhkwg@spud>
 <CAAhSdy2YKJfuxhBmsx9v-OMyxKQjys+J-z_ZqoPJF7q=YrE4Zw@mail.gmail.com>
 <Y8cIG6gKSlkTh5AF@spud>
 <CAK9=C2VzJvpQLPedc+ruUnw8xDDDaC6_Vmj6qg1nXv+iqU-AfQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2VzJvpQLPedc+ruUnw8xDDDaC6_Vmj6qg1nXv+iqU-AfQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_062102_215349_5F88EC0F 
X-CRM114-Status: GOOD (  21.43  )
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
Content-Type: multipart/mixed; boundary="===============5232190756197003268=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5232190756197003268==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q5G9sbwHy4TPVN/e"
Content-Disposition: inline

--Q5G9sbwHy4TPVN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2023 at 05:28:57PM +0530, Anup Patel wrote:
> On Wed, Jan 18, 2023 at 2:12 AM Conor Dooley <conor@kernel.org> wrote:

> > > > > +/* AIA CSR bits */
> > > > > +#define TOPI_IID_SHIFT               16
> > > > > +#define TOPI_IID_MASK                0xfff
> >
> > While I think of it, it'd be worth noting that these are generic across
> > all of topi, mtopi etc. Initially I thought that this mask was wrong as
> > the topi section says:
> >         bits 25:16 Interrupt identity (source number)
> >         bits 7:0 Interrupt priority
>=20
> These defines are for the AIA CSRs and not AIA APLIC IDC registers.
>=20
> As per the latest frozen spec, the mtopi/stopi/vstopi has following bits:
>     bits: 27:16 IID
>     bits: 7:0 IPRIO

I know, that those ones use those bits, hence leaving an R-b for the
patch - but your define says TOPI, which it is *not* accurate for.
That is confusing and should be noted.

> > What I was advocating for was picking one style and sticking to it.
> > These copy-paste from docs things are tedious and error prone to review,
> > and I don't think having multiple styles is helpful.
>=20
> On the other hand, I think we should let developers choose a style
> which is better suited for a particular register field instead enforcing
> it here. The best we can do is follow a naming convention for defines.

Well shall have to agree to disagree I suppose!

> > Tedious as it was, I did check all the numbers though, so in that
> > respect:
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> BTW, this patch is shared with KVM AIA CSR series so most likely
> I will take this patch through that series.

Since the path which it gets applied is between you and Palmer to
decide, feel free to add the R-b whichever way the patch ends up going!

Thanks,
Conor.


--Q5G9sbwHy4TPVN/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9PdrAAKCRB4tDGHoIJi
0hKXAQCV41cEz/0+TALwgNAhpxgpr/x9in2qmKvIyEVcmTybHgEA/fTEeQ8D3ipy
4nLYxkY/iE4Orn6/f5tKcQ1ydfXq3QE=
=1kNL
-----END PGP SIGNATURE-----

--Q5G9sbwHy4TPVN/e--


--===============5232190756197003268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5232190756197003268==--

