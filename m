Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A23C3601E
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/ECHH7Sod366xpxRVIt51U3+t5pil00kHMj4/CJkEk=; b=eHzdU/FRM4LdcC
	ytCFAZ8Gx+tnvTlYNQMhlB4qnaHQgtSfO2ydpBFVHmewSKUBj2GN31JgRzsumOMHDeIvF/sUoq/+e
	Ga08/e65vMHbnonJG0F124MciyL2ucV8ZH9G2gxDN5hJv2v1bB/oKAGgIruWSwwYBFYkVVWj1tY/U
	2he0RDeM1t64TdKVB4Syx//5uPesIKMQdOpr/NhA6MTt6bUwML6QJ1ahCkRsTsAtYZrlRzj2XW203
	OpcU5AAn4sUG4qUCGZpmlkT3nuv5KyxMp8F7U4hgxMFkuvk+P99ikxbLiZMgUwsfCAtUT67T1qx4R
	Xdz8z8yKNmxdFJRiorkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp5-00000006Axb-0o0T;
	Tue, 17 Sep 2024 13:00:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp2-00000006AvM-1D9R
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:00:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D78C45C592C;
	Tue, 17 Sep 2024 13:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824D7C4CEDB;
	Tue, 17 Sep 2024 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726578046;
	bh=vTvMx1oNGJjm1PhwOnzQdSKI1GIYzb7T3kcv//bAFCA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WeAP3LigiMlwxUcF2xHOoW35WtlhkOao/QUEEED/NhbcFKCilFKeaAv9O7AWujJof
	 kGC1zq7lp9cb4jXgq/VLS1IF4XDedj4Bv9ZEdA1gKtbaH/jKw4arzYKjF3x/IvtuaN
	 o7CqSWhUNNTaDQ7iZxX9rzN9skirGaZV/ouHRciirdtZw2B1iyHAOoU8JaLptZmKuB
	 7uDhg2Rqq/oq6Xjw9aDZovfGReuS0hSJObJ7ywXQNM2H9xm+MB5wulWdMtdYstdGeE
	 asEp+hlPHl7ivZFGxM4xgREGw1mXNHH4qhdTN/vCdTqQKG+qLJxxCYjFJl53uLcQGd
	 vpvTOE2GTeLlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 711A53809A80;
	Tue, 17 Sep 2024 13:00:49 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/4] Svvptc extension to remove preventive sfence.vma
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172657804824.126252.9959954454312019280.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 13:00:48 +0000
References: <20240717060125.139416-1-alexghiti@rivosinc.com>
In-Reply-To: <20240717060125.139416-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, ved@rivosinc.com, mev@rivosinc.com,
 cuiyunhui@bytedance.com, anup@brainfault.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060048_416480_F66644F4 
X-CRM114-Status: UNSURE (   9.81  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 17 Jul 2024 08:01:21 +0200 you wrote:
> In RISC-V, after a new mapping is established, a sfence.vma needs to be
> emitted for different reasons:
> 
> - if the uarch caches invalid entries, we need to invalidate it otherwise
>   we would trap on this invalid entry,
> - if the uarch does not cache invalid entries, a reordered access could fail
>   to see the new mapping and then trap (sfence.vma acts as a fence).
> 
> [...]

Here is the summary with links:
  - [v4,1/4] riscv: Add ISA extension parsing for Svvptc
    https://git.kernel.org/riscv/c/a6efe33cc594
  - [v4,2/4] dt-bindings: riscv: Add Svvptc ISA extension description
    https://git.kernel.org/riscv/c/d25599b5933f
  - [v4,3/4] riscv: Stop emitting preventive sfence.vma for new vmalloc mappings
    https://git.kernel.org/riscv/c/503638e0babf
  - [v4,4/4] riscv: Stop emitting preventive sfence.vma for new userspace mappings with Svvptc
    https://git.kernel.org/riscv/c/7a21b2e370da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
