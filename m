Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDCDC43217
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 22:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxJiIYIcm/EZBy95+qrknMpekcbz7L+s5DIpX56HnGw=; b=DOaX9oy9LXOoJQ
	zJHUZOcdPKUJI7JmkpbVoeK0iekib04PeHOMf9Gs3Kh5hpj6KU454o9W68ozMmouzPPwz3vHxGrEO
	ehjIbXRn46/hAAWWVgWhGi6IQFd/YRQbXk1mje4xwGfStd6jRmJZ6lwfUGNPq+79bSxxisURKU77b
	c/FXC8MWlxHazreLE/SnZ4jKh0QMdYOCs+6/taAv3LYMEeSMFkUUeE9tme9Nd0INSGFhvq6O6u9gq
	sOosgW/sUHe5NJUYdwe+/RRvXttHSedsqsB/T0O8saLr7KOHPTzOKyvRdWJokqo5Rpl+aQQKifaUQ
	tZzXPTXO4s/MX5aAkRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyKmJ-00BiQn-9D; Thu, 24 Nov 2022 22:33:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyKmG-00BiPn-6Y
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 22:33:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E56D962267;
	Thu, 24 Nov 2022 22:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B13EC433D6;
	Thu, 24 Nov 2022 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669329182;
	bh=tvqKfF9ehfh96GePMzL5l+Uze8ACkhEoswd+uPEIKlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuiY7F1YNPIrKKP8UNRvBbkUo09Al67sbOmz3qKj5Eksc5oSP/htcBhMjCmNV3Yaq
	 LzFHoHWe0rC5WccL3qB55udo54of9dL7SdjmJW2b3ULcmhbG4CP8eirdhMcze6uY/y
	 u+Sa1q1dMg2njWDTrbvpLsc0gFCLA9Kg5zkR4d5cwGvflHzmWVhnI8ZPN+DqNdT30w
	 9d1g1hQWiPRNyrrZjvjLUqX/fDirBZwTiYdMyQQ5RGP+QDAhJD9Wn45XrCHPYW15uo
	 O4afGqF8FvBGPN0IfgEVQgdo8DsZyDK7brXo6aS05k5iO/zXSn3q7D/XuMe67bj4JW
	 FUcmOYLi1Gtew==
Date: Thu, 24 Nov 2022 22:32:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
Message-ID: <Y3/xGhkbf6qEr+5r@spud>
References: <20221110164924.529386-1-heiko@sntech.de>
 <20221110164924.529386-8-heiko@sntech.de>
 <Y3F936DrR6SMcJvR@spud>
 <14728581.RDIVbhacDa@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14728581.RDIVbhacDa@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_143304_342248_6B440398 
X-CRM114-Status: GOOD (  33.08  )
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

On Thu, Nov 24, 2022 at 11:23:08PM +0100, Heiko St=FCbner wrote:
> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/=
hwcap.h
> > > index b22525290073..ac5555fd9788 100644
> > > --- a/arch/riscv/include/asm/hwcap.h
> > > +++ b/arch/riscv/include/asm/hwcap.h
> > > @@ -59,6 +59,7 @@ enum riscv_isa_ext_id {
> > >  	RISCV_ISA_EXT_ZIHINTPAUSE,
> > >  	RISCV_ISA_EXT_SSTC,
> > >  	RISCV_ISA_EXT_SVINVAL,
> > > +	RISCV_ISA_EXT_ZBB,
> > =

> > With ZIHINTPAUSE before SSTC and SVINIVAL I assume this is not something
> > we are canonically ordering but I never, ever know which ones we are
> > allowed to re-order at will.
> =

> I guess we could extend the comments with suitable hints,
> which could help in the future.

Aye, for the likes of me that will never, ever remember I like the idea!

> > >  	RISCV_ISA_EXT_ID_MAX =3D RISCV_ISA_EXT_MAX,
> > >  };
> > =

> > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > index bf9dd6764bad..66ff36a57e20 100644
> > > --- a/arch/riscv/kernel/cpu.c
> > > +++ b/arch/riscv/kernel/cpu.c
> > > @@ -166,6 +166,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] =
=3D {
> > >  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > >  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > > +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> > >  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> > =

> > This one I do know that Palmer wants canonically ordered.

btw, idk if you noticed but I appear to have picked canonical ordering
as today's thing to get confused about a lot.

You put zbb after the S extentions - does that meant it is *not* an
"Additional Standard Extension" but rather a regular Z one?

> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> > > index 026512ca9c4c..f19b9d4e2dca 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -201,6 +201,7 @@ void __init riscv_fill_hwcap(void)
> > >  			} else {
> > >  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
> > >  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> > > +				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
> > >  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
> > >  				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
> > >  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> > =

> > This one looks like it is, sstc aside. Same question as above, can I
> > reorder this one? I'll send a patch for it if I can...
> =

> hmm, I don't see the difference between cpu.c above
> (..., svpbmt, zbb, zicbom, ...) and here
> (..., svpbmt, zbb, zicbom, ...)

sstc appears last here but first in the cpu.c hunk above.

> > > diff --git a/arch/riscv/lib/strcmp_zbb.S b/arch/riscv/lib/strcmp_zbb.S
> > > new file mode 100644
> > > index 000000000000..aff9b941d3ee
> > > --- /dev/null
> > > +++ b/arch/riscv/lib/strcmp_zbb.S
> > > @@ -0,0 +1,91 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (c) 2022 VRULL GmbH
> > > + * Author: Christoph Muellner <christoph.muellner@vrull.eu>
> > =

> > Is a Co-developed-by: appropriate then?
> =

> I'd think so ... i.e. the assembly is from Christoph, but is originally
> part of a pending glibc patchset, hence Christoph and me
> decided on the co-developed thingy :-) .

Check your patch again, I don't see a Co-developed-by: tag. (That's what
I was getting at, not the validity of "Author: Christoph...")

> > > +	/* Main loop for aligned string.  */
> > > +	.p2align 3
> > > +1:
> > > +	REG_L	data1, 0(src1)
> > > +	REG_L	data2, 0(src2)
> > > +	orc.b	data1_orcb, data1
> > > +	bne	data1_orcb, m1, 2f
> > > +	addi	src1, src1, SZREG
> > > +	addi	src2, src2, SZREG
> > > +	beq	data1, data2, 1b
> > > +
> > > +	/* Words don't match, and no null byte in the first
> > > +	 * word. Get bytes in big-endian order and compare.  */
> > > +#ifndef CONFIG_CPU_BIG_ENDIAN
> > =

> > I know this is a lift from the reference implementation in the spec, but
> > do we actually need this ifndef section?
> =

> I don't know, but _if_ big endian support comes in the future,
> having one place less to break also might be helpful? :-)

One less place to have to go and fix it up, but I hope it never comes to
pass! And no harm is being close to the one in the spec...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
