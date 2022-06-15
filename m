Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AADC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cDWx8RIRbEyjmixFZXV7i8yoDWPaC/tehH9b5r9HHg=; b=3qBj/3nHfSfj7Q
	o+SLdvtdiqp7Va72GmJDyGt58R4Ui0woLxqpOHk8VtJ8QC4kCCjjDf/X+RdJq+pMlihb+os1xkXia
	xIdKPl6uDg8UwOe6LTz70ykKRQ8gdnewJCu9Cxi/akfi0gebamencbJWOrle9RYDw4VVaW0kDTIQM
	jFW4sNofj9kxROyReayeuhduvOe5fs9LY5oH5yU5IzI0m2tzIKqvupdy39guaSaBDMx+LjDDM8Tcl
	5O1KU4ZA3GQ4GBa+UYxE1aGXasR0Z1eTFEEfCM597Ol/6BZAOXm1ZLC4XvpEejc5pudV62yEEnbDc
	kdmwMLcymEmgtYkw7kFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Q3M-00Dk0v-7V; Wed, 15 Jun 2022 10:15:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Q3K-00Djz7-S6
	for linux-riscv@bombadil.infradead.org; Wed, 15 Jun 2022 10:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=efPkYx0LzlhjjUyT3vFU9yA2v1wLteeYMERKQZflVEo=; b=AP0O+2dynyHhSJtSjsHdfYol10
	VWEThjUOrFFbAPdPZcWGdJ/dFqj3uu1wbiBSNBwHX3y5Dd9gjJdgVNa7TmipD2GDvTW/25CwA4zWD
	V+/gFF5aF9zZy5SvG8FX6fuhlekCOTwZh/0nkTPhIncMkJhSwZ22L/2z0rUlqq4Xjxg3hc1o8GwT2
	n0Kgs6ms/NkxczdnBnZ9PcHRKsYJOMg1dpnujZ97w62DqJn6PHG8THPo/FDLIE4X3U8PWctH6vWI2
	Oy1kahEXjcIHzjbnu60rEwmzWyvB879tIpjyG9JXnrEXCcf9xd+wDEkHRumLDvcwOdmhEIRuY5SFA
	h9NiPhfg==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Q3H-000y4v-HI; Wed, 15 Jun 2022 10:15:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2516530023F;
	Wed, 15 Jun 2022 12:15:07 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id EFAC9201A4F6D; Wed, 15 Jun 2022 12:15:06 +0200 (CEST)
Date: Wed, 15 Jun 2022 12:15:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Michael Jeanson <mjeanson@efficios.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 0/3] selftests/rseq: fixes for RISC-V and Glibc 2.35
Message-ID: <YqmxKvckF2P14nKu@hirez.programming.kicks-ass.net>
References: <20220614154830.1367382-1-mjeanson@efficios.com>
 <581392317.60476.1655227129623.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <581392317.60476.1655227129623.JavaMail.zimbra@efficios.com>
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

On Tue, Jun 14, 2022 at 01:18:49PM -0400, Mathieu Desnoyers wrote:
> ----- On Jun 14, 2022, at 11:48 AM, Michael Jeanson mjeanson@efficios.com wrote:
> 
> > The patch series allows running the rseq selftests on a Glibc 2.35
> > system which has rseq support but no RSEQ_SIG defined for the RISC-V
> > architecture.
> > 
> > The patches were tested on both Glibc 2.33 and 2.35.
> 
> For the whole series:
> 
> Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> 
> Peter, can you pick them up through your tree ?

Sure, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
