Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78C7C53213
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3l98Ju3P4hKyXeJA3ensgs+j1ocP2Zktt5l0naNtDY=; b=Pc/hCBrhySLAIM
	vfA6daffqt0UHtpVpfZEntL6A4NylZqGdLUA/KXl+Nv0KjxZWBoOSHp6dbQN2WNg8HwvdRsmwsLYB
	RwFPH85CRIQLHoAAteLhKWomcAWz6s5yLN1YSaxf8iXFWWza164teiTv0dV6LEZ2iCEhk70s6waXz
	CigOuQO0OenqIzYiQVT9FjQ5P2JBsRrfYkxmfEZRrvuqSqt7WhmXWNOx5UJzfxhJR8iB3BATp1cOK
	kuOnJQEGw3RXDvWVtyGfXiiIl73IJzou5qkHPHdiaCHkei7TwvFGmGgyUTk55ioZuPuqYeWvP3LyY
	34GLe90Ju/mrtLyRHtlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHr2-0000000DCfS-25lU;
	Fri, 20 Feb 2026 04:11:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqr-0000000DCQa-2Dzg;
	Fri, 20 Feb 2026 04:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC5606184F;
	Fri, 20 Feb 2026 04:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94005C116D0;
	Fri, 20 Feb 2026 04:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560648;
	bh=PDGCDysOegPLK/FytUAeu19yfLdHed/5Qq2CJVsDdvs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YQ0aOCCbuBRr/Aj8Xu6A2nQTmM3iuzSUGERzFgZbv6JdPxvdz+pC4pQ7N+j3/AeDI
	 ZR1+txPjQ18ja/OqZDa5/Nv4iP8tYkbr0J5tyqjvHLDgH87Rd2ShE1YzmIdowzD/RD
	 CsPYoHLNtIYdNoA3PjI4oImf1wHzn1ACCU1aY4WmuUFHjoSbr1VEqO81cRnWBfE1Fl
	 DtF5oGuWhKxoo/nfAA+KyC/Cal3t7yAW3TFJKawNjmzwjn3ZBgsbHgfplzpD3KNJeR
	 8FbCY63LhQSnD4N4iCdVyw9b+7gQBNb4B3wZrehtaZVPNIMqMLJEjzFqPXwYkXzjTS
	 NlPxhLiM8yB3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD393809A88;
	Fri, 20 Feb 2026 04:10:58 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/21] paravirt: cleanup and reorg
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156065679.189817.6221298327341838079.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:56 +0000
References: <20251127070844.21919-1-jgross@suse.com>
In-Reply-To: <20251127070844.21919-1-jgross@suse.com>
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
 npiggin@gmail.com, christophe.leroy@csgroup.eu, pjw@kernel.org,
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

On Thu, 27 Nov 2025 08:08:23 +0100 you wrote:
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
  - [v4,05/21] paravirt: Remove asm/paravirt_api_clock.h
    https://git.kernel.org/riscv/c/68b10fd40d49
  - [v4,06/21] sched: Move clock related paravirt code to kernel/sched
    (no matching commit)
  - [v4,10/21] riscv/paravirt: Use common code for paravirt_steal_clock()
    https://git.kernel.org/riscv/c/ee9ffcf99f07

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
