Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E87C282C5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIkbW3TKhf0svIg8jEbGW5qQrQzJiyY+3HOMeXLxF6k=; b=dfjZpp8doJr06PVRJaRhy402TO
	IMRxtRmVVPVIdN8Rgg8XTdiYP+pkIStfOozUb23FsVXHMylx+dm2wC2cBfPPpWxCDXjEYRm5brpdP
	W+KsppK8de2EcUZvgFZCk44gtkVHa79F/MNwhqg2z4f3GgpokVB153JrBaXvxnlzLcxqx+S6baOcY
	8tj/ywJ2EGcVQtcbIyEnQ3saRk5LzYSzcm/jJF2fnazNx/sFY6m//O08rafoWEEPDnm3PoVJvfk9g
	6hDjbq9xNQT280DDE7+kblZFWCc2kqn0rCQD3OvcIpAS48ScUOyS/yo+WUadwoeA/0bN7/DAQpkBp
	FkkzFHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0K9-0000000HRKt-0Rrg;
	Mon, 03 Mar 2025 07:34:49 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0Jz-0000000HRJg-3imI
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 07:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1zSn
	C+icBKdpSfr4vWUYgocPh0mXIzh1OrfARyFoLEA=; b=PRD1IODVjyetk9PkfKVn
	I3DTQxbokjFR9CNV1k1rDupMnM/JGjzUS18352ouDZ9JIWTKQt/YS4T02t8jn9cg
	of1ZWTrehF93/fBzYGVY8b67JkPzgi/3cKwKAH2XmuWxM4Z4JbLLPOy4LAC+qAK1
	hoFQz3PtzrjHi6RaRPJ0wNlVWaEL/01EqeTYiiGJ7S4zyJAsYAmDM8vKs+4wWMa8
	MqweoxK4irJeEsDphjlzn13XuWr2xkPnYZeGzj5kWZwzIgeOGRJp94FjvCA7hk5w
	k8t7MfIgf/MhF48fHW4wTkVN+LEdaXB32gpO6kRjOJ0txyqAkDJwvfgWJogrAy10
	kQ==
Received: (qmail 2114209 invoked from network); 3 Mar 2025 08:34:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Mar 2025 08:34:35 +0100
X-UD-Smtp-Session: l3s3148p1@EAweMGsvGLUgAwDPX0OvAM+yGPZJhv6R
Date: Mon, 3 Mar 2025 08:34:27 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yao Zi <ziyao@disroot.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH RESEND v5 2/2] i2c: spacemit: add support for SpacemiT K1
 SoC
Message-ID: <Z8Vbg1diEdmJLEs4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yao Zi <ziyao@disroot.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-2-21dfc7adfe37@gmail.com>
 <Z8VHaQsqAmhtQnbv@shikoro>
 <Z8VWH-ZXv1FWQU3u@pie>
MIME-Version: 1.0
In-Reply-To: <Z8VWH-ZXv1FWQU3u@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_233440_802658_B289E5E8 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3810378773956322889=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3810378773956322889==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0aDRa5CnHJqKCDfW"
Content-Disposition: inline


--0aDRa5CnHJqKCDfW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Reusing existing driver has been discussed earlier[1] and the answer was
> no. It really has been a long time.

Thanks for the link. I still agree to my opinion from back then :)


--0aDRa5CnHJqKCDfW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfFW4AACgkQFA3kzBSg
KbaxAQ//cfKlnoUMtjtK9YaJubYHDqIemUJxUQqf0FEn+JQSFM7DQ5ojyLmCm/yi
gQf/+MXQnWbeQdgCFLPM4QvvGBEK4xqI0o/eBajw09+jzSNBQWhjw6RbKX6O6haB
PmDvXbOz8MiBGHPLF67V5xOMDRu+IDpOVmCBcIf66hknOdWJ5bdj5frK+FwcT3IT
xOoxjrRRPR8GUu2Z+ZlAcINWiniH/+bIotIIfNE1AGPIWAxFeiolhTtjSw7crFaL
1GYmD9Dli15mtEZdpkIXuCRVbJPabHN8GDClwxuDZKz4fI7N80QK4p2efnN0GvQy
q29Tb2qB9fOne6fI1NVSgmLQd1+5G4KxLXk0z0LoSUZPI+fWrGnDudm/0WdlG5PL
Fr4/OrZMHr+0QBK/n+ORz8pkc5jekj5FHn3jc6cDeF0csHZ3qR/QntDm/UgRAvKw
RlGB8QOlBiNtCa70Mdm6ytd4olZbJm57lkylUY9jT9yLBrwfBQEjhJsaD+DIzDe4
HkUREpfEE6XJi2gFm9hAqcVNfC2nPR+Fn7BvVeQ4suKQoTAFspyJisBm8wE6+NYo
6F3JCP+ySrh4c+mWegDQBmJyd0I/6M4vMtIXG66q729nQ52DmQD9n3Xed8L0hkMQ
snVCNLPmAtBxBwB4yMAf5tR7eSVFdQZpzV3xxDJ/54Tet8oJWSU=
=5//C
-----END PGP SIGNATURE-----

--0aDRa5CnHJqKCDfW--


--===============3810378773956322889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3810378773956322889==--

