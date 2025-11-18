Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6017CF2561
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 23:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50ygw2tXNFGTDDEPYe3V9sspTtJo8uLKU/hnTxJCmyU=; b=VXZqd+luX53Wvl0oOTNAzUur44
	5PpMPAtRrYkj9GxQqeLn1ZxSRRfDinW66UC3S9m/FewUDzbICBhGThwLb53aOsa6yPM2YzD82l2pX
	1e6HCNCEKYHdRyTjxJnrfndbwDmQzMr+L8+6bAVBNP3o67iCP6ApTnOXAkT8aoAiZY1VOtak80g7O
	JLaBGPHO6y1jz98s1rENrm6+5zOMLh1+S9fxxhLFK4cjuUBKg+UR6Vj70WSl1+t2CAehpekgAXLTu
	kLZaBRGNp2PyAdPu+Zc2ksNsejh+OUIrtPSw+wjycDorlpucShQwD6nGYpr+d2+Z5N8EeYjn05qpC
	zTDbs5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUq5-00000001Dg6-2uLF;
	Tue, 18 Nov 2025 23:10:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLUq3-00000001Dfk-28ds
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 23:10:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 450DB4344C;
	Tue, 18 Nov 2025 23:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B013C19421;
	Tue, 18 Nov 2025 23:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763507415;
	bh=S1bbhLjv7zCClg2ZiZ70C9ZYUz8AkCF4ftWpXSr5hf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjNK6Q6EYb4hMgKsY3JtgukkutRM0mClJp/RSLDLLLb7VY3x3V/l8wms7CaTZQZde
	 ax/ifn9A7UCSpgdB4eJBbB+1fssGtpE+DuuZPxCj74Tt5g63/s7fIzUioJTokNaDIO
	 /Tq0xIfWtNlbeBuHITQGn0cJN7SMN4ygbMFE2QQSMWMHymavDaWcD6nzeqaG+z4mzC
	 317tHm5izCI206CRL6AH7ZquW7gzTvGmfnj/rZaNeNs6Nuk+Z4J18puHSWV1ptDt3P
	 LL4FA6o6AjXCwxdVqXP+wVuX41d2jG+nH2f+61yB1+f4crSaf74ALnCjlvwpOVSMvl
	 3xqSWb6PtgF7Q==
Date: Tue, 18 Nov 2025 23:10:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: E Shattow <e@freeshell.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/8] Add support for StarFive VisionFive 2 Lite board
Message-ID: <20251118-throwing-marina-14a87d65465a@spud>
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <CAJM55Z_rczBo4D3HsC90QW1=fp3NWgK-tsEo6LHTZNXEBHTDqA@mail.gmail.com>
 <ZQ2PR01MB13076544E2136E7E7C2EEDA1E6CD2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <CAJM55Z9KyNK1n4i9FxbLor4HTQKqK8WKA2svjPVvKXihw_E+sg@mail.gmail.com>
 <4a55301a-ef7e-4b47-8151-621cfba36ddd@freeshell.de>
 <CAJM55Z-bRdNmnRZ7wi3PMOkzGYrxQEGk+7F67Pdu4WXwKmTjCQ@mail.gmail.com>
 <ZQ2PR01MB13075CDDEFC2F03C837E1B31E6C92@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
 <b33919e9-e100-4629-92cb-d1ec3dd756a7@freeshell.de>
 <ZQ2PR01MB1307DADE17FFEFCE70C3F391E6D62@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ2PR01MB1307DADE17FFEFCE70C3F391E6D62@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_151019_591443_020AA3A3 
X-CRM114-Status: GOOD (  28.01  )
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
Content-Type: multipart/mixed; boundary="===============5593911614977254921=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5593911614977254921==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N4oiYSiiIoHTkUpd"
Content-Disposition: inline


--N4oiYSiiIoHTkUpd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 02:12:58AM +0000, Hal Feng wrote:
> > All,
> >=20
> > I repeat that the suggestion was made months ago (by Hal) to split out =
the
> > OPP tables per-board from the period of time when I was complaining abo=
ut
> > 1.5GHz JH-7110 operation pushing TDP into over-temperature thermal limit
> > on Milk-V Mars CM SoM.
> >=20
> > Whether or not JH7110S is a new compatible should follow precedence in
> > Linux development. JH-7110S is evidently the same tape-out as JH-7110 a=
nd
> > however you deal with that in Linux is the appropriate way to deal with=
 that
> > here. Selection of OPP table for correct operation will be determined by
> > bootloader, where, it is demonstrated by patch series sent to U-Boot
> > upstream to be selected ** per-board ** based on EEPROM content as if it
> > was any other JH-7110 board deciding dts based on EEPROM content. Given
> > that it is the same tape-out I do not find a valid justification for a =
new
> > compatible in the stack of adjacent software besides going along with s=
ome
> > kind of marketing-driven answer about whether or not this is a new SoC.
> >=20
> > What I care about now is that the VisionFive 2 Lite series is in good e=
nough
> > shape and there's a possibility to act on this months-old suggestion to=
 split out
> > the OPP tables which as we have confirmed the JH7110S is the same SoC as
> > JH7110 it makes a lot of sense to do.
> >=20
> > How is it supposed to work for binned silicon in Linux?
>=20
> Hi, Conor,  Emil,=20
>=20
> What do you think about this? Hope to hear from you.

Can someone just give me a yes/no question out of this thread? I'm not
really immediately sure what's being asked of me. What exactly do you
want to do with the opp-tables? "Split out" isn't super clear. Does that
mean into board files? I am guessing it does, since you're saying that a
particular board cannot support the 1.5 GHz mode. It's not unusual
though to use delete node for unsupported opp-table entries, could that
be done instead?

FWIW, this weekend is -rc7, so I won't be applying any new material
after that.


--N4oiYSiiIoHTkUpd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRz80AAKCRB4tDGHoIJi
0s+FAQDMoM392mKet43CbIZa5XkVf0Nhavze4vBfQXc9CBkXkQEA7L47T/hTFt2g
lgvgkf1AKUnNOrw/Pcnu6msIEVx0fAI=
=RX+k
-----END PGP SIGNATURE-----

--N4oiYSiiIoHTkUpd--


--===============5593911614977254921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5593911614977254921==--

