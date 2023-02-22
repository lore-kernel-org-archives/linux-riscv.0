Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02A6C636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WgPJRs2y5Ob6+4/5U5qSPvM8IQp04so642ETKfxEN8=; b=YOLDuYh7CZbY6q
	vlJggYfsZks4FOKjVYnlkTZ7IWNJEbiwZeGk/CQLBAo4RNI6qGWvY3nQjWZtfWoP6zJAisYfLgFep
	Czj9SU9+BHNee3HXHiHEE8RZarGrIx5pmlfEKA1vvSb5L9q52IIgcEDiPDcKvk1hQwC93NUT8Hs4f
	hrE8KuH+GktnT14yd1iu0oXakHFCGca70s1xFUHoEvLJ3kxxH0QZZ0ZNrAebJKemNgUDKYbJlbkvR
	0+U5DqHUXn/tO1F+Vih326EzfsoBW7eOUDawZMWlGwzCdQosvMXK1hXE2FM6AYW/Egnye4/KnfcV0
	/Wmsaqs34TaGjrr1t4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqc4-00CmUl-Qn; Wed, 22 Feb 2023 15:00:56 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbk-00CmAu-EC
	for linux-riscv@bombadil.infradead.org; Wed, 22 Feb 2023 15:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Y6KPBjRWWPp6HYv8IQOcE4yvvP7KAlwemqzzmyZ405g=; b=gyXWNTLyOdBLzeilBEW5tkFqof
	+dmZEmttN2sA4ONKP1xdf8YXSNjmHvNviZFB0KmFsnXjQ9IFWd9EkVfXAveBCwb4YNfb/3NBRTObv
	9oqP4+0LQ0pB8cVX6uezxKVmtWWChZ/wt8HLr2P/Yz9SYCeWbGTCMw+QKuWV4MKv1CefOwxBEOr31
	DRc9v9JCxWmAqxRnVvAsknrsg4k1UIIA6IB35HQ50lcStA2BlrD8122sPwNFt7QsUKDAFPkwfxk9x
	oT/uKniNmxLFB93c3li/93L9bpWkuf7zkomFEManIpYOwhWHoy1KjTbvMqCqHcOjdBwX59ebjOVlk
	zyY5ijjA==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUqbf-00CZvN-0u
	for linux-riscv@lists.infradead.org;
	Wed, 22 Feb 2023 15:00:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0E42AB815D4;
	Wed, 22 Feb 2023 15:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CCC4C4339C;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=0/hM32z/5MnMiEUWQJhkGpZLjabYOUrD9dJBCTHVHTM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uAwRy1qAVcfjITCYBE8umJfNQ1GRMlMscOEacIzUO+BxNjAOViiEc9dI9BitV0oTh
	 I2bY9m6QpIQQbdHYEvStxGO5Drxs7NWEUUVu0ZgnPWzA9loTZGMxm6Che9Pvnm71gP
	 nEUPg9RG+9G14/Q4O9+WLv9OuB4eZW+DR3LH57yWPfnoWpfqJhILmNWgBjsyZqX2Dt
	 oJrgyYr4DljW3XOC40C6Gl3sKIkTU0Zz7a3Z3YgbWtptGLQg05vEIcg3YzEqWEnDyE
	 JNpke7HdKD+PWRtN17kv1QhYlCzvYUD/3srnnsBYsuqdCee8pfGUtkMNw9X69bP74C
	 gAzfD4oSHc+aA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F261CC43157;
	Wed, 22 Feb 2023 15:00:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next V3 0/2] riscv: jump_label: Fixup & Optimization
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802198.24438.1425894131434754650.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:21 +0000
References: <20230126170607.1489141-1-guoren@kernel.org>
In-Reply-To: <20230126170607.1489141-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, mhiramat@kernel.org, conor.dooley@microchip.com,
 penberg@kernel.org, mark.rutland@arm.com, jrtc27@jrtc27.com,
 andy.chiu@sifive.com, zong.li@sifive.com, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_150032_119217_5CB8E051 
X-CRM114-Status: GOOD (  10.72  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 26 Jan 2023 12:06:05 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Patch 1 is the fixup patch should be merged into stable-tree.
> Patch 2 is a continuous optimization for jump_label patch_text
> atomicity.
> 
> Changes in V3:
>  - Correct the typo C.JAL -> C.J (Thx Jessica)
>  - Fixup compile error when CONFIG_RISCV_ISA_C=n
>  - Rebase on riscv for-next (20230127)
> 
> [...]

Here is the summary with links:
  - [-next,V3,1/2] riscv: jump_label: Fixup unaligned arch_static_branch function
    https://git.kernel.org/riscv/c/9ddfc3cd8060
  - [-next,V3,2/2] riscv: jump_label: Optimize the code size with compressed instruction
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
