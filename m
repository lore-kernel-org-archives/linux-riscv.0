Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA12F5A8DA
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 03:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xk2+OqfZ2AGLwRpWYcbossABR8HFjDC7yFsJFSRnuhU=; b=3+XEqkmv8zjiME
	cYubGXoNBkX2g5MfQqQbHwY/pZGkpWs7VMlLiTi+AiKMeVvLpCU1PY7wGi3c/ZwZiXNxjugDg6mNB
	xTd1YTnNV1Ry+Iw1c0dMTdVq3hmkZ+M2X9oOICVDmvOjPlQKOoE1b6D1dstawhE7mntdAljwwPWhS
	Djf/j3q3Lp50QaErkE2TRcSVZkVOfxym3N/mAP7PH/4b7t4pRsoFEwg7M24RshC98A3EM+uRrbrYi
	yEdouFBYY43Fyzxms/DqjGs8ZqNLgiZe1pLr2TwY5PVjsq+raL/cLc+Dvls/HUiR0hbG94b7EiKYn
	MYyoRfEnSY8QRYDxTQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1cH-00000007zVs-2snZ;
	Tue, 21 Apr 2026 03:17:37 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1cD-00000007zV6-26JR
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 03:17:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=b8RJ+R5xLJEQsbF5Ao2Y2qoqhwO2I3c2u5eT+8+xl7k=;
	b=WEX+kU5/OC+e+zy3Vv+j1Fxr14t9Fi4sUjLFcrlveq8+SPCMx+9t/LkhHnUnc7Xzuc8DQPukY
	D2dIYmAb5nJej8m3lS/JM2c774kMLFy+vpXgu/MtS6Mi6+MxBjr7oQlUruAfI6zjcPiWhzvLZbt
	tzNJAfgN6/M5Q+fpG79AfoE=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4g06nJ2srQzmV7C;
	Tue, 21 Apr 2026 11:11:00 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B944540561;
	Tue, 21 Apr 2026 11:17:23 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Apr 2026 11:17:22 +0800
Message-ID: <450e3c5f-7f1c-4e41-8cec-f59a5272af60@huawei.com>
Date: Tue, 21 Apr 2026 11:17:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] bitops: Define generic __bitrev8/16/32 for reuse
To: Yury Norov <ynorov@nvidia.com>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <akpm@linux-foundation.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <david.laight.linux@gmail.com>,
	<nathan@kernel.org>, <cp0613@linux.alibaba.com>
References: <20260420131252.179729-1-ruanjinjie@huawei.com>
 <20260420131252.179729-2-ruanjinjie@huawei.com> <aeba1FM6m-gpiMbu@yury>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aeba1FM6m-gpiMbu@yury>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_201734_278575_D25DE6B0 
X-CRM114-Status: GOOD (  26.22  )
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



On 4/21/2026 10:03 AM, Yury Norov wrote:
> On Mon, Apr 20, 2026 at 09:12:51PM +0800, Jinjie Ruan wrote:
>> Define generic __bitrev8/16/32 using the implementation
>> in <linux/bitrev.h>, so they can be reused in <asm/bitrev.h>,
>> such as RISCV.
>>
>> And introduce a NEED_BYTE_REVERSE_TABLE Kconfig option, so byte_rev_table
> 
> Please split the move and new config option into different patches,
> for bisectability.

ok, that will be more clearer.

> 
>> is only compiled when !HAVE_ARCH_BITREVERSE or when an architecture (like
>> RISC-V) explicitly selects it as a fallback. This avoids bloating the .data
>> section for architectures that have full hardware bit-reverse support and
>> don't need the table.
>>
>> Reviewed-by: Yury Norov <ynorov@nvidia.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> If I recall correctly, the option was suggested by
> David. Maybe credit him with a tag?

Sure, will add a Suggested-by.

> 
>> ---
>>  include/asm-generic/bitops/__bitrev.h | 25 +++++++++++++++++++++++++
>>  include/linux/bitrev.h                | 20 ++++----------------
>>  lib/Kconfig                           |  4 ++++
>>  lib/bitrev.c                          |  4 ++--
>>  4 files changed, 35 insertions(+), 18 deletions(-)
>>  create mode 100644 include/asm-generic/bitops/__bitrev.h
>>
>> diff --git a/include/asm-generic/bitops/__bitrev.h b/include/asm-generic/bitops/__bitrev.h
>> new file mode 100644
>> index 000000000000..9d7d3d369364
>> --- /dev/null
>> +++ b/include/asm-generic/bitops/__bitrev.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_GENERIC_BITOPS___BITREV_H_
>> +#define _ASM_GENERIC_BITOPS___BITREV_H_
>> +
>> +#ifdef CONFIG_NEED_BYTE_REVERSE_TABLE
> 
> I would rather say CONFIG_GENERIC_BITREVERSE.

