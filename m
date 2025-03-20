Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B45C36000
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 22:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/goHAKHIqmAFzaGjgLZK6Dnzxt2sbIX9cLoTpFccWg=; b=4lOUhkx35uVHKT
	Vg6dcN9We8wLN5WhwuWzKnT5CyKvsvBXoFwQtRvxL/UVYvuAJoVc6ehtl19DGrdTB2JNfRTWxycyN
	JpFoYFRLqOdutbhJapieO86iYu7YIX1W2a7hHbjG+M6EujxLKxM0hP8sWDVKSJqLDieBSJrgs40Rn
	JDW7zF9F5qe/Pi9cUl+tPZtM2JL6PLuXaT9EXILIMrUSGAWg1sNbFiaWU/f00sab+OMW/gxRZ6WrZ
	yLWXx0jT6PGMRVdLDN6gmwfXLLW/hbNioB6/i5vBGCZQrSKKsFtdHqmTVoAgWoz276wxTKen/ix1V
	AOZ6btfMcQegVaAPLFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOVl-0000000DOTv-1Ndv;
	Thu, 20 Mar 2025 22:37:13 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOVO-0000000DOPN-3Wp1
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:36:52 +0000
Message-ID: <ac0b1f3e-6abe-4de2-bf5a-a4b3207a22c3@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742510203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+c8qZOlmmvHFgj0oXWHinTIVH4usyV/Xq+r++ltUKVc=;
	b=JlEIF0yrNmRwVufB3Vvc57KKZLVUuP3amyyNrRfA1EFfAoUti/XB5XsE35cix88xmS2/8X
	sgSjd97bagnUtXBnl4Igy6LHVwnqw/doVKwQqkWjwi00HG520cn0QAmYVAyq0yiEinHx6H
	/RONssKoN4sUrU3n5Xy/ji0DC4ty/d0evqdZcCbAqv+oZQDzvao8AC6GFl0n7Wz9pYFIvx
	UkRP6otmjqSbq0nhWKl6xbUGDCPHDYFDZbiffcMaVDxq769H5pHqhgSidhORqbm06gXdLI
	wNHejrs6kp4w+JVtB/Iv7dn3mfe8C+Ze/0fVFGq0ZzkP1ofmcDv3Yzqtjy16jw==
Date: Thu, 20 Mar 2025 23:36:36 +0100
MIME-Version: 1.0
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
In-Reply-To: <07b8051b-9d5e-440e-b74d-1ca97402fe2a@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_153651_288601_D264E618 
X-CRM114-Status: GOOD (  18.20  )
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



On 19/3/25 22:49, Arnd Bergmann wrote:
> On Wed, Mar 19, 2025, at 22:37, Ignacio Encinas Rubio wrote:
>> On 19/3/25 22:12, Arnd Bergmann wrote:
>>> On Wed, Mar 19, 2025, at 22:09, Ignacio Encinas wrote:
>>>> Move the default byteswap implementation into asm-generic so that it can
>>>> be included from arch code.
>>>>
>>>> This is required by RISC-V in order to have a fallback implementation
>>>> without duplicating it.
>>>>
>>>> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
>>>> ---
>>>>  include/uapi/asm-generic/swab.h | 32 ++++++++++++++++++++++++++++++++
>>>>  include/uapi/linux/swab.h       | 33 +--------------------------------
>>>>  2 files changed, 33 insertions(+), 32 deletions(-)
>>>>
>>>
>>> I think we should just remove these entirely in favor of the
>>> compiler-povided built-ins.
>>
>> Got it. I assumed they existed to explicitly avoid relying on
>> __builtin_bswap as they might not exist. However, I did a quick grep and
>> found that there are some uses in the wild.
> 
> Right, I do remember when we had a discussion about this maybe
> 15 years ago when gcc didn't have the builtins on all architectures
> yet, but those versions are long gone, and we never cleaned it up.

I just had a chance to look at this and it looks a bit more complex than
I initially thought. ___constant_swab macros are used in more places
than I expected, and {little,big}_endian.h define their own macros that
are used elsewhere, ...

It is not clear to me how to proceed here. I could:

  1) Just remove ___constant_swab macros and replace them with
  __builtin_swap everywhere

  2) Go a step further and evaluate removing __constant_htonl and
  relatives

Let me know what you think is the best option :)

I'll resend this series without this patch (and make the RISC-V use
fall back into __builtin_bswap)
 
>> I couldn't find compiler builtins for ___constant_swahb32 nor 
>> ___constant_swahw32, so I guess I'll leave them as they are.
> 
> Correct. There are also 24-bit and 48-bit swap functions
> in include/linux/unaligned.h that have no corresponding builtins.

Thanks for clarifying!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
