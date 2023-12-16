Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D607C35274
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 00:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qbns7L8TR3sOEriozof6WVUkhaPskGsXVQ2/OsfzAHo=; b=uQsAxRriMQJJx/
	rVWUTEdUcurj3xXfoW/TFBqjq4aB0z8Vs/V3tJWAvHrvDIXoirrVTUyjHt48b+Q5CySgzf9o9hS8k
	N6gA7Mnqrm11AekO746edSizbJW+Thos9fzTbUQ9Nn+BKURtaLxDfrTEk3/KeuVN47A4E8ZxuQ1N6
	Xygh0kPKKzArGlPJ3f09n9Q/FRMsUb6/eh4ysCwbSGfrHWQUKxJGqdzqmswuPQ+6D2zy37M5VEASq
	RqVZXPNBMg5x+hxjMZTxLEzDEMEyJdJsLrk8uMKLkm3nNTvU9hMEtAQjXqovfl29xKDpsun/NCYEO
	b+wk6d42TFVJmPjMhrMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEIsy-0052mN-2Y;
	Sat, 16 Dec 2023 00:50:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEIsv-0052lX-0k
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 00:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C568FB82B1B;
	Sat, 16 Dec 2023 00:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 095F5C433C9;
	Sat, 16 Dec 2023 00:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702687826;
	bh=REY7ZuYT6jJPWfRPau8JDVsTne7UEvPQl9xgjwckxWY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=slo6GkaMTr9Way21zMIC0ORgchmdQJ92oHVwPGLzYvJxlTIO07OQnb3yhpnDzASu0
	 2dsRQpqcgwnYqd8gGhAagAZ6g9qwxz705a1J87TNXpnKrROmlQe79ntUIY2TrPPbfY
	 6/YjRpNviWEMP3xEODOO3iXxMDhSiya0Bznjw7SgqgYOsa0Tev8ogI/4I+Jbdub6PW
	 ei+OrtP/Z2jkVWA7w1Ik0zCH9TZYqr1FFQQ774zT5AYJzGwvhwMDrHab+KgaBrzykF
	 WYlQiq9IHYRQHiXIr37j1iqpANyKaoX0OBapWKDX8VbVG/UvLvX6NLkLr/E2LfRPSH
	 uJRmdn/n5bg3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E25A2C4314C;
	Sat, 16 Dec 2023 00:50:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/7] x86/cfi,bpf: Fix CFI vs eBPF
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170268782592.26334.17481945540978625909.git-patchwork-notify@kernel.org>
Date: Sat, 16 Dec 2023 00:50:25 +0000
References: <20231215091216.135791411@infradead.org>
In-Reply-To: <20231215091216.135791411@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: alexei.starovoitov@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, davem@davemloft.net, dsahern@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, arnd@arndb.de,
 samitolvanen@google.com, keescook@chromium.org, nathan@kernel.org,
 ndesaulniers@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-arch@vger.kernel.org, llvm@lists.linux.dev, jpoimboe@kernel.org,
 joao@overdrivepizza.com, mark.rutland@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_165029_446756_250B2A92 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Fri, 15 Dec 2023 10:12:16 +0100 you wrote:
> Hi!
> 
> What started with the simple observation that bpf_dispatcher_*_func() was
> broken for calling CFI functions with a __nocfi calling context for FineIBT
> ended up with a complete BPF wide CFI fixup.
> 
> With these changes on the BPF selftest suite passes without crashing -- there's
> still a few failures, but Alexei has graciously offered to look into those.
> 
> [...]

Here is the summary with links:
  - [v3,1/7] cfi: Flip headers
    https://git.kernel.org/bpf/bpf-next/c/4382159696c9
  - [v3,2/7] x86/cfi,bpf: Fix BPF JIT call
    https://git.kernel.org/bpf/bpf-next/c/4f9087f16651
  - [v3,3/7] x86/cfi,bpf: Fix bpf_callback_t CFI
    https://git.kernel.org/bpf/bpf-next/c/e72d88d18df4
  - [v3,4/7] x86/cfi,bpf: Fix bpf_struct_ops CFI
    https://git.kernel.org/bpf/bpf-next/c/2cd3e3772e41
  - [v3,5/7] cfi: Add CFI_NOSEAL()
    https://git.kernel.org/bpf/bpf-next/c/e9d13b9d2f99
  - [v3,6/7] bpf: Fix dtor CFI
    https://git.kernel.org/bpf/bpf-next/c/e4c00339891c
  - [v3,7/7] x86/cfi,bpf: Fix bpf_exception_cb() signature
    https://git.kernel.org/bpf/bpf-next/c/852486b35f34

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
