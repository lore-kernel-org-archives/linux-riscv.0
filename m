Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA95C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 11:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wt6EJZnz+7mOyRXsxfCnWAcqXxSpdaXDO7JZQKk7BI=; b=h+vyRqufjo0pvwSzXJnWJqTfN1
	YHswzUVo1w1LAr7PrMBamPCPex2fzS67Ce/NX8Mi5iB8hc2unCfnM60P/z9wf7T8yMBZxYs6JWI6/
	jue1oW30RCsaV0xPoNcg51SWw0nD263Je/Jfnqf2wjeFnnLbV2n6UfseWCwfflBiEeDgB0MocNvzj
	8JfPEwlDYIz2zmOoB+91lDNr125V1gf7RFOXv2Yci0XBrlQ3ZVb9SMNT72TuIGC9C4a8V/OAC+o/J
	acoavGGMxII6FU2WPmQ3RSryqMMl2DtMbceLWk7QDYkAoR6KwTpwJBTck2fwziLQ9Ft1dd+8F/1l1
	nSpCVHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppp98-00Akat-1O;
	Fri, 21 Apr 2023 11:41:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppp96-00AkZI-13
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Apr 2023 11:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kS5EP+7ZhivNvYLmrBUgKtd3zGY3KC6gFkJqU+QP1Ls=; b=FjMvvcEVMSiFooAikiztCqCn8P
	63q4Wh786VWsdVOes3gi4pewttqAFgmDE9BR9+0G661JdmFZDeoyfPX9OUsXY4OVXOFx1gcvRkHtt
	Zn/6W0KQt8sKItP3KLLjuAjebNRel5GpUKVs1+yuJQzklkz9S9Pj3oxGMY9r10YN+JilhIAvud114
	ooDa7A6TMLPgAb8KNZ1qHT0KqAbkSBa15ogEiDWqRmuEpi0f0YyackxGSgWnxC1gfnsTglFFFdqrc
	IED5tlpZxqYz1NfHGPVudrFDcaw6zgEpQul+WHMnWKkTgnAf+fux6hDmib9ToWYU/uxBDsAZz+iHG
	DYnfjnwQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppnAf-005F1d-1Y
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 09:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682069714; x=1713605714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NV8VuiK+tse/d3eCoBhWoB+mn1ohvI8raF4dIfXPw7Q=;
  b=vwJynfuhXwOjyeRMbzQoVkVRg8AgHQ8EdvgxfKNx+qaC+2T88zQ5aTri
   od5I2a1YhRdk1wlGGxXzDsGUIZVetkc+bNkqWE5sUr2bOfOaH2mba19vi
   hOWeDb0zA5sHEvEVpwE/VG05hvkd77ASOvPPUZrYo3LJG/ZHD6k5QgiBz
   pJdOGSH2DTuFq2wzUU1YCLQ1G4TUQF9tNUZFNrZKpiQ3EBgrMhcuW4deA
   cM7xTQieWvHrUzcQWTcQI6b6yrmul5RYdTRRPUWdYyELlTcJZz5+N4eSQ
   5IGjhGLod8B1QsVvWKtnpJIVzOLVrAiDrNKvw4MD2OyMMNqEsJIqUTbpZ
   w==;
X-IronPort-AV: E=Sophos;i="5.99,214,1677567600"; 
   d="asc'?scan'208";a="210571253"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Apr 2023 02:35:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 21 Apr 2023 02:35:02 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 21 Apr 2023 02:35:01 -0700
Date: Fri, 21 Apr 2023 10:34:44 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Drew Fustini <dfustini@baylibre.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, James Morse
	<james.morse@arm.com>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>
Subject: Re: [RFC PATCH 2/2] RISC-V: Add support for sqoscfg CSR
Message-ID: <20230421-radio-pampers-182af9ea859d@wendy>
References: <20230410043646.3138446-1-dfustini@baylibre.com>
 <20230410043646.3138446-3-dfustini@baylibre.com>
 <20230417-culinary-capillary-4f1efd496691@spud>
 <ZD2mO/2BH9Zo3iqO@x1>
MIME-Version: 1.0
In-Reply-To: <ZD2mO/2BH9Zo3iqO@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_103514_269479_14351A24 
X-CRM114-Status: GOOD (  23.65  )
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
Content-Type: multipart/mixed; boundary="===============6457227390840708674=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6457227390840708674==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="93JrebvIW3f6S90/"
Content-Disposition: inline

--93JrebvIW3f6S90/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 01:04:11PM -0700, Drew Fustini wrote:
> On Mon, Apr 17, 2023 at 08:10:20PM +0100, Conor Dooley wrote:
> > On Sun, Apr 09, 2023 at 09:36:46PM -0700, Drew Fustini wrote:

> > >  #ifdef CONFIG_FPU
> > >  extern void __fstate_save(struct task_struct *save_to);
> > > @@ -79,6 +80,7 @@ do {							\
> > >  	if (has_fpu())					\
> > >  		__switch_to_aux(__prev, __next);	\
> > >  	((last) =3D __switch_to(__prev, __next));		\
> > > +	qos_sched_in(__next);				\
> >=20
> > Both FPU and vector do:
> > |	if (has_fpu())					\
> > |		__switch_to_fpu(__prev, __next);	\
> > |	if (has_vector())				\
> > |		__switch_to_vector(__prev, __next);	\
> >=20
> > Is it just my OCD that wants ssqosid to be the same?
>=20
> Thanks, I had not noticed those changes from the vector patch series [1]
> until you pointed it out. The handling of sqoscfg could be converted to
> that pattern too.
>=20
> > It'd also do away with that seems a bit weird to me: having
> > qos_sched_in() and __qos_sched_in().
> > Even if you don't make them similar, what's the rationale behind not
> > inverting the extension check & returning early from a single function.
>=20
> The goal was so the inline qos_sched_in() would turn into a nop when
> Ssqosid extensions not present. If Ssqosid was present, then the "real"
> function __qos_sched_in() would be called.
>=20
> However, having looked at the handling of fpu and vector in the vector
> series, I think will redo the sqoscfg handling to follow that pattern.

Aye. With the way they do it, if !CONFIG_..._SSQOSID, DCE should
remove the function call entirely & the has_extension_[un]likely() stuff
will give you your nop for kernels with CONFIG_..._SSQOSID but no
hardware support.

I think it looks "nicer"/more obvious if you copy what the fpu/vector
stuff does /shrug

Cheers,
Conor.

--93JrebvIW3f6S90/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEJYtAAKCRB4tDGHoIJi
0koqAP9JSTnE1ituL4i8GxzmCkIFr4W2t/O2GE/Ovpu/VESQygEA2SxnDL+DnpGW
tNkEQiBeE+EYDnbfMEXNxjPF2aYelg8=
=64pG
-----END PGP SIGNATURE-----

--93JrebvIW3f6S90/--


--===============6457227390840708674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6457227390840708674==--

