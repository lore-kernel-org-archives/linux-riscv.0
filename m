Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E495BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Dec 2022 03:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QMU12xAixU5QTvn42N+b4b8JwVrIYRv8q+aSE/rs3HY=; b=HsqfoHRX4VDmqq
	Pfp9N7m7dNA1aucSe+jx6AuW4kp6yHTSoNqi7/SuEPzDmE+X5vJfDoDtIt07iDSEiRZIt/oLc+F6J
	yrlrXx8lNX8+IdFTpnxtiqsOHlCZZfzikUlLeIuhEpyx3SpkDA5iORrnw8y88JfhvBqUZgtdVk+Yl
	RRmUW8o4BfQhKcYnbzHviKPVeUuBHk5rigDJcKlsdC2F2Vu2NEdISW5G11tZJoNOxkRrsYw485Xbz
	2J8p7WO6sK8Q/nqWxbn503X6VeBo+bFe16/0x/GhfL1nHevHM3Y5qJX1LTsWinYlbHwaaEttdgs3z
	N8/18VfgXvtumubIBwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7pZe-008Vns-UF; Wed, 21 Dec 2022 03:15:18 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7pZb-008Ve6-VW
	for linux-riscv@lists.infradead.org; Wed, 21 Dec 2022 03:15:18 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NcJTg0Mtbz4x3w;
	Wed, 21 Dec 2022 14:15:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1671592506;
	bh=eqAIBLUmcICy3LgEU8+CzGPHy97CiqYlcBozr88VRgM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nEnpH5yKCXg49RR2P2OgASyKUTK1v/Cpt25ZodcDuYQhuzTY4bfmiopmNdXaSJcxG
	 aT2giTer1CXp4QrKyb0L3iEMExYYi45d6YNdHP/hsCuZ0ooVSZAHVP+TaH2VeP+mV0
	 m7KqD7FQGyuOV2IM8pdQBoAydfWwg9TXYyD/1MwjCHXsflSyAQ9fUUg4pbm6i1ouBK
	 SZjj31OHTFa/rSnU4LNO/R3FzH6Cmo/n1VbDuQf7YV3yJoyt+M/z7P9wZUe0G0LDmb
	 GVN8E+MF/N6Cs5RWhwq5KdcguwthwmMBOOWoIsEsuVPmDTrbRkQpUSO0ShmLK7R0zK
	 zzORrsjT0jX2g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mike Kravetz <mike.kravetz@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 netdev@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Peter Xu <peterx@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Matthew
 Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Rik van
 Riel <riel@surriel.com>, Will Deacon <will@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Christian Brauner
 <brauner@kernel.org>, Eric Dumazet <edumazet@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [RFC PATCH] mm: remove zap_page_range and change callers to use
 zap_vma_page_range
In-Reply-To: <20221216192012.13562-1-mike.kravetz@oracle.com>
References: <20221216192012.13562-1-mike.kravetz@oracle.com>
Date: Wed, 21 Dec 2022 14:15:02 +1100
Message-ID: <87tu1pih1l.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_191516_536184_59A73FB3 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Mike Kravetz <mike.kravetz@oracle.com> writes:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas as calls
> should be vma specific.
>
> Instead of fixing zap_page_range, change all callers to use the new
> routine zap_vma_page_range.  zap_vma_page_range is just a wrapper around
> zap_page_range_single passing in NULL zap details.  The name is also
> more in line with other exported routines that operate within a vma.
> We can then remove zap_page_range.
>
> Also, change madvise_dontneed_single_vma to use this new routine.
>
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  arch/arm64/kernel/vdso.c                |  4 ++--
>  arch/powerpc/kernel/vdso.c              |  2 +-
>  arch/powerpc/platforms/book3s/vas-api.c |  2 +-
>  arch/powerpc/platforms/pseries/vas.c    |  2 +-
  
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
