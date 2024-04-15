Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56190C04FF9
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvvh3e+ciBHiPMenFz6YxwrgyZU5txTZcLiQBYxG6Ds=; b=EJipi5bJXoFFnx
	w6rCaeRpGQsENPoBcq5NzLHxQ+v3hxH0C1boi6Ot5qB0BXXWJGINmSJnHxSg/0l9cE1e40dNCijJ7
	Zx5nE5R58W4y7lQVjrEhAHDsK+MG+1P5cJYaHjaws31VrhG33/kX4g1Se5iuXHzQWhhEEGzw+NjZV
	4Cgm9hrUr5jEyjDawIJ26Q/ZO5TLBwQ6CjuDlkRP1xCdOtIFe34NH+l8IKgrrSus82yPBa1rTt89B
	DiJ8ldQR/ZkHDF5iElbKBL9n32eGXfK9iUfPW+55ToOW0BR6+8GxJ997JXfRKTu6O94Jply19Ab/i
	JHtfSNpXnDO5oA67sIDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPiP-00000009Bab-0HVq;
	Mon, 15 Apr 2024 17:01:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPi9-00000009BNt-1RC0;
	Mon, 15 Apr 2024 17:01:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8274560EE1;
	Mon, 15 Apr 2024 17:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14FBC32783;
	Mon, 15 Apr 2024 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713200500;
	bh=i8/bH2GflHHwL9Q6O831fT+UJyy/N/JxZRrEitYoDU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQhmkrbxlkokAIFsbHYvCZlDdyYFqLoERLQD9UjXNswKquLP0xtcV1u+YOoMVBYzN
	 Sb7LZUsXfhw2SSDicmJPXX6wJEySR7qXgqeF6WRCMsTmaxb6dTEEvdKVJ2QF8xV73M
	 zWVAeo2j5d2mIhRamGxbmxaN76CTvh0ZT5e287zxh62+7uCraDbeX1crXvejWzPawj
	 XA+nSfS1WF1QUSKZ+OwNWlmE2LS69a8cbAEH8Ow0G8h8jNNt9mOeOurVvGxQejJFIq
	 lJWV1cL3Cak0wByUAJkuz9CCwdQLw1/FNbKBb/4i5MFAWn2PKkhEyDcE8g7rJ9Kbjc
	 EpnrFltAXi4ng==
Date: Mon, 15 Apr 2024 20:00:26 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>, Helge Deller <deller@gmx.de>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [RFC PATCH 6/7] execmem: add support for cache of large ROX pages
Message-ID: <Zh1dKkFr6zdBh2Kz@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-7-rppt@kernel.org>
 <20240415104750.GJ40213@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415104750.GJ40213@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100141_693525_6595069C 
X-CRM114-Status: GOOD (  15.56  )
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

On Mon, Apr 15, 2024 at 12:47:50PM +0200, Peter Zijlstra wrote:
> On Thu, Apr 11, 2024 at 07:05:25PM +0300, Mike Rapoport wrote:
> 
> > To populate the cache, a writable large page is allocated from vmalloc with
> > VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> > ROX.
> 
> > +static void execmem_invalidate(void *ptr, size_t size, bool writable)
> > +{
> > +	if (execmem_info->invalidate)
> > +		execmem_info->invalidate(ptr, size, writable);
> > +	else
> > +		memset(ptr, 0, size);
> > +}
> 
> +static void execmem_invalidate(void *ptr, size_t size, bool writeable)
> +{
> +       /* fill memory with INT3 instructions */
> +       if (writeable)
> +               memset(ptr, 0xcc, size);
> +       else
> +               text_poke_set(ptr, 0xcc, size);
> +}
> 
> Thing is, 0xcc (aka INT3_INSN_OPCODE) is not an invalid instruction.
> It raises #BP not #UD.

Do you mean that _invalidate is a poor name choice or that it's necessary
to use an instruction that raises #UD?

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
