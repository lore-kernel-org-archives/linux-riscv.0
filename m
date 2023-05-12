Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3390C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 13:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhNP1R6Xg6KwqtHcOXt/saYk+vKstgcxVKneYoUcUMY=; b=i+XySAxcSvYukh08VY/hltC93s
	8c4JNYbQZPQiq3IvET4+6a64Yh8PizuysH37mlst3U2AMbt5TlyVHlXUnkLjBsT4X/6CCY6QtObqt
	d+fpf+ciN+ZK5sEnjaSH6WN8M4+2oB8+ZqYLeHduYJHrPqFC/s1AJgQULFU4+n8+DfaGFHcyVQDra
	0ScvSOMg+2rhGahHdT3g1nCbZZFFb/KNeBe5K2pdcx3u27otniFNurPdcMRx+4K1u5PQ5hu1UX4H3
	PVnsN0u7ixZZTvqhEo/nN3czzba8BhuerHGLMjp3Hn0rXmRT6w0scJYcU9UvNN8zTpcCsAoUyZ1dN
	fPpE1bNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTIj-00C5or-0p;
	Fri, 12 May 2023 13:59:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTIg-00C5nl-10
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 13:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683899954; x=1715435954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RgLBvhgm2odiQ2SzAp4nOs61NsPOgBYkIG0oBcKhByU=;
  b=tn7aMy0fFN6AfdqR5fSBilNzF49DtGkCGMM4wTUDDz3zmyrKuu3ZcVq7
   rk5vfJcB+eX5aHpmPZ0VnHK2ROAmmtNrhLebQMGE57SWspGxeby1CqfKo
   hb2odfYQARMx5iw3JQDKByz+M4lXERyLHILyUtFDT1ptKVJFkxV+/G6g/
   3sWO6hCVkJ5SiHZ7gnDl2WRIpN465+DjD7ZugqRqYIhT1W8+CUHAksJdR
   qrei7S38TCWqb2zM1ZdCiufYS8WzWqRaU/uL6FcJIxqtCizYk0sp8gmaA
   unr4i9iYTPjY/p30g2DYYQ1kZD5KoCOyC6dIivPQMR+PiIv5IXSzR2yyV
   A==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="asc'?scan'208";a="151755680"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2023 06:59:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 12 May 2023 06:59:11 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 12 May 2023 06:59:10 -0700
Date: Fri, 12 May 2023 14:58:49 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann
	<arnd@arndb.de>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>
Subject: Re: [PATCH 4/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Message-ID: <20230512-spouse-pang-87f2e579baa2@wendy>
References: <20230511141211.2418-1-jszhang@kernel.org>
 <20230511141211.2418-5-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230511141211.2418-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_065914_409985_9AE682AB 
X-CRM114-Status: GOOD (  10.31  )
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
Content-Type: multipart/mixed; boundary="===============1143399700647219448=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1143399700647219448==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aCJ58t5/KMUTtFbc"
Content-Disposition: inline

--aCJ58t5/KMUTtFbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 10:12:11PM +0800, Jisheng Zhang wrote:

> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.=
lds.S
> index e5f9f4677bbf..492dd4b8f3d6 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -85,11 +85,11 @@ SECTIONS
>  	INIT_DATA_SECTION(16)
> =20
>  	.init.pi : {
> -		*(.init.pi*)
> +		KEEP(*(.init.pi*))
>  	}

This section no longer exists in v6.4-rc1, it is now:
	/* Those sections result from the compilation of kernel/pi/string.c */
	.init.pidata : {
		*(.init.srodata.cst8*)
		*(.init__bug_table*)
		*(.init.sdata*)
	}

Cheers,
Conor.

--aCJ58t5/KMUTtFbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF5GGQAKCRB4tDGHoIJi
0qYyAQCRMo5iM+rBTlmU5brSvMFm+H9q1MMggt56ESxJdUM5owEA1Rux0WE9Ky3q
wRiS5v6F7DGyWjBZXjvhP+7kcWDqfQM=
=O/cE
-----END PGP SIGNATURE-----

--aCJ58t5/KMUTtFbc--


--===============1143399700647219448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1143399700647219448==--

