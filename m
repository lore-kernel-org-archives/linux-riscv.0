Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B104D6074B68
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vKvsdpf2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X5GhBN9X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Y6VGd8NLrBHXGtBfB8GUchjyOG9L+duJK7q2MFA+YM=; b=vKvsdpf2sp/fk1wkCS69hAVXVu
	Pc4S2nIWO81cq6YEM00azHFcDzJ4BNH1A0GOLsP3RFxDLf9nbiJ/dCjPPA8W29XmcQxDnj589/olV
	VcnQiWgnO4VQGQuhBjx4M0+M3O2g3Kiuna+q3oV06i077N/ZGnJXd1cxDOAIeQkdspmYNRDVOoWX1
	QpaxbZq6XM0TGcVMecF1QgVy3OXC2s3cNRMBOoZCdScslI5SHJFl3CTqehNn5f+dcmDjuGBdleehg
	/SsQeI6SKqiIfsxwmO9nzx3Bj6aUc0N1VKLkINbGDFJauBeq1OsRgG/sCthol0syKa41t53V6HGUZ
	pkXXCpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrI-0000000F1uR-226o;
	Sun, 01 Nov 2026 22:17:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqu-0000000F0gh-1Egj
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 945FC6061A;
	Sun,  1 Nov 2026 22:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4847A1F00919;
	Sun,  1 Nov 2026 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571395;
	bh=ommBQgrQeMhNbDQOeLi1eUBrq5i9pecvZuHTvg+KCVA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=X5GhBN9XGEjLvDcB/bvkJIcWjHLmjFuoNl7IPxqhQ+x5K/tgHjKPHLcxnMlip4mu6
	 APdud8YmZw2K37DdQZzUqHA8yG3qY7yo7IzC6lsBz+GB7iS0QqNROv1zUGAI1PDiMm
	 WYKDtPcobc4yy4cjuqc9Wt1zCWzznJi98CPOlWLcMx6PyleaGq+ajmIBy2JLpJD2zS
	 7dSMPuQk1+QHMQfS1wCpKJw1ZfcwdpV2EXrpClw7PusP11ECRQ1CWfqJaborqShyoS
	 sZ9OCXQ/oxNq5rvkLnKFla5RZGdVR+XhgqxBsOMKwJ8x8GajPgAqSPUY/UNRedZMB+
	 qOPixWqR40iTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4026838003B8;
	Sun,  1 Nov 2026 22:16:35 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/riscv-imsic: Use GENMASK for base address masks
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357139379.2624073.2605115252327012698.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:33 +0000
References: <20260718040000.004.929c1ef2-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718040000.004.929c1ef2-caplitmus-rv@iscas.ac.cn>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 bjorn@rivosinc.com, linux-kernel@vger.kernel.org
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
by Thomas Gleixner <tglx@kernel.org>:

On Sat, 18 Jul 2026 12:34:36 +0800 you wrote:
> The IMSIC DT binding allows riscv,guest-index-bits up to 7 and
> riscv,hart-index-bits up to 15. On RV32, guest-index-bits=7 and
> hart-index-bits=13, together with the 12-bit IMSIC page offset, is a
> binding-valid layout that consumes a 32-bit low-address mask.
> 
> The parser accepts this equality case because it rejects only values
> larger than the remaining bit budget. The base address canonicalization
> then builds the low-address mask with BIT(sum) - 1. When sum is 32 on
> RV32, that expression shifts an unsigned long by its full width.
> 
> [...]

Here is the summary with links:
  - irqchip/riscv-imsic: Use GENMASK for base address masks
    https://git.kernel.org/riscv/c/bd7d57a03c4b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
