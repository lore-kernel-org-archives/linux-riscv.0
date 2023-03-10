Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2F3C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 02:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8eUJb1mPjRXxh0qk8CqUwNRxP+EzBf904+GwNDkw5A=; b=A6bwbpkJrDx9MK
	I8srTYQxhLtJdXhxVHFJtf0Hq7C6b5T0C/2l/ClTw9dx6tSJadxPF2D080S0YoYwh6UNS1I5Nzw55
	FQLRC88N1z7/Jdswm1xZZhaqIMNRnyO7hExVa5wL247xjYbvlBB5SXZMEUKj8Ga2TQjKKcookHVc9
	8mHOhC2hWcKnuwiku5rHc4/kFIMt5GcR6czI3EPxlaKkzid4AiSPReF2P1252KrSHTYbXULjdL2TK
	P7LF33Lka/CVA3MNZFVnhkbW7lviaX8e5BtqblAlvdX0UZgPDjyvMh9HU6uV80cbdyzg03Qb9LXmE
	A9vnAq8duEFH0Ws0Kd+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paSWY-00CiKU-AT; Fri, 10 Mar 2023 02:30:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paSWU-00CiIO-K9
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 02:30:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 89BC8B8217F;
	Fri, 10 Mar 2023 02:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 444ACC4339B;
	Fri, 10 Mar 2023 02:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678415419;
	bh=pMzNuN821RyzrFx8yXNEEI+x1tjaQJEKQdnWQcuD2CY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aUYzlu7h91RfNyr4eDlK3VcyOouEGQuzGKmd/xyEVTunNTGAyr7j6l/nWQqC3HpOk
	 C1R02yoB8kGzu4URC9vWWt/hXIoa40fkt6q0kkP7EMZuwir/0bKtJ1jaAp0SvevEfE
	 Avl2Lb+RaWzNqFxzKG5ToiQuJZOzSaXihPbdUm4UopcbQp7CoRmpEufwTN84Q0Spvz
	 HOKMkcR3qaBQbh7l4TaC0X5ZwwOD/MSRndfGYp6vU8zElFeZom+sBlQurx75NF+CYT
	 OZoQ2aWjxbnk8w75bGij3R/UGYQuwjx0MWurs7fFenDqfFpDu3CqhJ/JvfSusF6D3L
	 6nY1UxDLaUj5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1C302E61B76;
	Fri, 10 Mar 2023 02:30:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: asid: switch to alternative way to fix stale TLB
 entries
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167841541911.17842.1187782812543670687.git-patchwork-notify@kernel.org>
Date: Fri, 10 Mar 2023 02:30:19 +0000
References: <20230226150137.1919750-1-geomatsi@gmail.com>
In-Reply-To: <20230226150137.1919750-1-geomatsi@gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, zong.li@sifive.com,
 guoren@kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_183022_832006_EF463D1F 
X-CRM114-Status: GOOD (  12.65  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 26 Feb 2023 18:01:35 +0300 you wrote:
> Hi all,
> 
> Some time ago two different patches have been posted to fix stale TLB
> entries that caused applications crashes.
> 
> The patch [0] suggested 'aggregating' mm_cpumask, i.e. current cpu is not
> cleared for the switched-out task in switch_mm function. For additional
> explanations see the commit message by Guo Ren. The same approach is
> used by arc architecture, so another good comment is for switch_mm
> in arch/arc/include/asm/mmu_context.h.
> 
> [...]

Here is the summary with links:
  - [1/2] Revert "riscv: mm: notify remote harts about mmu cache updates"
    https://git.kernel.org/riscv/c/e921050022f1
  - [2/2] riscv: asid: Fixup stale TLB entry cause application crash
    https://git.kernel.org/riscv/c/82dd33fde026

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
