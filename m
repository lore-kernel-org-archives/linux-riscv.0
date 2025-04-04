Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE19C36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=937n2X5uk2M+b6XMO+8I9VkKy8JjtVixiWELHcuMYpU=; b=zNZW5rTuYTqMTb
	Nl1pU6pYq0XPZfIvs6I49wiSvuhzSSZ552SheDtlyO3y1oax/ifwVYrcurZvFGdYPiUpRwCs21kSZ
	TgiSs6od71X5WYUvmLICTY71I0a/SztR6D43ct8ISm8iGja8slwrCwpaK8YzR1XoAqSJXdEJKWkD+
	b4mWpxFIIRHjdD7nttpGuwJV7h9V80ZHxf4UVqW8XhtbkN+D0J+XWE+mObQJyRoFc1/KX9Sp3HfFc
	vUWxvIRjxSiANTbLJ0hoe3x0DxBoK/Kk3rrJN+z9Hkbj8rIa/vdxiC2SBEn47P84PjqGULeJTmRMm
	qCTfR1wo1LOoNWz3Mnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jNP-0000000CDrh-1qYo;
	Fri, 04 Apr 2025 15:54:39 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jNM-0000000CDrJ-1FhN
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 15:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AbrG0A80aOGQCqeyijoooJcA958xcCPcGbolO2HX8Q8=; b=ixT9bgve0or2vCBIcFZmTJrpQZ
	eulyVEx2oyHCAwsp9RWPHJ5D5qWMUl1mbrq7NNmTM5dFeSU/rd2YIvc65Iy1u200Z7e9uPKaAmDkZ
	dRjEDo+jVfnKL3LGmOjh1TtqqX5fY2ZzELtGhBSVr0WJxRPs8b6KrL530K4iujfsZGAEfyfwvwun/
	jk3hV5FOI+ZP0am+3FT60oAYkcUYmOjR/1tbE/Vn1TgQDxTuRtpClsvYYznXmfZnQluFSq8F46Tdq
	07UBwfb7SPBZAqVOTChTQtw0vjphYr2UQ8XtsQj8KHubuLbOT8qa7bOeL05fgdO9dNIn2BkXiH1qi
	ZSx5AW/A==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1u0jN8-00BgIH-8s; Fri, 04 Apr 2025 16:54:23 +0100
Message-ID: <a7cdade3-8707-4464-8505-356dd5c0c49f@codethink.co.uk>
Date: Fri, 4 Apr 2025 16:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] riscv: introduce asm/swab.h
To: Arnd Bergmann <arnd@arndb.de>, Ignacio Encinas <ignacio@iencinas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>
References: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
 <20250403-riscv-swab-v3-2-3bf705d80e33@iencinas.com>
 <c6efcdca-5739-42b6-8cb4-f4d8cc85b6af@app.fastmail.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <c6efcdca-5739-42b6-8cb4-f4d8cc85b6af@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_085436_343034_CEE25699 
X-CRM114-Status: GOOD (  12.84  )
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

On 04/04/2025 06:58, Arnd Bergmann wrote:
> On Thu, Apr 3, 2025, at 22:34, Ignacio Encinas wrote:
>> +#define ARCH_SWAB(size) \
>> +static __always_inline unsigned long __arch_swab##size(__u##size value) \
>> +{									\
>> +	unsigned long x = value;					\
>> +									\
>> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
>> +		asm volatile (".option push\n"				\
>> +			      ".option arch,+zbb\n"			\
>> +			      "rev8 %0, %1\n"				\
>> +			      ".option pop\n"				\
>> +			      : "=r" (x) : "r" (x));			\
>> +		return x >> (BITS_PER_LONG - size);			\
>> +	}                                                               \
>> +	return  ___constant_swab##size(value);				\
>> +}
> 
> I think the fallback should really just use the __builtin_bswap
> helpers instead of the ___constant_swab variants. The output
> would be the same, but you can skip patch 1/2.
> 
> I would also suggest dumbing down the macro a bit so you can
> still find the definition with 'git grep __arch_swab64'. Ideally
> just put the function body into a macro but leave the three
> separate inline function definitions.

I thought we explicitly disabled the builtin from gc... I tried doing
this and just ended up with undefined calls from these sites.,

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
