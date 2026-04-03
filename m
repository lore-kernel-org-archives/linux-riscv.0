Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC269E8538F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvrznbjNCDXON4lMxez+z9UPyfyof9dHP6nn5lT0xM0=; b=GhxWmZfc94pnk5
	u8CYhG+kGxlDikm6XjVPgFPGjpkdtV9ZgcFYpZZgMoeYUxeJSV/4SVgELTw6r11XdVR6Iacq4BPvu
	zBoT9XaG4t2ymiUPyULRg0O0GIpHBZGkmtIpTlh4KtrODcoGNwfKmKZvweHSy8grZwpOQY6fNDT8n
	APOdmRmi1CzH3YDQyQ0UqoEDYRPSsJ6E0jDkF8avsYQ4hXvKdihZfqizmFoIEG1ewxxQQw7/WTQfC
	Oh5KsPm/4ws+L/yVDG4fWQrdu5Ti4tMFIU33thGlRqt9Wi1l8t8OCzBKf5NjcOP/gkt4YpAOxmStF
	CgVJ+p2vb2pf/be0rJhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jHk-00000002Qhy-4Bsk;
	Fri, 03 Apr 2026 18:30:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jHk-00000002Qhq-0iKe
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 18:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4706660008;
	Fri,  3 Apr 2026 18:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2241C4CEF7;
	Fri,  3 Apr 2026 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775241023;
	bh=hULkS0nleTbhKDI0VdhhF9DZ2SvyfPygrOijnrqFZJM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gqFFdPzHyL+b9h9f7SdycP5dJrneKqpr7Z1I/BO2hfG9h420C0pf+p0Yx4ZNVFQrc
	 ZNxbHw7BcD7vzkvBg63FVJ69fAF/HelAFOqE6iNq1sdA3vLDh9qNTJbEOphy2WdBnd
	 wBLdeC/T/ucx4rKy44llNtcx7BCoA0Lhugw6hn+3vXKTO5TuN2H53kWj/IYJKb4QFC
	 lOqrxCV99tprtsfEqOjvLXILhtg9Jx6Bsr9OfdVfGnU8yJekm5ldYMay7UP+0vOHRm
	 WNoTZD7R5sF6Y6ldEu3J/7ehooVWdkWFvWxcczsK7pKuZ8u9v2bkUchoMYhmBzj1gJ
	 ywx9xHsEFMJbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F073809A14;
	Fri,  3 Apr 2026 18:30:05 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] selftests: riscv: Fix compilation issues for
 v_ptrace and cfi
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177524100454.1406513.15002331983137680726.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 18:30:04 +0000
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
In-Reply-To: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, geomatsi@gmail.com, andybnac@gmail.com,
 debug@rivosinc.com, linux-kselftest@vger.kernel.org,
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

This series was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 09 Mar 2026 18:52:09 -0700 you wrote:
> There are a couple of compilation issues of the riscv selftests.
> Coincidentally two of the issues are independent problems with not
> including the header that includes the BIT() macro and the other issue
> is from checkpatch incorrectly suggesting to remove non-redundant
> braces.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/4] selftests: riscv: Add definition of BIT() macro
    (no matching commit)
  - [v2,2/4] selftests: riscv: Add braces around EXPECT_EQ()
    https://git.kernel.org/riscv/c/2ff48e038210
  - [v2,3/4] riscv: ptrace: Fix BIT() compilation issues
    (no matching commit)
  - [v2,4/4] selftests: riscv: Add license to cfi selftest
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
