Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4426C7619A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF4GBvFZ3es8t9rTNBLFI4bNVq1XfYwnpzPnTxUodnQ=; b=eyKotj4G8x6ctEfc8zYsnmg4/x
	b/Jxwd5VZZAdDcTmuQDkqSc7fDLJxcvO6JkEu3AteGfsBm4MC70RaXZmhW1hJMyrRoIWh+cXHpRX2
	fpmBXnqW4NktGEwB3UcDYwpOAbWMuXfMGwqAhMgcl1bXKDt8mWyDEEYCOSx1yQoShTeQkvOtqWelI
	7We8l92S5OObfArkQ0w6FH/qgapmxwKPLWbyMf3KMa99hooRJn89e9viv5U9Xpf9xXoNQA6AsTQgE
	2Bi9CMHccRe73d/0BUyAKjg96dV8AERXZL1Y+oM3nzQRMvymZ+3AlSME07I81FOxlQBB40mQOXkpP
	7UyTuZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgn3N-00B9QE-0c;
	Mon, 27 Mar 2023 13:38:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgn3J-00B9Nk-2T
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 13:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679924306; x=1711460306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dVJBi1CSJbvncILoFNPRbdwLCRiIlKW5OwVx2Vpb/Z4=;
  b=MuM7wHhOKUhNwmrPMAkloXFi2K/LwTLT1mw327IP9fAK4W/AzJjAJfdU
   xPc/BVZ5lDJcLQ4ez1p62nuzP9wGiIlr5vStFByH2qg195hiFl491S+sS
   m95xJIAPve983jSheeeqjU++I9c4bx7nzdlHEcyYjK7YbUU8eeIKUq+Ce
   mAOdJ9C/W76Dw4rCvpQQ21BfDBEQ5/tC6TageoSnbXS/1JcadQQsGRuEl
   dHJ2Sumh6BmIIr91DE7u8rIYYU32YEuvi3vYIXS/eeuQzfD5hEwvpzkn6
   N/C0ggcAZZzNd/KXdFisS7H4CC+v1jzkZcnB0iLAzum18OL0LcQLsg2dU
   w==;
X-IronPort-AV: E=Sophos;i="5.98,294,1673938800"; 
   d="asc'?scan'208";a="203613708"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Mar 2023 06:38:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 06:38:20 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 27 Mar 2023 06:38:17 -0700
Date: Mon, 27 Mar 2023 14:49:34 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guo Ren <guoren@kernel.org>
CC: <arnd@arndb.de>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <heiko@sntech.de>,
	<jszhang@kernel.org>, <lazyparser@gmail.com>, <falcon@tinylab.org>,
	<chenhuacai@kernel.org>, <apatel@ventanamicro.com>, <atishp@atishpatra.org>,
	<mark.rutland@arm.com>, <bjorn@kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Guo Ren
	<guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V11 1/3] riscv: stack: Support
 HAVE_IRQ_EXIT_ON_IRQ_STACK
Message-ID: <77e67121-3857-4389-897b-77a6506a3443@spud>
References: <20230324071239.151677-1-guoren@kernel.org>
 <20230324071239.151677-2-guoren@kernel.org>
 <f170c68c-4975-4f71-ac50-979483cb5848@spud>
 <CAJF2gTSwt1XkC=kisOAf0_aHmi6E6ty-EV0eSA110E1DzvWc2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTSwt1XkC=kisOAf0_aHmi6E6ty-EV0eSA110E1DzvWc2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_063825_948448_33C9F48E 
X-CRM114-Status: GOOD (  14.86  )
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
Content-Type: multipart/mixed; boundary="===============7035820580354733393=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7035820580354733393==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bZdHL0QuALWZLGDg"
Content-Disposition: inline

--bZdHL0QuALWZLGDg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 09:32:51PM +0800, Guo Ren wrote:
> On Mon, Mar 27, 2023 at 7:30=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Fri, Mar 24, 2023 at 03:12:37AM -0400, guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > Add independent irq stacks for percpu to prevent kernel stack overflo=
ws.
> > > It is also compatible with VMAP_STACK by implementing
> > > arch_alloc_vmap_stack.  Many architectures have supported
> > > HAVE_IRQ_EXIT_ON_IRQ_STACK, riscv should follow up.
> > >
> > > Tested-by: Jisheng Zhang <jszhang@kernel.org>
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> >
> > > --- a/arch/riscv/kernel/irq.c
> > > +++ b/arch/riscv/kernel/irq.c
> > > @@ -9,6 +9,37 @@
> > >  #include <linux/irqchip.h>
> > >  #include <linux/seq_file.h>
> > >  #include <asm/smp.h>
> > > +#include <asm/vmap_stack.h>
> > > +
> > > +#ifdef CONFIG_IRQ_STACKS
> > > +DEFINE_PER_CPU(ulong *, irq_stack_ptr);
> >
> > btw, sparse is complaining about this variable:
> > ../arch/riscv/kernel/irq.c:15:1: warning: symbol '__pcpu_scope_irq_stac=
k_ptr' was not declared. Should it be static?

> I declared it in traps.c, maybe I should put it in the vmap_stack.h.

Ahh, I was distracted by the DEFINE_PER_CPU above and didn't look at
where the actual declaration was.. Moving it to a header sounds good to
me, thanks.

--bZdHL0QuALWZLGDg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCGe7gAKCRB4tDGHoIJi
0mLWAP4rp/MPI/P/M/C92bO7bf4f3lX+L/7fmSNZrzm/FLCMdwD6A0aWsBLYPXVt
7GpynNcJOjN1reQhsOA4nhNcMQCVLAY=
=KsYo
-----END PGP SIGNATURE-----

--bZdHL0QuALWZLGDg--


--===============7035820580354733393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7035820580354733393==--

