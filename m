Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB49FD74965
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKVmgUW2aSzUYZ+KL6KdDFKNrjDMqmCOfqPxsVYkbjU=; b=HV8xHrC8LuiWI1
	dJVo3cK4uyCxVyV3U7UExFolVjWfTp3JqKV2sjEpR/pUIuP+lUYuU9WOaOpriw3xUn2IaXgOYlDsV
	dD/XIoE7VVc+0op2X0zNCbCUL/npZ0ivNoZm6DjSqULmUY8PWPbz0b2gJRzyWGGEx7czYmTsrIHeo
	+/JtSV3ZX6i2RICgZQGBEHYVxYaQTKpuf5PyUaeZ+8ipYunAzAMiHvCzadhujtKnur7TRjkmtsO2T
	oREnDcfQCYYiW0s8llJcT3F7QKeWgz9NdG+eq8XF7dkPsHUoBKieEpxqret4WbpdY9XfwDJOTyOMC
	0ygUuuDpyGg8wUGSvUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbt-00000009opX-0gCT;
	Fri, 19 Dec 2025 08:13:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbp-00000009ona-0MzU
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A036B4446B;
	Fri, 19 Dec 2025 08:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFBCC116D0;
	Fri, 19 Dec 2025 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131988;
	bh=d8hfIZrr4/YXPj8cN2Cj2/92hRyCmo8T5+xN5aVcRQQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=k3+Ld/gMgJdQln6OYHiKMS1MJHb7f7DcLdsqE0tNLr1lddoHDAG2kbDRMYAqOiZC0
	 ljyJ/uW1xSSjlmHEnwdR5HTtwuKGqrR4nnfjNto4oUq0/ZKPv52jdgz3sMpSwa5INl
	 w2WrclITAvmoSbYgAq9UJ50/LqzbUQTrUKzDS3SutXXJ7ulB8ZC0ShLlpfH2KVddgi
	 GLh76tDdnwFtoBFaFbN0H/CeqSn35onbRnoNNuqJAshypHMNPP9j3HzDwHVFExFWW4
	 RiJBPscY5fyO/An3piZdVOGDZCVvtVPYlWtWiSB39EfTtQNoCI5TtJbo/Butp7rBWY
	 Vt7k192nPv08g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BAFFF380AA50;
	Fri, 19 Dec 2025 08:09:58 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V15 0/6] mm: Add soft-dirty and uffd-wp support for RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613179753.3684357.9232536876700383473.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:09:57 +0000
References: <20251113072806.795029-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20251113072806.795029-1-zhangchunyan@iscas.ac.cn>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, robh@kernel.org,
 krzk+dt@kernel.org, viro@zeniv.linux.org.uk, linux-mm@kvack.org,
 peterx@redhat.com, arnd@arndb.de, david@redhat.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 axelrasmussen@google.com, yuanchu@google.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, devicetree@vger.kernel.org, conor@kernel.org,
 debug@rivosinc.com, ved@rivosinc.com, linux-fsdevel@vger.kernel.org,
 brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org,
 zhang.lyra@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001309_144374_9F94B3D0 
X-CRM114-Status: GOOD (  12.45  )
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
by Andrew Morton <akpm@linux-foundation.org>:

On Thu, 13 Nov 2025 15:28:00 +0800 you wrote:
> This patchset adds support for Svrsw60t59b [1] extension which is ratified now,
> also add soft dirty and userfaultfd write protect tracking for RISC-V.
> 
> The patches 1 and 2 add macros to allow architectures to define their own checks
> if the soft-dirty / uffd_wp PTE bits are available, in other words for RISC-V,
> the Svrsw60t59b extension is supported on which device the kernel is running.
> Also patch1-2 are removing "ifdef CONFIG_MEM_SOFT_DIRTY"
> "ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP" and
> "ifdef CONFIG_PTE_MARKER_UFFD_WP" in favor of checks which if not overridden by
> the architecture, no change in behavior is expected.
> 
> [...]

Here is the summary with links:
  - [V15,1/6] mm: softdirty: Add pgtable_supports_soft_dirty()
    (no matching commit)
  - [V15,2/6] mm: userfaultfd: Add pgtable_supports_uffd_wp()
    https://git.kernel.org/riscv/c/f59c0924d61a
  - [V15,3/6] riscv: Add RISC-V Svrsw60t59b extension support
    https://git.kernel.org/riscv/c/59f6acb4be02
  - [V15,4/6] riscv: mm: Add soft-dirty page tracking support
    https://git.kernel.org/riscv/c/2a3ebad4db63
  - [V15,5/6] riscv: mm: Add userfaultfd write-protect support
    https://git.kernel.org/riscv/c/c64da3950cf4
  - [V15,6/6] dt-bindings: riscv: Add Svrsw60t59b extension description
    https://git.kernel.org/riscv/c/519912bdaee8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
