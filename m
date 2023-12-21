Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC76C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 03:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=100Y/a93vUngwGXStU4nH7hpykglsXLmAEsPiC+MCL4=; b=i4JGPKSwlTZ1Hh
	MmE8vT1X18FEhYC7DwcM3IgzozloDfXui98Kwo04nepzD7VCGDLYDB+DrjuDoGWPsby1Qo0JXN83+
	nY45gVTZsy0Bk4ygnWHwDlO6KuAwkyDIPMtUBuXPLop9qpk40c6ohvdB1GW+nQ/Aep+vDj0PeBcbP
	lFPM25gC6QjBLnvQ1RlDA2yVdzat6SDWm1OHC0pjNQcQwvIQpAMG1mFRac1oWSUVE3gHThJdbPyGB
	yYOcBG96vnIfTioeeZwJtsCC6HqnZxUIQJ7mZ8Da6gTd/KGzTuJzhIr46gpPHcfvhl6HX0Kd6fGC9
	jqvTQWhJDcYqop6c1jpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG9IV-001XV2-1b;
	Thu, 21 Dec 2023 03:00:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG9IT-001XUC-0M
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 03:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 258E8CE1E7D;
	Thu, 21 Dec 2023 03:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6582FC433C9;
	Thu, 21 Dec 2023 03:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703127624;
	bh=DlB1PsE5QvFJiR3jLnenmYmuaHLaOGUOCHYp8CiFS6E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lt9OOwBlmb6xtJ8woQBRH3zDl5C/1DAxRLGUgpfp2e4sxK1tlaZ8zwTD+8EDf46Tp
	 YZRuXwDvg7+KylexDwGlDPeBWaTwAngOuoj7It/n2HMwInWmTHUXlmqI+OGQGOsOlY
	 ARipeoBwTQ+85PkUfU2eBQqUFKWuced1HcI5vZ5ZFoCECdX60kOpO7Ju1cBNK3dvuC
	 uyEB/vKskMMOEMsGC2jzpOmpwWd5f8PofK64t34yAz5Z+cOqwTAyAzckzsFkcCI3wo
	 84bQ6Lmd6x2zZc7zeiegn4487IrBj8Wlg4OMaZPeRWlBki9Eu/UQI7uiyQQJkBeuio
	 3dCr2XsR2+sZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4E284C561EE;
	Thu, 21 Dec 2023 03:00:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes 0/2] Fix WX mappings in the linear mapping after module
 unloading
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170312762431.27922.8717451486214293003.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 03:00:24 +0000
References: <20231213134027.155327-1-alexghiti@rivosinc.com>
In-Reply-To: <20231213134027.155327-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, vincent.chen@sifive.com,
 zong.li@sifive.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_190029_399557_37DE2A1A 
X-CRM114-Status: UNSURE (   8.80  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 13 Dec 2023 14:40:25 +0100 you wrote:
> I fell onto a bunch of WX mappings in the linear mapping after a module
> gets unloaded, this is because our module_alloc() does not set the
> VM_FLUSH_RESET_PERMS flag (patch 1) and that
> set_direct_map_default_noflush() must clean the X bit (patch 2).
> 
> Note that the Fixes tags are correct but patch 2 will fail to apply
> since a change in this function just landed in 6.7.
> 
> [...]

Here is the summary with links:
  - [-fixes,1/2] riscv: Fix module_alloc() that did not reset the linear mapping permissions
    https://git.kernel.org/riscv/c/2f748fa7b60a
  - [-fixes,2/2] riscv: Fix set_direct_map_default_noflush() to reset _PAGE_EXEC
    https://git.kernel.org/riscv/c/3b5c14361d61

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
