Return-Path: <SRS0=5aT3=PD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E64C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 20:13:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16F41214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Dec 2018 20:13:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/kNh2NT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16F41214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9t+HSxc1/uXo64QLO/nW5fjVkPgt4Eqw3oQ72QTSoc=; b=K/kNh2NTXCXdf8
	dlyewSanCT3tJ7s07ATb0v8/LbcCuk8E4Ujf+jpTVJa5V3V/oP8NSVowoBLZdIdRFw0SwI1pDU565
	Uxjoz9opCHDrhoCALkmmTCVXkQkYisJgzKcwHBiutYYE0lCSplcMDQn6DTCSHTd3WsheR/Wf7Bg7z
	s4uys7wqf9iV1p7I1/NNwCfgeVY1XuC+46jPnuIGtgkACtbYjBUfkiFAx3YdshIIXcRM/2cJL/yF/
	VGXBdXfQ7BDPTQHqRXu3bEugGk/uU2qjM6kLp5nTnc2Z6nRnJRCK2R9OnjYvHBJz96HCS9qIRbycQ
	QDfX/avpQlInlX3Glw5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcFYn-0003cp-P9; Wed, 26 Dec 2018 20:13:45 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcFYj-0003bc-Vf
 for linux-riscv@lists.infradead.org; Wed, 26 Dec 2018 20:13:44 +0000
Received: from [78.30.2.155] (helo=ohm.local)
 by hall.aurel32.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <aurelien@aurel32.net>)
 id 1gcFYO-0003fE-QR; Wed, 26 Dec 2018 21:13:20 +0100
Received: from aurel32 by ohm.local with local (Exim 4.91)
 (envelope-from <aurelien@aurel32.net>)
 id 1gcFYI-0001l1-1i; Wed, 26 Dec 2018 21:13:14 +0100
Date: Wed, 26 Dec 2018 21:13:14 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] tools uapi: fix RISC-V 64-bit support
Message-ID: <20181226201314.GA6513@aurel32.net>
References: <20181225144624.22402-1-aurelien@aurel32.net>
 <mhng-73e120d5-76aa-41e2-9fbb-d2ee3d8c304f@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-73e120d5-76aa-41e2-9fbb-d2ee3d8c304f@palmer-si-x1c4>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181226_121342_155070_941BECF4 
X-CRM114-Status: GOOD (  21.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2018-12-26 09:19, Palmer Dabbelt wrote:
> On Tue, 25 Dec 2018 06:46:24 PST (-0800), aurelien@aurel32.net wrote:
> > The BPF library is not built on 64-bit RISC-V, as the BPF feature is
> > not detected. Looking more in details, feature/test-bpf.c fails to build
> > with the following error:
> > 
> > | In file included from /tmp/linux-4.19.12/tools/include/uapi/asm/bitsperlong.h:17,
> > |                  from /tmp/linux-4.19.12/tools/include/uapi/asm-generic/unistd.h:2,
> > |                  from /usr/include/riscv64-linux-gnu/asm/unistd.h:1,
> > |                  from test-bpf.c:2:
> > | /tmp/linux-4.19.12/tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
> > |  #error Inconsistent word size. Check asm/bitsperlong.h
> > |   ^~~~~
> > 
> > The UAPI from the tools directory is missing RISC-V support, therefore
> > bitsperlong.h from asm-generic is used, defaulting to 32 bits.
> > 
> > Fix that by adding tools/arch/riscv/include/uapi/asm/bitsperlong.h as
> > a copy of arch/riscv/include/uapi/asm/bitsperlong.h and by updating
> > tools/include/uapi/asm/bitsperlong.h.
> > 
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> >  .../arch/riscv/include/uapi/asm/bitsperlong.h | 25 +++++++++++++++++++
> >  tools/include/uapi/asm/bitsperlong.h          |  2 ++
> >  2 files changed, 27 insertions(+)
> >  create mode 100644 tools/arch/riscv/include/uapi/asm/bitsperlong.h
> > 
> > diff --git a/tools/arch/riscv/include/uapi/asm/bitsperlong.h b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
> > new file mode 100644
> > index 000000000000..0b3cb52fd29d
> > --- /dev/null
> > +++ b/tools/arch/riscv/include/uapi/asm/bitsperlong.h
> > @@ -0,0 +1,25 @@
> > +/*
> > + * Copyright (C) 2012 ARM Ltd.
> > + * Copyright (C) 2015 Regents of the University of California
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef _UAPI_ASM_RISCV_BITSPERLONG_H
> > +#define _UAPI_ASM_RISCV_BITSPERLONG_H
> > +
> > +#define __BITS_PER_LONG (__SIZEOF_POINTER__ * 8)
> > +
> > +#include <asm-generic/bitsperlong.h>
> > +
> > +#endif /* _UAPI_ASM_RISCV_BITSPERLONG_H */
> > diff --git a/tools/include/uapi/asm/bitsperlong.h b/tools/include/uapi/asm/bitsperlong.h
> > index 8dd6aefdafa4..fd92ce8388fc 100644
> > --- a/tools/include/uapi/asm/bitsperlong.h
> > +++ b/tools/include/uapi/asm/bitsperlong.h
> > @@ -13,6 +13,8 @@
> >  #include "../../arch/mips/include/uapi/asm/bitsperlong.h"
> >  #elif defined(__ia64__)
> >  #include "../../arch/ia64/include/uapi/asm/bitsperlong.h"
> > +#elif defined(__riscv)
> > +#include "../../arch/riscv/include/uapi/asm/bitsperlong.h"
> >  #else
> >  #include <asm-generic/bitsperlong.h>
> >  #endif
> 
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Thanks for the review.

> Do you want me to put this in my tree?
> 

It's not clear for me how this should get merged and get_maintainer.pl
is not that useful here. If it is possible to merge it through your
tree, I would indeed appreciate if you can put it there.

Thanks,
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
