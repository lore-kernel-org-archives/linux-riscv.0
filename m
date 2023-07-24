Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA06C001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2HOFjlOaxbNckQ9F0VyC+ECo2FAcXbK4qhr7CSsE1c=; b=zmzioGfXrDQI+mX3VeMPn2djrh
	K+YUtHGGpjMWR6DFrC1CA8fqztmPs5Sh4S7APkUJLJGfo1haB4HIs4KI/GDFw+S9BK1IOsoMNo0VJ
	+bKn7UahGtxzV8bg8lt4UwtlZD/qCJZoKEJXOj1ZQ4T+USToEhHZBif+WGWOh2GzM4t0Lg5ljdLW+
	tTK2v7nVVaL3pLUlEprnadOUbz7OvW2zjielJi/Q8nApzirXGuO7/OHfiYtZ/v7OqAUMTx5Kn+fqD
	GKEejALM4BUnHgIBZ06DL5xnhx5QpNXK/Qk0tAKR6TgzpzPKv9lLDsTQw7t9nShv/d1DckuBGwwTa
	RRec12Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwAA-004YNE-0c;
	Mon, 24 Jul 2023 14:03:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNwA6-004YLL-2R
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 14:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690207426; x=1721743426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uHJFaNVSEV9sZPQz0YB8K/4o8Zk6Gm8bnVQmS17IElM=;
  b=Nt5cmF1RtWUZHPT5E2JedyJsrV8qCMgGBsXHdHRDCSZMEebKyt5p0H7I
   ibGKza2yXeraHuj0Q10GfeiyNdUHuE0sUtcsYJgkB374cf3ns7bKANrbG
   P/V3MUmCmgkxJzns9H91XvIfvcpjYfuVczWYXjpd6FtV0pPqty2aHnoO/
   3Eja0iXuOBj7mJKSdfxGwYtfp3gqkDhdNiedQKFP9gFKJx/Uv1pBiCLji
   jb1YBgSpM6pmPxKXUe87u8Q5qVxxSqEBGBou49wZF28uvqz1VeCt10Zhi
   hx4lvXEENOW+Do/xPi1ij+jVGztEY/bESzUb+865u4v8cJ1eQi3qPPB5/
   A==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="237361953"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 07:03:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 07:03:42 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 07:03:40 -0700
Date: Mon, 24 Jul 2023 15:03:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
CC: luxu.kernel <luxujoy@gmail.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<luxu.kernel@bytedance.com>
Subject: Re: [PATCH] riscv: Fix local irq restore when flags indicates irq
 disabled
Message-ID: <20230724-anatomist-evade-ef89a12a491a@wendy>
References: <20230724132736.124106-1-luxu.kernel@bytedance.com>
 <e75d0e92-1e6e-43c2-1935-00f22df5579d@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <e75d0e92-1e6e-43c2-1935-00f22df5579d@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_070346_866843_0F734293 
X-CRM114-Status: GOOD (  23.38  )
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
Content-Type: multipart/mixed; boundary="===============1215986638964411558=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1215986638964411558==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YUjDnkvrY/asKcNV"
Content-Disposition: inline

--YUjDnkvrY/asKcNV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 02:42:50PM +0100, Ben Dooks wrote:
> On 24/07/2023 14:27, luxu.kernel wrote:
> > When arch_local_irq_restore() is called with flags indicating irqs
> > disabled, we need to clear SR_IE bit in CSR_STATUS, whereas current
> > implementation based on csr_set() function only sets SR_IE bit of
> > CSR_STATUS when SR_IE bit of flags is high and does nothing when
> > SR_IE bit of flags is low.
> >=20
> > This commit supplies csr clear operation when calling irq restore
> > function with flags indicating irq disabled.
> >=20
> > Signed-off-by: luxu.kernel <luxu.kernel@bytedance.com>
>=20
> real-names are required for signoff

And the From: address needs to match the signof, here the From: address
is a gmail one.

> > ---
> >   arch/riscv/include/asm/irqflags.h | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm=
/irqflags.h
> > index 08d4d6a5b7e9..7c31fc3c3559 100644
> > --- a/arch/riscv/include/asm/irqflags.h
> > +++ b/arch/riscv/include/asm/irqflags.h
> > @@ -49,7 +49,10 @@ static inline int arch_irqs_disabled(void)
> >   /* set interrupt enabled status */
> >   static inline void arch_local_irq_restore(unsigned long flags)
> >   {
> > -	csr_set(CSR_STATUS, flags & SR_IE);
> > +	if (flags & SR_IE)
> > +		csr_set(CSR_STATUS, SR_IE);
> > +	else
> > +		csr_clear(CSR_STATUS, SR_IE);
> >   }
> >   #endif /* _ASM_RISCV_IRQFLAGS_H */
>=20
> I think this is correct, I wonder how long this has been going on
> without anyone noticing?

Code has been like this since 6d60b6ee0c97 ("RISC-V: Device, timer,
IRQs, and the SBI"), committed on Tue Sep 26 15:26:47 2017 -0700.

--YUjDnkvrY/asKcNV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL6EmgAKCRB4tDGHoIJi
0rSqAP9NKdc6f5Tdyq21UWQiHoEHHHHZZqppl9iSxt+XEaGcmQD+KADY0/aHrTvj
IJs7WGbQ6EFoMGHv2FTICu2om4/X8gA=
=R/dl
-----END PGP SIGNATURE-----

--YUjDnkvrY/asKcNV--


--===============1215986638964411558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1215986638964411558==--

