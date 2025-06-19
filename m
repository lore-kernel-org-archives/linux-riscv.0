Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D22C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 11:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3r4uQUAqQP56dqbQRF1zJtWibpPT5TYTGqkGRYDyzns=; b=aE4xmgn5Rl6qNy65e8GR1jaXXU
	bdr1B8TzW2BUd0pXVQnSsACncj6p2/RyPVrfX8OXUQ/0AAc5nDhXrs1njh4ZlH9lbfyZ8aKviLBos
	d7QN6erLOXtRgZP5fo7S8nV3hiKWXIOi0jxp0CfqZffJfBa+KGDPfpSDG4UuF/eMwczFi3QuRvG74
	SKEXSx2iOuOFX57xPXkIqubF9HyENbNzcmL/Ls6iixx9ehanZ4VYGY4Bp7aN5QvnhLM7KNNVsZjQn
	OvUoOibgkhzeB2SG9jL/HIgMq4tJfPqFXX69KvoJUWjBeSZ1Ffb2RaxxfddDCUn6TUKmbeg5md4aP
	EwVdRAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDRO-0000000Crm8-2fTK;
	Thu, 19 Jun 2025 11:28:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCU9-0000000Ckf9-3df4
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 10:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750328829; x=1781864829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5/aop65CR+vlEsCatlTw7RGHDa9DEji1ocp8kIn0uxc=;
  b=CnXpvMyezVsPUjaAYVSGY0YQG2NqMkIIjsp7CLfGDJUYhLiUIJR5F3Cu
   /ob1xI85fTj4IhEy9smc9HickTOIyYBuZLGVFVDYSfkHcBG7kQai/XoRF
   QS/IyPb/Sj5ySfGWEX1EXzcqRigcpC5oaDxUz42Q2YLZkodOgC4ArPoxZ
   8qKfXFZUwKnYzxZUUlKfP0C84nuoQMY9WRI/MEv68HdMEaT1G1wqBTo+0
   KXRqmAawonLpQ6Z1iA2G5eH7xCrq1j6T+mFM1TUAG1AYLph/8tvb5LCwW
   LGcHNrO2YN6jAfE+fSsV/y+u/anmvxWxdOV2Sgt22AcPX1tzX/NjtIr71
   w==;
X-CSE-ConnectionGUID: M0gjpEXFSBW2SwzkaqjX3Q==
X-CSE-MsgGUID: MLPHmx72S5WWXxMy6v5fAQ==
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="asc'?scan'208";a="210468383"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 03:27:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Jun 2025 03:26:26 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44 via Frontend
 Transport; Thu, 19 Jun 2025 03:26:24 -0700
Date: Thu, 19 Jun 2025 11:25:16 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Klara Modin <klarasmodin@gmail.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <valentina.fernandezalanis@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH] riscv: export boot_cpu_hartid
Message-ID: <20250619-rummage-cache-93f48564b7fb@wendy>
References: <20250617125847.23829-1-klarasmodin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250617125847.23829-1-klarasmodin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_032710_100926_B67FD9F9 
X-CRM114-Status: GOOD (  17.02  )
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
Content-Type: multipart/mixed; boundary="===============0728448212694362117=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0728448212694362117==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K+4uvyVlEFQHzawD"
Content-Disposition: inline

--K+4uvyVlEFQHzawD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 02:58:47PM +0200, Klara Modin wrote:
> The mailbox controller driver for the Microchip Inter-processor
> Communication can be built as a module. It uses cpuid_to_hartid_map and
> commit 4783ce32b080 ("riscv: export __cpuid_to_hartid_map") enables that
> to work for SMP. However, cpuid_to_hartid_map uses boot_cpu_hartid on
> non-SMP kernels and this driver can be useful in such configurations[1].
>=20
> Export boot_cpu_hartid so the driver can be built as a module on non-SMP
> kernels as well.
>=20
> Link: https://lore.kernel.org/lkml/20250617-confess-reimburse-876101e099c=
b@spud/ [1]
> Cc: stable@vger.kernel.org
> Fixes: e4b1d67e7141 ("mailbox: add Microchip IPC support")

I'm not sure that this fixes tag is really right, but I have no better
suggestions
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Klara Modin <klarasmodin@gmail.com>
> ---
>  arch/riscv/kernel/setup.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f7c9a1caa83e..14888e5ea19a 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -50,6 +50,7 @@ atomic_t hart_lottery __section(".sdata")
>  #endif
>  ;
>  unsigned long boot_cpu_hartid;
> +EXPORT_SYMBOL_GPL(boot_cpu_hartid);
> =20
>  /*
>   * Place kernel memory regions on the resource tree so that
> --=20
> 2.49.0
>=20

--K+4uvyVlEFQHzawD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFPliwAKCRB4tDGHoIJi
0lPyAP9gMiXsh08benYHPcPqTgNhjeE8a5n+yyRd3aZZYh0GYAEAhTEaO5q5d/2f
cvx/ry5nKYC8JqWHaY7wNNuGitftMgY=
=dTnR
-----END PGP SIGNATURE-----

--K+4uvyVlEFQHzawD--


--===============0728448212694362117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0728448212694362117==--

