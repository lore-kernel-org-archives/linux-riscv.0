Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A02DC43461
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 14:03:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AFDA610FA
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 14:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AFDA610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1YAYnZSgzdNiXgf7Uw8iICUXhmXBcXmqLRK4YdDBtT0=; b=SA6BIC7I2rARu4k2rdqA3sPXT
	03jKus//WG2r6vLwDYcuL+RZqzwn3zS1dBQk5TSCCH6xo+ylapbcTa8aX8VV6q1Y6BS5sXkDv0tm4
	XrwsSfAwcEyP8lWl57Qc0SEdamEdj0c25ZUVD06+NkTD3a6QpH/eiGKhYCf8PeK0pJfQQxu9E+1b3
	iZ8X9GC3u3QiRmWvvjZ190aYpfIg5yZlz6Xa2/l3pBSQE+q2SlwilAx3LMdehmgLvVJVV4JcFAUwo
	xYcr65Gvq2oZFN1H+G3zCc43tLmHh40z10oKiQxTV5F96b1KHFvrTjsreBGHnGk3EHiYd0fMsZzI6
	jnGc7OA9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg6VU-00EZBs-FH; Mon, 10 May 2021 14:03:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg6VS-00EZBN-7o
 for linux-riscv@desiato.infradead.org; Mon, 10 May 2021 14:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=8t/ElLNYHtPZQr51iuzWn1MkSO7kDeBUTFyXGC66nlk=; b=nnk9JbgYABmoGBMT7lp78C5Yk5
 hyEuGnRXUlJps+krRQPTxSSLpMwqWQVmmY+q1QUS6+5g4TOk03he/jZlhP1NrU9zOEotdd6w/PPks
 x9pBPdyPlMTZ/OqAHW/meJPx1MCxG9TEIjjsp1poeiwhZEEIqMzseNr9fu9Z12rQuDGWEcWX4HJQx
 x3GSDKLUCjoUSQN9yWr3OdOcQIH5HrdjClWlz0sXRNES1JR9PEsUy/hUim1kl6b2qNcWDPzXTMXFl
 EzMKNNJJe1k6/Oo/xiXED4Z5eHMMTlxWG8r4ispIbGhzvZjSrAZP9TOrFD4v6d0EAEE+gEbJnUdx5
 /VBTbrQA==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg6VP-008mnE-50
 for linux-riscv@lists.infradead.org; Mon, 10 May 2021 14:03:32 +0000
Received: from dggeml758-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Ff2kF21DNz5jyN;
 Mon, 10 May 2021 22:00:05 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggeml758-chm.china.huawei.com (10.1.199.159) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 10 May 2021 22:03:25 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 10 May 2021 22:03:25 +0800
Subject: Re: [PATCH] riscv: mm: Drop redundant _sdata and _edata declaration
To: Alex Ghiti <alex@ghiti.fr>, <palmer@dabbelt.com>,
 <linux-riscv@lists.infradead.org>
CC: <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <paul.walmsley@sifive.com>, <anshuman.khandual@arm.com>
References: <20210510115808.96615-1-wangkefeng.wang@huawei.com>
 <1bb74f75-8452-54e0-857d-7d3cf1541847@ghiti.fr>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <771850bd-8533-c478-efd6-448d404e688f@huawei.com>
Date: Mon, 10 May 2021 22:03:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1bb74f75-8452-54e0-857d-7d3cf1541847@ghiti.fr>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_070331_385154_B5D19BB3 
X-CRM114-Status: GOOD (  14.91  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 2021/5/10 20:34, Alex Ghiti wrote:
> Hi Kefeng,
> =

> On 10/05/2021 13:58, Kefeng Wang wrote:
>> The _sdata/_edata is already in sections.h, drop redundant
>> declaration, also move _xiprom/_exiprom close to the caller.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>> =A0 arch/riscv/mm/init.c | 8 +-------
>> =A0 1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 136d0342b147..4d08e1f7a362 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -176,13 +176,6 @@ static void __init setup_bootmem(void)
>> =A0=A0=A0=A0=A0 memblock_allow_resize();
>> =A0 }
>> -#ifdef CONFIG_XIP_KERNEL
>> -
>> -extern char _xiprom[], _exiprom[];
>> -extern char _sdata[], _edata[];
>> -
>> -#endif /* CONFIG_XIP_KERNEL */
>> -
>> =A0 #ifdef CONFIG_MMU
>> =A0 static struct pt_alloc_ops _pt_ops __ro_after_init;
>> @@ -461,6 +454,7 @@ uintptr_t load_pa, load_sz;
>> =A0 #endif
>> =A0 #ifdef CONFIG_XIP_KERNEL
>> +extern char _xiprom[], _exiprom[];
> =

> =

> This place is guarded by #ifdef CONFIG_MMU and Vitaly has plans to make =

> XIP kernels work on !MMU configurations, so that may not be the best =

> place to move this declaration?
OK, is it better to move the top of the init.c, close to =

kernel_virt_addr, or don't change them.

> =

> Thanks,
> =

> Alex
> =

>> =A0 uintptr_t xiprom, xiprom_sz;
>> =A0 #define xiprom_sz=A0=A0=A0=A0=A0 (*((uintptr_t *)XIP_FIXUP(&xiprom_s=
z)))
>> =A0 #define xiprom=A0=A0=A0=A0=A0=A0=A0=A0 (*((uintptr_t *)XIP_FIXUP(&xi=
prom)))
>>
> .
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
