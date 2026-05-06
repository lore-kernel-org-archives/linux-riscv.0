Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FEACD342C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 15:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0HfABeuR1jyKxZCxzS9yCaPCDD1PHfgS5rj+Sz3xbkg=; b=QIsljtrPREdDvW
	rYMf4YfZPc2RYiKMS/K/f3SbLjSbnIhJrG0DUUF0S3ON8zsijbDttlSb+o4WZfQPdI+tJlDhtZwr6
	ynpNjy3pNrvwCpbYfR+SErtFdSpoTdvC8+SnnAi0HwZ5ysuW9OPORqRuxgR8hVzcCubw4QEbX8Lqj
	4hx0m6Mbf2BYGZvQuSEvEyalhlej6uqE7822j7tbVuNOCU9UNdxerI+Mgz8NTrdDQ+EOxIWBjkMwe
	8ankq72c+GjoGEewzZrwFa4uknVDJOMj+9hBM4PlqoeJkweh3VoJvt0tqrb8MKj57/giWhD4zbw99
	NmCOgp8223YNhaaBUI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeBD-00000001KMh-1PX2;
	Wed, 06 May 2026 15:28:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeBC-00000001KM6-1Jfe;
	Wed, 06 May 2026 15:28:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C8961A00;
	Wed,  6 May 2026 08:28:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 471923F7B4;
	Wed,  6 May 2026 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778081332; bh=GIso8zzP6WAZvBCfiOiq2OM7xb6XbVZS+Ipq3OD55sQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BtEvq0hOdFvxUgOxCi2MB69loUyTEabOCf0BaPHD2hMrEuCGOXgUv/70AUtuV964m
	 aeCZZ0B7oQV/nD37CLaFZFnrdPqAG/fEOiVGTZiVZHq9BhO/sTZCn86wqVIkBBfO8l
	 AuSF/N1qkMfY3ghKS4w3SHk8JlixjHj4Z6b+0hd0=
Date: Wed, 6 May 2026 16:28:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Will Deacon <will@kernel.org>, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v4 2/8] arm64/runtime-const: Use
 aarch64_insn_patch_text_nosync() for patching
Message-ID: <afteLyir2cGUbEi_@arm.com>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
 <20260430094730.31624-3-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260430094730.31624-3-kprateek.nayak@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_082854_402454_B81F8AB2 
X-CRM114-Status: GOOD (  19.40  )
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

On Thu, Apr 30, 2026 at 09:47:24AM +0000, K Prateek Nayak wrote:
> The current scheme to directly patch the kernel text for runtime
> constants runs into the following issue with futex adapted to using
> runtime constants on arm64:
> 
>   Unable to handle kernel write to read-only memory at virtual address ...
> 
> The pc points to the *p assignment in the following call chain:
> 
>   futex_init()
>     runtime_const_init(shift, __futex_shift)
>       __runtime_fixup_shift()
>         *p = cpu_to_le32(insn);
> 
> which suggests that core_initcall() is too late to patch the kernel text
> directly unlike the "d_hash_shift" which is initialized during
> vfs_caches_init_early() before the protections are in place.
> 
> Use aarch64_insn_patch_text_nosync() to patch the runtime constants
> instead of doing it directly to allow runtime_const_init() slightly
> later into the boot.
> 
> Since aarch64_insn_patch_text_nosync() calls caches_clean_inval_pou()
> internally, __runtime_fixup_caches() ends up being redundant.
> runtime_const_init() are rare and the overheads of multiple calls to
> caches_clean_inval_pou() instead of batching them together should be
> negligible in practice.
> 
> The cpu_to_le32() conversion of instruction isn't necessary since it is
> handled later in the aarch64_insn_patch_text_nosync() call-chain:
> 
>   aarch64_insn_patch_text_nosync(addr, insn)
>     aarch64_insn_write(addr, insn)
>       __aarch64_insn_write(addr, cpu_to_le32(insn))
> 
> Sashiko noted that aarch64_insn_patch_text_nosync() does not expect a
> lm_alias() address and Catalin suggested it is safe to drop the
> lm_alias() for runtime patching since the kernel text is readable. The
> address passed to fixup function is interpreted as a __le32 and
> dereferenced as is to read the opcode at the patch site.
> 
> No functional changes are intended.
> 
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
