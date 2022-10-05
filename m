Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED425C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0KohmqnkXqYMboxrR3U2DHTwfaifQx0aXAMruvxf/G4=; b=uVPnCaAn71uHN1
	Q56Ur6RDlDXfoRV304Y4qkbT/qttaJD/LUPGEjgrl6RhrLDDy02gCcCt8Y/pbAqze63jhmH5SS1nB
	9pBy1RMvnyXCdi6I1E2bjSAHj+ZfAY+V+lakXdgKTJj8ac21B2NbsEPzt+EXz/q8HrYTyVhpTuDaN
	6zKR1vtA3hMjl3pRIpe/h1hylJyjeqvRCpBpNglQD1Nrg8xJTMPsmC9mYe6ejj/gw6Ibku+0VmCgk
	ajVaUlXyYRETZasbTaBLZnsD1Enf9kun/UlVf4O24efFx2rGkuQo+J6E8vxtLiPGKHN8zd+LokUEy
	H21WTHXkmMeK91+yWBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og1f1-00DaxI-BK; Wed, 05 Oct 2022 10:29:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og1ey-00Dawd-QK
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 10:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664965793; x=1696501793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5E4QJjuCCvDQ9v5hxdicxtlW9u5VvqxJSbrtoVqnEOg=;
  b=wUxgO2IOy+9OjoCPweNUfpbP1MNUyauks8jBzpqT4d71IlES8feJOuUd
   uUiKjNL2EkWOmzoWPViC/eY08ZD7aOrl3tZ/qrUBiucR+sYqUxUP9ldjA
   hif52wNgYiSMxHYQjh3ABjaQ/RVzkOfvZdFNNb+BCEC4yG7vDEGluGgjU
   u5jW1Bn/OrfT2vUYsy9m09WVEFb7NK2iuqzoHjgglSz+43FXNEIqEeju4
   oIoo1usmtOShKC4tWL0bKpHmmd/fLn0NGKQSeFM764V3NWb9CCWJ3IUQg
   szJbQVOA/Kkhvl7KybHyrp8MpWn4SXoW82qlW5NfU0l0sJH1tmj435TbP
   w==;
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="177122166"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Oct 2022 03:29:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 5 Oct 2022 03:29:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 5 Oct 2022 03:29:41 -0700
Date: Wed, 5 Oct 2022 11:29:20 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: <conor@kernel.org>, <geert+renesas@glider.be>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <magnus.damm@gmail.com>,
	<heiko@sntech.de>, <guoren@kernel.org>, <philipp.tomsich@vrull.eu>,
	<nathan@kernel.org>, <atishp@rivosinc.com>, <apatel@ventanamicro.com>,
	<linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<biju.das.jz@bp.renesas.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v2 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
Message-ID: <Yz1cgDOCdY41ip0y@wendy>
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YzxwoELNBctbhjJb@spud>
 <CA+V-a8tgvF16vduoQ+ZbzTpRJUmCnN-GPQs5G8AqMOXbnznwHA@mail.gmail.com>
 <F0B6C609-6C39-4080-8F07-7FEFFAFEA993@kernel.org>
 <5254a42c-9233-6f9a-eff8-33324a184d20@microchip.com>
 <CA+V-a8tS=vsTW=SvGeAjy_M9C=ZwtaWHYhdBK=XV0M9T_c3b5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8tS=vsTW=SvGeAjy_M9C=ZwtaWHYhdBK=XV0M9T_c3b5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_032952_982932_E3F9748C 
X-CRM114-Status: GOOD (  16.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 05, 2022 at 11:20:40AM +0100, Lad, Prabhakar wrote:
> Hi Conor,
> 
> On Wed, Oct 5, 2022 at 10:17 AM <Conor.Dooley@microchip.com> wrote:
> >
> > On 05/10/2022 09:58, Conor Dooley wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > >
> > > On 5 October 2022 09:44:56 IST, "Lad, Prabhakar" <prabhakar.csengg@gmail.com> wrote:
> > >> Hi Conor,
> > >>
> > >> Thank you for the review.
> > >>
> > >> On Tue, Oct 4, 2022 at 6:43 PM Conor Dooley <conor@kernel.org> wrote:
> > >
> > >>>> +static void cpu_dcache_wb_range(unsigned long start,
> > >>>> +                             unsigned long end,
> > >>>> +                             int line_size)
> > >>>> +{
> > >>>> +     bool ucctl_ok = false;
> > >>>> +     unsigned long pa;
> > >>>> +     int mhartid = 0;
> > >>>> +#ifdef CONFIG_SMP
> > >>>> +     mhartid = smp_processor_id();
> > >>>> +#endif
> > >>>
> > >>> Won't this produce complaints from your if you compile with CONFIG_SMP
> > >>> set?
> > >>>
> > >> No I dont see a build issue with SMP enabled, do you see any reason
> > >> why it should fail?
> > >
> > > Not fail but complain about the unused variable.
> > >
> >
> > Not unused variable, sorry but the unused 0 that it was initialised with*
> 
> No, it doesn't complain (I dont think compilers complain of such
> unused assignments, maybe I'm wrong). BTW I am using GCC 9.4.0. Do you
> think I need to update it?

Maybe it's sparse that generates those warnings, I never know which it
is...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
