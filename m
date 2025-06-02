Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A31C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 22:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJHUfKqXYcSqTaJz9aNg4+d9k7XBiiKTo5njRirQQ40=; b=v13YUyNpB4AleU
	HeuKjlfup6aABeaGGU/W+mkFw3q5dl5rqXP2BfINhubH0Rh8hIBaYu+uINciYfAP8UrjvVMS3BlSf
	q4OYrF+Z8uDbr5wW7sncTku3l63BRVbXIbIPUbjBpnHpNRpJdwT2EFJ405mOzROzaB0WqptKG9kKd
	upUqh3oy3eIYMu8TorXrmM5KzI9n5yq14//FX/xFYdUCgYIG8VTqBjk5GhLYIchZdyvIRBka7gs57
	ThdT3XUYRtqZpwHpb/609j+ejp/WOxnnmXkqrWKoVrK9Mw9w4cAHh5K3m0Nye8y7w87QPEagoJD93
	vdAfBmvfBYRS+E9mbZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOJ-000000099s5-0mEF;
	Mon, 02 Jun 2025 22:12:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOG-000000099np-31AY
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Jun 2025 22:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D76cnU+9Kjsuu60yk9CLgKcn/2fNaLc8ghJlVz6zubQ=; b=Mxq/hQtAPqYEPGoz9oBwrIsqGY
	jGHlanoU2dmt8AQMO6QesMaKC7zFJ5ETmwm0PpU6kDSaSfg4LjZKETKdAT9EyL+4Xo0Oea3CKmNgR
	8fxzwsudcwbDh4t6UEBWyPxgmTWZiUvh1OCYFptZ6GaNN4okdNPF73L4juVOdyKn1kfJc8xYytHUl
	qtHDlZKHMQvgNGtJd3iYJpRl+FqZkB6Aim43K29NzDq1JpCtcbFdJyPLiVQTvys4oiVO/ZvSjTKbA
	ndqDmGVwWGA8wyS3Kofdvm4K0Ji8pAcLyF8Vt+nDVxWVLOQcH2GOYLGNwwVkYvamw2gJlqmMs9P7J
	kUMVbnyg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOD-00000000gE3-36kN
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 22:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C8375C63D7;
	Mon,  2 Jun 2025 22:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC39C4CEEB;
	Mon,  2 Jun 2025 22:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902335;
	bh=soT7jJUaFNYS9Uh3l2z7LkH2EvguZZgThBpUjJD8exw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oP3wV572UGXiy4aMjgtspjktZ/tYOpVbUYxwQYelZoa3bz0HHRfXJ6flQ+CJcsBR/
	 5aFxl3I/p8MZ/kJ3gb5GxVpYKHgpyEMTQFb+jjMGy7vwoueg1IdlZIxJC6OnE6TJP/
	 HZ4Fdc8rRsIbeW5DufRikZllHeI3uVew9sMBrvOxtY2dn+MuZj9I3b/iDLFsSIUAXT
	 ci3DGspHBXIryaPPiEYDiFMW2g8cx3PKF0KGY3MXMSwbpGzYgf9819MKAdOYb/bJ+u
	 8FPl57tFxI+NzxaoNIfdTRhVrtoaolvnKCxLMaD8hFLPBaOZMRx2LcFFcyKNWWQGCh
	 iFETEHn2imxtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF32380AAD0;
	Mon,  2 Jun 2025 22:12:48 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] perf symbols: Ignore mapping symbols on riscv
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174890236756.925497.6881050930768049358.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:47 +0000
References: <20250409025202.201046-1-haibo1.xu@intel.com>
In-Reply-To: <20250409025202.201046-1-haibo1.xu@intel.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: linux-riscv@lists.infradead.org, xiaobo55x@gmail.com,
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, stephen.s.brennan@oracle.com,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_231217_963309_F07D852B 
X-CRM114-Status: UNSURE (   7.90  )
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Wed,  9 Apr 2025 10:51:56 +0800 you wrote:
> RISCV ELF use mapping symbols with special names $x, $d to
> identify regions of RISCV code or code with different ISAs[1].
> These symbols don't identify functions, so will confuse the
> perf output.
> 
> The patch filters out these symbols at load time, similar to
> "4886f2ca perf symbols: Ignore mapping symbols on aarch64".
> 
> [...]

Here is the summary with links:
  - perf symbols: Ignore mapping symbols on riscv
    https://git.kernel.org/riscv/c/e4c39a45a0ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
