Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BB9C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 11:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkfFtHTqmjTDmIlikcwGg+Jlwvy6UcY+yXlwUbvKzJU=; b=ex4RNPW3oXY9V8VC+J3xCInsgz
	UQOW+PxvAmXgF095NvIlkhs/MBPVLPJU9+FrKZS5gkM1v417q5cuhqUlOzxqUdCQPhai1jXzVoptw
	rzV3kng7KFw1kbu/Y3ai5SBxdbFK4AdcWlELyEFdnPFaddzSBpRRjHxR7dHIRk45LQhEJN+Drg/MA
	Td4bdrPzOXGPZA+pE6CeyRtcq28T/kMTQuEg8dgTLw2gcSNt41mJTBpzcRG7+Vyc2AgCezqngLpKa
	DvCs6plQYv/hpliT56NluHa4FSz3RbudCtz4EIEXe5dhXnXxQ4wO/SOueGYDiZLGZiLBhMjMUkqOw
	Af6YoztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU4b4-003v3T-IQ; Mon, 20 Feb 2023 11:44:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU4at-003v0P-8w; Mon, 20 Feb 2023 11:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676893471; x=1708429471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZayuAzOXe/D7OzJt6Sr2ehYXR3td2/xneVeLxCWKj5Q=;
  b=NfqoVJKTB9WBMKsXD6Rjv6nMEBa9e0P56gtWlt0hJxe8R3qwbGXI6Usa
   GzghUItmoJzkmRg6lWEuQ3hKjiM6omkcKaAL8g7VYB5CBokvjo+KUqNYJ
   1eCy4Tm4kcSAE+mguA6Btlp/hk+CD1dyN8y4I3txG/f8KDtHbLGV4deJP
   ZI2m6pND6CCw1ryZtLe2fTQct8z9MRD6TbEm9QkMAysShgIJXvJfNgaFp
   hFUCOXBhIQbm4vkKDUBqMG8wPzhxDr6zMtDesP6S/GXAV4JkF7tM1JYnM
   rsq/vdonLnJkXtcASziCURVJgAKEuo/MYnsv+6czrtA9FkHmp3gz/PgNm
   g==;
X-IronPort-AV: E=Sophos;i="5.97,312,1669100400"; 
   d="asc'?scan'208";a="201419788"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Feb 2023 04:44:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 20 Feb 2023 04:44:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 20 Feb 2023 04:44:21 -0700
Date: Mon, 20 Feb 2023 11:43:54 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Conor Dooley <conor@kernel.org>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Lee Jones <lee@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, Emil Renner Berthing <kernel@esmil.dk>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>,
	<daire.mcnamara@microchip.com>, <atishp@atishpatra.org>
Subject: Re: [PATCH 04/12] soc: sifive: ccache: Add non-coherent DMA handling
Message-ID: <Y/Nc+u2tP07zjdn5@wendy>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-5-cristian.ciocaltea@collabora.com>
 <Y+567t+kDjZI+fbo@spud>
 <CAJM55Z_poY3dVu9fQ1W1VQw3V=8VdVKc1+qUcdHduM1aAveJUQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z_poY3dVu9fQ1W1VQw3V=8VdVKc1+qUcdHduM1aAveJUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_034431_951575_E53CAB8C 
X-CRM114-Status: GOOD (  22.33  )
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
Content-Type: multipart/mixed; boundary="===============6044338317275596144=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6044338317275596144==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wykLVd+P9f03SVcb"
Content-Disposition: inline

--wykLVd+P9f03SVcb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 19, 2023 at 10:32:52PM +0100, Emil Renner Berthing wrote:
> On Thu, 16 Feb 2023 at 19:51, Conor Dooley <conor@kernel.org> wrote:
> >
> > Emil,
> >
> > +CC Daire
> >
> > On Sat, Feb 11, 2023 at 05:18:13AM +0200, Cristian Ciocaltea wrote:
> > > From: Emil Renner Berthing <kernel@esmil.dk>
> > >
> > > Add functions to flush the caches and handle non-coherent DMA.
> > >
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > [replace <asm/cacheflush.h> with <linux/cacheflush.h>]
> > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > > ---
> >
> > > +void *sifive_ccache_set_uncached(void *addr, size_t size)
> > > +{
> > > +     phys_addr_t phys_addr =3D __pa(addr) + uncached_offset;
> > > +     void *mem_base;
> > > +
> > > +     mem_base =3D memremap(phys_addr, size, MEMREMAP_WT);
> > > +     if (!mem_base) {
> > > +             pr_err("%s memremap failed for addr %p\n", __func__, ad=
dr);
> > > +             return ERR_PTR(-EINVAL);
> > > +     }
> > > +
> > > +     return mem_base;
> > > +}
> >
> > The rest of this I either get b/c we did it, or will become moot so I
> > amn't worried about it, but can you please explain this, in particular
> > the memremap that you're doing here?
>=20
> No, I can't really. As we talked about it's also based on a prototype
> by Atish. I'm sure you know that the general idea is that we want to
> return a pointer that accesses the same physical memory, but through
> the uncached alias.

Yah, I follow all the rest of what's going on - it's just this bit of it
that I don't.

> I can't tell you exactly why it's done this way
> though, sorry.

I had a bit of a look on lore, but don't really see anything there that
contained any discussion of what was going on here.

Adding Atish in the off-chance that he remembers!

--wykLVd+P9f03SVcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/Nc+gAKCRB4tDGHoIJi
0n3EAQC515OeaFPBk3H9xce8itMQVAnTfSS/l42S5WPB4nRjrgD/Yk2YSzjgst9w
Ar7d60/RFJU1Ww58YHGgX9z2WqxXHg0=
=+rbV
-----END PGP SIGNATURE-----

--wykLVd+P9f03SVcb--


--===============6044338317275596144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6044338317275596144==--

