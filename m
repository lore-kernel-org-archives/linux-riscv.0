Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AED606A6C0
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x4bTzAcJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jCn3d1g2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iVFtOkAv4mQAN5EZAEsZph+noUlsBQvRstumonJinO8=; b=x4bTzAcJICSso32K4yHkU4d+we
	4lXvboay8k8r0zDQ63EHkXgmLidRTh2W3MaCGIKKB/ep7TuztMeaRvAwZHGZT277IZoTIU0kFVfoH
	onKKS7sEZXncgEOezNZNLHMN1FO8ECy+7cxxpL3GUYPtl5QmQXl/a4yHl7UYfymLXX9j3lM07gCmm
	C2jJSjh3lQqYE9hdqM0Ii1wN+bmykrGoruMi5iu8fXjb6PEQ3hJWaDy1XTMgTpPFOiYlppNBRTQJK
	OQz13TojyUPGXPYP5bUMB3GHa6MuQJdt6AbVSZRN64T7PE7oSkscazz1UwDuhkf2E7fdhnyjVdVlY
	PAaYPfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrm-0000000F3cl-0j18;
	Sun, 01 Nov 2026 22:17:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrG-0000000F1lV-1Ekb
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2B31406A3;
	Sun,  1 Nov 2026 22:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37F11F00A15;
	Sun,  1 Nov 2026 22:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571417;
	bh=K186/SGzGYR4oS1A94dDqqxVbN9s1DtPD9OQEKcxCLA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jCn3d1g2f7/1bmyBtViIODuRmCAq9BrODdhxoYZ5fA8VACNdgm7F7V8lBKmjf++ez
	 YGPKyeDDwmid3J94+0qTNhqSIFehaMhwELfnytjR8yY2SM/8GY+NHgRQElqs4XosEP
	 /6Hv2ozhKB91YzcVczxhREluOmfrzDWM1W1OffsGr/kqA52k6B2ndkBmJT3Wnw3YOh
	 hI7HNfui/yXGlmMwMD92yuxaNLeJD4GQVn6oxVPJLe3R8naLM2KKyI43g8ZKpzdIVU
	 Oki80VuJIXAXRF69NG9x2b1r+OFzhhBAsYMcnLpOB3i+cuJMzXmiswQPov5bIs2l7k
	 gy5JdTi8LAStw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA2A138003B8;
	Sun,  1 Nov 2026 22:16:57 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mailbox: Use named initializers for acpi_device_id
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357141638.2624073.5068532854637538801.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:56 +0000
References: <20261015-acpi-mailbox-v1-1-152ba71454ff@thegoodpenguin.co.uk>
In-Reply-To: <20261015-acpi-mailbox-v1-1-152ba71454ff@thegoodpenguin.co.uk>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: linux-riscv@lists.infradead.org, jassisinghbrar@gmail.com,
 rahul@summations.net, anup@brainfault.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
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
by Jassi Brar <jassisinghbrar@gmail.com>:

On Thu, 15 Oct 2026 13:58:28 +0100 you wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> [...]

Here is the summary with links:
  - mailbox: Use named initializers for acpi_device_id
    https://git.kernel.org/riscv/c/01a40ad5a968

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
