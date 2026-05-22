Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA0DCD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 23:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05yQvyZrN+1tFKJcXBBWzMRqRRnKFOPhLzm3w555CZc=; b=ManPotoR2X2kpL
	QQ/psB1ltHyFxSBO8DL5bHP+UOUmRvs+gJpFvpDbrUpyjwXlCK7o+eCOwcmDhGLM+SulEXEOVNW/w
	S8uAzJnN6vPEi7thOCBiRicNzNoFZHuGf2rfF5jRoowk49esdOHHS9W9fvlmHNN9ds82cpO2SKFUP
	4e8+ukw1b0dwChPiCuNH2jLuxGe+YcZMx8kJsIdkxdIlhpcwNPwHrv80kkC3tjyRknP5EsC2/GjKd
	CDyujBWiM0AEx2q6TCfKxkvPaykFpANuqlb92KMrt2yypGo7dS7aI2dmmpmVNOIpFzSoEbCyb0T+A
	0Uy3hyvpDD91LLfTT9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQZ00-0000000CBz1-2xE9;
	Fri, 22 May 2026 23:09:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYzy-0000000CByp-3v3E
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 23:09:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE2F960103;
	Fri, 22 May 2026 23:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A7E1F000E9;
	Fri, 22 May 2026 23:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779491385;
	bh=SRNn+HK5PU4+WE2ZZvd2N1n519hA+9ALeyWVGg6XpfE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=YQZ8sveZ9qkjOvzrCCwjNmTRffNqCV1nLGIZzxyv54dBXtlgt7rvXhODy8FN2533q
	 MiVnn1IVJEGDSSU7p/j2Pi1GyQ96ld3MVOKwlwEttGQc1E21+q0IvvFrl7Xo3XQQcS
	 dOGAXA/PgwYeW3EotaFQSw76Pf7wl0KFW4sCNYdaxZQGlqo3tRgADMs0BFV/BcpfHK
	 /0EElHRH15ECtSUPOPkOn7wVe384hNyH51ICHbG6Y8G1pQZksSjo/VZRhwEjFbRRfU
	 RHDiqavjnifHfaVdLo0CCtWLTeIJmmOsKAlRfq7V+PXP9ZFQpj6gY+KrO2poLmzqZS
	 I4YzsIhKjOfAw==
Date: Fri, 22 May 2026 17:09:40 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
    tongtiangen@huawei.com, akpm@linux-foundation.org, 
    pasha.tatashin@soleen.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: exclude invalid THP PMDs from page table
 check
In-Reply-To: <20260515065048.94564-1-cuiyunhui@bytedance.com>
Message-ID: <252be770-4d9f-954a-9388-8f7b52a92d90@kernel.org>
References: <20260515065048.94564-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
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

On Fri, 15 May 2026, Yunhui Cui wrote:

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
> 
> Fixes: 3fee229a8eb9 ("riscv/mm: enable ARCH_SUPPORTS_PAGE_TABLE_CHECK")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Thanks for the patch, but it doesn't apply as-is.  Could you fix it and 
resend?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
