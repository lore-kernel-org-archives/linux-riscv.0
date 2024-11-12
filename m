Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860FED597B4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 22:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDrKfv93BixUK6VekxGqp8WQVHwqytnf77Fbqy31WeM=; b=HY8h3wHo2QSCZw
	QuGyGt+mfpe0VMB84wnMsn3lBFAriC6pzRUXFXQqcCLCSslq7LzrSTSUtauR9YTGujnGYNWURiDKP
	W+iMgIAXmvOmd/IlbzOoYrs+3y5RtOcGNawJx6AS8UsnB58NXAa43QNK0VE15Ns7DlgNDqF9EldQE
	hFGY49Kqow8MHCYdvMYC1Bdyam7vAdAsQicaESg/eHfk2seGyIO4iLHYb2duMzILt0up2aOSzbtPX
	usxSFbV/V2zvJHuoF0/gEIO9BxapUzOzSzRsupCldlCw6/kK032Z7A05iuDcbaBrwzt5ILV6rP5VU
	+2sFs8zc2/JwlIQZfauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzmg-00000005COI-136X;
	Tue, 12 Nov 2024 22:54:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzkq-00000005C6C-3dhv;
	Tue, 12 Nov 2024 22:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73804A4180A;
	Tue, 12 Nov 2024 22:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD5BC4CECD;
	Tue, 12 Nov 2024 22:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731451979;
	bh=sYaUEV3H1VTX7CowzyJ4T2l9DFFG2LL8+sAb7eAQO/w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qs2uub72yqFPNWjy5n3myGlvtouRTlXqnBl/a/WEGH1HUgjIqViDXTVkezWkDXZ4z
	 zLKkZxzq4rSER3qmT+NhX3wc+ECWK7esjBR2SmF0MIOgebXauGfrcktPhHS9xFMF4g
	 MzdYdg5WeUURgIf/blV8rJOtmHY8Sh/ggQ11ftCVHhuPrwJjFZ6BZOw0gSMOc+YQCi
	 tBMmZDlU/lp+Xl7upsI0GBy0lTuBZHB8/CGBx6bihhluTN0lPOFpyLJ0vy3eeHGCNQ
	 cdUHkDMoRBCGB4+dORhZ8nvfWyLyAfObI/oWOOnIkNPTex54x5mD9+YRRAl1w4qHeL
	 i07OSYdlUQtAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE153809A80;
	Tue, 12 Nov 2024 22:53:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] drivers: perf: Fix wrong put_cpu() placement
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173145198951.701548.549721495064478963.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:53:09 +0000
References: <20241112113422.617954-1-alexghiti@rivosinc.com>
In-Reply-To: <20241112113422.617954-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, will@kernel.org, mark.rutland@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_145301_010932_97709ED3 
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 12 Nov 2024 12:34:22 +0100 you wrote:
> Unfortunately, the wrong patch version was merged which places the
> put_cpu() after enabling a static key, which is not safe as pointed by
> Will [1], so move put_cpu() before to avoid this.
> 
> Fixes: 2840dadf0dde ("drivers: perf: Fix smp_processor_id() use in preemptible code")
> Reported-by: Atish Patra <atishp@rivosinc.com>
> Link: https://lore.kernel.org/all/20240827125335.GD4772@willie-the-truck/ [1]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [-fixes] drivers: perf: Fix wrong put_cpu() placement
    https://git.kernel.org/riscv/c/57f7c7dc78cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
