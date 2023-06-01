Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FE1C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 20:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuEf1iDeXyoWVUB3Ri9+FDyQgaY5yterUrkHE0psvus=; b=A/syTlRQF1QQk8
	l8M413luAXmgmOubYpLSK4D7GVpyMpknpx2Zrwcz8P8o55adUreW7cHL98IyaxS+XW8Uf6KbQ27E5
	HjCwYzH08MJJCM9nvnssP/7miRcxtjB2E2ylwpF6hj7/9fuQApbAR1ck1urIafnfzHv4BI35RQpRi
	ep6vFdq0BIC8v0jfX3Q5DU2TiELPCUZtGWD6GPh4fTLEDU3jWXySakDUJmqGOLrYdi/WfXGitHlqf
	daCqE+Txs4jiQKh3dUDcHXAAszCAjqlBBpqJvgsjf2odUfyxN2cVG0EiULdPXrBDPPcN9DirahyuD
	st54WobiRIQfNr5xxUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4omW-004qqi-0t;
	Thu, 01 Jun 2023 20:20:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4omT-004qpS-1Y
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 20:20:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82BE161D0F;
	Thu,  1 Jun 2023 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E419FC4339B;
	Thu,  1 Jun 2023 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685650819;
	bh=tZKKg0LORH8+7Jf9bqksdik1OnIaetPXfVTt/qqjvyk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rIkomw20u6mEVDMn/IOEschDnoMpN2fPCMMXA8EoUDTpSMD91rxyy4KITCCT/5Twq
	 H/H6pjARN6F0tDaeAeV4qqRHTItgCy0RlCGe8UQfWCBAr9wyCH1xeiMcwXITkkmYBi
	 YaEs+RCqjaEAY/xPTDQIaWqICXicsvHA47LjbfEO+lhTdicr5TW3/dIVoi9sDXBS8q
	 wZ6yZE5JJOMpjdjbibUuwjsec2ihWAcFq5tppCHuduoshy3uk8mq8Mk2ZIpdWHUHD/
	 mCpCz0CXq708hpaP3/LKqqGTA9hqOdAUe//xp0Qf07/hBTlgD2M7FBIqJmvagj3LhU
	 N5FlL/a0EUOpQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C58B0C43162;
	Thu,  1 Jun 2023 20:20:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: perf: Fix callchain parse error with kernel tracepoint
 events
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168565081980.8603.14671777947375742178.git-patchwork-notify@kernel.org>
Date: Thu, 01 Jun 2023 20:20:19 +0000
References: <20230601095355.1168910-1-ism.hong@gmail.com>
In-Reply-To: <20230601095355.1168910-1-ism.hong@gmail.com>
To: Ism Hong <ism.hong@gmail.com>
Cc: linux-riscv@lists.infradead.org, ism.hong@realtek.com,
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_132021_575367_2F3DA0BC 
X-CRM114-Status: UNSURE (   9.53  )
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

On Thu,  1 Jun 2023 17:53:55 +0800 you wrote:
> For RISC-V, when tracing with tracepoint events, the IP and status are
> set to 0, preventing the perf code parsing the callchain and resolving
> the symbols correctly.
> 
>  ./ply 'tracepoint:kmem/kmem_cache_alloc { @[stack]=count(); }'
>  @:
>  { <STACKID4294967282> }: 1
> 
> [...]

Here is the summary with links:
  - riscv: perf: Fix callchain parse error with kernel tracepoint events
    https://git.kernel.org/riscv/c/9a7e8ec0d4cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
