Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94E0D3EE64
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 13:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:To:References:Date:
	In-Reply-To:Mime-Version:From:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgQdC0JAi8fSxeHhp5tBP7B67ZG1Gi8N+9iR2efe4BI=; b=PvRP6XCATGTeGE
	EtKWQN1v0s87vP7kvA83p2z3U/MUl1XPQ+p+iFEZO+eVAvV4LL3RycmncNZvVoJU+kRprVrQGWa5m
	OiWSTl5n1K/HnRj73Kac/VdXeX9VkslCHQmqwe9HZGyKf37k7LN3yX+N0ja6OGkMKN1crIQBI9/30
	xqH+kvIReOsTXAsEcPL32LXUNkDJ86hOKldQa6/L6r/fjrIv42CfHbmTADRHJNXvpPVRiyhSFcLIR
	d7eRZorDIhh2BDamFWnGxybzx6IV6O8BLyGjRXeFVlCkskECyV+CBbzKWMB061GiPfH2rAGnsckW6
	7j7zBunc02uSXieWmgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuUL-000000077I8-2yiM;
	Thu, 22 Jan 2026 13:12:41 +0000
Received: from sg-1-33.ptr.blmpb.com ([118.26.132.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuUI-000000077HZ-2ohf
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 13:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1769087549;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=f7QYobkxi6HcZ0Aps3gy5GVXa+QXQrVxnQUGcneSwxc=;
 b=oZiGLPffnq3E/D/EjZA7jE+924XdtEg+DMIoKEvlmgqcCS5qj7mTiMcqY4W48TBP4m8skK
 Grct+NxX7NdewmLBwcvHl5fyjQ3NauV2j1SsrwHFjbKauRmxRC4jLNHr4TQhc+xH2thioS
 m2PRBntRsKDkA8xOVUebGaVKyVWKcZGvCZaZVH88hYrQzLBIJlel5mzQeEmiroBeU1Zz4V
 2zAMDCsb+ifLv63RaIv+F3Pavro+fpfHpK7faaAOzzzYTZCyauz6blHMrIGUO1rxB6iTUF
 Lhbf3/L7SbR8er6JPQ6JJGtMhCdbxozO+hEvLrknyb7nGfDyHFzOnSIVrg2SQQ==
Content-Language: en-US
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Cc: <yang.yicong@picoheart.com>, <rafael@kernel.org>, <lenb@kernel.org>, 
	<tglx@kernel.org>, <dakr@kernel.org>, <akpm@linux-foundation.org>, 
	<apatel@ventanamicro.com>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <geshijian@picoheart.com>, 
	<weidong.wd@picoheart.com>, <linux-acpi@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Mime-Version: 1.0
In-Reply-To: <2026012217-opium-grit-2295@gregkh>
Date: Thu, 22 Jan 2026 21:12:24 +0800
References: <20260122073446.45628-1-yang.yicong@picoheart.com> <20260122073446.45628-3-yang.yicong@picoheart.com> <2026012217-opium-grit-2295@gregkh>
Received: from [172.16.153.176] ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Thu, 22 Jan 2026 21:12:27 +0800
To: "Greg KH" <gregkh@linuxfoundation.org>
X-Lms-Return-Path: <lba+26972223b+49c3aa+lists.infradead.org+yang.yicong@picoheart.com>
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] init: Move console_on_rootfs after async_synchronize_full
Message-Id: <6969336d-3c26-4a21-ac44-d620b549f278@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_051239_266604_088F7D49 
X-CRM114-Status: GOOD (  26.88  )
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

On 1/22/26 6:27 PM, Greg KH wrote:
> On Thu, Jan 22, 2026 at 03:34:46PM +0800, Yicong Yang wrote:
>> Currently the console_on_rootfs() is called before
>> async_synchronize_full(), the console initialization
>> could be still in process in theory due to async
>> probe, etc. Make it after the async_synchronize_full()
>> to make sure the initialization work is done.
> 
> Please wrap at 72 columns.
> 
>>
>> Log the error code as well if we failed to open the console.
>>
>> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
>> ---
>>  init/main.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/init/main.c b/init/main.c
>> index b84818ad9685..c37ba5f89b96 100644
>> --- a/init/main.c
>> +++ b/init/main.c
>> @@ -1578,6 +1578,7 @@ static int __ref kernel_init(void *unused)
>>  	kernel_init_freeable();
>>  	/* need to finish all async __init code before freeing the memory */
>>  	async_synchronize_full();
>> +	console_on_rootfs();
> 
> Are you sure this is ok?  Messing around with init levels and order is
> _VERY_ tricky.
> 

It's previously in kernel_init_freeable() after do_basic_setup() (where
initcalls invoked). So moving it here the init levels and order is
unchanged (still after the do_basic_setup).

Tested with initrd (ramdisk) and initramfs made by busybox and works fine
(hope no other scenarios missed).


> Your console should NOT be on an async probe path, if you really need
> it, then do not do that at all.  Make it sync, and then it should be ok.
> 

not for my console. it's a theoretical issue during the last discussion but
I did try to make this happened (by make the probe async and add some delay
in the probe to simulate a slow initialization).

since indeed no real problem I met and if consider it should never happen in
real case, should we just leave it as is?

>>  
>>  	system_state = SYSTEM_FREEING_INITMEM;
>>  	kprobe_free_init_mem();
>> @@ -1647,7 +1648,7 @@ void __init console_on_rootfs(void)
>>  	struct file *file = filp_open("/dev/console", O_RDWR, 0);
>>  
>>  	if (IS_ERR(file)) {
>> -		pr_err("Warning: unable to open an initial console.\n");
>> +		pr_err("Warning: unable to open an initial console, err = %ld\n", PTR_ERR(file));
> 
> Why is this changed?
> 

This is a trivial change so I didn't make a separate patch. I suppose it's
useful since I did see different errors (ENOENT, ENODEV) when make cases
for testing this patch and we've already have the err code returned here.

>>  		return;
>>  	}
>>  	init_dup(file);
>> @@ -1690,7 +1691,6 @@ static noinline void __init kernel_init_freeable(void)
>>  	kunit_run_all_tests();
>>  
>>  	wait_for_initramfs();
>> -	console_on_rootfs();
> 
> You just delayed the console output for many (i.e. most) systems out
> there, are you sure that is acceptable to them?
> 

IIUC, console_on_rootfs() will open /dev/console for userspace's
stdout/stdin/stderr and kernel log (printk, etc) won't be affected
by its order.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
