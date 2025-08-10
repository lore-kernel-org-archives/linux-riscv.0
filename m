Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0BFC87FCF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bejvra7FneXRySI3EVTdxP2WtQ5EMqhAG3ch671+z04=; b=DfxgVMb8aVm/gF
	mIh+RofDZ8WL8WLHXAClmkQ6WQ4fGbD883AAy7ICEUe7TPYP/k1j0C/CByBK2wnhlwVjcrom/Yjqs
	jYU6WImlpHJxVFCf1s7fqmXPWKPa4vZk9k0MKhmA8jWzwYjgyeGroDcjq1cVOsx+/4Z8YtZf6ZzJV
	NWDuA1E2eVrPIzfrmkhyBnJv3PHTAI4CwdPun1bHWeAGucd34uzTNp4bsPfFOz7bf2IaoPJoo44Un
	+COO4VtE3wjJ9zfQS+qtcQFJx11IyckxM0gaE6SKrmsRcZViIVUqTA68mID4jexPkOa5rooYZv225
	7TkT1ZLAGD6aTXHbV0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDmv-000000063RE-1jnV;
	Sun, 10 Aug 2025 21:41:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDLC-00000005zlm-2xFC
	for linux-riscv@lists.infradead.org;
	Sun, 10 Aug 2025 21:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26B9361424;
	Sun, 10 Aug 2025 21:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE96FC4CEEB;
	Sun, 10 Aug 2025 21:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860349;
	bh=XKg0OOdGfYmfRvgFY++OfMPEYLIqzmAx6qO3n65+FpA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ndoOyPc5k/u2Udft58BjOOdq7dfODMIIZLy98gwIilKxY9Ab9vUVj1GVyMP56qHoH
	 GGacwykIoGRAZpVCi/IrsJ3Xe74SonkHwe36CrDMhF1PduTKRyhYr+uTiqt0KuhmeI
	 ztOn0S+khk+h1ZNfqlbzXgrN/lHqtjzuvhOftptDizE0pTPudenDkJNG67101MVUzU
	 9TtHufTGZcvFEWZe2OVp6AGq2SFkgqG54p9sjyggL4MXeftLr1uN4C4H3+XbfPnJnw
	 L3maKn7HvkxcOZ3NCnhmqufFxzM7foxGf+heDkKXDC2Hq7SGeZ4nnQbGpEftIN4KnA
	 Vld8vIMLQfFRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDC339D0C2B;
	Sun, 10 Aug 2025 21:12:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v13 00/12] RV: Linear temporal logic monitors for RT
 application
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486036223.1221929.9747032102829878365.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:42 +0000
References: <cover.1752088709.git.namcao@linutronix.de>
In-Reply-To: <cover.1752088709.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, rostedt@goodmis.org,
 john.ogness@linutronix.de, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, gmonaco@redhat.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 pmladek@suse.com, senozhatsky@chromium.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
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

On Wed,  9 Jul 2025 21:21:11 +0200 you wrote:
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
  - [v13,08/12] riscv: mm: Add page fault trace points
    https://git.kernel.org/riscv/c/a37c71ca412d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
