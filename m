Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF336C87FCF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nK73rETQN/JH46RK94+nrZfxXGgwVyP0X+P5u6WzXRk=; b=KV1cvG7Cr9umwj
	8tikCgTP2fw1mYTO2mLQXQ7sBKVmGRDZ12en40v1URu2KGl/QGIwhyLn5YaZSLDLnZi59sQEStvVs
	4DycJHAQ4whNb+Ikm6vpa9QD32qWY5J+xFQIj4mO+0Bz4QP7NPMvDuynX+CFNqGHjeyDSryDkCuHL
	GpbDH2zX9Qz4yKKw4OQGdda3bZ7i1aeBlzf3rS7SozYLVZp/egiapbw90HqHGVBCgiQ5A2y9te9Jo
	w6cHiThR9Bo2VQxU7q9yYAY0LlGfkEc7TJtiMIv1ookAlRvZGWf5OtBLcnogqErgSsq9TZv2XfKaH
	sHw3hotEQbor+k95wmwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDci-000000062Ve-3FxZ;
	Sun, 10 Aug 2025 21:30:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDL2-00000005zeG-2j0o;
	Sun, 10 Aug 2025 21:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF740A568DD;
	Sun, 10 Aug 2025 21:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0B3C4CEF1;
	Sun, 10 Aug 2025 21:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860339;
	bh=5yjMJ5pYAU7roQm0SoETZ1MID+Ix01DRdk2i+IefPp4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p8+vBwuHbPOX3zWA5AdVdow0dXcpX5lWYUZFlKh7zH9B128VrbY+ROT0gFzs5QfXx
	 BV0kQURmNwLVseCIgn2iBj9UYh1II/3xL9CVa8qHV6XFFLaJYw5n3+2A2kdY5ZY89c
	 wz6jgq5LjTcLQHEauf7gbm7pOgnd2j3+L6OkZ78x1JL9q4wXwanUFQ9KS72+CTpG3D
	 N9PFtwBE40VDKi8WWiUia+dRvn28fqHhu5PrVdqmo4hVL7D4ZdeqveMFfUBes9uU89
	 1hI4AwCdP0An5a5lSs3vgBR/OhzlE02FOlwoKp85o0Ko61E5ETJDB85G2T1NE2+/A6
	 B1A+nE1puMYpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C7339D0C2B;
	Sun, 10 Aug 2025 21:12:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/22] RV: Linear temporal logic monitors for RT
 application
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486035199.1221929.9917218333770390161.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:31 +0000
References: <cover.1745390829.git.namcao@linutronix.de>
In-Reply-To: <cover.1745390829.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, gmonaco@redhat.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, pmladek@suse.com, senozhatsky@chromium.org,
 mingo@redhat.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141220_780614_1C44F6D2 
X-CRM114-Status: UNSURE (   9.19  )
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
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Wed, 23 Apr 2025 08:49:55 +0200 you wrote:
> Real-time applications may have design flaws causing them to have
> unexpected latency. For example, the applications may raise page faults, or
> may be blocked trying to take a mutex without priority inheritance.
> 
> However, while attempting to implement DA monitors for these real-time
> rules, deterministic automaton is found to be inappropriate as the
> specification language. The automaton is complicated, hard to understand,
> and error-prone.
> 
> [...]

Here is the summary with links:
  - [v4,18/22] riscv: mm: Add page fault trace points
    https://git.kernel.org/riscv/c/a37c71ca412d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
