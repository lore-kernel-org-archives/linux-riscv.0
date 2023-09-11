Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BA3EE7FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xnRN4BEPw+gL/X8Rz4As+CpXy8jmInhJoOZAxTjFaY=; b=xdLU70nH66LooGOmjx5KTdqkUZ
	YhGxEd3IEL5iw8ISPImJNEAtb1O7FBOD8/hCi9DkhL4twBet+hDeAnAYKFbzN82dXkDafLo1zZb4K
	FyXXnDCQZ6YnhA6YyDotEq6HpJGdJLZG+ZKaRu+Nu9d1OZRKYs+TbP2PUYE2HRCPExD+UDcbrHzIX
	KHneuzC4ic0lElhu/P4YUNJOFeUich3KpJ24v0KVZUNLdBk9XPX09rUsgj/gqOaqSRil1gDY1m8CU
	P24WM9bFkorqEqkgPqrkMB94kwwrgA8Vbuhb/cG98aAzHTKag6iKSg0sIpniGq9P6I/up4iDvOaOM
	9Mm9OLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjYW-000yxo-1d;
	Mon, 11 Sep 2023 16:14:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjYT-000yxV-1X
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 16:14:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97F7661234;
	Mon, 11 Sep 2023 16:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939CCC433C7;
	Mon, 11 Sep 2023 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694448868;
	bh=lE4TUKpHsfE3kl2liyLgZhjxv/jCQAFAHS5mAxa9Jio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gRRONGH1gay49bPcuwG9oModMIeyhqPitP5tKtepnu+JNihIfre6G4mq3muSRgAT5
	 ztXNlEp6cTei0aSI4yyAANEbo5UDSEhxjtAUXYsskp86tJNViykzrlNlnkJhNs9Tvb
	 FBIr/xw68CKFK/7o/XJt5LS0V9FRx9oS1FQJZPzENlJCONJrCv/suxFzJtfdF3ET2B
	 wIt10bC626FlyUqagfq9y8bvo3A7RJ2v5CofcN2UfnD33gd09vF+C9V8kGxSGCCucu
	 AcI8vumcVeNXNZzynqBNRyStwUGhuLs7OM1EJYu+QrqiIExSI1Vz/R1TWlEl51P5rR
	 evZ1N4yKQ3hJA==
Date: Mon, 11 Sep 2023 17:14:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: William Qiu <william.qiu@starfivetech.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-mmc@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
Message-ID: <20230911-implosive-shrill-506d18d9bde2@spud>
References: <20230830031846.127957-2-william.qiu@starfivetech.com>
 <20230830-commence-trickery-40eaa193cb15@wendy>
 <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org>
 <20230830-procedure-frostbite-56c751f7c276@wendy>
 <efab6f52-4d7f-ea3c-0fc3-4e3ad03c14c7@starfivetech.com>
 <20230901-remold-sublease-a1ddb1fc6348@spud>
 <9EF26965-10E5-4BCA-AC5E-93C5AA55A0DF@jrtc27.com>
 <20230901-affected-wanting-ab517791a870@spud>
 <dd63bb4f-a59b-0323-08fb-03f8cc048b6e@starfivetech.com>
 <CAJM55Z8XowmB-Hfzr+hBtWu+SGL2v7jya6Nx5_rATf8=5qA4Fg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z8XowmB-Hfzr+hBtWu+SGL2v7jya6Nx5_rATf8=5qA4Fg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_091429_619464_CEB0F144 
X-CRM114-Status: GOOD (  42.68  )
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
Content-Type: multipart/mixed; boundary="===============2659137559534975175=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2659137559534975175==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oTmTZUPS0C6vLYk7"
Content-Disposition: inline


