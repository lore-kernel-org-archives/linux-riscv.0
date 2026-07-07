Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA77BC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 13:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3q99ps+7BYQGBYKv7J+BHHZAK1dKE+6iv2iW9UX2s/I=; b=C6LIjsIMOkQNe0
	6+kQ/iskrP+WHlmXSgB1Khw9F58nwIpeYLgWu/ssG3rFnV4apUbpEs9YUYmwDj1F3QTQ+81sdvD9w
	9Rmc3T3u6gsvz6F7FW9jZ3O4v3Sg8/BoxDHdiZugKmihnkGoehUgeWUbZWKGQrXPDtaRkv356DY9A
	1x/TTMew6W/RxwsWaqa8Saf6zbsy4QkYNrJJJLwkaDcoFa0fE8y/eypFqTA0RhMUN7rahcv8Y7LO2
	cvt29wGPhGEIc7dn+mCdVdDklPwhfnmRkdK44lPGMYNjaNojTiYuZjq3wCiUgE3IUy9LVmkIPCw8D
	D37kJ1AoIet/cHP1GJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6AD-0000000F5I1-2nsa;
	Tue, 07 Jul 2026 13:48:41 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6A9-0000000F5Gi-0xY7
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 13:48:40 +0000
Message-ID: <4320145e-a0ba-40f6-b99b-f01f32634f28@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783432101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PeXRy5OWREcqxAhLOrbYEMd2NpniYtCVndcj0EJ5z58=;
	b=jxfgT/1XOYBNftDoCCQtjO1UTLEGZqcaSM3erJbI5MSNI1hw+uNxPNVFEMZ1k1OYxIlRDQ
	bARn0NHa6HqJR4RgWsVPTof/V3DqEHP8Agcf7McGO5jsUtB+UuoOAeU8Yl+tlkM+J2dtsj
	WHZIZ7UGeXrjpEtk5qwhtCKwL02ZdUo=
Date: Tue, 7 Jul 2026 21:48:02 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
To: Pedro Falcato <pfalcato@suse.de>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
 <akeDk49-pPgUDek1@pedro-suse>
 <8f75dc18-dd4c-4989-a76c-eec6cc513ccf@linux.dev>
 <akzN_HNJJWBW7htL@pedro-suse.lan>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <akzN_HNJJWBW7htL@pedro-suse.lan>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_064837_443020_35D6BD66 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Gary Guo <gary@garyguo.net>, linux-riscv@lists.infradead.org, Vlastimil Babka <vbabka@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Jann Horn <jannh@google.com>, Nathan Chancellor <nathan@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alex@ghiti.fr>, "Liam R . Howlett" <liam@infradead.org>, Nicolas Schier <nsc@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2026/7/7 18:01, Pedro Falcato wrote:
> On Fri, Jul 03, 2026 at 10:50:29PM +0800, Leon Hwang wrote:
>> On 2026/7/3 17:44, Pedro Falcato wrote:
[...]
>>>
>>>>  
>>>>    The following architectures currently support this feature: x86-64, arm64,
>>>> -  loongarch and s390.
>>>> +  loongarch, riscv, and s390.
>>>
>>> This is also useless, every 64-bit architecture will support this.
>>
>>
>> Do you mean dropping this sentence, or this change?
> 
> This sentence (this is not architecture specific...).


Got it.

> 
>>
>>>
>>>>  
>>>>    WARNING: This feature breaks programs which rely on relocating
>>>>    or unmapping system mappings. Known broken software at the time
>>>> diff --git a/init/Kconfig b/init/Kconfig
>>>> index 5230d4879b1c..12bb39f637b1 100644
>>>> --- a/init/Kconfig
>>>> +++ b/init/Kconfig
>>>> @@ -2112,7 +2112,7 @@ config ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
>>>>  	  from a kernel perspective.
>>>>  
>>>>  	  After the architecture enables this, a distribution can set
>>>> -	  CONFIG_MSEAL_SYSTEM_MAPPING to manage access to the feature.
>>>> +	  CONFIG_MSEAL_SYSTEM_MAPPINGS to manage access to the feature.
>>>>  
>>>>  	  For complete descriptions of memory sealing, please see
>>>>  	  Documentation/userspace-api/mseal.rst
>>>> diff --git a/mm/mseal.c b/mm/mseal.c
>>>> index 9781647483d1..0464c7b94ab9 100644
>>>> --- a/mm/mseal.c
>>>> +++ b/mm/mseal.c
>>>> @@ -132,8 +132,8 @@ static int mseal_apply(struct mm_struct *mm,
>>>>   *   addr is not a valid address (not allocated).
>>>>   *   end (start + len) is not a valid address.
>>>>   *   a gap (unallocated memory) between start and end.
>>>> - *  -EPERM:
>>>> - *  - In 32 bit architecture, sealing is not supported.
>>>> + *  -EINTR:
>>>> + *   interrupted while waiting for the mmap write lock.
>>>>   * Note:
>>>>   *  user can call mseal(2) multiple times, adding a seal on an
>>>>   *  already sealed memory is a no-action (no error).
>>>
>>> And this whole header needs to be deleted as well. No one's looking at
>>> kernel code for documentation (and if they are, we did a horrendous job
>>> at actually documenting the thing).
>>>
>>
>> Just to confirm, do you mean removing the entire function comment above
>> do_mseal()?
> 
> Yes. Again, not your fault, just old gripes :)
> 

Got it.

Thanks,
Leon



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
