Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EB6C04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 10:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qO8g+3hn+9EaYyB3NaaGzN4qFLtTV2F7EhtrYVd+lac=; b=3OHobETbWSJJTT
	dvRTGxKkqstCcsesJhsIton1wGPKh2SsQHBprgpyZkcpkPny6KUZZCfTeRpTUYS2fcSQ2kP8XjNWr
	Y6uK2fwn4toy4enPEr0BDzyhp1BpbRVuN6iuLoPVuQGU137F3MdKFIVSa3xTb02vfHVnfD2wFX09w
	B6RqU3yLmvSpCbZftSwCpxQo1yEkFyPENG2IysNaRginLG5ibnxl2sgInmvFLoH9Vf2rU4UtgR4Qp
	AFVavp2LkYMa/0QCCZOc5iwMfbS3nO/KLKLZDcoqoNdovRB0nYbQMyMxZT9NHf73pN+1sDPo9zOtG
	lzQmjA0mZLSHn2zoGtAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJsZ-00000007v9G-1Dqv;
	Mon, 15 Apr 2024 10:48:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJsW-00000007v7q-3LcF;
	Mon, 15 Apr 2024 10:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RaoQRV0+66EHGN6m1Ed2GcaJhrluoYf96YNmq1kLoeM=; b=DmPlp+GwTjnqhKH6J+sryoEdrY
	Bs7/bAK5dGN/tvOZpggS1MRWFWhxCzXtg3Kme5+z0u7Td+mbEbDDM50WNlWh1bBT5LGWUxcb+bGHm
	elRahugHUcxnEkAqkbSjVEdy4EY9K3hAojTO6rN2gFUgyfCr0rBFNu0FLG+U39e1a1V9WMtD/KjXZ
	Zp9hCayzKEN/2qzib0qaBIaeLkLJf4Ht0/GJYYy/QPucZKIP2egPoJY7GIjLvQztCzQtItKx8NefU
	MgyHUypo6g915o9W6pq9YTc3bSEs3SrWCDaJITQ7Iyh1VXY7BNiW5EFf6MEbQ4nSlfuaPnF415DH5
	Z7AJDBhA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJsN-0000000AXAk-0b8k;
	Mon, 15 Apr 2024 10:47:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C563430040C; Mon, 15 Apr 2024 12:47:50 +0200 (CEST)
Date: Mon, 15 Apr 2024 12:47:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <20240415104750.GJ40213@noisy.programming.kicks-ass.net>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-7-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411160526.2093408-7-rppt@kernel.org>
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

On Thu, Apr 11, 2024 at 07:05:25PM +0300, Mike Rapoport wrote:

> To populate the cache, a writable large page is allocated from vmalloc with
> VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> ROX.

> +static void execmem_invalidate(void *ptr, size_t size, bool writable)
> +{
> +	if (execmem_info->invalidate)
> +		execmem_info->invalidate(ptr, size, writable);
> +	else
> +		memset(ptr, 0, size);
> +}

+static void execmem_invalidate(void *ptr, size_t size, bool writeable)
+{
+       /* fill memory with INT3 instructions */
+       if (writeable)
+               memset(ptr, 0xcc, size);
+       else
+               text_poke_set(ptr, 0xcc, size);
+}

Thing is, 0xcc (aka INT3_INSN_OPCODE) is not an invalid instruction.
It raises #BP not #UD.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
