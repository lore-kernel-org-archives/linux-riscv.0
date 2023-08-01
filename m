Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75419C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22kSuhfEP06zdHsCnxt0wOZjaYgIKGW+vTF3wUEvj8Y=; b=c6SP8EkQcvhjiioGZNXhwUw7WR
	Tp9HOVgZBVlGoDFwiXhKLVhnZ9BPwIMGQEKSQAfJHiNQt7jyk1PZA2RT5hayKgd2hx3i+EsJqlc/Q
	/b4uNCuejKiZRjs0Z3BYS5ypYmCMDrsFsYJE0ooNwRs50wtEvfXEuZCvJ/ik8y2m32Jcl2hwpqlpQ
	LoE/ayTLo6HRAnS1XnJ6Fw2nza/VTDCsfgm7zau5/iegckPwt0jyBj642+C70TXPjrGUxv4O1Rdz9
	b5IrcppB2u99tAvueqsb2/LoISsLT8JAo7RAKKioDnOhUAywuEEX7UCCO8xWiU5PT3UAfjHdu2uN1
	wylAWDJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpjl-002UIz-1v;
	Tue, 01 Aug 2023 13:48:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpjj-002UIA-2N
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 13:48:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 56B9A615AB;
	Tue,  1 Aug 2023 13:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CBCC433C7;
	Tue,  1 Aug 2023 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690897709;
	bh=yBCVhMlvIlShUF7vexVldIJJJDKdGoCO+kY/QWgk+y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEOsTFaPuSkOXKXis4cSvPwJH4oJS/olSV3RAfl00cz/5RO/7LBToy5zGVrRhlAoJ
	 cPuFKLfu5NIYRCpeX30pbTJOBHfhmdYGqgdxFWqVJ69/eLbsHmH2UVAZrUAebgxi7M
	 CKCfWsxFSIhn1QOpieuRHDJiXfN49DhTCP8JMq8oEFIw0TJk/y6pmCwRhPfmnI9tKM
	 QieJVJ290CaLDW/b1nVjqLG+NMheNvZSmhtq18m01j+/6uwuDEyO/M2HF3kHU+iJe2
	 RXOkSQCDn1E44ny2XzbvN/XsadqL+c9c8KqdtjpqteAhxkd7FlfyBoZVk8sLJpVmfr
	 vhmpuZH4v4JIw==
Date: Tue, 1 Aug 2023 14:48:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
	Bjorn Andersson <andersson@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>,
	Jagan Teki <jagan@edgeble.ai>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Shengyang Chen <shengyang.chen@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 v1 1/7] MAINTAINERS: Update starfive maintainers
Message-ID: <20230801-reviver-clip-5d1a8d22edab@spud>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-2-keith.zhao@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230801101030.2040-2-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_064831_856051_E77B87BA 
X-CRM114-Status: GOOD (  16.81  )
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
Content-Type: multipart/mixed; boundary="===============7656429629529336004=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7656429629529336004==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IVqccmOPnJ1WnFlO"
Content-Disposition: inline


--IVqccmOPnJ1WnFlO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 06:10:24PM +0800, Keith Zhao wrote:
> update starfive maintainers
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>

Why is this a standalone patch, before you've even added any of the
files in question?

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3be1bdfe8..daadd1707 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6760,6 +6760,13 @@ S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/udl/
> =20
> +DRM DRIVERS FOR STARFIVE
> +M:	Keith Zhao <keith.zhao@starfivetech.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/starfive/
> +
>  DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
>  M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>  M:	Melissa Wen <melissa.srw@gmail.com>
> --=20
> 2.34.1
>=20

--IVqccmOPnJ1WnFlO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMkNJQAKCRB4tDGHoIJi
0lC7AP0fuE7TbAcoI8Ol6wcV1gi8Wbfl+gmu5cTOS7xJbEy+PgD+IEg0kjZSlNlt
PYRMDt5Lz1ZoFzNdZ8Dew5xtfjk8oAY=
=0VQt
-----END PGP SIGNATURE-----

--IVqccmOPnJ1WnFlO--


--===============7656429629529336004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7656429629529336004==--

