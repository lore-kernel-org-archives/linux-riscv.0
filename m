Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13172E77186
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYfFKuyr8VZ2wJABR0VnO/WPJJ23berH7uiEjRGoIxw=; b=UTqmw1aCtQH4LT
	GwAMe7M+AMdJQmt33JD9Kvyo2LUM2y7+UeB4BcLJ0+t7AgG2usJO/xx8+LJEdqovItddI8CIjH9T9
	ymfgT+DXM3krQzAx8N1CgJIBKNm7qzyEBoiI5RevF4C2ENM1RyOJO1MNGhYMhbQrqucJUIrL8w4p2
	gf/j1DNzD7aUhnBt7aIt+ZGlFr5j+cpfl34vWeflgqSW6pjTnk/lhOGnOsbW1CSSpUQF6oyEwa7Ws
	OY5ApG66SifPlvVJBSlbdM58xKqZpYW5F26GLL046uKBqZhcFON+OgLi/+r/XlQJXBflH7hr2SLpX
	cMiNfF9TDvJ5Sw2AI+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGq-0000000GLBe-1HuA;
	Wed, 11 Dec 2024 22:33:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVFj-0000000GKMQ-23Jl;
	Wed, 11 Dec 2024 22:32:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FEDD5C67E6;
	Wed, 11 Dec 2024 22:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D44C4CED3;
	Wed, 11 Dec 2024 22:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956338;
	bh=FYl5IF1xeB37ngsUbCx+/Kpy7r9qTtKr20+KIGXrOb8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tydqQ+z9Dkc3NAH6mMGRBaGgg2CIMNMA6zMwA9v6e5VQxCkCIRdDWcFgMpFs8tKII
	 Q3FpbdUZjalVezQB87ujOUgolmwubdSTmeMMcArB+wG690Xhx5siiFL2KpW99gJmwm
	 jnsJ4/0h9UG7BQ8OdZjqQ/aKG695kePySm0vDOiirdVfMc7R1f5YY/knKgkeNjNRxb
	 mQIJYBGAnFM1BJqfq4C3G/kJ1ZG+xAZ9f4uECEsIe+8GMClTfadTHN4O2r1xOtpcmO
	 pGF4KVaSvOlXriKtHyqpY75VBlWBBRs1vuCKvOpldJGV1uIgM5wmRP6PAjk9DlBorq
	 qFQHrufWJR6SA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC12D380A965;
	Wed, 11 Dec 2024 22:32:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/2] riscv: Add perf support to collect KVM guest
 statistics from host side
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395635475.1729195.2011997217327179366.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:34 +0000
References: <cover.1728980031.git.zhouquan@iscas.ac.cn>
In-Reply-To: <cover.1728980031.git.zhouquan@iscas.ac.cn>
To: Quan Zhou <zhouquan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org,
 ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143219_582150_69CDDC75 
X-CRM114-Status: UNSURE (   9.31  )
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
by Anup Patel <anup@brainfault.org>:

On Tue, 15 Oct 2024 16:42:18 +0800 you wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Add basic guest support to RISC-V perf, enabling it to distinguish
> whether PMU interrupts occur in the host or the guest, and then
> collect some basic guest information from the host side
> (guest os callchain is not supported for now).
> 
> [...]

Here is the summary with links:
  - [v5,1/2] riscv: perf: add guest vs host distinction
    https://git.kernel.org/riscv/c/5bb5ccb3e8d8
  - [v5,2/2] riscv: KVM: add basic support for host vs guest profiling
    https://git.kernel.org/riscv/c/eded6754f398

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
