Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2ADC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 18:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9/X7sET9LPcXP5ypS9cZBelghMbN6CDz76/YBLI1Ls=; b=p6uVe5HUXpGBDy1XSjkREtZHL6
	z5lqEVw+co1ibN4fG3FLOaPO+dx+lNHJZBEAKmLHszacsvsGiH1HJk7nmug9szRhyZFmTfuZyXYWq
	LIOeF464JsaosihycqQ4gbHl35tO/16wk/7Cg19r77q8wPbot2oElbqSyrzqCWWLtApbjkeiTr1Gm
	KY55h11Ic6CT/VxNekc0hjqE/jnoJLttTlRwN4obat0fEHWC6ZbegNcszNqSLmeyUsWxPIBMyWsn+
	bzNKmC5hgjOWoegHMMrsankKyUMf1C89uKVbN5lvxzxFNhsOgRkcVj/iTGMU2TggoIU7G9097Zt8b
	f8JyrYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzmJ-00000002KKT-2mR3;
	Wed, 19 Jun 2024 18:11:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJzmE-00000002KJA-3tSn;
	Wed, 19 Jun 2024 18:11:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 306A761F48;
	Wed, 19 Jun 2024 18:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF04C2BBFC;
	Wed, 19 Jun 2024 18:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718820681;
	bh=eM8ZHNqn3zhJka/utQcQ6YZwZ1lRkZvcoh73c33nV2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VubqIGNKPYexo5EaGDBeMUN4CkvxOkC+s04Qt73Usm5DYSq63iX1xyNuKpMpjDQ2L
	 hPSwvzqKYSi53jf/HZ6AxEuVA5ECX9DChgbV8B0EXCBGvENYuyptuDwlA3qKRMDAud
	 oIEG/qzT29LhIjfxmoEoiXHIlOQa/OJo2ma/576AMUAlO0Iij13wjqS7SGH6wZL9it
	 ooJQAspgbYNYHdYpE33I57PqYaC1UjV/EZmiyFjf3sWQ+epyqwL2NwZOaM6HnLho4c
	 5fDyBfkqEbpPL+Z1TcjKwFJLWDyZjAU9b4t6jO5pTW+jVrQJ1x63N4UyOLAvuTSlWg
	 Ge2emRBkit5sA==
Date: Wed, 19 Jun 2024 19:11:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	apatel@ventanamicro.com, alex@ghiti.fr, ajones@ventanamicro.com,
	greentime.hu@sifive.com, vincent.chen@sifive.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240619-shabby-smother-c482e771632a@spud>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
 <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAMWQL2gQpHPD=bPenjD+=NP47k8n26+6KP05zogxUtsD6zY6GQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMWQL2gQpHPD=bPenjD+=NP47k8n26+6KP05zogxUtsD6zY6GQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_111123_161148_5A5DC8F3 
X-CRM114-Status: GOOD (  32.35  )
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
Content-Type: multipart/mixed; boundary="===============5761399220911815717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5761399220911815717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5sQpHeJmYMJW0CIa"
Content-Disposition: inline


--5sQpHeJmYMJW0CIa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Anup, Drew, Alex,

On Tue, Jun 18, 2024 at 06:38:13PM +0800, Yong-Xuan Wang wrote:
> On Thu, Jun 6, 2024 at 12:55=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Wed, Jun 05, 2024 at 08:15:08PM +0800, Yong-Xuan Wang wrote:
> > > Add entries for the Svade and Svadu extensions to the riscv,isa-exten=
sions
> > > property.
> > >
> > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > ---
> > >  .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++++=
++
> > >  1 file changed, 30 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index 468c646247aa..1e30988826b9 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -153,6 +153,36 @@ properties:
> > >              ratified at commit 3f9ed34 ("Add ability to manually tri=
gger
> > >              workflow. (#2)") of riscv-time-compare.
> > >
> > > +        - const: svade
> > > +          description: |
> > > +            The standard Svade supervisor-level extension for raisin=
g page-fault
> > > +            exceptions when PTE A/D bits need be set as ratified in =
the 20240213
> > > +            version of the privileged ISA specification.
> > > +
> > > +            Both Svade and Svadu extensions control the hardware beh=
avior when
> > > +            the PTE A/D bits need to be set. The default behavior fo=
r the four
> > > +            possible combinations of these extensions in the device =
tree are:
> > > +            1. Neither svade nor svadu in DT: default to svade.
> >
> > I think this needs to be expanded on, as to why nothing means svade.
> >
> > > +            2. Only svade in DT: use svade.
> >
> > That's a statement of the obvious, right?
> >
> > > +            3. Only svadu in DT: use svadu.
> >
> > This is not relevant for Svade.
> >
> > > +            4. Both svade and svadu in DT: default to svade (Linux c=
an switch to
> > > +               svadu once the SBI FWFT extension is available).
> >
> > "The privilege level to which this devicetree has been provided can swi=
tch to
> > Svadu if the SBI FWFT extension is available".
> >
> > > +        - const: svadu
> > > +          description: |
> > > +            The standard Svadu supervisor-level extension for hardwa=
re updating
> > > +            of PTE A/D bits as ratified at commit c1abccf ("Merge pu=
ll request
> > > +            #25 from ved-rivos/ratified") of riscv-svadu.
> > > +
> > > +            Both Svade and Svadu extensions control the hardware beh=
avior when
> > > +            the PTE A/D bits need to be set. The default behavior fo=
r the four
> > > +            possible combinations of these extensions in the device =
tree are:
> >
> > @Anup/Drew/Alex, are we missing some wording in here about it only being
> > valid to have Svadu in isolation if the provider of the devicetree has
> > actually turned on Svadu? The binding says "the default behaviour", but
> > it is not the "default" behaviour, the behaviour is a must AFAICT. If
> > you set Svadu in isolation, you /must/ have turned it on. If you set
> > Svadu and Svade, you must have Svadu turned off?
> >
> > > +            1. Neither svade nor svadu in DT: default to svade.
> > > +            2. Only svade in DT: use svade.
> >
> > These two are not relevant to Svadu, I'd leave them out.
> >
> > > +            3. Only svadu in DT: use svadu.
> >
> > Again, statement of the obvious?
> >
> > > +            4. Both svade and svadu in DT: default to svade (Linux c=
an switch to
> > > +               svadu once the SBI FWFT extension is available).
> >
> > Same here as in the Svade entry.

> I will update the description. Thank you!

Before you do, I'd love if Anup, Drew or Alex could comment on my
question about default behaviours. They're the ones with Strong Opinions
here about how the SBI implementation should behave, and I want to make
sure it is correctly documented.

Thanks,
Conor.


--5sQpHeJmYMJW0CIa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMfRAAKCRB4tDGHoIJi
0mxsAP9/HYbRT+IODW/JeWgB3oihF9tatXMsLPSv5zh01Chn2AD+MWUlW7+bWwkL
TcfQ9tn4kkqaW1w3XdBd3pZdG+9wBgQ=
=sFa3
-----END PGP SIGNATURE-----

--5sQpHeJmYMJW0CIa--


--===============5761399220911815717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5761399220911815717==--

