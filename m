Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D3AC3063E
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 15:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fClTsm3ejxrJsNE3AAntVhcOXMNK9HjMbQl+5g9DmrY=; b=zgu5Cr6/pmoCm8
	0seVbFrXxSbyZglTxakdUqIis6w6R9z613wd8NDwVx5yiWl1Wk4YIXAuzVnYr+BfXxw5ZpGKZ1oa5
	+CdnjNfWKPoleS91bKeFZHGjkm0bl0ECPnjefsSdE5pcg3QBTJVwQgs4YteWWXQLkonbqLaarUkhm
	0QrI9LkURJ85ioZshmlQ7kCIs5GSwP+yIWMsfmnB0lGYfTZEqtueg4PpQ9LyMvzqdg6OAyZInGJVy
	OGMtIQnvcuRDgart+CgSA077pftKahfdovUkPWCWFu7F6CWH0efJXIvdptm5O3/BPJrd7wORo4h3j
	W27x4XreZ65N8HwX3MOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWenb-006fUO-0H;
	Thu, 17 Aug 2023 15:20:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWenS-006fRn-1B
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 15:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6908562382;
	Thu, 17 Aug 2023 15:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9EF1C433CA;
	Thu, 17 Aug 2023 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692285624;
	bh=6uxie/2bpp4zoawaR0g8UbTUtiVTJv3xr2GiZ7zQz/s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hmBcS6LeNjacJIsVqaLleKWisEByI1pdUH2z6/NqSbXfZGqafxjco3E/Sb+alRqWw
	 op1a2pVfOzlAuJASuw45rb37vJdUXkeB2uHzMypV0MS5TX/+/ec1BZa0A+2fv3aOFY
	 rPkzXu9x8HTcY8KetdZnZuJ6S0DaPZjudGkNSYxVHPfWmXsmvm0WUJV0tZfD2j788S
	 ekwryIV/8fPQA9MLFA4Vcf536gzoTnB95LVQS2KNvvvnKuOgw6R98TWGhxoHDO9Awl
	 0B1f1T8OFHuVWRJ4l5GZx/VnkabVSRvFSoOiaUSl7lDO9ExGAb5j/U2ULqOFO17AnE
	 pH+CjVtOvk8DQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B1A7AC59A4C;
	Thu, 17 Aug 2023 15:20:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5] riscv: entry: set a0 = -ENOSYS only when syscall != -1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169228562472.20811.8481326212732586626.git-patchwork-notify@kernel.org>
Date: Thu, 17 Aug 2023 15:20:24 +0000
References: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
In-Reply-To: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 bjorn@rivosinc.com, conor.dooley@microchip.com, linux-kernel@vger.kernel.org,
 schwab@suse.de, David.Laight@ACULAB.COM, CoelacanthusHex@gmail.com,
 felixonmars@archlinux.org, c141028@gmail.com, shiqi@isrc.iscas.ac.cn,
 emil.renner.berthing@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_082026_449628_776627D0 
X-CRM114-Status: GOOD (  11.09  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue,  1 Aug 2023 22:15:16 +0800 you wrote:
> When we test seccomp with 6.4 kernel, we found errno has wrong value.
> If we deny NETLINK_AUDIT with EAFNOSUPPORT, after f0bddf50586d, we will
> get ENOSYS instead. We got same result with commit 9c2598d43510 ("riscv:
> entry: Save a0 prior syscall_enter_from_user_mode()").
> 
> After analysing code, we think that regs->a0 = -ENOSYS should only be
> executed when syscall != -1. In __seccomp_filter, when seccomp rejected
> this syscall with specified errno, they will set a0 to return number as
> syscall ABI, and then return -1. This return number is finally pass as
> return number of syscall_enter_from_user_mode, and then is compared with
> NR_syscalls after converted to ulong (so it will be ULONG_MAX). The
> condition syscall < NR_syscalls will always be false, so regs->a0 = -ENOSYS
> is always executed. It covered a0 set by seccomp, so we always get
> ENOSYS when match seccomp RET_ERRNO rule.
> 
> [...]

Here is the summary with links:
  - [v5] riscv: entry: set a0 = -ENOSYS only when syscall != -1
    https://git.kernel.org/riscv/c/52449c17bdd1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
