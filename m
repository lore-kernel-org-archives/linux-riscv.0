Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E715C3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjzSfymXlCL47GVkcFNf7hkG8yinsg0JsmvjWBibc7c=; b=uRWHZu/UV56U1f
	sTZOjgr18qoJM8jYXLrYTgXVPxkTH6Oswz62dyh0Y7y4gEzcGhzgGwEzBTZjiPAeO0DJloAAIJjC1
	Rm1W9RjYoTtcNQM07rSqmbhFOo4IvKcU4PaAgj+J+cyUi4pNGAkNqM7ZEsFYLrTaRhdCZRPTpYOBw
	/hnpOWoSmgCazPyEvc4s3V/99ftfZFvd3FZ3U7wHO3qVdxxT02A3mIN5Y7o/ZXcdkHUsU5+vr0cl+
	1bvl9nfj3x5gj5q/LXu2sovCEsgET1TCmXf1y5fEynzMbMfIxVlxuZdaX9lFoutVMqiVr+EAuXXtM
	r3Tx7MRvSpckcJU+7saQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFr4J-00000002x1L-1oCK;
	Fri, 16 May 2025 09:09:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFr2G-00000002wiD-0Bsb;
	Fri, 16 May 2025 09:07:21 +0000
Date: Fri, 16 May 2025 11:07:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747386438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5osR2bWYYN0P9nNV8UDUFWHpF1H2aHP5wQW+njVZik8=;
	b=oYZQB0GAI6HTifE4M/kjoF+9vfwVLPLJWhY0kR+u3S1RJT+4Jq6DbnnmwmaCmE3zW01DEE
	DsbQ8uHLglMWcfpHY8wOW0J+xwuMghDN8z8IcFiN/hdfnOkiRGEb92FtL0N+Zoqu1z70hD
	y++OtbBLYPVegFrxH+FtHzpgOxGH9rL0pl2uo9+wv1CfPpQAtmjYS9Wqp4SUE42l8Q9i4b
	ZXXJ+uEM5PFpg20vP18sI7fYkTt1WYaUB/H5kZt/W8Ov7syOgpKYm3t/4vsNN9JBdLsNy2
	0ArlqWA46tafZ/4coJ8TZKa6/vbGmfqGZWjlRBOzAn4TtwRLA6dphVda773sAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747386438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5osR2bWYYN0P9nNV8UDUFWHpF1H2aHP5wQW+njVZik8=;
	b=z9HThYfKLtzhh+RMv6GDyaE2SZqwb0NSGVJc28gk2Z8peoVJWITv36CWu7uuLtYk9zyLCG
	i2XH14hiqnEN/XAw==
From: Nam Cao <namcao@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de, Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 00/22] RV: Linear temporal logic monitors for RT
 application
Message-ID: <20250516090713.VrZEEdqR@linutronix.de>
References: <cover.1747046848.git.namcao@linutronix.de>
 <aCb1kBEkiriPbMo4@gmail.com>
 <20250516085522.g9Uq2WBN@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250516085522.g9Uq2WBN@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_020720_223689_9538C62C 
X-CRM114-Status: GOOD (  10.11  )
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

On Fri, May 16, 2025 at 10:56:04AM +0200, Nam Cao wrote:
> On Fri, May 16, 2025 at 10:21:36AM +0200, Ingo Molnar wrote:
> > 
> > * Nam Cao <namcao@linutronix.de> wrote:
> > 
> > > Nam Cao (22):
> > >   x86/tracing: Remove redundant trace_pagefault_key
> > >   x86/tracing: Move page fault trace points to generic
> > 
> > Does the renaming of the tracepoint class from 'x86_exceptions' to
> > 'exceptions' have any negative effects on tooling?
> 
> No, tracepoint class name doesn't affect userspace. The tracepoints' names
> seen from userspace are the same after the patches:
> 	exceptions:page_fault_kernel
> 	exceptions:page_fault_user

Just in case of confusion, the "exceptions:" name is from the TRACE_SYSTEM
macro, not the class name.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
