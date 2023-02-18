Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D13C636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Feb 2023 11:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8iZwyhrbT3ZyeMqjuhVM5wy5lUf4kvmipWZF7dJeJQ=; b=lZNID965cNAQEMi/CVqdfHyfWk
	sAkyFnSS/NMaGz5T8hwNyN5GsfcHadIbjUHg3X134IKXKMVmIrJjgtLg3xKQs3QDHAWu+uJyf+dC5
	mavkvc5rt8pUiufB+8rWeQizgUYoajP0+ydJas0HrYxsRKr6fyBuZE44BoDAFJGYErFpUXX0yO+fe
	iHBbCrgDUBXk6Cir1DN44KSpqr3bi6CE71t+1DY9B956ZQ93Hxg67aev5VR3O9PKOmv0RSREmcwjJ
	ZlJ2KrEJErVtdY6vMhUSONNB8FYrth19GTxkjkUB9yFdGX+2YZBO3YsHhVZ0sls5pAgS2mtWaHsgn
	/AjoT1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLDU-00GqSI-DO; Sat, 18 Feb 2023 11:17:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTLDS-00GqRb-40
	for linux-riscv@lists.infradead.org; Sat, 18 Feb 2023 11:17:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4919F60B5C;
	Sat, 18 Feb 2023 11:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC75C433EF;
	Sat, 18 Feb 2023 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676719033;
	bh=MBpW+wS6kJjM9nw/RX4T/6lVEQz7JAtQyjKM0xZ3B+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbCF8rxLVhB+zqGRt9Y85P0PTJ2aOqfqKaNuekrrAE8pdZY1DEN6tfgBbSozPG08i
	 uLE/Z4IlY8Xm89vjqDdVvdAeigbQGvCKq1bzTbxy+vQ1KvJ4cDbUY843nJd9yOKBLa
	 aCAMgekEnGtWT+s5V2eR0/VUKcnRNfJxs905kkDVTJwvncsCu10mxEBRa8puviTSrT
	 +XvUrr7SCjxlsPvL2iYkfGqbNq8TULVBOlD+1ZjWvLoyTBuCndbogYtwXKRU2n2qXM
	 0eJqB9JeLzVMGD104WB0SvLA8b7i65q2NU5CR5rXD13YUWMfqnb7LgeHb9T8Wq/n0W
	 /ZbIfRiDiOnbw==
Date: Sat, 18 Feb 2023 11:17:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Message-ID: <Y/CztNs6laTzttrI@spud>
References: <Y6tSWB2+98a8k9Qw@spud>
 <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com>
 <Y+5z8skN2DuvxDEL@spud>
 <68e61f28-daec-ce72-726a-1fffe8e94829@starfivetech.com>
 <Y+8x/KSujhgNLAd6@wendy>
 <d3b06d0b-ff17-ebab-bae5-e1ec836fe667@starfivetech.com>
 <Y++B43uCnPQlRYFi@wendy>
 <dcba75b5-7b62-35aa-6836-5d5edd785002@linaro.org>
 <Y++q9ln8P3XegqfN@spud>
 <41e4f293-99eb-f157-b4a9-3d00b15f4652@linaro.org>
MIME-Version: 1.0
In-Reply-To: <41e4f293-99eb-f157-b4a9-3d00b15f4652@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_031718_276640_74E9A7B0 
X-CRM114-Status: GOOD (  30.16  )
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
Content-Type: multipart/mixed; boundary="===============6370132090052832442=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6370132090052832442==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PuWXwRc8It3YJ8xy"
Content-Disposition: inline


--PuWXwRc8It3YJ8xy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Krzysztof,

On Sat, Feb 18, 2023 at 11:20:30AM +0100, Krzysztof Kozlowski wrote:
> On 17/02/2023 17:27, Conor Dooley wrote:
> > On Fri, Feb 17, 2023 at 04:47:48PM +0100, Krzysztof Kozlowski wrote:
> >> On 17/02/2023 14:32, Conor Dooley wrote:
> >>>>>> Yes, it is.
> >>>>>
> >>>>> Which would then make GMAC1 RGMII RX optional, rather than required?
> >>>>
> >>>> If thinking in this way, I must say yes, it is optional. But actually
> >>>> GMAC1 RGMII RX feeds gmac1_rx by default.=20
> >>>> For a mux, it usually works if you populate only one input to it.
> >>>> Does it mean all the other inputs are optional? And how can we define
> >>>> which input is required?
> >>>
> >>> I'm not sure, that is a question for Krzysztof and/or Rob.
> >>
> >> That's a long thread, please summarize what you ask. Otherwise I have =
no
> >> clue what is the question.
> >=20
> > Sorry. I tried to preserve the context of the conversation the last time
> > I cropped it so that things would be contained on one email.
> >=20
> > For me at least, I am wondering how you convey that out of a list of
> > clock inputs (for example a, b, c, d) that two of the clocks are inputs
> > to a mux and it is only required to provide one of the two (say b & c).

You skipped this part which was what I was trying to ask you about.
Do you know how to convey this situation, or is it even possible to
express those rules?

> >> Does the mux works correctly if clock input is not connected? I mean,
> >> are you now talking about real hardware or some simplification from SW
> >> point of view?
> >=20
> > I'm coming at this from an angle of "is a StarFive customer going to sh=
ow
> > up with a devicetree containing dummy fixed-clocks to satisfy dtbs_check
> > because they opted to only populate one input to the mux".
> > I don't really care about implications for the driver, just about
> > whether the hardware allows for inputs to the mux to be left
> > un-populated.
>=20
> Whether hardware allows - not a question to me.

> BTW, this is rather question coming from me...

I don't understand what you mean by this, sorry.

Thanks,
Conor.


--PuWXwRc8It3YJ8xy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/CztAAKCRB4tDGHoIJi
0jg/AP4wInRGlkOUh1Al9iKc09rdNcx7Y9+jOgeM4wKt33DlgQEA+4tSZw88zO0/
a6YhAFGSsTVeN3Rx2Dki8r642zgv0wk=
=XpKK
-----END PGP SIGNATURE-----

--PuWXwRc8It3YJ8xy--


--===============6370132090052832442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6370132090052832442==--

