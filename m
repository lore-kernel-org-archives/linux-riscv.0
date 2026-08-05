Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE38C55ABA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyZSN5ORGqXkkLgp3WWSmXyzTXq/D++551KjMo0Ihbw=; b=aoqTsdeY6kWVPsdFB9Wluurw7k
	wtiCfFH8FPWIU5l7tb4XOTXmnfgZiNiHQqFEb5HeSYyccWmlIutrAzpeHshZVJDPnNSZ5vHTTRa4y
	dYl9oepIaBCkLMLi+Y0c43hT9NvGcuI/j3+vyf1W6OIq2NDJrIelzz2rUe5Y9AR5UccqT5gjpLt42
	4ulGn6MhUj06xv12/snLZ6YuyOuwFjR2/jMj9fl6L0ybh5luZdOAttPuDveKzStpMzjLZ65u0fXK0
	uGqABjRw43be+ZbnsgXZ0KtByuqieuVCqYEBxfQAWvIKT9WJWgHNVSDeGY07YgsqsdGfB1M7vs8f4
	03d5VQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wreVF-00000004HWC-3YbV;
	Wed, 05 Aug 2026 16:30:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wreVE-00000004HVT-05bq
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 16:30:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81C5B435C9;
	Wed,  5 Aug 2026 16:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F246A1F00A3A;
	Wed,  5 Aug 2026 16:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785947398;
	bh=2SG2FZhElwQiDCbm8UKj/zw7brGqIk7YhSgEajStjIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=la2ITovwDNoQQ+lebVDhplFW1Suj90Ng1jwbBZ//p8+6pzNjsQ2D1w7dxZ6C8BK0i
	 Q8GKbR8aUVc/H1aRMp/5UULRVTJavsVQPTXh1E/2WfmXQjz2LSPiYuXROZKy55BIP9
	 8dHPmc6iqw18bzvvrM0aes4eaYDeAPBvrMBCd3jDNtulbCKgWFnkaq7kwqhDJZ9JUT
	 c/MMkeYVOPaoHEsprtbLEE6RynatFn3TF/jkd7X6BEjEw4IYYZLWtqC8rT0b2nq2N0
	 FYstJu3VFcTRWGPgGWiH//P+E76LP9spYZcKR8eVda1ji0qptPfRK/b4CgjO17dSyL
	 EGk9konvrxUog==
Date: Wed, 5 Aug 2026 17:29:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Marius Cristea <marius.cristea@microchip.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Kent Gustavsson <kent@minoris.se>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Janani Sunil <jan.sun97@gmail.com>, linux-spi@vger.kernel.org,
	Kent Gustavsson <nedo80@gmail.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 2/3] dt-bindings: iio: dac: Add AD5529R
Message-ID: <20260805-unrefined-knelt-ef167d1ee8fe@spud>
References: <20260805-ad5529r-driver-v8-0-b41781f5632a@analog.com>
 <20260805-ad5529r-driver-v8-2-b41781f5632a@analog.com>
MIME-Version: 1.0
In-Reply-To: <20260805-ad5529r-driver-v8-2-b41781f5632a@analog.com>
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
Content-Type: multipart/mixed; boundary="===============0856011039400690208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0856011039400690208==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AfwjZNltJEtqQdzn"
Content-Disposition: inline

--AfwjZNltJEtqQdzn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2026 at 09:17:42AM +0200, Janani Sunil wrote:
> Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
> buffered voltage output digital-to-analog converter (DAC) with an
> integrated precision reference.
>=20
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--AfwjZNltJEtqQdzn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCanNk/gAKCRB4tDGHoIJi
0n8CAP9UQoKgTQNzIthZtfOEAQcvA4iVbixd3DeiT1fmLwxHJgEAvjGN4gtWStZp
TLBwYCZ6rsPwFBFzKksT74SEX9jQNwI=
=eu2m
-----END PGP SIGNATURE-----

--AfwjZNltJEtqQdzn--


--===============0856011039400690208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0856011039400690208==--

