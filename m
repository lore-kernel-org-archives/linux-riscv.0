Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A7C606A326
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w6U2qRwY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B37CRQpc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PWdYc7uWdwZ5AhBkcEoNeY4u/7Wht/nl3zEeIhxRCEs=; b=w6U2qRwYIOEJZSAmpWVsFlWdIK
	L1IobZeKa5h/FKjy9QeIjkthNi3rhiEau8jpdnZ7rdjfR9LRvBy2drB+GhiYbxbAoDgNJmLkssBex
	tGyL0ZZZioV2rPpnVKQapx1nOEaGwl8flVRsFmj+xpC7CqSzMDg405hNtHReY4vTE/RIb7GK0dUwZ
	hdbp/IZ9I30aSBNRsZy/RffkM6563Wp+jW7jZrhp2ewBGi+mjwZuvGQhb/92ym65wj5bLdrMKasEc
	l104PUoPmfYU+q70ojQavgqD4eWHx/4D2SxjzLU/q9+icpRLvIj/alYTMFKPEyl24nz0txw8WgQlu
	TOE6jWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNds4-0000000F4gZ-3J9y;
	Sun, 01 Nov 2026 22:17:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrX-0000000F2l9-1sCN;
	Sun, 01 Nov 2026 22:17:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C97643EC5;
	Sun,  1 Nov 2026 22:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF4C1F0093A;
	Sun,  1 Nov 2026 22:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571434;
	bh=cjatygCmxk8XIyEbtr4pyzKJ6E60G4Tfi3euF78nVXA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=B37CRQpcdmmwCy32vZHgPCWMyUptn49raCX3hJZVcxsEUYOsqHqKCUFeSZMmdrHar
	 P973m1II/ofRE5pnWqeiZvqWMGVRqsLIUP1n1XIX0nFBkKS0IRka2D7KopquB77g6O
	 Mp/unwfBnH0l1eqg07ua7p0Vs/LC2MTS3vGGD6h6owSUEaRNT6q1AXW/x5xBnzEQnc
	 EmKj7qUuyXmc8mBTkvUCHpgFrpk8n5Uq59fpbStEBh5xRF1iBXEyBMchINku/sQN+X
	 GTmMdu6UOejRm4ya75HKvjJSDVBqFLUssCE8lSC7D/wzZYaWR0EmUh/OpuxZjzWe5k
	 ui1FC15h7AaNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 403AC38003B8;
	Sun,  1 Nov 2026 22:17:14 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND] sched: Convert paravirt_steal to new static key
 APIs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357143279.2624073.7781801497885838332.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:12 +0000
References: <20260819081207.12150-1-hongyan.xia@transsion.com>
In-Reply-To: <20260819081207.12150-1-hongyan.xia@transsion.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: linux-riscv@lists.infradead.org, jgross@suse.com, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 pbonzini@redhat.com, vkuznets@redhat.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, jiazi.li@transsion.com,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
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

On Wed, 19 Aug 2026 08:12:09 +0000 you wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> paravirt_steal_rq_enabled and paravirt_steal_enabled use raw static_key
> APIs which are now deprecated. Use the new API instead.
> 
> No functional change.
> 
> [...]

Here is the summary with links:
  - [RESEND] sched: Convert paravirt_steal to new static key APIs
    https://git.kernel.org/riscv/c/a5576ebce920

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
