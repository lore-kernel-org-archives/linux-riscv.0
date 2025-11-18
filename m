Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FC2CEE34D
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 21:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKVN78OiCJEPDXODtRkG3HDfS5J3magPZOO6QTPM2QU=; b=WNqT1FbGD7MNy8
	TMKfaX4Yi8JZ1yO2902ztQEtHrYQAnHXFP9dqN89doQCh2BcRNy61LyfYbfSxP22D97BDE1qyOz0B
	WWNURblg0wyVsM0C/jwL8Q74G2M/FBZ6+QivPT4+D6mKMW5KfvyUND6ecOeYMO/MwigFNwCbunKjB
	+LVbMudQSsmImCwqwugP1IcHqYLKkCl5QoON0KZQmhTUG1MUg9tktOoAx/H2yCsFhdYXhYI571wPP
	+rNWk6KgkPsaq29bPfmwT4OgY0Y2UBTN7Nn3L/VIFMZa4n9GfSNMsNU78YP5Q4TnAoAiRf/JPA/ac
	AKhsl5gJveIwR8P5BiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLSyJ-00000001753-1dFZ;
	Tue, 18 Nov 2025 21:10:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLSyH-0000000174r-48pR
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 21:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F26A601EB;
	Tue, 18 Nov 2025 21:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A645AC4CEF5;
	Tue, 18 Nov 2025 21:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763500240;
	bh=mQIatXrUesCCYwuwCw6Di94Em27lL6vtxEHYpc5jvdc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=En0rq2b1mYkournvkMegEGzUljsRV0vd/iUWH3iGQQugye4p8tDYPayEhd0GMVyPO
	 WTxewXvbHf1385cbRKBaMR0ZnAZxhSxf+UdNpWLusOkptK9q4kQHCiU+55khO5K70a
	 J4P93bmS8maZd/tUwzByuxdynwZg4LY4sX/Xj8uGvY6ft46TGFLSU1kLGsi6ddAXQu
	 FnGmxQGibrmXsymqILkfvCA9/jJIVDnTIF6ml7ZtWFwyjS7n7P+v6l4SFhq7xhaZRS
	 BXkZAgmv2obLCxF6FbmaCQuzrmhTIhWuWkOja0vwJREVJU0r75ZGVoNWDJnXezEgEc
	 8wCDv6SA2ujkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E70380A949;
	Tue, 18 Nov 2025 21:10:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: fix KUnit test_kprobes crash when building with
 Clang
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176350020601.107040.11107481063131257896.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 21:10:06 +0000
References: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
In-Reply-To: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
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
by Paul Walmsley <pjw@kernel.org>:

On Thu, 13 Nov 2025 18:51:42 +0800 (GMT+08:00) you wrote:
> Clang misaligns the test_kprobes_addresses and test_kprobes_functions
> arrays, or does not export local labels by default. Both can cause
> kmalloc_array() allocation errors and KUnit failures.
> 
> This patch fixes the issue by:
> - Adding .section .rodata to explicitly place arrays in the read-only data segment.
> - Adding .align 3 to align arrays to 8 bytes.
> - Adding .globl to probe labels to ensure symbols are visible.
> 
> [...]

Here is the summary with links:
  - riscv: fix KUnit test_kprobes crash when building with Clang
    https://git.kernel.org/riscv/c/e2285bd4a467

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
