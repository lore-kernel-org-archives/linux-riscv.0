Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59E4C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 07:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rutYS6JSUW9R/p2zBUJlivOA6d4t1oXqF13k2PTWOBk=; b=whDRO9ZA+/fq86
	YmUUL4BjDiLSLZpW/0AMNKGw2OUj8ojR2zNorMfrE0hpYk3/6Q2qzZVI8m7VlhMlzTWZEoj6locKV
	xH04O0EG+7SYS60rV/Clv9GuoK1KPC7tXCM3xXdnEW4r9wK9Cc42AEgSi3jH+2gJDLvWQkrEI7sB9
	onFjW2d3HQIuQV5mbxptTEu3exG4dH94DiV2bxutZH5KlVrBGECFom1nXpenBD8ane7d7kU85uzJ6
	ezKXKA3h8ab/aLqNF2EBfCcoGstH644QbpbZfdPTjE0FsbOUMgioSKAAW0Rb0vSc/cSz7VV9lFXGr
	AAoz9UCFJam/WJGogYDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMjl-0000000GVj0-21ZS;
	Wed, 08 Jul 2026 07:30:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMjj-0000000GViW-3Xph
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 07:30:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BDA460008;
	Wed,  8 Jul 2026 07:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E6D1F000E9;
	Wed,  8 Jul 2026 07:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495826;
	bh=1tyzNf5I6xILPjV7LgLTzz+7wMy7t50NLyNfvgMKwLI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=n0UHQMrNIo7WGmyEmYaHuzgrbScIdWkI6pEXE5Yq6i8h4y2iyYdBvcyiu3uO3Q0Mf
	 RE30LUqNFqM57wWl61i7sU34xqcP1cy7auMYgpCGQmcMBRFNhs/My0YbbJzidVCh4r
	 zOGY/mCmlb++iAYcrPy97c/d1kLx7m7EvuGxF9QOWPGsbOhDcc13pJTLsK8Xxica89
	 j1+W/kFzarDfkoMTe42PkyscWv16e7lW2dWYVmPA799TsJZkL0ql9njBDZkAxv+Ob3
	 xP3RmTEmqgLbBcbknMOPMYc29ma4vM8JoLL1zunLsEffvy5s85L88IpqcQzAEcvnJB
	 STNUfWaSNS8VA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568CA3926257;
	Wed,  8 Jul 2026 07:30:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] selftests: riscv: Bypass libc in inactive vector ptrace
 test
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178349580614.2343578.5322024932539195819.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jul 2026 07:30:06 +0000
References: <20260707153827.175245-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260707153827.175245-1-andrew.jones@oss.qualcomm.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, tchiu@tenstorrent.com
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
by Paul Walmsley <pjw@kernel.org>:

On Tue,  7 Jul 2026 17:38:27 +0200 you wrote:
> The ptrace_v_not_enabled test expects the child to reach its ebreak
> before it has used the vector extension. That is not guaranteed when
> using fork(), because libc may run child atfork handlers before
> returning to the test code. In those cases PTRACE_GETREGSET for
> NT_RISCV_VECTOR then succeeds instead of returning ENODATA for
> inactive vector state.
> 
> [...]

Here is the summary with links:
  - selftests: riscv: Bypass libc in inactive vector ptrace test
    https://git.kernel.org/riscv/c/70b439e46eff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
