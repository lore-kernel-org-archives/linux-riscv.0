Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC4DC3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 07:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHkeYeJjdUNhuHB3LKTFgSa50g4mKmxGZHcsFY85OsM=; b=JH1QQRrVPah9Uc
	5mDpNRGl2I1t0hTJxOuPY8IH7eNl7Et4ooTVht0hBpt1zMvPmNPmrKELxNHFXyIFdBKMeHX6lAM0o
	K/QTMDIZqHA0G0vWRzbcQ5wIl88a7rxI0h4QIzCPwa6wbfzIHC7GgEpg5Qlrs1rwKWxvku2YcIlns
	H92JzNNSIrQJHUf71IKHk+yGuOfh0Kgvbb3xBMuwG1rVuPnVmHcMtgtiWufG5SilIRey/pt26jBpW
	LUJQwOmY4kHQWvlW9YINWUmYzTLyxvtEjEOrrDL+P3k52EX+w/c2oLP61xA3MiL3FNLZXei/BS/op
	GFMuyG9jJy/+n6MJjaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnoL-00000008lSd-12UU;
	Mon, 22 Jul 2024 07:50:21 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnnx-00000008lMw-0HrP;
	Mon, 22 Jul 2024 07:49:59 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WSC3l6QmQz1JDK2;
	Mon, 22 Jul 2024 15:44:51 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 16FC31402CE;
	Mon, 22 Jul 2024 15:49:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi100008.china.huawei.com (7.221.188.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 15:49:48 +0800
Message-ID: <f0cc1bc6-8fc0-d4a3-0aca-1f3576fa072d@huawei.com>
Date: Mon, 22 Jul 2024 15:49:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4 3/3] riscv: kdump: Fix crash memory reserve exceed
 system memory bug
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>
CC: <linux@armlinux.org.uk>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <deller@gmx.de>,
	<javierm@redhat.com>, <bhe@redhat.com>, <robh@kernel.org>,
	<alexghiti@rivosinc.com>, <bjorn@rivosinc.com>, <akpm@linux-foundation.org>,
	<namcao@linutronix.de>, <dawei.li@shingroup.cn>, <chenjiahao16@huawei.com>,
	<julian.stecklina@cyberus-technology.de>, <rafael.j.wysocki@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240722035701.696874-1-ruanjinjie@huawei.com>
 <20240722035701.696874-4-ruanjinjie@huawei.com> <Zp3-dZHhN7LbMggc@kernel.org>
 <5816d4d5-e038-c90b-5ac2-1a3b3a8b9e46@huawei.com>
 <Zp4JCmiZgGZ8jq-b@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <Zp4JCmiZgGZ8jq-b@kernel.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_004957_481304_C7231A41 
X-CRM114-Status: GOOD (  15.69  )
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



On 2024/7/22 15:23, Mike Rapoport wrote:
> On Mon, Jul 22, 2024 at 03:08:29PM +0800, Jinjie Ruan wrote:
>>
>>
>> On 2024/7/22 14:38, Mike Rapoport wrote:
>>> Hi,
>>>
>>> On Mon, Jul 22, 2024 at 11:57:01AM +0800, Jinjie Ruan wrote:
>>>> Similar with x86_32, on Riscv32 Qemu "virt" machine with 1GB memory, the
>>>> crash kernel "crashkernel=4G" is ok as below:
>>>> 	crashkernel reserved: 0x00000000bf400000 - 0x00000001bf400000 (4096 MB)
>>>>
>>>> The cause is that the crash_size is parsed and printed with "unsigned long
>>>> long" data type which is 8 bytes but allocated used with "phys_addr_t"
>>>> which is 4 bytes in memblock_phys_alloc_range().
>>>>
>>>> Fix it by checking if the crash_size is greater than system RAM size and
>>>> warn out as parse_crashkernel_mem() do it if so.
>>>>
>>>> After this patch, it fails and there is no above confusing reserve
>>>> success info.
>>>>
>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>> ---
>>>>  arch/riscv/mm/init.c | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>>>> index bfa2dea95354..5d66a4937fcd 100644
>>>> --- a/arch/riscv/mm/init.c
>>>> +++ b/arch/riscv/mm/init.c
>>>> @@ -1381,6 +1381,11 @@ static void __init arch_reserve_crashkernel(void)
>>>>  	if (ret)
>>>>  		return;
>>>>  
>>>> +	if (crash_size >= memblock_phys_mem_size()) {
>>>> +		pr_warn("Crashkernel: invalid size.");
>>>> +		return;
>>>> +	}
>>>> +
>>>
>>> What the point of adding three identical checks right after the call to
>>> parse_crashkernel()?
>>>
>>> This check should be there and parse_crashkernel() should return error in
>>> this case.
>>
>> Hi, Mike
>>
>> How about the folling rough patch?
>>
>> --- a/kernel/crash_reserve.c
>> +++ b/kernel/crash_reserve.c
>> @@ -313,7 +313,7 @@ int __init parse_crashkernel(char *cmdline,
>>         if (high && ret == -ENOENT) {
>>                 ret = __parse_crashkernel(cmdline, 0, crash_size,
>>                                 crash_base, suffix_tbl[SUFFIX_HIGH]);
>> -               if (ret || !*crash_size)
>> +               if (ret || !*crash_size || crash_size >= system_ram)
>>                         return -EINVAL;
>>
>>                 /*
>> @@ -332,7 +332,7 @@ int __init parse_crashkernel(char *cmdline,
>>                 *high = true;
>>         }
>>  #endif
>> -       if (!*crash_size)
>> +       if (!*crash_size || crash_size >= system_ram)
>>                 ret = -EINVAL;
>>
> 
> Why no simply
> 
> diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
> index 5b2722a93a48..64312709877d 100644
> --- a/kernel/crash_reserve.c
> +++ b/kernel/crash_reserve.c
> @@ -336,6 +336,9 @@ int __init parse_crashkernel(char *cmdline,
>  	if (!*crash_size)
>  		ret = -EINVAL;
>  
> +	if (*crash_size >= system_ram)
> +		ret = -EINVAL;
> +
>  	return ret;

This is good, thank you!

>  }
>  
>  
>>>
>>>>  	reserve_crashkernel_generic(cmdline, crash_size, crash_base,
>>>>  				    low_size, high);
>>>>  }
>>>> -- 
>>>> 2.34.1
>>>>
>>>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
