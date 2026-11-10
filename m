Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4AE606E5ED
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 02:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R3mYXyri;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U1V1+4qT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A0OWNVvUXDH/oKb55FQ3HaQ600hykcPJwZLpz4rvTYQ=; b=R3mYXyriJmdKjxBUVmB344vb6b
	xyY+o3I5Qb66mE5OhMjKZg7xJMyxqEctCyXPMJRctYM358cekHqb6Ia6cCc8Zj73uCFGrybwiAB36
	uMFbUIjXg32ktK5a/V+vykm4kxXqCB5KXPHjgbwGZ7PH+GBukdumJdjKaPd87J3WQc37fn0fCOUhs
	bGGVqYSzgJnRbx86UGBI2/1TK6q6zkB2G2LJbkdbLaKYN78UIH5CfnAbVFlVE7wITnwLtxz0FzYNR
	0BOQGcxjj4bvcJXSOG7hUS9fl+1VpUnwsQ0RJ0dKgh+926zsi1OZFbFLsdd2fayD59XaUAMxeihjz
	B9/4nmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQc1E-00000002DJh-0zVK;
	Tue, 10 Nov 2026 02:55:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQc1D-00000002DIw-050K
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 02:55:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F12243A55;
	Tue, 10 Nov 2026 02:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBEF1F008A2;
	Tue, 10 Nov 2026 02:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279330;
	bh=ulnoR1LuZXjO1PLYVItAnFkqaQ2zWr2sGxSL2AW3noU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=U1V1+4qTzzbt1zK0XSTUpnLil+us8nYD6oyQqQTH8gZF258a68FCJ8BkJerBPcTcn
	 oo/oBqv9vIu9uCjOxkqbUoC1eKyQSxq4X6dA7GpPMxXbuGjf8EQTvY0Fud+YpazT9V
	 vQn/Ev1TfGpO8/IePLsUatt1qT23fgPARYlxETKwHPE4oESYz8Fdp7T/6IVY1aoFOu
	 WAfMEI7Z812D4TAwkS5qZHTcIujEPx85u3Mxzb0uc9peCLGfUNNaNXakTGqQ8hrCn4
	 u1kN8DthNJHvUKHzsGSHyj7DN1u/Bs7DGRtsUqfJL5xsBq+S9m1uqq3zywpFvRq+47
	 s3zmc2kw9RNUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 6311A391AFCB;
	Tue, 10 Nov 2026 02:55:30 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: signal: protect regs->status RMW from
 concurrent
 preemption
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179427932911.3612825.4959198191364939243.git-patchwork-notify@kernel.org>
Date: Tue, 10 Nov 2026 02:55:29 +0000
References: <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
In-Reply-To: <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
To: Guobin Zhang <guobin.zhang@intel.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tchiu@tenstorrent.com,
 linux-kernel@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Tue, 20 Oct 2026 19:24:25 +0800 you wrote:
> __fstate_clean() performs a non-atomic read-modify-write (RMW) on
> task_pt_regs(current)->status to clear the FS bits. This RMW is
> unprotected - it runs with preemption enabled and IRQs on during
> signal delivery (setup_rt_frame -> fstate_save) and sigreturn
> (restore_fp_state -> fstate_restore).
> 
> If a reschedule IPI or timer interrupt triggers preemption between
> the load and store of this RMW, __switch_to_vector() calls
> riscv_v_vstate_set_restore() which modifies the VS bits of the
> same regs->status. When the preempted task resumes, it stores back
> the stale value captured before preemption, overwriting the VS
> update and restoring VS=DIRTY while TIF_RISCV_V_DEFER_RESTORE
> remains set - a combination that should never occur and leads to
> vector state corruption.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: signal: protect regs->status RMW from concurrent preemption
    https://git.kernel.org/riscv/c/d1a8d411533d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
