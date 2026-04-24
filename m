Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6970EFED3E2
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 15:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaLeu/UyBrsptsBULcXXdpUvYNXQwoTZUTbHpR7ia5E=; b=FZ3DajZiHNfugB
	V1g6zXVJUdkrkJC7h2I8Dehr3HB0ki15CmUheeMG33oYJEVefdb3gmWEJVZWi9YVqxxtyjXKuzzms
	6qXzr1KWfTmlL3RO7NvDbD0jYvmjU9z8gSnVqkpckDbKRYAbinh/JHF857namP+ZPJj0aG8ke5HvC
	UnqC0PAtE7H/35bpnMont9def21HbRcdYKXT9TBWuvqEpanJq+pnq7c0zALufNk2rKdKHVbmMy/98
	1jtm60JqxSYqQRSx3HnzyRwLFgtO7KaGNpxRWBlV7D0m4aHzhKIn+3ks+pdhIaeGIMAnADEbw/nIh
	nuhMf40WFFdO76dT9drA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIGk-0000000DNYk-2v1f;
	Fri, 24 Apr 2026 15:16:38 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGIGi-0000000DNYA-0arV
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 15:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777043796; x=1808579796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IChu/uXn2KIrqkBTPczQ+N31CwRbH1SiSkO5kUF/m3g=;
  b=RBm0e6lIppjA4r0a6lQaSReu15e1RcEoNGRcIR1pyEREWTiiqvc9FBqP
   zU3JUFGRWNkTpdVSb8RbSxsqpVVWafRly1QETiAH4sz92SSGtQUF495tf
   MwJi3KG/GZvKZHQYuc8DrQJl3ml/I2eh2PGpLACj0ceaeE40ro5C6pHPY
   5EYkWjS09X5Y/m/PVOGxTLYsHzmraRqXo6uuKbJd+HF45eeGk+07UJyoV
   2YD7VS0WnaX/IytUsv10i7gk+3H0jYV0L+jJYK4+6y4Dk8UXMIxkbmS/z
   jWHlaiRfAij13CaXID3f+7n8mfA7SrVvJxeySrzlRWLFUSeFPIBg/4G45
   g==;
X-CSE-ConnectionGUID: BsorKcgORa2C0w3DG5vmdA==
X-CSE-MsgGUID: LGwk/uwmS8yOqFy9+hEtgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="100678668"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="100678668"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 08:16:34 -0700
X-CSE-ConnectionGUID: Yvpr7tkGRTWVSuqnQ105Rw==
X-CSE-MsgGUID: M2VX0kIvSmqcW43HYmcNyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="226448405"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 08:16:31 -0700
Date: Fri, 24 Apr 2026 18:16:28 +0300
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
Subject: Re: [PATCH v4 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
Message-ID: <aeuJTMqADw8J0x0u@ashevche-desk.local>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
 <20260424-ultrarisc-serial-v4-2-1765a0b4c4a0@ultrarisc.com>
 <4548483c-cbba-899e-6b1a-1290d36b59cd@linux.intel.com>
 <aetv2ljDOpH_Hs4s@ashevche-desk.local>
 <363a636d-f014-cc29-6be4-ec3041f43855@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <363a636d-f014-cc29-6be4-ec3041f43855@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_081636_223733_0D0CD36D 
X-CRM114-Status: GOOD (  18.92  )
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

On Fri, Apr 24, 2026 at 05:09:46PM +0300, Ilpo J=E4rvinen wrote:
> On Fri, 24 Apr 2026, Andy Shevchenko wrote:
> > On Fri, Apr 24, 2026 at 02:38:56PM +0300, Ilpo J=E4rvinen wrote:
> > > On Fri, 24 Apr 2026, Jia Wang wrote:

...

> > > Hmm, maybe there should also be macro also for this one which takes t=
he =

> > > fifosize as input and converts it to CPR field vlaue (effectively, th=
e =

> > > macro is an inverse of DW_UART_CPR_FIFO_SIZE()). It would be more rea=
dable =

> > > than the literal.
> > =

> > But this can be done separately, right?
> =

> It's logically part of the cpr_value literal to defines conversion (of =

> course one could introduce it in own patch without users but I don't see =

> much benefit from that).

No objections.

> > > Also include BUILD_BUG_ON(!IS_ALIGNED(fifosize, 16) + bounds checks) =

> > > inside that macro to catch invalid fifo sizes (+ don't forget the =

> > > necessary headers for those two new things).
> > =

> > Hmm... Some devices may have FIFO =3D 8 or 4 bytes (Intel Quark IIRC ha=
s less
> > than 16 and it's DW IP).
> =

> Perhaps but according the DW databook I've at hand, there are no values i=
n =

> FIFO_MODE field for such FIFO sizes. So what would CPR contain in those
> cases for FIFO_MODE field?

On real HW it returns 0s for all registers above 0x07 (multiplied by 4 as
a stride). But I also checked the values of xmit_fifo_size and it shows 16.
What 8 is it is the DMA max_burst. Hence the proposed assertion should work.

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
