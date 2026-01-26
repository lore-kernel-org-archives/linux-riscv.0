Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DEEC88E4A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 04:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJpHnAKm65pFq7szStdqbGEcJO0u2RcwXIVuHppZz4Q=; b=RWjIRhpnUqsrf6
	0FahNx77c9h+8QimvOlj870uXPmeqK8xT1OPc7qoWgHg6FtsBW/v6dTZXQ3acw/PaDeEtOBnR7Z61
	YA1UIzVPf28zPOSlUNOROBYG7tc5CQAyScOD+ZEJHHb5e/LIBja9YiHqAytf/1tJzySDGGTXStZQG
	RqXEI0kJBO8fd0xH8o7w6OPBoVybDk3A+lKs/9j5PEdU8ZoUOKd4o9UX1HpH/IewLVIymzV7tT9pE
	IOncDM/6vdt+L0RHhGBCOqEFo/qyXXX8d7WpjaCz5VJ7L2OZYEZCwcS25uaZmv6a0Rb8P/Fx0t9y5
	AJ3PuC3G3MtZ+jMqjm0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE6u-0000000BsYg-4APF;
	Mon, 26 Jan 2026 04:21:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE6s-0000000BsXa-1KkG
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 04:21:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F228C442E6;
	Mon, 26 Jan 2026 04:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE146C116C6;
	Mon, 26 Jan 2026 04:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769401313;
	bh=9YpabiXPrUeHcDcJdX38UxODvbvZ6FSJMCaEGx6kT00=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mFDt6MRQIX5YJowpdFi4cwjaqLBMn5hRthJcQojCBz7KUqXIqUQnLp9oTrsG+vpZC
	 +oupAAyrmSFGBKxSN6H9JtmUPrkh+LWOif2kyAMQrvsi+5Ni+PVyd+TbLP8CA6Ac70
	 sCn47LRvA7raDRD4Q5viKZ1pGnef8OhPoFOlOIwOnb1skFG9P+y9tPL8AL4NwtRfWg
	 QwIzid+G3ojBubJin7uX0hdDo1E5adLt/E3VAOlpbzi5/xixMvuyA3SDX4JgSx0li9
	 smNmYvnRpafzTeC+915666I4AzAM34c8Pd3dPhmXcBOSaN81sKnub4+8PtG2FelXm3
	 CgG92BtavfBAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8DF63809A22;
	Mon, 26 Jan 2026 04:21:49 +0000 (UTC)
MIME-Version: 1.0
Subject: Re:
 =?utf-8?q?=5BPATCH_linux-next=5D_irqchip/riscv-imsic=3A_Revert_=22R?=
	=?utf-8?q?emove_redundant_irq=5Fdata?=
	=?utf-8?q?_?=
	=?utf-8?q?_lookups=22?=
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176940130834.4057692.5469884123687376656.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 04:21:48 +0000
References: <20260113111930821RrC26avITHWSFCN0bYbgI@zte.com.cn>
In-Reply-To: <20260113111930821RrC26avITHWSFCN0bYbgI@zte.com.cn>
To: <wang.yaxin@zte.com.cn>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@linutronix.de,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 zhang.run@zte.com.cn, hu.shengming@zte.com.cn, zhang.anmeng@zte.com.cn,
 luo.haiyang@zte.com.cn, alex@ghiti.fr, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_202154_421975_3C654D76 
X-CRM114-Status: UNSURE (   6.68  )
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
by Thomas Gleixner <tglx@kernel.org>:

On Tue, 13 Jan 2026 11:19:30 +0800 (CST) you wrote:
> From: Luo Haiyang <luo.haiyang@zte.com.cn>
> 
> Commit c475c0b71314("irqchip/riscv-imsic: Remove redundant irq_data
> lookups") leads a NULL pointer deference in imsic_msi_update_msg().
> 
> When QEMU is launched with the following additional boot parameters:
> "-device virtio-blk-pci,drive=disk1 \
>  -drive file=disk.qcow2,if=none,id=disk1,format=qcow2 \"
> 
> [...]

Here is the summary with links:
  - [linux-next] irqchip/riscv-imsic: Revert "Remove redundant irq_data lookups"
    https://git.kernel.org/riscv/c/f2edf797dab1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
