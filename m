Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94A7C3DA78
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05qVhUvJUdL6IAvya9Er983dPcX2lei3CwRvsl8wRI8=; b=0hHMSAZCy7JBHk1W1Mq4Hb6Oxn
	RTHCy6cYqd+X7yesLbDf8wHRYqgV2jwchL2IStIYpNr2U5V/La/5BLKIJ7ThbQjXs5LkkB29ccVdM
	NUize+A6I1Yvk9nbcJI4wFmTj1sUzlGT0q8hMKn8TMq/gVrpJEmAnpm/wCKoPXVv+FfQZD3FL6wHV
	82T/xSAlr8Z4e938tK3g7JoiZOloIOJ5OF/TeS7X7CfaMAdMANFAvlmr90oFUTnZn9lFohhk0zKjH
	jZunZ1zw5CQQSd3nZ9AWkC49co5lPhthWdK+CQQw+ppv8Qj+gQoMfkX6NnGmuFL0kVRk6KOZzQJxW
	ZF35GBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHj6s-00DjVM-2g; Tue, 17 Jan 2023 10:22:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHj6n-00DjTf-Ov
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 10:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673950946; x=1705486946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jduk+YtRRP7rmlfDLYm1waOqpM1GyJ520JuwoKa2X8o=;
  b=WLYDpPeLlujfR6FAZW0P89NDMez9LJO1GA7dOsLhSgJstntnLCTQLC0h
   UAUGoZts3QgGV9i/lA+kyfgQDsxZ4oy1fkFNbJ3wEYDi/IWdSDIW1gpo6
   TBOQ0JLrDZWwhpFDgAHjTws95Rudh50nirBYeefLnWcKnDqJNNwP5x6t3
   dwmr6tHtRrJtQ92F8Z7l7VseknDvDoCwm6+63Y0qri84ImHOmfLbV63Mg
   JGjcX0Kj2d8BxX9t7L3RKd5vMWvq6WzO4mvXLBlx/9NKBQFUvodA921RC
   eKY60a0aGS2Fo7cuPQx6LLmUXrHMXVKQBgSBN68WdlDkbj2uGhvqoSNPs
   A==;
X-IronPort-AV: E=Sophos;i="5.97,222,1669100400"; 
   d="asc'?scan'208";a="192580816"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jan 2023 03:22:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 03:22:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 17 Jan 2023 03:22:18 -0700
Date: Tue, 17 Jan 2023 10:21:55 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Masahiro Yamada
	<masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>, Nathan Chancellor
	<nathan@kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 4/4] riscv: select ARCH_WANT_LD_ORPHAN_WARN for
 !XIP_KERNEL
Message-ID: <Y8Z2w0UQISfZnrfF@wendy>
References: <20230116154800.2396-1-jszhang@kernel.org>
 <20230116154800.2396-5-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230116154800.2396-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_022225_933371_0017B727 
X-CRM114-Status: GOOD (  14.31  )
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
Content-Type: multipart/mixed; boundary="===============5227197913322103643=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5227197913322103643==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3qmieu08swuSyC1N"
Content-Disposition: inline

--3qmieu08swuSyC1N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Mon, Jan 16, 2023 at 11:48:00PM +0800, Jisheng Zhang wrote:
> Now, after that all the sections are explicitly described and
> declared in vmlinux.lds.S, we can enable ld orphan warnings for
> !XIP_KERNEL to prevent from missing any new sections in future.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
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

Enabling this points out a bunch of warnings in the efi stub:
https://gist.github.com/conor-pwbot/145c5536268aec641671592a4cced32c

Would you mind sorting those out prior to enabling the warning?

Thanks,
Conor.

--3qmieu08swuSyC1N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8Z2tgAKCRB4tDGHoIJi
0iKAAQDa3Yxosmmpo/vgbUjG9He465WkavaULpDmIAakOpD2wAEA6XTyDQ+yoemi
N0Bicm8PJ1E9pDeVOADgMBQe6UPw9wY=
=Rf9v
-----END PGP SIGNATURE-----

--3qmieu08swuSyC1N--


--===============5227197913322103643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5227197913322103643==--