Thanks for the suggestion. I'll rename CONFIG_NEED_BYTE_REVERSE_TABLE to
CONFIG_GENERIC_BITREVERSE in the next version.

> 
>> +#include <asm/types.h>
>> +
>> +extern u8 const byte_rev_table[256];
>> +static __always_inline __attribute_const__ u8 generic___bitrev8(u8 byte)
>> +{
>> +	return byte_rev_table[byte];
>> +}
>> +
>> +static __always_inline __attribute_const__ u16 generic___bitrev16(u16 x)
>> +{
>> +	return (generic___bitrev8(x & 0xff) << 8) | generic___bitrev8(x >> 8);
>> +}
>> +
>> +static __always_inline __attribute_const__ u32 generic___bitrev32(u32 x)
>> +{
>> +	return (generic___bitrev16(x & 0xffff) << 16) | generic___bitrev16(x >> 16);
>> +}
>> +#endif /* CONFIG_NEED_BYTE_REVERSE_TABLE */
>> +
>> +#endif /* _ASM_GENERIC_BITOPS___BITREV_H_ */
>> diff --git a/include/linux/bitrev.h b/include/linux/bitrev.h
>> index d35b8ec1c485..11620a70e776 100644
>> --- a/include/linux/bitrev.h
>> +++ b/include/linux/bitrev.h
>> @@ -12,22 +12,10 @@
>>  #define __bitrev8 __arch_bitrev8
>>  
>>  #else
>> -extern u8 const byte_rev_table[256];
>> -static inline u8 __bitrev8(u8 byte)
>> -{
>> -	return byte_rev_table[byte];
>> -}
>> -
>> -static inline u16 __bitrev16(u16 x)
>> -{
>> -	return (__bitrev8(x & 0xff) << 8) | __bitrev8(x >> 8);
>> -}
>> -
>> -static inline u32 __bitrev32(u32 x)
>> -{
>> -	return (__bitrev16(x & 0xffff) << 16) | __bitrev16(x >> 16);
>> -}
>> -
>> +#include <asm-generic/bitops/__bitrev.h>
>> +#define __bitrev32 generic___bitrev32
>> +#define __bitrev16 generic___bitrev16
>> +#define __bitrev8 generic___bitrev8
>>  #endif /* CONFIG_HAVE_ARCH_BITREVERSE */
>>  
>>  #define __bitrev8x4(x)	(__bitrev32(swab32(x)))
>> diff --git a/lib/Kconfig b/lib/Kconfig
>> index 0f2fb9610647..75cbb647b1da 100644
>> --- a/lib/Kconfig
>> +++ b/lib/Kconfig
>> @@ -62,6 +62,10 @@ config HAVE_ARCH_BITREVERSE
>>  	  This option enables the use of hardware bit-reversal instructions on
>>  	  architectures which support such operations.
>>  
>> +config NEED_BYTE_REVERSE_TABLE
>> +	bool
>> +	default y if !HAVE_ARCH_BITREVERSE
> 
> bool + default = def_bool

That will more clearer.

> 
> I don't need the table if I don't enable BITREVERSE. The bitrev.c
> will not be compiled in that case, but .config will be polluted
> with useless and misleading NEED_BYTE_REVERSE_TABLE option. So
> altogether this should be:
> 
>  config GENERIC_BITREVERSE
>  	def_bool !HAVE_ARCH_BITREVERSE
>         depends on BITREVERSE

You are absolutely right.

> 
> Can you add a help section, so that the others would understand why
> arch and generic implementations are not mutually exclusive, and when
> they need to select this?

Sure.

> 
>> +
>>  config ARCH_HAS_STRNCPY_FROM_USER
>>  	bool
>>  
>> diff --git a/lib/bitrev.c b/lib/bitrev.c
>> index 81b56e0a7f32..d9d5ee00229c 100644
>> --- a/lib/bitrev.c
>> +++ b/lib/bitrev.c
>> @@ -1,5 +1,5 @@
>>  // SPDX-License-Identifier: GPL-2.0-only
>> -#ifndef CONFIG_HAVE_ARCH_BITREVERSE
>> +#ifdef CONFIG_NEED_BYTE_REVERSE_TABLE
>>  #include <linux/types.h>
>>  #include <linux/module.h>
>>  #include <linux/bitrev.h>
>> @@ -44,4 +44,4 @@ const u8 byte_rev_table[256] = {
>>  };
>>  EXPORT_SYMBOL_GPL(byte_rev_table);
>>  
>> -#endif /* CONFIG_HAVE_ARCH_BITREVERSE */
>> +#endif /* CONFIG_NEED_BYTE_REVERSE_TABLE */
>> -- 
>> 2.34.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
