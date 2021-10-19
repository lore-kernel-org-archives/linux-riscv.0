Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57274C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 06:41:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 183E0610E5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 06:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 183E0610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwbUTV51n0w10hGQhccnb179ol45fH+KiD9qGFpA6ik=; b=BndaAA6KBllfTh
	w8hD7EkOqZSbMSJp4L19tpbidB+VrcAZtmJJg6jIhDJyZKH5mL1t49JD6VV9orzoRf/IoUCjJH9dz
	mFB5z1SWRGI4aZT2Sq4668f4LxgKRK1yNuM2U+cgOe+ZP43f5uinN1uRqqn9PNRXE0oaCzCJt6sHD
	z1ZHoQDLJOVHnO2BCLaPGRTI2OXV8neitWA7roU8qYqdNdQqqPYgJEJIqnStCuOXcJHGPRxLU+Di0
	mep05r4jDlHEjxVBH4LIPm4INGw2hoER9gEFbiHUyBLqW20/Yx1ul/y69sUg4Wm0gEHgdxqnJNHWI
	vai0eK/3g2UJmD7B5Ylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcioW-000K3p-6T; Tue, 19 Oct 2021 06:41:32 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcioT-000K2o-MB
 for linux-riscv@lists.infradead.org; Tue, 19 Oct 2021 06:41:31 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AA04B1FD8D;
 Tue, 19 Oct 2021 06:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1634625687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yiCf/K6bKrAWm+H5GwYg06T7whuQxu5z+Eyutq5ePEE=;
 b=teDjFL9lr91NMRNc6Iv52QSxJj4QGuwwqDT3OOPMzK0CBm/3l5zawNGoKRXzDeN51cXEJP
 MSlwF/JcwJeOLxY3hgNh8mmlyB20AXu0yYaXblNFINe8pkmoTcCpXT4iQCyA+bOZUlhR5W
 yl7nzpiJ+YDINXRghZ+OA0t106VXXYU=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 0F30AA3B81;
 Tue, 19 Oct 2021 06:41:26 +0000 (UTC)
Date: Tue, 19 Oct 2021 08:41:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org,
 =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <YW5ok3CfNoRMfVQ5@alley>
References: <20211015110035.14813389@gandalf.local.home>
 <YW1KKCFallDG+E01@alley>
 <20211018220203.064a42ed@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211018220203.064a42ed@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_234129_902029_153C298A 
X-CRM114-Status: GOOD (  26.95  )
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

On Mon 2021-10-18 22:02:03, Steven Rostedt wrote:
> On Mon, 18 Oct 2021 12:19:20 +0200
> Petr Mladek <pmladek@suse.com> wrote:
> 
> > > -
> > >  	bit = trace_get_context_bit() + start;
> > >  	if (unlikely(val & (1 << bit))) {
> > >  		/*
> > >  		 * It could be that preempt_count has not been updated during
> > >  		 * a switch between contexts. Allow for a single recursion.
> > >  		 */
> > > -		bit = TRACE_TRANSITION_BIT;
> > > +		bit = TRACE_CTX_TRANSITION + start;  
> >
> 
> [..]
> 
> > Could we please update the comment? I mean to say if it is a race
> > or if we trace a function that should not get traced.
> 
> What do you think of this change?
> 
> diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
> index 1d8cce02c3fb..24f284eb55a7 100644
> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -168,8 +168,12 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
>  	bit = trace_get_context_bit() + start;
>  	if (unlikely(val & (1 << bit))) {
>  		/*
> -		 * It could be that preempt_count has not been updated during
> -		 * a switch between contexts. Allow for a single recursion.
> +		 * If an interrupt occurs during a trace, and another trace
> +		 * happens in that interrupt but before the preempt_count is
> +		 * updated to reflect the new interrupt context, then this
> +		 * will think a recursion occurred, and the event will be dropped.
> +		 * Let a single instance happen via the TRANSITION_BIT to
> +		 * not drop those events.
>  		 */
>  		bit = TRACE_TRANSITION_BIT;
>  		if (val & (1 << bit)) {
> 
> 

Looks good to me. Thanks for the update.

Feel free to postpone this change. I do not want to complicate
upstreaming the fix for stable. I am sorry if I already
complicated it.

Best Regards,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
