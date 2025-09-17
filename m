Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9109CAC5A0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 02:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFH9fZbtRCzQLKE8Uy0Pw2owRYW31wttbXndh6TPElg=; b=U+XW3i65GgojE6
	iqyffNcUXbg17DrTCkm18F1NeB75rySM4vwqcoO7nOa2ATQ9jkDf6eTzGYaTruxyrBltz6WBnr1Cg
	FGOR/eUbvqTmdy/B1JGFRhMk+UxlBK8/WQyzjUxzttXcJ2+1EkyytCohvd1prfLS2mJifR3TTji1A
	1bPoOgN0Qf5JtWc6LOtqe3+lmPWP57Lbg2KMUM4gQqD3r7CoYg76BKJoTwfrx6/L4Wwoix3h06hyc
	xvbvDEy6R9wdd2ooZI5evS7Gz1LJa4gRQodqgeNg268gVWelm+HdSvzLpo0DYtISZVk70jLAj9A/I
	ikgQVaHXAV8JVzV8Bz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyi5l-00000009zQu-1rSe;
	Wed, 17 Sep 2025 02:40:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyi5e-00000009zOd-2aNW
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 02:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF17144CFA;
	Wed, 17 Sep 2025 02:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA03AC4CEFA;
	Wed, 17 Sep 2025 02:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758076813;
	bh=+jZ7a6Pk13YHDpGs8wTheZPKmacywLo2rDy2h3k/AKs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Fesirg5kgQLTK51Yra+Cs7NyC4D0uT6CrsK2yI1aFs99mBAetN1RNUSRz2Vh1O1Xg
	 1XTCrL+eW4m6kZadXl8URTjEv8qLKY/K59bmyrcszP6EG5nmV2HMd5/2kxFO/m34Ye
	 A6TslhzP3g15MnaJhn7JpS7uYMy+qFiefQg0x8TrlLNihdDa6RvmaVxWnOxvBE6Ctl
	 moNrptV9UuZR1t81oQGI0yClpznpt0hxF4vAKlh6j0UFN1vBZLs6kPkN3Ys1/kJ5UV
	 SfODSPnYgi42iMUPcuscS8hAxZaU1QIXpAUbxCf61hB9VgYbXTrnUna1PKyVl7NuiT
	 cZYP2sc3R/ZhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB6BA39D0C1A;
	Wed, 17 Sep 2025 02:40:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv, bpf: fix reads of thread_info.cpu
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175807681449.1444719.15338254509817798982.git-patchwork-notify@kernel.org>
Date: Wed, 17 Sep 2025 02:40:14 +0000
References: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
In-Reply-To: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
To: =?utf-8?b?UmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, memxor@gmail.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_194014_677430_7B8AAF22 
X-CRM114-Status: GOOD (  11.51  )
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
by Paul Walmsley <pjw@kernel.org>:

On Tue, 12 Aug 2025 11:02:54 +0200 you wrote:
> Hello,
> 
> These patches are related to a recently queued series [1] that fixes the
> same bugs in normal code.  That series finishes with a patch that would
> have exposed the BPF bugs, but luckily it won't get merged until v6.18.
> 
> I don't know enough about BPF to verify that it emits the correct code
> now, so any pointers are welcome.
> 
> [...]

Here is the summary with links:
  - [1/2] riscv, bpf: use lw when reading int cpu in BPF_MOV64_PERCPU_REG
    https://git.kernel.org/riscv/c/ad5348c76591
  - [2/2] riscv, bpf: use lw when reading int cpu in bpf_get_smp_processor_id
    https://git.kernel.org/riscv/c/8a16586fa7b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
