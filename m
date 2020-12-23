Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572FBC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 08:24:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05B5D20857
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 08:24:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05B5D20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jxdejy8F9kUUBOOtP7etS1MET/kZU2e6v5xE4R6g2iE=; b=DobFVhwkk5Me96xn0L2JcHuMe
	0wmwLBIyaz4nPAs657WZ1uomVe8Es+t1YHNCkCJ7n0HSP0KCCjpP+JYmSHnIUElcDxu12RRyyfqQW
	4+f1J/JcF+niJm0SLIvI12QGLc9/JKNOqseS4Ilm86Ts+HVCYAVlNreOBDtkRU6zISDuryw8sWlGD
	WaKGV5QuutpfFNzsf8oozlwUezAhuVbmhFiGUq6qitllvPLv+QUBnwCzD7F4ESFqdFo1O0HqVI0R1
	nnQ78eOLlllsWfEspWiMVJTZISF1pXNLdFaRFa52I1YutF8SPyqD84R9Qp7C3YameXOhbml3CHi2L
	D8mNVrPjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzRI-0002X6-Cd; Wed, 23 Dec 2020 08:24:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzRG-0002Vo-Kv
 for linux-riscv@merlin.infradead.org; Wed, 23 Dec 2020 08:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Tp7btXv5fh0AyxUwJtWbQ5xEJ3yfKa4NDNQ6BNO/2ng=; b=TGg8zFcVOyxLssxq0mWWJF9vL2
 auT1KvIGFQ8vDcWwa5fqMu2YZGrUbUOuzn7c4BK1Rt/v3sW+kOED+QFHTrH/DECvQ+wL6wTr4xhpi
 cIpIPaPcSjXANE2ConOihMtjC3UDX3rQRDl3lW6dIP2EcKP8wHN+7JGSWcpCwUGg7mpJTSuONjQOy
 mMa2xFqOmmPlJjKFp8h0moomSP9ySLaVMswZRa83N49Ab6NO4+tSDf3Jve/twS2uZtSobqnVTX1MY
 33qF4PcRp+siS1mIDTTuHoFiej+sBluSdX44XiqL5l1u4d/o9H3NPlHQB/Asj8PI6c+UpMZmnMj72
 MWL5ja+w==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1krzRE-0006Zm-LA; Wed, 23 Dec 2020 08:24:04 +0000
Date: Wed, 23 Dec 2020 08:24:04 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Tycho Andersen <tycho@tycho.pizza>
Subject: Re: [PATCH] riscv: return -ENOSYS for syscall -1
Message-ID: <20201223082404.GB24581@infradead.org>
References: <mvma6u6vkkv.fsf@suse.de>
 <20201222162219.GA710211@cisco>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222162219.GA710211@cisco>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Andreas Schwab <schwab@suse.de>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 22, 2020 at 09:22:19AM -0700, Tycho Andersen wrote:
> On Mon, Dec 21, 2020 at 11:52:00PM +0100, Andreas Schwab wrote:
> > Properly return -ENOSYS for syscall -1 instead of leaving the return value
> > uninitialized.  This fixes the strace teststuite.
> > 
> > Fixes: 5340627e3fe0 ("riscv: add support for SECCOMP and SECCOMP_FILTER")
> > Signed-off-by: Andreas Schwab <schwab@suse.de>
> > ---
> >  arch/riscv/kernel/entry.S | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 524d918f3601..d07763001eb0 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -186,14 +186,7 @@ check_syscall_nr:
> >  	 * Syscall number held in a7.
> >  	 * If syscall number is above allowed value, redirect to ni_syscall.
> >  	 */
> > -	bge a7, t0, 1f
> > -	/*
> > -	 * Check if syscall is rejected by tracer, i.e., a7 == -1.
> > -	 * If yes, we pretend it was executed.
> > -	 */
> > -	li t1, -1
> > -	beq a7, t1, ret_from_syscall_rejected
> > -	blt a7, t1, 1f
> > +	bgeu a7, t0, 1f
> 
> IIUC, this is all dead code anyway for the path where seccomp actually
> rejects the syscall, since it should do the rejection directly in
> handle_syscall_trace_enter(), which is called above this hunk. So it
> seems good to me.

That change really needs to be documented in the commit log, or even
better split into a separate patch (still documented of course!).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
