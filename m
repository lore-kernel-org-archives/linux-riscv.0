Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D48C25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 08:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxEtp/p0F4uGctU9n8xNw9PNS5IhjAgiIwf2Hnqgsi4=; b=4Mc4suvtqTvxEt4hk/xuhBnfIx
	ecuVweykaeIHA4G5D9tLuKcn/2fg/eidtu8SWBSSXV8nrc+0JaBrkmAu2wrO4HdLobKH55eVmkHVB
	2BBCI5HEWPeqIZS6guYnh9EacHeUqIwJAqQKCiBgVKolh+tibi/2qyUUpazf5zApsgQXkAudR38J/
	7by1dnD5L94IJ/NutaIr5PP6ehcdUcIyL88RKkleNPadPsvZVaAUutGtyDuSn1go7u6XKp7rvUvIz
	qsSVUJ8UBDoScFzeLMORUsWI6/5b8G/G9T2h6RO/UbFMTHlx+qLXXM8TtBkRj2l63+6tyRT9H7em/
	3JdY1YUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImQg-008we7-K6; Fri, 20 Jan 2023 08:07:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImQd-008wb9-KU
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 08:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674202035; x=1705738035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nj4qwETRubMj/7izseQtk6cz1ZsfPsRki/sm74Um4Lk=;
  b=Hkh1XOVKR1gqfVXNeItTowxeF5CkEVG8fBsrmAbss3tNpPEat3qbtxXJ
   0zGcRzfMFAE9Xwexr8cz6vqOsRkx0BW51+OOdR6g7MsF/quLcGFscehqn
   trarI0XkqyrIhBQ+ReBu7kVWED0joug2EXdQAiCYl6vGSkY4ztsSwO+fU
   A4acrDHIjC8bFX4T3hoLQaovgGViRtpuC23mQr9hNaNBzpe45rBjPLDzz
   4EZE4LL15XhDEvfQAqX1gbw6OJiIGiS1GihCD3Up77g+LWNRU8Ly/T0Zo
   L+4xLxzW+tMjT7yO6F1mVKvOtK+1+yzsMLy9DM4/hTFgrnOCpLVRQQeIP
   w==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669100400"; 
   d="asc'?scan'208";a="133248756"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 01:07:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 01:07:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 01:07:06 -0700
Date: Fri, 20 Jan 2023 08:06:43 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Masahiro Yamada
	<masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>, Nathan Chancellor
	<nathan@kernel.org>, Conor Dooley <conor@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] riscv: select ARCH_WANT_LD_ORPHAN_WARN for
 !XIP_KERNEL
Message-ID: <Y8pLk18Y+Jn4NI8f@wendy>
References: <20230119155417.2600-1-jszhang@kernel.org>
 <20230119155417.2600-6-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230119155417.2600-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_000715_770563_A49BEBD2 
X-CRM114-Status: GOOD (  14.00  )
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
Content-Type: multipart/mixed; boundary="===============1099590900714599810=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1099590900714599810==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="co02PEkryjRdO7+H"
Content-Disposition: inline

--co02PEkryjRdO7+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 11:54:17PM +0800, Jisheng Zhang wrote:
> Now, after that all the sections are explicitly described and
> declared in vmlinux.lds.S, we can enable ld orphan warnings for
> !XIP_KERNEL to prevent from missing any new sections in future.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Warnings that the automation picked up are now gone in v2, thanks!
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..335e0c45cced 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -46,6 +46,7 @@ config RISCV
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_GENERAL_HUGETLB
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> +	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>  	select BUILDTIME_TABLE_SORT if MMU
> --=20
> 2.38.1
>=20

--co02PEkryjRdO7+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8pLkwAKCRB4tDGHoIJi
0ugMAP9Dtdasv+Ucfm8ro1/RC9MvuaXtDAS68fInTuAe3ffwYAEAn+1tR7N9WYfp
APblBwTpPB1jUvJX1Hg3YNFGDGGINwk=
=AEBc
-----END PGP SIGNATURE-----

--co02PEkryjRdO7+H--


--===============1099590900714599810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1099590900714599810==--

