Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B827606A334
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v8WmMZSH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oa6XY8H0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9/vQPgcYp6Kxwo9uGez3SDQ2LDgpBy9hnC62rIkon2I=; b=v8WmMZSHK+saUH3XZYWekGbCgt
	RNO3fLSe06IXMOx8jRsn37gPMyr1O7HiEYQ3JRTix94oGBB3IYEkcXAMjlHzDL9WLMHq5Kcsvd0J7
	EcvQh0l1BAB5tWTjUaLvKiIeRsF0zJqinRGOWXBZUGjvvZKACDGfhlzoHsl+a9IlchJt9btwYtzsS
	2q4aStpC3bwUTFz7uJEG5MZ2WEGsoG4Y4hszitFG8qbNXscTy18oFsmoqQVwmV0gqLr5a8v4efeLE
	n3C4fQ9THpOEQv76yj5e7czMTcCWHPu0XYmV/bgNWgb1sMf2FQ3b2qJklH3EN47EQ5IINuC6kVp08
	7UcIFs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNds0-0000000F4RR-3HBw;
	Sun, 01 Nov 2026 22:17:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrW-0000000F2fo-0LgU
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:17:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20B4E60616;
	Sun,  1 Nov 2026 22:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C383C1F0093A;
	Sun,  1 Nov 2026 22:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571432;
	bh=0VUu6Q3iQ1FQir9zMfLK4+e/rrsGptg78V82yq/1WLM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oa6XY8H0fpx7lSgfUce6a2Ro+FE0x6zYQkloDozziCJBx9XCKaN+W3QH7mNiF+J83
	 QgYdtjEWChc25JoV2Rf9+TnfSBOHkPeztjTa0eR/FkoOzV3usJLSOGOZ98Wn0D6cqm
	 lFLzESsUiAwShrYfvzcMF/rBSDxVguVKBV4DStBFt3FkpxJS5VaDI+zdcFLYTJd0dO
	 Jx5XDZschGj8UaY9Yx6/l4V15Et1mcLV5uSLvR2gXkJ07E65WL5eC8MB2cjT6KnaeD
	 NX+DV9hcerAW1g31Nwg5WfylbS1b6g8bO6GuUH1fApCr2PvubIBTS+z3HiC/i0UL6u
	 2u3ewTEIT0rng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA31538003B8;
	Sun,  1 Nov 2026 22:17:12 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Remove deprecated static key API in scheduler code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357143129.2624073.6891423921734394986.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:11 +0000
References: <cover.1784538478.git.hongyan.xia@transsion.com>
In-Reply-To: <cover.1784538478.git.hongyan.xia@transsion.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: linux-riscv@lists.infradead.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, kprateek.nayak@amd.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 jiazi.li@transsion.com, linux-kernel@vger.kernel.org
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
by Peter Zijlstra <peterz@infradead.org>:

On Mon, 20 Jul 2026 09:38:02 +0000 you wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> While working on something static-key-related I noticed we still have a
> few sites calling the deprecated static key APIs. The old API with name
> static_key_true and static_key_false are also super confusing. Move all
> of them to the new API.
> 
> [...]

Here is the summary with links:
  - [2/3] sched: Convert paravirt_steal to new static key APIs
    https://git.kernel.org/riscv/c/a5576ebce920

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
