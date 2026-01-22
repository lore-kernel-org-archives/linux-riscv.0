Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A846CA5FD7
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 12:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Date:Subject:From:
	References:In-Reply-To:Message-Id:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P3qRfp6kbiOD9M2++U7hn4vUXoDeIc9DUiqStALtK0g=; b=kO7rIM1SJIrCZVqdqFknaZaDHZ
	Akx6NmqWVK2aiMCHqG6MLO4VKLPrpoL5+z3zVwihyK1evx6pJV8Bk/rcCsGI8Ud6MPwbw1Go/VUQT
	GX3m57dqhataHvQjcE1eEgL3NX2knBvnVipFYeBoUJtTFOeR8Fdi2G9sKzMQZzoi1ypJ62P2emvWS
	M7D4dhKR4jtvaw6duiJplXghM6kWTRaD7bIAXNiCri07ig6cZyoJ7OZ66nxfBR8vaA6YtxubpM2dP
	HE0Em2bO4L9j9N/1MV2MGDHcScPyfvqEY+GGsQzreTe/u9ALgAXEwQ2JWXFrIXljaVsYY2Obo5VFl
	HQwNblQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viu1y-000000074Kr-2CeZ;
	Thu, 22 Jan 2026 12:43:22 +0000
Received: from sg-1-40.ptr.blmpb.com ([118.26.132.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viu1u-000000074KK-2kwj
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 12:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1769085788;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=MyQlH88uNbS6AL1mNGr0EzjCJBAdtIs859QM7mQIV4E=;
 b=ioS81eNCpZj8Tg4xqHNq+3xwOH9vpBeGhii+oHAJKwq52QB4aPZODUtg1atsUrSw+55mm1
 08foZRAKxA04JjeKdAQXb4E7/UtqtBqW9XVKf3MeNoCzzE1IlrhK+OM6PKHhdVvbve/ULY
 xFJnfmyFFDWfGZy3du502okWQQAy1zgx7VKMfuAaZ7fEIXD0mYk0qkStE2J+wlANhR2jyu
 05l/DzubrFaaVXaibh0bLQWCx72SwBmaZ6z1QJXxlP68/ieB43yD7o8Sv8mTLqlteipKwP
 O1k11aMHiMsUzIUxE7wIk25UQ0aWwmNFIYFqjAmLD2+OyVqpLwM8+z1JtfZC3Q==
X-Lms-Return-Path: <lba+269721b5a+4434aa+lists.infradead.org+yang.yicong@picoheart.com>
Content-Language: en-US
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: <yang.yicong@picoheart.com>, <rafael@kernel.org>, <lenb@kernel.org>, 
	<tglx@kernel.org>, <dakr@kernel.org>, <akpm@linux-foundation.org>, 
	<apatel@ventanamicro.com>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <geshijian@picoheart.com>, 
	<weidong.wd@picoheart.com>, <linux-acpi@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Message-Id: <ca98b360-ea68-4edc-af3e-0a3f4f87fc21@picoheart.com>
In-Reply-To: <2026012214-dinginess-improper-9bc1@gregkh>
References: <20260122073446.45628-1-yang.yicong@picoheart.com> <20260122073446.45628-2-yang.yicong@picoheart.com> <2026012214-dinginess-improper-9bc1@gregkh>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Received: from [172.16.153.176] ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Thu, 22 Jan 2026 20:43:05 +0800
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH 1/2] ACPI: scan: Use async schedule function for acpi_scan_clear_dep_fn
Date: Thu, 22 Jan 2026 20:43:03 +0800
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_044319_311574_38B5FB74 
X-CRM114-Status: GOOD (  28.72  )
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

On 1/22/26 6:29 PM, Greg KH wrote:
> On Thu, Jan 22, 2026 at 03:34:45PM +0800, Yicong Yang wrote:
>> The device object rescan in acpi_scan_clear_dep_fn is scheduled
>> in the system workqueue which is not guaranteed to be finished
>> before entering userspace. This will cause the problem that
>> some key devices are missed when the init task try to find them,
>> e.g. console devices and root devices (PCIe nvme, etc).
>> This issues is more possbile to happen on RISCV since these
>> devices using GSI interrupt may depend on APLIC and will be
>> scanned in acpi_scan_clear_dep_queue() after APLIC initialized.
>>
>> Fix this by scheduling the acpi_scan_clear_dep_queue() using async
>> schedule function rather than the system workqueue. The deferred
>> works will be synchronized by async_synchronize_full() before
>> entering init task.
>>
>> Update the comment as well.
>>
>> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
>> ---
>>  drivers/acpi/scan.c | 35 ++++++++++++++++-------------------
>>  1 file changed, 16 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>> index 416d87f9bd10..bf0d8ba9ba19 100644
>> --- a/drivers/acpi/scan.c
>> +++ b/drivers/acpi/scan.c
>> @@ -5,6 +5,7 @@
>>  
>>  #define pr_fmt(fmt) "ACPI: " fmt
>>  
>> +#include <linux/async.h>
>>  #include <linux/module.h>
>>  #include <linux/init.h>
>>  #include <linux/slab.h>
>> @@ -2365,39 +2366,35 @@ struct acpi_scan_clear_dep_work {
>>  	struct acpi_device *adev;
>>  };
>>  
>> -static void acpi_scan_clear_dep_fn(struct work_struct *work)
>> +static void acpi_scan_clear_dep_fn(void *dev, async_cookie_t cookie)
>>  {
>> -	struct acpi_scan_clear_dep_work *cdw;
>> -
>> -	cdw = container_of(work, struct acpi_scan_clear_dep_work, work);
>> +	struct acpi_device *adev = to_acpi_device(dev);
>>  
>>  	acpi_scan_lock_acquire();
>> -	acpi_bus_attach(cdw->adev, (void *)true);
>> +	acpi_bus_attach(adev, (void *)true);
>>  	acpi_scan_lock_release();
>>  
>> -	acpi_dev_put(cdw->adev);
>> -	kfree(cdw);
>> +	acpi_dev_put(adev);
>>  }
>>  
>>  static bool acpi_scan_clear_dep_queue(struct acpi_device *adev)
>>  {
>> -	struct acpi_scan_clear_dep_work *cdw;
>> -
>>  	if (adev->dep_unmet)
>>  		return false;
>>  
>> -	cdw = kmalloc(sizeof(*cdw), GFP_KERNEL);
>> -	if (!cdw)
>> -		return false;
>> -
>> -	cdw->adev = adev;
>> -	INIT_WORK(&cdw->work, acpi_scan_clear_dep_fn);
>>  	/*
>> -	 * Since the work function may block on the lock until the entire
>> -	 * initial enumeration of devices is complete, put it into the unbound
>> -	 * workqueue.
>> +	 * Async schedule the deferred acpi_scan_clear_dep_fn() since:
>> +	 * - acpi_bus_attach() needs to hold acpi_scan_lock which cannot
>> +	 *   be acquired under acpi_dep_list_lock (held here)
>> +	 * - the deferred work at boot stage is ensured to be finished
>> +	 *   before entering init task by the async_synchronize_full()
>> +	 *   barrier
>> +	 *
>> +	 * Use _nocall variant since it'll return on failure instead of
>> +	 * run the function synchronously.
>>  	 */
>> -	queue_work(system_dfl_wq, &cdw->work);
>> +	if (!async_schedule_dev_nocall(acpi_scan_clear_dep_fn, &adev->dev))
>> +		return false;
> 
> This really feels wrong to me, you are taking a code path that has been
> working for quite a while and changing it.  Perhaps your system ACPI
> tables are the thing that is incorrect here?
> 
> What exactly is the problem that you are seeing?  Why not start with
> that and then we can work out how to solve that issue?
> 

two issues here we met (as briefly mentioned in the commit and cover letter):
1. kernel panic due to userspace init cannot have an opened console. the
   console device scanning is queued in the system_dfl_wq in above code
   and not finished by the time userspace init process running, thus by
   the time userspace init running, no console is created
2. entering rescue shell due to no root devices (PCIe nvme in our case)
   found. same reason as above, the PCIe host bridge scanning is queued
   in above and finished after init process running.

The reason why these devices are created here is because they both depend
on riscv-aplic irqchip to serve their interrupts (console's wired
interrupt and PCI's INTx interrupts) and in order to keep the dependency
these devices are scanned and created after riscv-aplic initialized. The
riscv-aplic is initialized in device_initcall and invoke above codes for
the scan/creation of these devices, it's close to the time running
userspace init process. Since system_dfl_wq is used here and no synchronized
mechanism, the issues will happen if userspace init runs before these devices
are ready.

Previous solution [1] is to advance the initialization of riscv-aplic
earlier but the order still cannot be guaranteed conceptually.
With async_schedule_dev_nocal() the work queued is finished
before entering userspace init since we'll wait for completion at
async_synchronize_full() before executing userspace init process.

To solve the issue I think we should make these devices ready before
entering userspace and async schedule is one way to make it. It's also
using an unbound workqueue but have additional synchronization. Any
corrections or suggestions?

[1] https://lore.kernel.org/linux-riscv/20260114063730.78009-1-yang.yicong@picoheart.com/

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
