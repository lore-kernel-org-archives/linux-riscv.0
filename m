Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7802AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 15:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6V6wzNeRYlqVW9zRUywZiagNM8wCg48ggWNzeWjVT4=; b=TGjyn72JpwwHL4
	1VqDsNC3i5hVTxRNoUNEMZjhpSr0QbO//1eaiYtcBoZcEazOs2ozJzM8gevHOGSyASeIXK592n3yN
	DpcaEJGrHjfFv8eQhhxLCOfTv4orPChIGYBS1Aym3H8qNfofhP9gJ7vEML4YhLbOif94KtzvAFjqL
	bp+5YQ6bKRkxCOpQ+HoXdGBejoNfqMS/flnDzI7FuqvnUYgbXUt0TSMuGPc1X+04uk/RgVKUPFntb
	BMl1VLTZ513iu4MST7uSVddC7W1BQ6uax2GdCH9/z3i4QnU8yIW52GVYHgu9s7ZKekxi5QzkfdANO
	SPZX0m28RgWKJJXlzjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0P28-00HS1Z-Ix; Wed, 30 Nov 2022 15:30:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0P22-00HRvi-Rr
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 15:29:56 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1669822193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hawNiGlCtzlPbrpiS85xbPkk5wst6Kv4FnQMrTfD5Oo=;
	b=t1oQij+RMdPhxm5R/tOuxXVA1Qn9l6vSpLsGNjxHaWs0VmBU6soaboEv54cr5eqnXvuyw/
	qqwKWmgygTbCv+8TlhISSEwzVP6R9gRRH1oUPDzbLSvvGQMnJF/Mc0RiI3/inSQkjU6EEl
	UuXN87yFyLWAghpoR+8u3P/Ol92urMA9NwaHhX69GLQzbyKLH9JO/bK75Yo8iLtyxlFHfr
	f/Fq/u+jLDO3jqHyXPLJbn5uNOkLzvOm8ttQjA+qm2lG5VYUmB78RVVDGxLoCuUZFDkcPS
	sdZT6hf3Xj9jm2LiGHDKncSRZbxET3bykorZHJUOi1aqXWNy7Jo6ocSXz/8HGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1669822193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hawNiGlCtzlPbrpiS85xbPkk5wst6Kv4FnQMrTfD5Oo=;
	b=aR2w1zintC6AmJ45sscxSsf+n7s9tReVK44wAKqS6gNTvk/bQgVBjeH3vx1Fswl9Ws+TOI
	6/yGn/F0O2a32rCw==
To: Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] genirq: Simplify cond_unmask_eoi_irq()
In-Reply-To: <87edtkts5p.ffs@tglx>
References: <20221126234134.32660-1-samuel@sholland.org>
 <20221126234134.32660-2-samuel@sholland.org> <87edtkts5p.ffs@tglx>
Date: Wed, 30 Nov 2022 16:29:52 +0100
Message-ID: <87a648tq8f.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_072955_097143_AF50BDC8 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
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

On Wed, Nov 30 2022 at 15:48, Thomas Gleixner wrote:
> On Sat, Nov 26 2022 at 17:41, Samuel Holland wrote:
>> +	    (desc->istate & IRQS_ONESHOT) && !desc->threads_oneshot)
>>  		unmask_irq(desc);
>
> This breaks the mask logic of handle_fasteoi_mask_irq() for an interrupt
> which does not have IRQS_ONESHOT set.

Ignore this one. That handler is broken by design.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
