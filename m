Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B81C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ayoEp/ZRdNu7I8BEktGM57FNqmWdtmBvN5sQ3y+aIs=; b=WaAoTos1Xy0ojK3SwTDnMn8LiR
	FxPvdJrWo0Qy1Wtqo9pG7StQoXDUI4x1oezE19razk9Lbw2D3APmHL4F5BmA0cLsXbCC1mYuXACNr
	vwDUwKt95CRqVfqb9PCE/iRfScxn+ZrTzxb3X+zfJCxQAb4CNeb4o0xmOV2xla5TL4hGE4biQ947K
	x1fWmCnXBFgAV8Zm62hiJeFYLBEOiogWb0XJ+NxAkv+NIYlK1A2s81ULrk/stJuuxJV4IsOXxqOMM
	z2m2CZhSuPbCQyMygL37MKOJRuZOVNUILUAISrjaskPVBso5vBIoxuYuePkxPayJjz16nIpklhyMy
	FJGlssbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo2I-002A2u-2Q;
	Tue, 01 Aug 2023 11:59:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQo25-0029k1-0u
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 11:59:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C429C61576;
	Tue,  1 Aug 2023 11:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB31EC433C8;
	Tue,  1 Aug 2023 11:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690891160;
	bh=6AHpkW+1Vl/pIzsm+KzIZOLB+nxZCt4ZJydu7QiZDjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvKF6P7N0m3zB0nnePyxPnqDHStcVAcph1SwLx0+grePPtgnTZkfrH+Fplm7rCBKp
	 h3n0nQ/UsSvLX8Plk1e3UVqTo8ZwD+N+zyEellIcLUP9sD8c8+x6xNeZhcXv62Tu7Q
	 KSMbKT2G3GaS+fnhS5MrjdxtvBM4fyxEZQuJNPoR2prZrNgo0D2Y/WtFiOQP0q0oby
	 AOUofNC93tdVQ4juvzFjTgPfP6pDdobkv8ule29qz6CY95lirubFicboI7WUE7QY6Q
	 D8FR7qkTgvU+bULj8KDUb/Y7T0Qrl+01Zo/MrswIU5jeQ4pzh7JkVzjcMnmWlDSxoE
	 vg8kR/Vw1bvOg==
Date: Tue, 1 Aug 2023 13:59:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, 
	Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
	Chris Morgan <macromorgan@hotmail.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
	Shengyang Chen <shengyang.chen@starfivetech.com>, Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 v1 7/7] drm/vs: Add hdmi
Message-ID: <gkavtc4qkwwgpre5to4sjvd3e6s3a2mo6qoychxid6buiu2c2v@xx47v5erxsvn>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-8-keith.zhao@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230801101030.2040-8-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_045921_377406_847859B9 
X-CRM114-Status: GOOD (  11.28  )
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
Content-Type: multipart/mixed; boundary="===============1058707090906345031=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1058707090906345031==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xwzbtwdfjoxzmbg"
Content-Disposition: inline


--3xwzbtwdfjoxzmbg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 01, 2023 at 06:10:30PM +0800, Keith Zhao wrote:
> add hdmi driver as encoder and connect
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>

You've ignored most of the comments I made on the previous version, so
please go back to that mail and fix everything you've ignored.

https://lore.kernel.org/dri-devel/ayygsdwzogu4ygkobs7zkroxicxtixtp5bxayn5vz=
k4qlkwt6x@yo5s2qwt77mo/

Maxime

--3xwzbtwdfjoxzmbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMjzlQAKCRDj7w1vZxhR
xW+vAP9NEuZQurYGyBDJt6E4rkErtbkDJOx6fO0bKpk2+IjzDwD/eSkZ7tV0bwjK
r1MKgVz2slSLf3AktsOtIlI162uxrQ4=
=9TvY
-----END PGP SIGNATURE-----

--3xwzbtwdfjoxzmbg--


--===============1058707090906345031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1058707090906345031==--

