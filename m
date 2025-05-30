Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E16FC5AD49
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMhETnuTEzChVCC6MeuQhwn6clXbCzoD+Ec7G1N5bxU=; b=ef+dEUjCSgDBy6LW6ij09NN4gJ
	oQyp89orGH7KYTNFfHx32A6bB5xIwy1qQtCCsA1u2sjvc/Rn+KSKgviiTorWMIqSAzLINphoiQYkD
	HZbGRwdctA+kvBFGe8Hnr4Nq4IKgJGBR+4yxxE8cSCMeS4tT5a5FFvt02z3Y1nt7efFIl+JuIlTLr
	K2xDBkqMZYTm5LaXpXRqR3s+biW+qevl32K3UiNt5iJP73DOIEt0i2xljHo1F2ZXI94Ug9nQIJliQ
	8LjSIx6aevlk+mE8Jm55GX/smGrHJ0Iwmt0mrJMFWWHNneWjTLWzdL6R3rdS9QY3r/aT7Izh95gD0
	9Yc711bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2qt-00000001E9Z-3WLu;
	Fri, 30 May 2025 16:45:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2b2-00000001BOn-04LH
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 16:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D062E6115E;
	Fri, 30 May 2025 16:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEA3C4CEE9;
	Fri, 30 May 2025 16:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748622518;
	bh=3w11Gx6y9v0+7Z7wkaCwsdezYsyPjPgQjYYgblMoswE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FmA2yna1gR8Ew0K1+LahkMj78ZXO3zYVUdv4Y/Vm1mMEd/+BRkqVRN/xryXr5nqRe
	 rDnWQsNAlhCgvjhlMMvMLw0ZDX57QmctMORg0m07U2dsros+TLfg51ouUaHQ2v9Fbh
	 Zk+Oeip7grTwJrJ8zTBJOSykBcVzXM+t0vkmr0+DKfKlgZ1pH0EFIC1yJfn4/18TaS
	 7vh4+r9XyTcZmL4jfdb7ufjIJG04wV29wVc3seG0Kb3N4Ea/0KgKO8edTBCkTtHUG7
	 cDJMlrifDQRPajUQyW042VM7mD2BPlOm4mQmO3a/zct9suwp1KtfdLEklQ1TRDRzzk
	 Iw01thRvz8raQ==
Date: Fri, 30 May 2025 17:28:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v4 08/23] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
Message-ID: <20250530-stark-maximum-2306978237db@spud>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-9-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20250525084710.1665648-9-apatel@ventanamicro.com>
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============8691500557095229238=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8691500557095229238==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OK/BrqYcriOFqq3E"
Content-Disposition: inline


--OK/BrqYcriOFqq3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 25, 2025 at 02:16:55PM +0530, Anup Patel wrote:
> +  riscv,sbi-mpxy-channel-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The SBI MPXY channel id to be used for providing RPMI access to
> +      the supervisor software.

Sorry for the delay in reviewing this series, wanted to talk to some
folks at work before doing so. Overall these bindings all look pretty
good to me. I don't think the description on this property here is
particularly great, I didn't follow what it was meant to be used for
immediately. But I don't have anything meaningfully better to
suggest nor do I think that anyone actually writing the dts for a
platform using this binding will struggle to understand it.

--OK/BrqYcriOFqq3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDncrwAKCRB4tDGHoIJi
0tEBAP4gJSJ/F4Ip4dRY+DKhJbIbOyFcYw/OQ8JRh5hAWfoGHwEAkbFUp8dZ9yHN
D6aqOU4gwU5hRMBlh1tZavRk5xBgpAw=
=RBEX
-----END PGP SIGNATURE-----

--OK/BrqYcriOFqq3E--


--===============8691500557095229238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8691500557095229238==--

