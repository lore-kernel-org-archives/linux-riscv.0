Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9ECC7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 13:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNk6KoyuLDqxsWlgTs/CMMsE6NRJ7czxyGXjqIKq3jI=; b=enQdxKaIZk9GtKzvuzhQEupvE6
	1IDAGefOj4q1pBsyoU5gTAATnWt5p/JcpfXyo59MIWKxw8VRSbj3nsRiTLHX77djh87XeUztzxVg1
	mJeistRoCKWoCyJYyq9jtjatK3Ci+8qD3euitV4VidpDOheyp+YWtl0ENOrC8pv7IdtqthQsGszwO
	jASSWjNyELGZ8mvjPL11bFXUN2TQIgEsVPf10EcX58GelDq15DGtimJ/rZWpl1cI1Kcmww9X4o1NN
	DKyc4oa7xlt+9pBoclLWmJBElFstcSrX+so2me4EWJbGUoseFwSGlRmxwRgYRIKXQAGNaR3ki72Zq
	PeEex7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3d9L-00AdMk-0W;
	Mon, 29 May 2023 13:43:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3d9I-00AdLa-0n
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 13:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685367780; x=1716903780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lck7HYWXjUv9FzYPBUbNMYKle2RKHVZNP7rTsjD50t8=;
  b=MSqOIGIaPPrtHxsOqzTtg3Ut8HcTkRsMZvIaC+esnYy+p/FMp5hXr/w7
   4Ou/6Ebz00V+dBe/IY1Ocmv2kMrpZjD+Q6jsGggLtOvGhnvka7L/s/UWH
   5hvDu+WIu0vbl49M4wv7EUALXOTefyFbP5C56xlpfCPZkDvbG+c7KwmES
   Wl0ueZeREPbLTSjb/QFcb0bPLRRuX5FDMNTYzFRur40LV6PN3WBV8VcKm
   fnlxQMS2N92xh5uOYrPzYP3OpZEZnnWImRelpazdoHkyWzCzbixoCUFrA
   +DKDInG8t9MDmhaXpJUONaEn4c0o9p9pNh/dvlMgq1kJi7IJdQ0cgIMkk
   A==;
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="asc'?scan'208";a="215318630"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 May 2023 06:42:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 29 May 2023 06:42:59 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 29 May 2023 06:42:57 -0700
Date: Mon, 29 May 2023 14:42:34 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: <guoren@kernel.org>
CC: <greentime.hu@sifive.com>, <vincent.chen@sifive.com>,
	<andy.chiu@sifive.com>, <paul.walmsley@sifive.com>, <palmer@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Guo Ren
	<guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: vector: Fixup modules compile error
Message-ID: <20230529-jasmine-amigo-6d01f6852b35@wendy>
References: <20230529073845.2859178-1-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230529073845.2859178-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_064300_296858_BB44103F 
X-CRM114-Status: GOOD (  14.25  )
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
Content-Type: multipart/mixed; boundary="===============4843061459259790225=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4843061459259790225==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="akcCoxLpoL7TwvtM"
Content-Disposition: inline

--akcCoxLpoL7TwvtM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 03:38:45AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> Some .ko also need the riscv_v_user_allowed symbol.
>=20
> ERROR: modpost: "riscv_v_user_allowed" [arch/riscv/kvm/kvm.ko]
> undefined!
> make[3]: ***
> [/home/guoren/source/kernel/linux/scripts/Makefile.modpost:136:
> Module.symvers] Error 1
>=20
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/kernel/vector.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 1c4ac821e008..3ae08816d608 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -129,6 +129,7 @@ bool riscv_v_user_allowed(void)
>  {
>  	return riscv_v_get_cur_ctrl(current) =3D=3D PR_RISCV_V_VSTATE_CTRL_ON;
>  }
> +EXPORT_SYMBOL(riscv_v_user_allowed);

Is there a reason that this should not be EXPORT_SYMBOL_GPL()?

I figure Andy will roll this into this next revision..

Cheers,
Conor.

--akcCoxLpoL7TwvtM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHSrygAKCRB4tDGHoIJi
0oWoAP9FuWiLyHszPu/BNFTA31PQXq1uTLNjgff7dnZJXmDsRgEArXKuxMpe5bLA
ojf2vGH2BafRIK0+zNrThRf2a3sfqQo=
=YVAK
-----END PGP SIGNATURE-----

--akcCoxLpoL7TwvtM--


--===============4843061459259790225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4843061459259790225==--

