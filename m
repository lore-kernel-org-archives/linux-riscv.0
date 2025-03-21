Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC63C36007
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 21:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMChqRFpakIAfwAHYr0o/ebV55YZAYRYhZNDprUnnrc=; b=wSxTgYDyXpp/Zt
	VSaUqPhSuzrLKsg8eGnbTXMFldC/sCLduQnDqV4yrEkT/k6F/a8YGYdikXbEpPRMxY2m0w2nesALH
	4wqI28mi353sdJq110ChAL9YPaoHte9ye6N8ePDN9U6ZWHM3xfPE9bMFrvn5BXGMSkeABM7X5qC6Q
	um6WUkYY+g3EtVI5SxFE+L7Mvav6GceDHsooUaSRGgn+NAfXiWSShj3bkp0YV9AvnGVF1tkpAfmjj
	ZzQ1ffeomVr/xBwmpvpaVpoADH/RdGYQE4O+hY28x0xAxB/Ta6upETAEmi3NvthzKcQKJdf+Hls0K
	DtAu91Qym2oQtSPD3BcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjas-0000000GJ5W-2il2;
	Fri, 21 Mar 2025 21:07:54 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjao-0000000GJ4Q-0xiV
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 21:07:52 +0000
Message-ID: <fd8e4380-eba3-4602-b925-d81c0afed6d8@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742591266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tlC6VNAA0VKAuMw2O3RagiC9hLYLd/5P5o/W8WtfpYs=;
	b=mxIWHDCeeOon6AofoQVDS+HDSKfYnVbPF754rvwIAwLC/90cv4eaY2l7cOOmH71p4z4pYd
	3eb/sNdx0t06NJ6Uv2tnHtnP7ig3INMcIuHTY+GjKlFICWFi4gdK0pxJXanvDLMc7kxmIu
	WYCfKmw/2vvmgzkPVEOWRWMv3zdx5T9+nqqyL/0hgimAd77zQKiQMlMz7e2EzLfEnaxF8E
	CJhtGjidv1dnu83bXQXOaPz2SvRScNjw0/nZgHIa58dpHyTWxmCXc3zDdeOck9kezpPwPU
	Z8SR5t09thvptD8qA8BdOh+isZLwUBLvO9jsPbc83RG3UEXWlKwnC0wnBoX/zQ==
Date: Fri, 21 Mar 2025 22:07:41 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] riscv: introduce asm/swab.h
To: Eric Biggers <ebiggers@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 linux-arch@vger.kernel.org
References: <20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com>
 <20250319-riscv-swab-v2-2-d53b6d6ab915@iencinas.com>
 <20250321033718.GA98513@sol.localdomain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
In-Reply-To: <20250321033718.GA98513@sol.localdomain>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_140750_772873_C8E8A17F 
X-CRM114-Status: GOOD (  10.15  )
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



On 21/3/25 4:37, Eric Biggers wrote:
> On Wed, Mar 19, 2025 at 10:09:46PM +0100, Ignacio Encinas wrote:
>> +#define ARCH_SWAB(size) \
>> +static __always_inline unsigned long __arch_swab##size(__u##size value) \
>> +{									\
>> +	unsigned long x = value;					\
>> +									\
>> +	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,			\
>> +			     RISCV_ISA_EXT_ZBB, 1)			\
>> +			     :::: legacy);				\
> 
> Is there a reason to use this instead of
> riscv_has_extension_likely(RISCV_ISA_EXT_ZBB) which seems to do the same thing,
> including using a static branch?

I just followed what's already in arch/riscv/include/asm/bitops.h

However, I changed it to

	if(riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
		asm volatile (".option push\n"
			      ".option arch,+zbb\n"
			      "rev8 %0, %1\n"
			      ".option pop\n"
			      : "=r" (x) : "r" (x));
		return x >> (BITS_PER_LONG - size);
	}

	return  ___constant_swab##size(value);

and it seems gcc generates the exact same code. I tested it with 
arch/riscv/lib/csum.c (which uses swab32) and both versions generate the
exact same object file.

This certainly looks easier to read. If there are no complaints I'll
send a v3 using a plain if with riscv_has_extension_likely.

Thanks for pointing it out!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
