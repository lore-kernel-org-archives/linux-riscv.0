Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23520C36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 18:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8x1CChsxeMxxRXZLe2BuP0zdI0NNv+ucJxUsJYSLkmA=; b=Hej3jTOjb29a89
	3QZiiD26k8RT30erx/B0QZ7mEruUB5zH0p1lIHwqIKO8As3Tk1GOc8AaqNml9/AOqBJpg9eMERLeP
	sSFToYgBNOKfCYN4161iU/3YJUeMATSL23PNpR3FE3p/0D36tUgbhaSCunYnfIkVQqfiAFZ9qf7j1
	PvGPvcoiu47v2kpO/zbXUvEHl5+MDiVuk+5/3A7tibaLwUASeRUG/ZIqUBOMm7gSWLWHsMdrcWFwv
	oJVqF/cUPzkqYqb7v6Hwcg7+a10277+vxP9bE7MyxPqmU+he3d168ghV9RViuSo7pIkb+KzwG+F49
	oHbOuPc0sDDnauulaSyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lcQ-0000000CW4s-0Bd3;
	Fri, 04 Apr 2025 18:18:18 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lXj-0000000CVGi-3uQe
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 18:13:29 +0000
Message-ID: <d03cb69d-d9a3-46fb-a283-d429a9389606@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1743790405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVNe9DB4JVS7mxluiBxcFesLyFlFXgqdxhl/MDOzqcY=;
	b=X7/KzN87/UO8MjCyQhAFLFpd4xU4Rssl/ezCIa3HYBH0BOtlU/YCJSSqcZERqRM4yKYu8A
	yMgGqdW/7vIuBTYE67LVQN6hxapbTAuWawGihHgrN8uS4frbqmiAK6cErBHgI2KNfm4r7m
	yiDIp6BGrDZj93AUpKiTQZJJWivU7jFr/DZTs3njv1dAgahFs4hmePYI8CumIlaU4G5gCZ
	NMENgUzoNCwqr612hNffJ/t8O42gPP1I/0yHjzl2xBQQArcDxfbBxEkL1+CiQ0GGzkhiP4
	FCZypS8QGicnAUx90Gj93LPTSr4iGs/DsdNl4j0zDU7RtLVftfXntQv1lL4Hug==
Date: Fri, 4 Apr 2025 20:13:17 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] riscv: introduce asm/swab.h
To: Ben Dooks <ben.dooks@codethink.co.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 linux-arch@vger.kernel.org
References: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
 <20250403-riscv-swab-v3-2-3bf705d80e33@iencinas.com>
 <99b7b45a-4b18-4f0d-a197-4dccbb6c2352@codethink.co.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas <ignacio@iencinas.com>
In-Reply-To: <99b7b45a-4b18-4f0d-a197-4dccbb6c2352@codethink.co.uk>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_111328_207602_9BEFB6C9 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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



On 4/4/25 17:55, Ben Dooks wrote:
> On 03/04/2025 21:34, Ignacio Encinas wrote:
>> +#ifdef CONFIG_64BIT
>> +ARCH_SWAB(64)
>> +#define __arch_swab64 __arch_swab64
>> +#endif
> 
> I suppose if we're 64bit we can't just rely on values being in one
> register so this'd need special casing here?

Oops... I somehow decided that __arch_swab64 wasn't worth having for
CONFIG_32BIT. I can't tell how useful it is to have it, but it is
doable and already present in the codebase (include/uapi/linux/swab.h):

	__u32 h = val >> 32;
	__u32 l = val & ((1ULL << 32) - 1);
	return (((__u64)__fswab32(l)) << 32) | ((__u64)(__fswab32(h)));

I'll excuse myself on this one because I'm not sure I have ever used a
32 bit CPU (other than the very occasional and quick school project)

Thanks for catching this one! I'll make sure to add __arch_swab64 for
the 32BIT version mimicking the snippet from above.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
