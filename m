Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6DACEBF97
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 08:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldgTrzoXQBBt7YA0IXK84bOpraeX/e9ZhHhbjqOET+w=; b=FH/X2J0CnP7Ssd
	jBBr0nURScNVUOrMsFbQrBA3n3PUBsFg/dWuEgSvzwk4+eJadBxqjZKwzZw6A0hWbV1hzZdd3rZ8x
	+lHKRUodDIa9alyX27B18VJUKYHkoq1xjKnsX0ubCa+jRD9bCI18n1Z+lkQa8DtlbYYwc0u/JMVzS
	IajreWzXlVMpiDbrrqxUXph6Gm3juKV34ps5OpGe9VC3KLHfOeY/Dl0nRdbu7b60z4zVoHWTydQhX
	SegXNJVavh6fmQI2XdE1T7gwyXt8FqR7N66vGGdnfxfmMpirCYpCNuiX6Fd+yOAqVEOSkj+FBQukW
	6jgnjbEMv52DiKQROK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGrD-000000002K8-38Vk;
	Tue, 18 Nov 2025 08:14:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGr9-000000002JL-27Jd
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 08:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EABA66061A;
	Tue, 18 Nov 2025 08:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B26C2BCB2;
	Tue, 18 Nov 2025 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763453670;
	bh=h5QM5I49zfXRN1fY8Yc8FUe4VI/7j0hVYgitCX0QD5I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qzwOLDAYTgv6tj/Qerv+zTmO5EKC98rhtl85rdCSusUOFezXcFBjIbbvSdreebq6W
	 hzg9sdTEEfdAu7xGH+EH+zW9qLy5omqPK+2iTYIq5JI/ouuJQ2pKenjKPpD8CIBsFT
	 fm8xMavLgJQtIAkNP8TxkH4IPX9Kl79pfTOaBcpxLYQRbuD6EcyS6H7VWk0dR74PRM
	 1X/Q7VVtaW32NFh5SLh6fPBiKSmwHyR1EwZ5qyQhhQBelAzg1uga+dFlKO03nnZIAe
	 mwwbCBsSpPLbGehaIFVogIRmBwfcmnygJeNfJRb9Zqx40kVT0T4xhj5rCvHRrdBR+l
	 LUrgpJtfI4XzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD033809A2D;
	Tue, 18 Nov 2025 08:13:57 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Enable HOTPLUG_PARALLEL for secondary CPUs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176345363624.4032995.4350980055596642476.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 08:13:56 +0000
References: <20250905122512.71684-1-apatel@ventanamicro.com>
In-Reply-To: <20250905122512.71684-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, alex@ghiti.fr, atish.patra@linux.dev,
 anup@brainfault.org, linux-kernel@vger.kernel.org, ajones@ventanamicro.com
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

On Fri,  5 Sep 2025 17:55:12 +0530 you wrote:
> The core kernel already supports parallel bringup of secondary
> CPUs (aka HOTPLUG_PARALLEL). The x86 and MIPS architectures
> already use HOTPLUG_PARALLEL and ARM is also moving toward it.
> 
> On RISC-V, there is no arch specific global data accessed in the
> RISC-V secondary CPU bringup path so enabling HOTPLUG_PARALLEL for
> RISC-V would only requires:
> 1) Providing RISC-V specific arch_cpuhp_kick_ap_alive()
> 2) Calling cpuhp_ap_sync_alive() from smp_callin()
> 
> [...]

Here is the summary with links:
  - RISC-V: Enable HOTPLUG_PARALLEL for secondary CPUs
    https://git.kernel.org/riscv/c/dd2fbacc2ec5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
