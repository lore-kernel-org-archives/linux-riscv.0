Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08912C79F85
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKmp9gQc/FeN2UKhYnHGbnGvktvfmv4LrEqpGxNnwsM=; b=Byesj4gue1aFYu
	vgnMTCL0pCQBpfXW8eIF38D+66TEFHHCdLgXW0TiinxJUSmJ2TfYA+Liv5WuBuRd+nqvUKF8DfD+1
	O7B/abMUsuMUcrk2K2QkWFOhdp8+vqhSKMbQgEW23Cvkwdww+jQuiVgbb0saKXAr3sUZ/OapWBUPO
	IoLJeez1kkd6TXGUkZ0HwC7OTwy+HejxxDrcmw4oddYc0wY9UanEPPl8UxlJXU3hEe4vKOI9fn1WT
	Zku7KO7mbB2+V8HJikJYRuWOQ2tHADpPmFSZz9d9RIOnH68hdCMNN4lYfcBWtnT4BXtFNxOIA8vky
	YFRjUaWXY7p/XEQV1npg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Dtx-000000055bL-49Hz;
	Sun, 06 Sep 2026 14:31:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Dtx-000000055b8-0ErA
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 14:31:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE3F043D85;
	Sun,  6 Sep 2026 14:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF641F00A3A;
	Sun,  6 Sep 2026 14:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788705080;
	bh=phI0pFUU/TbdwawklPiQe1XCuRfE6yBbtcnr3EzdFHg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CqYhMKZKeD4ZYmsZULDapZBRn+eDyRt0PWZBhFrOvp9gaa3qIqGUYw3KcpIdNUaF/
	 NjaQWiVtizwgr7tmUdWWoj4N3SDS943FA2Z+Drp8Yw9PL42lTR+0l/vcF4ZLUmxmfT
	 niSTUPzbVDz3c+PF0Y0vFUqwZN3mz8/8VTsT4mOjStirxmRgvxF0x43lAFWNHRTtSG
	 ZlyLq9bBTvVNEKQ6yRiYpnODvYLu/ckXUANx7cTH2qgF1Uft5kPzEvNgfDRyq3a/EM
	 yLDB1+fch5xmC4RfYgf5qYgHxBCCuXAJ//nIuvK13Xtuy0Ym5LYaRF7yGAaSz6wdn8
	 PD6G/p+Exyn6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A9E39253F7;
	Sun,  6 Sep 2026 14:30:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v5 0/3] Add bpf stack arguments support for RV64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178870502013.1578634.1317677297595952017.git-patchwork-notify@kernel.org>
Date: Sun, 06 Sep 2026 14:30:20 +0000
References: <20260905085857.14143-1-pulehui@huaweicloud.com>
In-Reply-To: <20260905085857.14143-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, jiangfeng@kylinos.cn, bjorn@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
 memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, puranjay@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com
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

On Sat,  5 Sep 2026 08:58:54 +0000 you wrote:
> Implement bpf_jit_supports_stack_args() on RV64 JIT to allow bpf
> subprogs and kfuncs to pass and receive more than 5 arguments.
> 
> Tested on riscv64 QEMU with LLVM main [1]; BPF-to-BPF and kfunc
> selftests pass.
> 
> [1] https://github.com/llvm/llvm-project/pull/189060
> 
> [...]

Here is the summary with links:
  - [bpf-next,v5,1/3] riscv, bpf: Remap BPF_REG_0 and RV_REG_TCC
    https://git.kernel.org/bpf/bpf-next/c/f80a09c486e7
  - [bpf-next,v5,2/3] riscv, bpf: Add BPF stack arguments support for RV64 JIT
    https://git.kernel.org/bpf/bpf-next/c/ba754185f902
  - [bpf-next,v5,3/3] selftests/bpf: Enable stack argument tests for RV64
    https://git.kernel.org/bpf/bpf-next/c/7687f1cbbaf8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
