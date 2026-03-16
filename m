Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991B4F53D7E
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 17:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyUtvtNnu0v9XePYuaucowvy3uak5i90B7Fn4iKxaQU=; b=yEH1CZ/YAaZp2e
	g5JR2TXxqRBmfauRk+rAODxF8zppTM469q6VmS77KV6ZsUlnnD2a5Y/l5ysGc0zw5o9ZhZKflQbvH
	lNAa/yVRqf6zioXoSxreX0twhjo/2fUBrKkc2DXp8g72Z5fLE47+GixnAt89rXYMRpAAugal3NS4I
	3GzofETcwaKGL3W1oSBxTA3JbcH8pe+uia2VYkvGkvHIWta6V7fKyR00nxtbIPpQxM7ihV4HwpIGp
	pP1ucOzyjCLm0BR2Od63qRTWsWunaKIpu/9Dw9RYilzKN61ye5m/024BXLiL/nQb33pUQAe3oVB0k
	vL1XeVyWIjGbzJPKTZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BtQ-00000004ap4-2bX7;
	Mon, 16 Mar 2026 17:38:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BtN-00000004aoP-3vP0
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 17:38:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30273435AD;
	Mon, 16 Mar 2026 17:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A269CC19421;
	Mon, 16 Mar 2026 17:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773682693;
	bh=0uW0QOZk5+IfrJxww2/4kQ/hWFCZYeZgunMAVkXXw+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nbwCgANBypjy9qsi2M3LSEE/LODxD5jHzS0uqZlwWS+Pk8Qrcz7ggO1/eWSB7U0oW
	 69BBy8B7n4E1YfjAreHNxmgRhpGnsVaeIEfJ2L/gGO7pKRLew9oiPxOsUXaC0aEcE/
	 Fy+zu4Yn8otzpEMMQzuTlYhf/CTfDt+CcO0xjBjYuDIi2/4SjvnSg0WegJAwfOm30z
	 IoKA9Iy5dOCxrDX7/xYu/pUkUJC9I8OtfrHvLiIv7xiMx/ftallNP0srMh32sb+khI
	 +BN1oT6k1TwGySXYIQZeRlh2rMjr7plvFLajGq3+2oXALjFG2Pv60moJw97JCvdT3l
	 eSZxGqw+H4W7w==
Date: Mon, 16 Mar 2026 17:38:11 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] riscv: mm: add null check for find_vm_area in
 __set_memory
Message-ID: <8d5e3b4a-4b8f-4db8-9dab-5b2d66b05f1a@lucifer.local>
References: <20260316151642.13738-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260316151642.13738-1-osama.abdelkader@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_103813_993548_62C97914 
X-CRM114-Status: GOOD (  24.92  )
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

(-cc old email address +cc new.)

On Mon, Mar 16, 2026 at 04:16:39PM +0100, Osama Abdelkader wrote:
> find_vm_area() can return NULL. Add a null check to avoid potential
> null pointer dereference, matching the pattern used by other arches.
>
> Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
> Cc: stable@vger.kernel.org
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
> v2:
> - Add Cc: stable@vger.kernel.org
> - Add Fixes: tag

This isn't a bug AFAICT, and we'd only really cc: stable add fixes if it was
identifiable as one, as Andrew mentions.

> - mention __set_memory in the commit message
> ---
>  arch/riscv/mm/pageattr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 3f76db3d2769..46a999c86b26 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -289,6 +289,10 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
>  		int i, page_start;
>
>  		area = find_vm_area((void *)start);
> +		if (!area) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}

This call is gated on is_vmalloc_or_module_addr() so how would we fail to find
an area here?  (modules are also vmalloc()'d)

All set_memory_*() callers will be referencing genuine live data also, so I
don't think this is an issue?

Other arches do a NULL check, but they are not explicitly checking
is_vmalloc_or_module_addr() before doing the check, they seem to be using this
== NULL to imply the memory is something else.

So I think this patch is not correct, except for cases of some underlying bug,
but a bug SURELY would have triggered by now?

So yeah I don't think we should take this patch, as it implies a case that
simply cannot happen.

If it does happen and we get a bug report, it'll be very obvious where it
happened and why.

>  		page_start = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
>
>  		for (i = page_start; i < page_start + numpages; ++i) {
> --
> 2.43.0
>

Thanks, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
