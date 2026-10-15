Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55E0CC6B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 04:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hzcTZHZxVrpHXMhxck7x+8BpA8xG/XNbsW4/xSPiNY=; b=X1k1yg0WbyySbZ
	qGBJzZUYISI1MCyklRS/oaikh/ke3mdIg3vatQYrTocvl73Ia2kzkvbYzT2o4p/RXVtvOAt0pAHd9
	VFrsHzuCwEYu7Zdl9wcd/dd0b0eE0/qZEwzOiD1ZpOAgG3jPt+ODu6fFKth8fVwOh2oWQQOaUIqhg
	QKp7COJSxagWY5jM3nUSGteGL28DH7e4jhX8c8LNUpPTFJ51MbAvpiv6sHVxZmdMPZOWi/dFSu8mj
	PrIxv+4CjP7oUufROuIS85j5oS46CKcGGU5zK3GHzk3v1DzczGMk50/6HoENpAUYhZLlT1OfksabK
	Y33dTjL+TYDj01rXXFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDN0-0000000GoxW-0tas;
	Thu, 15 Oct 2026 04:47:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDMz-0000000GoxI-1Oek
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 04:47:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 698596020C;
	Thu, 15 Oct 2026 04:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5487F1F000C4;
	Thu, 15 Oct 2026 04:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792039628;
	bh=2qUN2dn+UdIt7G2FXNfytZpTzNCQoVGJzHQ0Niz3D8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W9zOiDWmt3r7a1pEH9LVNDElXl1rsDMfFZmoMQ179ppBA6xpFs0FhcfehBnK0vhtW
	 M8XqC38BAcsmq6BHhrusfLWlVDgi4QTb1A+/oA9QkfQu9sjTXZLipaNPnDahkokiK1
	 9XsZthxRtScJlS/hE1jLbVS/Jd1pS72rx7MNkdanKZpYQvBl4UpyhPYagN4YxnF/iO
	 imyOWQbHg/mqsai1tDMNG5GRG8/B88MMMThA9aB5qhMsJD1f5WsIS2Q5+fW13dpeZL
	 HjLWZs/smlTWXc8XU/0v8b4JvQSz1bNruSOhzCiDsQbAVMDH/dp6+oidCOuyV3bYNd
	 Cy5s3B43OZ93w==
Date: Thu, 15 Oct 2026 12:27:05 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Roman Storozhenko <romeusmeister@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: mm: Trace TLB flush path selection
Message-ID: <atBWGQ2iWpm2VKcY@xhacker>
References: <20260830-tlb_tracepoint-v2-1-e3c88c24df5b@gmail.com>
 <ar_Rathmoj2aP-H7@xhacker>
 <CALsPMBOYQbro2gZTQR=DSUowmVDs9kujH4ua2UzCoHAQrncuiw@mail.gmail.com>
 <asm95GdbmMpc81p3@xhacker>
 <CALsPMBPMHc7q-YZvqLLYDSr5RfLmDRwBSq-TFeB8Fc8bPBjQGg@mail.gmail.com>
 <as8NpaT0g9Tsl6PS@xhacker>
 <CALsPMBOdy4ZDWfnkYokUFuB3UYPV27wTUpBCZaxLWEV10ZuS=A@mail.gmail.com>
 <atAROTefufggiFPO@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atAROTefufggiFPO@xhacker>
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

On Thu, Oct 15, 2026 at 07:33:13AM +0800, Jisheng Zhang wrote:
> On Wed, Oct 14, 2026 at 05:58:42PM +0200, Roman Storozhenko wrote:
> > Hi Jisheng,
> > 
> > Thanks for the clarification.
> > 
> > Since Radim's tracepoint code-generation results are now part of this
> > discussion, I've added him to Cc in case I misinterpret any aspect of
> > that issue.
> > 
> > I agree with you on one point regarding the compiler overhead. Since
> > the kernel supports older GCC versions, we have to take the code
> > generated by those supported compilers into account today. So
> > describing the issue simply as temporary was too strong.
> > 
> > However, I think there are two separate questions here: whether the
> > event exposes useful information, and whether the disabled-path cost
> > of its current implementation is acceptable.
> > 
> > Regarding kprobes, most of the raw fields in this event are indeed
> > already arguments of `__flush_tlb_range()`. My point is not that these
> > values are impossible to obtain dynamically.
> > 
> > Kprobes can be used to observe a very large part of the kernel. If the
> > ability to reconstruct an event with kprobes were by itself sufficient
> > reason not to add a tracepoint, the same reasoning would apply to many
> > existing tracepoints.
> > 
> > The distinction I see here is between observing implementation details
> > and exposing the semantic event directly.
> > 
> > For this case, the interesting information is not only `start`,
> > `size`, `stride`, `cmask`, etc., but their correlation with the path
> > Linux selected for that particular request:
> > 
> >         local
> >         SBI RFENCE
> >         cross-CPU call
> > 
> > Calculating the local case from `cmask` may be simple with the current
> > implementation, but the tracing program still has to reproduce
> > knowledge of the selection logic. Likewise, observing downstream
> > functions ties the tracing program to the current call graph.
> > 
> > I also don't think `/proc/interrupts` provides equivalent information here.
> > 
> > The RISC-V IPI statistics are aggregate counters. In particular, Linux
> > accounts `IPI_CALL_FUNC` as "Function call interrupts", while SBI
> > RFENCE is handled below Linux by firmware; for example, OpenSBI
> > implements the remote TLB operation using its own `IPI_TLB` event.
> 
> I think you misunderstood something. A riscv platform uses either
> SBI RFENCE or IPI for tlb shootdown, and won't change. So you can
> know whether the system is SBI RFENCE powered or IPI powered by
> cat /proc/interrupts. It's much simpler.

Aha, I missed aclint sswi case, if sswi, no explict /proc/interrupts
difference between sswi and traditonal plic. However, whether TLB is
powered by SBI RFENCE or IPI can still be known by checking
"providing IPIs using SBI IPI extension" in dmesg.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
