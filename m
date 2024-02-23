Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A60AC54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 04:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7s1ran/UiN6E5n6cz+wIeicnH3oSz8wj4v42N7y8SU=; b=4kaDeoDw7jmF7V
	Lqi+D3IzlWDUXiZMqgfKadyvmBYlYj60sRmTjnkg1cEhK5W/eIPoiHDvqqlEzvJZ4vocRziQqUFGF
	+EKE32BZl3dD2UEH1rcW7Hx8QEMh+M9V7W8KGiIxLoSx1qdkdr/i9U/bIEprncA30eaX5qLF0Dh+I
	Pm/yPRcKMyii0Vp5fXkJjXAVv/RgnoisONT211Jl4Z7D50dUg38eH/7A4zh8wbVbcOR9K5F96ggrr
	GbYQhAGN5d4SYtPyCXEBwr2WxuxP4Y71y8gzuZkaan7gAOSdo+8Keb/wdGPTFSSLxPqXyhRfvN81f
	m3Gbws769uevczAMJnmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNCz-00000007r0m-3Mnf;
	Fri, 23 Feb 2024 04:31:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdNCm-00000007qvM-0WdQ
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 04:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96332633C1;
	Fri, 23 Feb 2024 04:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36CFFC433F1;
	Fri, 23 Feb 2024 04:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708662630;
	bh=Eb7VOpynyOUtYxl0w26H7zwiUMIQBQ7D7ZB2sf9JGR4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ewJTjM/7nLnnlaslG69/7L7vZlI5tHummIXJNWiRYXx3fSwerbPk7pY1NDysCjkC9
	 3fwWiYyI/juvvJPf2Gkll9cyZJuIfr5+vynmJqsVsx39N7E/3ckWjouT5GB5RF3jPp
	 /wZIOXB1xAykhWrAWEHhkDHbtMhxrPhxdyhGP/dZjifq6TsTXLvtBj6bsZ/dzF//9X
	 2WBPLx08O4LHeS5UgsmNrhCjxmbVnb5ut+P5Jv1tSaPB9DwnrUQJ41wgMvV+k15F5d
	 EuAeV4psRqO7Qtrmob67XYFtKJoLVqdkXmpYbH0Gk/mkuELS+5qNlJFigj81Bw24Ox
	 5cMzuNtWYrFIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1BFF5D990CD;
	Fri, 23 Feb 2024 04:30:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Fix build error if
 !CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170866263011.22939.3026249859816795239.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 04:30:30 +0000
References: <20240211083640.756583-1-alexghiti@rivosinc.com>
In-Reply-To: <20240211083640.756583-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_203036_873846_E00E0E78 
X-CRM114-Status: UNSURE (   8.97  )
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

On Sun, 11 Feb 2024 09:36:40 +0100 you wrote:
> The new riscv specific arch_hugetlb_migration_supported() must be
> guarded with a #ifdef CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION to avoid
> the following build error:
> 
> In file included from include/linux/hugetlb.h:851,
>                     from kernel/fork.c:52:
> >> arch/riscv/include/asm/hugetlb.h:15:42: error: static declaration of 'arch_hugetlb_migration_supported' follows non-static declaration
>       15 | #define arch_hugetlb_migration_supported arch_hugetlb_migration_supported
>          |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/hugetlb.h:916:20: note: in expansion of macro 'arch_hugetlb_migration_supported'
>      916 | static inline bool arch_hugetlb_migration_supported(struct hstate *h)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/hugetlb.h:14:6: note: previous declaration of 'arch_hugetlb_migration_supported' with type 'bool(struct hstate *)' {aka '_Bool(struct hstate *)'}
>       14 | bool arch_hugetlb_migration_supported(struct hstate *h);
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Fix build error if !CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
    https://git.kernel.org/riscv/c/fc325b1a915f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
