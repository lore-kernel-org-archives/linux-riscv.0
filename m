Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0985DC3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 07:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=abKe0QIdnIkvrg795r5ajWIUaaTOjfd/maCMGj68ncg=; b=G4fHD3VaXdWX0v
	I51B+0QAY5OLQHNiPect536poWsGL4V3afGdHm1fkt9GzvSM97X6Oxo2hQOUO6Q4OzoiIb7OXzhnK
	zXzdqAOEcgUp6vFH2Y7lEsEMVzaCMGXqDB1BvKhAGc6ufzFn5I9qhcz/DkIbmpFWnGE/9rMnlFOJ9
	nxo5JKH1DCW7rCuH8fN4Ijbkxq4t8qSBqgzV/YLg/CWBZeL52sXS6ewKcQwr046TV710buTrCGkW8
	KpQ+oZ11zpqHA921E2xaHBzoPyJ73uWUiawdEjNSPQK5CL0yCwPisHSSbOqyio2agGbQvKE6Pu6lJ
	3w1gw4oljaf7xsZOrCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVn6i-00000008e6Z-2LOQ;
	Mon, 22 Jul 2024 07:05:16 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVn6K-00000008dzK-0lqD;
	Mon, 22 Jul 2024 07:04:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WSB7M22WLzdjk9;
	Mon, 22 Jul 2024 15:02:55 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 582A518009B;
	Mon, 22 Jul 2024 15:04:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi100008.china.huawei.com (7.221.188.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 15:04:40 +0800
Message-ID: <32100260-53a3-cebc-9aaf-a94a6ac07793@huawei.com>
Date: Mon, 22 Jul 2024 15:04:39 +0800
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
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <Zp3-dZHhN7LbMggc@kernel.org>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi100008.china.huawei.com (7.221.188.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_000452_433309_E4E982B6 
X-CRM114-Status: GOOD (  17.16  )
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



On 2024/7/22 14:38, Mike Rapoport wrote:
> Hi,
> 
> On Mon, Jul 22, 2024 at 11:57:01AM +0800, Jinjie Ruan wrote:
>> Similar with x86_32, on Riscv32 Qemu "virt" machine with 1GB memory, the
>> crash kernel "crashkernel=4G" is ok as below:
>> 	crashkernel reserved: 0x00000000bf400000 - 0x00000001bf400000 (4096 MB)
>>
>> The cause is that the crash_size is parsed and printed with "unsigned long
>> long" data type which is 8 bytes but allocated used with "phys_addr_t"
>> which is 4 bytes in memblock_phys_alloc_range().
>>
>> Fix it by checking if the crash_size is greater than system RAM size and
>> warn out as parse_crashkernel_mem() do it if so.
>>
>> After this patch, it fails and there is no above confusing reserve
>> success info.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/riscv/mm/init.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index bfa2dea95354..5d66a4937fcd 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -1381,6 +1381,11 @@ static void __init arch_reserve_crashkernel(void)
>>  	if (ret)
>>  		return;
>>  
>> +	if (crash_size >= memblock_phys_mem_size()) {
>> +		pr_warn("Crashkernel: invalid size.");
>> +		return;
>> +	}
>> +
> 
> What the point of adding three identical checks right after the call to
> parse_crashkernel()?

Maybe you are right, the original version checks in parse_crashkernel
(), but there's a problem.

> 
> This check should be there and parse_crashkernel() should return error in
> this case.

Thank you very much, I'll fix it like this in v5.

> 
>>  	reserve_crashkernel_generic(cmdline, crash_size, crash_base,
>>  				    low_size, high);
>>  }
>> -- 
>> 2.34.1
>>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
