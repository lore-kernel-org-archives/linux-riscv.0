Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F24F532DF
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AOm6F0PwckB+j5424rhzgnehawHGdkQOE2U1GP/bU4=; b=Cv1ZjzZYer9CeP
	nX3EDHEFOPot79q10picufZB9lUoSx9zf4zh8byaFdNTjlaKYMpdTt0WQGpsMAdz5cFt/lFr0KSua
	hPe+qase8J8I7h8gEwgYJRWgv8OgLowBUyXbuRLfFfMF1EF+QQL/Xzya6Cc5T42a4Q7LvvbnGv1Bv
	xRklysjVYQEJH1eMIwetPsFG5e8lSx81spm0dSeVVwYO7KlEGwaiZeZOmnxng/J0Qo9x3D9//A+NN
	xMIKuQmE9k/kwM0FbHnGC2FoMmAPQAH5y4sFMKCLk3Ne1P4uyX9kiwgP0DvZskqgi1/zrjPed8XY/
	bjHR4a8FsQ7qL7nxyICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uve-00000000dSx-2P3c;
	Tue, 24 Mar 2026 06:07:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvZ-00000000dLh-2Mu6
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:07:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63A1E60121;
	Tue, 24 Mar 2026 06:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34593C19424;
	Tue, 24 Mar 2026 06:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332465;
	bh=Edy5+gFA6hHGotc3OlqBm5eyT6H+rrxHTitFMGP88YM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m2CKRoeM5B+AVymQjqLwwvoNe9fCGr8wWQTDt3JIAebG096n8u7H4DJjvG+YtE5bi
	 s/B7ZWTFWWR6jv/Gd8gDsNlS9Q9LJ7WmgK5TmOMh09xrecu5wuVW06lXK5r9yANBCA
	 rTB2E5EesIyYMFb2+pXecbx5xOyEJO3KLTHtk1Bg2AqIa2P8ZbaNzYJ4xBvnmJnPa3
	 9nyFRZ0u9W+qR2iu9VazDu+dPjFdIh/8xTo1MZmbOlBJnpRrlwHC1Ib67bwcxDixph
	 Y/8WMOUNvxbgUGk+aLPkTc9MUHRpEo3eqXB9Onuwt/1eq0Z5T/NKvnvDJZK7zGdgCq
	 R7lhi0MkwZU3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7DBDB3808200;
	Tue, 24 Mar 2026 06:07:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re:
 =?utf-8?q?=5BPATCH_v2_0/2=5D_irqchip/riscv-aplic=3A_Fix_RISC-V_APLI?=
	=?utf-8?q?C_irqchip_probe_issues?=
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433245321.469836.8874505168992965839.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:33 +0000
References: <20260310141349432DBRJJclgnBHYWu8it0geX@zte.com.cn>
In-Reply-To: <20260310141349432DBRJJclgnBHYWu8it0geX@zte.com.cn>
To: <liu.xuemei1@zte.com.cn>
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
Cc: aou@eecs.berkeley.edu, liujingqi@lanxincomputing.com, alex@ghiti.fr, anup@brainfault.org, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, cyan.yang@sifive.com, palmer@dabbelt.com, tglx@kernel.org, pjw@kernel.org, nick.hu@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Thomas Gleixner <tglx@kernel.org>:

On Tue, 10 Mar 2026 14:13:49 +0800 (CST) you wrote:
> From: Jessica Liu <liu.xuemei1@zte.com.cn>
> 
> This series addresses two issues in the aplic_probe() function.
> 
> Jessica Liu (2):
>   irqchip/riscv-aplic: Do not clear ACPI dependencies on probe failure
>   irqchip/riscv-aplic: Register syscore operations only once
> 
> [...]

Here is the summary with links:
  - [v2,1/2] irqchip/riscv-aplic: Do not clear ACPI dependencies on probe failure
    https://git.kernel.org/riscv/c/620b6ded72a7
  - [v2,2/2] irqchip/riscv-aplic: Register syscore operations only once
    https://git.kernel.org/riscv/c/b330fbfd34d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
