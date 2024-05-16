Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB092C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 06:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFUg7/H2js9KdceAhnfdKtebqKEuePRSI3GNI9LCkg8=; b=jDD7FJpH825i9Eka83WfyNi0PE
	ibhZwYj24JGeYc29c5KgJPWLJ6B/CGpeQyByzCOQJYySL3RFqFr6nFUpd5cIACigalh7RuAdTUkHV
	QA6LyIQBW2kErZrvj03etoWLtqR5pa3w9rcf6WvehP8Y2EzYMMW0LHXHvKTNVfU+NYHnKZkO6USNM
	LpuPmN6AR994i1sWCpM/7T9Ara2Gec60djXbgvFQyCD0cVYaU8tiSpu5a/fFQm/WONaZhPR8JP+Ri
	uaXNiEvij4RMUZlPf1CJ+h7PiEV+Qr6tI7fND3PpxlwukVtr6S8laIO/q4jQVj87uzPwakcpkv8Yk
	Tir1T52A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ukf-00000003tCn-0bjP;
	Thu, 16 May 2024 06:38:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ukc-00000003tCE-2Tax
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 06:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715841482; x=1747377482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9IbxgxangNBjD9bGDiYx5CbaIdSHkDnezGEsV/4dPXk=;
  b=lHM3+r0m8on6G0Cpllowa58Cojmn252lSoWhZswmh92xPw9dBdgwp8rF
   SqfMPhdYCBaWT75J7oqITSoOlWx0GBVK9b0Y+7epPBsfz14/LjQC/hLCw
   eZx7gm3Nie3jloz2EvV6lAbOptYw/qLat8erzWXHevIygIaaBdL6Ss3Lb
   DxKC0t7lDl2SxYPsfti7FeoObVCAfqUbpYpg+BhLkHfMxAD0uNVkY7yGu
   VLVNhmNZds5+gd1P+U0tNbeo9yFxQh0GhpbzwwfVW/N1fJgHen7vSUD3s
   s/wvymjet41mUYuBOzAuWsnF5q/pGzWKUB9ZZbF0tpkmwDk+MSWAz+n0R
   g==;
X-CSE-ConnectionGUID: qGyYzRZvQFOwTFEAoDhGCQ==
X-CSE-MsgGUID: fF4CylFhTS+np7Tk6xNJgg==
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="asc'?scan'208";a="192311659"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2024 23:37:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 23:37:54 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 15 May 2024 23:37:52 -0700
Date: Thu, 16 May 2024 07:37:38 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<xiao.w.wang@intel.com>, Andrew Jones <ajones@ventanamicro.com>,
	<pulehui@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] RISC-V: separate Zbb optimisations requiring and not
 requiring toolchain support
Message-ID: <20240516-daybreak-keenness-95f165d98ca1@wendy>
References: <20240515-hedging-passage-44fd394ab1be@spud>
 <ZkWSioeSHh8p3pxM@ghost>
MIME-Version: 1.0
In-Reply-To: <ZkWSioeSHh8p3pxM@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_233802_778951_3A70675D 
X-CRM114-Status: GOOD (  15.79  )
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
Content-Type: multipart/mixed; boundary="===============3754011370890475362=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3754011370890475362==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I6CAVCoCeGlCV3zX"
Content-Disposition: inline

--I6CAVCoCeGlCV3zX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 09:58:50PM -0700, Charlie Jenkins wrote:
> On Wed, May 15, 2024 at 04:27:40PM +0100, Conor Dooley wrote:

> > diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
> > index 8ae3064e45ff..3ab1310a7b83 100644
> > --- a/arch/riscv/lib/strlen.S
> > +++ b/arch/riscv/lib/strlen.S
> > @@ -8,7 +8,7 @@
> >  /* int strlen(const char *s) */
> >  SYM_FUNC_START(strlen)
> > =20
> > -	ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV=
_ISA_ZBB)
> > +	ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV=
_ISA_ZBB_ALT)

> I am missing why these str functions are changed to use
> CONFIG_RISCV_ISA_ZBB_ALT when the __arch_hweight* functions were left as
> using CONFIG_RISCV_ISA_ZBB in their alternatives.

I don't think I missed anything in the __arch_hweight*() functions,
their final argument is 1 and they are not conditional on a config
option as the whole block of code they're in is wrapped in ifdeffery:

# ifdef CONFIG_RISCV_ISA_ZBB_ALT
	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
				      RISCV_ISA_EXT_ZBB, 1)
			  : : : : legacy);

Cheers,
Conor.

--I6CAVCoCeGlCV3zX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkWprwAKCRB4tDGHoIJi
0j+VAP9FBdovBIV1EfkfOq2ItigNKUkCb9ju651I7qWvhIV3yAD/Wxx+umEj3IGD
YZjVYKJFMMJsW+EeEb/sKCTEv5p0MQk=
=8Ddb
-----END PGP SIGNATURE-----

--I6CAVCoCeGlCV3zX--


--===============3754011370890475362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3754011370890475362==--

