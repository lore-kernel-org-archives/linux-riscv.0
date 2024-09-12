Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07622EED628
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 17:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTBlN09z8qZgK9nU5FkETT6I85RNXLWh4BFXchvwEfw=; b=bZKWGBmCbouTZpSgvxaBZ5jYZg
	JI/cZGTYNk9FlJyUX82uf6mAL9epKmOllD5Zn7NdP/qRCczV3yblAYy8NGXOg0KkdJSywYK+zRKDa
	qj/VdSZt0hnxvskEQpk+3V8bexqQCpXpsTZGQ2T2IvLq7yKHBgTgGENcpHaQokr4yhuMFDc1oa3k1
	dz1WIoXHcN1AxE0zagn/BUUMPO/qIede6yjsOgCKjL+ACU1QfqhIZmNNaI/fpd04+wMgSYwbmT+NC
	k2kTs07sNACYa71pHnzptSkddMu6EISzS8wWB09fQYCJ+AlhHS1eH4aKHdANCsq3SCV3UN1+T5fb6
	1ZnaPIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sonR2-0000000DoDw-2jMu;
	Thu, 12 Sep 2024 17:16:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sonR0-0000000DoDR-0kSZ
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 17:16:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2B395C5BE0;
	Thu, 12 Sep 2024 17:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F3BC4CEC3;
	Thu, 12 Sep 2024 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726161405;
	bh=lcXDiJUuSazbyiM7a9bDnM0VBOr4vDSb01GvcGWxj9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DA8+QBA7MmBMhmWysQj3WpTWIQaCdjOvJ3jGqukftUb0iTA8PHxdaJ5kCkDDZAzHi
	 U4jxZB+tpspxCILjXAUoPMyVx8KN4aph/wzHz3JmUVGn8oXaluVkoOxQvpgFiF5kUf
	 waCQXQWhoVPUJJHXiDcg52niG85I6PppwmdZkAzJPGhtOCslPInuql8QqNfjtzdeBE
	 Q48scY29pdSKalRQjV52E1zzExUBKMk7a0xUFW9bGy0OTt2zDT6mo6XaQGsPYwrog9
	 8llo9e+YeK4GnCmPwoprbNIC3k+K9+uUlSOMpRdYoQigm1Ck04N4NMiPXMJDIiXP0i
	 icFEv0Msv2TnQ==
Date: Thu, 12 Sep 2024 18:16:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	peterlin@andestech.com, dminus@andestech.com,
	conor.dooley@microchip.com, conor+dt@kernel.org,
	ycliang@andestech.com, jassisinghbrar@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v1 1/5] riscv: asm: vendorid_list: Add Microchip
 Technology to the vendor list
Message-ID: <20240912-landmass-sculpture-c4884637f5df@spud>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-2-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240912170025.455167-2-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_101646_283655_7874D3A3 
X-CRM114-Status: GOOD (  13.03  )
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
Content-Type: multipart/mixed; boundary="===============0661100767770228580=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0661100767770228580==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iuE30SpHjwyKCbFe"
Content-Disposition: inline


--iuE30SpHjwyKCbFe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 06:00:21PM +0100, Valentina Fernandez wrote:
> Add Microchip Technology to the RISC-V vendor list.
>=20
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.c=
om>

In $subject "asm" should probably be "sbi", otherwise:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/vendorid_list.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/=
asm/vendorid_list.h
> index 2f2bb0c84f9a..a5150cdf34d8 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -6,6 +6,7 @@
>  #define ASM_VENDOR_LIST_H
> =20
>  #define ANDES_VENDOR_ID		0x31e
> +#define MICROCHIP_VENDOR_ID	0x029
>  #define SIFIVE_VENDOR_ID	0x489
>  #define THEAD_VENDOR_ID		0x5b7
> =20
> --=20
> 2.34.1
>=20

--iuE30SpHjwyKCbFe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuMh9wAKCRB4tDGHoIJi
0n1ZAPwNlMdbujIfW5R6Du2ao945FO0uBhC/YZF+e2UTGjXQ5wEAr0myf1+5QDw9
e0ZL9gHXB3oSW9Z9B+aqz83pu5H6vAs=
=zdl8
-----END PGP SIGNATURE-----

--iuE30SpHjwyKCbFe--


--===============0661100767770228580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0661100767770228580==--

