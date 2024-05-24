Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF6DC25B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+RCaya1QsnI8T9bOw624XHN1CDhrxoddsuSBdONX7k=; b=cTEnVuXSCkMhwK
	FqR7qLuXq1lFIjWt/ZvZxb660FNJe2ApSWXaeZbnYE1Myg15+VAcf8/QEa4XAHJDgh+QAMemCnEQ5
	R2E+7pxCB6tsq+zVLqroFZ55hZ8sH9BL0qxVVf5x9gEodxkKZDRVOgmfSYUNY689VKSgDMjXOLjKt
	/o4+K58EZ6a0vZNZiE5w7PJc/guWzOu3TbWYBRjfSc5CiOQBzyKG6CJTIUewBIh8ZibyFg+TIHVQ6
	r4o9AOKyclFaXOZSRGkMXlG9n0av7sd5iQ/CIqlQkQVBWGsEgm2zVCjfL1yhecQxWEC7qUwLJUPMv
	1dnqnQgahgAA+mxYy71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAWZ4-00000009C5a-2B5G;
	Fri, 24 May 2024 15:10:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAWZ0-00000009C3Y-0YUS
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 15:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 41BEECE193C;
	Fri, 24 May 2024 15:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61C6EC2BD11;
	Fri, 24 May 2024 15:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716563430;
	bh=n2nVq9uBRW/+tTHmYejkkxsXh3ZAk1u/RyQ33umea+M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c6kAgCHSjKzIy7bgO9Eg9w8pt9KP5pQYhw3CasZlpQzHX9Egpby2xNCKmcpUNjNuA
	 yxBWENANqY43kFmgODCQVri6zQhGxLpIw/U2QF7olGpauTXD1ME3TQl110h3F0m8CX
	 EELATZmmNoqb/2hMhjlaK3tq5q3msfmGoah4xrws5t/fLrry1nF+djiAKdbdiLR6/m
	 Z6M79A8cbzf8LXqaM4NAMwMWhnjLYzukEgVHM4wBU3FpatuN0VmYOl621U4wTkcUb7
	 M1WhxWWoH43rEXNDPIbqZ8Rs/h1XFn7xi4+KM+Q15bCm2OWrqqNp2EG7YHW0Jw+XNK
	 8u3wM+FmxqFqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 49CCBC4332E;
	Fri, 24 May 2024 15:10:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv, bpf: Optimize zextw insn with Zba extension
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171656343029.3209.10149460674522827250.git-patchwork-notify@kernel.org>
Date: Fri, 24 May 2024 15:10:30 +0000
References: <20240516090430.493122-1-xiao.w.wang@intel.com>
In-Reply-To: <20240516090430.493122-1-xiao.w.wang@intel.com>
To: Wang@ci.codeaurora.org, Xiao W <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, pulehui@huawei.com,
 haicheng.li@intel.com, conor@kernel.org, ben.dooks@codethink.co.uk,
 ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_081034_587109_1609C29C 
X-CRM114-Status: UNSURE (   8.39  )
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

This patch was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Thu, 16 May 2024 17:04:30 +0800 you wrote:
> The Zba extension provides add.uw insn which can be used to implement
> zext.w with rs2 set as ZERO.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
> v3:
> * Remove the Kconfig dependencies on TOOLCHAIN_HAS_ZBA and
>   RISCV_ALTERNATIVE. (Andrew)
> v2:
> * Add Zba description in the Kconfig. (Lehui)
> * Reword the Kconfig help message to make it clearer. (Conor)
> 
> [...]

Here is the summary with links:
  - [v3] riscv, bpf: Optimize zextw insn with Zba extension
    https://git.kernel.org/bpf/bpf-next/c/c12603e76ef6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
