Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C42DE8538F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5H2kkcsMLRASUO6PUXOnnFiz0EhBhMFKNv4ubW20zBU=; b=UFUG9i0MUdwaqc
	ifxghhPhMQwmj1iJwNZD5ws/HtedfRvBYI1f8FsfCLo8SNOGa4oyBMuDBR8jmzLQMcImv0iaqPxG1
	lAO0HhWVoGRN+CMvmTQn8jV+UKsNlpb+j9uWT2slSMmp4Nq5RSLy2O2xd0RtNgc+aSf952SQnZwHW
	/L9q5A7MSTkKD+NPar3CWecbCtZ2cwMcXMq961FdnhHjMqZJdqawuRXtwYj+fCFkkuFlLXc/5e34B
	XP1EcNmnZYqFD+ECO3LHApZNwuX4v5acfb65LN7Hrnt83z4n+BQcpg0JSWPDroKiy4mmQspD0dM6x
	200LbowjaDbB+EKORxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jI0-00000002Qk3-1NE5;
	Fri, 03 Apr 2026 18:30:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jHy-00000002QjM-2xuQ
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 18:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2911960127;
	Fri,  3 Apr 2026 18:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CCCC19424;
	Fri,  3 Apr 2026 18:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775241037;
	bh=GwfrOoXP8e2elhLFeRY+aPKHu8ZZLu/gIrpHLpXB8ME=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qzxeifxTlI6EbHFlF1lbJ+NZiC+6mBxmghMd27+DbR6lQAiPnamkTpHZ8Ui6SpZEv
	 QfoAvIrxjMaPESF05gVzKWixQjxW+xZQpha6NxZUYXKD5q/X56AzzHQtb1hEU9a/QI
	 s7Col3r1E90qQTt56P/sYePDz6RdmP6+VsGY8dTiRg60vt6P9fdj4PpqMCSlGPVz1s
	 smoTzAkEMhKKNM1I7ZK3jE4F5it0OPDXD5Xff9crQyF3WnSaD0M8/igMts8wt7TrkW
	 +2jeDU9lSItYYzJ+OG7dxRLFUP4yeJK6aQWrTewtg4cGFE+qjlNKyX9/RnQjws+6W/
	 POqm5QFXtLfQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F083809A14;
	Fri,  3 Apr 2026 18:30:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: cif: clear CFI lock status in start_thread
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177524101929.1406513.17935249584196431471.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 18:30:19 +0000
References: <20260323065640.4045713-1-zong.li@sifive.com>
In-Reply-To: <20260323065640.4045713-1-zong.li@sifive.com>
To: Zong Li <zong.li@sifive.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, debug@rivosinc.com,
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

This patch was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Sun, 22 Mar 2026 23:56:40 -0700 you wrote:
> When libc locks the CFI status through the following prctl:
>  - PR_LOCK_SHADOW_STACK_STATUS
>  - PR_LOCK_INDIR_BR_LP_STATUS
> 
> A newly execd address space will inherit the lock status
> if it does not clear the lock bits. Since the lock bits
> remain set, libc will later fail to enable the landing
> pad and shadow stack.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: cif: clear CFI lock status in start_thread
    https://git.kernel.org/riscv/c/b3a20899d255

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
