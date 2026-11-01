Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162C460701C9
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=feY0bZma;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4nmcWS6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jkhznRSBTTgPUSkXh4Y09FiKMo43J3PhLpf/mD6gLcU=; b=feY0bZmabMljCMGg1tr1ZXVJZO
	vHIsR55awYfnxfxtT/jpSmSwxGzjarWSfkCaSJQD9aqbeaiQLO6OHoprOakB3KHYACRuc5PhnvH7s
	smG17ZyZQNyTNO7KphxmSYFf78Cp+B6muAc3WdOHC0+pHmz7qAXWwX1Q00mmiMfaIRd0xu1PFtB9T
	4I7xIR2sqNZwbdlFZZd2Cj6fUe68wY8I0P3Am81haeRJ//0HjLt2P8kPo7k8MoNL/Xr+9wsbIKh0u
	KCmSuYOUQ9JC4umx9VQO8YKCgz0jGJGxh+Y1sQIWITelco8LRTvrj/XCxkv3P8stoWRJ5Jdp5IlQw
	2UWwCBTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqs-0000000F0ba-0pMG;
	Sun, 01 Nov 2026 22:16:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqZ-0000000Ezgd-0MGj;
	Sun, 01 Nov 2026 22:16:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68EB0605CE;
	Sun,  1 Nov 2026 22:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE641F00A2C;
	Sun,  1 Nov 2026 22:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571374;
	bh=k1DWd8TsBWg5NBBxBu42AFkg72eDnbidrtlPTmYRtJY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=l4nmcWS6A/4Hr5O71oODbuTRUfO0NkWJ85KjSmxpc4wtkYxkpb1bOMwK0jr4BmFWY
	 lYIEM9ylgDV6SUrYMpJIE2KKFpoD2nnt+UGewiExEhxyhKTMOjm+T52MFPeK8Yd0J+
	 p4q/4axVz0UfZx3L63VYvsm1IdHUsRWd2LlParmpMe2U//B6WU2rzsRD4qt6poBS3X
	 9nvXcpbi8Wvh3JxnKjFOreSdRvTy7KVewOW8UsbJ5RSKNcsm8ZfOb0TAb1yKpjZZPl
	 L41yoUudqhZYHKnzicNfUykC9EKnM+e9w4aN1yX+WbAJDCsXR56xtkURsIUpOdA2Bn
	 Z4trFEgXz6Wyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 030DB38003B8;
	Sun,  1 Nov 2026 22:16:14 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/6] arch, mm/execmem: resolve confusion about
 set_direct_map_valid_noflush()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357137254.2624073.6914916059318534007.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:12 +0000
References: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
In-Reply-To: <20260903-execmem-set-vm-perms-v0-2-v3-0-949b64a9f755@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 abarnas@google.com, aou@eecs.berkeley.edu, agordeev@linux.ibm.com,
 alex@ghiti.fr, luto@kernel.org, bp@alien8.de, brendan.jackman@linux.dev,
 catalin.marinas@arm.com, borntraeger@linux.ibm.com,
 dave.hansen@linux.intel.com, david@kernel.org, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, chenhuacai@kernel.org, mingo@redhat.com, lenb@kernel.org,
 palmer@dabbelt.com, pjw@kernel.org, pavel@kernel.org, peterz@infradead.org,
 hpa@zytor.com, rafael@kernel.org, ryan.roberts@arm.com, svens@linux.ibm.com,
 tglx@kernel.org, urezki@gmail.com, gor@linux.ibm.com, kernel@xen0n.name,
 will@kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-s390@vger.kernel.org, loongarch@lists.linux.dev
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

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Thu, 03 Sep 2026 12:28:26 +0300 you wrote:
> Recent discussion about implementation of execmem's ROX caches on arm64
> revealed a confusion about how set_direct_map_valid_noflush()
> implemented on different architectures.
> 
> On arm64 it sets or clears the PTE_VALID bit marking a PTE as present or
> not present.
> 
> [...]

Here is the summary with links:
  - [v3,1/6] set_memory: add number of pages parameter to set_direct_map APIs
    https://git.kernel.org/riscv/c/be7dacb9c1d4
  - [v3,2/6] mm/vmalloc: set area's page_order after allocation succeeds
    https://git.kernel.org/riscv/c/40702f168a9e
  - [v3,3/6] mm/vmalloc: constify vm parameter of get_vm_area_page_order()
    https://git.kernel.org/riscv/c/1f73dfdeb9c2
  - [v3,4/6] mm/vmalloc: make set_area_direct_map HUGE_VMAP friendly
    https://git.kernel.org/riscv/c/86dc0280b807
  - [v3,5/6] mm/execmem: use VM_FLUSH_RESET_PERMS for ROX cache allocations
    https://git.kernel.org/riscv/c/4c4b2ed5b783
  - [v3,6/6] Revert "arch: introduce set_direct_map_valid_noflush()"
    https://git.kernel.org/riscv/c/0e774fdb2ed6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
