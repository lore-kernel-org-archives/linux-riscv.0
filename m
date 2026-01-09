Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC00ED232EC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zDv1h+qdDmnkHmLnZzgQMkMhn5lqW615fn0jg8Z30E=; b=UZmyUVHMu9u2ZM
	IUObu/3wz3xKaimtjt3G8WAebh7LbnvWa9TrUeFmEeGdDpnKYsLQG8pSaG6HBhLnjdynENzUnUGhU
	sPI7btsTJLzwa1mEUAwOF8EgPiP2fZaNu7pWyzO9lesaZTVQDliI3CKPUeQiIc6ycv7ssMIfVPR6f
	edy0xJITpmdH1yFQRgR7m+F8a9eNVyWYTb+P5IFdlMPh5SwGHsCtTXIir82aVZbVWUipzWeSkS5ND
	ci55GPllXjURqdGy7/Ua0yNM3NJ7ud/hZs3WtSGXxX0y4ARCjTZXy42A89EdDuKzSg+5xsoZGAqkT
	7sSq4mj5czdNY//wBN6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7kE-00000001sCP-2Nho;
	Fri, 09 Jan 2026 08:21:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7kB-00000001sAs-0ekJ
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 08:21:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96BEE404ED;
	Fri,  9 Jan 2026 08:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA62C19422;
	Fri,  9 Jan 2026 08:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767946871;
	bh=KUFuE5V8UAiIurL6g3Fp/lJo2ewluF8KzNFw5f5PUjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gk+RzwZJgqFqDXbdeT7Ij2ANvkctK08svhshZT4R6yu6GK6U5FU7oH4Xe+zv8qwMi
	 4CjPgeTPbBjv8HsMIltG5ewdwonA8kjSIA667gREwSdMJ3RS+7Buq5U6Eos8SvbK+J
	 nKkrMxUoT4X8Q0FyxCy4EZdhe4iqJhr4V6t7/UJCAhTlbVpUQXR/gm208md0TMmWZM
	 HkmXt9IdJ7rCxhmZTAD0oRgGfDs7xzYOTVswLzOoZ7GMgJgYq9abd0Ivcl84yf5tq9
	 J4AmlCsrCF8YDst8YMFTNmMfuhpye4VlBUo7YM7KAkx0A9LACF/F+ezsCZLKZlQrcl
	 B6Hco6Rs0QnpA==
Date: Fri, 9 Jan 2026 10:21:00 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Lain Fearyncess Yang <fearyncess@aosc.io>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Kexy Biscuit <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] loongarch: wire up memfd_secret system call
Message-ID: <aWC6bIEg6UqvX1DO@kernel.org>
References: <20260109051054.188030-1-fearyncess@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260109051054.188030-1-fearyncess@aosc.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_002116_581852_D218B4FA 
X-CRM114-Status: GOOD (  10.20  )
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

On Fri, Jan 09, 2026 at 01:10:51PM +0800, Lain Fearyncess Yang wrote:
> From: "Lain \"Fearyncess\" Yang" <fearyncess@aosc.io>
> 
> LoongArch supports ARCH_HAS_SET_DIRECT_MAP, therefore wire up the
> memfd_secret system call, which depends on it.

LoongArch version of set_memory* does not support splitting of leaf PMD
entries. Does LoongArch always use PTE-level mappings in the direct map?
 
> Signed-off-by: Lain "Fearyncess" Yang <fearyncess@aosc.io>
> ---
>  arch/loongarch/include/asm/unistd.h     | 1 +
>  arch/loongarch/kernel/Makefile.syscalls | 6 +++---
>  tools/testing/selftests/mm/Makefile     | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
