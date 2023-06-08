Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816E3C7EE25
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 07:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trPIJTOFtizg5ESqcWgeUWh5Hs4lceXzuWshzrB+4Lw=; b=DlMZYPO3s3QI1pZ492ZsUGbtf8
	e2IydAbwfqNf+ShsxUnk3yHoeVh1sfp2WsGjyzGl9nYmX2xI8Bjtzmy4IiP8l3te5+GpWpELeAgQ0
	gPxT9deGTGwDodeC47ZFXzie7yKRnNM2KZUAOFgEAJAzeuLhtEdvHgDXtw7h8VxGehdcxrB3JXYeD
	znE+e/z+qIvP8t49LDFv4aSmGtpwMwa+FVNWq1pG4wyV8ZprMdJCzhwDn6WqVW74kup3tfUSo/e4Q
	1qo4ie+h9z2kYZQl2pKptoInRwplBM56yumbzJth7/uOH6dP/y550+L6ShOE1gZ0qvumChKnqJzHH
	6oAWUCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q79h8-008LLI-1S;
	Thu, 08 Jun 2023 07:04:30 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q79h4-008LIg-1u;
	Thu, 08 Jun 2023 07:04:28 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bxa+pwfYFkL3IAAA--.1733S3;
	Thu, 08 Jun 2023 15:04:16 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxC8ptfYFk49MGAA--.13616S3;
	Thu, 08 Jun 2023 15:04:14 +0800 (CST)
Subject: Re: [RFC PATCH] asm-generic: Unify uapi bitsperlong.h
To: Arnd Bergmann <arnd@arndb.de>
References: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
 <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
Cc: linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org,
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
Date: Thu, 8 Jun 2023 15:04:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
X-CM-TRANSID: AQAAf8BxC8ptfYFk49MGAA--.13616S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXw1UJry5Ww1rXr47ZrW8AFc_yoW5Ww1UpF
	47Jw12gF4qkr1ftrn7Gw47Za45Jwn3Ka1ak39agryxZFW5Wry7trZF9rWagFykXrW8tF4q
	vrZ8tryjkay8AagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wr
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jO
	db8UUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_000427_056224_C3554E4F 
X-CRM114-Status: GOOD (  28.83  )
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

Hi all,

On 05/09/2023 05:37 PM, Arnd Bergmann wrote:
> On Tue, May 9, 2023, at 09:05, Tiezhu Yang wrote:
>> Now we specify the minimal version of GCC as 5.1 and Clang/LLVM as 11.0.0
>> in Documentation/process/changes.rst, __CHAR_BIT__ and __SIZEOF_LONG__ are
>> usable, just define __BITS_PER_LONG as (__CHAR_BIT__ * __SIZEOF_LONG__) in
>> asm-generic uapi bitsperlong.h, simpler, works everywhere.
>>
>> Remove all the arch specific uapi bitsperlong.h which will be generated as
>> arch/*/include/generated/uapi/asm/bitsperlong.h.
>>
>> Suggested-by: Xi Ruoyao <xry111@xry111.site>
>> Link:
>> https://lore.kernel.org/all/d3e255e4746de44c9903c4433616d44ffcf18d1b.camel@xry111.site/
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>
> I originally introduced the bitsperlong.h header, and I'd love to
> see it removed if it's no longer needed. Your patch certainly
> seems like it does this well.
>
> There is one minor obstacle to this, which is that the compiler
> requirements for uapi headers are not the same as for kernel
> internal code. In particular, the uapi headers may be included
> by user space code that is built with an older compiler version,
> or with a compiler that is not gcc or clang.
>
> I think we are completely safe on the architectures that were
> added since the linux-3.x days (arm64, riscv, csky, openrisc,
> loongarch, nios2, and hexagon), but for the older ones there
> is a regression risk. Especially on targets that are not that
> actively maintained (sparc, alpha, ia64, sh, ...) there is
> a good chance that users are stuck on ancient toolchains.
>
> It's probably also a safe assumption that anyone with an older
> libc version won't be using the latest kernel headers, so
> I think we can still do this across architectures if both
> glibc and musl already require a compiler that is new enough,
> or alternatively if we know that the kernel headers require
> a new compiler for other reasons and nobody has complained.
>
> For glibc, it looks the minimum compiler version was raised
> from gcc-5 to gcc-8 four years ago, so we should be fine.
>
> In musl, the documentation states that at least gcc-3.4 or
> clang-3.2 are required, which probably predate the
> __SIZEOF_LONG__ macro. On the other hand, musl was only
> released in 2011, and building musl itself explicitly
> does not require kernel uapi headers, so this may not
> be too critical.
>
> There is also uClibc, but I could not find any minimum
> supported compiler version for that. Most commonly, this
> one is used for cross-build environments, so it's also
> less likely to have libc/gcc/headers being wildly out of
> sync. Not sure.
>
>       Arnd
>
> [1] https://sourceware.org/pipermail/libc-alpha/2019-January/101010.html
>

Thanks Arnd for the detailed reply.
Any more comments? What should I do in the next step?

Thanks,
Tiezhu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
