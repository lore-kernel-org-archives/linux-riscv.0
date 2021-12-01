Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A49C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 11:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JazSwehPwzGDi0w/KgQGJylgNRjIE3ld9bFKhJitqPQ=; b=gAkG5yCuFBk546arM/KXB9zDPf
	dMsemxZzJUIJFfxNNa1bM8cRRAUdQW/y7HkvCF2KLEnSucPrbS346fe3Ph/uGx4cO7zEFKSCkdpOg
	tPLV6GnmRmX3+FVWiUOQszXTKq1rHyJisSkftB87k5gBmAeyoo7SpGgUamVeUwUDocNw3VTTK4/61
	kjgOWYvaEXz7Mu7bPAAfEZ3HTx326uEPu7yFzX0NpdSisy++0zDph4AGst8AMJM9lBVu9gUIX6NVb
	uUTBS9CwgZTmN0VQUiSYcb/xxlgDDG6qo+1D1yBFZ5uZDhDBXiiQFVGPeKaMLqiiyck8s1rJ3q67z
	gLlU0KKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msO8l-008H0R-RZ; Wed, 01 Dec 2021 11:51:11 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msO8j-008Gys-8e
 for linux-riscv@lists.infradead.org; Wed, 01 Dec 2021 11:51:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF60A11B3;
 Wed,  1 Dec 2021 03:51:07 -0800 (PST)
Received: from [10.57.0.220] (unknown [10.57.0.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E8A13F694;
 Wed,  1 Dec 2021 03:51:04 -0800 (PST)
Subject: Re: [PATCH] percpu: km: ensure it is used with NOMMU (either UP or
 SMP)
To: Dennis Zhou <dennis@kernel.org>
Cc: linux-arch-owner@vger.kernel.org, linux-mm@kvack.org, tj@kernel.org,
 cl@linux.com, akpm@linux-foundation.org, npiggin@gmail.com, hch@lst.de,
 arnd@arndb.de, linux-sh@vger.kernel.org, dalias@libc.org,
 linux-riscv@lists.infradead.org
References: <20211130172954.129587-1-vladimir.murzin@arm.com>
 <20211130172954.129587-2-vladimir.murzin@arm.com> <YaZiOnNd6fAnLcxz@fedora>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <8c2b4666-cf13-3735-be1e-b8a1c71df113@arm.com>
Date: Wed, 1 Dec 2021 11:51:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YaZiOnNd6fAnLcxz@fedora>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_035109_412125_9FC3C37D 
X-CRM114-Status: GOOD (  20.11  )
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

Hi,

On 11/30/21 5:41 PM, Dennis Zhou wrote:
> Hello,
> 
> On Tue, Nov 30, 2021 at 05:29:54PM +0000, Vladimir Murzin wrote:
>> Currently, NOMMU pull km allocator via !SMP dependency because most of
>> them are UP, yet for SMP+NOMMU vm allocator gets pulled which:
>>
>> * may lead to broken build [1]
>> * ...or not working runtime due to [2]
>>
>> It looks like SMP+NOMMU case was overlooked in bbddff054587 ("percpu:
>> use percpu allocator on UP too") so restore that.
>>
>> [1]
>> For ARM SMP+NOMMU (R-class cores)
>>
>> arm-none-linux-gnueabihf-ld: mm/percpu.o: in function `pcpu_post_unmap_tlb_flush':
>> mm/percpu-vm.c:188: undefined reference to `flush_tlb_kernel_range'
>>
>> [2]
>> static inline
>> int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>>                 pgprot_t prot, struct page **pages, unsigned int page_shift)
>> {
>>        return -EINVAL;
>> }
>>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  mm/Kconfig | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index d16ba92..66331e0 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -425,9 +425,8 @@ config THP_SWAP
>>  # UP and nommu archs use km based percpu allocator
>>  #
>>  config NEED_PER_CPU_KM
>> -	depends on !SMP
>>  	bool
>> -	default y
>> +	default !SMP || !MMU
>>  
> 
> Should this be `depends on !SMP || !MMU` with default yes? Because with
> SMP && MMU, it shouldn't be an option to run with percpu-km.

IIUC these are equivalent, truth table would not change if is under "depends"
or "default"

SMP    MMU   NEED_PER_CPU_KM
 y      y    !y || !y => n || n => n
 y      n    !y || !n => n || y => y
 n      y    !n || !y => y || n => y
 n      n    !n || !n => y || y => y

> 
>>  config CLEANCACHE
>>  	bool "Enable cleancache driver to cache clean pages if tmem is present"
>> -- 
>> 2.7.4
>>
> 
> It's interesting to me that this is all coming up at once. Earlier this
> month I had the same conversation with people involved with sh [1].
> 
> [1] https://lore.kernel.org/linux-sh/YY7tp5attRyK42Zk@fedora/
> 
> I can pull this shortly once I see whatever happened to linux-sh.

Ahh, good to know! Adding SH folks here (start of discussion [0]). I see you came
to the same conclusion, right? 

IIRC, RISC-V also have SMP+NOMMU, so adding them as well.

[0] https://lore.kernel.org/linux-mm/20211130172954.129587-1-vladimir.murzin@arm.com/T/

Cheers
Vladimir

> 
> Thanks,
> Dennis
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
