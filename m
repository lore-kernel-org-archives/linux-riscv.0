Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DF3C77B6F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TVXnW16iYPI6vcEBhdFiNm3Xj5S5KKiZNbvbLbMuYg=; b=m6Ehsyk47isc01oeN9CjJUbuB/
	BfAktRNrwDPe6U5/u7HJ9TCCtTE461z3r5opCEe32LZkZNNeeFtWjonSv4049ASjVcSXW1DsOsxnP
	xqrVTW/1s6oXlmLqUFbAazcPHD8+20dN2leKhU1mUJNLuEP+rhcezlOwz3bNX0GBB5dE9dsnRXCUA
	b2kbzWxiMxekz7PErWQk96RQJjdaSHBUjzjfOMMo43mJzmzHqrVUEiny9S7kbT6peOnuwUiOUmCFy
	MWovfDHYy8B6TBR9dJ6F4eqGvRMus1OvB/qCMB6wGeo8jnX6Fji+6L5n+cxkDGCjOXOA6wtxRSd2O
	pntU5UuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmARo-00H5m1-2M;
	Tue, 11 Apr 2023 09:37:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmARm-00H5kv-0T
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 09:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681205874; x=1712741874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MyltFylIFYtbOCTHYFJyDF5AXeTRkYCwlYLXFW0zW5Q=;
  b=XWsOYc9knLYmrRJ1zGaAlQmAoolYo5pLQ/u6gC2T65kNd2RmiNiq5F3M
   zaVrWiqCmaleX9WwoR5G+lVtCuLlUlmncNE7f3l/racltBeFQ+sb2Qsic
   OdYdsvUWWi6l0xqpW/m8KgWPfK4Vix6WeJ59M7Do5/wgO1ID63yQ8NssB
   c72+b6M8MDSdXUonAXRJ96zAO1jC18i9DlFRhAU8ICKrb109MGsg9XLk2
   dFFJVwjPT9G2PSek0eh7N5Rqh5seDCyXlxtixSRKGsB//G+m+RAWF+G0a
   J+mc0BmvMlGcqpu0xgTcPBVu4qwaECJrf+q8JhlOfW8LgkcnW1qZV8vxx
   g==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673938800"; 
   d="asc'?scan'208";a="220333193"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2023 02:37:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Apr 2023 02:37:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 11 Apr 2023 02:37:51 -0700
Date: Tue, 11 Apr 2023 10:37:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: enable BUILDTIME_TABLE_SORT for !MMU
Message-ID: <20230411-flier-establish-d3ffd434be28@wendy>
References: <20230409164306.3801-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230409164306.3801-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_023754_192107_3C8053EF 
X-CRM114-Status: GOOD (  13.84  )
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
Content-Type: multipart/mixed; boundary="===============4719958754272480957=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4719958754272480957==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EG2YHGo4BKAgt7Xt"
Content-Disposition: inline

--EG2YHGo4BKAgt7Xt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

On Mon, Apr 10, 2023 at 12:43:06AM +0800, Jisheng Zhang wrote:
> BUILDTIME_TABLE_SORT works for !MMU as well, so enable it.
>=20
> Tested on QEMU and FPGA.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Fails to build for nommu_k210_defconfig:

make ARCH=3Driscv CROSS_COMPILE=3Driscv64-unknown-linux-gnu- O=3Dbuild -sk =
-j30
no __ex_table in file: vmlinux
Failed to sort kernel tables
make[2]: *** [../scripts/Makefile.vmlinux:35: vmlinux] Error 1
make[2]: *** Deleting file 'vmlinux'
make[2]: Target '__default' not remade because of errors.
make[1]: *** [/home/conor/stuff/linux/Makefile:1250: vmlinux] Error 2
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:226: __sub-make] Error 2
make: Target '__all' not remade because of errors.

:(

> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c5e42cc37604..212ea28e346b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -50,7 +50,7 @@ config RISCV
>  	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> -	select BUILDTIME_TABLE_SORT if MMU
> +	select BUILDTIME_TABLE_SORT
>  	select CLINT_TIMER if !MMU
>  	select CLONE_BACKWARDS
>  	select COMMON_CLK
> --=20
> 2.40.0
>=20

--EG2YHGo4BKAgt7Xt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDUqYAAKCRB4tDGHoIJi
0s+NAP95rLxAoXj+yAMZk9GEMzPkMjw9Nj+tBJ5nl1M3voR1/wD9E62rAX0Y0ogV
wr7SweOexWbvfYXlHHZdCWlyyoAXwQ0=
=VObW
-----END PGP SIGNATURE-----

--EG2YHGo4BKAgt7Xt--


--===============4719958754272480957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4719958754272480957==--

