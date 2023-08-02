Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9379C001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80tyZuPacaakeSb0pZLaoKSbVdd2lUUoS7J+s8140C8=; b=W8OqC+//AkAGq0
	qFoxw+iE8ZPIgGUw4UnpivKB7+xbESKc5gkZQK8xsVDkC0fqaTTZ0ZlrFA9Plslh4LdQ6k+gdqTsB
	WnkCt5TOMR12uZp1KNR0EamPbP+u5yo7o6y02JQwdgDDYu4bqIE4Ma8GYn7YfEHwS+5PD22k8tRKA
	6NNbW8yozj+FHix2uz0jFG3SlWril7XGz17CqKiN1YI+fbEFRwdc1UmyjYeGsspjvqONOPOyvtvEK
	IJclRXMfce3PcfHZR4KWEBp/saZwfzw9gfBm33zT9+3oSn93vV10mniAFdtKQREFDybmyKsAL91Ve
	mUwbmgANU7E3UsNVZ9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRJ6w-005uEQ-2i;
	Wed, 02 Aug 2023 21:10:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRJ6t-005uDw-1K
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 21:10:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3EE761B24;
	Wed,  2 Aug 2023 21:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A16EDC433C8;
	Wed,  2 Aug 2023 21:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691010621;
	bh=U6fwEY6CTug5r3b9WDLABmO5cBrj/XDZhdVoueKrQtc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Y2kTcAN3AYkOVOEGiwmAZkCCdIQ9M9IKrP+EDBGrQD9Ej//4M9AwTvVAUQCnYXhQM
	 NvD/5tevUYJM9WqfvhkC2cseOVDORAh+RnmFQk/8fjlRXlWSSFuwERNeelqnojK8nQ
	 OEBHMgdDM/L8ih49+XTb6rrSyTqsKZbHdFMoBl2uxdGaOwK9KtBxnTjkdvxTLhAV6r
	 oTH7B3n5fAnpJ6x1m8nBpst8c3n9MHn6ZOKsaIOisT5nQyNeU4TdcAB1RVFyxazsXZ
	 mjdsWBCVY9KRtdvFhBbuu/dKs+RuXGWZY1TZ/7ahklfVevr3SPanEy8/KLCmrneEFj
	 +8QDeN634tY6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81E99E270D3;
	Wed,  2 Aug 2023 21:10:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv,
 bpf: Adapt bpf trampoline to optimized riscv ftrace framework
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169101062152.23031.14952859291909120655.git-patchwork-notify@kernel.org>
Date: Wed, 02 Aug 2023 21:10:21 +0000
References: <20230721100627.2630326-1-pulehui@huaweicloud.com>
In-Reply-To: <20230721100627.2630326-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn@kernel.org,
 palmer@dabbelt.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 guoren@kernel.org, suagrfillet@gmail.com, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_141023_491594_BA9A2B5D 
X-CRM114-Status: GOOD (  10.85  )
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

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Fri, 21 Jul 2023 18:06:27 +0800 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Commit 6724a76cff85 ("riscv: ftrace: Reduce the detour code size to
> half") optimizes the detour code size of kernel functions to half with
> T0 register and the upcoming DYNAMIC_FTRACE_WITH_DIRECT_CALLS of riscv
> is based on this optimization, we need to adapt riscv bpf trampoline
> based on this. One thing to do is to reduce detour code size of bpf
> programs, and the second is to deal with the return address after the
> execution of bpf trampoline. Meanwhile, we need to construct the frame
> of parent function, otherwise we will miss one layer when unwinding.
> The related tests have passed.
> 
> [...]

Here is the summary with links:
  - [v2] riscv, bpf: Adapt bpf trampoline to optimized riscv ftrace framework
    https://git.kernel.org/bpf/bpf-next/c/25ad10658dc1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
