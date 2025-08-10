Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1930C87FDA
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 22:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vcq2EHoCuZmrgEfccRbR5W6yN7g29Rus8yt03Buu7lE=; b=XepFho3yfTHw5N
	kXuHslJRYJCavmN9Sy8ymArO3fX4lUrtrMWhOnGENLa8PIAH8lMhPS6HRO2LSz/SAwPiljOAqLc8r
	hPn6ta3JLFErUI+wk7XhMxebb9NJh1dRZEXuCuvvcSEe5NoT7Mpy2O05bzkPW9xiBDYMKouGbXe5I
	rkeeu4YhfKHmzTNNnQkJ3cgk4rLLYffUH5xIhzWWYg2IYRLeDN2tiDBV7VEhKGVEdA6DrCB8/vyBd
	OurtF7dOa7bAmfdX1LDmofWmunVvALSCnAV7tDV4hCP1fVLYyccrEU9ysLOz9o/gDISAo730RGuLe
	AlxHRLkZ4W+QjORn1g5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEYR-000000066xh-3Ffd;
	Sun, 10 Aug 2025 22:30:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDL1-00000005zd6-0vJD;
	Sun, 10 Aug 2025 21:12:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 714B7A54008;
	Sun, 10 Aug 2025 21:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3FCC4CEEB;
	Sun, 10 Aug 2025 21:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860338;
	bh=+4dnmCmzsqfJqzogK3BsIrwmBCpep0C6Bjw/+YBBuRM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jwlDPXEycbVxBriw0lhEvzExieU29/OWPjrCEOUv2WqxJVCo7k8qLQNd/23hKV6Id
	 kiLaOV4YOtJcGgxElQjSaCgtWjuxF1TZo4tREA179TeZXdS3lvUfSUPodCgRW5+oXI
	 BCFW1ZUGDUOY0dS0F6zuygKhlBAKehYFNuxADUZB/wNi3lRPG0mDkehuTAMO5r9Gc8
	 37hr0J36RdpHnefSpObuD3L+Tlh1Fkezo6HnNDheo5ggM1beQv0n1jA1HqFn7bWV3N
	 Kt0hHbfjy0QEiUyYkW8gtXP6ZDCpEIB8+gtBCrPbjCcJ7HLqTMTALoRVNr67Pgkjiz
	 1vu91j4EtReHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF1939D0C2B;
	Sun, 10 Aug 2025 21:12:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/22] RV: Linear temporal logic monitors for RT
 application
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486035074.1221929.14771271313243309912.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:30 +0000
References: <cover.1744785335.git.namcao@linutronix.de>
In-Reply-To: <cover.1744785335.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org, gmonaco@redhat.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, pmladek@suse.com, senozhatsky@chromium.org,
 mingo@redhat.com, boqun.feng@gmail.com, longman@redhat.com,
 tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, peterz@infradead.org,
 catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141219_331961_B13DE6A9 
X-CRM114-Status: UNSURE (   9.05  )
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

On Wed, 16 Apr 2025 08:51:06 +0200 you wrote:
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
  - [v3,18/22] riscv: mm: Add page fault trace points
    https://git.kernel.org/riscv/c/a37c71ca412d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
