Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B237AC3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 20:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zT9kG12DEj7lrlrQlYVwfCYWX64gVetZZSlYWKjDwBE=; b=up8XH369CzrW6E
	G9bC3xnwLk1z2jxeaB0+ynPllY4sBya1fbl0G+YZ2Fr7xJJb3Q0rQLrsyA4u6tacdMSca5gxOynI8
	TLun9BPdjyjqcdn5o45EQba3rIl1nkQyX8+269rSNMUIlOxnPy0xLvbC6RO0/tHcVqmTavbzN4uHv
	ofQZXvJcGPPcRHAdWiyt1okhWDb1IwKCfzKQ+h7K2eDZ97TxnJyQIC1RAiqbfsvvmf0I3wjdhOUdg
	EmBb8w7ZQkhiAcgfKEV1yfWH9PDjHdnfD2GcZMbbUmQhjzwgkHr7WMky1GQQp4iqly4+Tjvfv6C8Z
	nQVWrbaVZFFnLhxq3bZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2eQz-001tqF-Gc; Tue, 06 Dec 2022 20:20:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2eGf-001msm-K4
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 20:10:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E755D618B8;
	Tue,  6 Dec 2022 20:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1A05C433B5;
	Tue,  6 Dec 2022 20:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670357415;
	bh=7x50CScDOIJMnBGxmUQtcorCJJNWjKUzQHyCRXqOD+U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qA5J1RQoZ840quVQ2lEJGT4rrd3vFVaJUnU2gdMH3j5HFMd8fXY2y/PKQYakSjZHT
	 TYTl2+X29P9e9X2GpfHhhc5EqVopyXAbDzRs5Wyn3W87tJ52N5swya4TnxW2+jQKz6
	 a06WN5u3lEY4auzlF19qF6o5GNnyEc8OLUnwsa/eBr7N8NFda+5iB9Ll9jqEkxUTMF
	 KG7uv3IILFR6bNAkm3cf+e7vP4bxagoPW0xeupHrNvwCx8/ECAEEcmWQvkUD0M/NV+
	 SHsWwbga1DZkodxLewjo7ZEnqwf+VcfxqVQPtqjh0Oouz+bsVmj5iF6PGJyIIIYFQr
	 nje956gak3aBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AAFFBE56AA0;
	Tue,  6 Dec 2022 20:10:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf v3] riscv,
 bpf: Emit fixed-length instructions for BPF_PSEUDO_FUNC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167035741569.3897.9540113126251004476.git-patchwork-notify@kernel.org>
Date: Tue, 06 Dec 2022 20:10:15 +0000
References: <20221206091410.1584784-1-pulehui@huaweicloud.com>
In-Reply-To: <20221206091410.1584784-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_121017_745941_58EFB988 
X-CRM114-Status: UNSURE (   8.32  )
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

On Tue,  6 Dec 2022 17:14:10 +0800 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> For BPF_PSEUDO_FUNC instruction, verifier will refill imm with
> correct addresses of bpf_calls and then run last pass of JIT.
> Since the emit_imm of RV64 is variable-length, which will emit
> appropriate length instructions accorroding to the imm, it may
> broke ctx->offset, and lead to unpredictable problem, such as
> inaccurate jump. So let's fix it with fixed-length instructions.
> 
> [...]

Here is the summary with links:
  - [bpf,v3] riscv, bpf: Emit fixed-length instructions for BPF_PSEUDO_FUNC
    https://git.kernel.org/bpf/bpf-next/c/b54b6003612a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
