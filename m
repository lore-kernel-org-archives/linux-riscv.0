Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6ADC83F17
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 19:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lSN5QKi6Ev17HNIGdvin+h30FhtSmGHNwmlSH3Z+Ss=; b=qUhHLON2wj5i0i
	dEupPXbHXkk36rpFMV9INPpPfKIFmewO1HznIKO1TtAtmyN5RTdy0FGfNljhO7RXI8DcprY8xqgFU
	65vDzCzKzLjmRAyWpp9UwlY6bQyjWlhkJBh3g7CzpKb+nXYVhLHGC6B4ifHHeRWpcmf73zB3Pk+yJ
	hqRN1hoxdmgS4toU4+e+a8CwtWQsZpgb8Emu+8UHVit9aUZG/LrH+IIf+K3Ary9dwowLRAeX+aZSX
	8FlBId8k5fmaO9N9+sKpunWlj8swpPI0+cgIka7g6VjRiqlhv48S3qOgpyy9cKeDiKik0eM1sZkTv
	e/znCFrKhc3wMjKOESVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uefO7-00000005qbG-2rds;
	Wed, 23 Jul 2025 19:44:27 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uefLx-00000005qEK-0cvv
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 19:42:15 +0000
Message-ID: <9594c9bb-b2b1-498b-8622-5ad7e9c7e551@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1753299728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WjKKBFgT8+6Mx6ITWCQWiOy7BezvlwzNMKaoIE2MTkY=;
	b=Hm/8kEEOeNI7U8I8rF3g20AU4lj1bMZnbc6Yv5ScvuYO+PeuLYGuP0PuQlKM9Zzf8ts3GB
	VDO6PCV+xR1S++qw57t7u4a65cWfX/KFqIXUEg93LwILXI7TCUpJAvtcngBkE7I77qsriz
	olDtFyOPOkrWWCCCa3lso6/ytngZJdlaZDpA+CsCGw5v3tbF6p7kFswpiBCYYd9juCG1a7
	vKNuRWLSe+QCjFBraXTkqothVEOSWp6itvQdlUkHkRJlI7hQPH/0Sf2bt/0YTTXSJF9MK3
	kLS+h9zsk84miBcDJ9gbe69ax/2XVVrp6G2DJWFfeZhgQ3uRAhWBUKdYtf3Wmw==
Date: Wed, 23 Jul 2025 20:42:04 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v5] riscv: introduce asm/swab.h
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
References: <20250717-riscv-swab-v5-1-1d5bb7c42f38@iencinas.com>
 <6ec13c2a-764c-4a88-a419-b4d7433c0731@ghiti.fr>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
Autocrypt: addr=ignacio@iencinas.com; keydata=
 xjMEZgaZEBYJKwYBBAHaRw8BAQdAYZxeXU5yoeLYkQpvN+eE3wmAF4V0JUzIlpm/DqiSeBnN
 LElnbmFjaW8gRW5jaW5hcyBSdWJpbyA8aWduYWNpb0BpZW5jaW5hcy5jb20+wo8EExYIADcW
 IQSXV5vKYfM26lUMmYnH3J3Ka8TsNgUCZgaZEAUJBaOagAIbAwQLCQgHBRUICQoLBRYCAwEA
 AAoJEMfcncprxOw21F4BAJe+mYh3sIdSvydyDdDXLFqtVkzrFB8PVNSU9eZpvM0mAP9996LA
 N0gyY7Obnc3y59r9jOElOn/5fz5mOEU3nE5lCc44BGYGmRESCisGAQQBl1UBBQEBB0CVC5o6
 qnsTzmmtKY1UWa/GJE53dV/3UPJpZu42p/F0OAMBCAfCfgQYFggAJhYhBJdXm8ph8zbqVQyZ
 icfcncprxOw2BQJmBpkRBQkFo5qAAhsMAAoJEMfcncprxOw2N8ABAPcrkHouJPn2N8HcsL4S
 SVgqxNLVOpsMX9kAYgIMqM0WAQCA40v0iYH1q7QHa2IfgkrBzX2ZLdXdwoxfUr8EY5vtAg==
In-Reply-To: <6ec13c2a-764c-4a88-a419-b4d7433c0731@ghiti.fr>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_124213_774211_16EB22B2 
X-CRM114-Status: GOOD (  25.28  )
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


Hello Alex!

