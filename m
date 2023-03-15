Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03C0C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTdnBsLVNJLC9JOMSndP5o0Y1vDM7abSoBbcmc0p+sY=; b=dY8P1W7fXKteyc
	ONcvXdjCGgkaRqZZUOgC2eOlS7B7rOImC165I/aa0ToYRygoCnwD5cQMLNa/rdkhwBijZKm/wkUGd
	ZpF3r+0w7qGK8HsIUuJjR6URatHIPXihsrddAlHkAvyAxOpXIM++nJnvhZKgESOV4Y9wvFENCuPey
	8HEpCU25W1fcis1/SypRpJfpo7a/nnVTb82ef3I9Vmc0Fm44LKCh+FBN2kOZUgHg3jOCO8z/P/VBQ
	HH1l/T5zGPeieybdXWWZAEx9wvy8kCPpe6WpUWRc0qdOeDQvsyHsUtQmEu1B5wJaZtxxJc2mPPyRP
	yqb1xbVqrPdEgBHgghOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSZx-00DiaB-0I;
	Wed, 15 Mar 2023 14:58:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSZu-00DiYl-09;
	Wed, 15 Mar 2023 14:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wd8qK2CA6PymeHUSx0iaO6FA3rxmYEqXDRJEu+NxeFQ=; b=PFP1zbNSgF4Lhynb68W1Zs6OoH
	HEDO+2MGSPoRsxZUfpjUK+DAEtI7EL9ir21q/hml31B0rqCSFtdkCG4//j87u+65tDB/SOig7IWbY
	QdA45IM8LaNGDys8KDlhn0jtnKyPmz4PreME22ouaOEa1moXdFlsGB7qfzpQQ8ig8C5cQZSC2Px+C
	PsaDe99yZvUZaOb5LVpCyrZRyKzsxfSRFPG10Rqi1fhJsAcDxB/Qosfj0DGyctMR458LS9bqW+ADs
	1zf0SeHzabZeqQwiV4+mxEuwnHrhQ6sR4QyEfNDFbUeCStT8CXqhNzJ0ovfHNdc2Tww3A/B2Zzfgi
	x/Z23HRg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pcSZk-00DvdH-FK; Wed, 15 Mar 2023 14:58:01 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B85213001E5;
	Wed, 15 Mar 2023 15:57:57 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6EA362408DE43; Wed, 15 Mar 2023 15:57:57 +0100 (CET)
Date: Wed, 15 Mar 2023 15:57:57 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Donglin Peng <pengdonglin@sangfor.com.cn>, mhiramat@kernel.org,
	linux@armlinux.org.uk, mark.rutland@arm.com, will@kernel.org,
	catalin.marinas@arm.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com,
	xiehuan09@gmail.com, dinghui@sangfor.com.cn,
	huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] function_graph: Support recording and printing
 the return value of function
Message-ID: <20230315145757.GE2006103@hirez.programming.kicks-ass.net>
References: <20230315133911.958741-1-pengdonglin@sangfor.com.cn>
 <20230315133911.958741-2-pengdonglin@sangfor.com.cn>
 <20230315134911.GD2006103@hirez.programming.kicks-ass.net>
 <20230315101348.1234c7f5@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315101348.1234c7f5@gandalf.local.home>
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

On Wed, Mar 15, 2023 at 10:13:48AM -0400, Steven Rostedt wrote:
> On Wed, 15 Mar 2023 14:49:11 +0100
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > > diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
> > > index 1265ad519249..35ac9c58dc77 100644
> > > --- a/arch/x86/kernel/ftrace_64.S
> > > +++ b/arch/x86/kernel/ftrace_64.S
> > > @@ -348,6 +348,10 @@ SYM_CODE_START(return_to_handler)
> > >  	movq %rax, (%rsp)
> > >  	movq %rdx, 8(%rsp)
> > >  	movq %rbp, %rdi
> > > +#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> > > +	/* Pass the function return value to ftrace_return_to_handler */
> > > +	movq %rax, %rsi
> > > +#endif
> > >  
> > >  	call ftrace_return_to_handler  
> > 
> > What about the case of double register return values (when the value
> > is returned in the A,D pair) ?
> 
> Is there anything that does that in 64 bit kernels?

Note sure; but I have a patch series that introduces cmpxchg128 and
friends. Most of the actual functions are __always_inline, but still,
the moment a compiler decides to break out a subfunction on a u128
boundary we're in luck.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
