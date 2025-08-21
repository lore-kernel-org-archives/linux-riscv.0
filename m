Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB397CA0EF8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWSxQWZbs2pU6j5EN0ijojHx6+vPyBYUNUKuIHS8T2g=; b=xtuYTHw7k/lnNa
	I71LYbQttfH7D8rHRvnnJ1kfK6mS+cTYWWnsUs8nbsUrXdZE8rqDbODh/ZKtXpC3gRdZMJB478fO7
	1FoA0iTJaZQt/Z0N0wzOw/n1tCH4IvpP8WIUwrIPRth5RajkGZrGFF0CcOT1rEODvXzWNvqjwQWw1
	w265O/efJEX67IsMHR1SWNacAoLkcwGAmvn/EkhmJqPnnpM7L9dZ1QAhSkHSavQB3JHOsw1ytjqgT
	RX+7H9NR9QWvHWejAQ5dOUJxWjFE/IYbWm/la77HGOiZnEXkpWmruy+2gNFM2NyQdVStt1PbDK/Dn
	pHkOVb+kntB5FjkWASdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyjc-0000000Fwwx-16bm;
	Thu, 21 Aug 2025 06:25:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoye0-0000000FwJu-1WFO
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 06:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755757166;
	bh=I4zrmHfo3KUrLNPHF7/jdsoSqAbmt4bHTj4T59OIe/w=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=qJYDM3g5NXoL0QCYPIMItwhZAY7s/w47WqfLvieaC0s4EC2hPZ+XScMGvi1G6NxWM
	 FYEDZeHOND36YeFiwA08wY/hu3sM6Zgpau/MZloXBUJAKXmJCNsgX9/CAgjiu9cn2q
	 Z7aN1qLnPUFlGy3CMcCZaoIslFGSiLmrwRXyqxK+RFUdcs6CkOKY4C50XGlqbbn8CC
	 nG8K9/SakCWfA3yyKOcw9CoAAR6HHfO9giUxaXK+uK+qgHezpIO6LfsyMR7/1E9I0C
	 9zoSuhJnacA1Idu3dDuyeSxJ03mlbh7AijE75W3/Ik9J+zXsSuKLjYhMz5oVjqpR6B
	 64EbxkdmLlX9Q==
Received: from [192.168.100.175] (unknown [103.151.43.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 845C617E0071;
	Thu, 21 Aug 2025 08:19:21 +0200 (CEST)
Message-ID: <46dce2ac-adb5-4a6b-8847-fe214c1599a7@collabora.com>
Date: Thu, 21 Aug 2025 11:19:20 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, kernel@collabora.com
Subject: Re: [PATCH v2 1/8] selftests/mm: Add -Wunreachable-code and fix
 warnings
To: Kevin Brodsky <kevin.brodsky@arm.com>,
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
References: <20250731160132.1795351-1-usama.anjum@collabora.com>
 <20250731160132.1795351-2-usama.anjum@collabora.com>
 <c09a2a13-8571-44e5-b780-c704598df764@arm.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <c09a2a13-8571-44e5-b780-c704598df764@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_231928_561941_E3172BC9 
X-CRM114-Status: GOOD (  15.49  )
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

On 8/18/25 1:10 PM, Kevin Brodsky wrote:
> On 31/07/2025 18:01, Muhammad Usama Anjum wrote:
>> [...]
>>
>> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
>> index b5e076a564c95..302fef54049c8 100644
>> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
>> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
>> @@ -41,7 +41,7 @@ static siginfo_t siginfo = {0};
>>   * syscall will attempt to access the PLT in order to call a library function
>>   * which is protected by MPK 0 which we don't have access to.
>>   */
>> -static inline __always_inline
>> +static __always_inline
> 
> Thanks for this, I had this fix locally but never got to post it!
> 
>>  long syscall_raw(long n, long a1, long a2, long a3, long a4, long a5, long a6)
>>  {
>>  	unsigned long ret;
>> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
>> index 05de1fc0005b7..a85b2e393e4e8 100644
>> --- a/tools/testing/selftests/mm/split_huge_page_test.c
>> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
>> @@ -296,10 +296,8 @@ void split_file_backed_thp(int order)
>>  		ksft_exit_fail_msg("Unable to create a tmpfs for testing\n");
>>  
>>  	status = snprintf(testfile, INPUT_MAX, "%s/thp_file", tmpfs_loc);
>> -	if (status >= INPUT_MAX) {
>> +	if (status >= INPUT_MAX)
>>  		ksft_exit_fail_msg("Fail to create file-backed THP split testing file\n");
>> -		goto cleanup;
> 
> At that point the mount() call has succeeded so I think we do want to
> keep the goto and just print the error message instead of calling
> replace ksft_exit_fail_msg().
The cleanup tag does cleanup and then calls ksft_exit_fail_msg() without printing the
actual reason of failure. So current flow seems good where information about the error
is being printed.

> 
> - Kevin
> 
>> -	}
>>  
>>  	fd = open(testfile, O_CREAT|O_RDWR, 0664);
>>  	if (fd == -1) {


-- 
---
Thanks,
Usama

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
