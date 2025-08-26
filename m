Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE95BCA0FE9
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QH58xNeauqs2Ka/Vsn9qmLnIZOjZkhtKtadZS4o+OV4=; b=m+eu/5LbTzL6Tl
	PQYAsxuVP2YVYiLNaVh65eA/A3kXuZKjEshM9QwMvPzOUGmJyzniLMK/H94kHs+dFalPImZR/5gfD
	kPxXWFz7qMes4/Km0VnDXDLRWUvjQdlUUPfOBo7zEOu6egVnAenLmFh2q/ShBI6ptKGrvpnUWppCH
	6x0R6ns6JeDYnPaoe9DRSRewSRGFEiH0y8YmpWjk1LHptlhvYuolOsKDhLrG8L0rfcgHKPNIuWu3A
	ZDOk+NGRBFIpM25BzBDX8uP3Z2L2zTGYUAN3hdETt2dXv3+5v3sXGE/EClPsSplWwR0F/LVpnZrvh
	cq/6tACToQssLXKCx8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqq87-0000000BSKF-16AN;
	Tue, 26 Aug 2025 09:38:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqp85-0000000B20J-413W
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 08:34:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 054471AC1;
	Tue, 26 Aug 2025 01:33:59 -0700 (PDT)
Received: from [10.57.89.149] (unknown [10.57.89.149])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E23E3F694;
	Tue, 26 Aug 2025 01:34:01 -0700 (PDT)
Message-ID: <9e2dcf8f-98b7-4461-af75-71627ee48230@arm.com>
Date: Tue, 26 Aug 2025 10:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] selftests/mm: Add -Wunreachable-code and fix
 warnings
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
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
 linux-riscv@lists.infradead.org
Cc: kernel@collabora.com, Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250822082145.4145617-1-usama.anjum@collabora.com>
 <20250822082145.4145617-2-usama.anjum@collabora.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250822082145.4145617-2-usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_013410_079533_86065250 
X-CRM114-Status: GOOD (  22.04  )
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

On 22/08/2025 10:20, Muhammad Usama Anjum wrote:
> Enable -Wunreachable-code flag to catch dead code and fix them.
>
> 1. Remove the dead code and write a comment instead:
> hmm-tests.c:2033:3: warning: code will never be executed
> [-Wunreachable-code]
>                 perror("Should not reach this\n");
>                 ^~~~~~
>
> 2. ksft_exit_fail_msg() calls exit(). Remove the dead code.

In that new version there's no dead code removal, rather that call is
replaced to a call to ksft_print_msg() that doesn't exit.

With that corrected:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

- Kevin

> split_huge_page_test.c:301:3: warning: code will never be executed
> [-Wunreachable-code]
>                 goto cleanup;
>                 ^~~~~~~~~~~~
>
> 3. Remove duplicate inline.
> pkey_sighandler_tests.c:44:15: warning: duplicate 'inline' declaration
> specifier [-Wduplicate-decl-specifier]
> static inline __always_inline
>
> Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes since v2:
> - In split_huge_page_test.c, print error message and then go to cleanup
>   tag for cleanup instead of just exiting without cleanup
> ---
>  tools/testing/selftests/mm/Makefile                | 1 +
>  tools/testing/selftests/mm/hmm-tests.c             | 5 ++---
>  tools/testing/selftests/mm/pkey_sighandler_tests.c | 2 +-
>  tools/testing/selftests/mm/split_huge_page_test.c  | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index d13b3cef2a2b2..23d4bf6215465 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -34,6 +34,7 @@ endif
>  MAKEFLAGS += --no-builtin-rules
>  
>  CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES)
> +CFLAGS += -Wunreachable-code
>  LDLIBS = -lrt -lpthread -lm
>  
>  # Some distributions (such as Ubuntu) configure GCC so that _FORTIFY_SOURCE is
> diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
> index 141bf63cbe05e..15aadaf24a667 100644
> --- a/tools/testing/selftests/mm/hmm-tests.c
> +++ b/tools/testing/selftests/mm/hmm-tests.c
> @@ -2027,11 +2027,10 @@ TEST_F(hmm, hmm_cow_in_device)
>  	if (pid == -1)
>  		ASSERT_EQ(pid, 0);
>  	if (!pid) {
> -		/* Child process waitd for SIGTERM from the parent. */
> +		/* Child process waits for SIGTERM from the parent. */
>  		while (1) {
>  		}
> -		perror("Should not reach this\n");
> -		exit(0);
> +		/* Should not reach this */
>  	}
>  	/* Parent process writes to COW pages(s) and gets a
>  	 * new copy in system. In case of device private pages,
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
>  long syscall_raw(long n, long a1, long a2, long a3, long a4, long a5, long a6)
>  {
>  	unsigned long ret;
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index bf40e6b121abc..de0d26f3df675 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -297,7 +297,7 @@ void split_file_backed_thp(int order)
>  
>  	status = snprintf(testfile, INPUT_MAX, "%s/thp_file", tmpfs_loc);
>  	if (status >= INPUT_MAX) {
> -		ksft_exit_fail_msg("Fail to create file-backed THP split testing file\n");
> +		ksft_print_msg("Fail to create file-backed THP split testing file\n");
>  		goto cleanup;
>  	}
>  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
