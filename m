Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F7B6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 17:27:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D647021925
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 17:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UJC0izTq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ZVItmiS/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D647021925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+mnyuwSWXeXYtlc5IvF1z0eXViPpG5MbWhp87oLAMA=; b=UJC0izTq6QvU0Z
	h7mtp37wpJJ7uNUAvodE1OBHybQIQpYI1/0ZJZL+UcU/60U1bP8iZT/FDCuoh8N6PBCmUrI4vt/lX
	M1xrIWm+++oetGHM5i1du5Zg0REwkGWOAXYB/RhZYT9HlyQZOXMok+utx1XvvZ2ibF5HLK/VUFyBp
	l0A4EFkmlWkwCYQxF196nivnKDuYO1+hs8JSX621aStFtFdm0v5zMgva0cOrIgoJU4xVl1NM750/o
	3uoEJTm/FJiTb67QCeuMuhiYUeOgIwsQN8ddTSopmRRBjpoTN9DGcLDPd5blguRIq3NZrgE9EQ+qH
	1BLz18hdyO6QpMeFPEYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7NxI-0006zB-C7; Fri, 22 Mar 2019 17:27:44 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7NxF-0006sR-6m; Fri, 22 Mar 2019 17:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oETpZyH7xLKUdQHFKiHuSJuVBCjYUIIZETTJzqHKcsc=; b=ZVItmiS/eWU+t+u/Ypr3JsIfH
 K7gIVIjf/tMjHU4ClkIDbVc0xR0NNLF0n2wa84s5q/gE/RJhZVCvd6fK2BNDfxu1OEk0mYW6Lxe7q
 sC878zm3M3R4xuyn5EQKV8utKNN6YSO3kcgC8Z2P6R2io6qHXXWUfM93/Ov1/3+ISTVKCxVxfdeDX
 PVBv72GKBfeUmK+m8QEwUJ4ZgLNUaSU3cKPuLzRsEu+5uvRBLZJnNeejkUlyxFeYXi169VW+wjQc0
 N/vQusiIGyjYjOyaXtJOkcSeuERNZ5lHhz/nfZftS80Z3QEJEyuhGvEhBze/s0OwRLKs+0Mt+5wAq
 NBOeDpgHA==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:55184)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1h7Nus-0002MI-Vr; Fri, 22 Mar 2019 17:25:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1h7Nuf-0000lO-F7; Fri, 22 Mar 2019 17:25:01 +0000
Date: Fri, 22 Mar 2019 17:25:01 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v5 3/3] locking/rwsem: Optimize down_read_trylock()
Message-ID: <20190322172501.3nbjw6e2wqsaisgw@shell.armlinux.org.uk>
References: <20190322143008.21313-1-longman@redhat.com>
 <20190322143008.21313-4-longman@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190322143008.21313-4-longman@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_102741_244116_401D441D 
X-CRM114-Status: GOOD (  11.53  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Davidlohr Bueso <dave@stgolabs.net>, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 Tim Chen <tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 10:30:08AM -0400, Waiman Long wrote:
> Modify __down_read_trylock() to optimize for an unlocked rwsem and make
> it generate slightly better code.
> 
> Before this patch, down_read_trylock:
> 
>    0x0000000000000000 <+0>:     callq  0x5 <down_read_trylock+5>
>    0x0000000000000005 <+5>:     jmp    0x18 <down_read_trylock+24>
>    0x0000000000000007 <+7>:     lea    0x1(%rdx),%rcx
>    0x000000000000000b <+11>:    mov    %rdx,%rax
>    0x000000000000000e <+14>:    lock cmpxchg %rcx,(%rdi)
>    0x0000000000000013 <+19>:    cmp    %rax,%rdx
>    0x0000000000000016 <+22>:    je     0x23 <down_read_trylock+35>
>    0x0000000000000018 <+24>:    mov    (%rdi),%rdx
>    0x000000000000001b <+27>:    test   %rdx,%rdx
>    0x000000000000001e <+30>:    jns    0x7 <down_read_trylock+7>
>    0x0000000000000020 <+32>:    xor    %eax,%eax
>    0x0000000000000022 <+34>:    retq
>    0x0000000000000023 <+35>:    mov    %gs:0x0,%rax
>    0x000000000000002c <+44>:    or     $0x3,%rax
>    0x0000000000000030 <+48>:    mov    %rax,0x20(%rdi)
>    0x0000000000000034 <+52>:    mov    $0x1,%eax
>    0x0000000000000039 <+57>:    retq
> 
> After patch, down_read_trylock:
> 
>    0x0000000000000000 <+0>:	callq  0x5 <down_read_trylock+5>
>    0x0000000000000005 <+5>:	xor    %eax,%eax
>    0x0000000000000007 <+7>:	lea    0x1(%rax),%rdx
>    0x000000000000000b <+11>:	lock cmpxchg %rdx,(%rdi)
>    0x0000000000000010 <+16>:	jne    0x29 <down_read_trylock+41>
>    0x0000000000000012 <+18>:	mov    %gs:0x0,%rax
>    0x000000000000001b <+27>:	or     $0x3,%rax
>    0x000000000000001f <+31>:	mov    %rax,0x20(%rdi)
>    0x0000000000000023 <+35>:	mov    $0x1,%eax
>    0x0000000000000028 <+40>:	retq
>    0x0000000000000029 <+41>:	test   %rax,%rax
>    0x000000000000002c <+44>:	jns    0x7 <down_read_trylock+7>
>    0x000000000000002e <+46>:	xor    %eax,%eax
>    0x0000000000000030 <+48>:	retq
> 
> By using a rwsem microbenchmark, the down_read_trylock() rate (with a
> load of 10 to lengthen the lock critical section) on a x86-64 system
> before and after the patch were:
> 
>                  Before Patch    After Patch
>    # of Threads     rlock           rlock
>    ------------     -----           -----
>         1           14,496          14,716
>         2            8,644           8,453
> 	4            6,799           6,983
> 	8            5,664           7,190
> 
> On a ARM64 system, the performance results were:
> 
>                  Before Patch    After Patch
>    # of Threads     rlock           rlock
>    ------------     -----           -----
>         1           23,676          24,488
>         2            7,697           9,502
>         4            4,945           3,440
>         8            2,641           1,603
> 
> For the uncontended case (1 thread), the new down_read_trylock() is a
> little bit faster. For the contended cases, the new down_read_trylock()
> perform pretty well in x86-64, but performance degrades at high
> contention level on ARM64.

So, 70% for 4 threads, 61% for 4 threads - does this trend
continue tailing off as the number of threads (and cores)
increase?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
