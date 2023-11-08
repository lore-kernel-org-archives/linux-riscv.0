Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1E2C0018C
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZFvF1RsHAOSXZnja4TrseVoWg9AICGnVjEKRxNXL68=; b=lH5AWbOo9kDca8
	6V8MsM/wchpk+lYPLZZJ6BVwLFuKXmcf1NWN2ra2svDWbIIgV1OzBY39mKipjaDBSJ/f3jhC7hcFs
	QCSwiJII/O03IjhTxmSq6llQFamuz1V9+bIGcHoV4PZ+MRxZhpT6+VCT/TML0uh1eJwtQ4mfWoxJA
	8DpPV1+Gtt147kOkBL2hvpqV9TOhWKDwXcHZqbZjXSaUAle2DhHVqHKN+lvk/Fhzq9vcrrS1m1Csa
	jASh+bQfIamfc28bmG0EaxZjCVeVnDR5j/kNHAHfH9Hi1eF1s9WWlPdpHz4PsBwx0g8BQzIXRWczt
	tGXJvub8Qw1JThz2dJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0mE9-004OgE-2S;
	Wed, 08 Nov 2023 17:20:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0mE7-004OfU-0t
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 17:20:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AADE1CE0DFA;
	Wed,  8 Nov 2023 17:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D62EDC433C9;
	Wed,  8 Nov 2023 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699464024;
	bh=prYzLaZu06WtQmNg4/UT6PWTH9U6sgDBvBDcv1Ulv/8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JvZes0SyVw4VZJlD4zFojOe2NBOedMICGWUUbV7VYo4k58CokiZWkkcipReuSdsNn
	 VKlEcNHWaR+GOLRUs3gGoFR3tmk7uhJACdbJHYkKvKs17gnNNkBAhm88MjiFJzvZed
	 kF1jaHgGTAqgRHWq71DYq8Ougef2P5sR/Wcd2mi6m+Y7NkQLZDPQIoSTN9DggqhQ3z
	 PunUnQuLe+KIozqk1SvZQsioWbgX3LoVNI/hbXmNJMJhj2EGfCI2Tu3EazDtQRBI6F
	 PbYUuPW+3uwX8Wr2Q6N+Ov2TOIlyOC0uD3nakVfFff5T12qDGt09EJyAn4MXwO6IIM
	 oOuA3gSJxuLHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBA39E00086;
	Wed,  8 Nov 2023 17:20:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v2 0/2] riscv: Fix set_memory_XX() and
 set_direct_map_XX()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169946402476.8523.11934307334970092099.git-patchwork-notify@kernel.org>
Date: Wed, 08 Nov 2023 17:20:24 +0000
References: <20231108075930.7157-1-alexghiti@rivosinc.com>
In-Reply-To: <20231108075930.7157-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rppt@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_092027_483736_693A131E 
X-CRM114-Status: GOOD (  11.72  )
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

On Wed,  8 Nov 2023 08:59:28 +0100 you wrote:
> Those 2 patches fix the set_memory_XX() and set_direct_map_XX() APIs, which
> in turn fix STRICT_KERNEL_RWX and memfd_secret(). Those were broken since the
> permission changes were not applied to the linear mapping because the linear
> mapping is mapped using hugepages and walk_page_range_novma() does not split
> such mappings.
> 
> To fix that, patch 1 disables PGD mappings in the linear mapping as it is
> hard to propagate changes at this level in *all* the page tables, this has the
> downside of disabling PMD mapping for sv32 and PUD (1GB) mapping for sv39 in
> the linear mapping (for specific kernels, we could add a Kconfig to enable
> ARCH_HAS_SET_DIRECT_MAP and STRICT_KERNEL_RWX if needed, I'm pretty sure we'll
> discuss that).
> 
> [...]

Here is the summary with links:
  - [RESEND,v2,1/2] riscv: Don't use PGD entries for the linear mapping
    https://git.kernel.org/riscv/c/629db01c64ff
  - [RESEND,v2,2/2] riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings
    https://git.kernel.org/riscv/c/311cd2f6e253

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
