Return-Path: <SRS0=fYNd=P2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A30BC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 02:10:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3A120855
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 02:10:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mA76yjMe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="I99vFNxB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3A120855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zCApZ3hc10ED3nLNO/xec+JJX9iZ4S9xLY4VBn9P4u4=; b=mA76yjMePBptoAu7BVFALUFMe
	FAkozCq5gh1xshOzOkasN7ypg9DawMXXDcOBS/kM5jtqg+sM6O0jgIFtGA8A+T5Nh5TKy5VaT77U1
	Fg0lHed0h9ZXFVRDqO4Lxe8sI7JLodCkk6EJZP4XzhERhAcBL4UETy+N6ZIaM+49ij3fdZPB22Ac2
	OlPxrr4ZDPP74//w6t3nJB36tTR9NDL/qISH7xZGYh8UtAr+eOfjZKlp0mfkGmwkUltTzVYg1qrcw
	vbDdyYVji2jC9b/0+wh7zbItte1T6KSJpRERQ+W6B1C+FXlMWpgwD/OpAqiX33QU4fmp6fpAdcj9x
	dHl7Y5/cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkJbp-0004SP-5k; Fri, 18 Jan 2019 02:10:13 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkJbl-0003VH-II
 for linux-riscv@lists.infradead.org; Fri, 18 Jan 2019 02:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1547777409; x=1579313409;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3UlpWrGy5l0hFV1x1u49o8+zyWo/VDTedhrwg8pOEms=;
 b=I99vFNxBpAXTaOKy5a4gYYx2nXTbUS4nCrTRM4wa74K7FNOlGZBuVXdf
 8pCOt7qhdkHHETglgEfV35SHtP4Wi5pygxehyNlNohcZ20DrP8rfcN1bF
 7eWf3vwksNaEmxp9+YjsoeUFmETi6foHKjDf4ZcSBw9NS95Dv1z3RjEL7
 3xRh4SXxNlestiLNebmEz0HQQbVZ48PNc4P7RHAVPsmB3rEfykykFXCub
 GdPgfCl08fXnp7FZ7slet9srERwQFF/zgRA/RenG4SMWxPK/Pcs15vnTG
 14k/YJd0Wh03uIz/1Pe8VUU772SdAstDGfxUCQoXZnfpCqxJCiWSWyy7O g==;
X-IronPort-AV: E=Sophos;i="5.56,489,1539619200"; d="scan'208";a="204082570"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2019 10:10:05 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 17 Jan 2019 17:51:23 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.68.123])
 ([10.111.68.123])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2019 18:10:06 -0800
Subject: Re: [PATCH v2 6/8] RISC-V: Add required checks during clock source
 init
To: Anup Patel <anup@brainfault.org>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-7-git-send-email-atish.patra@wdc.com>
 <CAAhSdy0VsOjiSRhBY7fdXVOccWV+4j_UJwKdNX4cNWHBJKyGeA@mail.gmail.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <839bee2a-12a0-6bdd-8d59-b83cc0403c96@wdc.com>
Date: Thu, 17 Jan 2019 18:10:04 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0VsOjiSRhBY7fdXVOccWV+4j_UJwKdNX4cNWHBJKyGeA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_181009_727420_060A0301 
X-CRM114-Status: GOOD (  18.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?Patrick_St=c3=a4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/8/19 3:57 AM, Anup Patel wrote:
> Few nit changes..
> 
> Prefer, "clocksource/drivers/riscv:" prefix instead of "RISC-V:" for
> this patch.
> 
> On Tue, Jan 8, 2019 at 3:08 PM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> Currently, clocksource registration happens for an invalid cpu
>> for non-smp kernels. This lead to kernel panic as cpu hotplug
>> registration will fail for those cpus. Moreover,
>> riscv_hartid_to_cpuid can return errors now.
>>
>> Do not proceed if hartid or cpuid is invalid. Take this opprtunity
>> to print appropriate error strings for different failure cases.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   drivers/clocksource/timer-riscv.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
>> index 43189220..d9b914e9 100644
>> --- a/drivers/clocksource/timer-riscv.c
>> +++ b/drivers/clocksource/timer-riscv.c
>> @@ -95,14 +95,31 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>          struct clocksource *cs;
>>
>>          hartid = riscv_of_processor_hartid(n);
>> +       if (hartid < 0) {
>> +               pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
>> +                       n, hartid);
>> +               return hartid;
>> +       }
> 
> Add empty line here.
> 
>>          cpuid = riscv_hartid_to_cpuid(hartid);
>>
> 
> Remove empty line here
> 
>> +       if (cpuid < 0) {
>> +               pr_warn("Invalid cpuid for hartid [%d]\n", hartid);
>> +               return cpuid;
>> +       }
>> +
>>          if (cpuid != smp_processor_id())
>>                  return 0;
>>
>> +       pr_err("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
>> +              __func__, cpuid, hartid);
>>          cs = per_cpu_ptr(&riscv_clocksource, cpuid);
>> -       clocksource_register_hz(cs, riscv_timebase);
>> +       error = clocksource_register_hz(cs, riscv_timebase);
>>
> 
> Remove empty line here.
> 
>> +       if (error) {
>> +               pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> +                      error, cpuid);
>> +               return error;
>> +       }
> 
> Add empty line here.
> 
>>          sched_clock_register(riscv_sched_clock,
>>                          BITS_PER_LONG, riscv_timebase);
>>
>> @@ -110,8 +127,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>>                           "clockevents/riscv/timer:starting",
>>                           riscv_timer_starting_cpu, riscv_timer_dying_cpu);
>>          if (error)
>> -               pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
>> -                      error, cpuid);
>> +               pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>> +                      error);
>>          return error;
>>   }
>>
>> --
>> 2.7.4
>>
> 
> Apart from above, looks good to me.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
>

Thanks for the review. I will fix the empty line issues and subject line.


> Regards,
> Anup
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
