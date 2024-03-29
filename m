Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE94CD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 13:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/E0ijljSt16lm5OK4bJvE9VQMhN//R+57XSdbdLDg3E=; b=cUWR+LqTGK/C+Lp88hhJJQhC4C
	SL/BpYVKvV4Hszs9eJDq4khblIWiENsTzyzVi1eEAbSb3kzjDE+LPPiUM7guUH33frZlDblGDHePf
	5ehlD/FJeVI2M3DBxHg44QJ9zt+hKq6DD8VECwqYjkGrynO4N34l8Q+vx4/LYXRgLey1KWfWTEFv5
	Df2bQIWlWrrRDKU+2xSsYAb8RVOOnmKSuyCgtk+aq5WL98KOE56nglLZTAYPsfB/VusHnRTrKIhnw
	xEqDT3ha/NVF2mzI72+ipy17+XsgLtNV3he0z7cJh8tS81g8BPpnCuBMLfkh2WRACXa87+t8jgw1u
	nvWCfcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqCDP-00000000dfm-3aHh;
	Fri, 29 Mar 2024 13:24:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqCDM-00000000deP-40f0
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 13:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711718652; x=1743254652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aXup8KWJAj2QvVahnfl4RMj2Q6ACNjtWp9+p5ElJHPA=;
  b=tkMzFuiXW2pIhTU2Yc+7RvoVdx8Qi+xt6EpxvDPtT1IQz9eDgwfe0LYj
   RwAD6BD9ZT5g3hIBGTZS9oFoV6vjwn+dqxOaOg/LP4asouBIInr42fGZM
   ujd8JGeS3GTNJ9vkeczkG84A/6v1BZIYRtNLG8vCAJE4EqJq/z2wu5ZqA
   yoxJVxh+/g31pPpAg3wFDEpVrGLbAApr0Y9b0Yz3vkbNylxFuAMH/4uIa
   jd9fnOhASe1nvQhkGWPQFnbq956gV9OQiHOpL58YtjqcWbkgG4eAI82+a
   1JEYAwkSyLDIkq82J3Mg/OiU1kGnOy5Ui3axFjFrFXUTUE1vytfsXF14B
   g==;
X-CSE-ConnectionGUID: S9I4gR9kTZqZgK/51NXEag==
X-CSE-MsgGUID: 8EkbdftRSnOWZR9/iYtXeQ==
X-IronPort-AV: E=Sophos;i="6.07,165,1708412400"; 
   d="asc'?scan'208";a="18605614"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Mar 2024 06:24:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 06:23:45 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 29 Mar 2024 06:23:44 -0700
Date: Fri, 29 Mar 2024 13:22:55 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: <victor@torrio.net>, <linux-riscv@lists.infradead.org>, Victor Isaev
	<isv@google.com>, Ivan Komarov <ivan.komarov@dfyz.info>
Subject: Re: [PATCH] [PATCH] Update the size of auxv to respect the new
 constant added in e92f469b0771e6db9688a58c0e34a8342da6a6bc
Message-ID: <20240329-persuader-series-0a3e9817007c@wendy>
References: <20240102133617.3649-1-victor@torrio.net>
 <38be1ab1-a080-4d89-a9c6-9837f7fad4ec@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <38be1ab1-a080-4d89-a9c6-9837f7fad4ec@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_062413_084776_8633C491 
X-CRM114-Status: GOOD (  24.09  )
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
Content-Type: multipart/mixed; boundary="===============6546825353270576137=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6546825353270576137==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tjepo/RJUxFMXPvv"
Content-Disposition: inline

--tjepo/RJUxFMXPvv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 01:25:48PM +0100, Alexandre Ghiti wrote:
> Hi Victor,
>=20
> On 02/01/2024 14:36, victor@torrio.net wrote:
> > From: Victor Isaev <isv@google.com>
> >=20
> > Commit e92f469b0771 ("riscv: signal: Report signal frame size to
> > userspace via auxv") has added a new constant AT_MINSIGSTKSZ but
> > failed to increment the size of auxv, keeping AT_VECTOR_SIZE_ARCH
> > at 9.
> > This fix correctly increments AT_VECTOR_SIZE_ARCH to 10, following
> > the approach in the commit 94b07c1f8c39 ("arm64: signal: Report
> > signal frame size to userspace via auxv")
> >=20
> > Reported-by: Ivan Komarov <ivan.komarov@dfyz.info>
> > Closes: https://lore.kernel.org/linux-riscv/CY3Z02NYV1C4.11BLB9PLVW9G1@=
fedora/
> > Fixes: e92f469b0771 ("riscv: signal: Report signal frame size to usersp=
ace via auxv")
> > Signed-off-by: Victor Isaev <isv@google.com>
> >=20
> > ---
> >   arch/riscv/include/uapi/asm/auxvec.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/=
uapi/asm/auxvec.h
> > index 10aaa83db89e..95050ebe9ad0 100644
> > --- a/arch/riscv/include/uapi/asm/auxvec.h
> > +++ b/arch/riscv/include/uapi/asm/auxvec.h
> > @@ -34,7 +34,7 @@
> >   #define AT_L3_CACHEGEOMETRY	47
> >   /* entries in ARCH_DLINFO */
> > -#define AT_VECTOR_SIZE_ARCH	9
> > +#define AT_VECTOR_SIZE_ARCH	10
> >   #define AT_MINSIGSTKSZ		51
> >   #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
>=20
>=20
> So we discussed this patch in the last Patchwork meeting, and it needs to=
 be
> merged as it is a valid fix. But, the subject is wrong and then the patch
> can't be merged as-is, can you respin another version with the following
> subject please:
>=20
> riscv: Fix the number of arch-specific auxiliary vectors
>=20
> Or something that best suits you. No pressure, but if you don't, I'll res=
pin
> myself a new version keeping your SoB of course.

I think what you missed in the Patchwork meeting is that Palmer manually
fixed this up and it is on fixes:
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=
=3Dfixes&id=3D13dddf9319808badd2c1f5d7007b4e82838a648e

--tjepo/RJUxFMXPvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgbArwAKCRB4tDGHoIJi
0mSmAQCPhX9IPuEwU3z57VrWTuV4OCoAKVgw5t7lAIVcg6kQNgEAl7amDKu9sgiA
KjON7/bhJ+NnDm38y944T0QxPA1ixQE=
=3bK/
-----END PGP SIGNATURE-----

--tjepo/RJUxFMXPvv--


--===============6546825353270576137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6546825353270576137==--

