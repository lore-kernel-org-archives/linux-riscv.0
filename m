Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C7DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 20:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aopMGPXrsD/S6xuj/n6GOyHMWqQiI7rDONQfBAbPoHI=; b=ZHxPk8LYJTbqUD
	2bOIe+EVk8lR20ke8m6JUhTxejwl1Cd32kTeAJtIVg7EyXu1yvvsZg+w0DI7I5/Hsulwu5GbQJirq
	eFhbPv9s83IF6viL9K0Cs0S0nyOzJTCKYb6fcRIxW+/T2WnPdb/qzQtZll44dY1RCuPfeqhR6utH8
	XJycgKFMRpXeBTuRSMCqrtuIpF59/F6rq9XkAQ2EXD9ql0wDB8rWPCpWqKHJ+q1aHqocZ6/I2Ok+b
	qd5+iUYUVLRP6m46izvdj+xqN99Jm1TvDpxUJHZaz36HfQ3LNqyG6VU0VpexaHoC7O6KDHuGD53rA
	mTVgtLOAhvPNo4Gt3hVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiM4j-005p59-GY; Tue, 11 Oct 2022 20:42:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiM4Z-005p2b-7z; Tue, 11 Oct 2022 20:41:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 36325B80F9B;
	Tue, 11 Oct 2022 20:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8570C433C1;
	Tue, 11 Oct 2022 20:41:44 +0000 (UTC)
Date: Tue, 11 Oct 2022 16:41:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, "Paul E. McKenney"
 <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Frederic
 Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Nicholas
 Piggin <npiggin@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>, Guo Ren
 <guoren@kernel.org>, "David S. Miller" <davem@davemloft.net>, Douglas
 RAILLARD <douglas.raillard@arm.com>
Subject: Re: [RFC PATCH 0/5] Generic IPI sending tracepoint
Message-ID: <20221011164143.52c84421@rorschach.local.home>
In-Reply-To: <xhsmhfsfufh51.mognet@vschneid.remote.csb>
References: <20221007154145.1877054-1-vschneid@redhat.com>
	<Y0CFnWDpMNGajIRD@fuller.cnet>
	<xhsmhilkqfi7z.mognet@vschneid.remote.csb>
	<3e680bb9-9896-3665-dd59-4f2e6f8205bb@redhat.com>
	<xhsmhfsfufh51.mognet@vschneid.remote.csb>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_134155_434470_D89D8C5F 
X-CRM114-Status: GOOD (  17.18  )
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

On Tue, 11 Oct 2022 17:40:26 +0100
Valentin Schneider <vschneid@redhat.com> wrote:

> > You could keep the tracepoint as a mask, and then make it pretty, like cpus=3-5,8
> > in user-space. For example with a trace-cmd/perf loadable plugin, libtracefs helper.
> >  
> 
> That's a nice idea, the one downside I see is that means registering an
> event handler for all events with cpumasks rather than directly targeting
> cpumask fields, but that doesn't look too horrible. I'll dig a bit in that
> direction.

We could just make all all dynamic array's of unsigned long use that
format? I don't know of any other event that has dynamic arrays of
unsigned longs. And doing a search doesn't come up with any.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
