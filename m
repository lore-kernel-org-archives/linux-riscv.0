Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0902BC636D3
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 15:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTBY4l/II7S3aEKwSCly79H/uC5FaCPK65ANEi+tqPs=; b=BwVEY+INaSQ253yhcF7TmlXs7W
	kyUAWAjvOkN/vnrR1wZoWZ1p6vI7zgTl/FtxpdZVAErIDfrTtc433Jw9UNd7yTHmTFKdqm8Zv+Wvq
	Zxntoead7s4BKj4/FnC1oZkJKBfy4gS7O8WXX1HkUI/mKhk5ajlFLZnlKokvFY6dJFvc3qGf1ysKZ
	9wq860OqLXrZqQTtwJQ7OTY/RmaevUTTMj1wW+HsgoeTbWGilxti5Jp0PoH1pZUpVTcu6o3HAOM/z
	T4cM9iAHVTeSYKouqJuKMmvmatkuhE246uK6EpiVgtxBNOAOJanSYYCOifwwAjUYeENxqr+FfnP6E
	17P/+8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pREai-00BkMf-Tr; Sun, 12 Feb 2023 15:48:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pREaf-00BkJE-0l
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 15:48:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9A421B80D2D;
	Sun, 12 Feb 2023 15:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC434C433EF;
	Sun, 12 Feb 2023 15:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676216910;
	bh=Vukdoymwm/wEA58+hycxqrl3bmx2LN+x0akzNw5Yu2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4hRk23TmcLpC3qBZrOU7D2TKEUlF7xHXzs3SYhgVfrPxWvNBDxb2dvz/pbrehLJ5
	 ibjxhOPLcd/aUKIHHA1rK9qmS1W+ilXlxSnSAB90r2GzrogU0/PQoVDbYP8FOQ6pMu
	 ho4fp2QY+4mJnQGoYqPj0cVZQrEobBnIlodAHaSLR7u7QhXuM9BJm3flou3ajE0b3V
	 RO9IXfldG2mgrpJ5UDLsln9X64bd/kUzM5uNTBoVY9gDXF9d0PnUDjXYGxIhR1aK7N
	 +xTDGqNAXTXgdMYkGuHn927KUviECLNxqll2KcUXjocfIKRUqVLgKHeK6CTJqkTToG
	 gxFxDyC6rPnLQ==
Date: Sun, 12 Feb 2023 15:48:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: Fix early alternative patching
Message-ID: <Y+kKSTuyvpw06VCG@spud>
References: <20230212021534.59121-1-samuel@sholland.org>
 <20230212021534.59121-2-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20230212021534.59121-2-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_074833_243944_C63601C9 
X-CRM114-Status: GOOD (  16.26  )
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
Content-Type: multipart/mixed; boundary="===============8631968194157607930=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8631968194157607930==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZZwqfOBoXuz7+HRs"
Content-Disposition: inline


--ZZwqfOBoXuz7+HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2023 at 08:15:32PM -0600, Samuel Holland wrote:
> Now that the text to patch is located using a relative offset from the
> alternative entry, the text address should be computed without applying
> the kernel mapping offset, both before and after VM setup.
>=20
> Fixes: 8d23e94a4433 ("riscv: switch to relative alternative entries")

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
>  arch/riscv/errata/thead/errata.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/e=
rrata.c
> index c0bea5c94128..1dd90a5f86f0 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -102,9 +102,7 @@ void __init_or_module thead_errata_patch_func(struct =
alt_entry *begin, struct al
> =20
>  			/* On vm-alternatives, the mmu isn't running yet */
>  			if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> -				memcpy((void *)__pa_symbol(oldptr),
> -				       (void *)__pa_symbol(altptr),
> -				       alt->alt_len);
> +				memcpy(oldptr, altptr, alt->alt_len);
>  			else
>  				patch_text_nosync(oldptr, altptr, alt->alt_len);
>  		}
> --=20
> 2.37.4
>=20

--ZZwqfOBoXuz7+HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+kKSQAKCRB4tDGHoIJi
0hTXAP9igWO796XC6hLAXjhirFkpfB6Cxc4+Iy3v0XaTjWbkKQD43amLsSE0ma63
mWwEfULUWh6gbSdqjnv3HsVqCG9+DA==
=O9Y0
-----END PGP SIGNATURE-----

--ZZwqfOBoXuz7+HRs--


--===============8631968194157607930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8631968194157607930==--

