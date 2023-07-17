Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92E9EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 08:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzDA6lt082SVRy12aclbszBaxv6RqYuxRxjvq0Xfz6E=; b=svVq3lFR/MuEzhTK67Xj7WkBsV
	V+3vceqAj9uKWtu56ibFDQIFZUgJVuRJ+PQeewbiowTVY4WLT61PMbmAyz+15oDDhuSJbdkohvtvv
	B5v+5rHAJlC2sJQeUtvTnSCK03CByd0WHk7fSu4tiV5EFernLTptgPwkR82D7hIL7OyUybmbSBkBi
	4whQ8hnOSvcfEykoz5a7YOM+5zcY22na20qyVR8a8kRhNZRAOGZGisdFi6bM4+4k+Odt/qRJt6EcC
	M9QC1aQr85pZOjTTa8rUJR7sFCIm0U6KR9AmvoatblgE8mFzjfu3rIfwiLud3p39abBYN/Pxi9yfp
	ZlS8ydsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJNh-003R5O-2D;
	Mon, 17 Jul 2023 08:14:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJNY-003R2r-0Z
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 08:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689581688; x=1721117688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GiPwvl5IyiPlcPEFo50ZA45sK7nt5VZx1UMduNOcbOg=;
  b=ONJk6qxb128TUCqG/aQmmSkf8AXz8Eq4MtYspZlzHjEaZYQNkCNjmxur
   DyekhUDzHHzFAn+AR/xt1kcqcifqLSIdgDzAK0QLdtXUFjWlKTGQIbUpB
   FWuC760yv5/8FBGSKIG8zEI1jS5RmP7+QK+z0fArmdSBdXW3bhmEuuEQ5
   30wWV0BsKucwTyW4tNhZxzn/kgAlgjjUfoXiQvPFtrkudFUuwuUH316XJ
   q0n1bI3KTSKClwAvRnEIHnTeA2g1KGdGGOTR6mwe4FJLqhycJqIKvI59a
   IqLaoRNNgDFAYVo1tNYSEv9p4RfaDarR/cj/vrQ25i5A16cH1BeVVyZS7
   w==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="asc'?scan'208";a="224157965"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 01:14:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 01:14:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Jul 2023 01:14:34 -0700
Date: Mon, 17 Jul 2023 09:14:01 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <hanyu001@208suo.com>
Subject: Re: [PATCH] riscv: kernel: insert space before the open parenthesis
 '('
Message-ID: <20230717-scone-stalemate-ec749798275b@wendy>
References: <tencent_7D5EADDF79970079F568A5C4F801910DED06@qq.com>
 <b90d162c4fb8062355634fb53b05173d@208suo.com>
MIME-Version: 1.0
In-Reply-To: <b90d162c4fb8062355634fb53b05173d@208suo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_011448_345038_73E1B8CF 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: apatel@ventanamicro.com, vschneid@redhat.com, aou@eecs.berkeley.edu, maz@kernel.org, atishp@rivosinc.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, ben-linux@fluff.org, paul.walmsley@sifive.com, guoren@kernel.org, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3766181001180764012=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3766181001180764012==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U4xOE9QBFvXHxi7W"
Content-Disposition: inline

--U4xOE9QBFvXHxi7W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Jul 17, 2023 at 04:06:11PM +0800, hanyu001@208suo.com wrote:
> Fix below checkpatch error:
>=20
> /riscv/kernel/smp.c:93:ERROR: space required before the open parenthesis =
'('
>=20
> Signed-off-by: ztt <1549089851@qq.com>

See:
https://lore.kernel.org/all/20230717-gummy-frisbee-2f7dbe9f9512@wendy/

Also, DKIM is failing for the 208suo address :/

Thanks,
Conor.

> ---
>  arch/riscv/kernel/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 23e533766a49..1454f2415b7f 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -90,7 +90,7 @@ static inline void ipi_cpu_crash_stop(unsigned int cpu,
> struct pt_regs *regs)
>          cpu_ops[cpu]->cpu_stop();
>  #endif
>=20
> -    for(;;)
> +    for (;;)
>          wait_for_interrupt();
>  }
>  #else

--U4xOE9QBFvXHxi7W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLT4SQAKCRB4tDGHoIJi
0nPOAQC0Dfwwdu7s6Z/RZ3lSf0VzTVpe2NTrthyXqwm1LeFymwEAgMiTZZgkfsFl
txpikNMpNCe2vYXJPFx3ozXOLs5fKgc=
=2m/o
-----END PGP SIGNATURE-----

--U4xOE9QBFvXHxi7W--


--===============3766181001180764012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3766181001180764012==--

