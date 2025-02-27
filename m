Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AAEC021B8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 00:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCSn+wFYJSv4+YkAZedSs/WGwx9Udi/yAc3Jbn6F0bM=; b=dPRsb/3xtjXnzb
	JOcLN5HFDbJa6Zq8saJuAWZv2KwGu5gaCD/IDD4/PaBElhZlE3QtQapfEZVKUQsgaGJeD+Km0LfvN
	C/Rl+384YybAtpLYvLhe1b11TnT07NZ7JNoKdFZDwBiGp9+tegnP1kWftTDX+7STrEv6DEwuAGUCz
	zSvDrFMZVUHOD+1Vwakm9mWYThqmyVVXufnkh4TluK+VmKCHIuZ7lIt8Xlx8sCgHxI4c8GbjmQ2oM
	4fUOd/kq7wRf4WZHaPQqOdXexAPFj0UJoRElh7J/urocXsj6OMDVS2GHiiK3C+mbbF6qfWSP/+XlE
	YSEPDTv9gHXi488xvewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRRj-00000005m61-1HzA;
	Thu, 27 Feb 2025 00:08:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRQ9-00000005lp1-3Vp1;
	Thu, 27 Feb 2025 00:06:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5564812FC;
	Wed, 26 Feb 2025 16:06:48 -0800 (PST)
Received: from [10.163.39.237] (unknown [10.163.39.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2DD63F5A1;
	Wed, 26 Feb 2025 16:06:25 -0800 (PST)
Message-ID: <39986b7d-7a82-4f28-9289-5620a2bec2b5@arm.com>
Date: Thu, 27 Feb 2025 05:36:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-6-anshuman.khandual@arm.com>
 <Z79xK3xJWm0vH5jH@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z79xK3xJWm0vH5jH@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_160633_924520_F6D130D5 
X-CRM114-Status: GOOD (  11.31  )
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

 

On 2/27/25 01:23, Catalin Marinas wrote:
> On Wed, Feb 26, 2025 at 05:54:04PM +0530, Anshuman Khandual wrote:
>> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
>> index 6cf4aae05219..b2931d1ae0fb 100644
>> --- a/arch/arm64/include/asm/ptdump.h
>> +++ b/arch/arm64/include/asm/ptdump.h
>> @@ -7,7 +7,7 @@
>>  
>>  #include <linux/ptdump.h>
>>  
>> -#ifdef CONFIG_PTDUMP_CORE
>> +#ifdef CONFIG_PTDUMP
> 
> Do we need this #ifdef at all? I haven't tried but usually, if the
> feature is not enabled, the header file on its own should be harmless.

With or without the #ifdef CONFIG_PTDUMP in place here, this does not cause
any build warnings even without CONFIG_PTDUMP enabled. But dropping #ifdef
while renaming the config option itself, might have caused unrelated code
churn. So probably if required we could drop this later on.

> 
> For arm64:
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
