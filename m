Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ED5EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OL+XJYw9yBlYoX35m20WEJ8WlOIYWkgVBrpA4CJqn0=; b=YGF3xoim4Xk9DIV8vX01P8qK1r
	DF8yb0pp9W9u9OCX/9U8LSg/jzSGokPE69GtSIYW2WBIco24G7sRnTnDKrE0zfqFwztIUgupFDQdn
	7Zy2aJ7jiMhdZd+pN8GsZYwLHir0p09/wP1rulV/ZMxWLp5yqfJoSj7UD7Be4INyEO62jiqjWyQNB
	pKKlvkKwjq5LMgh1KVK9M7V6sY3KmuAGSY6pZ5RUKemik8dU1Ok9tRsp6U1bLDolPmaAoZ9trHBh0
	tXu1fUe1KxCA9EucaFKLXGMe1INwoNiwxvZpuS0NH91aPmoqBCtlBA0bBAj49GKmPx6yTB2qEmVLv
	WxSSmejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAZJl-003xE2-2I;
	Sat, 17 Jun 2023 17:02:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAZJj-003xDb-0d
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 17:02:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A015E60202;
	Sat, 17 Jun 2023 17:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16437C433C8;
	Sat, 17 Jun 2023 17:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687021346;
	bh=HhqB2RY9efd76qcAsgi7cGT467uqDZhSpGD92blYzms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gnhCUxwmbUvEb5WjMewm6hENoEPWOkrThinQgyx6WgkE7gO2Oc9m6MXp68Uv/yf3y
	 ebzdkFJJzoefvBQIwQeE++ju45UMw0orrhUQ4UCFSkyn5OKX5O8InmJD6FFzWb1aCl
	 l4EAp69JVm/472UQ9PFd04A23FvmzH+GMD9gq1YQ7mLyCXkUeX1uoPsJilC7Bu5DoQ
	 UeKQH9pnVgLlpJP+7HZq/XSz8CL+TIR0+QpvlDHqL/nUFOYEfi5qRayFbxZ46SWzzm
	 WoMMRwBMQcGMdtd8kIX7tDlheVeYjTX6N+Wjat9jdAC+uD9es2SUktJVsvXmb+TW5k
	 byBJaRCIWtV/Q==
Date: Sat, 17 Jun 2023 18:02:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <20230617-preppy-eggbeater-a256e963bcc6@spud>
References: <20230617161529.2092-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230617161529.2092-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_100227_299069_3376E75B 
X-CRM114-Status: GOOD (  16.25  )
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
Content-Type: multipart/mixed; boundary="===============7956978784886806850=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7956978784886806850==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fxrxQ84gH98yJtRL"
Content-Disposition: inline


--fxrxQ84gH98yJtRL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Sun, Jun 18, 2023 at 12:15:21AM +0800, Jisheng Zhang wrote:
> Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
> module which is powered by T-HEAD's TH1520 SoC. Add minimal device
> tree files for the core module and the development board.
>=20
> Support basic uart/gpio/dmac drivers, so supports booting to a basic
> shell.
>=20
> NOTE: the thead cpu reset dt-binding and DT node are removed in v3. This
> makes secondary CPUs unable to be online.

The kernel doesn't do anything with that node though, so if you were to
load a fitImage in U-Boot containing this DT, having booted with
whatever the factory provided OpenSBI has, that limitation doesn't
apply, right?

> However, minimal th1520
> support is better than nothing. And the community has been working on
> and will work on the cpu reset dt-binding, for example, Conor, Guo and
> Jessica are discussing about it, I have seen valuable comments and
> inputs from them. I believe we can add back cpu reset in next
> development window.

I'll go take a look through this, if it's good I'll apply it and send it
on to Arnd for 6.5? Although I assume it is fine since v2 was nearly
fine!

Cheers,
Conor.

--fxrxQ84gH98yJtRL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZI3nHAAKCRB4tDGHoIJi
0l7tAP9lUn7WHWRx5cRx/2EpyeAdyw2Ru72Z/Uik6knltXelDAD/SHiezqyBzt8i
gtY6/8gwAP8+m8RQ75a2w8agc/eqQA8=
=HOax
-----END PGP SIGNATURE-----

--fxrxQ84gH98yJtRL--


--===============7956978784886806850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7956978784886806850==--

