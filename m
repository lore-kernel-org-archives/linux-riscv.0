Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B5BC43217
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 20:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/iO1vScPQXbWONtTD4LQzfv1J8+JgGktQn+aHYmLRk=; b=Y7K+qNbDIuxo9l
	MBgKW4QxwwsgAU9k0b8ZJilrBrMmOZ7hXqNSBGn9t8Yw9U6g3F61ZGh6thD6AhFs7YCS9chTbgOjB
	9q7Iy/R9XMJcSX9gBC+K/nQui1A4u38BuhugrcxQ2xujRDRMG5oN+Y42fUV8nXpdMCPIX1hcGmtIv
	4du4r8lbP9Azd6U0f2JSPkQCdSvUhKaG8O5fKzgxwGKlisk64Lh/Nh/0nCKl7VF4Aq3silwW65Rbl
	IKS7jwVMHP48gyyOSn5bM5xnml2IdldsZclIFugRWLHyPqwWOVY8yIGhZvKCtHyIgp2webddaySPH
	fq51LVen2hhu6lBH0g7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiLyD-005nim-02; Tue, 11 Oct 2022 20:35:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiLy0-005nf9-MD; Tue, 11 Oct 2022 20:35:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DCF9612CD;
	Tue, 11 Oct 2022 20:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CA5C433C1;
	Tue, 11 Oct 2022 20:34:59 +0000 (UTC)
Date: Tue, 11 Oct 2022 16:34:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, Juri Lelli
 <juri.lelli@redhat.com>, Daniel Bristot de Oliveira <bristot@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Nicholas Piggin <npiggin@gmail.com>, Guo Ren <guoren@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Douglas RAILLARD <douglas.raillard@arm.com>
Subject: Re: [RFC PATCH 0/5] Generic IPI sending tracepoint
Message-ID: <20221011163453.2133ab4a@rorschach.local.home>
In-Reply-To: <xhsmhilkqfi7z.mognet@vschneid.remote.csb>
References: <20221007154145.1877054-1-vschneid@redhat.com>
	<Y0CFnWDpMNGajIRD@fuller.cnet>
	<xhsmhilkqfi7z.mognet@vschneid.remote.csb>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_133508_841479_4DE2AF98 
X-CRM114-Status: GOOD (  19.82  )
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

On Tue, 11 Oct 2022 17:17:04 +0100
Valentin Schneider <vschneid@redhat.com> wrote:

> tep_get_field_val() just yields an unsigned long long of value 0x200018,
> which AFAICT is just the [length, offset] thing associated with dynamic
> arrays. Not really usable, and I don't see anything exported in the lib to
> extract and use those values.

Correct.

> 
> tep_get_field_raw() is better, it handles the dynamic array for us and
> yields a pointer to the cpumask array at the tail of the record. With that
> it's easy to get an output such as: cpumask[size=32]=[4,0,0,0,]. Still,
> this isn't a native type for many programming languages.

Yeah, this is the interface that I would have used. And it would likely
require some kind of wrapper to make it into what you prefer.

Note, I've been complaining for some time now how much I hate the
libtraceevent interface, and want to rewrite it. (I just spoke to
someone that wants to implement it in Rust). But the question comes
down to how to make it backward compatible. Perhaps we don't and just
up the major version number (libtraceevent 2.0).

What would you recommend as an API to process cpumasks better?

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
