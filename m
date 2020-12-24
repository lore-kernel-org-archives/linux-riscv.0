Return-Path: <SRS0=/9Zu=F4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F1FC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 02:55:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86EA224B1
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Dec 2020 02:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E86EA224B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=gsCc0t0BnqltAYRaK9BKxguh9TvjtNHl9nSukVAgNy4=; b=KGqXQ89T9XFAm/bSSYw0qYOWa
	jd+S77XG3CJcktdstmuOUNz1T7WjEBLvfOZQpDGB72PQbClsrJl+aoOTlsqW3xyilysW42HyNZS0Y
	9X7FN7IabTpWDTd0h0w9XUk+V0HG3nnQw8FjhxUrmA3Kiq+R3vPaAkPmY+YTAguwu7TEqBhknwIuL
	vNLdbR0dS1kHZpRqq1hfBDJi23Op28lKhCAEnT1xZ8s3qRUqJU7PNS1f0w0h5+PoYcnuDTdvmr1Sg
	qsTkaY0qoxOymr6bHs+4ojuj8mwv0mooU07CmnslbXRHADQBdaeQWZUb9wc4Map67jOBZyZH+tlMe
	1obRGSBIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksGmA-0004iF-45; Thu, 24 Dec 2020 02:54:50 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksGm7-0004hS-GH
 for linux-riscv@lists.infradead.org; Thu, 24 Dec 2020 02:54:48 +0000
Received: by mail-pf1-x430.google.com with SMTP id h186so538714pfe.0
 for <linux-riscv@lists.infradead.org>; Wed, 23 Dec 2020 18:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6CruMwj3es7dN6q83DfEO/iKaOGfekskSHiLh5zWSNc=;
 b=GAeVIaMZiPs8NRaZ3wq491yVrDkq3ECS5AMBUZ365/RMef6sA+O73T4MQ2eCWsvAYh
 huLXuanMXOYUu6uesUcP2PRQQHs72NtJKGFswpeStxs4zfudYQqLlZt/6LmrQm0RKtVU
 2buLGf1k7x99bgDxkB5NJ5p90RjgbGtNbDiYp+QBitZLSmN+RLplzEgnQkB4ds2zdxUd
 OgjuZPHPHfgUuyFbCj5FZPrSEtejucShCNZHSYuhhfus38Npq94XMrQu8ytETXo/s2/D
 euKBc0HFYswXYUOj0SnubTXRtq5OLDsJJ61Gdkl5omkOv0/6bg8qtr165cs5ZmKmnWLv
 /MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6CruMwj3es7dN6q83DfEO/iKaOGfekskSHiLh5zWSNc=;
 b=KPswWBHzXfGRPq+YlJVQnaFe+lUkoSCN/pMlsng4R6b/PCsCg27afe3RvqGS6mA4j1
 TOX46tVzzMX69jTEFcn7eyYmw8cb8etlUHaGANBac21NF4kP88RVtcKIunqge0AN1Zdm
 m+lKab2DWNqGVfQru0rgNCAPzwazkVo0CEx7xbfSDg6Fr20nTlWE1Nh+XbUYmg7UkHEO
 A3dpuQR14eqF51Agkq9Jec9Jh2/A8EmrXUXId4LHDQXFBMQKm1iCvNqdmkuSpw6wA9F0
 kAYj5uD9RdfRmQHQN1on+DmiiFz1L9jETXLMfi7I+JAD1j0M5ZzHSQJa9BCKqgZInlyV
 sU1Q==
X-Gm-Message-State: AOAM532yMz49ZPEENHcj9IzEeT+ElphKV059xh14clcGfGRBtAkpKUKf
 iwEX0xf8/hsftMdAlW+CSukpMSL8LqSRog==
X-Google-Smtp-Source: ABdhPJx0Yr6reyiHyhZsaOkM7rzq2fgP9/YI4GoIKOHadjhSWZphN/IEG7hIgDtbYiQrLfBEBhSHxw==
X-Received: by 2002:a63:720c:: with SMTP id n12mr25325416pgc.97.1608778484909; 
 Wed, 23 Dec 2020 18:54:44 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u11sm857259pjy.17.2020.12.23.18.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 18:54:43 -0800 (PST)
Date: Wed, 23 Dec 2020 18:54:43 -0800 (PST)
X-Google-Original-Date: Wed, 23 Dec 2020 18:54:42 PST (-0800)
Subject: Re: [PATCH] riscv: return -ENOSYS for syscall -1
In-Reply-To: <20201223082404.GB24581@infradead.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-c15e4fab-6487-4875-a392-85669982b8b1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_215447_666411_AE0B29BF 
X-CRM114-Status: GOOD (  27.10  )
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
Cc: david.abdurachmanov@sifive.com, schwab@suse.de,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, tycho@tycho.pizza
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 23 Dec 2020 00:24:04 PST (-0800), Christoph Hellwig wrote:
> On Tue, Dec 22, 2020 at 09:22:19AM -0700, Tycho Andersen wrote:
>> On Mon, Dec 21, 2020 at 11:52:00PM +0100, Andreas Schwab wrote:
>> > Properly return -ENOSYS for syscall -1 instead of leaving the return value
>> > uninitialized.  This fixes the strace teststuite.
>> >
>> > Fixes: 5340627e3fe0 ("riscv: add support for SECCOMP and SECCOMP_FILTER")
>> > Signed-off-by: Andreas Schwab <schwab@suse.de>
>> > ---
>> >  arch/riscv/kernel/entry.S | 9 +--------
>> >  1 file changed, 1 insertion(+), 8 deletions(-)
>> >
>> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> > index 524d918f3601..d07763001eb0 100644
>> > --- a/arch/riscv/kernel/entry.S
>> > +++ b/arch/riscv/kernel/entry.S
>> > @@ -186,14 +186,7 @@ check_syscall_nr:
>> >  	 * Syscall number held in a7.
>> >  	 * If syscall number is above allowed value, redirect to ni_syscall.
>> >  	 */
>> > -	bge a7, t0, 1f
>> > -	/*
>> > -	 * Check if syscall is rejected by tracer, i.e., a7 == -1.
>> > -	 * If yes, we pretend it was executed.
>> > -	 */
>> > -	li t1, -1
>> > -	beq a7, t1, ret_from_syscall_rejected
>> > -	blt a7, t1, 1f
>> > +	bgeu a7, t0, 1f
>>
>> IIUC, this is all dead code anyway for the path where seccomp actually
>> rejects the syscall, since it should do the rejection directly in
>> handle_syscall_trace_enter(), which is called above this hunk. So it
>> seems good to me.
>
> That change really needs to be documented in the commit log, or even
> better split into a separate patch (still documented of course!).

Unless I'm missing something, this is already how it works already?
handle_syscall_trace_enter is checking the result of do_syscall_trace_enter(),
which checks secure_computing().  When secure_computing() rejects the syscall
we already ended up rejecting the syscall, so this code wasn't doing anything
for the case it was supposed to handle.

It was, however, intercepting syscall number -1 when we weren't rejecting the
syscall and directly exiting rather than calling sys_ni_syscall.  That would,
at a bare minimum, result in an uninitialized return value.  It also breaks the
pairing of trace_sys_enter() and trace_sys_exit(), which doesn't smell like a
good idea.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
