Return-Path: <SRS0=VR9W=WW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E02FC3A59E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 07:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C1DE2080C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2019 07:42:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CyjJBzDB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C1DE2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnSX5dTUbO0Fx87lfAhhu7h8rx9niliMmjQ1+QlCX2I=; b=CyjJBzDBOxEN+H
	iglMU8lntxJagLIrMLQ0T9ccIkdxHgLBodcV1CWu7KD8XXzL2A9XsM9QNQEoE1YLGbdFpMEB4eWC7
	FCB8ld8D/XGP8gGg7vExFdpvzMkUeCDjo3GLiHxH6jqAW11VOzuUElnnOih3DMvxnyzoZhFOzw1WX
	2iqn5QcttxJwJkdp5pL39O611m2G135ayEBeYVki4Zz9cTWiG21oUDYO4RQmAcgJ5yQUeFtZ8p5wZ
	gAVIzPdPon+BQMxBFINUI9vaLvTVuU6i04r10YdoNIORt8gTbUr5Ll2djd0v/ei+OpdlFydG9lml+
	7HCHPOpx/1VICoo2hq8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i29eD-0005UV-Rl; Mon, 26 Aug 2019 07:42:41 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i29dr-0004v1-6h; Mon, 26 Aug 2019 07:42:19 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3BB083075FE;
 Mon, 26 Aug 2019 09:41:42 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 9740120B33552; Mon, 26 Aug 2019 09:42:15 +0200 (CEST)
Date: Mon, 26 Aug 2019 09:42:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH 03/11] asm-generic: add generic dwarf definition
Message-ID: <20190826074215.GL2369@hirez.programming.kicks-ass.net>
References: <20190825132330.5015-1-changbin.du@gmail.com>
 <20190825132330.5015-4-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825132330.5015-4-changbin.du@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-mips@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 25, 2019 at 09:23:22PM +0800, Changbin Du wrote:
> Add generic DWARF constant definitions. We will use it later.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  include/asm-generic/dwarf.h | 199 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 199 insertions(+)
>  create mode 100644 include/asm-generic/dwarf.h
> 
> diff --git a/include/asm-generic/dwarf.h b/include/asm-generic/dwarf.h
> new file mode 100644
> index 000000000000..c705633c2a8f
> --- /dev/null
> +++ b/include/asm-generic/dwarf.h
> @@ -0,0 +1,199 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Architecture independent definitions of DWARF.
> + *
> + * Copyright (C) 2019 Changbin Du <changbin.du@gmail.com>

You're claiming copyright on dwarf definitions? ;-)

I'm thinking only Oracle was daft enough to think stuff like that was
copyrightable.

Also; I think it would be very good to not use/depend on DWARF for this.

You really don't need all of DWARF; I'm thikning you only need a few
types; for location we already have regs_get_kernel_argument() which
has all the logic to find the n-th argument.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
