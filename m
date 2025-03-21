Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2B0C36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 18:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qw03pWhBWPWxeBgwguSQaRY+LeX01HfUv0VG0VrvmmY=; b=GAI7jzHHHGjkc3
	glXEDWW063kd+VvP1ArIgU/nR66iyCULa/UiFbdoyGv1gzuNN/TJGPxXJ27qZ1LNQDdbylXbfNbwE
	eHtmj4M/1mIexYWcReGRteIBvKT3kFffupLRJmG1eNq2lkjdDjD1kJJZ44EQ1f/1vyXukKQX+Aj7x
	ZTulji5IeuWL8mmDO9mdU+LG5hSaLytdoafgP5XrZFZRvPh8e4MrjKveW27MrL/XLq5zV8TVd+szm
	FGM74eLT4qANd4HfGokJGcy7whC+A9LE70IxEcGKoXnPu8FVAeaLngphykxWPuenkEbiHmyx+Ydil
	6lnbaVg+4Hhkw/S26fLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhGr-0000000Fsun-2RNV;
	Fri, 21 Mar 2025 18:39:05 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhGn-0000000Fstu-3y5J
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 18:39:04 +0000
Message-ID: <b3b59747-0484-4042-bdc4-c067688e3bfe@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742582339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/l61PMZ8ZONjm1VBcYbvcyTIE/eIAlBdEyNM703h8Wg=;
	b=LQr8od9Eoo1BpEq7o+7c/an+WLbBfCL0f8tZSGR68BOyccf1eIvgALCsoOWT+7qHzhfGwd
	yn0NDKfsiZoX26dbpZT1+rz9C9U1DMXK/0pTwtqI34yXRlZFbkzgqXuEjoyrlPlcJ0LJuK
	Bj0fXQFBZAtzXpgmscYRilgQjjdj5++IwrQhlHkMVw+0ZodToECeslq47XrqyuM+WzjI7s
	e352THyHY4+OVl7l9mLaOERKk71lq/DVWr2JrB3jTN03qYKQzUoP97bRvAVZ3lwq2pJX4v
	6FZOSzOf/sskaOtvO/1ffD9W8jxenGDR/LxEDH+kkX3WyNCQKT/fE8xP6AJd/Q==
Date: Fri, 21 Mar 2025 19:38:54 +0100
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
Subject: Re: [PATCH v2 1/2] include/uapi/linux/swab.h: move default
 implementation for swab macros into asm-generic
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>
References: <20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com>
 <20250319-riscv-swab-v2-1-d53b6d6ab915@iencinas.com>
 <2afab9dc-e39c-4399-ac5a-87ade4da5ab0@app.fastmail.com>
 <4d45df0c-d44e-4bb6-8daa-0dba1b834bc4@iencinas.com>
 <07b8051b-9d5e-440e-b74d-1ca97402fe2a@app.fastmail.com>
 <ac0b1f3e-6abe-4de2-bf5a-a4b3207a22c3@iencinas.com>
 <583340a9-411d-406f-aee9-d3e2eb80ca43@app.fastmail.com>
Content-Language: en-US
In-Reply-To: <583340a9-411d-406f-aee9-d3e2eb80ca43@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_113902_336916_61753A50 
X-CRM114-Status: GOOD (  20.19  )
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



On 21/3/25 11:23, Arnd Bergmann wrote:
> On Thu, Mar 20, 2025, at 23:36, Ignacio Encinas Rubio wrote:
>> On 19/3/25 22:49, Arnd Bergmann wrote:
>>> On Wed, Mar 19, 2025, at 22:37, Ignacio Encinas Rubio wrote:
>>>> On 19/3/25 22:12, Arnd Bergmann wrote:
>>> Right, I do remember when we had a discussion about this maybe
>>> 15 years ago when gcc didn't have the builtins on all architectures
>>> yet, but those versions are long gone, and we never cleaned it up.
>>
>> I just had a chance to look at this and it looks a bit more complex than
>> I initially thought. ___constant_swab macros are used in more places
>> than I expected, and {little,big}_endian.h define their own macros that
>> are used elsewhere, ...
>>
>> It is not clear to me how to proceed here. I could:
>>
>>   1) Just remove ___constant_swab macros and replace them with
>>   __builtin_swap everywhere
>>
>>   2) Go a step further and evaluate removing __constant_htonl and
>>   relatives
>>
>> Let me know what you think is the best option :)
> 
> I think we can start enabling CONFIG_ARCH_USE_BUILTIN_BSWAP
> on all architectures and removing the custom versions
> from arch/*/include/uapi/asm/swab.h, which all seem to
> predate the compiler builtins and likely produce worse code.

This seems fine for some architectures but I don't think we can use
this approach for RISC-V. RISC-V code assumes that the bitmanip 
extension might not be available (see arch/riscv/include/asm/bitops.h).

The current approach [1] is to detect this at boot and patch the kernel 
to adapt it to the actual hardware running it (using specific 
instructions or not).

On the other hand, I tried using __builtin_swap for the RISC-V version 
as an alternative to the "optimized" one (instead of relying on
___constant_swab, see [2]) and I immediately got compilation errors. 

Some architectures seem to require definitions for __bswapsi2 and 
__bswapdi2 [3]. I'm guessing this happens for the architectures that
don't require bit manipulation instructions but have them as extensions.

arm,csky,mips and xtensa seem to fit this description as they 
feature their own __bswapsi2 implementations. Note that they simply
call ___constant_swab or are ___constant_swab written in assembly
language [4] [5].

Unless I'm missing something, it seems to me that using compiler 
builtins (at least for RISC-V, and potentially others) is even more 
problematic than keeping ___constant_swab around. What do you think, 
should we keep patch 1 after all?

We could remove __arch_swab for architectures that always assume bit 
manipulation instructions availability, but then the kernel would fall
back into ___constant_swab when CONFIG_ARCH_USE_BUILTIN_BSWAP=n. Turning
their custom implementations into 

	#define __arch_swabXY __builtin_bswapXY

would solve this issue, but I'm not sure it is an acceptable approach.

Thanks!

[1] https://lore.kernel.org/all/ce034f2b-2f6e-403a-81f1-680af4c72929@ghiti.fr/
[2] https://lore.kernel.org/all/20250319-riscv-swab-v2-2-d53b6d6ab915@iencinas.com/
[3] https://gcc.gnu.org/onlinedocs/gcc-13.3.0/gccint.pdf
[4] https://lore.kernel.org/all/20230512164815.2150839-1-jcmvbkbc@gmail.com/
[5] https://lore.kernel.org/all/1664437198-31260-3-git-send-email-yangtiezhu@loongson.cn/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
