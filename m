Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33322FF886C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 08:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j69cAgdNb24EiNn0QL+9zvP1mb23e31CPLlsZ26KYUc=; b=cLS9OgCoD+b0hg
	tKFd2wOsmXInkfmE0UsMWtITVnVLYNaCcaIyaH+v0z5IU5NiOxABpvX9Uh2NQGbqw7M+jY7v0L2BD
	uFn4yqrRqOV0m9cJ+CiRetRrOn+qEg6kudPJLqv03I87hLR2E+tDygIOs6qZ2In3Ay4qAP4rztm7t
	NopRvt49/u7tKYJJ+F0ICZKfUlXxKs91XmdDUOBV2MM76m2gZGtiKIi2ri8Y0OYGc3QhMDcAjNJh3
	pl0/JER2FDnXDGdgc2h/SG64gZi0U7zZjMO8FcR2tonf0zpoEcAGjyLNY2227ZjqjJMLGeCTkaasq
	VfDYQzxk+MCi23y/7Ncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdwH-00000000tni-2hap;
	Tue, 28 Apr 2026 08:37:05 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdwE-00000000tmZ-32Pm
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 08:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=KePaejAKmGTlKVZsIEne9HnS+XEQm8GEA
	gV1azEh90Q=; b=R6pxoPtVizSzffiUatA+8a+DF2lQV1xkSXK+o/JvMXqrRD1Gb
	IXeev0BfRHZZQyPJBqMOuywQSG36PeAQ0lh2SR0ylppJOaR99ucLeGCAcptOLpun
	r4QBdVKxEyXL9wFdneBzLBtMACe4TqO67D9v+3Oy5veiS6AWkJ1ZWsnnp8=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUK5cfBpHBUDAA--.1706S2;
	Tue, 28 Apr 2026 16:37:13 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
From: Jia Wang <wangjia@ultrarisc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jia Wang <wangjia@ultrarisc.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org
In-Reply-To: <afBhkbGLsuqUitOl@ashevche-desk.local>
References: <20260428-ultrarisc-serial-v5-0-97de63b1e3eb@ultrarisc.com>
 <20260428-ultrarisc-serial-v5-2-97de63b1e3eb@ultrarisc.com>
 <afBhkbGLsuqUitOl@ashevche-desk.local>
Date: Tue, 28 Apr 2026 16:36:28 +0800
Message-Id: <177736538896.2886867.15148210690849632028.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777365389; l=2751;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=BIhqOapgNnxmFfe3qKZl8GPilR7cf2rVzseYikZONhI=;
 b=3Qkn6OIgn6PUC+UvtN8XqfDX/d/c+/bwCpge0C2foJyPdr1NP0/c0f13y7Vraca80xZhAfO1Q
 az4DLZaWn6JBfnsAyumzrsf5+bZyYq1UYbj6IBktCBYkZMEa57KXpRK
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnYUK5cfBpHBUDAA--.1706S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF47AFyUXF48uw1xAFy7Wrg_yoW5GF4fpF
	W5KF4UtF48Crn7C340yFy2yF4SqFWrGw1IgFyUuF1Dta15Xwn2gryvvFZxtr97ZwsYyayF
	qFsrtFnxu34Fy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAKEWnti78ACwAwsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_013703_136484_FFE8AEA2 
X-CRM114-Status: GOOD (  24.43  )
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

On 2026-04-28 10:28 +0300, Andy Shevchenko wrote:
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

Thanks for the review. I'll address them and add your Reviewed-by tag
in v6.
 
> ...
> 
> >  #include <linux/bitfield.h>
> >  #include <linux/bits.h>
> > +#include <linux/build_bug.h>
> > +#include <linux/align.h>
> 
> Preserve order, 'a' goes before 'b'.
> 

Will fix in v6.

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

This define will be removed in v6.

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
> 
> #define DW_UART_CPR_FIFO_MODE_FROM_SIZE(size)				\
> 	(BUILD_BUG_ON_ZERO((size) > 2048) + BUILD_BUG_ON_ZERO((size) % 16) + ((size) / 16))
> 
> Note, I dropped first division in order to show the upper limit in a plain
> number since 16 is also FIFO size in bytes.
> 
> Also note, this evaluates (size) three times, which might be problematic,
> but I think we can leave with that for now.
>

Makes sense. I'll fold the upper limit into the macro and switch to
(size) > 2048 and (size) % 16 checks for v6.

In the driver, the macro is used only in static initializers, so the
constants are fully resolved at compile time.

I also checked code generation on x86_64/x86: both IS_ALIGNED() and % 16
produce identical instructions at -O2. I'll still switch to % 16 as you
suggest for clarity.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
>

Best Regards,
Jia Wang 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
