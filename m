Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4531094474
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgPodGs9mUu+bbRYeqpA67CUnTz7NtcWSsRAZf3US/w=; b=Wpt1OX/AhOMaP7
	u3k4YmNZwssB9uoJy/ff6a1ktgMJpQ93XHc90LmF7MG+KaJ5V0aF/l+ImlfnVPLy/c+glpsJoBgJn
	Xn8CiMgmdlj4nhideTWtdphmWYNclSTlmEdgQbktZwJ8H2rD5rJE7bN0+0COFbrenFcwLitz7wxlU
	PPVH8Vxq9ufE4OND9bDE8YoIK1wlRVJ7qGlCZ7YnqECNeCnsnJYDClRjWYqippZU8HsBGIvqNsV3f
	YI3crrgXaV/CXPgclswt14khxf3C2VYtFE5f+fQmGX70NSBmxQ8ZzgJQ0dF7h47O3BpII2Wu4+o0s
	0FsZtInWRIHaLJQ2NNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3vyL-0000000ETQi-37ne;
	Sat, 21 Mar 2026 13:02:33 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3vyG-0000000ETPq-13CH;
	Sat, 21 Mar 2026 13:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774098142; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=NJPULCri2DdVUmJbTlU4Rxn6JWleCj28Q+e1h/YTmMM=;
	b=VvZyuBh5xJdMrpdyu1cmmif7Y/zA5vmXClfFlNhYXGN7XnwQoexLeQ/s+CkI0yg9U3XznvzuijynEYl2TjtUQe48zah4DYY9a5hadOjez/DxqxQ0um3JkLbPgK1Zg5nw/nnGHWOkA0jDnv+nWOF4QDEbFEOdD499LeK/Za3fUTg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X.Ombip_1774098136;
Received: from 30.42.98.36(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.Ombip_1774098136 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 21 Mar 2026 21:02:17 +0800
Message-ID: <bf36511a-92de-4668-b83e-08cf6f2a6ace@linux.alibaba.com>
Date: Sat, 21 Mar 2026 21:02:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] change young flag check functions to return bool
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <bjghychf.ritesh.list@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <bjghychf.ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_060228_992162_7291A92C 
X-CRM114-Status: UNSURE (   7.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 3/21/26 1:31 PM, Ritesh Harjani (IBM) wrote:
> Baolin Wang <baolin.wang@linux.alibaba.com> writes:
> 
>> This is a cleanup patchset to change all young flag check functions to
>> return bool, as discussed with David in the previous thread[1]. Since
>> callers only care about whether the young flag was set, returning bool
>> makes the intention clearer. No functional changes intended.
>>
>> Ran mm selftests on Arm64 and x86 machines, and no issues were found.
>>
>> Note that I only CC'd the arch mailing lists to avoid disturbing too
>> many people.
>>
>> [1] https://lore.kernel.org/all/d172d6bf-c60c-4cf5-9da9-f30de38cdfed@kernel.org/
>>
>> Baolin Wang (6):
>>    mm: change to return bool for ptep_test_and_clear_young()
>>    mm: change to return bool for
>>      ptep_clear_flush_young()/clear_flush_young_ptes()
>>    mm: change to return bool for pmdp_test_and_clear_young()
>>    mm: change to return bool for pmdp_clear_flush_young()
>>    mm: change to return bool for pudp_test_and_clear_young()
>>    mm: change to return bool for the MMU notifier's young flag check
>>
>>   arch/arm64/include/asm/pgtable.h             | 29 ++++----
>>   arch/arm64/mm/contpte.c                      |  8 +--
>>   arch/microblaze/include/asm/pgtable.h        |  2 +-
>>   arch/parisc/include/asm/pgtable.h            |  8 +--
>>   arch/parisc/kernel/cache.c                   |  8 +--
>>   arch/powerpc/include/asm/book3s/32/pgtable.h |  4 +-
>>   arch/powerpc/include/asm/book3s/64/pgtable.h | 26 +++----
>>   arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-
>>   arch/powerpc/include/asm/nohash/pgtable.h    |  4 +-
>>   arch/powerpc/mm/book3s64/pgtable.c           |  8 +--
> 
> I did compile and boot test on powerpc with various configs and overall
> it looks good.

Really appreciate your help with testing!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
