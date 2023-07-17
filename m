Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B710EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 11:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooPg3aJ2pogIPewEV9CZGE/EiEVF97MAu7QIn49vrpE=; b=rFdjMqmWzenJ/Ueba3QH7i6ioY
	6cGsVo2hI0whunk+UwWI4zPR7d+egqQTHd5E1If9aGiZCIRHEFXPi3zEY0bS/7rdZLF+KhKZjkeAa
	X8NtZAyMp31uZkMaJGzmouXk0G7vQVSzkttjfykuyv4undnbWwr2GBj/nPzuFkcFsDbnw4lEyZ7pz
	T3hxHkHpWsPOPo6mwn9++nDS/JGPEVHR5+KY/SCWzhlp0l3lDXihvkhvxQlkHS96Xh2uN98Qgw8FA
	zVVyvDmUkqGmtczDxxhL+IZ31hNA852rF54Lp/aycu4ppeCx02675J9z11TG8PbtmTtNhIk27Np4/
	IQkGYPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLM9I-003pkw-0M;
	Mon, 17 Jul 2023 11:12:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLM94-003pjc-2U
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 11:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689592322; x=1721128322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zmCcKDj0kqua2uCgk7585Mo9si14FpG6Lf/f6IUWvEc=;
  b=q7Usl0NkPa9psqLqT2kbAei+8LyNIHLyXq3qltBcX3yXT/He+1nyrD6k
   D89MdyoiQHhUeSnuxwaff1E5izHaRkn7bK2bdh+nWUe/9nf35STLPsKwc
   RLeZ4Nk//FJtus6Vwrg3oqxNR610aTiXX4PP58DFt6xmrONUcmV9HusZJ
   /27Zx60ZSEGXmdq8f+FDxugR1/j7H9tS3UZFVcd1/nz7TDonbnyWhYUcr
   pnIntwXhNZGeLkCCrH/k2TvotX5Z/Al2jUJHbB2xb+GKnIu3Pq7MQiyDv
   3/5IEZfB4NkPe5vTvzuXUO5Pd4rDd3VQV0JSstowV/5p1Ns2l5bhaJHA2
   A==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="asc'?scan'208";a="223433275"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 04:11:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 04:11:58 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Jul 2023 04:11:56 -0700
Date: Mon, 17 Jul 2023 12:11:24 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<vineetg@rivosinc.com>, <bjorn@kernel.org>, <greentime.hu@sifive.com>,
	<paul.walmsley@sifive.com>, <guoren@linux.alibaba.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>, <heiko.stuebner@vrull.eu>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [v1, 6/6] riscv: vector: enable preemptive kernel-mode Vector to
 be built
Message-ID: <20230717-selective-lucid-272c4e74f4ae@wendy>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
 <20230715150032.6917-7-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230715150032.6917-7-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_041202_819052_56F44F29 
X-CRM114-Status: GOOD (  17.09  )
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
Content-Type: multipart/mixed; boundary="===============5619272781729702288=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5619272781729702288==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0B+FtIjybqiTZ+Dz"
Content-Disposition: inline

--0B+FtIjybqiTZ+Dz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy,

On Sat, Jul 15, 2023 at 03:00:32PM +0000, Andy Chiu wrote:
> Add a Kconfig to let user decides whether kernel-mode Vector in a
> preemptive kernel should also run with preemption. If the config is 'N',
> then all kernel-mode Vector code are run with preemption disabled.

nit: "is run".

>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/Kconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a9e8b697fefb..da6a45ea42ec 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -500,6 +500,16 @@ config RISCV_ISA_V_DEFAULT_ENABLE
> =20
>  	  If you don't know what to do here, say Y.
> =20
> +config RISCV_ISA_V_PREEMPTIVE_KMV
> +	bool "Run kernel-mode Vector with kernel preemption"
> +	depends on PREEMPTION
> +	depends on RISCV_ISA_V
> +	default y
> +	help
> +	  Ordinarily the kernel disables preemption before running in-kernel
> +	  Vector code. This config frees the kernel from disabling preemption
> +	  by adding meory on demand for tracking kernel's V-context.

s/meory/memory/

This should be part of the previous patch.

Thanks,
Conor.

--0B+FtIjybqiTZ+Dz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLUh3AAKCRB4tDGHoIJi
0p3DAP9N65xUYMxd9m9CLdZ3Y9XyVbI1wQpIjm1em2fgEnb6OAD/Y+XN8NcSqCTD
6A97Wqh8iC0e23c6/7mttGCVvg+zDQA=
=bz2n
-----END PGP SIGNATURE-----

--0B+FtIjybqiTZ+Dz--


--===============5619272781729702288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5619272781729702288==--

