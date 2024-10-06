Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD856CFB43F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 13:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BF1aZTLlf6BQFaIjPYhAz8zYYvquBBKd1rjqIvBZxao=; b=4XGcX87fPz0o9J
	ghTc9AOMLQDM11Rviz84hkL27vZg33YBjvorYEM1foOxowjJHmpJbx+1aQ0xfkQQtiK09QXI5ZgpB
	i8ge2Bdu8CrqfJ/oZjZa7D1oN4f169rFerwYpWzBLbXOgWHG/I7uPoUjUUzLzVjJThLPScn/QcfLb
	zMzpR67nmdSL14qnF5H7dwnktH7wtpBBOj2dtowJ0ecwMJOl2UL/1KZeIdvQ+hi2mk+ISF4ylUKQG
	6LXVuKZZeJ8l5J+nQm6KR6otfq5DqfXc6/eAA6g5j5ZYYoOqETF3TxeDK9WBzGHWoy1QIoao9tfYi
	zLzpZ+jqdgYXlS3l9VKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxRK6-000000005Oe-0WSI;
	Sun, 06 Oct 2024 13:29:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxRK2-000000005MW-1Uax
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 13:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4165BA40D34;
	Sun,  6 Oct 2024 13:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593B9C4CED1;
	Sun,  6 Oct 2024 13:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728221356;
	bh=BtD6uQeKcar4gJLuDMrO7gB7cz+l9whS8y4o3WOSc8I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BLb7Bqd5DUL9igAN334n3NBJRh+b0UM6zZbgFYtlnE72Ov0F1vp+7NrtaTRNv6341
	 49y9XNEFPTgSVrodwUyQtm5isKzB7G1puJcxHBsciFGgw6Gd1qeOvbgUTI9WaJDy7M
	 emG6kYcGhR+RCnlhgJyuqQegLUgpp+dDYLXCPvVr8UeZxgVtbhMVt5AyPFhJwUDuqx
	 6jHUfcyw/vtcfEyZ1dMi/Iu899d3TW220Y/GYvP1qOOoB2XqlJ6z0cDx5EssEd7PHn
	 aR5OXHf7RFeXQshB6Pyx5yFxztobnz5WNspC+ZNiOcA4XPXdX4D+Pqj2aNuuzDpb6c
	 p0Anm5boOhHdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DB03806656;
	Sun,  6 Oct 2024 13:29:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 00/33] riscv control-flow integrity for usermode
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172822135999.3395169.2185051958968934926.git-patchwork-notify@kernel.org>
Date: Sun, 06 Oct 2024 13:29:19 +0000
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 lorenzo.stoakes@oracle.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, conor@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 arnd@arndb.de, brauner@kernel.org, peterz@infradead.org, oleg@redhat.com,
 ebiederm@xmission.com, kees@kernel.org, corbet@lwn.net, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
 rick.p.edgecombe@intel.com, david@redhat.com, carlos.bilbao.osdev@gmail.com,
 samuel.holland@sifive.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, andy.chiu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_062918_549600_AEE7554E 
X-CRM114-Status: GOOD (  13.61  )
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

On Tue, 01 Oct 2024 09:06:05 -0700 you wrote:
> v5 for cpu assisted riscv user mode control flow integrity.
> zicfiss and zicfilp [1] are ratified riscv CPU extensions.
> 
> Changes in this version are
> - rebased on v6.12-rc1
> - Fixed schema related issues in device tree file
> - Fixed some of the documentation related issues in zicfilp/ss.rst
>   (style issues and added index)
> - added `SHADOW_STACK_SET_MARKER` so that implementation can define base
>   of shadow stack.
> - Fixed warnings on definitions added in usercfi.h when
>   CONFIG_RISCV_USER_CFI is not selected.
> - Adopted context header based signal handling as proposed by Andy Chiu
> - Added support for enabling kernel mode access to shadow stack using
>   FWFT [4]
> 
> [...]

Here is the summary with links:
  - [01/33] mm: Introduce ARCH_HAS_USER_SHADOW_STACK
    (no matching commit)
  - [02/33] mm: helper `is_shadow_stack_vma` to check shadow stack vma
    (no matching commit)
  - [03/33] riscv: Enable cbo.zero only when all harts support Zicboz
    https://git.kernel.org/riscv/c/1b57747e978f
  - [04/33] riscv: Add support for per-thread envcfg CSR values
    (no matching commit)
  - [05/33] riscv: Call riscv_user_isa_enable() only on the boot hart
    (no matching commit)
  - [06/33] riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
    (no matching commit)
  - [07/33] riscv: zicfilp / zicfiss in dt-bindings (extensions.yaml)
    (no matching commit)
  - [08/33] riscv: zicfiss / zicfilp enumeration
    (no matching commit)
  - [09/33] riscv: zicfiss / zicfilp extension csr and bit definitions
    (no matching commit)
  - [10/33] riscv: usercfi state for task and save/restore of CSR_SSP on trap entry/exit
    (no matching commit)
  - [11/33] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
    (no matching commit)
  - [12/33] riscv mm: manufacture shadow stack pte
    (no matching commit)
  - [13/33] riscv mmu: teach pte_mkwrite to manufacture shadow stack PTEs
    (no matching commit)
  - [14/33] riscv mmu: write protect and shadow stack
    (no matching commit)
  - [15/33] riscv/mm: Implement map_shadow_stack() syscall
    (no matching commit)
  - [16/33] riscv/shstk: If needed allocate a new shadow stack on clone
    (no matching commit)
  - [17/33] prctl: arch-agnostic prctl for shadow stack
    (no matching commit)
  - [18/33] prctl: arch-agnostic prctl for indirect branch tracking
    (no matching commit)
  - [19/33] riscv: Implements arch agnostic shadow stack prctls
    (no matching commit)
  - [20/33] riscv: Implements arch agnostic indirect branch tracking prctls
    (no matching commit)
  - [21/33] riscv/traps: Introduce software check exception
    (no matching commit)
  - [22/33] riscv: signal: abstract header saving for setup_sigcontext
    (no matching commit)
  - [23/33] riscv signal: save and restore of shadow stack for signal
    (no matching commit)
  - [24/33] riscv/kernel: update __show_regs to print shadow stack register
    (no matching commit)
  - [25/33] riscv/ptrace: riscv cfi status and state via ptrace and in core files
    (no matching commit)
  - [26/33] riscv/hwprobe: zicfilp / zicfiss enumeration in hwprobe
    (no matching commit)
  - [27/33] riscv: Add Firmware Feature SBI extensions definitions
    (no matching commit)
  - [28/33] riscv: enable kernel access to shadow stack memory via FWFT sbi call
    (no matching commit)
  - [29/33] riscv: kernel command line option to opt out of user cfi
    (no matching commit)
  - [30/33] riscv: create a config for shadow stack and landing pad instr support
    (no matching commit)
  - [31/33] riscv: Documentation for landing pad / indirect branch tracking
    (no matching commit)
  - [32/33] riscv: Documentation for shadow stack on riscv
    (no matching commit)
  - [33/33] kselftest/riscv: kselftest for user mode cfi
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
