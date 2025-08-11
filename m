Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904A1CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 22:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujhX8NdhPzUag9zXODRobHsReev2itNNh2mn76I5mWI=; b=0UxemFsJt8YYPz
	VDeMjunn4iQ0H8h7NQBe0rU6JHRSXS6DjfMV+i5yefr9hVJ/WWrRYRln4blz8Ow4qveHYK9WHqZnF
	hCi/+cxJ9dgEUeFtHUXYZxIUi1aWVB5CqdOkhVkmfmt6OgwKStFOO5hQmIFlR6/RB9ufhvV9vEa1k
	yMx2nQ9PH2e4xrKgKdV/nlFtd7GSi5myzFYOnpOP8br7tXBZPSBYdHX+38g7W+IisIb2i5M+iUoZP
	zPHDWdVHzyjAYNWjga/5vyYofTwBh9xPy+JYVU56FpzXolhxfRbjCQWbg0OxHgSz6WWdSZxoyHNVp
	RqE1L0kuL/OZcwPF8aOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uladb-00000009EUA-0KkL;
	Mon, 11 Aug 2025 22:05:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulZGG-000000091oC-1poo
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 Aug 2025 20:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OvilSks8eMHNqA+xiQJDTV7r7oo0XPipLHjlxqh7g1k=; b=q/yDbM6rU7DtF1vm7yNKqpI3DV
	Jhcw09k1mHSJJloY/dvHe6Ng+mIHPjoJ2Obc1fA02OiWoTBkdzJVxK4vz/Z7n/blVVxWrWJGpgy1i
	D5ehxLx7xTJIHMQ/c05lplK32zeEIh1hlERtsIZUA1Kq/IjVx9xrLaCLPTmPWnwtkCHB5nOQ39MUM
	BxKPto8vMI0pqVDhsuxe0RHK0lywq05M8Flac4muVXXRI7ynlTiSGT+euPUrviF2a8hOu4zKMABbG
	4fm4c7yoUY8LP2vdppeKOB4sgonOPVYcH1oIxfdBBRVhWESebOQBXEyz4XpyodNB3VF6WBUR1hqrT
	4SJphpjA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulZGD-0000000FWdJ-1WTn
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 20:36:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88F7A5C4FF8;
	Mon, 11 Aug 2025 20:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14339C4CEED;
	Mon, 11 Aug 2025 20:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754944605;
	bh=ANNBkkYI6TT0Omdxh17jItclatemB8sLwNiNbq4exXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAf/o18YcMfvfiWpgenxbCd6N5M/0xSY91v0f/FH65nR50nuaFRoRWXq84uGEnbAw
	 Y8AXhP9OMJ7jcEd8EJZA7zH3+uafAemxVJV1D1Vhq05KR49Qi7bUWgbOwKmmNkS5NS
	 hVokol/W0r3PRECkzODjYRRYAUjzCRwDTF79ZjbVkDEoLsYCDxLjl1NgoWJwdgbCYQ
	 RQLXzOxh7GwZ793VflwAvOb5WA+2IY8/TBS64733SnWpwkUZFtMBLLz2ow34LuQPow
	 xiYB7SLn7JMcMMAgtCj9CC9g42BYqTroltfs5pKqX3Ra1dQmCWcCK4iUCItlWuNwWE
	 6x2W+BTN5VQ8g==
Date: Mon, 11 Aug 2025 13:36:42 -0700
From: Drew Fustini <fustini@kernel.org>
To: Florian Weimer <fweimer@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v2] riscv: Add sysctl to control discard of vstate during
 syscall
Message-ID: <aJpUWnYEL18dk4aC@x1>
References: <20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org>
 <lhuo6so7ur5.fsf@oldenburg.str.redhat.com>
 <aJe8ZW5LEtBK7Jmj@x1>
 <lhuqzxjy5zq.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <lhuqzxjy5zq.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_213649_841160_FAC30415 
X-CRM114-Status: GOOD (  37.08  )
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

On Sun, Aug 10, 2025 at 09:45:45AM +0200, Florian Weimer wrote:
> * Drew Fustini:
> 
> > On Sat, Aug 09, 2025 at 10:40:46AM +0200, Florian Weimer wrote:
> >> * Drew Fustini:
> >> 
> >> > From: Drew Fustini <dfustini@tenstorrent.com>
> >> >
> >> > Clobbering the vector registers can significantly increase system call
> >> > latency for some implementations. To mitigate this performance impact, a
> >> > sysctl knob is provided that controls whether the vector state is
> >> > discarded in the syscall path:
> >> >
> >> > /proc/sys/abi/riscv_v_vstate_discard
> >> >
> >> > Valid values are:
> >> >
> >> > 0: Vector state is not always clobbered in all syscalls
> >> > 1: Mandatory clobbering of vector state in all syscalls
> >> >
> >> > The initial state is controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
> >> 
> >> Can this be put into the system call number instead, or make it specific
> >> to some system calls in other ways?
> >
> > Do you mean the control the initial state of the sysctl, or not having a
> > sysctl for discard behavior at all?
> 
> It's seems rather strange to have a sysctl for such an ABI change
> because it really has to be a per-process property.

The reason for sysctl is that I want a means to let a system to opt out 
of clobbering vector state on the syscall entry path. This is because it
adds significant overhead for some implementations. For example, it
results in a 25% longer syscall duration on the X280 core.

I would be in favor of reverting the mandatory clobbering behavior, but
Palmer says that it is useful for test suites. Since revert isn't an
option, I want a system wide policy control like this sysctl. It does
seem like there could be some advantages to per-process control but I
think that delves into ABI changes which I feel is a separate issue from
a system wide knob for "always clobber"/"do not always clobber".

> 
> >> I think C libraries can use this optimization for their system calls
> >> (after adjusting the assembler clobbers) because the vector state is
> >> caller-saved in the standard calling convention.  But there is backwards
> >> compatibility impact for turning this on for the entire process.
> >
> > The focus I have right now is allowing users to avoid the delay in
> > syscall entry on implementations where clobbering is slow. Palmer had
> > mentioned in my v1 [1] that he has 'a patch out for GCC that enables a
> > system-wide vector ABI, but I don't have time to test/benchmark it so 
> > it's kind of hard to justify'. It seems like creating a new ABI where
> > the vector registers are preserved across syscalls could be useful, but
> > I think it would be best to handle that possiblity later on.
> 
> I'm confused.  Current glibc assumes that vector registers are preserved
> across system calls because the assembler clobbers do not mention them.
> Similar inline assembly probably has ended up in other projects, too.
> It works by accident if glibc is compiled for a non-vector target, or if
> it so happens that GCC never keeps vector registers alive across system
> calls.

I wasn't trying to make any ABI changes with this sysctl patch. The
riscv kernel documentation states vector state is not preserved across
syscalls. I am not trying to change that policy.

Around the same time that Palmer added that statement to the vector
documentation, Bjorn added the code that always clobbers the vector
registers on syscall entry. This was done in order to ensure programs
were not relying on vector state being preserved. 

At the time 2 years ago, Palmer and Bjorn talked about how this could
be revisted if it turns out the clobbering process ended up being slow
on real hardware. This patch is my attempt to allow platforms with slow
vstate clobbering to opt out this strict mandatory clobbering on syscall
entry.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
