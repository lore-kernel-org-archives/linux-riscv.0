Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AF1C36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 17:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCI2Rxff9QViagyBKFvsgBB5G4YJD0/wMARq5L4V4xU=; b=vm/OqaRKFJKIpv
	oVEiCba2AhMiegfVcSCpvpEtB9O+y5MOO3/EC40L9uWwbErtNbKvP/nHhHeNneWjReCVleBHI5Wtd
	k98xpScuGRptKmWMfZZDzqt9ohqpaJOVTVGBM2VlaSOF92gGviq4Xd//nqUp4KC+agd9cmb6usMDi
	VBmZvi6DLrrhT5UdXCunE3UigRC0hPMALZ8oO7Rduqrktw3PE98cjgRATyACG7f5rgq01ldGR9x9y
	LNAZzFOwSgM9r9gQqLDHvB+LjUSFfhhw0nArB7+wTxaVfNrliYB3y4eQpnFZkrb17cbUmOusi/wkC
	gZ1kX1QwTXZ80zGyeFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kwk-0000000CQ38-0Ugz;
	Fri, 04 Apr 2025 17:35:14 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kwg-0000000CQ2P-27PN
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 17:35:12 +0000
Message-ID: <b3f8e641-9690-4792-974c-c895d2e4531a@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1743788106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N2/fZZA4UL9XJIEHQ+/bBTVFu2hgzKlDY3S+eN0cDvg=;
	b=Hl5AQsdv2ftxLfGgWfsSkVOMa+4AgcivN/fnTLwoWKanl5iGKyiragWuaSPdPfjF2x0FGX
	zseE+ZwxVKLbsoZn+le3RmgYE5pbbj9YdfFnsF9fi1glUuSZL7ESp/Jj2oD12892ktWqCv
	7q+ttQIaUabPjTD7bOfoTHuqFbLqNp3+wBi1uMKoNw6Yldd0Pm+XzzM8rvipfZiyKAe2cW
	0zSRTFJ8CN1xo3GnysgVRKLiRiSEs/Gu8EF2P33sv6Xxi0we/InQTI8PC30T8e50Dt/5pC
	WdxOGZ+Q0tTMDcEw/hvNvZnLVYZSbFAdBf/uxfZ+BN547fsyn1I2soTwOFQRUg==
Date: Fri, 4 Apr 2025 19:35:00 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] riscv: introduce asm/swab.h
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>
References: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
 <20250403-riscv-swab-v3-2-3bf705d80e33@iencinas.com>
 <c6efcdca-5739-42b6-8cb4-f4d8cc85b6af@app.fastmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas <ignacio@iencinas.com>
In-Reply-To: <c6efcdca-5739-42b6-8cb4-f4d8cc85b6af@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_103510_977829_ABA3D9F4 
X-CRM114-Status: GOOD (  12.79  )
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



On 4/4/25 7:58, Arnd Bergmann wrote:
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

Hello Arnd!

> I think the fallback should really just use the __builtin_bswap
> helpers instead of the ___constant_swab variants. The output
> would be the same, but you can skip patch 1/2.

I tried, but that change causes build errors:

```
undefined reference to `__bswapsi2'

[...]

undefined reference to `__bswapdi2
```

I tried working around those, but couldn't find a good solution. I'm a 
bit out of my depth here, but I "summarized" everything here [1]. Let me
know if I'm missing something.

[1] https://lore.kernel.org/linux-riscv/b3b59747-0484-4042-bdc4-c067688e3bfe@iencinas.com/

> I would also suggest dumbing down the macro a bit so you can
> still find the definition with 'git grep __arch_swab64'. Ideally
> just put the function body into a macro but leave the three
> separate inline function definitions.

Good point, thanks for bringing it up. Just to be sure, is this what you
had in mind? (Give or take formatting + naming of variables)

#define arch_swab(size, value) 						\
({                      						\
	unsigned long x = value;					\
									\
	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
		asm volatile (".option push\n"				\
			      ".option arch,+zbb\n"			\
			      "rev8 %0, %1\n"				\
			      ".option pop\n"				\
			      : "=r" (x) : "r" (x));			\
		x = x >> (BITS_PER_LONG - size);			\
	} else {                                                        \
		x = ___constant_swab##size(value);                      \
	}								\
	x;								\
})

static __always_inline unsigned long __arch_swab64(__u64 value) {
	return arch_swab(64, value);
}

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
