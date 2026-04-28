Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A391BFF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 10:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJzrF6FPQCDSYZ8iAKkopoG5BbVTdxzvdGd4nkEc1vs=; b=prfv7aRvzTrE3z
	TTXDerFihYvyK3n76aCWhWlmfLMoRtNoRLGaHxAqWQ3wTw2Q3Flk83vjgVXIrVM2xjanzAveM7SQW
	5UgfBjiTMfdRAj73iK+A67fjheb3L/0auxNh114GKBOFjA+rUumFQWOPRdj/01RG5c149emNamrp1
	+orh9L2pMAEz93BknU3LW7X7FJwtBWJrmhO+D63Olt0kVOzV9ksini+jfObLKUqvzCKRQO/NzeW3d
	vrTaOff9P1WLAorstdBBGnr51jDJgQHntGrCqkr6IXK4Ve9QA+LNVVj0X3FCCMfqpU7lSUNbaGdE0
	rlBQehRhctuI/GfxJ2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHg8Y-00000001ECX-14w9;
	Tue, 28 Apr 2026 10:57:54 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHg8V-00000001EBp-0M35
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 10:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777373872; x=1808909872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jZqbKM6fTH2y2tP3GL5djv9kTVVxmpd9tFQDt64FRzY=;
  b=Pubg9Pmu36CEWl7WDpGRxn45YptuAvl1pBTedAs3uYWxIw/q2AYqoyfz
   h0n1K68UvZp65CMgjemoX4yYB9H9PSOpAsrYsMz/r2/75sVozgyVJ9dta
   Mp5l6FFm3+9IjecA2bQxQyCTN359Jv1w9swOvafhrfly+c0z1KBAvURa1
   vJajXBVJjEHz96eywcJk0E3IwwkTAJ0/nq4CVm6vhAWSTuA0+wVeyWLvq
   FVfzc8NL++DUd+VFwZ1Tf0qiNKwgxcZC3a2xQLhjhKhUwYguf+2Pg1nqL
   QBUvPth71g41RcTb9AkXlSLJ5tnAGhoi9EvoosPBzmCTOQOP6XB6bemDS
   Q==;
X-CSE-ConnectionGUID: EscPpl1nTHS5N96wikfRMw==
X-CSE-MsgGUID: g6KRDpwcSjC7FFcRwBbXQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82142426"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="82142426"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 03:57:51 -0700
X-CSE-ConnectionGUID: eQok1vOwTLq9TgtktLe6yA==
X-CSE-MsgGUID: gN56KnSvSeu0fNlNRPvrGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="229567811"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 03:57:46 -0700
Date: Tue, 28 Apr 2026 13:57:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
Message-ID: <afCSqA0RguPKfUp0@ashevche-desk.local>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
 <20260428-ultrarisc-serial-v5-2-97de63b1e3eb@ultrarisc.com>
 <afBhkbGLsuqUitOl@ashevche-desk.local>
 <23c80500-f2c1-0eb3-f640-00f7b108059b@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23c80500-f2c1-0eb3-f640-00f7b108059b@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_035751_172916_F236FB2D 
X-CRM114-Status: GOOD (  24.82  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 28, 2026 at 11:41:27AM +0300, Ilpo J=E4rvinen wrote:
> On Tue, 28 Apr 2026, Andy Shevchenko wrote:
> > On Tue, Apr 28, 2026 at 01:26:27PM +0800, Jia Wang wrote:

...

> > >  /* Helper for FIFO size calculation */
> > >  #define DW_UART_CPR_FIFO_SIZE(a)	(FIELD_GET(DW_UART_CPR_FIFO_MODE, (=
a)) * 16)
> > =

> > > +#define DW_UART_CPR_FIFO_MODE_MAX	0x80
> > =

> > You used decimal values elsewhere (id est 16), use upper limit in decim=
al
> > as well.
> > =

> > > +#define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)				\
> > > +	(BUILD_BUG_ON_ZERO(!IS_ALIGNED((size), 16)) +			\
> > > +	 BUILD_BUG_ON_ZERO(((size) / 16) > DW_UART_CPR_FIFO_MODE_MAX) +	\
> > > +	 ((size) / 16))
> > =

> > I don't see the need in having that maximum being defined separately (w=
e don't
> > have that for 16, no need to have it for 128.
> > =

> > Since some ISA:s have one assembly instruction to get both / and % divi=
sions,
> > it's better to use that instead of IS_ALIGNED(). Can you check code gen=
eration
> > for x86_64 / x86?
> =

> Do those BUILD_BUGs even generate code, especially when they are expected =

> to only appear in a struct initializer?

Good question if this affects the code generation.

> > #define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)				\
> > 	(BUILD_BUG_ON_ZERO((size) > 2048) + BUILD_BUG_ON_ZERO((size) % 16) + (=
(size) / 16))
> > =

> > Note, I dropped first division in order to show the upper limit in a pl=
ain
> > number since 16 is also FIFO size in bytes.
> > =

> > Also note, this evaluates (size) three times, which might be problemati=
c,
> > but I think we can leave with that for now.
> =

> I'd put also FIELD_PREP_CONST() into the macro itself as I don't see much =

> value for this macro outside of those .cpr_value initializations.

Yep, and it would make it on par with the existing _FIFO_SIZE() that has
FIELD_GET() there.

> IMO, the entire macro would be cleaner looking as a truly multi-line =

> construct. Can we use static_assert()s in struct field initialization =

> (I'm not sure), something along these lines:

I believe one may put there static_assert():s.

> #define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)			\
> ({								\
> 	typeof (size) __size =3D size;				\

Perhaps auto ?

> 								\
> 	static_assert(IS_ALIGNED((__size), 16));		\
> 	static_assert(__size <=3D DW_UART_CPR_FIFO_MODE_MAX);	\

But I still think the % and / paired are clearer (for reading and understan=
ding)
even if they do not affect code generation. Also I think the plain number o=
f the
maximum size is better for the same reasons we do not have it for 16.

> 								\
> 	FIELD_PREP_CONST(DW_UART_CPR_FIFO_MODE, __size / 16);	\
> })

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
