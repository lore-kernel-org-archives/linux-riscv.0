Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2331AC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYs8QOvsNjOWZzkRTunkz7DCxjWtQdKlAaGBZCvIXpU=; b=wjoq+NIuZpOrzUirYBXFQwDQzO
	T2RC25sO35LMUi7rQVIRav46sNxtciCYAUbxjP1+5GF0buHZ9xSZ4egYnMTBJNBk+8e7P42Zdifqd
	HmwfOxPh081boeI/VEa1hGeaZYvqLEmVpmruh6SNnwISTjWCGJYVpidFeKT2bFbwyvg0szFS0zyl/
	hqColhOV6R68oz7F53G218/utAgBSMzy9S1hxDe9oAvG4JWQSqL93KnbvPIVz9hNzTrFY0ztOLRaz
	JIFF8YYLvqiZTJsJfHUtEkXC76Jw1DcLjOOnlddSYqQY7Oa4ci4hGpM5W7arwliExw6Lduil/R882
	K+Rm3E7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WyH-00000004Evd-3jga;
	Thu, 16 May 2024 09:00:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7WyF-00000004Ety-2loj
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 09:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715850016; x=1747386016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DoekEA5xBBqpthARG5DKlf+VJobDj/Eoe+rOBWUFrbg=;
  b=LSTtOTIMCtiK980dVZu2xY5mBgaK2EIjOpo70sLclUX7bcPlkYu1dxfg
   A9MqKfTXyD7EddS3gG0s90Xh7npigle/mV1KJZ/W9ABoavF3yx+DUGrda
   nuCHlxSxycisTnqF73UUD9N/khbQPuFr74ybk1ulRnemOpedH4D93sPyL
   B1p8sWwt9ytArlWYyN9V12hM8yc7MP+nHB65i47g/sEPy6rYOzyyONZvu
   wnolZndLRfiW1XU2P3kqAosh5BkHgEamzR7lNA4xSr8DK0K9BYsP2bKRF
   hZUy407kT0PnG3rJ0HoTgnDculi/RETZIVzLnBA40DBwrCmSu+LM2y/Y9
   g==;
X-CSE-ConnectionGUID: 44sAXBHNQGSSIAoZ8s+36g==
X-CSE-MsgGUID: X+ZakUmORtWSOstulPdrVg==
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="asc'?scan'208";a="255817437"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 May 2024 02:00:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 02:00:00 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 01:59:58 -0700
Date: Thu, 16 May 2024 09:59:44 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<xiao.w.wang@intel.com>, <pulehui@huawei.com>, Charlie Jenkins
	<charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] RISC-V: separate Zbb optimisations requiring and not
 requiring toolchain support
Message-ID: <20240516-speller-target-d453ad060486@wendy>
References: <20240515-hedging-passage-44fd394ab1be@spud>
 <20240516-7ff4001c9f2edd2a61775244@orel>
MIME-Version: 1.0
In-Reply-To: <20240516-7ff4001c9f2edd2a61775244@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_020015_782873_B5FC4F0A 
X-CRM114-Status: GOOD (  19.70  )
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
Content-Type: multipart/mixed; boundary="===============6374403021938049726=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6374403021938049726==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="imfjeleD6eCBdD1o"
Content-Disposition: inline

--imfjeleD6eCBdD1o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 09:59:44AM +0200, Andrew Jones wrote:
> On Wed, May 15, 2024 at 04:27:40PM GMT, Conor Dooley wrote:
>=20
> So the new hidden config is a shorthand for
>=20
> #if defined(CONFIG_RISCV_ISA_ZBB) && \
>     defined(CONFIG_TOOLCHAIN_HAS_ZBB) && \
>     defined(CONFIG_RISCV_ALTERNATIVE)
>=20
> which is reasonable to add, since that's a mouthful, but I'm not sure the
> name, RISCV_ISA_ZBB_ALT, does a good job conveying all that.
>=20
> If we instead just dropped the 'depends on TOOLCHAIN_HAS_ZBB' from
> config RISCV_ISA_ZBB (keeping the 'depends on RISCV_ALTERNATIVE',
> since nobody is really complaining about that), then we could change
> this to
>=20
> #if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)

Yeah, I think this is a cleaner solution.

> >  	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> >  				      RISCV_ISA_EXT_ZBB, 1)
> >  			  : : : : legacy);
> > diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/b=
itops.h
> > index 880606b0469a..3ed810a6123d 100644
> > --- a/arch/riscv/include/asm/bitops.h
> > +++ b/arch/riscv/include/asm/bitops.h
> > @@ -15,7 +15,7 @@
> >  #include <asm/barrier.h>
> >  #include <asm/bitsperlong.h>
> > =20
> > -#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE)
> > +#if !defined(CONFIG_RISCV_ISA_ZBB_ALT) || defined(NO_ALTERNATIVE)
>=20
> nit: It's sufficient to check !defined(CONFIG_RISCV_ISA_ZBB), so no need
> for this change or its #endif comment change below.

Are you sure? I did test leaving this as-was and it broke the build for
llvm-14.

Cheers,
Conor.

--imfjeleD6eCBdD1o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkXLAAAKCRB4tDGHoIJi
0mdCAP4k64AOQkHw9Y2P4/kfHnxYOv6lwItSSqAKWjUhGXo68wD+OKcRKjtDJPM7
SRUdK3yi9L9Fr7Anrbe3LVNbURswiQU=
=o+IN
-----END PGP SIGNATURE-----

--imfjeleD6eCBdD1o--


--===============6374403021938049726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6374403021938049726==--

