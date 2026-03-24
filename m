Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8366AF532DF
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLIYu5q86ysBqlxf3DpIF9PyW2J8vt4CRVOpqEVUiqw=; b=Ypk+6MmprbhiLe
	JJ3Jxzagf0EcJ7IPp7+YovnWGNvSYeNkUZAfLC/wYULl1C5hCv6TB9FpRQJBsljLsNYHkd9xny8rn
	RtGeIU+8yaiAdmaZSgm+wPWGFuqNZvNqiCsuLaqbfdtRc0cGpHBu8KDc+xbuvsPFnF9Hy2fzs79yy
	5OosR+uUy5ju1KX7WkiVquQs0a5DRdSaq1K2ZUIc+OvwK1y5sq9bv1xdrB1Pg89C79+fz/R9fc+WC
	Cx0FxNMMJ9bbiDZBqo6VcI6IgL1yqVvXbMLD7LIzksDpynJVlMYRGB38LnD1XgRbPeBZU9bAgkPrj
	mDNWmSNCsSGC4uKZH8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uw1-00000000dyF-2B3K;
	Tue, 24 Mar 2026 06:08:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uvt-00000000doF-2HMI;
	Tue, 24 Mar 2026 06:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1225600C4;
	Tue, 24 Mar 2026 06:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9ADC19424;
	Tue, 24 Mar 2026 06:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774332454;
	bh=wFb340HUOaVrCXWQpjgqhiuSeNlgOOpYnArU4IDmxzQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TBlAG3kLq1QC9v/NKcvGed5e0LjMvlG9h0iMOSj/3glJcGD0yAAUYeXqJdBQlyd0n
	 mxF3JXMSNmPhKUSGpblKH0uhIQnL36LIgEy4RiYqtxA6VpPMdmI3RCvMcAE/ryfipI
	 aOiDQoDLBkG/+2wfKqahNxof/eeA24qDIxLyeSjLvnTXWPIFTu55qFEg9sbEnSkyD6
	 IE90UwaA0J5PEjHSEZVGG/rhPNCy/KGELPK7CQJrWsJnxwHafSwdmIDBCXAlFNjQW+
	 /GZzQ7+h0MixrEKdi9ZxoOAdi8r3VsYs6bqBzBzxTMMRdItSGJ2Czpb+6ey4cxdcUu
	 qS1/OaI3tMXnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA04E3808200;
	Tue, 24 Mar 2026 06:07:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/12] perf annotate arch clean up
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177433244254.469836.16725604300266891770.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 06:07:22 +0000
References: <20260122213516.671089-1-irogers@google.com>
In-Reply-To: <20260122213516.671089-1-irogers@google.com>
To: Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org,
 john.g.garry@oracle.com, will@kernel.org, leo.yan@linux.dev,
 guoren@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, zecheng@google.com,
 tianyou.li@intel.com, thomas.falcon@intel.com, Julia.Lawall@inria.fr,
 suchitkarunakaran@gmail.com, atrajeev@linux.ibm.com, aditya.b1@linux.ibm.com,
 howardchu95@gmail.com, krzysztof.m.lopatowski@gmail.com, linux@treblig.org,
 shimin.guo@skydio.com, slyich@gmail.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org
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

This series was applied to riscv/linux.git (for-next)
by Arnaldo Carvalho de Melo <acme@redhat.com>:

On Thu, 22 Jan 2026 13:35:04 -0800 you wrote:
> 3 initial memory leak fix patches for perf annotate.
> 
> Move the disasm.c #included arch files into a new util/annotate-arch
> directory. Make the code compile standalone. Try to better encapsulate
> architecture specific code within the files and with a
> arch__new_<arch> function that allows additional data to be associated
> with the struct arch using the standard container_of trick.
> 
> [...]

Here is the summary with links:
  - [v3,01/12] perf header: Fix memory leaks in process_cpu_domain_info
    https://git.kernel.org/riscv/c/d84f24c89886
  - [v3,02/12] perf annotate: Fix args leak of map_symbol
    https://git.kernel.org/riscv/c/00419892bac2
  - [v3,03/12] perf maps: Fix reference count leak in maps__find_ams
    https://git.kernel.org/riscv/c/6fdd2676db55
  - [v3,04/12] perf disasm: Constify use of struct arch
    https://git.kernel.org/riscv/c/57d26593a92f
  - [v3,05/12] perf disasm: Constify use of struct ins_op
    https://git.kernel.org/riscv/c/1e3b91d6c53e
  - [v3,06/12] perf disasm: Constify use of struct ins
    https://git.kernel.org/riscv/c/2a1ca20d0b58
  - [v3,07/12] perf disasm: Rework the string arch__is to use the ELF machine
    https://git.kernel.org/riscv/c/927308527310
  - [v3,08/12] perf disasm: Don't include C files from the arch directory
    https://git.kernel.org/riscv/c/07b972ff09f4
  - [v3,09/12] perf disasm: Refactor ins__is_call/jump to avoid exposing arch ins_ops
    https://git.kernel.org/riscv/c/5301cc698821
  - [v3,10/12] perf map_symbol: Switch from holding maps to holding thread
    https://git.kernel.org/riscv/c/c4e3a00356ff
  - [v3,11/12] perf disasm: Refactor arch__find and initialization of arch structs
    (no matching commit)
  - [v3,12/12] perf disasm: Minor layout tweaks for struct arch
    https://git.kernel.org/riscv/c/dc329efc162a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
