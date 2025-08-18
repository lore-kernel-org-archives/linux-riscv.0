Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0E7CA0EEB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3IS+Ev0Z9fq81p2uQqfRWYGT+aWI4+Dm8ATzynp0Tc=; b=O6bInG/er7BlN/
	gmHR73V3q9dVE2ScY0qAFkOa4CgAC1KJKbbman5D2zcLlcrZOw1rLH43SE+33/BuQqUCvzdpmX7ya
	KxYz6mDQoCh+jum1Mu+nJHuW2s4llLCt8slNl/f3QMNVuRADgszUYWD+rjySLeUt23v8iS4cVFMu/
	gWE5EPjRLAQD90EXewDAsFOo4CrDJWryZNJfJhsQZ/k2CEL1LvZ8MCNaP4Uk95PXh9hIT+o+gqsxn
	nsiiD2GPJ6Fc1S2AonO4L9dqqiGTAISozqjEs00BAtn0+4cWuZxooGwPc/vmJsSvpjEaPtgj9IJOV
	k1IOVX9L1X8RjWqrP91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03J-00000007U2b-0qZF;
	Mon, 18 Aug 2025 13:37:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuyl-00000006uy1-0BYF
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 08:12:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 028561762;
	Mon, 18 Aug 2025 01:12:22 -0700 (PDT)
Received: from [10.57.58.12] (unknown [10.57.58.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A60AF3F63F;
	Mon, 18 Aug 2025 01:12:24 -0700 (PDT)
Message-ID: <28d7d186-5068-4546-90af-f9a9a0147f21@arm.com>
Date: Mon, 18 Aug 2025 10:12:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] selftests/mm: protection_keys: Fix dead code
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
Cc: kernel@collabora.com
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
 <20250731160132.1795351-3-usama.anjum@collabora.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250731160132.1795351-3-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_011231_126744_65A9D4AF 
X-CRM114-Status: GOOD (  14.59  )
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

+Dave Hansen

On 31/07/2025 18:01, Muhammad Usama Anjum wrote:
> The while loop doesn't execute and following warning gets generated:
>
> protection_keys.c:561:15: warning: code will never be executed
> [-Wunreachable-code]
>                 int rpkey = alloc_random_pkey();
>
> Let's enable the while loop such that it gets executed nr_iterations
> times. Simplify the code a bit as well.
>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  tools/testing/selftests/mm/protection_keys.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
> index 23ebec367015f..6281d4c61b50e 100644
> --- a/tools/testing/selftests/mm/protection_keys.c
> +++ b/tools/testing/selftests/mm/protection_keys.c
> @@ -557,13 +557,11 @@ int mprotect_pkey(void *ptr, size_t size, unsigned long orig_prot,
>  	int nr_iterations = random() % 100;
>  	int ret;
>  
> -	while (0) {
> +	while (nr_iterations-- >= 0) {

Now that is a good catch! I had never realised this whole loop was dead
code...

The question is whether we really want it. This code looked exactly this
way when it was merged [1] so it has never been run. It looks
suspiciously like debug code.

Dave, should we just remove this?

- Kevin

[1]
https://lore.kernel.org/all/20160729163024.FC5A0C2D@viggo.jf.intel.com/T/#u

>  		int rpkey = alloc_random_pkey();
>  		ret = sys_mprotect_pkey(ptr, size, orig_prot, pkey);
>  		dprintf1("sys_mprotect_pkey(%p, %zx, prot=0x%lx, pkey=%ld) ret: %d\n",
>  				ptr, size, orig_prot, pkey, ret);
> -		if (nr_iterations-- < 0)
> -			break;
>  
>  		dprintf1("%s()::%d, ret: %d pkey_reg: 0x%016llx"
>  			" shadow: 0x%016llx\n",

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
