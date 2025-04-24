Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B63C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xw+5RJl5C5F9EIyMcV5IoZCwPWo5SuyMMts7/oklPN4=; b=NfKf+rntpzuapB
	EPf0QLeWPAbALwIRXBEeqhlaoWH64BhNw+BU/Ti7Si4zyW31ha5Zpc7ClTqhoHg55AwCAJ85Fqw5w
	GzxGeb0C8XUwMnarF00VAC0R7Avfg9vETQX7rAP9N6mwYcY/39TnbJ3ALUUu8jCPEqbYkE0TVGHiA
	bvGYsjY/DY1TQAAb6OBYMVztD52ND+0+jAXOoesApmZcXIP57igE6nS27KSJVK5fzmGT+iyNmca4l
	98hkW9NwLo2LjCRS0rQXNPX2WlKcbknYbCX8fCps3wS8mtrSraSjcX7SnM3fYSgV9h0OiQd2CkE3l
	z9E50Xyrr70gjLDtY4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80MA-0000000EtZG-1J2K;
	Thu, 24 Apr 2025 17:27:26 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80M5-0000000EtYg-1R2P
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:27:25 +0000
Message-ID: <f5464e26-faa0-48f1-8585-9ce52c8c9f5f@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1745515637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gE3Ny+oVXXm4XaEkguFbKK9ma/30w0nfPWxX9kbduWE=;
	b=kndgtCGkFmDA6AIZSKwk7aZ9bcFQjmka74EYzotDUPhQOhGmQdqfvcxhJOxbkPnjNGszk6
	S5l10hZQKQQUrgUSJ2bwOeAb25zZDIbVkC45SIoK+EhpviV+6vaWtMiPuB483HZF9UPsva
	a8sxlaHQu/ZqdgzcnnB7ok2bcH/qTI4+tOqX9sJPb//Xt31EH1MMMfGbNOM2sGy1V6K5g7
	54My6MtEokc1ylIB/s1GXrR+echHNjIM89oWRUpFifmxJmaaL+c5NyGF5veS7BkPNuM/Te
	fzPZDf+z4izbFJ6/EuquIZ7QeLmuc4LkjiR4dUzWcTj8yuPCt+kBdCkOucLkOg==
Date: Thu, 24 Apr 2025 19:27:09 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] riscv: introduce asm/swab.h
To: Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>
References: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
 <20250403-riscv-swab-v3-2-3bf705d80e33@iencinas.com>
 <c6efcdca-5739-42b6-8cb4-f4d8cc85b6af@app.fastmail.com>
 <b3f8e641-9690-4792-974c-c895d2e4531a@iencinas.com>
 <66a5aba9-2a32-4ef9-a839-a389b975757d@ghiti.fr>
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
In-Reply-To: <66a5aba9-2a32-4ef9-a839-a389b975757d@ghiti.fr>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_102721_871724_14240EF8 
X-CRM114-Status: GOOD (  23.67  )
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



Hello!

On 23/4/25 13:08, Alexandre Ghiti wrote:
> Hi Ignacio,
> 
> On 04/04/2025 19:35, Ignacio Encinas wrote:
>>
>> On 4/4/25 7:58, Arnd Bergmann wrote:
>>> On Thu, Apr 3, 2025, at 22:34, Ignacio Encinas wrote:
>>>> +#define ARCH_SWAB(size) \
>>>> +static __always_inline unsigned long __arch_swab##size(__u##size value) \
>>>> +{                                    \
>>>> +    unsigned long x = value;                    \
>>>> +                                    \
>>>> +    if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
>>>> +        asm volatile (".option push\n"                \
>>>> +                  ".option arch,+zbb\n"            \
>>>> +                  "rev8 %0, %1\n"                \
>>>> +                  ".option pop\n"                \
>>>> +                  : "=r" (x) : "r" (x));            \
>>>> +        return x >> (BITS_PER_LONG - size);            \
>>>> +    }                                                               \
>>>> +    return  ___constant_swab##size(value);                \
>>>> +}
>> Hello Arnd!
>>
>>> I think the fallback should really just use the __builtin_bswap
>>> helpers instead of the ___constant_swab variants. The output
>>> would be the same, but you can skip patch 1/2.
>> I tried, but that change causes build errors:
>>
>> ```
>> undefined reference to `__bswapsi2'
>>
>> [...]
>>
>> undefined reference to `__bswapdi2
>> ```
>>
>> I tried working around those, but couldn't find a good solution. I'm a
>> bit out of my depth here, but I "summarized" everything here [1]. Let me
>> know if I'm missing something.
>>
>> [1] https://lore.kernel.org/linux-riscv/b3b59747-0484-4042-bdc4-c067688e3bfe@iencinas.com/
> 
> Note that I only encountered those issues in the purgatory.
> 
> So to me we have 3 solutions:
> 
> - either implementing both __bswapsi2 and __bswapdi2

Which would be fine but seems a bit pointless to me: these __bswapsi2
and __bswapdi2 implementations will be ___constant_swab with a different
name: same code or hardcoded (and equivalent) assembly

> - or linking against libgcc
>
> - or merging patch 1.
>
> Given the explanation in commit d67703a8a69e ("arm64: kill off the libgcc dependency"), I would not use libgcc.
> 
> The less intrusive solution (for us riscv) is merging patch 1.

I also think this seems the best solution. I'll send a v4 taking the
tips that were pointed during review (and fixing the issue pointed out
by the kernel test robot) keeping patch 1.

> But please let me know if I missed another solution or if I'm wrong.
> 
> Thanks,
> 
> Alex
> 
> 
>>
>>> I would also suggest dumbing down the macro a bit so you can
>>> still find the definition with 'git grep __arch_swab64'. Ideally
>>> just put the function body into a macro but leave the three
>>> separate inline function definitions.
>> Good point, thanks for bringing it up. Just to be sure, is this what you
>> had in mind? (Give or take formatting + naming of variables)
>>
>> #define arch_swab(size, value)                         \
>> ({                                              \
>>     unsigned long x = value;                    \
>>                                     \
>>     if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
>>         asm volatile (".option push\n"                \
>>                   ".option arch,+zbb\n"            \
>>                   "rev8 %0, %1\n"                \
>>                   ".option pop\n"                \
>>                   : "=r" (x) : "r" (x));            \
>>         x = x >> (BITS_PER_LONG - size);            \
>>     } else {                                                        \
>>         x = ___constant_swab##size(value);                      \
>>     }                                \
>>     x;                                \
>> })
>>
>> static __always_inline unsigned long __arch_swab64(__u64 value) {
>>     return arch_swab(64, value);
>> }
>>
>> Thanks!
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
