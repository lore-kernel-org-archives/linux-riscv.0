Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B9F606B054
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NC59w9e8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKoBexQh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=96CyJG+pjJPy2Y5hQBCWpmxdrdSmoQ6Yi+Ji8/fJErE=; b=NC59w9e8aaI8+HYfF0X6LiHjVC
	Wl81jp8HGrW/GFzX0xje+SdEAp6nXlceKcPNkMynh9rLiOam/Gn2F0TJHvo6Z7Y1lHmgrf+4Pv407
	H191PsOc6kIWQvvIHPh6Y6cTMfiJ3Ra3vHyHN8fOzUg4xyrbiuZCeOxcY/BZkRfyTbTeNZK5TgaOH
	UrThLDUOxCZphsVhZ3zIENn5E0nHOHwpvg/Jkj91Ur+78ovueoDKE7sZD3wRfcRFaHNMB2sPFDE3R
	JfwUGhMDOcjLpyFIiYChoBPQG0F92ECGvL/ApAZHZ5YGTUl8OGaRkmt/oitAH7dR81VpY/oz6J4MZ
	5EOXdfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqZ-0000000Ezjx-3idc;
	Sun, 01 Nov 2026 22:16:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqF-0000000Eyxo-28sR;
	Sun, 01 Nov 2026 22:15:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6BAE601FF;
	Sun,  1 Nov 2026 22:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D121F00A02;
	Sun,  1 Nov 2026 22:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571354;
	bh=NtvSLxCeAfOoCPUcLXijhf4eopOStWrRuZXjlGTbL0Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZKoBexQhRXRdf4UMV5kLb9mnk7bxuTeU9/aOxjsdVCuZzJfHLn+5n4iKhY/oUvoLp
	 JVlIk4OSC46FGW/cqROShhBfR0LCiGtieNG3r2bP4+vQJKQQN6avAsI3VexTFYEc6H
	 HeqNJOYNac6pTBjs08uHalbq9/cCo6b4M6EJbRyY8db+P5Yb+nJ89MfGrKvDO/DvqA
	 EWV32KMLhX7VyAZUZh9xWUqV88A96fOJFPJbNBsWYVqdUjgIvMvML58c4FLKcoe6ME
	 onFhhkTXSYOw8AndRXgJz1clc6dTs2kPPNm3il6xlWAexBttRJ6fQAlrv66HQgZ0KI
	 /vAjPn1nOn1zQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D3C738003B8;
	Sun,  1 Nov 2026 22:15:54 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357135307.2624073.4721839203390727689.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:53 +0000
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
In-Reply-To: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
To: Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: linux-riscv@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org,
 mark.rutland@arm.com, chenhuacai@kernel.org, kernel@xen0n.name,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ltao@redhat.com,
 prudo@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 kexec@lists.infradead.org
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
by Mike Rapoport (Microsoft) <rppt@kernel.org>:

On Thu, 13 Aug 2026 12:36:29 +0530 you wrote:
> Several kexec_file_load() image probe functions return -EINVAL when
> they do not recognize the image format.  A probe function that rejects
> an image should return -ENOEXEC to indicate that the image is not a
> recognized executable format.  -EINVAL implies a problem with the
> syscall parameters, not with image recognition.
> 
> kexec_image_probe_default() iterates through registered loaders and
> returns the last probe's error code to the caller.  That error
> propagates as the kexec_file_load() return value to userspace.
> Returning -EINVAL from a probe when no loader matches is semantically
> incorrect and misleads userspace about the nature of the failure.
> 
> [...]

Here is the summary with links:
  - kexec: return -ENOEXEC from image probe functions on mismatch
    https://git.kernel.org/riscv/c/2792b4b15f14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
