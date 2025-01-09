Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A696CE77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 19:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FCbg4Mpxoxb4oMUCYCWJk44oVg/GUkrCGgQPzdkw9A=; b=N6xseiwcqAluNi
	BfWuQ4HGtVUJpPk2vitxfl4yOoxPbVRmfisNRxtN/voX7fKhytM3boDLApdlC8NC+ZnOZLFvenDSH
	vkcdcPNUe9gTmjTA2ZRDZU6brYp3CLWGfNrO6JE6Rx0cGeLlVzdqIAFTuWEVX97WKBYecJXSAg7rL
	P+guXAtMi+mgvhK5jOmGO8bFwxL1DmqK6kvcORbQuOxv05rqkmsS+F5RuiTFsXzikiDPVLUgASQ8V
	zXvSZFNVVcD0mhazG5lpNQPBKNDAgifnGVi+WdaxxXhWMwDYaIcJxK4w32LozC/I6kpw2kPuym3g0
	WquJNad4vyl0E3OLyH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyPQ-0000000D87q-44sI;
	Thu, 09 Jan 2025 19:41:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyOD-0000000D7sc-2rOk
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 19:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 160DCA4260A;
	Thu,  9 Jan 2025 19:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C6EC4CEDF;
	Thu,  9 Jan 2025 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736451620;
	bh=Z3LRUwMDF8tkD0MjS+hh0M82K8cRRvTGw7fB4F5OXVk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nocqmTV5a2daAtayCZLdRGJUh7n9ZpVNl6esPTi2VyCwTPeMFTFRGn8tLEKVFkAmk
	 MK8mfRFp7NjxYxALyfxsJUoSQP+vEh18Z9nbiISjmrHtLrOcsdZRqRQFGMI3VckXUk
	 h6eg+CKi4JhLZtuAELHH+UmdhXB6URvI/DFDAf+gXnDe5K1e0ImOaxOOVXOA08oxMM
	 9oEHsGYVIinCFk86v1+FPdp4FQxAsOoZkn+X9VXBF/RxIfsRyr2B7889QlWJ7RMLJ3
	 nqcLtYQsKov2C2GyhrLbSO9yiOEJynvo+G7Cr7mX2W0eAQahA43rMwJK5Y06OMsC3x
	 eo/mgszGDWI0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D01380A97F;
	Thu,  9 Jan 2025 19:40:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] SBI PMU event related fixes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173645164199.1490121.10785739806862440772.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 19:40:41 +0000
References: <20241212-pmu_event_fixes_v2-v2-0-813e8a4f5962@rivosinc.com>
In-Reply-To: <20241212-pmu_event_fixes_v2-v2-0-813e8a4f5962@rivosinc.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, atishp@atishpatra.org, anup@brainfault.org,
 will@kernel.org, mark.rutland@arm.com, mchitale@ventanamicro.com,
 samuel.holland@sifive.com, palmer@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_114021_779904_1278B4E8 
X-CRM114-Status: GOOD (  10.48  )
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

On Thu, 12 Dec 2024 16:09:31 -0800 you wrote:
> Here are two minor improvement/fixes in the PMU event path. The first patch
> was part of the series[1]. The 2nd patch was suggested during the series
> review.
> 
> While the series can only be merged once SBI v3.0 is frozen, these two
> patches can be independent of SBI v3.0 and can be merged sooner. Hence, these
> two patches are sent as a separate series.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] drivers/perf: riscv: Fix Platform firmware event data
    https://git.kernel.org/riscv/c/fc58db9aeb15
  - [v2,2/3] drivers/perf: riscv: Return error for default case
    https://git.kernel.org/riscv/c/2c206cdede56
  - [v2,3/3] drivers/perf: riscv: Do not allow invalid raw event config
    https://git.kernel.org/riscv/c/3aff4cdbe506

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
