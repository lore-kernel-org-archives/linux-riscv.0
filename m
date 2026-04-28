Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF93FF886C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7KxLNVusDST4zuJAFO2l2bmnl1QH+HnJgQj1OdsHeQ=; b=01QclXTU8DpnsS
	F7IT4lyCXNdPCGvrsoQKPZlyqFFm8xYAIpNS8Z4bOqkeDJIOnCKUkjpY68teepSaZcqRcSQDAIqWa
	JIVek+D9wK5LFSpx2LviMBtZJBTStOtOVfr85+vIfMgJD+nbqj2xbyBKqMaRyX6FBR1IrHuV83FVi
	e9n0wE4OaVG6XnBYwt6gacvlMZNXwxat8fR2mHblZGXm4jz8kcDro9syawmR4lJmz0asV3/kcV8Az
	BUi+IYEGt9MEzVkKrfhCm0wE/Ierif6DK1n2TPgr6cN87AqoOyzORmwTdSRgnpL3XVBJcRwbkqXvW
	kg4O/XkGe24MNjDUvoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHe0i-00000000uAs-2WEW;
	Tue, 28 Apr 2026 08:41:40 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHe0g-00000000uAK-0bBo
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 08:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777365698; x=1808901698;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XPTCEcTHbkekBt6T4R3aXPqOPTdwjmg9/9WWoig2Tmo=;
  b=fO5qSxWu+1nvV6RyRYPnumpXNLWKP2nZLSE/x5wpHTR5VHUnuhYOBBQq
   hftf4Xt2zFhma+tnr1PJoqVzxrfWcwQTLhPCKk5ExSyUoYmLen9P+y4M9
   H94n+1rbMff/2/q3Uanwg77X0qykfGm9H3dvqOnviCva51qLDuStNCl5U
   OhDa3PBoxKCZAkgPoHrACaBQgdosrvcD1bv3KBw6vPyxJvqDzPODo7ngA
   TCymW91D6wzO9Y984dgsrcL2hWmevObYwe7ujbtqZiheR5DvNPkq0LH4N
   oYCrdHvG6YBhnJ1jxesM7UNDDnCmMJqlLvCTYTYgsp0N5ED7Cq8oDVz6E
   A==;
X-CSE-ConnectionGUID: YKELeQeJQwyNq4097Omu8g==
X-CSE-MsgGUID: nK4ell+nSXC1zHZYrKmo/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78378970"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="78378970"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:41:36 -0700
X-CSE-ConnectionGUID: 1x1HMCQuSp+u6ywDASTGNA==
X-CSE-MsgGUID: but3WnWeQfyNuUnb2Rt03Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="232884984"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:41:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 28 Apr 2026 11:41:27 +0300 (EEST)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Jia Wang <wangjia@ultrarisc.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
In-Reply-To: <afBhkbGLsuqUitOl@ashevche-desk.local>
Message-ID: <23c80500-f2c1-0eb3-f640-00f7b108059b@linux.intel.com>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com> <20260428-ultrarisc-serial-v5-2-97de63b1e3eb@ultrarisc.com> <afBhkbGLsuqUitOl@ashevche-desk.local>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_014138_197960_7DD96E25 
X-CRM114-Status: GOOD (  21.80  )
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

On Tue, 28 Apr 2026, Andy Shevchenko wrote:

> On Tue, Apr 28, 2026 at 01:26:27PM +0800, Jia Wang wrote:
> > Replace the magic CPR value for Renesas RZ/N1 with a composition using
> > DW_UART_CPR_* bit/field definitions and FIELD_PREP_CONST().
> > 
> > Introduce a helper macro to convert a FIFO size (bytes) into the CPR
> > FIFO_MODE field value, with BUILD_BUG_ON_ZERO() checks for alignment and
> > bounds. Use it to replace the literal FIFO_MODE values in the RZN1.
> 
> A couple of nit-picks below. After addressing them you can add
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ...
> 
> >  #include <linux/bitfield.h>
> >  #include <linux/bits.h>
> > +#include <linux/build_bug.h>
> > +#include <linux/align.h>
> 
> Preserve order, 'a' goes before 'b'.
> 
> >  #include <linux/io.h>
> >  #include <linux/types.h>
> 
> ...
> 
> >  /* Helper for FIFO size calculation */
> >  #define DW_UART_CPR_FIFO_SIZE(a)	(FIELD_GET(DW_UART_CPR_FIFO_MODE, (a)) * 16)
> 
> > +#define DW_UART_CPR_FIFO_MODE_MAX	0x80
> 
> You used decimal values elsewhere (id est 16), use upper limit in decimal
> as well.
> 
> > +#define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)				\
> > +	(BUILD_BUG_ON_ZERO(!IS_ALIGNED((size), 16)) +			\
> > +	 BUILD_BUG_ON_ZERO(((size) / 16) > DW_UART_CPR_FIFO_MODE_MAX) +	\
> > +	 ((size) / 16))
> 
> I don't see the need in having that maximum being defined separately (we don't
> have that for 16, no need to have it for 128.
> 
> Since some ISA:s have one assembly instruction to get both / and % divisions,
> it's better to use that instead of IS_ALIGNED(). Can you check code generation
> for x86_64 / x86?

Do those BUILD_BUGs even generate code, especially when they are expected 
to only appear in a struct initializer?

> #define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)				\
> 	(BUILD_BUG_ON_ZERO((size) > 2048) + BUILD_BUG_ON_ZERO((size) % 16) + ((size) / 16))
> 
> Note, I dropped first division in order to show the upper limit in a plain
> number since 16 is also FIFO size in bytes.
> 
> Also note, this evaluates (size) three times, which might be problematic,
> but I think we can leave with that for now.

I'd put also FIELD_PREP_CONST() into the macro itself as I don't see much 
value for this macro outside of those .cpr_value initializations.

IMO, the entire macro would be cleaner looking as a truly multi-line 
construct. Can we use static_assert()s in struct field initialization 
(I'm not sure), something along these lines:

#define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)			\
({								\
	typeof (size) __size = size;				\
								\
	static_assert(IS_ALIGNED((__size), 16));		\
	static_assert(__size <= DW_UART_CPR_FIFO_MODE_MAX);	\
								\
	FIELD_PREP_CONST(DW_UART_CPR_FIFO_MODE, __size / 16);	\
})

-- 
 i.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
