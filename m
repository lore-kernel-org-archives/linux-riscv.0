Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAC5C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 09:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LY3L7A2lN+9f1Iw+8ZRyjbEkuL+OkMisgAYym4LPbFY=; b=xgAyixA8g6niCIFEB8QfSYB0Tc
	N6uS3d6/G/wKR0b/kLe2+ZKVYPJCsqYU0FLHX6Z+VFKeKbwv1kYvMfgwmhlZQBESr3SrYD0SXm1Yi
	XZrFhy/S6+IGHqueuCqq7l0lHIwYqymJZG9GBP5+++ixEZOjsXaPphvWBBYj3z1SfH+VHz52nRooT
	RKjanJ/bNzN++op773+2NH9ZMonG1QHaIfgnMyG2QyhTZZlidUDI7ScZN2UlGTYqfyXDxTA7K8SCb
	m65FVI2N/NdHBAKgJ6ZllA9LqV7yBFgz73qINYVTcXzFEdUsS0JBteK0vgeHFxKZoH9QzbbpdXvet
	sdE5sjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpnL-00473i-8x; Wed, 08 Mar 2023 09:09:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpnJ-00472t-12
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 09:09:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 46171B81A3C;
	Wed,  8 Mar 2023 09:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F56C433D2;
	Wed,  8 Mar 2023 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678266546;
	bh=O6M3mPBFepm8d0qTiynaC3QYyWTXinrDdUJbKhHz13I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=omOvUEpgMDmPzanH8h0jF0t/RefOtRQ+9XDgF4iFxPNMJ2uuog3Qx1r9/Juc41rJ/
	 pfXRIJE9iHvhb/dSMvEqVchGZLZHpT8ZodVapL2WSlfJmatN5300Ocnm94oGtqB2k1
	 LQs+LEgorn0nUKpLkl+l6kEqOqqvIzoCk9QldOsTHMP2oikq4NVvH+tRoriYcMBPQs
	 BYnFDc55X7N0AKetblL7FXrjhTqPbNZFRVOfHWoqwF88dJGlyAZbaP59hPniGvBZED
	 Ga/pxtlyd1LW9+sXla0EplYeZaTye2zqBxHmyWOJS1K3gixOls8QUuCYOg2bLlPLHg
	 euNG8/vEeD4Yw==
Date: Wed, 8 Mar 2023 09:09:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Qinglin Pan <panqinglin00@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn,
	ajones@ventanamicro.com, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: Re: [PATCH v14 1/3] riscv: mm: modify pte format for Svnapot
Message-ID: <42440bf0-f329-41c4-9e44-e0711b7ab23f@spud>
References: <20230308074853.4393-1-panqinglin00@gmail.com>
 <20230308074853.4393-2-panqinglin00@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230308074853.4393-2-panqinglin00@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_010909_233580_76973891 
X-CRM114-Status: GOOD (  15.72  )
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
Content-Type: multipart/mixed; boundary="===============5827729644450464697=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5827729644450464697==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nd29e+AL20eS1dDS"
Content-Disposition: inline


--Nd29e+AL20eS1dDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 03:48:51PM +0800, Qinglin Pan wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>=20
> Add one alternative to enable/disable svnapot support, enable this static
> key when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT compile
> option is set. It will influence the behavior of has_svnapot. All code
> dependent on svnapot should make sure that has_svnapot return true firstl=
y.
>=20
> Modify PTE definition for Svnapot, and creates some functions in pgtable.h
> to mark a PTE as napot and check if it is a Svnapot PTE. Until now, only
> 64KB napot size is supported in spec, so some macros has only 64KB versio=
n.
>=20
> Signed-off-by: Qinglin Pan <panqinglin00@gmail.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index e3021b2590de..ba9f4650f051 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -42,9 +42,10 @@
>  #define RISCV_ISA_EXT_ZBB		30
>  #define RISCV_ISA_EXT_ZICBOM		31
>  #define RISCV_ISA_EXT_ZIHINTPAUSE	32
> +#define RISCV_ISA_EXT_SVNAPOT		33
> =20
>  #define RISCV_ISA_EXT_MAX		64

> -#define RISCV_ISA_EXT_NAME_LEN_MAX	32
> +#define RISCV_ISA_EXT_NAME_LEN_MAX	33

I think this change is not needed.

--Nd29e+AL20eS1dDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAhQrQAKCRB4tDGHoIJi
0nx3AP4jdII+e7CdOSvtMIfwF5YEKImnP18dvwb7jGRDbXG48AD+KIgkL+gfbgPH
P5qSNztsjG5dioojhFwrRdUEmtgtcAk=
=0Wuo
-----END PGP SIGNATURE-----

--Nd29e+AL20eS1dDS--


--===============5827729644450464697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5827729644450464697==--

