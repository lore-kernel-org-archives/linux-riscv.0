Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12B6D30CFD
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 01:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sbj7ygo75KuV1PhmM8/gpGJbHwuCWmgRrH0MSvULBeE=; b=wJ8RrSCtWlgjZA
	195rlePrwAx6fJWCbLEEVLHgaeAgcWIiutcesOfNocHR+J3qUO52f2/NCHUSzlzj0FR/j3jOm1ehw
	lpBiMVJHIEU2ZjCcphZQPmMXBgKdAHmeqtO3W7BGnQyjpzupXrAyKCDpTcxTrNzuzbaIhofJAwXeh
	vcJrL1LeLj16qBNgiHnXKN318NOxOYBO+jig+8UZNBiw9Zn9HKEmHLeQQ7OdO4nEK9NBcsQpArbBQ
	E6evfJ3xR9y6YHlhUnAqaOE9RjNe9bnwmiwwXqO5VoqPvYO0PJNJaplfjjm5KcIC4ojNg2lZ1+3lV
	RA4vjuJdWJbYtpu1oCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfptK-00000007xBW-10oT;
	Wed, 14 Jan 2026 01:41:46 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpt8-00000007x8F-3gFw
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 01:41:44 +0000
X-UUID: 1a45c698f0ea11f0a38c85956e01ac42-20260114
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:d47cd477-592e-44c6-aa76-f9be07a91177,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c2b2352c259325bd87ffd9242c7194a2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1a45c698f0ea11f0a38c85956e01ac42-20260114
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2023845300; Wed, 14 Jan 2026 09:41:10 +0800
Message-ID: <3cd30ebc-0f85-4a0d-88cd-76783b872053@kylinos.cn>
Date: Wed, 14 Jan 2026 09:41:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] lib/string: extract generic strlen() into
 __generic_strlen()
To: Eric Biggers <ebiggers@kernel.org>, andy@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kees@kernel.org, andy@kernel.org, akpm@linux-foundation.org,
 martin.petersen@oracle.com, ardb@kernel.org, ajones@ventanamicro.com,
 conor.dooley@microchip.com, samuel.holland@sifive.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <20260113082748.250916-2-jiangfeng@kylinos.cn> <20260114000151.GB2178@quark>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <20260114000151.GB2178@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_174135_235842_8163DCED 
X-CRM114-Status: GOOD (  24.04  )
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

On 2026/1/14 08:01, Eric Biggers wrote:
> On Tue, Jan 13, 2026 at 04:27:35PM +0800, Feng Jiang wrote:
>> To support performance benchmarking in KUnit tests, extract the
>> generic C implementation of strlen() into a standalone function
>> __generic_strlen(). This allows tests to compare architecture-optimized
>> versions against the generic baseline without duplicating code.
>>
>> Suggested-by: Andy Shevchenko <andy@kernel.org>
>> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
>> ---
>>  include/linux/string.h |  1 +
>>  lib/string.c           | 10 ++++++++--
>>  2 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/string.h b/include/linux/string.h
>> index 1b564c36d721..961645633b4d 100644
>> --- a/include/linux/string.h
>> +++ b/include/linux/string.h
>> @@ -197,6 +197,7 @@ extern char * strstr(const char *, const char *);
>>  #ifndef __HAVE_ARCH_STRNSTR
>>  extern char * strnstr(const char *, const char *, size_t);
>>  #endif
>> +extern __kernel_size_t __generic_strlen(const char *);
>>  #ifndef __HAVE_ARCH_STRLEN
>>  extern __kernel_size_t strlen(const char *);
>>  #endif
>> diff --git a/lib/string.c b/lib/string.c
>> index b632c71df1a5..047ecb38e09b 100644
>> --- a/lib/string.c
>> +++ b/lib/string.c
>> @@ -412,8 +412,7 @@ char *strnchr(const char *s, size_t count, int c)
>>  EXPORT_SYMBOL(strnchr);
>>  #endif
>>  
>> -#ifndef __HAVE_ARCH_STRLEN
>> -size_t strlen(const char *s)
>> +size_t __generic_strlen(const char *s)
>>  {
>>  	const char *sc;
>>  
>> @@ -421,6 +420,13 @@ size_t strlen(const char *s)
>>  		/* nothing */;
>>  	return sc - s;
>>  }
>> +EXPORT_SYMBOL(__generic_strlen);
>> +
>> +#ifndef __HAVE_ARCH_STRLEN
>> +size_t strlen(const char *s)
>> +{
>> +	return __generic_strlen(s);
>> +}
>>  EXPORT_SYMBOL(strlen);
> 
> A similar problem exists with the architecture-optimized CRC and crypto
> functions.  Historically, these subsystems exported both generic and
> architecture-optimized functions.
> 
> We've actually been moving away from that design to simplify things.
> For example, for CRC-32C there's now just the crc32c() function which
> delegates to the "best" CRC-32C implementation, with no direct access to
> the generic implementation of CRC-32C.
> 
> crc_kunit then just tests and benchmarks crc32c().  To check how the
> performance of crc32c() changes when its implementation changes (whether
> the change is the addition of an arch-optimized implementation or a
> change in an existing arch-optimized implementation), the developer just
> needs to run crc_kunit with two kernels, before and after.
> 
> I suggest just doing that.  In that case there would be no need to
> export the generic implementations of these functions.
> 
> (Also note that *if* the generic functions are exported, they probably
> should be exported only when the KUnit test is enabled.  There's no need
> to include them in the kernel image when the test isn't enabled.)
> 
> - Eric

Hi Eric, Andy,

Thanks for the insights. I agree with Eric's point on keeping the internal
implementations encapsulated. It's a cleaner design for the long term.
In v3, I will drop the __generic_* exports and simplify the patchset
to benchmark only the standard functions.

To address Andy's concern regarding performance, I will provide a "Before
vs. After" comparison in the v3 cover letter. This should demonstrate
the speedup while keeping the core kernel code tidy. I'll also refine the
benchmark logic to ensure more realistic results as discussed.

This seems to be the most robust way to validate the optimizations without
adding unnecessary exports.

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
