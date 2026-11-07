Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C2A606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZOzm3ZvU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHnhbvla
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0GcYgw0M+Qx+WVSZlxFbJf19FkSH+Ocryx07MXsKfpw=; b=ZOzm3ZvU4TBPGbG4PElaaSAybO
	Geb82hFvR9bDTjLqivu5DC/TpWB/F7fiIuY7UEJ85vEueYzuZz7ZN0b2XJ8mDcU44HsDmz7KKlVms
	S672iR3GHjoqIuz6z7mKPwWMqDGV5zvNcUpHzfsohSqQ0FTtH9bb3kqsBsKN5WZxGQlJqmsEngS9N
	eVGS9f4MBkTek6Anb9BNdi8QYDwtFYj3mw24QhSidPCAGcLTE4ngJrLPUQQHsDKevrtrsgLGkMr4x
	pLp880e+MYNlffc1BWkWvnArIcxnvk3qHreGqI982PLCBNF2uqlVJhp1YFSpCs9RJ7xEbd/hjZPlR
	qGFc+jEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgW0-0000000Ek3N-1yPl;
	Sat, 07 Nov 2026 13:31:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgVz-0000000Ek37-0Tp4
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 13:31:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8735E40A63;
	Sat,  7 Nov 2026 13:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690EB1F0089F;
	Sat,  7 Nov 2026 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794058286;
	bh=uioOfdaChpgNKoCkMvX7C1NIWfaIypCIHiX26RAAF2Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IHnhbvlaftjfCAg+fhxLI5iDMkVEu2Bfyq9nvte1kfrTAiiHRpqbZOlUfQ5RGOC6q
	 bT9hUDiHgY5t/tPPWQ9r7LnWH0VD1po7OnuURf8Ki4MQ31cu1S1GRCw6NkYodMMJmp
	 JPQQwN1c0hJx/d9Uyf2+3+zIDp7FSGUrSGdEf3yxTY/8YFYB9W4avO6XexUQhth422
	 BP3Y3ml9Y01VqI6nmEG7QFqe7izxy7/aQKw4AjsjoMqlsW00DbzOIvR78kQg6EhE3n
	 jJbSsvF108HRdmmoiiFEI8b2bdI6YCatQz1Xm9nPn81MimnTZPLty3pzxnZBu0Lx/D
	 5yuo47ZDS/ZWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5E0FD380821F;
	Sat,  7 Nov 2026 13:31:26 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1] riscv: mm: Define PAGE_KERNEL_RO
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179405828510.1177315.1002226727110636993.git-patchwork-notify@kernel.org>
Date: Sat, 07 Nov 2026 13:31:25 +0000
References: <20261018023649.798595-1-nickolai@csail.mit.edu>
In-Reply-To: <20261018023649.798595-1-nickolai@csail.mit.edu>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Sat, 17 Oct 2026 22:36:49 -0400 you wrote:
> Kernel mappings that generic code creates read-only are writable on
> riscv. With HugeTLB vmemmap optimization (selected by riscv and on by
> default with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON), the tail
> vmemmap pages of every optimized huge page are remapped to one shared
> page with PAGE_KERNEL_RO so that a stray write to a tail struct page
> faults. On riscv that remap keeps _PAGE_WRITE, so such a write silently
> changes the struct pages of every optimized huge page instead.
> early_memremap_ro() (EFI system and configuration tables), the
> firmware loader's vmap() of the loaded image, and acpi_os_ioremap() for
> EFI runtime code and NOMAP regions, which asks for a read-only mapping
> precisely to avoid a writable mapping of executable code, are affected
> the same way.
> 
> [...]

Here is the summary with links:
  - [v1] riscv: mm: Define PAGE_KERNEL_RO
    https://git.kernel.org/riscv/c/551bdd6fcaba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
