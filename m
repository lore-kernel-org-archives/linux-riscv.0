Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F7DCE7CE7
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRJRNJfDf945AaNBQIyypXUp4m6I1qim3y1EEcP6cMo=; b=PGRG8Y8Irb+KhCeCjAxeDB+m2W
	P6woRzhYGZlzsrFZ4DNFJjvoiMf3G7HS0ZLBfNLlJILS7eC/YixjeJds8ch8yckdA8DWDA8D8qr1A
	vRvETBCkdKy1vXGuDHu8oVr9RcgUixZ/f2cDza2VFH8AemZMglcfqRIC05uMkGC7aUoMDHyUeLxpi
	JfuZwQ3onyk2BxprFHPC+ndfsloSBAV9dac9dNtc/x12YtCBFKG3IGjhy0Uj2jw2lU8HDGwz0tzgK
	VKDVv0zVh/uDzTaftaXyyzJTaauGUhX5GhRaKwnXhhuxBHKOHn7E6wFOidKS2Z+UooroPrzab72/a
	UUhHqCxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svYd0-000000028VE-4A8I;
	Tue, 01 Oct 2024 08:53:07 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svYb2-000000028J5-35sn
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 08:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vRtU
	e79gslQ6cPccbZ9Ag935/rQxMyhWN9cftpvLzgE=; b=OR3KXQkEafYTN8dtTzhw
	eo4IVQbtLztezlazL+Fbpf2B55sRe9eJNlTKzkRoL8S5J1qlctseUvZic10t7KHp
	QstYrQWVN3NVpx76UuQ5EZ1es6sRH/LMFI72nrkV4RTdQl6Z7bYE8dQXZjs8PgP6
	jKruKRXoDdNHB4+GZl2V8wc6VImg4WUhQvzgOQQ7j5moabpVFBSKgbCrDxfeONU6
	NdVKOHY7avxhoGaubYf863atQ2EYKRiZ57NMkUMLHnQTDWz3iFamGQYinTNURDqQ
	rLt8rQGIhPydxyU7MxGamDhhuoG1RLCUcv0OAmBny28qCMI7uflA93I0UOOBxVnr
	VQ==
Received: (qmail 2454730 invoked from network); 1 Oct 2024 10:50:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Oct 2024 10:50:57 +0200
X-UD-Smtp-Session: l3s3148p1@Sqp7a2YjTq4ujnuV
Date: Tue, 1 Oct 2024 10:50:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-core: actually use repeated sends
Message-ID: <Zvu38H2Y-pRryFFQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240930-uneasy-dorsal-1acda9227b0d@spud>
MIME-Version: 1.0
In-Reply-To: <20240930-uneasy-dorsal-1acda9227b0d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_015105_698937_C2104BC4 
X-CRM114-Status: GOOD (  14.27  )
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
Content-Type: multipart/mixed; boundary="===============0091954998172286211=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0091954998172286211==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="43zjrHNx5Tjwq6OP"
Content-Disposition: inline


--43zjrHNx5Tjwq6OP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Conor,

> At present, where repeated sends are intended to be used, the
> i2c-microchip-core driver sends a stop followed by a start. Lots of i2c

Oh, this is wrong. Was this just overlooked or was maybe older hardware
not able to generated correct repeated-starts?

> devices must not malfunction in the face of this behaviour, because the
> driver has operated like this for years! Try to keep track of whether or
> not a repeated send is required, and suppress sending a stop in these
> cases.

? I don't get that argument. If the driver is expected to do a repeated
start, it should do a repeated start. If it didn't, it was a bug and you
were lucky that the targets could handle this. Because most controllers
can do repeated starts correctly, we can also argue that this works for
most targets for years. In the unlikely event that a target fails after
converting this driver to proper repeated starts, the target is buggy
and needs fixing. It would not work with the majority of other
controllers this way.

I didn't look at the code but reading "keeping track whether rep start
is required" looks wrong from a high level perspective. The driver
should do repeated start when it should do repeated start.

All the best,

   Wolfram


--43zjrHNx5Tjwq6OP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb7t/AACgkQFA3kzBSg
KbbIhA//Ttljy7Uxhv02Sw0YdoqPUtZsFIR23KbjziR44RebbxLRbKt5L+IjUEe+
Lz+UPgZE+IP7P1FzZacMYA/fMsosbS931LuTn9gWg0m7mIX5NDxfqTXH+SQvzxp3
RkIiu59iswjYd6t0EXGnajGIxlf9c+Gclw8BMHZ34pDRZ5wtysySDWFhNa6E5Y5q
rQtcLqUrG1VvzUy/sAh1elOVWGnpvDhnvBEWrnThyOshc09hkmFSTJo3IR5DRkic
M7ewHZHZ28hpVipEfvC4BuLBUIE2jtvY4jvkcWKY+arkMOsq9AC6kETJv95RDLMW
OrsgAxUUzPGPSL8BuEgS4e1Pltj1rWQyKR8808Lv+mP/W/MIZb4WJ+DU0TFuPgCz
siP/DvATuqj+e5wnan6qwxHhk01Mm2jR8B65AiZHUeWZO9OphsbfJZsLr3htg+S5
kiyrggrnxezIj9rZI1HpJ0MeYGEyRHnnO3oNL1yLoa2O1zNW74oUtBSPprnDjAaD
lrJeDIf0tQ3demUg20KDQI6S4Y5Ua2mfptOnWSe5gXFVWbteYB9Foe387/mDtRYi
lT2tElTdDJmTVEasg5t3cyuqpy6lUC0i+NBFhKkkvsLXHAIyZ9Uhfpzh+9eo7fDq
Lj1I0/4a4UGEgPCZdgZNgVlTAZGMDoBVDEIfqt1uDRy5e6JKg7Y=
=ORiE
-----END PGP SIGNATURE-----

--43zjrHNx5Tjwq6OP--


--===============0091954998172286211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0091954998172286211==--

