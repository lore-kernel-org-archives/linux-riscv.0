Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3896DC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdO9MUHfFh05T7OQtpD/yNlFY+P+jBN/5batk01wH/w=; b=wT74WVmaeb20fD
	jWsU8MuOvJEztNJlBsJlByfJfH/NpRUuZHbmq1RwM10LDm+GZfVR1ST4avAAeU2xgDmDnOMntXVcW
	iE5wEiuJ0TPSkybJB6xxQaJLDcJeLwIEPl3AShl1PhYr8TSTxhV++EDTBC52ZMr24qqeNlUNE8wuh
	Rnh87a6lx6T4ilbiyjUQPYnXoWbAS7yDkLimK5RBecF00FlFpaHGQfrt3ruZC/Jt4SdsL4d/OUgte
	NH+8EoXj8dtNUm0CMkhRwWpI7x+tQUZlq5+RoB2wMwBlki6sm72LBgTitTxc4xyRNOx33B+uiL6se
	u3rJQRciY6ayEptSVlAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYs7-000000067aq-3AP5;
	Thu, 01 Aug 2024 16:41:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYr9-000000067Fd-3edR
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Aug 2024 16:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QKGJDfahs9Rtf4ZtNSYt2Kb+Ij1w8STgl4ewPkNfgn8=; b=c1xpMu6mKPV5V5sU0BY5YnDoGG
	dJ+7RsEX0t7VnJlVw7AQLjSTISNYDFnMXwktRakf1n20Bc1OrrQN3VHxtGFULSdE2AKrMZN+uiFlP
	eOhEop8aoou2jjYJjCu88I/OyEDtVNiqz22Ne3dq06xlzeLwDnKSZBJCAhV01jLJcIlv6yYRhxagv
	DTGdyONgsi25GhEMKVMrf9UhzXM1s5AkSyAtHJwR5KsWhp+ieCKI0DF+oYlfm/r/N+wAnAQSwiFf+
	h8VCi2owWTTyP1o22eIBvchVDKIoyrQ6JZrKaNvRNMkv+WbRZwHLpLzwV+2N/YrQme4jybUx/WyN9
	KS0XvvQA==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYr5-00000005WED-2gUU
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 16:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 84E8ECE1A49;
	Thu,  1 Aug 2024 16:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A82D6C4AF0C;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722530437;
	bh=Wg/sSVB+q4Vs3M9ZwTnV2Nl82PQDfuPe2NbknvxxqFI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XKD5nmEzDc+YShR3bTsO1yhTYLyJ9aL4ySdXODR5cxp826p5Dwlk4ZQZmZtWKF58V
	 emgzDIFOfFjP1Lkb8veVd2dBc7gKvnOyvLloe1AWVTs5J8Aah7cIEtTvWWjpcWSrIb
	 lZAeZK3nky2azSSU82wmm8KnTWmYnyEosANylhRD6M9xMx7VRvvWmzEi8kglHVAgbp
	 E6mFq65lZMvZq98mkqmbmFD5wobfPTU5NNBaQzJqz2a6CRF3ROhfvlW4d1yrVKz35O
	 2iGxTs20RZ15krsroBMsfFCtYLHZrLcoW/gIY/3NGne2BnSvgq6ZO+j0/qop8a3UyY
	 x0WhCc6ByqV6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9229EC3274E;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Re-introduce global icache flush in
 patch_text_XXX()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172253043759.13740.13799521388186985058.git-patchwork-notify@kernel.org>
Date: Thu, 01 Aug 2024 16:40:37 +0000
References: <20240730135921.156508-1-alexghiti@rivosinc.com>
In-Reply-To: <20240730135921.156508-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
 linux-kernel@vger.kernel.org, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_174044_124824_ADF09C2F 
X-CRM114-Status: UNSURE (   7.06  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 30 Jul 2024 15:59:21 +0200 you wrote:
> commit edf2d546bfd6 ("riscv: patch: Flush the icache right after
> patching to avoid illegal insns") mistakenly removed the global icache
> flush in patch_text_nosync() and patch_text_set_nosync() functions, so
> reintroduce them.
> 
> Fixes: edf2d546bfd6 ("riscv: patch: Flush the icache right after patching to avoid illegal insns")
> Reported-by: Samuel Holland <samuel.holland@sifive.com>
> Closes: https://lore.kernel.org/linux-riscv/CAHVXubh8Adb4=-vN4cSh0FrZ16TeOKJbLj4AF09QC241bRk1Jg@mail.gmail.com/T/#m800757c26f72a1d45c240cb815650430166c82ea
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Re-introduce global icache flush in patch_text_XXX()
    https://git.kernel.org/riscv/c/e298a843bcfe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
