Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9ECCD128A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lk2Ivtb2aF9GD8bYNUbECEd1/W23+4Opp1aTthFkp2Q=; b=v9/NEqxzoV8eIisUKU6x+X222n
	qckaD2SPzgEQyY4GEF4JHzpPe9XKj82EAbzB1fcU6vvCsYGnAWReWvyu2PTPY9D/Xq7rQSRTYpucH
	MPzad1stus5BR4r/I2qv1d5ugVt0wrIiBqrKH8PfKrwA7hTD7HpIXkDYxxnaQVR7ZvmlOpVcvRr/2
	CGKHGEqgioq4pNklKGqEgG2oy9UF3tu0lpaGSDG9QYr6QBaPcbO+WVNOChRWkb6Qdmp1w2rUzvf3u
	iQlsPs7GjtI20jkIZFKpv0uxlvhQXXmK3dnWsbenV5XgAGxpT7acaszNpofOCUTs5QdknVXX3ZCYL
	zToKNECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtky1-0000000F1Du-0eSX;
	Mon, 08 Apr 2024 09:07:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkxy-0000000F1DW-2Zfa
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 09:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1583A60ED4;
	Mon,  8 Apr 2024 09:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFE1C433C7;
	Mon,  8 Apr 2024 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712567221;
	bh=akQc+U5hAZwoLZiwB/CcAXYMfBwyVM+4OQW51zKEobo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8sH5GE+JsA1VWNrJMzYWSLpVutU1kiQTnwhqQ4Hy+1zE3J4QWlo0i5FgfCDgrzX8
	 eY9ROiD7UO9GQiQ9TCHGXw8R2cUkT8qEaO9ZjnIVDS9ZJK/y4n1gQ9+vn0EegYLMoC
	 tc6Eup9+UFqvbF32/eR/nXfHBcsdedvaY0k13/5BZtJ0+Lu2CDY8slo7VeriKhF2SE
	 H3ShBmFOgG6HPXpOsiGtCwnV+XfD534/sqNojdcUcJQlZJXBAmruX7fRb/phMyWIv4
	 /EpUfqSL2hNN9/+HXH3/afVp9dRycz++zI3hbXjj94C1+qymhRfEXJCXqAJ/ALfLZJ
	 orKjEBzubdnMg==
Date: Mon, 8 Apr 2024 10:06:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	ajones@ventanamicro.com, alex@ghiti.fr, alistair.francis@wdc.com,
	Albert Ou <aou@eecs.berkeley.edu>, bjorn@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	cooper.qu@linux.alibaba.com, dbarboza@ventanamicro.com,
	Qingfang Deng <dqfext@gmail.com>, eric.huang@linux.alibaba.com,
	heiko@sntech.de, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, philipp.tomsich@vrull.eu,
	samuel.holland@sifive.com, zhiwei_liu@linux.alibaba.com,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 2/2] riscv: T-Head: Test availability bit before
 enabling MAE errata
Message-ID: <20240408-semisweet-class-39239c279adc@spud>
References: <20240407213236.2121592-3-christoph.muellner@vrull.eu>
 <tencent_CF232CDF85208DF6BFA3076E73CC4E087306@qq.com>
 <CAEg0e7h0F_LaeMoS6Co1UjgLM6ML8SXtTfHW5+OQS6yedjdZPQ@mail.gmail.com>
 <tencent_459BC09115173E0624A4A0F19D2F43704F05@qq.com>
 <CAEg0e7jW=Sfc3tcc0eJwbTx=vb0HM49ZWpda972E-t=Fj1PG+g@mail.gmail.com>
 <20240408-dispersal-foster-49c4e269216e@spud>
 <tencent_D6D1043732E63644A4B1838F4210499BCF05@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_D6D1043732E63644A4B1838F4210499BCF05@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_020702_762275_FD70800F 
X-CRM114-Status: GOOD (  17.46  )
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
Content-Type: multipart/mixed; boundary="===============0076440974824808657=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0076440974824808657==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jkvao9Yo3z8s7tYF"
Content-Disposition: inline


--Jkvao9Yo3z8s7tYF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2024 at 04:21:24PM +0800, Yangyu Chen wrote:
>=20
> So the solution might be to have some property like `xtheadmae` and test
> th.sxstatus whether it has MAEE bit set when we have this in ISA string in
> the DT rather than have MAE enabled for sure if `xtheadmae` exists as
> discussed before. This will require changing the DT.

Yeah, I think I don't mind what you propose, as long as we define in the
binding that "xtheadmae" means the hardware supports it ***AND*** the bit
in the CSR. That's easier on firmware and taps into the existing
support in the kernel. I think it's more consistent with how we handle
the standard extensions to do it that way than to assume "xtheadmae"
being present means that it is enabled.

> However, since the
> C908, the first core released by T-Head that supports MAE with non-zero
> arch_id and imp_id hasn't merged to mainline yet. It's time to add this
> dt-binding and some code to probe it. I can have it tested on K230
> recently. Whatever, this patch can go first.

I don't think adding something like this should block merging the
initial c908 support though, can easily be follow-up work. I'll apply
the k230 stuff Wednesday if nothing has come in on it by then.

Cheers,
Conor.

--Jkvao9Yo3z8s7tYF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhOzrwAKCRB4tDGHoIJi
0oB+AQCPgg96W0VvHOZrVatTzvKo8Ks06TKzM+xecKegEiQXkQD/YVqMa3ZG0Q+h
USez/WU6aoulSTP1+1Aj3u0FXiWhUwM=
=2F4L
-----END PGP SIGNATURE-----

--Jkvao9Yo3z8s7tYF--


--===============0076440974824808657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0076440974824808657==--

