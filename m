Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FABDC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 02:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Sv48nXdoRsLTriJrJLlIov96JWAEf8+a+d0Q/ejSvc=; b=x6eweB7hqm/2O4
	VJnvO186sG78KX7VGDHm/P8Z32h6z+KcS0XiHxYJ6m8v/9BE1wW+RBfmmELSWZjAjTmXgpwWunHrZ
	YDCIYqLxg0xfpQQ2l/IrnDZrdUlSmbJJXsoqLNI2O8Z8EdNVMlA+cqvG2YwrU54KJh8J9SS57J4TG
	XeMMlz6RJ3yYsp8/Q/QhVlnCq8oadb30GIp2ebkO4/vzk5pUHQDeyeXgj9b43S/71oUiRAkUJCJw9
	8CqnkJMB3Qd3wqnZtPNvx9MZLWviz8Vvtryj1VrAgerYb8VrmdqFtj/DctC8lL0Mr3ze2e746Vhms
	i6PDDEVgGRvWbSBDcMaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCsLi-000000093nD-1F3A;
	Fri, 31 May 2024 02:50:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCsLe-000000093mk-3uG8
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 02:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37A9262A98;
	Fri, 31 May 2024 02:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D46B0C3277B;
	Fri, 31 May 2024 02:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717123829;
	bh=QDJ8YbhmGXMyUNUrXuBhbp93iWFoaOop/TTLaiT4ujg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L2UmkRY1VKj10+fBWn8mmDVwJa/VkgYi2L08LDauF08mSq5fbqxw0PZxDkbJu2X66
	 GZQK3tfftj4WJCggWnJnPDmQ55G3beoXwktsliEmMCNMqMBZ+t+S7xwZjbP7qYOvte
	 swQJIvIksQi6vqS23sPWZlZ9o2bXWHPzA01XCT0FM30+wApHo4jQ0DYODTv6lC0BC8
	 DFWS+9Kxv+sDnf6dMeRnbtw/LyyFyrBJgBVtJzTaAGs8nKVtsdDERMqzTV/8jcdP1U
	 BYhbmkuSXvn2MYxk1gvXFtSgELY2LW4ZD0OzR+nadXu2JDaVManabNOO4Cu0Hu3dCs
	 qsUjSOY7mlswA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2F19CF21F2;
	Fri, 31 May 2024 02:50:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: fix overlap of allocated page and PTR_ERR
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171712382979.22953.17135876483679871225.git-patchwork-notify@kernel.org>
Date: Fri, 31 May 2024 02:50:29 +0000
References: <20240425115201.3044202-1-namcao@linutronix.de>
In-Reply-To: <20240425115201.3044202-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 akpm@linux-foundation.org, bhe@redhat.com, samitolvanen@google.com,
 chenjiahao16@huawei.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org,
 rppt@kernel.org, bjorn@kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_195031_041745_CD4F716B 
X-CRM114-Status: UNSURE (   9.42  )
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

On Thu, 25 Apr 2024 13:52:01 +0200 you wrote:
> On riscv32, it is possible for the last page in virtual address space
> (0xfffff000) to be allocated. This page overlaps with PTR_ERR, so that
> shouldn't happen.
> 
> There is already some code to ensure memblock won't allocate the last page.
> However, buddy allocator is left unchecked.
> 
> [...]

Here is the summary with links:
  - riscv: fix overlap of allocated page and PTR_ERR
    https://git.kernel.org/riscv/c/a5e8a5b08a48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
