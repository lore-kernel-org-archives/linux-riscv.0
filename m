Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E35C5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 18:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQ8asKZaAcX4NAnkX2aGF5JmJlOZDymOD650Y4AmaHo=; b=qFrZ7AWb6K3Ajx
	q3dHZUtJV7vruH123lpX9MjR7Hhgyd4iVMfoDnOuQK8/MzbPxOodZ3w/2PwE4stEKL+ZxXbkGJ6pC
	A6Eg1KtraLKEllnBfwlaki2mDnx4sZ4t9W2lG54EiwHZVAgGaBmmpUNNJxw5cDNwxPWzs8hEK5oCG
	mL1+XKc5MpFljHz+hj+8CmT6iZyBq+v5sE3FbocYCPqBwyaH/oTJeVm7JE0uZ03lzPRI69htFBB9P
	jtgDbV2cEqk5hlf3p0ZzEt0R3s7dz2rblTNGWe6Rav5VcXNpNLE3UsJeuVgaMEa8PtENcP3JoB7zo
	oedb1iZtVR57oCW47dgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdaTN-0000000At8d-0u9W;
	Fri, 23 Feb 2024 18:40:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdaTI-0000000At8F-1Qgz
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 18:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 631A661575;
	Fri, 23 Feb 2024 18:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A7E2C433F1;
	Fri, 23 Feb 2024 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708713631;
	bh=w3VBopBJfwenX5gwBGwwxAnI5hdVG5YLOxWhTzq8TfQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gJ5hsMSeqN1YMJoDJf5tWgYDSst8bfjip31/alekslELRGXwUdQJ7fb69SdL5CW88
	 3EPytODhzqhMTMAO6pmK4jhwgXgbOYtFC7dI3iNZO5E7Hc/hqjK+O9uORPNeIgHjWO
	 edVmF/CU+4i1IgvlEqIiadbCdnDZNHvQAIFJgCIdXi06EXcCA7ttQgey/aDaZPCxT0
	 az5NNscfSmDLyTzqLt2Y+FqmR8o99BNRk9qOI+c6MD+2YZzs3bdLgudmGpbjvIdfoH
	 2MCYv0eYgcMFGdTpkzJmcoxQl+LcTt4EY37KasByGtTIuPdYrcQZeiJQJt0MBlTt3z
	 rdF3rFsRfik+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EC6A4C39563;
	Fri, 23 Feb 2024 18:40:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] RISC-V: Ignore V from the riscv,isa DT property on older
 T-Head CPUs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170871363096.23799.17670733564851167829.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 18:40:30 +0000
References: <20240223-tidings-shabby-607f086cb4d7@spud>
In-Reply-To: <20240223-tidings-shabby-607f086cb4d7@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, palmer@dabbelt.com,
 guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_104032_693087_7D11BACF 
X-CRM114-Status: GOOD (  10.61  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 23 Feb 2024 11:31:31 +0000 you wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> Before attempting to support the pre-ratification version of vector
> found on older T-Head CPUs, disallow "v" in riscv,isa on these
> platforms. The deprecated property has no clear way to communicate
> the specific version of vector that is supported and much of the vendor
> provided software puts "v" in the isa string. riscv,isa-extensions
> should be used instead. This should not be too much of a burden for
> these systems, as the vendor shipped devicetrees and firmware do not
> work with a mainline kernel and will require updating.
> 
> [...]

Here is the summary with links:
  - [v3] RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs
    https://git.kernel.org/riscv/c/d82f32202e0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
