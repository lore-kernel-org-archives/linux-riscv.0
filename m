Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A03C87FD3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lhO+XLopp/1qPg6Xju+fZRuqxEDiFQWLK6u4gvcxlI=; b=oHWwuLH4RK+M7t
	LXdJRGKAWF4x7EWP5OooSgSgzuICfGdPBk+oyeaGQSSgHLScgHb6b8cx7iPeJSoUE7dXuPz4lqmbf
	EkiH7J3bCOFJNk9/KeR9+cjp3wU8wJPWqF9Vcl5Tv8TdHma5eNcmL1tKg3+ni8wvEIL/EltBHRF9q
	emr4GwKCq2pIfX8hf5D0bBPqxAP2cHHFt3LJ0jY1h1xnAf8gWanltjuI0YnetCM7Eus5Aa63lh8e9
	TFkwguXt2iyDXEguSu5tFNcWT4l5cUQ+MKD9jNU4E8Gg7cSlVCpmZRwQadxhXMfUnguDeHaf3jJiC
	3d1PBQWL3RIV8heXIVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhnw-0000000FtMp-0xnZ;
	Wed, 06 Aug 2025 17:19:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhjo-0000000FsDy-32Sa
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 17:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C94860207;
	Wed,  6 Aug 2025 17:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89B7C4CEE7;
	Wed,  6 Aug 2025 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754500539;
	bh=1pzAwtko3ANAmVm5KUzMtQcMCt+mGjENUOKMCtnNxi4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SIzCJjq906ULp9OXMPNow3K5PuZFIXcIgTMXdEaAfzYM81Vcq1T7xmQThk3Gtm+uc
	 qnIutpV3hA8J/tw65iThqeV2AaOW8mVltJZ5OSKrZ0ehzYwvuDyYCdMBKaHkd5MnrU
	 ZTLG1gR40HeX3CONton6HzdLzO8XPAlG8e4rFH4Ii4P4evtv3a6I+XmpaElVg5TWza
	 pOGCOkm4TwBvSdYEgVlFpKgW5yMtJmeFMat5GTyI6NcrorO1HupkRr9RMAV4KF+ydv
	 otPq9KO3VfnCgFlNIEOvlXhpaexNZuetdphgFNEdwB2ZF1xpK9FPb2PtrG++O47Ka6
	 HQSTWV+guhMZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE79383BF63;
	Wed,  6 Aug 2025 17:15:54 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6] riscv: introduce asm/swab.h
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175450055349.2863135.5871727403840388182.git-patchwork-notify@kernel.org>
Date: Wed, 06 Aug 2025 17:15:53 +0000
References: <20250723-riscv-swab-v6-1-fc11e9a2efc9@iencinas.com>
In-Reply-To: <20250723-riscv-swab-v6-1-fc11e9a2efc9@iencinas.com>
To: Ignacio Encinas <ignacio@iencinas.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, palmer@rivosinc.com,
 alexghiti@rivosinc.com
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

On Wed, 23 Jul 2025 20:47:29 +0100 you wrote:
> Implement endianness swap macros for RISC-V.
> 
> Use the rev8 instruction when Zbb is available. Otherwise, rely on the
> default mask-and-shift implementation.
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> 
> [...]

Here is the summary with links:
  - [v6] riscv: introduce asm/swab.h
    https://git.kernel.org/riscv/c/16b0622e2f6b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
