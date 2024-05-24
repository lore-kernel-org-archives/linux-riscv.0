Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E450FC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4UuAeBZuLeM6lduww0kJB6cSlT968ScX8OI8BL7xy8=; b=g88QjrJj5VpLFn
	jCg32wdQIa8/LRVJeXzEJZf2cfNhtgMNSxzisRL3RsULejOZM2VcExLwoO6GnTAlBrbti/oMqNn8z
	j9E6Hs8yomYb4KVUFi2wcM2E/gFzYf204Xct7rs4OaLeZzbbJ7tkT3oAS/cFd15eHFLX7dpS81L6X
	FSs3QJAWyh37IijTzrBWlrL/+kJu9tXVpBF5pjYeEgv2UEh5SgoWjNcNoilOCpCOM8AJvDX7ZUtZU
	i54U6sJZYH+nxGfJFtM+JjruxQdmALy/C0p6H2DvBev2SFxpD2RF2dzbOHHqTJ3E1vV2DKYd0km3J
	aDV2S4PrWDR29ac19hug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAWZ2-00000009C52-2pQa;
	Fri, 24 May 2024 15:10:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAWYz-00000009C3Q-2YYp
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 15:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4109D631A7;
	Fri, 24 May 2024 15:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71F89C32782;
	Fri, 24 May 2024 15:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716563430;
	bh=7qsZ8KN++70H6o9fyfEB2QodwleEGL1Akph4exyG+Zo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BDkRkS3uDN8twuAGNaLqAvJGKCkDBHrkDQvt2EzU/xrD2lFmz0HNwv+3dauIWCJ3v
	 itv7Ic1UJ8xXwVu41NWCOxN/NC1iFYdYvUFKfoByKwZI/Fv3KV78XS4PsmlYNtocv5
	 DeBpt1Gcx+LeZ4M+ndE+bIfEEYjP9qnBIsred9uRUAyn3jKeY+B2/kkLZpcc5B1q2D
	 q51mAGgohm+pXPobc94M+1fHkYEyhaH7GJImnKaQYDaBRHL2TKOr250Goz5PtevAlL
	 9irqUTHmJvJtUjfgcEMbolMAOyoaJPD7etvOurMLMzYOkhWmwTAN6EtLGpUvHQhQcb
	 A1jRKP+Le2Cdg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55F11CF21F9;
	Fri, 24 May 2024 15:10:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v4 0/2] riscv, bpf: Introduce Zba optimization
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171656343034.3209.12321836414895669166.git-patchwork-notify@kernel.org>
Date: Fri, 24 May 2024 15:10:30 +0000
References: <20240524075543.4050464-1-xiao.w.wang@intel.com>
In-Reply-To: <20240524075543.4050464-1-xiao.w.wang@intel.com>
To: Wang@ci.codeaurora.org, Xiao W <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, haicheng.li@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_081033_732064_8179D930 
X-CRM114-Status: UNSURE (   6.40  )
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
by Daniel Borkmann <daniel@iogearbox.net>:

On Fri, 24 May 2024 15:55:41 +0800 you wrote:
> The riscv Zba extension provides instructions to accelerate the generation
> of addresses that index into arrays of basic data types, bpf JIT generated
> insn counts could be reduced by leveraging Zba for address calculation.
> 
> The first patch introduces RISCV_ISA_ZBA Kconfig option and uses Zba add.uw
> insn to optimize zextw operation.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v4,1/2] riscv, bpf: Optimize zextw insn with Zba extension
    https://git.kernel.org/bpf/bpf-next/c/c12603e76ef6
  - [bpf-next,v4,2/2] riscv, bpf: Introduce shift add helper with Zba optimization
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
