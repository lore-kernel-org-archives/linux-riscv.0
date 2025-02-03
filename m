Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAFEC02194
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 21:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9ADi8Z0jpbVhpr2UuGHfFXaemrJBM0K3kZa+mOnJsc=; b=2vHKfAHGopSd4Q
	r7czQKn/eJpjFJ7TzPIbXxg9PXKVFRF9KNI6BnNwJedEuNt268+qQlqStFNGx/H0j1E3i1OqNnjOQ
	zj0CguLO3UnoRagYMmO4iPYWjQ+VoHizSg249Xj64yss9DXeEw1+ffAk5ZP49MJD00FgDmyx+Oczm
	j7aCyNCINg8M4ScvhI8cfsNwaqGQTMWHbgO8X3h0O9YgKOit4AioEu8bKTZKBBbovD8QfIwSNM8XB
	2M3RIebHSt3Yohce+cyCjoZRZr4BIm8+RmIZ1tznrdmn7A4W/giyhBp+I9znQqCmpjpCx6RqKTCH6
	3J7Grj0C9WgaJ+GMy5sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4GQ-0000000GiIR-0WoM;
	Mon, 03 Feb 2025 21:45:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1v2-0000000GQL6-1xyC
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D5505C67C5;
	Mon,  3 Feb 2025 19:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927B5C4CED2;
	Mon,  3 Feb 2025 19:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610139;
	bh=58SXSSPdlErlCwG+s7CaTtY9cSDWI83jJUTdeosf8KA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XrEUNtaOJN5MXxCswdaiqB30AI9L+r2EoBDZTUI0h0qr2kWuX7ILEFCoU2lPJ1dvX
	 Iq/PN6iF0o7dF9vciEkwQixbV994GecHSUn1ML0Id5p8aoJokk5PP72OPqDcUqAeZX
	 mDymnnSBD8T0LEhh1YnTMWfDmL2LYIjgXXOJOVm9HNfL5Q+r9T8k/zP7UOUUvOl6by
	 OLM50qa7KfZ+kcNfZAEYnTwug5/+fWWMMmCyso0K/70vK9gOY/RYsxcptspzBaZ6fu
	 DypEOim+J87Il06Vp3rqRTJ4yIr76qx9Gptl69PJ5poZCH+XFBwoVLJxfsV6wAobeP
	 vuW122wVimvAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF0B380AA67;
	Mon,  3 Feb 2025 19:16:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] iommu/riscv: Fixup compile warning
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861016650.3409359.2529057243523266807.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:16:06 +0000
References: <20250103024616.3359159-1-guoren@kernel.org>
In-Reply-To: <20250103024616.3359159-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, tjeznach@rivosinc.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, baolu.lu@linux.intel.com, zong.li@sifive.com,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111540_548648_5F1CE81C 
X-CRM114-Status: UNSURE (   7.85  )
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
by Joerg Roedel <jroedel@suse.de>:

On Thu,  2 Jan 2025 21:46:16 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> When __BITS_PER_LONG == 32, size_t is defined as unsigned int rather
> than unsigned long. Therefore, we should use size_t to avoid
> type-checking errors.
> 
> Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Tomasz Jeznach <tjeznach@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - iommu/riscv: Fixup compile warning
    https://git.kernel.org/riscv/c/10c62c38b073

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
