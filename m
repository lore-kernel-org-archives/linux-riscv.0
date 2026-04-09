Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28CAEA3C55
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qn06QjjlO6o4zbwfYepZEm+bCXCb4Y4dWdXmX/kR930=; b=DXNcbGjG1GBO3e
	wvK/d3P35SVNJbEu+4LIpoOpLPWrbdfOKac9vyetShOcC0usea8S6Hk/e8KwXj0rPkpEewRDc2jyE
	kiqnGvD7C8OxW/fpu7//biY/gvcVCpJc6QvRMfIG908gAm2xBWpXapZUXZULR/i4cObqmp/3b2QHT
	r0wATfeVNWGFCzhmUDYvxdeiTSAaItE0eSZ5MQjsi4TNN+Ftv7rhMcjvm/M6plZru6m1EthBXydbZ
	MhcxIH/Pdl1rrSLZHyGXPm8Y2MzDDY+fWxkhuLJB+I4//jgesQk3oMgK8+Ow7DOrSirL5aBBRcpFD
	UmHI22+5NUeIuq4f+CoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAocm-0000000AOZL-0xwD;
	Thu, 09 Apr 2026 12:36:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAocc-0000000AOX8-1hQE
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 12:36:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E685441D8;
	Thu,  9 Apr 2026 12:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707D4C19424;
	Thu,  9 Apr 2026 12:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775738193;
	bh=kM9h+y0BF4ZFQcAKpgEEGNTYcYx79nYyDjyV7OihopE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JljPoIvCiph2RcjwcnpjoOccsbVu7nZdIl1DZADymDX8dosQ8++Iux80DZMoztID7
	 nQxXg887ByeclE9szJzYeKOGbLCmIGZ6kSiVvL28/UzshUjmxEzSrZxekVE7scs54C
	 56fw3CWwDn6uNLAfEphEykQuxW95QpfLLT26bWK3U1lA17thvSRmlh1W0hjVKIDW4l
	 1Am4g+YymGPFyy0NDkxsHsZd1ys40FxpJE2dXOBVzZ8dzrpHezlJhl/Wza4pAnPf36
	 SxNLWTE5db2o9d0NOqI5OWZtWJkNNWVuv9N6y+4jpRCqQBkvDi2RfWYu21f44Qt2j4
	 uTSBBOakJ/vlA==
Message-ID: <3bcd073e-f142-4e7c-8d5e-b0d1239ca9b9@kernel.org>
Date: Thu, 9 Apr 2026 14:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] riscv: mm: Fix NULL dereferences in napot hugetlb
 functions
To: Michael Neuling <mikey@neuling.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>,
 Guo Ren <guoren@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Nam Cao <namcao@linutronix.de>, Oleg Nesterov <oleg@redhat.com>,
 Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>,
 Raj Vishwanathan4 <rvishwanathan@mips.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20260409091143.1348853-1-mikey@neuling.org>
 <20260409091143.1348853-5-mikey@neuling.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260409091143.1348853-5-mikey@neuling.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_053634_496883_E1CAEF9D 
X-CRM114-Status: GOOD (  14.06  )
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

On 4/9/26 11:11, Michael Neuling wrote:
> huge_pte_offset() can return NULL when any level of the page table walk
> encounters a non-present entry. Both huge_ptep_set_access_flags() and
> huge_ptep_set_wrprotect() re-derive ptep via huge_pte_offset() in the
> napot path but use the result without a NULL check, leading to NULL
> pointer dereferences in get_clear_contig_flush() and set_pte_at().
> 
> Add NULL checks after huge_pte_offset() in both functions.
> 
> Fixes: 82a1a1f3bf ("riscv: mm: support Svnapot in hugetlb page")
> Signed-off-by: Michael Neuling <mikey@neuling.org>
> Assisted-by: Cursor:claude-4.6-opus-high-thinking
> ---
>  arch/riscv/mm/hugetlbpage.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index a6d217112c..7d155341cf 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -288,6 +288,8 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  	order = napot_cont_order(pte);
>  	pte_num = napot_pte_num(order);
>  	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
> +	if (!ptep)
> +		return 0;
>  	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
>  
>  	if (pte_dirty(orig_pte))
> @@ -335,6 +337,8 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	order = napot_cont_order(pte);
>  	pte_num = napot_pte_num(order);
>  	ptep = huge_pte_offset(mm, addr, napot_cont_size(order));
> +	if (!ptep)
> +		return;
>  	orig_pte = get_clear_contig_flush(mm, addr, ptep, pte_num);
>  
>  	orig_pte = pte_wrprotect(orig_pte);


These functions are called when we previously verified that there is
indeed a pte mapped. And while holding the PTL to protect concurrent
unmapping.

So how should this possibly trigger?

-- 
Cheers,

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
