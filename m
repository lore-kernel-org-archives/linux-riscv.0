Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33038C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZTUhUDXo+vGevriSToawW4Z2SRGbBPqNJL/vZQ5FVM=; b=Jt0+wpOr6fbTCM
	7gFj4Ly3V/AzTIFndCIQ19FMRQq8RsfIhCgr9KnH/06QuDpcBSuoonRuGRQ6TcEelygaT8wg3k5+n
	GUNEPZ2F67zbLvQ2yv/BbqOJq8byOXxGtcGizQE5JZlOOI0wBqZkCJ2MpNnfIQjw+L57LIc7w00kF
	7dx5o7+729aadstlXEEV8085ELE47bGo9K7GfIaRWaYinXer3rSzcsyQ0PNrc0fU25xpXyBHNCKef
	tgSa59oq1S7F8fZYJIWP2L+YGWfkSWZXtb5Sg7aH8MvVOSNmMJWdVFb6YlvJW+8mIHrWEsx8teGrY
	kyNEhDjen9LsuXGdO4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZH8-002nGm-Lj; Fri, 24 Feb 2023 14:42:18 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZH6-002nGK-0T
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 14:42:17 +0000
Received: from [167.98.27.226] (helo=[10.35.4.85])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pVZH2-008Zw5-7Z; Fri, 24 Feb 2023 14:42:12 +0000
Message-ID: <d9944799-7887-8c0b-ace1-7b340dacf9af@codethink.co.uk>
Date: Fri, 24 Feb 2023 14:42:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] RISC-V: Fixup clear_page export when using Zicboz
Content-Language: en-GB
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
 Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
References: <20230221190916.572454-7-ajones@ventanamicro.com>
 <20230224135844.619054-1-ben.dooks@codethink.co.uk>
 <20230224141812.nftdkbtt4gbgvnts@orel>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230224141812.nftdkbtt4gbgvnts@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_064216_077620_7DB6312A 
X-CRM114-Status: GOOD (  20.68  )
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

On 24/02/2023 14:18, Andrew Jones wrote:
> On Fri, Feb 24, 2023 at 01:58:44PM +0000, Ben Dooks wrote:
>> When the clear_page() via Zicboz is enabled, the module build
>> fails as clear_page() is not marked as a ksym entry. Fix this
>> by changing the asm code to use <asm-generic/export.h> to add
>> the correct export.
>>
>> Also remove the weak clear_page() as there's nothing else in
>> the build defining this symbol, so just make it the entry when
>> the Zicboz is enabled.
>>
>> Fixes modpost errors such as this:
>> ERROR: modpost: "clear_page" [drivers/gpu/drm/ttm/ttm.ko] undefined!
>>
>> Reported-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   arch/riscv/lib/clear_page.S | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
>> index 7c7fa45b5ab5..4ed5fef52d80 100644
>> --- a/arch/riscv/lib/clear_page.S
>> +++ b/arch/riscv/lib/clear_page.S
>> @@ -6,6 +6,7 @@
>>   #include <linux/linkage.h>
>>   #include <asm/asm.h>
>>   #include <asm/alternative-macros.h>
>> +#include <asm-generic/export.h>
>>   #include <asm/hwcap.h>
>>   #include <asm/insn-def.h>
>>   #include <asm/page.h>
>> @@ -17,7 +18,7 @@
>>   
>>   /* void clear_page(void *page) */
>>   ENTRY(__clear_page)
>> -WEAK(clear_page)
>> +SYM_FUNC_START(clear_page)
>>   	li	a2, PAGE_SIZE
>>   
>>   	/*
>> @@ -70,4 +71,5 @@ WEAK(clear_page)
>>   .Lno_zicboz:
>>   	li	a1, 0
>>   	tail	__memset
>> -END(__clear_page)
>> +SYM_FUNC_END(clear_page)
>> +EXPORT_SYMBOL(clear_page)
>> -- 
>> 2.39.1
>>
> 
> Hi Ben,
> 
> This looks good to me. I agree that I shouldn't have made clear_page weak,
> but not because there isn't currently anything else defining it, but
> because it's not something a subsystem is likely to ever define. Exporting
> for modules is also definitely needed.
> 
> Is there any reason I shouldn't just squash this into the patch which
> introduces clear_page? That patch is still under review, and merging
> it broken just to immediately fix it would break bisection for no reason.

Yeah, as long as you note fixes from myself an sudip, then go for it.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
