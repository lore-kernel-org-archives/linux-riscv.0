Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8DBC5AC82
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9vhuU7bLxWvR7ohR7AmLIsScf971CjVxGBMV7ZfP6M=; b=NfG1K70Pw5iC6To6jjcs9upzb0
	Vh1ynS9xWmReo+TWKYF/7e/EUqXE8AJeAG1sOcdsvGWap+WOxSDwxnNRTitk58pbQX4e/H37VPvuo
	XWCMawnAb1D6QNluB54xuL+6zaygQ7rT88migB3G3iN6FqUXEQ9LZb8SKQtCCxCo58B8eVyAQ1kJi
	HQwkFI+F7fFvrtb8jAgxMMwQAzsGTfLF1wZkeCst2w0fHg8woYOFKnVs25Tc/zoCpA1nR4ikiZkj4
	x0sALXYFpwPQIhLrNFyb66BCgunZtegTJG5muZiMyCQx+W+3FeypqHoMJ3NUaulW7+4irhJwtAzgk
	GiPnFqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLGP-0000000BH71-0slD;
	Mon, 10 Aug 2026 08:21:41 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLGK-0000000BH5q-3pWm
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:21:39 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786350014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mwb4T+70sQLw0zGlvvSzZhnupF748FA5zZmXS7ztNcU=;
	b=T1m71LCQgmbZJiuEVkMw3skXMvxXtbkBcBWHDF1MUhxXqfVkveKgF4RKsQurR/ajD9cSz+
	nt2SRN+B/OqyK3bqask8irYPL2hMhkMw2kK5kvpA5oKWqltev1QkSfQlgdfIdQywSybPu4
	URq2rMsh0uqV2GPSRAgbujtJBBBMkKU=
Date: Mon, 10 Aug 2026 16:20:05 +0800
Message-Id: <DKL487DPH7KA.3GNYMRSBR1JY3@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
In-Reply-To: <20260805134119-GKJ77474@kernel.org>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
	<20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
	<20260805134119-GKJ77474@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_012137_096596_FD30C887 
X-CRM114-Status: UNSURE (   8.73  )
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
Content-Type: multipart/mixed; boundary="===============3504022226615597586=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3504022226615597586==
Content-Type: multipart/signed;
 boundary=d199f377d7c17763f6ce1e395f30f63cbfb46a7e8fee7409363fcd76361f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--d199f377d7c17763f6ce1e395f30f63cbfb46a7e8fee7409363fcd76361f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> > +&pinctrl {
> > +	i2c6-1-cfg {
> I'd prefer to use the reference, keep it short & close to where it's used
>
>  &i2c6_1_cfg
>
> > +		i2c6-1-pins {
> > +			power-source =3D <3300>;
> > +		};
> > +	};
> > +};
> > +
> > +&i2c6 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&i2c6_1_cfg>;
> > +	status =3D "okay";
> > +
> > +	temperature-sensor@4c {
> > +		compatible =3D "sensylink,ctf2301";
> > +		reg =3D <0x4c>;
> > +	};
> > +};

My intention here was to keep all board-specific pin configuration
overrides under a single &pinctrl block, so that they can be found and
maintained in one place. Using a separate top-level reference for each pin
group would tend to scatter those overrides throughout the board DTS as
more groups are customized. The &pinctrl block is also placed immediately
before the &i2c6 consumer.

Would keeping the current structure be acceptable for that reason? If you
still prefer the direct reference, I will change it to &i2c6_1_cfg in the
next revision.

                                            - Troy

--d199f377d7c17763f6ce1e395f30f63cbfb46a7e8fee7409363fcd76361f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanmJtSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8CFgEAiJSPpno04iz/
cz/ScQC1rhjqbfbKZVHCF6VJ27Lw8fwA/jzuR+UYxLorJLN/rAcuXQS8gF7HrQ5p
lCjF5MwhGh8J
=4F8l
-----END PGP SIGNATURE-----

--d199f377d7c17763f6ce1e395f30f63cbfb46a7e8fee7409363fcd76361f--


--===============3504022226615597586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3504022226615597586==--

