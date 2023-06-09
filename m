Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123DDC7EE25
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 06:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qajlcYiU3UeE4S/JHBZIe8znpEipuvDid5QMTENEtBE=; b=Jy+mxegJpco6+ZT91A1UC4pt8t
	3kWHGOaOqr4/vL7mdeu87vyJVLws59ZIFD3mjXZ6bD2/ycLUUIi3x+NzIOXaGAAwPofwSVjUbsWcR
	jD5WBp5PkJg5tHlPeUbOtgbtxfrSMYqNqGsQ2oOVVaS7R9PanH8a7oMLsCHm+DgdjWUenqUO5IWPK
	tskIzfe1328D0/YkE3xsaFCQtXbcOB0bfEa+GH9Y2okdzp9aZJzUuLH9X0eDumVv6Zih4/bV9jgRx
	UKJjipE4hwyJQ+cg2k/5vmmnU/BFBORNWUgoaVnBUuD/jIvCvn5b9wR+eXLN4zz+hkdozc84VrK+h
	/QUkTLTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Vy4-00Bx2H-1o;
	Fri, 09 Jun 2023 06:51:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Vy2-00Bx16-1j;
	Fri, 09 Jun 2023 06:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=HZc8i7vfo5MV8665vNlsx1G1jL+up2kYCRDmRVXOMbE=; b=YrVjFENOv0WBGbCse1Y8agf9iw
	bqpNJY+4N7badb1s4LRIssA2AymTyiw3msBh5EoAznjm0SxMh8wk9hpoahtkOxeK8/hek1PA/8V+S
	wJCuHZsjU1PCockvL4cyVGOVUdeFVDy41vjZ0aNoT58LIdYsCbdMwJzn1OgGsYjK+Up+aSUQP40gH
	3ZRuRCJM+UQ1pKc6noLi+tWsK3EN96GEfKZWv+xJex9ZGaSEATgcNOauMNMmtKtDdTbYkF/bRz8EU
	eIHjgxEZ5I2a15QjpnVXlQxi58cC91Du+hbTry6P2rSCIaqo4bsWp8Y2AEjCkFb/vntUu8YT3HFGf
	XQz1PXlg==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q7Vxu-00GHWY-HM; Fri, 09 Jun 2023 06:51:22 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxrOrVy4JkbfAAAA--.2918S3;
	Fri, 09 Jun 2023 14:51:02 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxZuTSy4Jk8QsKAA--.30794S3;
	Fri, 09 Jun 2023 14:51:00 +0800 (CST)
Subject: Re: [RFC PATCH] asm-generic: Unify uapi bitsperlong.h
To: Arnd Bergmann <arnd@arndb.de>
References: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
 <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
 <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
 <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 llvm@lists.linux.dev, linux-ia64@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
 x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <ca4c4968-411d-4e2c-543e-ffb62413ddef@loongson.cn>
Date: Fri, 9 Jun 2023 14:50:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
X-CM-TRANSID: AQAAf8AxZuTSy4Jk8QsKAA--.30794S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr1UWFy8Kr1kJFy7Kr47KFX_yoW5JFyrpF
	4UGF1j9r4kAr1fAFn2yw4jqa4Fyws7KF1aq3s0gryxJFs0gFyrtry29w4agFWqvr18Jr4j
	93yUXFy5uay0yFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUs3C7UU
	UUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_075119_243978_05DE0243 
X-CRM114-Status: GOOD (  19.08  )
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



On 06/08/2023 08:56 PM, Arnd Bergmann wrote:
> On Thu, Jun 8, 2023, at 09:04, Tiezhu Yang wrote:
>> On 05/09/2023 05:37 PM, Arnd Bergmann wrote:
>>> On Tue, May 9, 2023, at 09:05, Tiezhu Yang wrote:
>>>
>>> I think we are completely safe on the architectures that were
>>> added since the linux-3.x days (arm64, riscv, csky, openrisc,
>>> loongarch, nios2, and hexagon), but for the older ones there
>>> is a regression risk. Especially on targets that are not that
>>> actively maintained (sparc, alpha, ia64, sh, ...) there is
>>> a good chance that users are stuck on ancient toolchains.
>>> It's probably also a safe assumption that anyone with an older
>>> libc version won't be using the latest kernel headers, so
>>> I think we can still do this across architectures if both
>>> glibc and musl already require a compiler that is new enough,
>>> or alternatively if we know that the kernel headers require
>>> a new compiler for other reasons and nobody has complained.
>>>
>>> For glibc, it looks the minimum compiler version was raised
>>> from gcc-5 to gcc-8 four years ago, so we should be fine.
>>>
>>> In musl, the documentation states that at least gcc-3.4 or
>>> clang-3.2 are required, which probably predate the
>>> __SIZEOF_LONG__ macro. On the other hand, musl was only
>>> released in 2011, and building musl itself explicitly
>>> does not require kernel uapi headers, so this may not
>>> be too critical.
>>>
>>> There is also uClibc, but I could not find any minimum
>>> supported compiler version for that. Most commonly, this
>>> one is used for cross-build environments, so it's also
>>> less likely to have libc/gcc/headers being wildly out of
>>> sync. Not sure.
>>>
>>>       Arnd
>>>
>>> [1] https://sourceware.org/pipermail/libc-alpha/2019-January/101010.html
>>>
>>
>> Thanks Arnd for the detailed reply.
>> Any more comments? What should I do in the next step?
>
> I think the summary is "it's probably fine", but I don't know
> for sure, and it may not be worth the benefit.

Thank you, it is very clear now.

> Maybe you can prepare a v2 that only does this for the newer
> architectures I mentioned above, with and an explanation and
> link to my above reply in the file comments?

Only arm64, riscv and loongarch belong to the newer architectures
which are related with this change, I am not sure it is necessary
to "unify" uapi bitsperlong.h for them.

Anyway, let me try, I will send a new version, maybe this is going
to progress in the right direction.

Thanks,
Tiezhu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
