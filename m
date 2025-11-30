Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BA4D116F3
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Nov 2025 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rNrnHHty13aF8mqhVTPYY2pOVzPSbo5bzWSewKOZHY=; b=xF8XAGBFnWi8qj
	2kIPiRIYys+c8ReLxCsXOM+KPZm1c0Y5pzKupHnEGYWQaGERKvTJNdKeE5QmO199lFwR7QvjWGkDN
	aNXm6Vs9BjVUlmGPQUyHFtsxFkOMqZRAXJOf53TV8FkP6b7j6gNu4OWkWgUIytKxRqKaBFlQLVMrj
	nGOtdh4T3SYqcNuP/LhasNLfaOA7rub1ZMBFW6NZ3aFunMigUhmfwUX1PbtcNf2xX4O3X/CWnwPe9
	qlwx2HmQghDVCwFeTCYc+JOjznZH3l84Dt0YmyAVoPTfoyjVNKgrSdgNgFYRffpCmdVjBsiu/uxWI
	erLBLvhCAVBuK+ihPVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPmCV-00000002TsR-3Dzh;
	Sun, 30 Nov 2025 18:31:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPmCP-00000002Ts1-3lvt
	for linux-riscv@lists.infradead.org;
	Sun, 30 Nov 2025 18:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB0E443BC0;
	Sun, 30 Nov 2025 18:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36188C4CEF8;
	Sun, 30 Nov 2025 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764527464;
	bh=CKsK+rZkyPj9l638j9wDyzGlROqChz/TMWPHpx0tNRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3o7TK7ivBGxABHNZK+hYdznvpHQQ8FEKIrYEKrSSFYVvJfav69c+0BP+zWbq/H4R
	 ZaC1sh6ChiBRb8xLvAIPPAjV8S5xnDMtRt/tfQxh54l+1/Op3wvH9eYFHAmtig1PKK
	 gqEW2rI8OvmsBtYJZLyI7K7Tux9yrskUdrVJL2cB1kQXini9k4lzML7EbPxX0owUnO
	 cqCNWX16CcntAgQqxtUHrYvQZNQkFI3MH9ehWHDP5+4FOTWCiFyIzYx2SC1EDvWnTO
	 moTRE7WpapEnlqsRXvpGZNPzr/hYDl8IlaPVpJD90MwbW6Y2705u2ofQP/7oVq3glF
	 dHut5tkfaspqQ==
Date: Sun, 30 Nov 2025 10:29:14 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Jerry Shih <jerry.shih@sifive.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: riscv/chacha: Maintain a frame pointer
Message-ID: <20251130182914.GA1395@sol>
References: <20251130-riscv-chacha_zvkb-fp-v1-1-68ef7a6d477a@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251130-riscv-chacha_zvkb-fp-v1-1-68ef7a6d477a@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_103105_960663_3C77326F 
X-CRM114-Status: GOOD (  13.55  )
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

On Sun, Nov 30, 2025 at 06:23:50PM +0800, Vivian Wang wrote:
> crypto_zvkb doesn't maintain a frame pointer and also uses s0, which
> means that if it crashes we don't get a stack trace. Modify prologue and
> epilogue to maintain a frame pointer as -fno-omit-frame-pointer would.
> Also reallocate registers to match.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> Found while diagnosing a crypto_zvkb "load address misaligned" crash [1]
> 
> [1]: https://lore.kernel.org/r/b3cfcdac-0337-4db0-a611-258f2868855f@iscas.ac.cn/
> ---
>  lib/crypto/riscv/chacha-riscv64-zvkb.S | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Do I understand correctly that the problem isn't so much that
crypto_zvkb() doesn't set up its own frame pointer, but rather it reuses
the frame pointer register (s0 i.e. fp) for other data?

That's what we've seen on other architectures, like x86_64 with %rbp.
Assembly functions need to set their own frame pointer only if they call
other functions.  Otherwise, they can just run with their parent's frame
pointer.  However, in either case, they must not store other data in the
frame pointer register.

Is that the case on RISC-V too?  If so, the appropriate fix is to just
stop using s0 for other data; we don't actually need to set up a frame
pointer.  (Note that none of the RISC-V crypto assembly code sets up
frame pointers.  So if that was an issue, it would affect every file.)

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
