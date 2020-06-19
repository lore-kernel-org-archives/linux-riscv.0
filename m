Return-Path: <SRS0=nier=AA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D7CC433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2020 01:35:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 479822071A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2020 01:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pd0nE/yn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 479822071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qktueNLzgq6WJX4e8KgnMr6JPDxbZcZiALEY/3ND3Cw=; b=Pd0nE/ynxakx0/
	7btr1A3YjvW6AjNxWmVPLhgmyCW+WA96on6Hs3AfRxrbroj2FNix4uMPDJ7HyVw45D9QgnoMwnnMd
	CZkSTJ/wrRNE1altK7lW6NqBYesA4Y9zwXrkr3dQzgCaLpr4GmbyaBYE8sUfV6bV3KyV9apJ5bU2e
	wX+4pEXtuajYSdxfIJP+wrfhQjRKOKWHt8uHGmt3hAVuIvINtI7dkDeKDtmQUNnq10KDEnIkoBUTY
	Conpc0sGr1PyOWnBm1W2ooWXjuDSKt9T0r+3zjWJ+s00bocv6FPSbZ1oVdcMYC7Pu81UG3wdc5C3h
	MXkBhP2cf0M/hXIQ/ZMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jm5w4-0002Rl-2m; Fri, 19 Jun 2020 01:35:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jm5vj-0008I5-3r; Fri, 19 Jun 2020 01:34:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 238DFD6E;
 Thu, 18 Jun 2020 18:34:50 -0700 (PDT)
Received: from [10.163.81.119] (unknown [10.163.81.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 216703F73C;
 Thu, 18 Jun 2020 18:34:41 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V3 (RESEND) 0/3] arm64: Enable vmemmap mapping from device
 memory
To: Mike Rapoport <rppt@linux.ibm.com>
References: <1592442930-9380-1-git-send-email-anshuman.khandual@arm.com>
 <20200618085641.GE6493@linux.ibm.com>
Message-ID: <27f8c6f9-3970-6f02-dff4-7ca15bee7138@arm.com>
Date: Fri, 19 Jun 2020 07:04:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200618085641.GE6493@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_183455_198107_69A0327A 
X-CRM114-Status: GOOD (  13.20  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 06/18/2020 02:26 PM, Mike Rapoport wrote:
> On Thu, Jun 18, 2020 at 06:45:27AM +0530, Anshuman Khandual wrote:
>> This series enables vmemmap backing memory allocation from device memory
>> ranges on arm64. But before that, it enables vmemmap_populate_basepages()
>> and vmemmap_alloc_block_buf() to accommodate struct vmem_altmap based
>> alocation requests.
>>
>> This series applies on 5.8-rc1.
>>
>> Pending Question:
>>
>> altmap_alloc_block_buf() does not have any other remaining users in
>> the tree after this change. Should it be converted into a static
>> function and it's declaration be dropped from the header
>> (include/linux/mm.h). Avoided doing so because I was not sure if there
>> are any off-tree users or not.
> 
> Well, off-tree users probably have an active fork anyway so they could
> switch to vmemmap_alloc_block_buf()...

Sure, will make the function a static and remove it's declaration
from the header.

> 
> Regardless, can you please update Documentation/vm/memory-model.rst to
> keep it in sync with the code?
Sure, will do.

