Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CA1C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 21:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYAwik+HIEg5MQ0qVnyAt0P1fAgtT8sZm71y4CEk3sc=; b=lXzCr15Y9AHBGs
	Xrzojbw2EogapjcW1OvWWKGOfxzE3X2gl9gwxP213YxmKez1a9Q1LXLFMUEYz1zuqa9B68vtgz9ps
	zhAcu8sp3gywo1253IoEdhTEeDMeP/zQvV6KUhS3F6dBKh5su/yjQZUYKQBJu+tbKh6MRXTEuhCDW
	wzbYCNcj78fLPSNCs/SHUUaEaHPpqCNAKTYdX9WVLOL4FGe1XYjxqz6kc23BC0NcoycnV2hkZzx8R
	x7VIcxgm9r9lfYLyq4hMc6xtYJNnPawshS2BOvAeFczaCISDHRtQrXsPsLkxC8vo5G03ggfUP+VPs
	ShOblQhpMvuGxx+V/N6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwXI-00E9w7-V1; Wed, 22 Feb 2023 21:20:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwXF-00E9vF-Ep
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 21:20:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 483AA6158A;
	Wed, 22 Feb 2023 21:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE269C4339B;
	Wed, 22 Feb 2023 21:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677100817;
	bh=VdBqIJRMLIk4EW2pSklQwLkjQJu/N6EZyOkdQDA0yzo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZvyRe/TrpVPGEIvgK8WDEqhxitBTaeA3ZnFAse0yYacGalHqvlViutBuRnekH/lps
	 NeVZ3MByMJoC8evT8bylP/wKRfVhfnOMOek3XHmly56HBMdMjqjq2cs/4z+kQ3Vvj2
	 Ef6FtxgabaTTA80gvK3k/WyT8PUi0tFCebIgeQ0rNmImra0MfI6R6s03HnKCzNqD3I
	 rhlDXiwNgTB5m10mmvC7ZPJdjRJQdMM6SvpChx7DpeFOM97PgcEukDUTG+kzpVgqNI
	 IWyhs/orKYnJpNuaIXOFuinIZtGQJ9vzM1uZobLspP1PitJHhl6ZuTBkSJHr1/6KyT
	 YO0s9U4SUdRZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B210C395DF;
	Wed, 22 Feb 2023 21:20:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3] riscv, bpf: Add kfunc support for RV64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167710081756.15608.10141066511588092218.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 21:20:17 +0000
References: <20230221140656.3480496-1-pulehui@huaweicloud.com>
In-Reply-To: <20230221140656.3480496-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_132021_572660_17618E59 
X-CRM114-Status: GOOD (  11.37  )
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

On Tue, 21 Feb 2023 22:06:56 +0800 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> This patch adds kernel function call support for RV64. Since the offset
> from RV64 kernel and module functions to bpf programs is almost within
> the range of s32, the current infrastructure of RV64 is already
> sufficient for kfunc, so let's turn it on.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3] riscv, bpf: Add kfunc support for RV64
    https://git.kernel.org/bpf/bpf-next/c/d40c3847b485

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
