Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C057606F6B9
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F2RZo8He;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/3BEpcj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IjuDDUSCsZLZuxIGx1tjmG7WzlVxiaVymLL/y9oxgi8=; b=F2RZo8HeMKoXo24V3ClfWW5VGV
	ojaGhO4Xg34J+pmk7KlHGNu5vn91+NAmk1VS//zor9FeZTyzvN/6Qphy9tsgjAlIBC8gEuA+X8Hnt
	CZgpMCryWogneaMboQ0M7US1yEYpEgT2blmOhzHaSDQoDDz+JcfPloUnLGZ2m7Teuh2iU5S7UO0xs
	g3yrk2Hfza9nEMelrFwc/SlTTh1vrvJgLzMZJAxGhry7YnpAXHGyG1vlzmPDhdaJtzoDhJ0XqvzpB
	xz5fxPZENvoc/H7fMEN3Pd9jdnd4ZOUiEuZEPY1E1qdDJ0zPNSAvuFuZCA4r94JTtU9/mqXCDC9ka
	NSJFhvDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrf-0000000F3FB-3LHS;
	Sun, 01 Nov 2026 22:17:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr8-0000000F1Hf-00Hi
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FBD941F9A;
	Sun,  1 Nov 2026 22:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1C81F000C1;
	Sun,  1 Nov 2026 22:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571409;
	bh=qT2GUUvMsvsdxjeGOlN5O8jOvRC8RtpY6AMZ++u4SV4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=a/3BEpcjERRS1qf1ykCRoCBxX8UxmcohB0yzmRvJnU2+gY5IhSpHZmpTJX7wZsWZx
	 zNBg6DhehxxNhO40NOIsNPit4E75mWQMiEKi0py+NsH8Q7orlj2SbdYEJ7e8BuDQ2X
	 2cB642WkEvvWfUEs8DYYeb2CIQawi2EDq+2UOAlDTFqFxZgGAqiHvAYf4efzlAoYQm
	 3fHE42xKId9UvA1/Nb2UhG2VAg4/UPvGOYqLITZc7MqlWTAvP2xk87F35Zstthi/d5
	 7Eg4txIqXtU/k2xtW1/pP9mPw1G8TyDhFGzXJd7A4EtREYqtpO6+0+2eiTXeTre+WZ
	 GbhPPxXET+0Ag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401AD38003B8;
	Sun,  1 Nov 2026 22:16:49 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: add spacemit,k1-gpu
 and spacemit,k3-gpu
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357140787.2624073.18323938412420431030.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:47 +0000
References: <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>
In-Reply-To: <20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com>
To: Baihui Liang <liangbaihui@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org, alessio.belle@imgtec.com,
 luigi.santivetti@imgtec.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dlan@kernel.org,
 imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
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
by Rob Herring (Arm) <robh@kernel.org>:

On Thu, 15 Oct 2026 15:00:48 +0800 you wrote:
> Add compatible strings for the IMG GPUs in SpacemiT K1 and K3 SoCs:
> - K1: IMG BXE-2-32 (adds a dedicated entry for a single core
>   clock and power domain).
> - K3: IMG BXM-4-64 (shares the same configuration and entry as
>   the T-Head TH1520).
> 
> Both SoCs require a single power domain provided by the APMU driver
> (currently pending mainline):
> Link: https://lore.kernel.org/all/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/
> 
> [...]

Here is the summary with links:
  - dt-bindings: gpu: img,powervr-rogue: add spacemit,k1-gpu and spacemit,k3-gpu
    https://git.kernel.org/riscv/c/16f30811a935

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
