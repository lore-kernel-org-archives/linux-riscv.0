Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EF1C369D5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 12:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=584YZOyvha3M4rqIicndtyRnQxwyHFejO3s6s2BcOHA=; b=gUJ0KeyvWb4HOk
	aqXzz9w7B32qbBv8YxLO9u64+g6vEh8vZ+nfEcvkI+dyPT/TBttXpo1XEoqZXetUrsEh0CzQiJ1dS
	vgofAcWug5QGd6GCLg/+UNqymd8//e1lT1KOqvVH3tioJJSPE2Yw51yMOda6jLgE4H89ZcbTBrpRM
	OPqRWeEFdbbajMC59bhAMg1FfJQXDttG51fNN43JmYGp6SGki06OcmWmgUSYc3zaVE9CPGQRBzC6P
	fNutUMpXJCHXZcOZO8anjTL14bYpX3byb4vyBzxLQLohmxpkPpd5XcjTWI2nZEeetMVnSHz0CLHn4
	UbRfKnBnyDcgWEZakYPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Yqb-0000000AQN1-1fqC;
	Wed, 23 Apr 2025 12:05:01 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XyF-0000000AGBG-1K6K
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 11:08:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B00943892;
	Wed, 23 Apr 2025 11:08:43 +0000 (UTC)
Message-ID: <66a5aba9-2a32-4ef9-a839-a389b975757d@ghiti.fr>
Date: Wed, 23 Apr 2025 13:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] riscv: introduce asm/swab.h
Content-Language: en-US
To: Ignacio Encinas <ignacio@iencinas.com>, Arnd Bergmann <arnd@arndb.de>,
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
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <b3f8e641-9690-4792-974c-c895d2e4531a@iencinas.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeigeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejkeeugfdthefhveelffdvgeetgeelteeijeekheehfeevtdduvdfgteevgfehffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemtgeludgrmegtkeehvgemtgduuddtmeekuggvvdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepihhgnhgrtghiohesihgvnhgtihhnrghsrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtp
 hhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugidruggvvh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_040851_549006_43C8285E 
X-CRM114-Status: GOOD (  20.71  )
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

Hi Ignacio,

On 04/04/2025 19:35, Ignacio Encinas wrote:
>
> On 4/4/25 7:58, Arnd Bergmann wrote:
>> On Thu, Apr 3, 2025, at 22:34, Ignacio Encinas wrote:
>>> +#define ARCH_SWAB(size) \
>>> +static __always_inline unsigned long __arch_swab##size(__u##size value) \
>>> +{									\
>>> +	unsigned long x = value;					\
>>> +									\
>>> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
>>> +		asm volatile (".option push\n"				\
>>> +			      ".option arch,+zbb\n"			\
>>> +			      "rev8 %0, %1\n"				\
>>> +			      ".option pop\n"				\
>>> +			      : "=r" (x) : "r" (x));			\
>>> +		return x >> (BITS_PER_LONG - size);			\
>>> +	}                                                               \
>>> +	return  ___constant_swab##size(value);				\
>>> +}
> Hello Arnd!
>
>> I think the fallback should really just use the __builtin_bswap
>> helpers instead of the ___constant_swab variants. The output
>> would be the same, but you can skip patch 1/2.
> I tried, but that change causes build errors:
>
> ```
> undefined reference to `__bswapsi2'
>
> [...]
>
> undefined reference to `__bswapdi2
> ```
>
> I tried working around those, but couldn't find a good solution. I'm a
> bit out of my depth here, but I "summarized" everything here [1]. Let me
> know if I'm missing something.
>
> [1] https://lore.kernel.org/linux-riscv/b3b59747-0484-4042-bdc4-c067688e3bfe@iencinas.com/

Note that I only encountered those issues in the purgatory.

So to me we have 3 solutions:

- either implementing both __bswapsi2 and __bswapdi2

- or linking against libgcc

- or merging patch 1.

Given the explanation in commit d67703a8a69e ("arm64: kill off the 
libgcc dependency"), I would not use libgcc.

The less intrusive solution (for us riscv) is merging patch 1.

But please let me know if I missed another solution or if I'm wrong.

Thanks,

Alex


>
>> I would also suggest dumbing down the macro a bit so you can
>> still find the definition with 'git grep __arch_swab64'. Ideally
>> just put the function body into a macro but leave the three
>> separate inline function definitions.
> Good point, thanks for bringing it up. Just to be sure, is this what you
> had in mind? (Give or take formatting + naming of variables)
>
> #define arch_swab(size, value) 						\
> ({                      						\
> 	unsigned long x = value;					\
> 									\
> 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
> 		asm volatile (".option push\n"				\
> 			      ".option arch,+zbb\n"			\
> 			      "rev8 %0, %1\n"				\
> 			      ".option pop\n"				\
> 			      : "=r" (x) : "r" (x));			\
> 		x = x >> (BITS_PER_LONG - size);			\
> 	} else {                                                        \
> 		x = ___constant_swab##size(value);                      \
> 	}								\
> 	x;								\
> })
>
> static __always_inline unsigned long __arch_swab64(__u64 value) {
> 	return arch_swab(64, value);
> }
>
> Thanks!
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
