Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF2FC4167B
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Dec 2023 11:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jpxq6uZrpYL7P29LwEqGdMlrQwNvX3Ctg91S7MTm+aE=; b=ISpmshJk2BylOOQNBLtUIP0faO
	q3pRb0Zy1PeVFQW6AaRkHtZ4WS8Sbuv2mWA+BvMeQ+oGuzQqALdua/YTaiMWlzcVjcx5BPLMr23E8
	hxABdyvybG5eFSnrqcwKmetm+oEOiWKiu47B3RNBSqDyiUNFHZaPrkWiCAkHDnrLTqVaEYS1bBTyu
	saP7QwdMbTmOapO22OviiiS8ykG+5u0adwb9dhdcNHOD4IqKDVzxPT5FuKdSWQmiGV9bQ10KD9lpf
	i6BTVR0tTmJI35Rmakd9seFsqUeHlvD2YboXTuiEXrl3IMxcf/0vejEZKnfOO9ZVSYqRrQoxj3BsY
	mz22/9JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9l0h-00GkBk-2f;
	Sun, 03 Dec 2023 11:51:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9l0e-00Gk8k-17
	for linux-riscv@lists.infradead.org;
	Sun, 03 Dec 2023 11:51:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B9457B80B55;
	Sun,  3 Dec 2023 11:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5714C433CD;
	Sun,  3 Dec 2023 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701604298;
	bh=j+MWyvG7dYrNIh8G6k9NK5UM+dH6jsdU5B4UsxoT+ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZBv5tVLF2NI8QfgBY/8Ji3ma0UtpBOAg4ZA0uEFcL8QLOHa6Vj3kH2Wz0SpY2P+Q
	 JY/emv7qYlZbHwn0xIDwBObeEF1jos2kj8dM3or2URoeh+07CQD2lya7bZrzIDu72W
	 HQUoQtCDK1g1880UKXKabHh6v2u1dS68efrHT3s2OWuEe8eL67uAiGpg/2YrbsZG7c
	 1bHbDSrY0Xu/IA36Y1MMH7mVCpfSxR/a410cHV+fsK08eWTvbReMdXuYJBw5TyOE8A
	 B7+m+/hpKcq+tCtWTTboUkLg6stP7KBkMOLz5yBqz1kVbI4VwuavmOphozufGN1gmd
	 61v8Xby1WsQkQ==
Date: Sun, 3 Dec 2023 11:51:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/7] Add Huashan Pi board support
Message-ID: <20231203-parabola-deploy-105940119261@spud>
References: <20231201-strung-mandarin-110a322468c9@wendy>
 <IA1PR20MB49539E82E5C0B5CBFD889F39BB81A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231201-nutshell-uptake-48161193c6e7@spud>
 <MA0P287MB033290A6C8B15202E31E43CCFE80A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB033290A6C8B15202E31E43CCFE80A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_035140_670227_49992FCF 
X-CRM114-Status: GOOD (  18.56  )
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
Content-Type: multipart/mixed; boundary="===============6136838240779845471=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6136838240779845471==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FS9zK2k9fGsYJ11f"
Content-Disposition: inline


--FS9zK2k9fGsYJ11f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 09:11:38AM +0800, Chen Wang wrote:
> As far as I know, sophgo's SoC product names all start with "sg", while
> products starting with "cv" come from CVITEK (another chip company). CVIT=
EK
> was acquired by sophgo a year ago, so now many SOC product names that
> originally started with "cv" are being repackaged and changed to start wi=
th
> "sg".
>=20
> For the cv1800b adopted by Duo, Sophgo has made it clear that it will not
> change its codename.
>=20
> But I heard that for other products, such as the cv1812h used by Huashanp=
i,
> sophgo may change their names in the future, but sophgo has not officially
> confirmed it yet. Looks like sophgo themselves are still in the process of
> digesting cv's products, ;)
>=20
> Since we have just started to support cv1812h and have not done much work
> yet, I suggest not to merge this patch into the mainline, and wait until
> there is clear news before doing this to avoid introducing unnecessary
> modifications later.

If there are people who have the boards, I'd be inclined to make the
mainline kernel usable for them. Doing some renames or adding
compatibles down the road, if the SoC is actually rebranded, is not a big
deal. I'll leave it up to you guys as to what to do - it's only -rc4
today, so there's no impending doom.

Cheers,
Conor.

--FS9zK2k9fGsYJ11f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxrxAAKCRB4tDGHoIJi
0t0zAP49o75PXGwjkXR55YAqI5SOHIrBtYKQz46TH7DfrJMqaQD/UUMH5SNrat4p
8sFmOMNmT3Ueh4ph6xACjsgSGLQQRQI=
=irXv
-----END PGP SIGNATURE-----

--FS9zK2k9fGsYJ11f--


--===============6136838240779845471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6136838240779845471==--

