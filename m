Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7B8C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:10:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22A0E61073
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22A0E61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kftdIBKE1vQfxDghXG/Zme7ZxipTjv2fZZJCQwKbkbI=; b=h1EER7rxAY1Rdq
	FlAmnVxohS6g+CKNmd8p2I7G8v+3E70AlTLMwevc/cm5oBqfCXoEehZuoNCABA93xYEpnV7qjYziR
	ZxAXExYOXLuxNL4MOrhK4dDdS71y/fyRUmyssi2oG2SnzDP4GnQjhN6rSlQjtpPyh9uiy0zAu2RO0
	Zn/abaDWFI96R2RHPveewSEGSF8FIpHc23DXL//R1g1zBmz/ZHhzgdUhXqhruqPUoZ9TRn7mbbz9Y
	ArpoktNeFrSItN2Go+f9gNY2Y3wXZyllpQUFLRRappNpo0DkiU/bya01vFk55dxdkReCx9pUrqvIH
	lf4/8OWju/BCNmN1PeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfs3f-006TO8-9l; Wed, 27 Oct 2021 23:10:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfs3c-006TN7-BY
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 23:10:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id E4AE961040;
 Wed, 27 Oct 2021 23:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635376208;
 bh=TMOjPuBi30omm3OUP+u3FY5YEYx/Fers7Q3speDYL70=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ewjnVUVSADGqvovFoOISngvEzer+/1cRAF+JPrAc2UBw+XlZQ6k5ewnNE+OJEorrZ
 RXEPFxuWzxGKGmam8ryq8cDviPzqa52XbanzGmAocOXKT7wHF8WDu36mJQa7RhCTWR
 WaqS2L18p/ZkmiM7OuAWdtrNCAPoQeyudbIIUnH/Y7BlwtxMsFP7NkZUOOM3mPZ0bv
 pW4Ao8tElfgL4SAXIcKU4/PGgsD35EdxX0Iol5yLOQEKhr5TM6VifXE62DaVFUiSqj
 JI11+q1V3r9VKT7TQXMIrKmU7qbmG1+Ly2Sth9Ruq4CXfnh78Myyp5WXgxN8fLzmRl
 tPYednYtvvymA==
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next,v3] riscv, bpf: Add BPF exception tables
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163537620786.14362.5033693418821355895.git-patchwork-notify@kernel.org>
Date: Wed, 27 Oct 2021 23:10:07 +0000
References: <20211027111822.3801679-1-tongtiangen@huawei.com>
In-Reply-To: <20211027111822.3801679-1-tongtiangen@huawei.com>
To: tongtiangen <tongtiangen@huawei.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, palmerdabbelt@google.com,
 aou@eecs.berkeley.edu, bjorn@kernel.org, luke.r.nels@gmail.com,
 xi.wang@gmail.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 kafai@fb.com, songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_161008_436987_33651B83 
X-CRM114-Status: UNSURE (   9.70  )
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

On Wed, 27 Oct 2021 11:18:22 +0000 you wrote:
> When a tracing BPF program attempts to read memory without using the
> bpf_probe_read() helper, the verifier marks the load instruction with
> the BPF_PROBE_MEM flag. Since the riscv JIT does not currently recognize
> this flag it falls back to the interpreter.
> 
> Add support for BPF_PROBE_MEM, by appending an exception table to the
> BPF program. If the load instruction causes a data abort, the fixup
> infrastructure finds the exception table and fixes up the fault, by
> clearing the destination register and jumping over the faulting
> instruction.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3] riscv, bpf: Add BPF exception tables
    https://git.kernel.org/bpf/bpf-next/c/252c765bd764

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