--oTmTZUPS0C6vLYk7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2023 at 03:32:36PM +0200, Emil Renner Berthing wrote:
> On Fri, 8 Sept 2023 at 12:03, William Qiu <william.qiu@starfivetech.com> =
wrote:
> > On 2023/9/2 1:43, Conor Dooley wrote:
> > > On Fri, Sep 01, 2023 at 06:20:38PM +0100, Jessica Clarke wrote:
> > >> On 1 Sep 2023, at 16:42, Conor Dooley <conor@kernel.org> wrote:
> > >> >
> > >> > On Fri, Sep 01, 2023 at 10:33:13AM +0800, William Qiu wrote:
> > >> >>
> > >> >>
> > >> >> On 2023/8/30 16:34, Conor Dooley wrote:
> > >> >>> On Wed, Aug 30, 2023 at 09:29:20AM +0200, Krzysztof Kozlowski wr=
ote:
> > >> >>>> On 30/08/2023 08:50, Conor Dooley wrote:
> > >> >>>>> On Wed, Aug 30, 2023 at 11:18:44AM +0800, William Qiu wrote:
> > >> >>>>>> Due to the change of tuning implementation, it's no longer ne=
cessary to
> > >> >>>>>> use the "starfive,sysreg" property in dts, so drop the releva=
nt
> > >> >>>>>> description in dt-bindings here.
> > >> >>>>>
> > >> >>>>> How does changing your software implantation invalidate a desc=
ription of
> > >> >>>>> the hardware?
> > >> >>>>>
> > >> >>>>
> > >> >>>> Which is kind of proof that this syscon was just to substitute
> > >> >>>> incomplete hardware description (e.g. missing clocks and phys).=
 We
> > >> >>>> should have rejected it. Just like we should reject them in the=
 future.
> > >> >>>
> > >> >>> :s I dunno what to do with this... I'm inclined to say not to re=
move it
> > >> >>> from the binding or dts at all & only change the software.
> > >> >>>
> > >> >>>> There are just few cases where syscon is reasonable. All others=
 is just
> > >> >>>> laziness. It's not only starfivetech, of course. Several other
> > >> >>>> contributors do the same.
> > >> >>>
> > >> >>> I'm not sure if laziness is fair, lack of understanding is usual=
ly more
> > >> >>> likely.
> > >> >>
> > >> >> For this, I tend to keep it in binding, but remove it from requir=
ed. Because
> > >> >> we only modify the tuning implementation, it doesn't mean that th=
is property
> > >> >> need to be removed, it's just no longer be the required one.
> > >> >
> > >> > Please only remove it from required if the current driver doesn't =
break
> > >> > if the regmap is removed.
> > >>
> > >> Either way please make sure the documentation clearly states =E2=80=
=9Cnever use
> > >> this, if you=E2=80=99re using it you=E2=80=99re doing it wrong, this=
 only exists
> > >> because it was wrongly used in the past=E2=80=9D. Otherwise people w=
riting
> > >> drivers for other OSes will probably use it too thinking they need t=
o.
> > >
> > > Maybe we should just delete it if the impact is going to be negligibl=
e,
> > > sounds like you're not using it in FreeBSD, which was part of what I =
was
> > > worried about. Guess it depends on what Emil & the distro heads think.
> > Hi Conor,
> >
> > After discussing it with our colleagues, we decided that deleting it wa=
s the best
> > course of action. Since there will no longer be a related implementatio=
n of
> > "starfive,sysreg" in future drivers, even if the dt-binding is describe=
d, it will
> > be "never use", so I think it should be deleted.
> >
> > What do you think?
>=20
> The device tree should be a description of the hardware and there
> really is a 'u0_sdio_data_strobe_phase_ctrl' field in the sysreg
> registers[1] on the JH7110 that seems to do _something_ related to the
> sdio interface. So I don't think the fact that the Linux driver no
> longer uses it is a good reason to remove it, but if there are some
> other pragmatic reasons to do so then I'm fine with it. Removing it
> from the list of required properties should be fine though.

SGTM. Can you update the patch to do that please William?

Thanks,
Conor.

--oTmTZUPS0C6vLYk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZP883gAKCRB4tDGHoIJi
0iUbAQCcScPVjZ1Kbsf7RH2A+sX+vGqYaNxM2OgYs4g0lowZegEA8ZTFom4Gt2p3
Ov4GOL7DPFANOjsSHPDE7w4pEWoR2Aw=
=xCY5
-----END PGP SIGNATURE-----

--oTmTZUPS0C6vLYk7--


--===============2659137559534975175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2659137559534975175==--

