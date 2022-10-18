Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54357C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 01:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdk2/UZ871hOjnGFC62Qqgx4pwEGYfcXvxOjCkZMSb8=; b=35jXLWA4JlSyTptSPzzUzQ/rOu
	zDiidOd410mYTXZS+uaX0KZCV2So0OjXSocEQeSiYoqL2vcaqjoyBrKRYeaT0S8ogcmhKSNT1ep45
	kwS8q1cbClPkRKxJGzVBvT/Sz2pZNuTiuTk7Ax4y3hnezqpAQdR5mzaCOC4wrNG82BSneFAxFoeL/
	txlU49g+AoQbIbrSvCmvZGy4JiAygiEZylwuYOnREEl4jszsGdKyHnett2vfXvqzVNovxiG+e7BaG
	UzDSJKRPh/EvRX7I5iSDLhZqNbi/HDJzhuCPqCuV/r2vMHrmmpn+3VlWXojJSRX4B7CcVqhNEoAvB
	25FXOMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okblE-0013V5-DN; Tue, 18 Oct 2022 01:51:16 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okblA-0013Kt-4L
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 01:51:14 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MrxXt3w12z1P79l;
	Tue, 18 Oct 2022 09:46:22 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 09:50:35 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 09:50:34 +0800
Subject: Re: [PATCH 1/2] soc: sifive: ccache: fix missing iounmap() in error
 path in sifive_ccache_init()
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <yash.shah@sifive.com>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <yangyingliang@huawei.com>
References: <20221017084411.3557098-1-yangyingliang@huawei.com>
 <Y0145x9Y8MVb1Brw@spud>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <b9be3d72-dc9d-6f93-3ceb-e3965e98310d@huawei.com>
Date: Tue, 18 Oct 2022 09:50:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y0145x9Y8MVb1Brw@spud>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_185112_554045_A12BCE6D 
X-CRM114-Status: GOOD (  20.89  )
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

Hi Conor,

On 2022/10/17 23:46, Conor Dooley wrote:
> On Mon, Oct 17, 2022 at 04:44:10PM +0800, Yang Yingliang wrote:
>> Add missing iounmap() before return error from sifive_ccache_init().
>>
>> Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
> Hey Yang Yangliang,
>
> Both of these patches look good to me.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> One question - of_find_matching_node() increments the refcount of np
> right? It seems to me like we need an of_node_put() here, at the very
> least in the error paths (do we need it in the success path too?).
> If we are going to add cleanup to this driver, we may as well go the
> whole hog I think.
>
> In terms of the success paths, I assume the first place we can safely
> let the reference go is just before the call to ccache_config_read()?
Thanks for reviewing!

Yes, I think you are right, the refcount of np need be put in error paths,
and it's OK to put refcount before ccache_config_read() in normal path.
I can send another patch to fix this.

Thanks,
Yang
>
> Please lmk if I am misunderstanding anything here...
> Thanks,
> Conor.
>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/soc/sifive/sifive_ccache.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
>> index 1c171150e878..25019c16d8ae 100644
>> --- a/drivers/soc/sifive/sifive_ccache.c
>> +++ b/drivers/soc/sifive/sifive_ccache.c
>> @@ -222,13 +222,16 @@ static int __init sifive_ccache_init(void)
>>   	if (!ccache_base)
>>   		return -ENOMEM;
>>   
>> -	if (of_property_read_u32(np, "cache-level", &level))
>> -		return -ENOENT;
>> +	if (of_property_read_u32(np, "cache-level", &level)) {
>> +		rc = -ENOENT;
>> +		goto err_unmap;
>> +	}
>>   
>>   	intr_num = of_property_count_u32_elems(np, "interrupts");
>>   	if (!intr_num) {
>>   		pr_err("No interrupts property\n");
>> -		return -ENODEV;
>> +		rc = -ENODEV;
>> +		goto err_unmap;
>>   	}
>>   
>>   	for (i = 0; i < intr_num; i++) {
>> @@ -237,7 +240,7 @@ static int __init sifive_ccache_init(void)
>>   				 NULL);
>>   		if (rc) {
>>   			pr_err("Could not request IRQ %d\n", g_irq[i]);
>> -			return rc;
>> +			goto err_unmap;
>>   		}
>>   	}
>>   
>> @@ -250,6 +253,10 @@ static int __init sifive_ccache_init(void)
>>   	setup_sifive_debug();
>>   #endif
>>   	return 0;
>> +
>> +err_unmap:
>> +	iounmap(ccache_base);
>> +	return rc;
>>   }
>>   
>>   device_initcall(sifive_ccache_init);
>> -- 
>> 2.25.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> .

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
