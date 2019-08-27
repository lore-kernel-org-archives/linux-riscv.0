Return-Path: <SRS0=IS4U=WX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ED7C3A5A3
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2019 09:33:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78B912186A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2019 09:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W8qK5Zvs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78B912186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=virtuozzo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJ1bfzsHn7074CC2BoJGVYfrxPuDdlZtk4+R0qZP2tA=; b=W8qK5Zvskx6vmg
	h0aZTrkz0ScYKEz/a/OtcFq5/ze2+QZKlpqUBVI41WEFQULbhAofbn6xQmEydVB15o2FAzc66QdEi
	Q41JkZER04KfVX4KQyAgxoF+kJ5asJEVmcL0XMCWzC6ee6LCl5uCH07r8mKiENe9GFOcU8uO+TV1M
	ny0GEwjSrq8TFn80nKJgXkHT6ZbVOekc9ezd0ETKRP1tpAu/dbI9xv4YuzjKBYF5VyWQzpLnpOOiF
	J0AHLnoj+zj/aXKpeRZvAl0S4ZFUyVwxJO1wE9qWBXtMhrK7fN2tgLMrTy8u55Jvg5dQokr4x991C
	mmVo3CbfbhQqMP0hXzlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Xr6-0006dw-7l; Tue, 27 Aug 2019 09:33:36 +0000
Received: from relay.sw.ru ([185.231.240.75])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Xr4-0006d5-4d
 for linux-riscv@lists.infradead.org; Tue, 27 Aug 2019 09:33:35 +0000
Received: from [172.16.25.5] by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <aryabinin@virtuozzo.com>)
 id 1i2Xqa-0000bE-FK; Tue, 27 Aug 2019 12:33:04 +0300
Subject: Re: [PATCH 1/2] riscv: Add memmove string operation.
To: Nick Hu <nickhu@andestech.com>
References: <cover.1565161957.git.nickhu@andestech.com>
 <a6c24ce01dc40da10d58fdd30bc3e1316035c832.1565161957.git.nickhu@andestech.com>
 <09d5108e-f0ba-13d3-be9e-119f49f6bd85@virtuozzo.com>
 <20190827090738.GA22972@andestech.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <92dd5f5f-c8a2-53c3-4d61-44acc4366844@virtuozzo.com>
Date: Tue, 27 Aug 2019 12:33:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827090738.GA22972@andestech.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_023334_181176_919664AB 
X-CRM114-Status: GOOD (  14.42  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QWxhbiBRdWV5LUxpYW5nIEthbyjpq5jprYHoia8p?=
 <alankao@andestech.com>, "atish.patra@wdc.com" <atish.patra@wdc.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 =?UTF-8?B?6Zui6IG3Wm9uZyBab25nLVhpYW4gTGko5p2O5a6X5oayKQ==?=
 <zong@andestech.com>, "alexios.zavras@intel.com" <alexios.zavras@intel.com>,
 "Anup.Patel@wdc.com" <Anup.Patel@wdc.com>,
 "glider@google.com" <glider@google.com>,
 "green.hu@gmail.com" <green.hu@gmail.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "deanbo422@gmail.com" <deanbo422@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dvyukov@google.com" <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 8/27/19 12:07 PM, Nick Hu wrote:
> Hi Andrey
> 
> On Thu, Aug 22, 2019 at 11:59:02PM +0800, Andrey Ryabinin wrote:
>> On 8/7/19 10:19 AM, Nick Hu wrote:
>>> There are some features which need this string operation for compilation,
>>> like KASAN. So the purpose of this porting is for the features like KASAN
>>> which cannot be compiled without it.
>>>
>>
>> Compilation error can be fixed by diff bellow (I didn't test it).
>> If you don't need memmove very early (before kasan_early_init()) than arch-specific not-instrumented memmove()
>> isn't necessary to have.
>>
>> ---
>>  mm/kasan/common.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
>> index 6814d6d6a023..897f9520bab3 100644
>> --- a/mm/kasan/common.c
>> +++ b/mm/kasan/common.c
>> @@ -107,6 +107,7 @@ void *memset(void *addr, int c, size_t len)
>>  	return __memset(addr, c, len);
>>  }
>>  
>> +#ifdef __HAVE_ARCH_MEMMOVE
>>  #undef memmove
>>  void *memmove(void *dest, const void *src, size_t len)
>>  {
>> @@ -115,6 +116,7 @@ void *memmove(void *dest, const void *src, size_t len)
>>  
>>  	return __memmove(dest, src, len);
>>  }
>> +#endif
>>  
>>  #undef memcpy
>>  void *memcpy(void *dest, const void *src, size_t len)
>> -- 
>> 2.21.0
>>
>>
>>
> I have confirmed that the string operations are not used before kasan_early_init().
> But I can't make sure whether other ARCHs would need it before kasan_early_init().
> Do you have any idea to check that? Should I cc all other ARCH maintainers?
 

This doesn't affect other ARCHes in any way. If other arches have their own not-instrumented
memmove implementation (and they do), they will continue to be able to use it early.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
