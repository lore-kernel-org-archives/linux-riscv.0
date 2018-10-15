Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A850AC04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 16:10:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C74E208E4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 16:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RlJflUKF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C74E208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOoUsUvDyczII5A2T4TY95pshzX1KfTy4N+C/FofaRw=; b=RlJflUKFjGyXB/
	14GZYU2cyz+QTvCvOMHR9jYjh9rDZqMi0PxrVsujYkjwd6Z6uYy6Um8ZRLHh1+4rXh0RcDK+PLBB3
	MgP06p86e8oMJviBW4aoItahl4TgxGCcI6IRTlcEBhmbrH9cAz6ofRkq0aLX2HoeCpHuNmGsVD577
	pAr1SJqb2HbEQI7uUWos236xmmQZkmU24V3tPqugcn1PU2dRhS5IKLx6GZ2HAXUQx28KXCuABKpzP
	6/esKeudtRwJIPWDlMoGjy5biKwPrmUmjLMMjhtglK9gRr69JTG+L0J2Aymlj2t05WlsaEocdPLpy
	LSXth6yGa/apH5RcysuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC5RT-0008Dx-K1; Mon, 15 Oct 2018 16:10:03 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gC5RF-00081j-Eb; Mon, 15 Oct 2018 16:09:49 +0000
Date: Mon, 15 Oct 2018 09:09:49 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jim Wilson <jimw@sifive.com>
Subject: Re: [PATCH] RISC-V: Add futex support.
Message-ID: <20181015160949.GA26588@infradead.org>
References: <20181012200350.5258-1-jimw@sifive.com>
 <20181015083439.GA11826@infradead.org>
 <CAFyWVaZaXd8GZYSrMqZh+zQ+3CDghpumjo2ETezXcR93OXXSZg@mail.gmail.com>
 <20181015160103.GA19517@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181015160103.GA19517@infradead.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: hch@infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015160949.eocpzzGS31Z9wOtoIPa93Hw7N0enwQsmBwwTojoIWZ4@z>

On Mon, Oct 15, 2018 at 09:01:03AM -0700, Christoph Hellwig wrote:
> On Mon, Oct 15, 2018 at 08:57:24AM -0700, Jim Wilson wrote:
> > __riscv_atomic is a predefined macro from the compiler.  It is defined
> > when the target has atomic instructions, e.g. -march=rv64ia.  It is
> > not defined when the target has no atomic instructions, e.g.
> > -march=rv64i.  The idea here was that we only used atomic instructions
> > if the target has them.  I didn't think to check for a more proper
> > kernel solution.  I see that there is a CONFIG_RISCV_ISA_A so it looks
> > like I should be testing that instead.
> 
> Actually CONFIG_RISCV_ISA_A is dead code as well.  We assume A
> extensions in the kernel, so there should be no conditionals.

Actually we don't require the A extension for UP kernels, which
makes sense.

But that means we should keep using the asm-generic version for
the UP !CONFIG_RISCV_ISA_A case.

e.g.

#ifndef CONFIG_RISCV_ISA_A
/* 
 * Use the generic interrupt disabling versions if the A extension
 * is not supported.
 */
#ifdef CONFIG_SMP
#error "Can't support generic futex calls with A extension on SMP"
#endif
#include <asm-generic/futex.h>
#else
<rest of your new file>
#endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
