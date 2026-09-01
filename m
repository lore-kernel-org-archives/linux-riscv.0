Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02BDC624D0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 18:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1f+E++mIZqv9mBKaByJ9SizWMzEAClUqDf7f1o7u4XY=; b=AG/DQAOQIyhEYD
	wb+/0gfKvAyZU1KrRcVBPnJq1d8LRK/sKw204SHEDBAtvVJ+ursAfDh5wX+s47atfIgnHGq0hElvh
	1RvDp/suGgVdqZcYOrkyyxA6d17OBRK3YXsSB/xOxfh1RcnZsfa7le5Dx4xuNXvRTrJUfNyZkF2hW
	mO8utA/E+G5XbNHvFk9V/Y/SbL0AUzGAeyEqwWw4R7xkKDTQ+DKDflza2rSEHacy6dQnK6VWjyR76
	wsd+v3KChx7VL14SadWJ1IdUv4D4uT2eRp5cnfad2CioH0bt3gfWelp9Ptf5wATYzhaPBZ967s6C2
	JPk/GboHE25XibFqHf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TJY-0000000CybU-3ZFq;
	Tue, 01 Sep 2026 18:34:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TJX-0000000Cyb2-43u1
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 18:34:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 76FE840244;
	Tue,  1 Sep 2026 18:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EDF1F000E9;
	Tue,  1 Sep 2026 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788287671;
	bh=5NXgbY7RzU8g0Kf53Luap+wGnaz+b4K8573/iOsTQ/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I/ixn95taCRJGX4PAMNj/C2sqsS1ahSoeW9hr3nqYKv27L2TmqCZFfi1XeScTVlf+
	 cbstwnjn2a3/FJPdPre8LRomsAIgGvRkr30ufESK8Ikz1ihAT1e4EFZlbXk2zU8HLl
	 ICHHFQtXJZxvByz5b71CGGjk2IP+1XjSgOlMXEDq0LNZLLkh8BQHNzaOGHep5rMr7n
	 9ox1IiG5y5PYzg0A1y8r0QUfK0PPZkloaruwpOABRYG2htBc6Pz48lBnz1ZlV+utDZ
	 Iq+UfKLLwTr8PX+yV+aVmPr3HM7CzjtIchVC9ohRkL51kOj3+kssxJRDWicb2pXwkp
	 blNMtbtGrXCJQ==
Date: Tue, 1 Sep 2026 11:34:31 -0700
From: Kees Cook <kees@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Radu Rendec <radu@rendec.net>,
	Renzo Davoli <renzo@cs.unibo.it>, Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH] seccomp: Fix syscall skip logic on ptrace
Message-ID: <202609011132.F4A3EB7103@keescook>
References: <20260707181957.433213175@kernel.org>
 <al9NlZi20xHMvla2@kunlun.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <al9NlZi20xHMvla2@kunlun.suse.cz>
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

On Tue, Jul 21, 2026 at 12:44:37PM +0200, Michal Suchanek wrote:
> seccomp takes a shortcut here. When the syscall number is re-read after
> ptrace and the sign bit is set in the syscall number the syscall is
> skipped right away.
> 
> This works fairly well on x86 where the return value of the syscall is
> preset before seccomp is processed.
> 
> However, on some architectures the syscall return value overlaps with
> the syscall number or syscall arguments, and as a result the return
> value cannot be preset in advance.
> 
> For these architectures seccomp needs to exit without flagging the
> syscall as skipped. Then processing of invalid syscall number in the
> architecture code should set the return value to -ENOSYS and skip the
> syscall.
> 
> This introduces a change: If the syscall number has the sign bit
> set, such as -1, previously the filter re-check would not be done, not
> applying the filter after trace. Now the re-check is done both for
> syscall nubers with and without sign bit set. This would only make a
> difference if the syscall number or the filter was changed by the
> tracer. Otherwise the filter would be resolved the first time around.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  kernel/seccomp.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/kernel/seccomp.c b/kernel/seccomp.c
> index 066909393c38..9e40a38aaedf 100644
> --- a/kernel/seccomp.c
> +++ b/kernel/seccomp.c
> @@ -1318,11 +1318,8 @@ static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
>  		 */
>  		if (fatal_signal_pending(current))
>  			goto skip;
> -		/* Check if the tracer forced the syscall to be skipped. */
> -		this_syscall = syscall_get_nr(current, current_pt_regs());
> -		if (this_syscall < 0)
> -			goto skip;
>  
> +		this_syscall = syscall_get_nr(current, current_pt_regs());
>  		/*
>  		 * Recheck the syscall, since it may have changed. This
>  		 * intentionally uses a NULL struct seccomp_data to force

Does the seccomp selftest still pass with this change? I _think_ it's
fine; this just induces more work on a tracer-induced skip path, which,
in theory, shouldn't be fast-path: kicking out to the tracer is going to
be the slowest part.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
