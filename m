Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14F3C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 08:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8fduWbP7n/uaHM8IxAzcXZVVXraZNL2tGkQhXzev94=; b=IDVkpibkzNZUUWuJiHiDNUp6In
	TEIZW42pEKstGmDGqJxHYkcXU9dr8bEYH3ZdLrkLeIGdCGP7RcKuZDPBA0zBjPgoyv5dBJccC2NU6
	3DcxCisGtBXNHHN80vJPjBvHCyK6VkGJYCKFQWKpoSMUsGSsYsfXCqezXhR4TFGbXilCMbLA1sbYY
	Xs4ts1peARHOAzddZeVELhQitSK5Vi01bp+Y6xZmS6TXSQgViMEDz1crhnSXOydiL8al6TkiEdqaP
	48HelotyMXpTQpjLYFogx04wWsPwDYnDAyC7U8YxsIXz+AYXsM5l+QZHM06V7FQSQB0+IbGoWND9Z
	Xd2ub9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3a2-00HQys-1j; Wed, 18 Jan 2023 08:13:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3Zz-00HQyO-IZ
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 08:13:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C61061704;
	Wed, 18 Jan 2023 08:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BA3C433F0;
	Wed, 18 Jan 2023 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674029634;
	bh=SYTtZk6ZSgVx/WFOeJ0MBaOx5z4XpMo/GMukzlopQ7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZ+gqP708YJcXRbNEKgEOJgh4FsiLreIMg4DIMMZcpCcXbV9MfVlW4027owp82HOb
	 NtCFsnWqhVM5aJjqL47BJuPrd0dhRrYyVp2QFCPpdXqTO2yxwRqn78EB/T9pEIg1Mf
	 EmkmS0dRr6bmxEQXgj42wtc7it3nMRorG92rH0MgD6lzskvR4btzfkSBxdR34hLwWq
	 fS5QELQ98/PPMP0xynZvsvpQEW9oYyX1LTKbmyL4IHCoeZ8ZGq61Uv39SRUFNeCCAg
	 Z+Nk/JLiDL+T0zstLgv9N45jbSeHtLnGA1fe9aUG6mox1Y16YjMZ1N3bQEmFqy3ODc
	 G4wVd1BD+v/lg==
Date: Wed, 18 Jan 2023 08:13:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>, nylon7717@gmail.com,
	zong.li@sifive.com, greentime.hu@sifive.com,
	vincent.chen@sifive.com, Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 0/2] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <Y8eqPdifnWbMQI/T@spud>
References: <20230113083115.2590-1-nylon.chen@sifive.com>
 <Y8GjySjm9OjoZvCF@spud>
 <95F1EAA0-D8D6-4F8A-8049-5E7BFDE4C06C@jrtc27.com>
 <Y8K1a+xs6tbo7kV4@spud>
 <CAHh=Yk9jUFiwzw+RQDoyb7xDoHGXFzNprdXn8szmMZb5FB4jLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHh=Yk9jUFiwzw+RQDoyb7xDoHGXFzNprdXn8szmMZb5FB4jLw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_001355_706349_B37A1EE7 
X-CRM114-Status: GOOD (  37.52  )
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
Content-Type: multipart/mixed; boundary="===============0209885998882963917=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0209885998882963917==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KB0jfWFHyOhAHNFP"
Content-Disposition: inline


--KB0jfWFHyOhAHNFP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Nylon,

On Wed, Jan 18, 2023 at 10:32:25AM +0800, Nylon Chen wrote:
> Conor Dooley <conor@kernel.org> =E6=96=BC 2023=E5=B9=B41=E6=9C=8814=E6=97=
=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8810:00=E5=AF=AB=E9=81=93=EF=BC=9A
> > On Fri, Jan 13, 2023 at 07:24:56PM +0000, Jessica Clarke wrote:
> > > On 13 Jan 2023, at 18:32, Conor Dooley <conor@kernel.org> wrote:

> > > > Please delete link 2, convert the other two to standard Link: tags =
and
> > > > put this information in the dts patch. Possibly into the PWM patch =
too,
> > > > depending on what the PWM maintainers think.
> > > > This info should be in the commit history IMO and the commit messag=
e for
> > > > the dts patch says what's obvious from the diff without any explana=
tion
> > > > as to why.
> > > >
> > > > I did a bit of looking around on lore, to see if I could figure out
> > > > why it was done like this in the first place, and I found:
> > > > https://lore.kernel.org/linux-pwm/CAJ2_jOG2M03aLBgUOgGjWH9CUxq2aTG9=
7eSX70=3DUaSbGCMMF_g@mail.gmail.com/
> > >
> > > That DTS documentation makes no sense to me, why does what the LED is
> > > wired to matter?
> >
> > ```
> >       active-low:
> >         description:
> >           For PWMs where the LED is wired to supply rather than ground.
> > ```
> >
> > > Whether you have your transistor next to ground or
> > > next to Vdd doesn=E2=80=99t matter, what matters is whether the trans=
istor is
> > > on or off. Maybe what they mean is whether the *PWM's output* / *the
> > > transistor's input* is pulled to ground or Vdd? In which case the
> > > property would indeed not apply here.
> > >
> > > Unless that=E2=80=99s written assuming the LED is wired directly to t=
he PWM, in
> > > which case it would make sense, but that=E2=80=99s a very narrow-mind=
ed view of
> > > what the PWM output is (directly) driving.
> >
> > I would suspect that it was written with that assumption.
> > Probably was the case on the specific board this property was originally
> > added for.

> As you can see, there is also the same description in U-Boot.
>=20
> But in U-Boot, the DTS of Unmatched/Unleashed has not been added active-l=
ow.
>=20
> This is because active-high should be correct if we look at the circuit d=
iagram.

I am loathe to speak for Jess, but I don't think either of us are
disagreeing with your patches. I was just trying to understand why it was
wrong in the first place to see if it was intentionally inverted, or if
there was something that could be improve to stop it happening again.
Apologies if that got lost in translation.

> > Maybe it'd be a bit more foolproof written as "For LEDs that are
> > illuminated while the PWM output is low. For example, where an LED is
> > wired between supply and the PWM output."?

Thanks,
Conor.


--KB0jfWFHyOhAHNFP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8eqPQAKCRB4tDGHoIJi
0l1NAP4hoQtZQkitKUCK7iMO1hSdPTd/IA6bhrI7bWiQNAnlKQD+MVDCawwKnyHs
GVs7HhE/g6s3aK6sBM0Gi3kXEppZCwE=
=zYGs
-----END PGP SIGNATURE-----

--KB0jfWFHyOhAHNFP--


--===============0209885998882963917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0209885998882963917==--

