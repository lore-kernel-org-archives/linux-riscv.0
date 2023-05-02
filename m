Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D69C77B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 05:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K57pHP7AhMCFaExpgUR0z3MgQF9H4q/rn9WAU6XHy9M=; b=WvdrLbwOHRFBez
	QI+NBkXAl232x1Su33Zy1Cf3ZSrEFqFTsf0VeDIpXa1vN7HpgzEBr/4YTN7zrv+aTJqc/Nk0fA2zb
	wSnW7nY97QizVWg/WMul9C2Cm3Kk9rREN6+lDy81NZFXv8ZmDw0WAJP+NlPeINbOZkBVRrtudRVdE
	D3HKkcGl+ISnlAykSVtjla2RObIe0eLnRzcvbSbHSw/MBAdnUp5ypFKNfAjgl96+JU1GcWlW+Fjxu
	F/suheFAw6LNQeXG/mqpG0qOMR1p2Csgs+PHN0wPQ/OnhumaG54W2tND3poDLki2WmBUOX5c3Xpg3
	hM5M65wSfU6NU7ZyL+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptitI-000GXQ-0X;
	Tue, 02 May 2023 05:49:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptitF-000GWJ-15
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 05:49:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E87B61830;
	Tue,  2 May 2023 05:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF34C433D2;
	Tue,  2 May 2023 05:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683006568;
	bh=XZgZAS0IJYvBCvNMmmrNBtsGeLXPqmq39HguoAr5Cpo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=WxNMR7Xjfz6JTdz5RI+4EngcKkVBosdrQjQyuyYPs/hfvKi6+XHNwlApSNVLqMT7B
	 qZNmXVo5ZRyXsCXkkf8azBqo9itm7mPel1GP2J1/BPD6sLqiR62awB5tWPSvz0/8sb
	 yVM89oRJRtK0AS5dIwH37gTHl62vHd2eHEX+rO4DS4nFhPTep0YGy/S/gM8Q3QjC2t
	 Ka2hR7IVmIau+YNM1lua7OGIIcJIw9PmzJYmhF0wvy2hQyM5kdn7etvlr/IY03h0sV
	 YP63JxxnCxXWEK4TMlK7TIgQHTEbBioqWCikRM08jrvTCn9KvmPXgtrjUVaPHGwELB
	 4szEjELLv5Bcg==
Date: Tue, 02 May 2023 06:49:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, akpm@linux-foundation.org,
 aneesh.kumar@linux.ibm.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_RISC-V=3A_fixup_in-flight_collis?= =?US-ASCII?Q?ion_with_ARCH=5FWANT=5FOPTIMIZE=5FVMEMMAP_rename?=
User-Agent: K-9 Mail for Android
In-Reply-To: <mhng-e1596f31-67bc-4e2e-b86e-a32da907eecd@palmer-ri-x1c9a>
References: <mhng-e1596f31-67bc-4e2e-b86e-a32da907eecd@palmer-ri-x1c9a>
Message-ID: <8BF847E5-B06F-49B0-81D8-E75A6A8D0AF7@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_224929_450851_DB67A95C 
X-CRM114-Status: GOOD (  15.06  )
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



On 1 May 2023 23:52:58 IST, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>On Sat, 29 Apr 2023 02:32:33 PDT (-0700), Conor Dooley wrote:
>> On Sat, Apr 29, 2023 at 10:27:33AM +0100, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>> 
>>> Lukas warned that ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP had been
>>> renamed in the mm tree & that RISC-V would need a fixup as part of the
>>> merge. The warning was missed however, and RISC-V is selecting the
>>> orphaned Kconfig option.
>>> 
>>> Fixes: 89d77f71f493 ("Merge tag 'riscv-for-linus-6.4-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux")
>>> Reported-by: Lukas Bulwhan <lukas.bulwhan@gmail.com>
>> 
>> That should have been Lukas Bulwahn <lukas.bulwahn@gmail.com>.
>
>I think I got that right, but the email bounced.  I'm not sure if it's just the list issues, though.

B4 probably just replied to the address in my original email,
rather than the corrected one?

>
>> This is what I get for hand-typing an email address that I could have
>> copied from lore I suppose.
>> 
>>> Link: https://lore.kernel.org/linux-riscv/CAKXUXMyVeg2kQK_edKHtMD3eADrDK_PKhCSVkMrLDdYgTQQ5rg@mail.gmail.com/
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> I guess you picking this up for your second PR makes the most sense
>>> Palmer?
>>> 
>>> CC: Palmer Dabbelt <palmer@dabbelt.com>
>>> CC: Linus Torvalds <torvalds@linux-foundation.org>
>>> CC: Andrew Morton <akpm@linux-foundation.org>
>>> CC: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> CC: Lukas Bulwhan <lukas.bulwhan@gmail.com>
>>> CC: linux-riscv@lists.infradead.org
>>> CC: linux-kernel@vger.kernel.org
>>> ---
>>>  arch/riscv/Kconfig | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index 5c88ac4b52be..e1bdb3fb16cc 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -46,9 +46,9 @@ config RISCV
>>>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>>>  	select ARCH_WANT_FRAME_POINTERS
>>>  	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT
>>> -	select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>>>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>>>  	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
>>> +	select ARCH_WANT_OPTIMIZE_VMEMMAP
>>>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>>>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>>>  	select BUILDTIME_TABLE_SORT if MMU
>>> -- 
>>> 2.39.2
>>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
