Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAFAC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDjXy1LCmWTaCpfpXzUPL+M1zxmT3P36LAv/W92EgCo=; b=dXiob8QvJbddD7
	7+ylzizFspz/i9WKSDCjsnEdTTTrZ/8pceI44GfDPaOnDbeBymEGxGTZyT4Xp4o6621tBq9b0pvdm
	oO5hA5TRnw6LDKrV2HflYdnpEefyuhw4LqWqnIqLl1FnWXqgHLoPOukhjfuTwxLMBwqZMZv1OuIHZ
	aJq2/v4/rjbXMcLUrFIpoMLw9STAxh3yreFvmJX42hzcvy1rrpAkYbHE9HGvYL+71I5399oeaf2vo
	70kzRPlb3tgN68CZFt+84HNbqy2JLi8gFEhfaAh7pVyYmRb7MfYdSW2soWA5eJI3qBmC5MyfIVceL
	UpY57iRNRbD+qILQEQPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4k9J-0000000GBDU-2Esp;
	Wed, 08 May 2024 16:28:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4k9D-0000000GB9p-27L1;
	Wed, 08 May 2024 16:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C730ACE195B;
	Wed,  8 May 2024 16:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B24C113CC;
	Wed,  8 May 2024 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1715185677;
	bh=L1QBFOlO/NdA1MFpDgz4XHe5aYdivtT6EbOIH6mGJfk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jT+7B2zaE1gDYONCDwX6NLuwtxU+sqrhKVQbk5C5m1cVZ/1fHqzqACKx4DGzHUTrH
	 3p8JAG1FryLJQWyCTCMWxKb6xyrhyKkVFKzE6arQ0qph+v/cQgwDI9ULN+FoL/ebTP
	 XjUroUnyFQcZ/JlRUw6gi9vr+CfBF8+2XNpOrOBI=
Date: Wed, 8 May 2024 09:27:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/9] Merge arm64/riscv hugetlbfs contpte support
Message-Id: <20240508092756.58fba60e4b6ce0986e8f5f73@linux-foundation.org>
In-Reply-To: <20240508111829.16891-1-alexghiti@rivosinc.com>
References: <20240508111829.16891-1-alexghiti@rivosinc.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_092803_834364_1F2A809A 
X-CRM114-Status: GOOD (  12.29  )
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

On Wed,  8 May 2024 13:18:20 +0200 Alexandre Ghiti <alexghiti@rivosinc.com> wrote:

> This patchset intends to merge the contiguous ptes hugetlbfs implementation
> of arm64 and riscv.
> 
> ...
> 
>  arch/arm64/Kconfig                  |   1 +
>  arch/arm64/include/asm/pgtable.h    |  56 +++++-
>  arch/arm64/mm/hugetlbpage.c         | 291 +---------------------------
>  arch/riscv/Kconfig                  |   1 +
>  arch/riscv/include/asm/hugetlb.h    |   2 +-
>  arch/riscv/include/asm/pgtable-64.h |  11 ++
>  arch/riscv/include/asm/pgtable.h    | 153 +++++++++++++--
>  arch/riscv/mm/hugetlbpage.c         | 227 ----------------------
>  arch/riscv/mm/pgtable.c             |   6 +-
>  mm/Kconfig                          |   3 +
>  mm/Makefile                         |   1 +
>  mm/contpte.c                        | 272 ++++++++++++++++++++++++++
>  12 files changed, 480 insertions(+), 544 deletions(-)
>  create mode 100644 mm/contpte.c

Hits three subsystems, so I guess mm.git is the place.  I'll await
reviewer/tester input and let's look at getting this into mm.git after
6.10-rc1?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
