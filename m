Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD69EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eabpnIpZqN9BVUxhWcf5RU2rUxVUWDn573eqqis4n4k=; b=DGfPcyTRuZu2m6stALXnR7bxls
	gcDsXIfZXy5aUyweuFS5bW4e1f5QEjJkBDORHgAUbUxe+P5XdWbhdU+UhUfuh7aeJj0/Jmz2Li5RY
	SJ8IZPG1uBax0fQ29xOkaqOP8N7yae9D/3F7VyMaxEKyLr5yKFAH7Y9H+u4MkS+y04ZsoGI0Jne6S
	47vTBxiMteqZx2j4BFA6AJDjDqx/D+azoDoScQHjId2LmrY02b9y/bCbYOp8WZUWCHdhgzdFKffgr
	QT+BC8XyVolbSOIcGzS9VDFKmzFzYNaTCYFBy/xje/6i4ktTHAihLenNU1xxEZQcrKkS9Ei/09/Uj
	P21+L5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqqt-0016DJ-2p;
	Thu, 29 Jun 2023 12:34:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqqq-0016Cg-1x
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 12:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688042060; x=1719578060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V3orB8X2pnGHKa4XQHvRaYEdUceUMOeLKtK+nBaNFd8=;
  b=Cq3m0wKL5ftIk7Q98ZHuGr1ZpIwXWpKzCfqqclo8wyGgSOPuUUigPROH
   7h3+UgybnfzdGit2wNkeDTszUQXRu82qb/s9WEZ8DKkLNWYBObwCfW6OY
   RszA4AUqEAx0EoTN3PdN8z5vkcNnmZMtM0G/daXKiAlsFKIt6sbJftUYA
   51bxyAsLjR6mS8oAepWutXQNSll3P7AQkqg7cGksb3VaTlDTy1FLa31tr
   3seQF+UEvWE8jOH3Y6Cp3eritNkyecAf7XOgDFDQigiTN3Hmv19iGNRZ6
   D1kdgHQpZhr6dDMNU/VIl/ijXPKqsijfMRaeytLNDbasrq7XMPpaCHwpT
   g==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="asc'?scan'208";a="220483366"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 05:34:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 05:34:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 05:34:17 -0700
Date: Thu, 29 Jun 2023 13:33:48 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Song Shuai <suagrfillet@gmail.com>
Subject: Re: [PATCH] riscv: BUG_ON() for no cpu nodes in setup_smp
Message-ID: <20230629-maverick-kelp-17327f04482a@wendy>
References: <20230629105839.1160895-1-suagrfillet@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230629105839.1160895-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_053420_903998_626945AF 
X-CRM114-Status: GOOD (  25.27  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, evan@rivosinc.com, paul.walmsley@sifive.com, greentime.hu@sifive.com, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
Content-Type: multipart/mixed; boundary="===============5865798757375079805=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5865798757375079805==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+Xe4Uyu39cOMQrN6"
Content-Disposition: inline

--+Xe4Uyu39cOMQrN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, Jun 29, 2023 at 06:58:39PM +0800, Song Shuai wrote:
> When booting with ACPI tables, the tiny devictree created by
> EFI Stub doesn't provide cpu nodes.

What are the conditions that are required to reproduce this issue?
When booting with ACPI, why is acpi_disabled true?
In my naivety, that seems like a bigger problem to address..

> In setup_smp(), of_parse_and_init_cpus() will bug on !found_boot_cpu

Please, s/on !found_boot_cpu/if the boot cpu is not found in the
devicetree/, or similar.

> if acpi_disabled.

Why would of_parse_and_init_cpus() be called in any other case? There's
only this one caller, right?

> That's unclear, so bug for no cpu nodes before
> of_parse_and_init_cpus().

What is unclear? That the reason for the BUG() was that there were no
cpu nodes, since it could also be that there were CPU nodes but they
were disabled etc?

> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>  arch/riscv/kernel/smpboot.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 6ca2b5309aab..243a7b533ad7 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -187,8 +187,13 @@ static void __init of_parse_and_init_cpus(void)
> =20
>  void __init setup_smp(void)
>  {
> -	if (acpi_disabled)
> +	if (acpi_disabled) {
> +		/* When booting with ACPI tables, the devictree created by EFI Stub

This is not netdev, please use the correct comment style :/

> +		 * doesn't provide cpu nodes. So BUG here for any acpi_disabled.
> +		 */
> +		BUG_ON(!of_get_next_cpu_node(NULL));
>  		of_parse_and_init_cpus();
> +	}
>  	else
>  		acpi_parse_and_init_cpus();

checkpatch should have told you that you now need to add braces on all
arms of this statement.

Or, better yet, move the whole thing into of_parse_and_init_cpus() in
the first place? You could drop most of the comment in the process,
since I think the details of how you hit this problem would likely not
be helpful to anyone that hit it under different conditions.

Cheers,
Conor.

>  }
> --=20
> 2.20.1
>=20

--+Xe4Uyu39cOMQrN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ16LAAKCRB4tDGHoIJi
0kjfAQDJJ0vTpSJCysk3tWFZuO7Zk8aSbHHO0s+tldla0nXdZAD5AYH55vxAQeSf
VUtbo0CsM0uDGuFly0pPfOcvM0iKOgA=
=JAVg
-----END PGP SIGNATURE-----

--+Xe4Uyu39cOMQrN6--


--===============5865798757375079805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5865798757375079805==--

