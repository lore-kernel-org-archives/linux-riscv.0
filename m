Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D4BCA9ECC
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9qH8fsjXxM1Zt5Z7fy90uTbSTf8kMYeazhpfecLsOg=; b=JXLyRnFXhzGgph
	JQaC1Uxead0chvoFqR7bgANBQHf6PQOWCxudb9EoXqKlZI9sM9GFtz/eMjaMgaO+6gkpwOZkVIY/n
	55/RRsWnS2LmKAmDU8z0saj5/M7rXofe4ahdlGUBvLfvt7hq72lZ63++rQM4ILqifgd2TPZxZOCuX
	ej6OZkjxgMNZmlZsTyn26CPBCRYpK5IoKgPA6vQ6VLh9nFXe69YtoJXX7EE/d/A0VEQhl8MUj/xZd
	9Ojt8fnLZQMjPZqd6sh8t9oitQAir758lNY7/oOrU1UP6iGVzGtYbrWllfWunxeK/RxpfI7lKt2qZ
	ICc5MVNZAaDe6Wrj3dQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtmg-000000094Z5-1mO8;
	Sun, 11 Oct 2026 13:40:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtmf-000000094Yl-1dwG
	for linux-riscv@lists.infradead.org;
	Sun, 11 Oct 2026 13:40:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2991243D86;
	Sun, 11 Oct 2026 13:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0766A1F0089D;
	Sun, 11 Oct 2026 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791726013;
	bh=Z+Ap3ydhCu4AooYx/51dx3+KSpMeHG8siG63oRlEFx0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KZxffYvPeCalj/zsKFjYmNRiW7AvA3JUlBag1iNWnHoMQxX7Xhp1dg4zkfTrUmNbE
	 WMJsScCmDtlLvQ1YZ6c6G3eA0oIOsYPy4AykqjqLQlHZ0kMIQxpZJM/1rs1XothFYe
	 WPehT7puO99jOO+vJRfu1YClzxJuvyvHR/fFJ05AD4kTHQ6WaejRs259KRuUWlVQ4g
	 wGSgMpJfdptkwLBj5TMmhzHUt6DqB+n9EuDWVOo/uAnQj/1M2o1O2vsE3yjvHsCjgY
	 1FUHxC0pqTsCeG24/CjoaA4rLIGtGQuj8nz0geYIdAKU+uGj8E4K3s72w1eGFTD6VX
	 8nmQEqjrXDErg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F145B3811966;
	Sun, 11 Oct 2026 13:40:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 0/4] bpf,
 riscv: Add support for indirect jumps
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179172601151.2055679.7493510397466756418.git-patchwork-notify@kernel.org>
Date: Sun, 11 Oct 2026 13:40:11 +0000
References: <20260928071845.2432-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260928071845.2432-1-cp0613@linux.alibaba.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com,
 bjorn@kernel.org, puranjay@kernel.org, ihor.solodrai@linux.dev,
 eddyz87@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 pulehui@huawei.com, pjw@kernel.org, palmer@dabbelt.com, shuah@kernel.org,
 guoren@kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On Mon, 28 Sep 2026 15:18:41 +0800 you wrote:
> The indirect jump instruction (BPF_JMP | BPF_JA | BPF_X, "gotox") and the
> BPF_MAP_TYPE_INSN_ARRAY jump tables it consumes are core features: the
> verifier accepts them on every architecture, and the x86-64, arm64 and
> powerpc JITs implement them. On riscv64 a program using gotox passes
> verification and then fails to load, because the JIT does not know the
> opcode and CONFIG_BPF_JIT_ALWAYS_ON leaves no interpreter to fall back
> onto.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3,1/4] bpf, riscv: Add support for indirect jumps
    https://git.kernel.org/bpf/bpf-next/c/c0316386fecd
  - [bpf-next,v3,2/4] selftests/bpf: Enable gotox tests for riscv64
    https://git.kernel.org/bpf/bpf-next/c/5f750ad6d675
  - [bpf-next,v3,3/4] selftests/bpf: Enable gotox liveness test for riscv64
    https://git.kernel.org/bpf/bpf-next/c/6ce75af4f59e
  - [bpf-next,v3,4/4] selftests/bpf: Enable instruction array test for riscv64
    https://git.kernel.org/bpf/bpf-next/c/eec2444d9b9d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
