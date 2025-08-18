Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D82CA0EF2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0LYlFemhC5zlD3agAjLyq1DXY17W7fakNCRSTw6lwQ=; b=vx3BmJaYXuTH4A
	ksR8icEqmVCUo7v1mgVMH2b49EEC7/p15HEI5yKHg509uqX+f+G2d5SeluX8dX4MBtRjnO72NjJ4a
	KezlcYW5K6kOjpQVTkModqazP0PPi72/4UfCB23cq0nb/wZYJ9YuC8gWYeGSIAgOANrQfvz2dgoWl
	1THwlpmVg+f0YusTqR7HV0w6eYKsD2xsgqymGBTsMhKzk6q0tfAq3GaG8VoPDdSNgG3cbzTFm5DIo
	bXD/ZDjkq2XgtI8n1AvTbgMR08e0gGgQ9qe3LSYqznG68TisAoKFnYkAmaJhAZbn/H660fmC87qDb
	CGIDgUHP5rmzfMGaQvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03I-00000007U1N-1Xlw;
	Mon, 18 Aug 2025 13:37:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unux5-00000006up2-2M2h
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 08:10:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A5491596;
	Mon, 18 Aug 2025 01:10:36 -0700 (PDT)
Received: from [10.57.58.12] (unknown [10.57.58.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2E943F63F;
	Mon, 18 Aug 2025 01:10:38 -0700 (PDT)
Message-ID: <c09a2a13-8571-44e5-b780-c704598df764@arm.com>
Date: Mon, 18 Aug 2025 10:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] selftests/mm: Add -Wunreachable-code and fix
 warnings
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
 linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
 <20250731160132.1795351-2-usama.anjum@collabora.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250731160132.1795351-2-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_011047_647780_35946DF2 
X-CRM114-Status: GOOD (  13.54  )
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

On 31/07/2025 18:01, Muhammad Usama Anjum wrote:
> [...]
>
> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> index b5e076a564c95..302fef54049c8 100644
> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> @@ -41,7 +41,7 @@ static siginfo_t siginfo = {0};
>   * syscall will attempt to access the PLT in order to call a library function
>   * which is protected by MPK 0 which we don't have access to.
>   */
> -static inline __always_inline
> +static __always_inline

Thanks for this, I had this fix locally but never got to post it!

>  long syscall_raw(long n, long a1, long a2, long a3, long a4, long a5, long a6)
>  {
>  	unsigned long ret;
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index 05de1fc0005b7..a85b2e393e4e8 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -296,10 +296,8 @@ void split_file_backed_thp(int order)
>  		ksft_exit_fail_msg("Unable to create a tmpfs for testing\n");
>  
>  	status = snprintf(testfile, INPUT_MAX, "%s/thp_file", tmpfs_loc);
> -	if (status >= INPUT_MAX) {
> +	if (status >= INPUT_MAX)
>  		ksft_exit_fail_msg("Fail to create file-backed THP split testing file\n");
> -		goto cleanup;

At that point the mount() call has succeeded so I think we do want to
keep the goto and just print the error message instead of calling
replace ksft_exit_fail_msg().

- Kevin

> -	}
>  
>  	fd = open(testfile, O_CREAT|O_RDWR, 0664);
>  	if (fd == -1) {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
