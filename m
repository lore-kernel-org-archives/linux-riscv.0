Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E68C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJBbhTOTjP54rFPN3tvmhIb9/K8z9ICcnHoPZNyi934=; b=lxDN/PSVOEBtMe
	weMWMuugIIMkcyewkuKP4WsgmPfHRtfbvoGJZZibFn9nF6UIJJE+3vOEzoIM92oA8v2jV7oRsGVNC
	UdRbHuDArVlVa62asTA+w6nxyXka5bRzpcp9oXN+pDAjY6J8/BukxliHaHp614Sr8ZgcByayJzxk0
	cc3bqjDQ2yY3mu15k6ZOaGgKSGu9ZbD36yT/2SuZLp06QLW/VqRLjPG843ECX4u8jRKl2ZKlKtvWt
	TXSeJ5kWxRQQTOOZWw3/+E86Is5MHtDymDQPizYi4+O1n6gUXCkpOpi7Snei6NbhRludfnkAAWQF/
	jVnjNVd0lgwiYW5NvwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtH1-0000000BIQr-49W7;
	Thu, 27 Jun 2024 17:51:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtGt-0000000BIJB-3Te4
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 17:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7837ACE33A0;
	Thu, 27 Jun 2024 17:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A80CC4AF0E;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719510656;
	bh=IuoqwMEEfuW08SxSHhqWl1UrUywBAnZMyB8ms2RBmAM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JDglNNhZRPah2c7TvQOBVL17WWNRFWhiZS5NU3S/sk/24buJgMsxilpQ40dft3G3C
	 a+8CMV9xRTuKk05KmeQOroY7s2tM+aCQ7lxQPndzIb3owp0knl0/CNBjcUiE7S4/d8
	 Ry2O7OBmqF2CmskPpVRaGZz18Lij/Iiy1glkvoLZTNm8eKKU71m+5FtzJ+PPxS7CxM
	 +mF6SmchXTjZMIwWuPLV57KMVuBiGMR8OYNHIdZdEy1IQPPzH35AAO1AGl1yqP7bgb
	 0/ILf4OBdWLoAv6fQybj1S1lsI6vN8ptz8y2AJh1GFmv+Xqll51S/ltstqdAECSyrX
	 p/DZr/CtFYUlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 73AB6C433E9;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Implement pte_accessible()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171951065646.6762.11396758328508305883.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 17:50:56 +0000
References: <20240128115953.25085-1-alexghiti@rivosinc.com>
In-Reply-To: <20240128115953.25085-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_105100_155952_2DC76A96 
X-CRM114-Status: UNSURE (   8.11  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 28 Jan 2024 12:59:53 +0100 you wrote:
> Like other architectures, a pte is accessible if it is present or if
> there is a pending tlb flush and the pte is protnone (which could be the
> case when a pte is downgraded to protnone before a flush tlb is
> executed).
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - riscv: Implement pte_accessible()
    https://git.kernel.org/riscv/c/50b5bae5be1b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
