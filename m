Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8D3C3600C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qy/fnu0WcQtEDTm9nijkOWvvTiZDE3RCnxG5D3dbDrA=; b=l0TQHClv/R91Jd
	bDSHKda32RMFyADD23PstXCDNZdgRrheiDkLNvEBc2SozoaKYOfdTT3u/X1YdpbUkTYuJV0Oo7qSO
	t56dociNxSVHMhJmLyy8Kea6t+4p8Cxox4DnhLCGnnZw7fYuSmrOG6kjHrO76SOxpo4w1tWUp7htv
	pFShUZtUItUUKb62ZuTDWSYEb65mo9TwBSRt9M2rGR+ZmT/hPLbVeeh5xCxAY6roeVPd6HcPUP+sd
	SRwJcfeueFaz/czX2D7bVCJda7h1D0RVSiW8ZtnTJ2TIbvZpAcRzui0POjrRyNIV2LASUe0Gm6Od8
	/JeJ3TwP+5VlRzJLG0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIY-00000009LHd-3eVM;
	Thu, 03 Apr 2025 16:20:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIV-00000009LAt-1IBs
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 16:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E8F343E9E;
	Thu,  3 Apr 2025 16:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CA2C4CEEB;
	Thu,  3 Apr 2025 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697200;
	bh=j/Zw1Us83CYLMh45YX1P1HpPGlpHRPs3sHFliCIKkXI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ciE/kNK4XWjcVK1j+oCSiVf1OBJ9HzSBIf2Hk9xjTMiNznLTc5BnwMm5nMhSB3eeM
	 dvyTPj8chqr/oWJMadaBcEpwFj2HjJu6jf5jEzS5vAQCW5bVJbYvW7HtvK6QbCEI4S
	 odc4NG9Z0XyXmPgWNWRCa9gWjL2rbXGlGL15S/JFErhUPRxyxHQokqhIljMFn51qAf
	 n9pCsOp2+89eiORD45yciDJmHcLzWB2hTqBjL0a3rbmoE16C/0JEZwPFrwJ/ZhiBLA
	 hlGlkFqB2rrBLDs4EYfqzfUKbpIH8zinEC87Nuk+MklnNxSMCMYwjXvoOHmNeVA6x0
	 f4UolNqzcRc9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB361380664C;
	Thu,  3 Apr 2025 16:20:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] selftests: riscv: fix v_exec_initval_nolibc.c
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174369723749.2563936.8850444880196164283.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:37 +0000
References: <20250306-fix-v_exec_initval_nolibc-v2-1-97f9dc8a7faf@iencinas.com>
In-Reply-To: <20250306-fix-v_exec_initval_nolibc-v2-1-97f9dc8a7faf@iencinas.com>
To: Ignacio Encinas <ignacio@iencinas.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 alex@ghiti.fr, charlie@rivosinc.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_092007_361864_0C256572 
X-CRM114-Status: UNSURE (   9.33  )
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

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Thu, 06 Mar 2025 20:49:27 +0100 you wrote:
> Vector registers are zero initialized by the kernel. Stop accepting
> "all ones" as a clean value.
> 
> Note that this was not working as expected given that
> 	value == 0xff
> can be assumed to be always false by the compiler as value's range is
> [-128, 127]. Both GCC (-Wtype-limits) and clang
> (-Wtautological-constant-out-of-range-compare) warn about this.
> 
> [...]

Here is the summary with links:
  - [v2] selftests: riscv: fix v_exec_initval_nolibc.c
    https://git.kernel.org/riscv/c/79ba5c1c7767

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
