Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F1FC83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrlUhoRDtUbo8/PpyFJnE8UeYDedbBZ+te+ZG0tzS2A=; b=Xp6WP6O5hpFPfu
	O7ucoGDuAqCAA/SNhd6a7Qw4B2JZg94Fwvev+3RA3yYMmNH42zVk/cLQT/viQhH3f52zbRX8wMizF
	zRBIlgGZFSX0uLUaq60HifxuuG/8wWYMC9RjWbD2K7avdUJNp5uVNZumISqNybZ6ECFoTIOxFy0a+
	Sq717OhMfO/VoGIvS7W4jhHkYScSIfvsj30sBudsAEOBBhTo7KAN2dJlfOLL05V9cu4IxAziAuI7F
	fobJDMshiB6ULY+avTnEGgImqnf1jlyZJiDhdS2tWFMDFA1RjQFbqZtB5Bko26kThgTbYMg9vvG2m
	Q+CADSacMDMpPtaMJK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9Df-00000008eXE-0LPM;
	Wed, 16 Jul 2025 20:59:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8IA-00000008YyO-3eHv
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 19:59:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47FF843AD3;
	Wed, 16 Jul 2025 19:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C111C4CEE7;
	Wed, 16 Jul 2025 19:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752695990;
	bh=MMPiME+dqiMm1jd7xNXlrjdjIw1GHdU7/SfjiufmlRs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X230jHpbNWHJI9G8s9Kks1DesiprYDMPjA8QqDPD+z+DYWvVfqhD5KvdGoRJrKl3t
	 OfLoXbF5J/8LNVYfyQHqai6U+WiQOO0CJzYdnlic8gh12e/bYYiLUQxvTcKD5esm5A
	 I+5+YbEfNBb9yF7MntJpj4kEFtUxC8uQNX4WMAUJkyEbVFwLDUqaq6hnHTGrNt9T4+
	 ONqlcrzKq+k+F7jCLKJlH7dj0l3xHdYashOuw67kUQMsv/MqabTsRBN0hhrxKngP1b
	 Ee9X1Ps3pBTKsbLnu3vA1SfBoTp7RF/m6nZsQyWDys7V63vTKik+IYjUgkd65bdS0l
	 H16a/9gdnA5mQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id A969A383BA3A;
	Wed, 16 Jul 2025 20:00:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: traps_misaligned: properly sign extend value in
 misaligned load handler
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175269601050.1308944.963659246484351139.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jul 2025 20:00:10 +0000
References: <mvmikk0goil.fsf@suse.de>
In-Reply-To: <mvmikk0goil.fsf@suse.de>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, damien.lemoal@wdc.com,
 anup@brainfault.org, palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_125950_925451_EBF4CE03 
X-CRM114-Status: UNSURE (   8.53  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@dabbelt.com>:

On Thu, 10 Jul 2025 15:32:18 +0200 you wrote:
> Add missing cast to signed long.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/kernel/traps_misaligned.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - riscv: traps_misaligned: properly sign extend value in misaligned load handler
    https://git.kernel.org/riscv/c/b3510183ab7d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
