Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2500CC4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 19:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Za1Y11vixN1uk0xxiaYQuXWDdjCkJgAMHfYt8XYE3As=; b=Ro6cUlzmHPLqaf
	szWYT9+NEuBW5CLyPGXuFLo/dHQLuTel8zdBqZnymyWDHwR0RY7g61S/BjM0ON3FUVIFc7a5earjn
	7EuWFymeQTiyAW/eS44J3JoXbAL5fUcWWwgMxPwnGfVGA1B82tac9JkSEVep4PeWZuEkb9ZbaN1On
	l5krAImIAu5tkhP7TRj/LRb45fvzdeBZdAC2mEY65ctp6DWpwQ6AX3PXbAtkcPrKmBuGADoJ8dzGA
	cgv9dGtuJO14rW1dva3VdhnJidW/NZZSMThhlNbOz4ZfAWuG6ifS9Zk8EV7ZlowpECmIg8jDvcV+A
	Q+ahgyPOAUInauybj/hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGAu-0000000AI14-0faZ;
	Tue, 21 Jul 2026 19:30:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGAs-0000000AI0y-32bn
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 19:30:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 07892417B4;
	Tue, 21 Jul 2026 19:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BD41F00A3A;
	Tue, 21 Jul 2026 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784662241;
	bh=YmXGibOWH8dStd4vMn1C6h1FWYZ670twuktK5zBhKAU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KA+P+kNF8bmMB29ntagD0cuP9XACtm/X66s4YEIZXnB+6mEyjaKuq19UbvomNIVNP
	 27XaASMm4/Ctvm6Mg6qjwoJqPo2SeHU6V/hmppM9aB9ohATzvqY4N9MNKlrkHRn/Br
	 q8fuIGakHcHpUYTpNTfs5HNV6k/pOaponEXGQkpnq1tZnQK3vbwwmymH+ROinL+TgB
	 O+Ge4QTHurl4bllhxw7E+qpUHB4PrBFi4PaRz3e192Ux6r4XEvNvy5HeyeMtbmIQMQ
	 ZEOFU/dwi9jyEuA1bZ6Q1smMCpAmRP0g2D5UQDCBtlDhSCa6rrfEt7OmZe4to1DpER
	 TEzI7uVZu9aZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93AF339253FB;
	Tue, 21 Jul 2026 19:30:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v4 0/3] riscv,
 bpf: Add support for signed operations and 32-bit atomics
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178466221139.987340.519683377902557290.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 19:30:11 +0000
References: <20260714002451.4091139-1-visitorckw@gmail.com>
In-Reply-To: <20260714002451.4091139-1-visitorckw@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, luke.r.nels@gmail.com,
 xi.wang@gmail.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 pulehui@huawei.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 alex@ghiti.fr, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
 marscheng@google.com, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
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
by Kumar Kartikeya Dwivedi <memxor@gmail.com>:

On Tue, 14 Jul 2026 00:24:48 +0000 you wrote:
> Add support for missing signed operations and 32-bit atomics in the
> RV32 BPF JIT compiler.
> 
> The current implementation lacks support for BPF_SDIV, BPF_SMOD, and
> BPF_MOVSX, ignoring the instruction offset field and treating them as
> unsigned or zero-extended. Introduce support for these operations by
> checking the offset field and emitting the corresponding instructions.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v4,1/3] riscv, bpf: Add support for BPF_SDIV and BPF_SMOD in RV32 JIT
    https://git.kernel.org/bpf/bpf-next/c/2e0fa2389c50
  - [bpf-next,v4,2/3] riscv, bpf: Add support for BPF_MOVSX in RV32 JIT
    https://git.kernel.org/bpf/bpf-next/c/c6a08afdfe3a
  - [bpf-next,v4,3/3] riscv, bpf: Add 32 bit atomic operations to RV32 JIT
    https://git.kernel.org/bpf/bpf-next/c/a1b37972efc0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
