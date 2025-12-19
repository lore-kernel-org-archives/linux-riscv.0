Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA57FD74961
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oP0kP4Dh6tPq4Q0kP1sLnPOtcq6pwtltbYwKjhLYa9Q=; b=R9n12HY2IJ7ISz
	UXgxX/bWNYeDHLcVwEeQ8QWZNcIhlgNKYwP1ThAN+mk7IJ252Ebed6t6aCgAXvW12HmaHuPNRRQsX
	N+hvhd+A9cgQaPgcVF+YyeHZGzkRYVcAGX+CXNz7C9mCd+72UhPy1zcOC5lv9f7EDf6Ww7cID8xpn
	SKyVYMbHNv6buH0rxoIBUR/vWll1/iJfo5rO7NyoJIoOt3Hej1CKd1DQjTMwq6sz/dHNPtWElM5kL
	OcCW2ktKpRXu+obxc8NPcYtOd6rlfr3d0tIuUBvsj9D9qOsFN3ie+I7LzYO168jOEbkau09ObvWIw
	9Pua5+4nimsJfwth81yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVc9-00000009p6a-1uHR;
	Fri, 19 Dec 2025 08:13:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVby-00000009ouT-3KJB;
	Fri, 19 Dec 2025 08:13:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6699744265;
	Fri, 19 Dec 2025 08:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DA1C4CEF1;
	Fri, 19 Dec 2025 08:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131998;
	bh=ZpBHca7oN52iVgWXthIDFgDhI9A0INgKqTumn5Wu6+Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GLiYOmvPUPoGBBkA0Ts0/kjAyBBbJ5CVV866J5BiVEgPJj3OYjRgC+9kPctyKNkbY
	 OTmQcFlqulWRizG9DOeVMcBBx3TMpnVx8OsXdwOLS+oyRNZ43rplVORNJeOQQd5TCz
	 VpcmAphzU3UsvkI5L30JzY+yn/H0KfEWqpVte7ln/hSbjF1dNKhUJB0U1REatJzEyR
	 lb/rrla5Oq6RnkhwpZlVihV4NT0itGutxX9yV+3Mu7xreaNE+7eVmbadIEeUslLbKZ
	 K6SjjazHiexJwS8UcYibsLYI3osV5J/1Mf1cfAxG4KlgZXMP2+gQZEcu1CfsRsvhQs
	 DlwDgJSLvSrwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7872A380AA50;
	Fri, 19 Dec 2025 08:10:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [patch V5 00/12] uaccess: Provide and use scopes for user access
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613180728.3684357.15978002339429469981.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:07 +0000
References: <20251027083700.573016505@linutronix.de>
In-Reply-To: <20251027083700.573016505@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 torvalds@linux-foundation.org, x86@kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, palmer@dabbelt.com,
 hca@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 linux-s390@vger.kernel.org, mathieu.desnoyers@efficios.com,
 andrew.cooper3@citrix.com, david.laight.linux@gmail.com,
 Julia.Lawall@inria.fr, nicolas.palix@imag.fr, peterz@infradead.org,
 dvhart@infradead.org, dave@stgolabs.net, andrealmeid@igalia.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
 linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001320_754349_90FCAF0B 
X-CRM114-Status: UNSURE (   9.20  )
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

This series was applied to riscv/linux.git (fixes)
by Ingo Molnar <mingo@kernel.org>:

On Mon, 27 Oct 2025 09:43:40 +0100 (CET) you wrote:
> This is a follow up on the V4 feedback:
> 
>    https://lore.kernel.org/20251022102427.400699796@linutronix.de
> 
> Changes vs. V4:
> 
>   - Rename get/put_user_masked() to get/put_user_inline()
> 
> [...]

Here is the summary with links:
  - [V5,01/12] ARM: uaccess: Implement missing __get_user_asm_dword()
    https://git.kernel.org/riscv/c/44c5b6768e3a
  - [V5,02/12] uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
    (no matching commit)
  - [V5,03/12] x86/uaccess: Use unsafe wrappers for ASM GOTO
    https://git.kernel.org/riscv/c/14219398e3e1
  - [V5,04/12] powerpc/uaccess: Use unsafe wrappers for ASM GOTO
    https://git.kernel.org/riscv/c/5002dd53144f
  - [V5,05/12] riscv/uaccess: Use unsafe wrappers for ASM GOTO
    https://git.kernel.org/riscv/c/0988ea18c624
  - [V5,06/12] s390/uaccess: Use unsafe wrappers for ASM GOTO
    https://git.kernel.org/riscv/c/43cc54d8dbe6
  - [V5,07/12] uaccess: Provide scoped user access regions
    https://git.kernel.org/riscv/c/e497310b4ffb
  - [V5,08/12] uaccess: Provide put/get_user_inline()
    https://git.kernel.org/riscv/c/b2cfc0cd68b8
  - [V5,09/12,RFC] coccinelle: misc: Add scoped_masked_$MODE_access() checker script
    (no matching commit)
  - [V5,10/12] futex: Convert to get/put_user_inline()
    https://git.kernel.org/riscv/c/e4e28fd6986e
  - [V5,11/12] x86/futex: Convert to scoped user access
    https://git.kernel.org/riscv/c/e02718c9865c
  - [V5,12/12] select: Convert to scoped user access
    https://git.kernel.org/riscv/c/3ce17e690994

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
