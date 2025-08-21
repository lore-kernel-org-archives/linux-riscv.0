Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAACCA0EF8
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 12:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Bxvn8rCzBzE3KnAnJ1x/3BKNl1UJR7wFpVwrInpV3o=; b=21tONDyoG7ITVm
	eTmujJHthZLkt/S7zWxgN57tmStNeumy7UL1L4RqT1a4lBeoXX25ss/fY5CIp6Vl5iDOzVxxkJuzV
	ogoBqFI59Ua+E8dlNibBKF30dt2Ifb24MfrIM9xzdV6hRvae6wKUWOpD+bmV97ypKl4KXFFYZlFka
	fQOLdxJUoV3eZLPiP7Ffra1PPgYhyYuVxsAG/2NKe+AavpJMAjyjBNnUEhoBdEbejDXkKjmm8cKE9
	EgqltRWOvWYQVQjzYkdwSQMQUCmjVdzlvbp0pfdB56Gs6+ztf6OyKnlx3zYf8TlRgY2uUALyVy8Zl
	nolZ4CbY1/mkbs5ttd6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4hu-0000000GwvH-0mTx;
	Thu, 21 Aug 2025 12:47:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2d9-0000000GdIj-0iiB
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 10:34:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3830C152B;
	Thu, 21 Aug 2025 03:34:42 -0700 (PDT)
Received: from [10.57.91.188] (unknown [10.57.91.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 334CD3F63F;
	Thu, 21 Aug 2025 03:34:44 -0700 (PDT)
Message-ID: <f997a8ec-26aa-45f3-a757-d221321c8607@arm.com>
Date: Thu, 21 Aug 2025 12:34:41 +0200
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
 <c09a2a13-8571-44e5-b780-c704598df764@arm.com>
 <46dce2ac-adb5-4a6b-8847-fe214c1599a7@collabora.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <46dce2ac-adb5-4a6b-8847-fe214c1599a7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_033451_252603_B150C932 
X-CRM114-Status: GOOD (  10.46  )
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

On 21/08/2025 08:19, Muhammad Usama Anjum wrote:
>>> [...]
>>>
>>> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
>>> index 05de1fc0005b7..a85b2e393e4e8 100644
>>> --- a/tools/testing/selftests/mm/split_huge_page_test.c
>>> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
>>> @@ -296,10 +296,8 @@ void split_file_backed_thp(int order)
>>>  		ksft_exit_fail_msg("Unable to create a tmpfs for testing\n");
>>>  
>>>  	status = snprintf(testfile, INPUT_MAX, "%s/thp_file", tmpfs_loc);
>>> -	if (status >= INPUT_MAX) {
>>> +	if (status >= INPUT_MAX)
>>>  		ksft_exit_fail_msg("Fail to create file-backed THP split testing file\n");
>>> -		goto cleanup;
>> At that point the mount() call has succeeded so I think we do want to
>> keep the goto and just print the error message instead of calling
>> replace ksft_exit_fail_msg().
> The cleanup tag does cleanup and then calls ksft_exit_fail_msg() without printing the
> actual reason of failure. So current flow seems good where information about the error
> is being printed.

My point is that with this patch, ksft_exit_fail_msg() still causes the
test to exit right away without the cleanup steps (i.e.
unmounting/removing the directory) being executed. Printing a specific
error message is good but we should also run the cleanup steps.

- Kevin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
