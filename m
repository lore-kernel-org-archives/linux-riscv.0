Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE0AC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 11:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcOTVSEbTi1S7/dCTx3aUAuWWkNYSud781FAjKyYPxY=; b=0uOnglR+IhlvKeyXejXcZ1zgD5
	eJGW8+fSBio9iASpBkviNvUcoOoy328DQ/YUpVn1anIXD/EZ9OT3Iuk2FUVx+NtiSl84AqCBNwO/2
	keKM9eURWbT7a21u/wX7aptYhH76Lk4/MhWdqiR0N0oegVDCfrMeAwEsdkZhmdPvqUDbVi8KJV+e7
	+D/5mJ0Q3HeOIkVKnh4gQtJt5uUUw5RRCotvz3F3vc2MakxKwcWv5QJ0xcxthB0GJLj0t3JBNElF5
	7ZFC4sKxoo/tm2ZR6QUF2mevkdDEKXoQigEs3lEkMDjjlJ7SeQwY+XGygcM93JE7U2rpimJn5VQvn
	Es3+1skw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvF3Z-0000000GuU2-31sU;
	Fri, 12 Apr 2024 11:26:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvF3L-0000000GuKW-34OC;
	Fri, 12 Apr 2024 11:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712921203; x=1744457203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z+QWmlRkXyiZHeyBdGOBMyt0lCNZkClZvYp8kEJVhsQ=;
  b=HQKN+LpcRDED64MFJM+j9TBcFFiGBXwY3eIjwCnuLNlBmmrNKMNcTX61
   8zZ2BpL2Qbi1ayJ2QAWa+foS5gNE6lnnsuFZnlEXndozXLMciRi4CCpRz
   Oe/+GwNKGlyO4lleqt2QR0g+a8L18ZpMHp4dy74w89VjIfTgYHXd2E+HT
   GTtKsui4P6eJYyQUV0rYaMj7a14RgfUXwAOR/QegEK91sOKubBZI1yROY
   HbzqoLIKjASQWbfVesk0qgRJvLQrGEBPNKbMkonIciawEXjjcdqc0n9r0
   evxMWXt9LtfmuN1WBXwr/DshFyiTpcT/fMB5VBAJ+rgNTw8u8ttaT7AOp
   g==;
X-CSE-ConnectionGUID: mMLqTC6MQs2jRulaBFM8hA==
X-CSE-MsgGUID: cKKh0uYiRwyg+O5MVbf/Iw==
X-IronPort-AV: E=Sophos;i="6.07,195,1708412400"; 
   d="asc'?scan'208";a="22708176"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 04:26:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 04:26:37 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 04:26:33 -0700
Date: Fri, 12 Apr 2024 12:25:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Evan Green
	<evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<shuah@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 05/19] riscv: Fix extension subset checking
Message-ID: <20240412-underuse-manliness-56d328666ce9@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-5-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-5-4af9815ec746@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_042643_982965_A5349C5E 
X-CRM114-Status: GOOD (  17.68  )
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
Content-Type: multipart/mixed; boundary="===============3026847228602065326=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3026847228602065326==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q4bmFTLuVU/tA/Al"
Content-Disposition: inline

--q4bmFTLuVU/tA/Al
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 09:11:11PM -0700, Charlie Jenkins wrote:
> This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
> than if ext->subset_ext_ids[i] is valid, before setting the extension
> id ext->subset_ext_ids[j] in isainfo->isa.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index cd156adbeb66..5eb52d270a9a 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -617,7 +617,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsi=
gned long *isa2hwcap)
> =20
>  			if (ext->subset_ext_size) {
>  				for (int j =3D 0; j < ext->subset_ext_size; j++) {
> -					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
> +					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
>  						set_bit(ext->subset_ext_ids[j], isainfo->isa);
>  				}
>  			}
>=20
> --=20
> 2.44.0
>=20

--q4bmFTLuVU/tA/Al
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkaNgAKCRB4tDGHoIJi
0jF+AP0aO4m1oyhnqLkpU2nu54aTKQxfBfGaf5fonL4sFryyhgD/dWIvHo6yBxxP
Nl1Ow+f7aIxbclA0UIvZgnXGzIHIIgQ=
=wY2O
-----END PGP SIGNATURE-----

--q4bmFTLuVU/tA/Al--


--===============3026847228602065326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3026847228602065326==--