On 23/7/25 14:28, Alexandre Ghiti wrote:
> Hi Ignacio,
> 
> On 7/17/25 20:44, Ignacio Encinas wrote:
>> Implement endianness swap macros for RISC-V.
>>
>> Use the rev8 instruction when Zbb is available. Otherwise, rely on the
>> default mask-and-shift implementation.
>>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
>> ---
>> Motivated by [1]. Tested with crc_kunit as pointed out here [2]. I can't
>> provide performance numbers as I don't have RISC-V hardware.
>>
>> [1] https://lore.kernel.org/all/20250302220426.GC2079@quark.localdomain/
>> [2] https://lore.kernel.org/all/20250216225530.306980-1-ebiggers@kernel.org/
>> ---
>> Changes in v5:
>> - Duplicate ___constant_swab helpers in arch/riscv/include/asm/swab.h to
>>    avoid delaying the patch as suggested by Alex in [3] (drop patch 1 and
>>    convert this into a 1-patch series)
>> - Link to v4: https://lore.kernel.org/r/20250426-riscv-swab-v4-0-64201404a68c@iencinas.com
>>
>> [3] https://lore.kernel.org/linux-riscv/7e22a448-3cee-4475-b69b-3dd45b57f168@ghiti.fr/
>>
>> Changes in v4:
>>
>> - Add missing include in the 1st patch, reported by
>>    https://lore.kernel.org/all/202504042300.it9RcOSt-lkp@intel.com/
>> - Rewrite the ARCH_SWAB macro as suggested by Arnd
>> - Define __arch_swab64 for CONFIG_32BIT (Ben)
>> - Link to v3: https://lore.kernel.org/r/20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com
>>
>> Changes in v3:
>>
>> PATCH 2:
>>    Use if(riscv_has_extension_likely) instead of asm goto (Eric). It
>>    looks like both versions generate the same assembly. Perhaps we should
>>    do the same change in other places such as arch/riscv/include/asm/bitops.h
>> - Link to v2: https://lore.kernel.org/r/20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com
>>
>> Changes in v2:
>> - Introduce first patch factoring out the default implementation into
>>    asm-generic
>> - Remove blank line to make checkpatch happy
>> - Link to v1: https://lore.kernel.org/r/20250310-riscv-swab-v1-1-34652ef1ee96@iencinas.com
>> ---
>>   arch/riscv/include/asm/swab.h | 87 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 87 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/swab.h b/arch/riscv/include/asm/swab.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..4f408f59fada7251d62f56d174ae76ff19f4a319
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/swab.h
>> @@ -0,0 +1,87 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef _ASM_RISCV_SWAB_H
>> +#define _ASM_RISCV_SWAB_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/compiler.h>
>> +#include <asm/cpufeature-macros.h>
>> +#include <asm/hwcap.h>
>> +#include <asm-generic/swab.h>
>> +
>> +#if defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE)
> 
> 
> In order to fix kernel test robot report, we need to make sure the toolchain supports Zbb, the following diff fixes the issue for me:

Thank you very much for looking at this. I looked at the report but
figured something funny had happened. Somehow I missed this "basic"
thing early on... Oops!

> 
> diff --git a/arch/riscv/include/asm/swab.h b/arch/riscv/include/asm/swab.h
> index 4f408f59fada7..8faa293a9b841 100644
> --- a/arch/riscv/include/asm/swab.h
> +++ b/arch/riscv/include/asm/swab.h
> @@ -8,7 +8,7 @@
>  #include <asm/hwcap.h>
>  #include <asm-generic/swab.h>
> 
> -#if defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE)
> +#if defined(CONFIG_TOOLCHAIN_HAS_ZBB) && defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE)          \
> 
>  // Duplicated from include/uapi/linux/swab.h
>  #define ___constant_swab16(x) ((__u16)(                                \
> @@ -83,5 +83,5 @@ static __always_inline __u64 __arch_swab64(__u64 value)
> 
>  #undef ARCH_SWAB
> 
> -#endif /* defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE) */
> +#endif /* defined(CONFIG_TOOLCHAIN_HAS_ZBB) && defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE) */
>  #endif /* _ASM_RISCV_SWAB_H */
> 
> Would you mind squashing that into a v6 please?

Of course! I'll send it now. Thanks again.

> 
> Thanks,
> 
> Alex
> 
>> +
>> +// Duplicated from include/uapi/linux/swab.h
>> +#define ___constant_swab16(x) ((__u16)(                \
>> +    (((__u16)(x) & (__u16)0x00ffU) << 8) |            \
>> +    (((__u16)(x) & (__u16)0xff00U) >> 8)))
>> +
>> +#define ___constant_swab32(x) ((__u32)(                \
>> +    (((__u32)(x) & (__u32)0x000000ffUL) << 24) |        \
>> +    (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |        \
>> +    (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |        \
>> +    (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
>> +
>> +#define ___constant_swab64(x) ((__u64)(                \
>> +    (((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |    \
>> +    (((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |    \
>> +    (((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |    \
>> +    (((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |    \
>> +    (((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |    \
>> +    (((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |    \
>> +    (((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |    \
>> +    (((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
>> +
>> +#define ARCH_SWAB(size, value)                        \
>> +({                                    \
>> +    unsigned long x = value;                    \
>> +                                    \
>> +    if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
>> +        asm volatile (".option push\n"                \
>> +                  ".option arch,+zbb\n"            \
>> +                  "rev8 %0, %1\n"                \
>> +                  ".option pop\n"                \
>> +                  : "=r" (x) : "r" (x));            \
>> +        x = x >> (BITS_PER_LONG - size);            \
>> +    } else {                                                        \
>> +        x = ___constant_swab##size(value);                      \
>> +    }                                \
>> +    x;                                \
>> +})
>> +
>> +static __always_inline __u16 __arch_swab16(__u16 value)
>> +{
>> +    return ARCH_SWAB(16, value);
>> +}
>> +
>> +static __always_inline __u32 __arch_swab32(__u32 value)
>> +{
>> +    return ARCH_SWAB(32, value);
>> +}
>> +
>> +#ifdef CONFIG_64BIT
>> +static __always_inline __u64 __arch_swab64(__u64 value)
>> +{
>> +    return ARCH_SWAB(64, value);
>> +}
>> +#else
>> +static __always_inline __u64 __arch_swab64(__u64 value)
>> +{
>> +    __u32 h = value >> 32;
>> +    __u32 l = value & ((1ULL << 32) - 1);
>> +
>> +    return ((__u64)(__arch_swab32(l)) << 32) | ((__u64)(__arch_swab32(h)));
>> +}
>> +#endif
>> +
>> +#define __arch_swab64 __arch_swab64
>> +#define __arch_swab32 __arch_swab32
>> +#define __arch_swab16 __arch_swab16
>> +
>> +#undef ___constant_swab16
>> +#undef ___constant_swab32
>> +#undef ___constant_swab64
>> +
>> +#undef ARCH_SWAB
>> +
>> +#endif /* defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE) */
>> +#endif /* _ASM_RISCV_SWAB_H */
>>
>> ---
>> base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
>> change-id: 20250307-riscv-swab-b81b94a9ac1b
>>
>> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
