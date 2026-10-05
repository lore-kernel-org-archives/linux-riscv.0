Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391EECA5FFE
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 17:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9456SelrhHYZvM30gw/GFMr8nb7t+B5VQAmUKuYfHM=; b=PYMHGbKmS4EZQy
	qlJHnuuxd7DWs+zNl7Ey6c39BujIFz5mUwWWv2bqH0tkPJVPo/1FE0zP3y4FJfS4nm3vYRRN6Mq9d
	yyaGw7jBoRXWlmDToQP9W+p00YIbZ2eS77B8JJSL+dM2jotTXsIzOMZ271U46UcfKZb4Pjc0lmn4q
	BDq/deL4N2hk4hyNigSCmWICGagoV1LCeb6enc++b4HrK+iTy1RRsmCH6xkorkN4sKyelimhA/eNh
	F8mCRDSekFG9WCDA9YtBrcXRvTNuMFHSeTdLQmyXhAFmw2GMnd7LZyz/aPJlUBmB8jYK7rxjL1zov
	3FNqu4g/qztPex0MR+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDm32-0000000GseP-3k4L;
	Mon, 05 Oct 2026 17:00:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDm31-0000000Gsdu-1zK6
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 17:00:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DD6E60204;
	Mon,  5 Oct 2026 17:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435C21F000FF;
	Mon,  5 Oct 2026 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791219618;
	bh=k678DWlUUZ3k9HwvntazIqDsfedGb7Bg2oWOWK4FHPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eld28IbSGRFsMzZt7XBnJ3a+L1l3olWRiA762brUpoSe0SNT4UO8VFzHx5hIdV4XI
	 pMIu/wYK9OJCwcahBFziB3uzhTc85K1kJRZf3KqrHzDBH2u2LZy34/agz2UcJgQQ/8
	 McGubgH2ZtnrY3OK1gjVMKHpVqmHxbLXCaHpFFcOUuQU5UJ46k3hT9uzgOT+F3JxIq
	 wFZWyb0WWafnnww2gWQhvJ1S016mXMlKKy0fa59QKCXV14Zt5KS5XQ+9JoagBt2Iaf
	 vnO0wUA1zXG00Z60DDTAfsKCdAUjXBBtUzgMcMq1XWR9zsMjLOkux+ZWCmi/Zbspdy
	 FimOu+ef98EMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A30639263B5;
	Mon,  5 Oct 2026 17:00:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: crash: Add crash hotplug support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179121961677.1813719.4405826480158733209.git-patchwork-notify@kernel.org>
Date: Mon, 05 Oct 2026 17:00:16 +0000
References: <20260910032619.2477279-1-qirui.001@bytedance.com>
In-Reply-To: <20260910032619.2477279-1-qirui.001@bytedance.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr, debug@rivosinc.com, martin@kaiser.cx,
 mindal@semihalf.com, fustini@kernel.org, kees@kernel.org,
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

On Thu, 10 Sep 2026 11:26:19 +0800 you wrote:
> When CPUs or memory are hot-plugged on a running system, the crash
> dump's elfcorehdr -- which describes the available CPUs and memory to
> the capture kernel -- must be kept in sync, otherwise a crash after a
> hotplug event would produce a vmcore that does not reflect the current
> system topology.
> 
> Enable crash hotplug for RISC-V by selecting
> ARCH_SUPPORTS_CRASH_HOTPLUG and providing the three architecture hooks
> invoked through the override macros in <asm/kexec.h>:
> 
> [...]

Here is the summary with links:
  - [v2] riscv: crash: Add crash hotplug support
    https://git.kernel.org/riscv/c/dfc0c564b4b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
