Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04529ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 17:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+g3D0coEMqKGQpUBhYN5FTUGxQaeXL3ESnYLPLLb+TE=; b=IkAC7bghcv2LqxvmjS7WKFFhVm
	y6iRcfgn2J49DplCVBb4imuEZTrjpqhCIvkt4pgs0DNLFxVzNKNYFhZg0lfmhnmlsY3u8S74tZ2AK
	QrPTq1/yeHyB6UGuxZvO59OWL/fC6X/hoeWi0cLUxRuXcSwTFaSFYjc8Q20NMdHAjWZmyQ6T0cfn0
	fwLaY9IEIx3SD+bFoMmZ0OQzWVNw3lSQNtSsE6Dvwo472dKMvSvzO6Rq6bR2wSjlnAHIBROYpvKDN
	w+edioe+/eCmpQUq3RCYkOK8uMZimm4WZ111+B+UlbplfBufRLr9XA3iXZxeJ4JxBbw0cnSbUsr/I
	50Uj5cOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4eZ-000geN-DU; Tue, 30 Aug 2022 17:03:55 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4eW-000gcv-2V
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 17:03:53 +0000
Received: from [167.98.27.226] (helo=[10.35.5.6])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1oT4eR-0069vo-0x; Tue, 30 Aug 2022 18:03:47 +0100
Message-ID: <cefcf96f-5bcc-d134-fbe5-d1169313b6f3@codethink.co.uk>
Date: Tue, 30 Aug 2022 18:03:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] soc: sifive: ccache: reduce printing on init
Content-Language: en-GB
To: Conor.Dooley@microchip.com, ben.dooks@sifive.com, zong.li@sifive.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 greentime.hu@sifive.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220829062202.3287-1-zong.li@sifive.com>
 <20220830082620.1680602-1-ben.dooks@sifive.com>
 <fdec1b72-27f3-96e6-5e19-d54ded4aea68@microchip.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <fdec1b72-27f3-96e6-5e19-d54ded4aea68@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_100352_141339_F136DC17 
X-CRM114-Status: GOOD (  21.67  )
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

On 30/08/2022 17:30, Conor.Dooley@microchip.com wrote:
> On 30/08/2022 09:26, Ben Dooks wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> The driver prints out 6 lines on startup, which can easily be redcued
>> to two lines without losing any information.
>>
>> Note, to make the types work better, uint64_t has been replaced with
>> ULL to make the unsigned long long match the format in the print
>> statement.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
>> ---
>>   drivers/soc/sifive/sifive_ccache.c | 25 +++++++++++--------------
>>   1 file changed, 11 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
>> index 46ce33db7d30..65a10a6ee211 100644
>> --- a/drivers/soc/sifive/sifive_ccache.c
>> +++ b/drivers/soc/sifive/sifive_ccache.c
>> @@ -76,20 +76,17 @@ static void setup_sifive_debug(void)
>>
>>   static void ccache_config_read(void)
>>   {
>> -       u32 regval, val;
>> -
>> -       regval = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
>> -       val = regval & 0xFF;
>> -       pr_info("CCACHE: No. of Banks in the cache: %d\n", val);
>> -       val = (regval & 0xFF00) >> 8;
>> -       pr_info("CCACHE: No. of ways per bank: %d\n", val);
>> -       val = (regval & 0xFF0000) >> 16;
>> -       pr_info("CCACHE: Sets per bank: %llu\n", (uint64_t)1 << val);
>> -       val = (regval & 0xFF000000) >> 24;
>> -       pr_info("CCACHE: Bytes per cache block: %llu\n", (uint64_t)1 << val);
>> -
>> -       regval = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
>> -       pr_info("CCACHE: Index of the largest way enabled: %d\n", regval);
>> +       u32 cfg;
>> +
>> +       cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
>> +
>> +       pr_info("CCACHE: %u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
>> +               (cfg & 0xff), (cfg >> 8) & 0xff,
>> +               1ULL << ((cfg >> 16) & 0xff),
> 
> This is just BIT_ULL((cfg >> 16) & 0xff), no?
> Would be nice too if these were defined, so you'd have something
> like BIT_ULL((cfg >> SETS_PER_BANK_SHIFT) & 0xff)
> 
> I do like the cleanup of the uint64_t & cutting down on the prints
> though :) Again, it'd be nice if you and Zong could collaborate on
> a combined v2.

I think even BIT_UL() would do here, if someone is going to make a
cache bigger than 2GiB we'll probably be quite old by then, so v2
might have the last two values down as %lu.

> Thanks,
> Conor.
> 
>> +               1ULL << ((cfg >> 24) & 0xff));
>> +
>> +       cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
>> +       pr_info("CCACHE: Index of the largest way enabled: %d\n", cfg);
>>   }
>>
>>   static const struct of_device_id sifive_ccache_ids[] = {
>> --
>> 2.35.1
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
