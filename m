Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4131EB8FAD
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 02:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/gZdpdaFz85TcxveSbAiUnU56B6JoHqKrgXPOt2Kpk=; b=1jL7jTtPK6MwER
	X2vS7h8opf4wkAsuuP28VLE3LpbH7F78G6hBCRQlB0himha0ilhjbLAIjVBxZ5t4W5pmIY0N02SkA
	d005Kd7OT5eBBSNpvRseMjRIoRR6F3QxBf6qaPMUuTvjmEdkumtewGv/tqcSGNgbm1sDJitX9VAOn
	OHnyNW6deDrcAuDmscyl9+iu+luO1wR6gZarlJ44eNF/BtVjRit9Yiwf0VVTFx/RGZ/XrVLKcHxq5
	IrpZj4eUEWKb28kARI6LL3J7FfLuDC+whE+HodKLihbXakZvXdeTZz/0IIih38Y17vbMZJCfi45Dq
	AedhbLNX3wXjxz21EcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdicl-0076Fx-1w;
	Wed, 06 Sep 2023 02:50:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdich-0076DE-1l
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 02:50:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 77DF9CE11D9;
	Wed,  6 Sep 2023 02:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9780FC433C9;
	Wed,  6 Sep 2023 02:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693968627;
	bh=1XHRzrMMV+lnj21rzfdeP3GG0PRTjver90SOcRj/7lU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BAIb/X/DXGtOFlpd1x6e0Qzzu2aVOKBTPtMLhoNTMB7DIjx+0pW9n3bv0cZ2XxptF
	 eaQmGkg5IPQip7grskE3exmjRkjPtCEr6b9c5uMWkyUnHy2iFio7vK62guHCWD+7bU
	 0t/F24LPo/hjXhKczCSfKk/Vi7MtPKyu9p1GSfUXckoXgQAytIbXiPxJFRWjEstpZc
	 ROCqugKdxoGDJ6+l0UnlvprmtDorlXAwb4pYEd9jSjeE6CyFSRwIu/ebdJPj7Zlv1O
	 Oul6pcuvvDj5Wc1ROD+ruafEeZMlimKzMSL+mtnuF2qF56aAj3CS75kKLNF3tyiXfn
	 fISCpKN+Mi9mQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79492C595C5;
	Wed,  6 Sep 2023 02:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v4 0/4] bpf,
 riscv: use BPF prog pack allocator in BPF JIT
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169396862749.1987.4994366714692856707.git-patchwork-notify@kernel.org>
Date: Wed, 06 Sep 2023 02:50:27 +0000
References: <20230831131229.497941-1-puranjay12@gmail.com>
In-Reply-To: <20230831131229.497941-1-puranjay12@gmail.com>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, pulehui@huawei.com,
 conor.dooley@microchip.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
 kpsingh@kernel.org, bjorn@kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_195031_767465_3D9E441E 
X-CRM114-Status: GOOD (  12.27  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 31 Aug 2023 13:12:25 +0000 you wrote:
> Changes in v3 -> v4:
> 1. Add Acked-by:, Tested-by:, etc.
> 2. Add the core BPF patch[3] which was earlier sent with ARM64 series to
>    this series so it can go with this.
> 
> Changes in v2 -> v3:
> 1. Fix maximum width of code in patches from 80 to 100. [All patches]
> 2. Add checks for ctx->ro_insns == NULL. [Patch 3]
> 3. Fix check for edge condition where amount of text to set > 2 * pagesize
>    [Patch 1 and 2]
> 4. Add reviewed-by in patches.
> 5. Adding results of selftest here:
>    Using the command: ./test_progs on qemu
>    Without the series: Summary: 336/3162 PASSED, 56 SKIPPED, 90 FAILED
>    With this series: Summary: 336/3162 PASSED, 56 SKIPPED, 90 FAILED
> 
> [...]

Here is the summary with links:
  - [bpf-next,v4,1/4] bpf: make bpf_prog_pack allocator portable
    https://git.kernel.org/riscv/c/063119d90a06
  - [bpf-next,v4,2/4] riscv: extend patch_text_nosync() for multiple pages
    https://git.kernel.org/riscv/c/fb81d562ed1f
  - [bpf-next,v4,3/4] riscv: implement a memset like function for text
    https://git.kernel.org/riscv/c/f071fe652d73
  - [bpf-next,v4,4/4] bpf, riscv: use prog pack allocator in the BPF JIT
    https://git.kernel.org/riscv/c/19ea9d201008

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
