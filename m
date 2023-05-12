Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AED1C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 13:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmWORVycorln8I/DQR38zlJU3Ik1apAJLeFiHbaJz7k=; b=XaA0PoGPZHs5e0YzDTN0XJaZpM
	x6gw8y8tq6b9QainnLSoO5YfdLOR26y18kV3woNl8JabquMZqbh5aCtNPFxBLaH7ObJijdiq18Cgu
	oQM+wBg7nXa/lHtO7+zLaYtBhh3ov5NKW5DaSoZZUYWfCWWDSDGzVWPo1KKFKHY4ePa/MiZZ4TacJ
	+ghfC/NHqr5y78m0uHlmrwS/zCKF+X3OJdGLU+wds7mdaznU2zXPQLcdEhXhRy+KvshIxJv6WyJNy
	W201IHW5mca57szvCe3UoR5xHUkXFiZt33zjzkDosWO4GzQ9xCUgcF2V4EP9YxmE4BsWDvcDzN+ie
	Ad5J7K+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTE7-00C4t4-0l;
	Fri, 12 May 2023 13:54:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxTE5-00C4sQ-04
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 13:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683899669; x=1715435669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fKA8Wz0olEp08ryiuI9Xy2pZsT93duPTdIQf+NSHyVM=;
  b=y04/M6z9+4THv84Xllfp2O4D7OWLq5Towz3qlfw1JnYR/fr393ch4F2c
   JZdNjp1VdHV+XrXKPDOmk9alRPOGyUwAowT7gpImeyTOhlXL7jrlGfYor
   ui6iEy85u4McB4MVBzzZYW23GiPSI9AIosqdUzvmvacZi5Ksu+DI/o0Yh
   4qA340R5Opi33biJd1fpEFjF3nohg+Qh0a9fkQNNMqlkj+9BK92OAqTVT
   hchn/9eJDJLjGcIPHEnFlONeUBDRuuoRptrtY2IeNI53jXYMcq/qMVI5K
   A7V3ifhZC5ty8N8FVdVfngXlhYrJjC1c5klfxHbYpy6umt4ZWVdN79WLy
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,269,1677567600"; 
   d="asc'?scan'208";a="210975834"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2023 06:54:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 12 May 2023 06:54:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 12 May 2023 06:54:23 -0700
Date: Fri, 12 May 2023 14:54:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann
	<arnd@arndb.de>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>
Subject: Re: [PATCH 2/4] riscv: move HAVE_RETHOOK to keep entries sorted
Message-ID: <20230512-humming-nebula-247ccd45674c@wendy>
References: <20230511141211.2418-1-jszhang@kernel.org>
 <20230511141211.2418-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230511141211.2418-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_065429_119933_23758DE4 
X-CRM114-Status: GOOD (  15.78  )
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
Content-Type: multipart/mixed; boundary="===============4688592020413210410=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4688592020413210410==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qxL1yz6psSH+KTHa"
Content-Disposition: inline

--qxL1yz6psSH+KTHa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 10:12:09PM +0800, Jisheng Zhang wrote:
> Commit b57c2f124098 ("riscv: add riscv rethook implementation") selects
> the HAVE_RETHOOK option for the first time in riscv, but it breaks the
> entries order. Properly move its location to keep entries sorted.

The entries need a rework in general, but it's only really worth doing
the whole lot during the merge window to avoid a rake of conflicts.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 348c0fa1fc8c..f0663b52d052 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -110,7 +110,6 @@ config RISCV
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>  	select HAVE_KRETPROBES if !XIP_KERNEL
> -	select HAVE_RETHOOK if !XIP_KERNEL
>  	select HAVE_MOVE_PMD
>  	select HAVE_MOVE_PUD
>  	select HAVE_PCI
> @@ -119,6 +118,7 @@ config RISCV
>  	select HAVE_PERF_USER_STACK_DUMP
>  	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
>  	select HAVE_REGS_AND_STACK_ACCESS_API
> +	select HAVE_RETHOOK if !XIP_KERNEL
>  	select HAVE_RSEQ
>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
> --=20
> 2.40.1
>=20

--qxL1yz6psSH+KTHa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZF5E+wAKCRB4tDGHoIJi
0qIkAP4h1wGTMEuPQYUmv5MtUZW0KshBDKL0NAIFpcdNpWbPXAD/bnHmXzCccO7b
vu3eMlCL4qwuQmizdGLUuA36jpHjhQA=
=DvPo
-----END PGP SIGNATURE-----

--qxL1yz6psSH+KTHa--


--===============4688592020413210410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4688592020413210410==--

