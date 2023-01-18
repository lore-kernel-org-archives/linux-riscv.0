Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC7EC32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 22:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUIfiW2vl7ept2rczj2SBDbMeV5wkB/MFdE0vOeVT3U=; b=XSr3rBIwL/lRTl88aRR3sphod2
	nyH0P+qG6hjfLBRu9wQI2D82vd7DTwrUBshhsKlsXcuht5eazFWraNv4X1fHBURlCdAbm/OIL3gZp
	G1I40awAOyh4maH/j8xpA/HS3a0UWD/BUUAR6RRMZ/HhspBQrF/8PWsHo+3NnTy+QPB4nNSEhF6MQ
	7dBbNOxXBHFjK3Iy2pJgPeHD3pkHEKiMUwuY1kfT8qn9tx4i15C+n5500cpx/tVS3oc3cXJIV9/O0
	8IiwIFV5zLr9ErazOtQ0kh3BtIh7KI3xqInMp94fgjju/OsPD/nqp12FMB4mIf8USqwhx1KTGw4aa
	9w+MTI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIGeH-002pdf-IB; Wed, 18 Jan 2023 22:11:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIGeE-002pdE-PU; Wed, 18 Jan 2023 22:11:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C1F361A66;
	Wed, 18 Jan 2023 22:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB2FC433D2;
	Wed, 18 Jan 2023 22:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674079869;
	bh=CdZG5/YxLc49feLRzoUlE6cnoB+Dyy0CHB+Umiuydq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRf994SPqMKZzWMUowCxIVLg8cJ3eE51GDjGUNfDpYuDhiK6AtUImg0AJqu0SX7o0
	 Jiby7b9qkGsSSTE8oBDuFSSTd7onTrUNaVJ0MIFbPcyl6kcf0NRTLwzmH22tqC3ljd
	 SEG8/6VYfKYONMhsM1HcXkI222re2DNCj7E1bC2HBsYlUceHPlKd07wrT0/5kXFuA9
	 ICTp6ZR7yRARSiuzNiXGSOEh83InEyf3KLt3u5nClt5LQY2qVo5NC6NTL/UWYGObxa
	 O+tTlDAd5OeL3CWusasP3vGZ4IroWGvlV0efHJBtRsIqb5zSnwQT9Q7Ei3tDTASilu
	 KWTUw9jCFeTPQ==
Date: Wed, 18 Jan 2023 22:11:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 09/13] riscv: switch to relative alternative entries
Message-ID: <Y8hueOxeSzF6MT2+@spud>
References: <20230115154953.831-1-jszhang@kernel.org>
 <20230115154953.831-10-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230115154953.831-10-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_141110_882203_0B4BBE87 
X-CRM114-Status: GOOD (  15.89  )
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
Content-Type: multipart/mixed; boundary="===============3190015825564852796=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3190015825564852796==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bmKuqoHkdUUge14f"
Content-Disposition: inline


--bmKuqoHkdUUge14f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2023 at 11:49:49PM +0800, Jisheng Zhang wrote:
> Instead of using absolute addresses for both the old instrucions and
> the alternative instructions, use offsets relative to the alt_entry
> values. So this not only cuts the size of the alternative entry, but
> also meets the prerequisite for patching alternatives in the vDSO,
> since absolute alternative entries are subject to dynamic relocation,
> which is incompatible with the vDSO building.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

> +/* add the relative offset to the address of the offset to get the absol=
ute address */
> +#define __ALT_PTR(a, f)			((void *)&(a)->f + (a)->f)
> +#define ALT_OLD_PTR(a)			__ALT_PTR(a, old_offset)
> +#define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)

LGTM, thanks for doing that! Certainly makes things more understandable.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +		oldptr =3D ALT_OLD_PTR(alt);
> +		altptr =3D ALT_ALT_PTR(alt);
>  		if (!__riscv_isa_extension_available(NULL, alt->errata_id))
>  			continue;
> =20

One minor nit, the oldptr/altptr assignments could go down here, below
the if/continue, right? Obviously don't respin for that though!

> -		patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> -		riscv_alternative_fix_offsets(alt->old_ptr, alt->alt_len,
> -					      alt->old_ptr - alt->alt_ptr);
> +		patch_text_nosync(oldptr, altptr, alt->alt_len);
> +		riscv_alternative_fix_offsets(oldptr, alt->alt_len, oldptr - altptr);
>  	}
>  }
>  #endif


--bmKuqoHkdUUge14f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8hueAAKCRB4tDGHoIJi
0vqnAQCu6VGYhfeHulaTR2wdUMiEo1QZs/vLjK4o0+w72tjqvwEA3JzxSPC2w0S5
hP0afumacfOuguJC+7JJkFbi/XEE2wM=
=RVgk
-----END PGP SIGNATURE-----

--bmKuqoHkdUUge14f--


--===============3190015825564852796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3190015825564852796==--

