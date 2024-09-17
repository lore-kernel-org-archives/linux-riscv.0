Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0168BC3601D
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLeXm0ws8UsE9Fd4wylkzbST2+SyBxzcUC0xmKNycxU=; b=S8YulxKrjLeZ+l
	3PPte5dxH1sYNcfLeG34L+Ti8l4zCdfx7ZhUQ6CDmWAibX800W46PRbA5HzvTUgpGiECTIHX5Y4BW
	uIOlgjFaD+i1nnSicP9k0HsCfDUjj3jD0i2fbU7hWAilAs7c8v5rmqZMZiyj/YN45ve1JwPXCtErQ
	IRK6HNzeWbjUNUNegCojhHFUdAzoCDN11DCK2ySK12MCj7Ym1VbItpwZQ/uCXC6dMtKyl54RkulCf
	k7Dp4awfpii9HJ/6Cs/CMTi0Pxr+3im8hF5zPwW+/9/Q4LB04rQU8cRGfvaxTl1vPbiQyweqRuSte
	AzPm36tvSmWAxMUfi/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXp0-00000006Aui-2RkP;
	Tue, 17 Sep 2024 13:00:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqXox-00000006AsY-1WOD
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82945A41470;
	Tue, 17 Sep 2024 13:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B696C4CEC5;
	Tue, 17 Sep 2024 13:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726578041;
	bh=+I6YJNqbdS6L1MKoC08v99ILu3LMq10ZIEs52n/9GwE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jEH4LxVl1YVf01Fn16xlBk3tziXeXWCBEq9mwh7k2aCKrq6pKbYmnFkSK4yeW5+fy
	 8Kc0YYtez89HiikNsvFQP9UpbAWQdSvCdHJ6IHHNi7h3EBGpWqp7kCpdKh2x2idDtK
	 VJ9HVeS3THp3eYX1VBuaZclps8n3sEffrcOIfBYQsDUJpw2czvIfEBBB83kFyixZ6B
	 Sa57g0jmsx/BCBy3/NHIm4pWiIAREb2OcAPz+S7wkzgWsGZpAS4qS+t9qy5wo8hqKL
	 lGbLHoRFVNYr04RqodUvqOVniByJf6R4k9tYQMcFioaKMJYib8gMbziKlUNeG080Mr
	 RvXIVwNt026aw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACCC3809A80;
	Tue, 17 Sep 2024 13:00:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] drivers/perf: riscv: Remove redundant macro check
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172657804252.126252.6901114018072567420.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 13:00:42 +0000
References: <20240708121224.1148154-1-xiao.w.wang@intel.com>
In-Reply-To: <20240708121224.1148154-1-xiao.w.wang@intel.com>
To: Wang@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Xiao W <xiao.w.wang@intel.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, atishp@atishpatra.org,
 anup@brainfault.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_060043_487139_023CA6F8 
X-CRM114-Status: UNSURE (   9.34  )
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

On Mon,  8 Jul 2024 20:12:24 +0800 you wrote:
> The macro CONFIG_RISCV_PMU must have been defined when riscv_pmu.c gets
> compiled, so this patch removes the redundant check.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  drivers/perf/riscv_pmu.c | 2 --
>  1 file changed, 2 deletions(-)

Here is the summary with links:
  - drivers/perf: riscv: Remove redundant macro check
    https://git.kernel.org/riscv/c/1e206fad765b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
