Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79212C001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pRxez92jbH/7J+XYWXK9VbYtf6gOS83l3/R2NhXFxU=; b=ETYSWqUNv3wSe005EZD1JCPXih
	GiD895dehDqXu9IIPmtrNNB8Loh7YWGI5UOkhadVHmSl8l8TbOv3IXLo8JjFIVbulETf8q5xA+zpV
	odPvFXy1pZIOP+k0qqBvasHu/uT6aVwRQDHKpvq2KrbVcaX6jXuWWajdNUSgcfL1does4VuncScWq
	EqfqIhcPkYYZwjW5suddeQIRnKiuZ03PDDT5UaBIXEOjeNk5vGD0xqJUiOvwYTLYAgZOWpCTwrY9H
	Z0KvWyTB4XCHPlL0hzJXTaoy75RsF49joxZtEr9VEyr1JDq65nCw6U1Xr1F9vioO/9uftsjjzcSA0
	nGVqyRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQnpA-00284g-2N;
	Tue, 01 Aug 2023 11:46:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQnp8-002849-2a
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 11:46:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 412356154A;
	Tue,  1 Aug 2023 11:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFC4C433C8;
	Tue,  1 Aug 2023 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690890357;
	bh=bwYNSqKRC0R+674VMqvdQly3Gz4NVnq8bIwpgip/fMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WqmyPFmmeSmegi+a0SHRqS5oZwD76X7tmgjW+ljezELQ+8Wb26NIznCKG5haaLEAF
	 keLzY9Dl8Y+2PRS4UlZ8ig2z8HcVeGXW/vRnTDqvxhcbdPkmGGF9yy4p9pzqPN7wS+
	 FFXXOlRZtzQYDHcY+rsp0zBC3hN0unDTsBHEmpQee2vUeuUg7aVq68vZkK0bEws6RD
	 Mz6rV7Sbxc9Jp9L/kGOLPldmyPAaPk4+2R6tiGhkyuhOxYSmC7FYox9b4nAEKP+5e/
	 oDa0SURRY28NGjaPdq7IsswE5tgKPdMuv/aHJdiypo99SdjAWWGEC/EzBu1rz+eck0
	 GdGIMGvXRAUuQ==
Date: Tue, 1 Aug 2023 13:45:54 +0200
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
Subject: Re: [PATCH v1 v1 4/7] drm/fourcc: Add drm/vs tiled modifiers
Message-ID: <clxexkf4wjx5sxlxz3znbxehgxob2vw56v4pn63vuu6kfffyxo@bek3dvzsz5id>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-5-keith.zhao@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230801101030.2040-5-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_044558_926210_43698A41 
X-CRM114-Status: GOOD (  19.00  )
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
Content-Type: multipart/mixed; boundary="===============0799525355626450233=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0799525355626450233==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yslrfwhuh7l3ursl"
Content-Disposition: inline


--yslrfwhuh7l3ursl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 06:10:27PM +0800, Keith Zhao wrote:
> These are mainly used internally in vs-drm,
> I'm not sure if the new modifiers can be used with the existing ones.
> If there is a problem, I will improve it further.
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8db7fd3f7..0b884cf50 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -419,6 +419,7 @@ extern "C" {
>  #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>  #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>  #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_VS      0x0b

Please don't use any acronym there.

Maxime

--yslrfwhuh7l3ursl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMjwcgAKCRDj7w1vZxhR
xXHaAP9IH1zIQb62ZyQMhxixSEF8riImLMdkmCdKEGrFpkEFWQD+PXDOQ/6x3wG1
4wF4AjgAQYTN8OUvFxlHHLqmlcYYDA8=
=rlbJ
-----END PGP SIGNATURE-----

--yslrfwhuh7l3ursl--


--===============0799525355626450233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0799525355626450233==--

