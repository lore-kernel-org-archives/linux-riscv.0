Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7BFC4707C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j052RtVcUAyy7rhOMliN5k2DPwJ+56saEnJ45n+If+M=; b=T3xLfGzZRNDziX
	BjieYsMqR+vUffgq+Qe2DaCZl5Ui0UTIVu5Lfl6xVh4T38yCMtcdFZu4HN+2wovlWLbOeF5qDGSZT
	ytZUz9lUv0dsyIhEHPMmuFm+sMn/0Z9Qc9q7bz8ahqagby/n5MMg8hnzyy/3VjOvECIk0usRckfRf
	1Sd4yOwkr0vlW4RzYLysY8u+fg50wCEiFITf8Af5J9G4+oyM9z0WhXIuBeiH8p63gXyc+bHwuPwPz
	Lc8cQpDoxedSULQWpkI+8qh/N0lOHUEVWKxmefgXpMFchLRDkJVr6yB+LYPSyDj+Q3Mx8B56e3HNH
	7nddeG62N6bsBKQ8D4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5L-000IwY-0B;
	Fri, 05 Jan 2024 21:50:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5F-000Itj-2k
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 21:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E010961C14;
	Fri,  5 Jan 2024 21:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EABEAC43395;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704491428;
	bh=pxH3U9z6khx6tVHIWqaGql+jUBJveUc94c4ZoAPEGGw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PDb6/LrkfooIlMm82I88mGQhEXQJW8ViFM/Tz44pviB3OSSSGgxcOYwOk5/iS3l5E
	 6896QZax1frH6o66NaAcQIq/c6xxZmaw8yEJDPthHuhGD9R3zw4ARSP3PDpfbdcjhw
	 kgRuvPXlHJAmcKwBC7imZYworvWieB3g8trxxrJctwfXCQp0BmNsyI2Ny6h/c2nUBA
	 TuyCmg/PfR8DnxE3A+dRFKHwq6u6wpcLAr3R2kmvxQ2uFuqRCl7kiSbdgIth1f+plT
	 fwOgYxZqzEVGSuwt4pjyeThQpEtLySJKb/7zOKpzVoKci3PbhoWIcqan347hQSVqQg
	 e9LZovdjaKx8w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D623EC4167E;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: riscv: cpus: Add AMD MicroBlaze V compatible
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170449142786.26226.3590037133806155543.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jan 2024 21:50:27 +0000
References: <d442d916204d26f82c1c3a924a4cdfb117960e1b.1699270661.git.michal.simek@amd.com>
In-Reply-To: <d442d916204d26f82c1c3a924a4cdfb117960e1b.1699270661.git.michal.simek@amd.com>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
 aou@eecs.berkeley.edu, conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_135029_950573_77AD1965 
X-CRM114-Status: UNSURE (   7.92  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 6 Nov 2023 12:37:47 +0100 you wrote:
> MicroBlaze V is new AMD/Xilinx soft-core 32bit RISC-V processor IP.
> It is hardware compatible with classic MicroBlaze processor.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - dt-bindings: riscv: cpus: Add AMD MicroBlaze V compatible
    https://git.kernel.org/riscv/c/4a6b93f56296

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
