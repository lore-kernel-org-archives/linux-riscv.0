Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D529D715D1
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azu7/lYrtXKAUMtxtdtgsaFCKzLWlrbH7SYGspfTirU=; b=PjBIcczYlgoEoe
	KuGYSRxO3GgI/QwT03ug1MGfBuUcV/8jtar+nUV5EvjwUf8+G7Zz0pAWfVwbteVWMwiUsCzkbDNcW
	sJGA+FI++9NgDwlo4GD8mp8vsjvyJDX3oW/JE+wa0xQUp1dmCDNYHGh29ZnO0BpKmrBfGHJ0Evmfe
	t9SwvFQ6ZwN5/hmozlkG1LQMhhD6braMPzcqFvppJzeUkgZcXOA+9eXij98VybbRU3T5jHwXCjTeC
	i1sOKGGje5yHQcH2bNti5IBarku+gOXYThzdUcMXHn5Rg3vaVYHG3ygUegvVvE0RDor0rEy3vNGso
	wQ3hoY5OK/RtEbCyEL/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjZ28-0000000A6O3-1cyD;
	Sat, 24 Jan 2026 08:30:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjZ26-0000000A6NP-0i0H
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 08:30:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 831F644181;
	Sat, 24 Jan 2026 08:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D49C116D0;
	Sat, 24 Jan 2026 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769243412;
	bh=IfSksN2DAR6jItQtNlLEGOjx6mECbXSIHAxZaX3DZ2Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o/KRvkYwoKde30JrO5/+uRYoTU1kAPgW6Tv87WJ3/WIZaZ3olmQBY90T273f1zqNM
	 IYX4E/J6STWwO5NfWlZHiy0tjuLIgZlYH9PGdW/5fbl304e2lub+3GHNqdWmiJYgAv
	 a7esFeaUX4E5+87E6KMXPvfXGAKsi1IEEJg7ubiR+EhHvLrzw6peuDt3yKjGzLTh1r
	 QE0k/BOYqtEgAVkofWqfTQ2KJzkd5wNz7L8B/jl1a8gu4Ij4tOMXLvys0As0BXPa9e
	 Q4JZZUGy3lCIPbqsqzTr6RE1nN+H6hThrTy4zKjhXquS9RhRKo6fvIEJcxRncWosb/
	 vBBfDjfrhY0hA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11CBC3808200;
	Sat, 24 Jan 2026 08:30:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/9] riscv: vector: misc ptrace fixes for debug
 use-cases
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176924340785.3247175.17185864218197872186.git-patchwork-notify@kernel.org>
Date: Sat, 24 Jan 2026 08:30:07 +0000
References: <20251214163537.1054292-1-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 alex@ghiti.fr, oleg@redhat.com, shuah@kernel.org, thuth@redhat.com,
 charlie@rivosinc.com, andybnac@gmail.com, samuel.holland@sifive.com,
 joel.granados@kernel.org, conor.dooley@microchip.com,
 yongxuan.wang@sifive.com, heiko@sntech.de, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_003014_251773_582B2CAA 
X-CRM114-Status: UNSURE (   8.96  )
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
by Paul Walmsley <pjw@kernel.org>:

On Sun, 14 Dec 2025 19:35:04 +0300 you wrote:
> This patch series suggests fixes for several corner cases in the RISC-V
> vector ptrace implementation:
> 
> - init vector context with proper vlenb, to avoid reading zero vlenb
>   by an early attached debugger
> 
> - follow gdbserver expectations and return ENODATA instead of EINVAL
>   if vector extension is supported but not yet activated for the
>   traced process
> 
> [...]

Here is the summary with links:
  - [v5,1/9] riscv: ptrace: return ENODATA for inactive vector extension
    https://git.kernel.org/riscv/c/35328975fa84
  - [v5,2/9] riscv: vector: init vector context with proper vlenb
    https://git.kernel.org/riscv/c/66d52c54e59f
  - [v5,3/9] riscv: csr: define vtype register elements
    https://git.kernel.org/riscv/c/0d9acbd7836a
  - [v5,4/9] riscv: ptrace: validate input vector csr registers
    https://git.kernel.org/riscv/c/995e66a25b26
  - [v5,5/9] selftests: riscv: test ptrace vector interface
    https://git.kernel.org/riscv/c/dca68b94a8b1
  - [v5,6/9] selftests: riscv: verify initial vector state with ptrace
    https://git.kernel.org/riscv/c/1a353e49a0dc
  - [v5,7/9] selftests: riscv: verify syscalls discard vector context
    https://git.kernel.org/riscv/c/4b7e068fe676
  - [v5,8/9] selftests: riscv: verify ptrace rejects invalid vector csr inputs
    https://git.kernel.org/riscv/c/bfdd22c430ca
  - [v5,9/9] selftests: riscv: verify ptrace accepts valid vector csr values
    https://git.kernel.org/riscv/c/ccb3038e946c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
