Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D2AC5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxaOv82ZkgP1R7WDlq+WIenif2QjrUvRo/PWUCZiyuM=; b=LVVDMKJ5U0sIlM
	1fcj5d/raOuVgDFK1IrPPVX4x0xWBRu7LglKqsmFMds2pDsC7dewTizez/ESDnHlGwX8F5eZK7zXc
	h9kHS3vngXxgaDRkEWh9IFxI9LAUzrb82IitL1qktpPbjt7rqs/YbYQtAMQ3nvjgHQtCKXfzMJZVM
	yKzEEFUxxF6Xvsh3VBAc8vk6HkvBXpfCyPeOhVgz47OrArK9OHwPQv5Spw06G0ZoMaoOlm5nP0WBS
	0WlxVF8zQ5KXFFK/TwrmHYAElLURrfc6ED0AN8mHVcXpstNmv2uquXiWV7QKBHh8ljE1D5KS/lYiF
	J41zb5dErehqO7moeX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfLZt-00000009ppL-3FNL;
	Wed, 28 Feb 2024 15:10:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfLZp-00000009pmM-1e1J;
	Wed, 28 Feb 2024 15:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AA52BCE2246;
	Wed, 28 Feb 2024 15:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9EBFC43390;
	Wed, 28 Feb 2024 15:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709133029;
	bh=6FVRBR8jkQw+3lkUXhMUDt/EFHO2AhiOr7rXMH2y+q0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h4goeIk4xtRGMH9+CnkQf3kPkBQ6mVhd9S+c+XK5JUvJFXiZMfsao3tRz9b46/1kx
	 5QM98/OMMTR1+RZyk+RN3usJqM89sJdQu4iBLgvFp0gzHBoq1ikkYwNbPIDCWxE8aF
	 y/suAQzsWnq64U/75VPvPOhNAM/wYBnEE9IfSeoJ8yULkudB9Iu1OpE6GFEdJXnxTr
	 8K1ZeSSqs+TKMX5Hfrki4PPSqa/A6KhrZak8xDeLNlDQSFbTxOrBOVKrvjBjPiZHBM
	 QVKikH5b3jFDVfzxnrrYHD33fzBi+znAy53P+gm6v8dO66FLQzBvNN8nvRmtsytklJ
	 X9sk/Nyjs4u6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA96CD88FB1;
	Wed, 28 Feb 2024 15:10:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2,RESEND 0/2] drivers: perf: fix crash with the legacy riscv
 driver
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170913302975.9913.9405105778490456621.git-patchwork-notify@kernel.org>
Date: Wed, 28 Feb 2024 15:10:29 +0000
References: <20240227170002.188671-1-vadim.shakirov@syntacore.com>
In-Reply-To: <20240227170002.188671-1-vadim.shakirov@syntacore.com>
To: Vadim Shakirov <vadim.shakirov@syntacore.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, will@kernel.org, mark.rutland@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_071033_642616_D40B5B25 
X-CRM114-Status: UNSURE (   7.87  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 27 Feb 2024 20:00:00 +0300 you wrote:
> This series fix crash with the legacy riscv driver when configs:
> CONFIG_RISCV_PMU_LEGACY=y and CONFIG_RISCV_PMU_SBI=n and you try
> to perf record
> 
> Vadim Shakirov (2):
>   drivers: perf: added capabilities for legacy PMU
>   drivers: perf: ctr_get_width function for legacy is not defined
> 
> [...]

Here is the summary with links:
  - [v2,RESEND,1/2] drivers: perf: added capabilities for legacy PMU
    https://git.kernel.org/riscv/c/65730fe8f4fb
  - [v2,RESEND,2/2] drivers: perf: ctr_get_width function for legacy is not defined
    https://git.kernel.org/riscv/c/682dc133f83e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
