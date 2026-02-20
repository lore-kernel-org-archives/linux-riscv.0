Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8BDC531F2
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jF3swBN8OhkKS++q5vjRM7rMMUWniCbdZkBZi2MTteg=; b=kzbaCge4inieOz
	ns7oxSpmvEVj7PUdgX8skKiRhHPbKIg4L3yN5+3I4tE/9/ap3NvrX5fOCCAeAN1gzjPRgwe8j1vK2
	Zcl6H3X4R5Sllsd7rWfTNRkGRKrfvw+GaW2l7iha/SMfG/dfYkb1hpNpwx+KrLYEGO3ugtBNjjKKL
	OlADdj7q+zXHhNzvE46zJRdhGibjOQ9JAIYYPe0PDUs0e7hsf6+7nBC4zKbgV7mRPaJYpYiHztcqK
	avjBFJb9+cPosnAQIRWKKjvDAJi4RQIlxZ+qs5Cs2hBeSppBgmhxqKROREaZ62GCfQhW5c9XXo4tY
	0tRQwFhnJ91aPLzm7C3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqx-0000000DCZx-3Bce;
	Fri, 20 Feb 2026 04:10:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqo-0000000DCPG-2VkE;
	Fri, 20 Feb 2026 04:10:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D31A36185F;
	Fri, 20 Feb 2026 04:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983BCC2BC86;
	Fri, 20 Feb 2026 04:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560645;
	bh=Db/wdfVcXsniMHB7ine8YIWTDXSl11tG9gQ8k5IjjLI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kr71DRurREHYrZUr3Iu8kBF3sP8Kd84HBgPzOFQul6k/zdt4cn+xGkSwn0Z2bqTfV
	 tf5GWnU3xbuMF1mRY2zfCfhwSJ3szrnd4MwQID7TlG/ObeeVfWOZaUAUN9KDzPtFXq
	 uy1Y74jNH9hfglIFadwb8ipRoBqsN6Uzgj+8SQxzFAonkiWY1FDYL7wgISg0RrCqCf
	 Ea0jKMmyz8PSk9M1AEvK0cx4T9JGn1EjDLxRkWlV1jl+wC4Rkuzikre+XGx59kvCUa
	 0nl4J1xMm2mAntv2sFs93qKoael3Itii9ExFq0zMW3WuUeG439WsT4vH4KO58AiK6B
	 bv8XfesBgFH7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD8A3809A88;
	Fri, 20 Feb 2026 04:10:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/21] paravirt: cleanup and reorg
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156065379.189817.4828097381020781784.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:53 +0000
References: <20250917145220.31064-1-jgross@suse.com>
In-Reply-To: <20250917145220.31064-1-jgross@suse.com>
To: =?utf-8?b?SsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, luto@kernel.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 peterz@infradead.org, will@kernel.org, boqun.feng@gmail.com,
 longman@redhat.com, jikos@kernel.org, jpoimboe@kernel.org,
 pawan.kumar.gupta@linux.intel.com, boris.ostrovsky@oracle.com,
 xen-devel@lists.xenproject.org, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 linux@armlinux.org.uk, catalin.marinas@arm.com, chenhuacai@kernel.org,
 kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, linux-arm-kernel@lists.infradead.org,
 pbonzini@redhat.com, vkuznets@redhat.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, daniel.lezcano@linaro.org, oleg@redhat.com
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

This series was applied to riscv/linux.git (fixes)
by Borislav Petkov (AMD) <bp@alien8.de>:

On Wed, 17 Sep 2025 16:51:59 +0200 you wrote:
> Some cleanups and reorg of paravirt code and headers:
> 
> - The first 2 patches should be not controversial at all, as they
>   remove just some no longer needed #include and struct forward
>   declarations.
> 
> - The 3rd patch is removing CONFIG_PARAVIRT_DEBUG, which IMO has
>   no real value, as it just changes a crash to a BUG() (the stack
>   trace will basically be the same). As the maintainer of the main
>   paravirt user (Xen) I have never seen this crash/BUG() to happen.
> 
> [...]

Here is the summary with links:
  - [v2,05/21] paravirt: Remove asm/paravirt_api_clock.h
    https://git.kernel.org/riscv/c/68b10fd40d49
  - [v2,06/21] sched: Move clock related paravirt code to kernel/sched
    (no matching commit)
  - [v2,10/21] riscv/paravirt: Use common code for paravirt_steal_clock()
    https://git.kernel.org/riscv/c/ee9ffcf99f07

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
