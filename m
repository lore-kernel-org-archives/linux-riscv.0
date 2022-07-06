Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DD5C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZRAsjliFE7LjJNrOIwY1lvnXwPDJAU3PTIbGBYqxxI=; b=ZSxUIW4TjC9TzqSIypoShQ5fFt
	x/Jzoskb7QsBRlLBELxvg754yUppTdsuH054CqD0UlZdLCsl76wnbLBa2nP1rWEo0Iq9+ohlPIpTt
	xSoQVQN5JLyXDAzJK68BJAvaUzMvp6YijyLnLOqgyPlTqlJ6hpwlLI6P6mrbfo40UkwzhZgIvkha6
	CAA0VKk3O4uYKw9jxv8N6amynGCh6IBDNmMvVzCsXBms+OmEO67UIzCzz0myxpttPFShflQnrCrE1
	mzn4Fn89y0MQ7a0z52uzrMDaJBCHUNICnkO1bZbaOk8OFNIQYX8rDd2jdXNHqXU5ppdudcNmzzo/z
	xx4ujsBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o92QA-008fDG-6k; Wed, 06 Jul 2022 10:38:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o92L3-008ZFH-MT
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 10:33:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0A40CB81B31;
	Wed,  6 Jul 2022 10:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FD6C3411C;
	Wed,  6 Jul 2022 10:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657103574;
	bh=RC0sAMRYDT1U59SwYYLhHEAvAo1xmi55rfLw6xp/hmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgfrUtZk32S41NHaKv+WfBqTPZlu2oza7bjcv+s3TEpmawoudj5uBSZZKfSBG8efZ
	 urt/MVxszctw0h5NiIiu1BmNNw+3UKQpA3PVHDfUwDRQym2H3hEPz/mpKUtFzEgLHY
	 T6hM/X1CSsJ0iKeI1FPHIuYpnW8vRWiIGBndHjqX1XZzyOzpjsScCKtUJABqNvD6U6
	 wLmZQgnxxSXhfvNIazf4WU26qZQHVsHhsC+8k8nIn1rf+eS1zgnxbyL8GCBFoMrGbQ
	 fPF3PJq2ceV6v1Pv7dBADOWvrqv6uy2WAd+gF9jd220BsReHN+RCGq840wxP0M8F7k
	 e6/A70Iyzuapg==
Date: Wed, 6 Jul 2022 12:32:48 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Conor.Dooley@microchip.com
Cc: linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Daire.McNamara@microchip.com
Subject: Re: [PATCH v6 1/2] i2c: add support for microchip fpga i2c
 controllers
Message-ID: <YsVk0Gg1x7juHcZU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Conor.Dooley@microchip.com,
	linux-i2c@vger.kernel.org, ben.dooks@codethink.co.uk,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Daire.McNamara@microchip.com
References: <20220621074238.957177-1-conor.dooley@microchip.com>
 <YsU3eLA3PrceFS65@shikoro>
 <ac070176-93b9-3bc4-5589-ec57d4d38af4@microchip.com>
MIME-Version: 1.0
In-Reply-To: <ac070176-93b9-3bc4-5589-ec57d4d38af4@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_033257_927193_975D8919 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Type: multipart/mixed; boundary="===============6159993370572220796=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6159993370572220796==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqWsQi0x7XBD8P6y"
Content-Disposition: inline


--pqWsQi0x7XBD8P6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I'd prefer the latter. Being called "core" is unfortunate and I
> did think about that. i2c-microchip-corei2c would have been my
> first choice but I thought the double usage of i2c would've been
> disapproved of haha

:) Well, double "i2c" is not exactly pretty but since it is the name of
that IP core...

> >> +		if (idev->msg_len <=3D 0)
> >> +			finished =3D true;
> >=20
> > How can it happen that len is < 0? Wouldn't that be an error case?

Is it to be on the safe side?

> > Have you testes SMBUS_QUICK as well?
>=20
> Not specifically SMBUS_QUICK, but I did test with hardware
> that uses "zero-length" messages.

Good!

> Thanks for the review :)

You are welcome.


--pqWsQi0x7XBD8P6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLFZMwACgkQFA3kzBSg
KbaFgw/8D7lDj4vUyKcwMGPx6bwOENbvQni8vymREU+9j3FAApPuYtvbkg3ulzqO
Vr31LTbwZB6zYrnafuKPofGuJa9L3D7BkoovGGq8F/029h55FNksZm7jssnQkdgF
ianlDedgOsyaLBvsGyxhpOpbJ9sG4DiGHvrlnOzy+L9wJ/dKfPnGKaZHh5BR0ZN6
5WvSxdxTFFkLiNrOadLO9Wb8r0tTkw2gsrr5SeR8wbKEQJZlIlSy30vnqbD7VZ4i
TOIisHPJpjtHIlOQ+ijbGpDvIZ7ZhNm2rwH24Sze0N9wUr4V2p3eQxeG4FfPf9IR
HfFHJ2F/ZBcPPTHfkPqHvbLQIwMBvGcJ916SX6hc+ag0hrA488dDv84Qi8YaEZlR
ddJqEF0XYN+uKG3tt8qpO5pAMw8PTJOKCT7RM6hM4SRE3GNF2FZkTZvzQfkzG75e
d4N5wMW+yp76cVwTHx29aH9BL46rrQXgJLRBSPcfSPqoNWHBS7sC7X582UWs7R+t
S3TDm2eYA6Y+t5a500BhqHcgCtuA/PZK0QeMkcDT4ljRpQVo17B5QdNlwAPY/SCW
opdR3rlRHEG077SSLP6Ns3tkm2yl6uZrg2lJJ/hNOvBpsfEEXa9FecrjZtq8E63E
8fNxY0M7OdQ3Yvd2+FNLcLuHioEtsz/h2sJKz82nZjcRhhshFfA=
=uow+
-----END PGP SIGNATURE-----

--pqWsQi0x7XBD8P6y--


--===============6159993370572220796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6159993370572220796==--

