Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF5EC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 21:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+gHYUGi8rob70JyJJ+YnlUH90RKI5PZ5XfSqw93dAI=; b=kgdtfZZOln+oAO5vCKBmO7ktz6
	ROVqlD9N796RRjwUHcDAdPdjyLQ+tTjcnccjJD9OG0/NsB8NreO5p+7Uv0ri2P099rjX7Uga//8Gz
	bma91Jm+cVGDyCcs5tc3l6LJh/D6bnBj+6BSoSbrkVqa7GQxK6EatLTYz/J2AO0XcmMk6hb3dIb6w
	XajS4JekO689UuInCrixp/p8XJSg7CBKIjoSbioVTwt6Kb4CO8N5OQqoLPkNRbmwdGSqzn+GcbDNc
	knGtkqALS1TwsBX86htBktN/KeEKrw8Z3ZmNgmQSu1OJlQYjUUl/cA4HO5YzTxeNQWtcN78UkZFOa
	Csj59xiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Ilc-000ERL-0K;
	Thu, 25 May 2023 21:45:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2IlX-000EQV-2d
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 21:45:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 63CB260AC9;
	Thu, 25 May 2023 21:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF540C433EF;
	Thu, 25 May 2023 21:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685051098;
	bh=1d20bjdX5HUdVvZRPf4VGSbqIqinzRsHvwcKXpOUIoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oAcQUkkSOjsmVnkbAo4rOPwsRIs+qW+MUrnXDJbyzI1Pifb67gOi0pDVzmXxEiaRF
	 w26LgUXziy2EcR4xt0dZ2jqo1wPKGCGD+Mx1CZ6QVeuLCKqxiQtZuI6Axo+9pID+RU
	 HGVtbDxkNNoSH8t1E++SMFq7Wv63fT9+ocO6MJED+HjPs67A78PRR+dcVRDiXtxznK
	 NcUe1wFCrzkRoDF8rqA7NodXIuuB/RfyhdBGqzPowYgn4GrAOVKig2tVjFUSro4jkN
	 SzJfi051sYZyOoljcfNKrmt5kgZX8y/wTvzJ4XhNmTQnocUfzg8D7/3Glsu+Of4IiS
	 /AlNRIjLaIeyQ==
Date: Thu, 25 May 2023 22:44:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 10/11] riscv: dts: starfive: jh7110: Add DVP and HDMI
 TX pixel external clocks
Message-ID: <20230525-upscale-siberian-54c5f003334c@spud>
References: <20230518101234.143748-1-xingyu.wu@starfivetech.com>
 <20230518101234.143748-11-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230518101234.143748-11-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_144459_898578_DACF5331 
X-CRM114-Status: GOOD (  10.88  )
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
Content-Type: multipart/mixed; boundary="===============4311839663499651982=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4311839663499651982==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="14g6l7gbkD9WOY4x"
Content-Disposition: inline


--14g6l7gbkD9WOY4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 06:12:33PM +0800, Xingyu Wu wrote:
> Add DVP and HDMI TX pixel external fixed clocks and the rates are
> 74.25MHz and 297MHz.
>=20
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--14g6l7gbkD9WOY4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG/W1QAKCRB4tDGHoIJi
0tacAQDzU7wda2zCGFCxnqT+sHimB4/P36sZ0pPmFeBEUk3dIAD/UZFrrFZD0rlX
S99BGmiDwdA9CkSxOXkuNlTIIz+rdAE=
=wubc
-----END PGP SIGNATURE-----

--14g6l7gbkD9WOY4x--


--===============4311839663499651982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4311839663499651982==--

