Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DD9C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43ptPlOvj3g9HON5Pn8i1MJ85MiuG0rEKRXKZAhJMvU=; b=aCJduNCFJ3a1Ik
	9tLyveqSVE3kPazVMjpj69Y2pw9mr8uUOq18XmZQKHcxxlDFDrVwVxjrFzXqbBHqy0T6DhVrniijF
	5H5hIXSTLX1lXx3nPuxguZlvQCRH7zaTX52AvooKNDM1AcrxgqD5MmLpUrm7Xndu4Sos29jSt6TfZ
	T+fDIYAUE8gB92Y0TounnXjWIvztvcqZ2W54HneYY0UGqwqUiuuoZKSO3WIr07kdt95qV+mqCRvxS
	hEWK5LKIr8PiK0T4mXob7XoWAKp2pMlsliYcJa6H33FcT0bt/i4kL3ztTsaD1KQ+lKTPWPL6pDn7g
	cjavnd/JAQHOcjFlWnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF6d-0000000CRPD-3syS;
	Tue, 23 Jul 2024 12:59:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF6D-0000000CRFU-42Xj;
	Tue, 23 Jul 2024 12:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D079B60E08;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F9CBC4AF13;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721739516;
	bh=XnGab5Oc0HUWROXuLXNSpwek1pYBFbd7tB6YAr94S9E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Z4wIy8PilVKD3upkFv7+8P0M3fwFN6M6m/FwfRjPy6dPwZxV+9DBMeCXJMf+3QWdx
	 f0AHw6mTOo6SdlNe5QdV20d2GgdCMeJKIelmOKvSs76KAumtkEA1iqioW709/M+rG1
	 zsFnJgWmmen+Tc2yEgIoz68D4zyUf4KrQgocLTKt2aXenfPk7Ya6eSesUQ5jFTvtVP
	 BKoYUnAs5eiduQnkXmUT4v1Pyh4n8ewZvKgDNyJacJXOZWy7mVvfArBbzbIZIOwMZK
	 lBFMZMGIaHBpm/RjCQc5uZxWAcsHZhBnFlcj7VBc+U0BF5QumfxtMkh80xnp9w6Efn
	 CbbcIL1FkoRmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5E34BC4332C;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 00/17] arch: convert everything to syscall.tbl
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172173951638.10883.11414221741425402977.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jul 2024 12:58:36 +0000
References: <20240704143611.2979589-1-arnd@kernel.org>
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 arnd@arndb.de, masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
 vgupta@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org,
 kernel@xen0n.name, dinguyen@kernel.org, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net,
 andreas@gaisler.com, brauner@kernel.org, mark.rutland@arm.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-openrisc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_055838_102709_3487E0C2 
X-CRM114-Status: UNSURE (   9.08  )
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
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Jul 2024 16:35:54 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are eight architectures using include/uapi/asm-generic/unistd.h,
> which is still in an old format and not easily parsed by scripts.
> In addition, arm64 uses the old format for the 32-bit arm compat syscalls,
> despite them using the modern syscall.tbl format for the native calls.
> 
> [...]

Here is the summary with links:
  - [01/17] syscalls: add generic scripts/syscall.tbl
    https://git.kernel.org/riscv/c/4fe53bf2ba0a
  - [02/17] csky: drop asm/gpio.h wrapper
    https://git.kernel.org/riscv/c/ed8023ae9d79
  - [03/17] um: don't generate asm/bpf_perf_event.h
    (no matching commit)
  - [04/17] loongarch: avoid generating extra header files
    https://git.kernel.org/riscv/c/ff96f5c6971c
  - [05/17] kbuild: verify asm-generic header list
    https://git.kernel.org/riscv/c/b70f12e962bc
  - [06/17] kbuild: add syscall table generation to scripts/Makefile.asm-headers
    https://git.kernel.org/riscv/c/fbb5c0606fa4
  - [07/17] clone3: drop __ARCH_WANT_SYS_CLONE3 macro
    https://git.kernel.org/riscv/c/505d66d1abfb
  - [08/17] arc: convert to generic syscall table
    https://git.kernel.org/riscv/c/4414ad8eb4c2
  - [09/17] arm64: convert unistd_32.h to syscall.tbl format
    https://git.kernel.org/riscv/c/7fe33e9f662c
  - [10/17] arm64: generate 64-bit syscall.tbl
    (no matching commit)
  - [11/17] arm64: rework compat syscall macros
    (no matching commit)
  - [12/17] csky: convert to generic syscall table
    (no matching commit)
  - [13/17] hexagon: use new system call table
    (no matching commit)
  - [14/17] loongarch: convert to generic syscall table
    https://git.kernel.org/riscv/c/26a3b85bac08
  - [15/17] nios2: convert to generic syscall table
    https://git.kernel.org/riscv/c/ef608c5767f9
  - [16/17] openrisc: convert to generic syscall table
    https://git.kernel.org/riscv/c/77122bf9e3df
  - [17/17] riscv: convert to generic syscall table
    https://git.kernel.org/riscv/c/3db80c999deb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
