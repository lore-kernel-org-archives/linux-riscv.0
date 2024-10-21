Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CCAD0E6E1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 10:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6JS9bE3BgCce6jWTEU4amodpEErJxOcvFNZuZq3tII=; b=rdVSs19H+46KC9Ji94xdr/I93z
	3VOiN+eZq54lml7y5/KviblxOsB0l2tVPwsCwNPSdBxtWMuitKOQoqR1zTCDPK7Y45puhplTEQMlu
	KJGg7Mh+JnmklPq+k4fjp+HQTpdeiyxpPys91VzdPCQ93f8+K47zDYgTqIPJY4oL0r3hGrIppXCw/
	1RyVvZzeL8l/lKyv16kUXu6aMSlVA+ixNv3IcvixiSqozzBxc2cmenv3SXsGsk1i66MsGP7FcUNkt
	AY26W9m/z70oStB31O8tH3lsBMpmN8lImDsJkWIRlUIVdcVlg8NZgqCK16Jk7SThz8SgUx3JiVetv
	yN6jfz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pYO-00000006s0c-362B;
	Mon, 21 Oct 2024 10:22:24 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pUD-00000006rRW-2pIY
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 10:18:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729505885; x=1761041885;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Q4czTQPI4Z5Zy8B+MQf/hc42cmnbOK1BUsG1bn7iWN0=;
  b=lDOCHzje5IhvA1MeG7zXbxwuasOZOt2Nk6d+ltl0q//sydvmV6T3dWmf
   OEvNPhCDXvxfxl0vcm4X3K76HSdGNWpruZGobpqP7GHoAiCUaTbWz+eJ6
   HtEDfn0Cj2vUI5THx6xrHcW9TOQ9QL3cWDOMcUQ0UYdvweCO4suJ15hsc
   s2hjrpOfOiN9QTf1brbYh2VieMAzAK+fxT4xxffF/gYBoqhJ6+CnuqO2S
   exZ+M/WQTRIsYMHKooDYS8HS2CDb2XijTaNIccoypvYf0kD9kUMnH77JW
   l1BhenXoEfKNScVw2EwDQlUeJir5VaCs64N0h65QBC63g1W4Zri0lIair
   Q==;
X-CSE-ConnectionGUID: LtXGcAp0QNq05H5TFaE4Pg==
X-CSE-MsgGUID: znE1aHp/Sc+llDdNEWtdGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40353348"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="40353348"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 03:18:05 -0700
X-CSE-ConnectionGUID: TqhSGXDcQz67JFSfHQ8t7Q==
X-CSE-MsgGUID: CAUsUVz8TZmzpZ0FmnJhzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="80302518"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 03:17:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 21 Oct 2024 13:17:55 +0300 (EEST)
To: Inochi Amaoto <inochiama@gmail.com>
cc: Chen Wang <unicorn_wang@outlook.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Inochi Amaoto <inochiama@outlook.com>, Yixun Lan <dlan@gentoo.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, 
    linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] serial: 8250_dw: Add Sophgo SG2044 quirk
In-Reply-To: <tm7jtf3swggiilznwo3xcqjlhd2a7cguwk3nay3bhmaxo23mf5@qw2fyjwapoxe>
Message-ID: <3dafd285-f56f-de2a-1544-b6ce092607b5@linux.intel.com>
References: <20241021072606.585878-1-inochiama@gmail.com> <20241021072606.585878-3-inochiama@gmail.com> <29d8e2a6-d0e7-0f74-1f5c-4f285ec1e9ee@linux.intel.com> <tm7jtf3swggiilznwo3xcqjlhd2a7cguwk3nay3bhmaxo23mf5@qw2fyjwapoxe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2055814311-1729505875=:1065"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_031805_750723_FBF5A2F9 
X-CRM114-Status: GOOD (  22.89  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2055814311-1729505875=:1065
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 21 Oct 2024, Inochi Amaoto wrote:

> On Mon, Oct 21, 2024 at 11:52:38AM +0300, Ilpo J=E4rvinen wrote:
> > On Mon, 21 Oct 2024, Inochi Amaoto wrote:
> >=20
> > > SG2044 relys on an internal divisor when calculating bitrate, which
> > > means a wrong clock for the most common bitrates. So add a quirk for
> > > this uart device to skip the set rate call and only relys on the
> > > internal UART divisor.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >=20
> > Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >=20
> > I wonder though does this mean the numbers userspace can read from kern=
el=20
> > are bogus and if something can be done about that?
> >=20
>=20
> I am not sure whether the clock rate can be read by the userspace.
> At least it report the right baud speed by using stty.

Okay, I meant baud & other settings. Thanks for checking it.

--=20
 i.

> Regards,
> Inochi
>=20
> >=20
> > > ---
> > >  drivers/tty/serial/8250/8250_dw.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8=
250/8250_dw.c
> > > index ab9e7f204260..51894c93c8a3 100644
> > > --- a/drivers/tty/serial/8250/8250_dw.c
> > > +++ b/drivers/tty/serial/8250/8250_dw.c
> > > @@ -750,7 +750,7 @@ static const struct dw8250_platform_data dw8250_r=
enesas_rzn1_data =3D {
> > >  =09.quirks =3D DW_UART_QUIRK_CPR_VALUE | DW_UART_QUIRK_IS_DMA_FC,
> > >  };
> > > =20
> > > -static const struct dw8250_platform_data dw8250_starfive_jh7100_data=
 =3D {
> > > +static const struct dw8250_platform_data dw8250_skip_set_rate_data =
=3D {
> > >  =09.usr_reg =3D DW_UART_USR,
> > >  =09.quirks =3D DW_UART_QUIRK_SKIP_SET_RATE,
> > >  };
> > > @@ -760,7 +760,8 @@ static const struct of_device_id dw8250_of_match[=
] =3D {
> > >  =09{ .compatible =3D "cavium,octeon-3860-uart", .data =3D &dw8250_oc=
teon_3860_data },
> > >  =09{ .compatible =3D "marvell,armada-38x-uart", .data =3D &dw8250_ar=
mada_38x_data },
> > >  =09{ .compatible =3D "renesas,rzn1-uart", .data =3D &dw8250_renesas_=
rzn1_data },
> > > -=09{ .compatible =3D "starfive,jh7100-uart", .data =3D &dw8250_starf=
ive_jh7100_data },
> > > +=09{ .compatible =3D "sophgo,sg2044-uart", .data =3D &dw8250_skip_se=
t_rate_data },
> > > +=09{ .compatible =3D "starfive,jh7100-uart", .data =3D &dw8250_skip_=
set_rate_data },
> > >  =09{ /* Sentinel */ }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, dw8250_of_match);
> > >=20
>=20
--8323328-2055814311-1729505875=:1065
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323328-2055814311-1729505875=:1065--

