Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E0FD74961
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0527nHLhDiIafDoPzA0g3hj5yY5ZOvJ3LQRj1JHkDE0=; b=PQKhlMbm2jMIy9
	Wjih+Z8ST2AjpNzm74qYr4xRi0IFsWmnmDagsM14CbCXNalyGsEVGYu7dHvdco2UVHnWZcSWB8L0Q
	IKNotaE6Ny/Ay0E5Rm1xbCn412UJOr6ZjTBtxh2S9FKMkWTnxa1pNwol22lMLLx1bYiOyXrxcc3sK
	de5iHH68/a8Vo/Jw5kaFRfAlbeNi0gquU7BlH+YHB5/8fyC7JUMWpEBRIvoyAlzZOK4H554MbHc2y
	2L0YNq/HbrYQfzIigF2cXIT5VHhY6KL7N1KWn2G250Dq+yXuL++AHjyso4aG8/Bi4fcIfqFfTr4t3
	qOTMInhZcKT4gZDveViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbq-00000009ooi-3XLI;
	Fri, 19 Dec 2025 08:13:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbo-00000009on6-0SAi
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:13:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D80743F28;
	Fri, 19 Dec 2025 08:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4893CC4CEF1;
	Fri, 19 Dec 2025 08:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131987;
	bh=Da1igU9nJRPnZ5L4W+6oiwIrxZfJDMP73Owv2lIqQYo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Xo2kx7m/wag5DqzcA3vxDHxKhWOgdPOuJESlc1/0Bw4zijQRvGwcYF8sgefqxVOUH
	 Zw7Jq6c5KKya3qz84l3oCzhyv+f3Hl5QN6IR/gQco94/zBQsFWJdUZMRarmcE3Ll17
	 OQ7tjezH9QvsQp+tDWb38i+rSMT0jcobYPSBIFuOov4nLe+6ZCUeTdTun+6WS/hhTx
	 W5N1PVgKEmBDep/c+MpJ7ASaed7AYRm9hypU4jHMnojPqCCBuQmDlX2Msq21NunqfC
	 TPT3nmO8DeMmdKSb9GRyluaIuOy7isHD9uVzuPGv9qibqFkmE44JdEtsdo/sYFbVcX
	 QY19z9sJx1rpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78C73380AA50;
	Fri, 19 Dec 2025 08:09:57 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V14 0/6] riscv: mm: Add soft-dirty and uffd-wp support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613179607.3684357.9882444672528861382.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:09:56 +0000
References: <20250918083731.1820327-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20250918083731.1820327-1-zhangchunyan@iscas.ac.cn>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
 conor@kernel.org, debug@rivosinc.com, ved@rivosinc.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
 akpm@linux-foundation.org, peterx@redhat.com, arnd@arndb.de,
 david@redhat.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 axelrasmussen@google.com, yuanchu@google.com, zhang.lyra@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001308_164689_8CBADB51 
X-CRM114-Status: GOOD (  12.82  )
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

On Thu, 18 Sep 2025 16:37:25 +0800 you wrote:
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
  - [V14,1/6] mm: softdirty: Add pgtable_supports_soft_dirty()
    (no matching commit)
  - [V14,2/6] mm: userfaultfd: Add pgtable_supports_uffd_wp()
    (no matching commit)
  - [V14,3/6] riscv: Add RISC-V Svrsw60t59b extension support
    https://git.kernel.org/riscv/c/59f6acb4be02
  - [V14,4/6] riscv: mm: Add soft-dirty page tracking support
    https://git.kernel.org/riscv/c/2a3ebad4db63
  - [V14,5/6] riscv: mm: Add userfaultfd write-protect support
    https://git.kernel.org/riscv/c/c64da3950cf4
  - [V14,6/6] dt-bindings: riscv: Add Svrsw60t59b extension description
    https://git.kernel.org/riscv/c/519912bdaee8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
