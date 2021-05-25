Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4716C2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 16:10:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68CC561378
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 16:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68CC561378
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PdGnSvjYlU7pQw0nWzTtgNryBVLH/nMasW0q2MF4YcY=; b=hiSWmbdJeOPyk/Q/cuChqenInl
	5LjwapSim4fWNErjclO6pRyw9OQyCbrIAZ+0Ixq6NC7mOJGmEMvRT0IonhUoH5hiRsjjRsJbj1KMH
	+NnU9H4DEQTdLD/QA7Za9cGZDxb58o78h8qE7Kows1LJVz5kw19HFFTn99M4j6dCQMlX1GSdt6Yag
	TeyyNF9GgFpHwLH3DkbEASp4qjasfwnlzz2Fw3ztdkI6JkJStnc/Yd4A9KQTn0W0oOpCGNzkTeTza
	kLjNpG0+q8vAX8av6W20zpUc6wX18dI0bi9+q2D9hpdApzuajkSBoUP/TYgB+WZ8Y62GO0faiR0Nx
	ag6LUDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llZdL-006I1r-4h; Tue, 25 May 2021 16:10:19 +0000
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llZAD-0064rZ-AI; Tue, 25 May 2021 15:40:13 +0000
Subject: Re: [PATCH -next] riscv: TRANSPARENT_HUGEPAGE: depends on MMU
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Nanyong Sun <sunnanyong@huawei.com>
References: <20210525001302.27779-1-rdunlap@infradead.org>
 <YKzSdtoaeL9mfokF@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a2953d37-aaf3-3db5-f4a3-488a8ca7f245@infradead.org>
Date: Tue, 25 May 2021 08:40:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YKzSdtoaeL9mfokF@kernel.org>
Content-Language: en-US
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

On 5/25/21 3:33 AM, Mike Rapoport wrote:
> On Mon, May 24, 2021 at 05:13:02PM -0700, Randy Dunlap wrote:
>> Fix a Kconfig warning and many build errors:
>>
>> WARNING: unmet direct dependencies detected for COMPACTION
>>   Depends on [n]: MMU [=n]
>>   Selected by [y]:
>>   - TRANSPARENT_HUGEPAGE [=y] && HAVE_ARCH_TRANSPARENT_HUGEPAGE [=y]
>>
>> and the subseqent thousands of build errors and warnings.
>>
>> Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-riscv@lists.infradead.org
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Nanyong Sun <sunnanyong@huawei.com>
> 
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> 
>> ---
>> I really think that mm/Kconfig should have "depends on MMU" for
>> TRANSPARENT_HUGEPAGE, but commit 15626062f4a9 from 2012
>> ("thp, x86: introduce HAVE_ARCH_TRANSPARENT_HUGEPAGE") thought
>> differently. I.e., mm/Kconfig should be protecting all arches
>> against this Kconfig problem.
> 
> We could 
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 02d44e3420f5..85bc8bf32e7b 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -403,7 +403,7 @@ config NOMMU_INITIAL_TRIM_EXCESS
>  
>  config TRANSPARENT_HUGEPAGE
>  	bool "Transparent Hugepage Support"
> -	depends on HAVE_ARCH_TRANSPARENT_HUGEPAGE
> +	depends on MMU && HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select COMPACTION
>  	select XARRAY_MULTI
>  	help
> 
> but in a sense HAVE_ARCH_TRANSPARENT_HUGEPAGE should imply that MMU is
> selected :)

Yes, I had this patch before the one that I sent but decided against it
based on history.

>>  arch/riscv/Kconfig |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --- linux-next-20210524.orig/arch/riscv/Kconfig
>> +++ linux-next-20210524/arch/riscv/Kconfig
>> @@ -106,7 +106,7 @@ config RISCV
>>  	select SYSCTL_EXCEPTION_TRACE
>>  	select THREAD_INFO_IN_TASK
>>  	select UACCESS_MEMCPY if !MMU
>> -	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT
>> +	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
>>  
>>  config ARCH_MMAP_RND_BITS_MIN
>>  	default 18 if 64BIT
>>
> 

thanks.
-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
