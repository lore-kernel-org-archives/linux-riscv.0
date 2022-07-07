Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35634C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94JB3RMxfIFaVrmvlRT3DP3HiqmOaTMLtxAcW8U5pMw=; b=rc6+q+xLAygHaw
	xPeYY30z9sHqzs4Vd+hIzHFQx8QC//30LEK4LlssERHVpsxcHxGWHRx/fQxqgK0yTnxjMFOiiazaw
	IY7qdxPgd88pXQYBKiekuRlvzJZtywi9hbHfFBAyy0yIZ334VIgxBC/Q+1ZgydPHnB/8DaI+8OPa3
	AU13Cz82OUDabplWfMh+nvqO1pAviCzV13XY4wx7KO6JBRlW2r5cvO4nYv8L53ameoAWADdD6YSpV
	81jeBrIZl8mvSygPkTHCGl0o3aLEKvSseR5MADO94jtNljhIki1p9FHVHGGCQa9xf8Dtgvp6gYgzX
	xwUmQkyoKk5uPIK4z3tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Sg4-00GWTP-RH; Thu, 07 Jul 2022 14:40:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Sfz-00GWME-Nl
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 14:40:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07B16B82174;
	Thu,  7 Jul 2022 14:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE044C341CB;
	Thu,  7 Jul 2022 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657204813;
	bh=1KvycEYKFO2nkS1lPbHEg1sdOsAMasvPKGJN7xLpDGg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dimJlPy5zSYEZaEI0yxNiUEf7Go9DVZwTv4CVDU9JBPcAd8Uuau4oxTHIxIq1GHW7
	 C1yhvBykrAEC8OccgUDODYjwy3LHjA+aYaqZKDi5WJ+St/GsV8LwbFRPe+CfD+QYhX
	 CY49l+mj7PffKSeb5AWSf4+m5ul2koXyv2DjfoLsnCXgXWh0HA7ynOW6Bmv5znBsHA
	 d+DzODEhY0MN3heLKea9qW6lJzgn7PowTH2xDfT/HAyQzSROs51M/FCN9HhGYQI68G
	 VEYc8YN3/GrTEsA1dj6bpAnLjXIoLgDxjgaEq81Dd3v9M1St0YZAGnxYh2xUJNX19j
	 ZtR5S78HIf7lw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 88F80E45BDC;
	Thu,  7 Jul 2022 14:40:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv, libbpf: use a0 for RC register
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165720481355.13867.6133173423267200694.git-patchwork-notify@kernel.org>
Date: Thu, 07 Jul 2022 14:40:13 +0000
References: <20220706140204.47926-1-dlan@gentoo.org>
In-Reply-To: <20220706140204.47926-1-dlan@gentoo.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, bjorn@kernel.org, bpf@vger.kernel.org,
 palmer@dabbelt.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 kafai@fb.com, songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 chenhengqi@outlook.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_074020_009932_D2A86E68 
X-CRM114-Status: UNSURE (   8.75  )
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

This patch was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Wed,  6 Jul 2022 22:02:04 +0800 you wrote:
> According to the RISC-V calling convention register usage here[1],
> a0 is used as return value register, so rename it to make it consistent
> with the spec.
> 
> [1] section 18.2, table 18.2
> https://riscv.org/wp-content/uploads/2015/01/riscv-calling.pdf
> 
> [...]

Here is the summary with links:
  - riscv, libbpf: use a0 for RC register
    https://git.kernel.org/bpf/bpf-next/c/935dc35c7531

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
