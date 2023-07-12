Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E63FC001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPIFsH7PSFwl/Ih1YzvcrTPcP3CMXClg9TEDjrxXFq0=; b=fLdK38u3qCXXS6
	OaNnomiKqlx0TAABO14yNd6ddzSHBOFYQiXreSDHXHqVWlBM1hJMnWfl0/CHOEl7pJNgTTyNJZiA3
	Pdv9h4i8U+C7v6SUj1c8pJS13O/FylxVBvPuEW0N7YyRMt+5NjufBp6DcEqI9IYhem9nKhU58uD4o
	5NbaNOpbMW+HdtOWT0MJ0S/n0DwMYiCUGLF+nShqs2rB2vPQd76thkAALQQ8rmYBkckqVjrluoltX
	YkCk3zWJ8AKHUJrHav/sLL6wOOhVaCilaPSv9HpgGh51y2Yf9eZqz+SwSzAEnZOYD4CMSrLYclfJb
	3pz9HKx8FJhZpAGqY8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcGR-000Rqq-0D;
	Wed, 12 Jul 2023 16:00:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcGM-000Rnv-2u;
	Wed, 12 Jul 2023 16:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64E996184D;
	Wed, 12 Jul 2023 16:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C09E5C433C8;
	Wed, 12 Jul 2023 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689177621;
	bh=zNkYR0JyjRXUJ7vFyx0u819ePXXPtTPmLqFb58IyYgU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=u5pbmmRny/PgfzGaePeSfwG/Wkz1NNm0fuvAIPvRY54ujqc2YoYxFh69nika2ZSD0
	 zo/mi7wOv7tN6YXq/s/DBm0k+gEOYRsptfSTe3JTW32cKZKdjLefA+3UE4JV3UJEdm
	 kvNoyh/it49Jx5roU0VLRZxGnePIshWFYFtbWWoJMRV44pwD38vXMmHM/rr085XsK4
	 FbrxPleSDBbEUyv9o1mC2mjMrc+YV1HWFEhLBEyuaaNaMryrKXEIKE7p9AR++HZQJp
	 K/CkVAIwYnOtqsB8lYA0JGGuFu74ajRl0lkIjyGn6AC95KRkenlxDIKl4fHpIiWX++
	 aktu/dNXgE1oA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9ADCFE4D006;
	Wed, 12 Jul 2023 16:00:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] perf: RISC-V: Remove PERF_HES_STOPPED flag checking in
 riscv_pmu_start()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168917762163.26837.1392502139104305103.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jul 2023 16:00:21 +0000
References: <20230710154328.19574-1-eric.lin@sifive.com>
In-Reply-To: <20230710154328.19574-1-eric.lin@sifive.com>
To: Eric Lin <eric.lin@sifive.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, will@kernel.org, mark.rutland@arm.com,
 palmer@dabbelt.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, greentime.hu@sifive.com,
 vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_090022_982099_9E173E90 
X-CRM114-Status: UNSURE (   9.84  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 10 Jul 2023 15:43:28 +0000 you wrote:
> Since commit 096b52fd2bb4 ("perf: RISC-V: throttle perf events") the
> perf_sample_event_took() function was added to report time spent in
> overflow interrupts. If the interrupt takes too long, the perf framework
> will lower the sysctl_perf_event_sample_rate and max_samples_per_tick.
> When hwc->interrupts is larger than max_samples_per_tick, the
> hwc->interrupts will be set to MAX_INTERRUPTS, and events will be
> throttled within the __perf_event_account_interrupt() function.
> 
> [...]

Here is the summary with links:
  - perf: RISC-V: Remove PERF_HES_STOPPED flag checking in riscv_pmu_start()
    https://git.kernel.org/riscv/c/66843b14fb71

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
