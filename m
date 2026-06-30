Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11422C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 04:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C2fIqwA5+l3k2VBa+bVj2lJMrj4rt0ibSo95en59IqI=; b=xlfxKbuuNyMoe8
	x+tLUdJka6qHejqBH/H+zhwKl5CQDVwE9LJMFtW80zPnXTvTu11qX06QwNeIXcjaUaWsFcXAZB5lw
	OuTLWo6u1+rpyryBXT0JBv6Fo+tA/D1YsA7D3ZdK94TtfPLwuvPCa6ENpoQiIkFOISQF+kClDHY0o
	nNpwws747jymyEbKpaeZnzMFjXmKSBhq9o9hLrFnN/zF5Q+Ka/WRYWFZzs/UwgOnUxS6QWpvkkMhv
	XWRXX1ieHtt8KUDVCI1AObeOIVpuE8Jbhog1Izo3P/0MlrggM9HEJNgy1fFbPZlCeSTdSpFaBlm1e
	Vfcv771RIkpGgmuw5ttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wePic-0000000FlQL-0x6D;
	Tue, 30 Jun 2026 04:05:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wePib-0000000FlQF-05XR
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 04:05:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4576409B0;
	Tue, 30 Jun 2026 04:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAC61F000E9;
	Tue, 30 Jun 2026 04:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782792273;
	bh=JfxABrcsfDcW4VTbSIwcTfBacc21ZxE5i80Vw55Kf9U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mjU6FFPVqm0ty5BDWsRbDuKA53i0q2nEliQq3Fsnwby+j5bvHlsL5OKva2KYmPTel
	 dBEnbJ1TFkxeK7vmT7KKCPYpZgYbIH22ZGEMppmp8HE8u01CPSRJHB2RjkhWtBUu8r
	 SqJZwmG5dblu+CcJDjW1czwpl5/LDsfvhWiZ+uy8=
Date: Mon, 29 Jun 2026 21:04:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 tongtiangen@huawei.com, pasha.tatashin@soleen.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [RESEND PATCH] riscv: mm: exclude invalid THP PMDs from page
 table check
Message-Id: <20260629210432.ef76ce885cd9ccd28b7a2127@linux-foundation.org>
In-Reply-To: <20260523042052.35476-1-cuiyunhui@bytedance.com>
References: <20260523042052.35476-1-cuiyunhui@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Sat, 23 May 2026 12:20:52 +0800 Yunhui Cui <cuiyunhui@bytedance.com> wrote:

> RISC-V THP splitting uses a temporary invalid PMD state where
> pmd_mkinvalid() clears _PAGE_PRESENT and _PAGE_PROT_NONE but leaves
> _PAGE_LEAF set so the MM code can still recognize the PMD as a THP split
> in-progress entry.
> 
> That temporary state no longer describes a user-accessible mapping, but
> page_table_check currently treats it as one because the RISC-V PMD
> user-accessibility test only checks whether the PMD is a leaf and has
> user permissions.
> 
> As a result, when a PMD-sized anonymous THP is split during a COW fault,
> page_table_check can account the invalid intermediate PMD as a live PMD
> mapping, and then account the replacement PTE mappings again when the
> split installs the PTE table. This leaves stale PMD accounting behind and
> later triggers page_table_check failures such as a non-zero
> anon_map_count when the folio is freed.
> 
> Fix this by tightening pmd_user_accessible_page() so PMD page-table-check
> accounting only considers leaf PMDs that still carry either
> _PAGE_PRESENT or _PAGE_PROT_NONE. This preserves the THP split semantics
> required by the MM code while preventing page_table_check from treating
> invalid split PMDs as live user mappings.
> 
> With CONFIG_PAGE_TABLE_CHECK=y and CONFIG_PAGE_TABLE_CHECK_ENFORCED=y,
> tools/testing/selftests/mm/cow completes successfully on RISC-V after
> this change.

Thanks.  This seems to have slipped through cracks.

AI review appears to have found a couple of related and serious issues
in this code.

	https://sashiko.dev/#/patchset/20260523042052.35476-1-cuiyunhui@bytedance.com

perhaps you have time to take a look?

> Fixes: 3fee229a8eb9 ("riscv/mm: enable ARCH_SUPPORTS_PAGE_TABLE_CHECK")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

I'm not even slightly a riscv maintainer, but I'll queue this up for
some linux-next testing and so I can keep an eye on the issue, thanks.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
