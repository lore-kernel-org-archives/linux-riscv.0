Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EBAEB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdfpSJGjutWZ9uveV9UmPTuBwCvgWgG1CrRi7FVPhxQ=; b=uYVxFVvXoKPGo+xVxXn49mtKRc
	faKAKgPt4/ZUEN9Tt+dAvTQwV9UGHPX8XcmroTWeCXAdd9iFo2su3Svik3QIEfn7eCL4RThKLy115
	QKzSxM9NoIroZH7pH6kqqHEX80O+TRzAeFVB6SXj0bst6Z6STAibXW3/JPHXw/WCVseB+BLIU6CM7
	CtrXqXkN9LjAoiUUoBb7R+6NxyAYvGIIdfvXCwmvWm8JbeJqPD9w8EqZyGPDyacFHrTYppiSJ8s5s
	HpIPVmyAIPWbTlnQtR715+NNd731VtUct5LFs1reFVGgLLB2/WVqeW5ENBwU/mHw/U3hk+E1DUuQq
	MEI54z4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCJlu-000eZj-1F;
	Thu, 22 Jun 2023 12:50:46 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCJlt-000eZ5-2F;
	Thu, 22 Jun 2023 12:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=onHLT2YG9Snm1ehd7uM2IQJnaRzMQJUwXItZCaN+V7g=; b=TbxbzXNpEcKT6ZTaWTKLFGOpYw
	uSKKSwb6amUpGxgxpqcn61zwwrBxz2C1JYf0cGoJXGktLhTEYj25ba31lZEBx/p+Yp5U29daTEntB
	Qrt2cpj+3mB5jvtwdGHsPKoC15x4JJFVb+I1pN9rYyKiDPJcPqASd2Niv+CJTsf78uDabdxO00XLL
	AfKGW7j02NnP6o3uIj+BSETZQljmXI3zlB8soDTvee0p5PZsI/WMUqW80JUjAEQ3Myno45qib3/uD
	T3YZ1K3hKoamGQWjgLofQjiASYYgTG3MQl9ypYgrD19iUyNq//DWi1amUZbvo592k7dsrUdgxQnbR
	Iqy3qD5g==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qCJll-00Fbxs-95; Thu, 22 Jun 2023 12:50:41 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxU8SMQ5Rku28AAA--.775S3;
	Thu, 22 Jun 2023 20:50:21 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxWM2LQ5RkrxwCAA--.11455S3;
	Thu, 22 Jun 2023 20:50:19 +0800 (CST)
Subject: Re: [PATCH v2 1/2] asm-generic: Unify uapi bitsperlong.h for arm64,
 riscv and loongarch
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
References: <1687336748-4898-2-git-send-email-yangtiezhu@loongson.cn>
 <202306220334.C80BpATp-lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <27295ba8-f57e-61c1-9cc4-f2207fd97ae0@loongson.cn>
Date: Thu, 22 Jun 2023 20:50:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <202306220334.C80BpATp-lkp@intel.com>
X-CM-TRANSID: AQAAf8CxWM2LQ5RkrxwCAA--.11455S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtF1ktrWrtFWDtr1xCF13Jrc_yoW3Wrb_A3
	4aywsrGr1S9Fyqqws8CwsaqFyDJayUC3sruwn5Jw4DGFWIkw48Jws3W3srJF4kKrZxtw13
	ZasYqr9Yyw17KosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jeXdbUUU
	UU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_135039_912165_6040C118 
X-CRM114-Status: UNSURE (   7.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 06/22/2023 04:04 AM, kernel test robot wrote:
> Hi Tiezhu,
>
> kernel test robot noticed the following build warnings:
>

...

>    In file included from include/asm-generic/bitsperlong.h:5:
>>> include/uapi/asm-generic/bitsperlong.h:13:9: warning: '__BITS_PER_LONG' macro redefined [-Wmacro-redefined]

Oh, thanks for the report, I am sorry.

In order to silence the build warning, it should check the definition
of __BITS_PER_LONG first at the beginning of bitsperlong.h, like this:

#ifndef __BITS_PER_LONG

#if defined(__CHAR_BIT__) && defined(__SIZEOF_LONG__)
#define __BITS_PER_LONG (__CHAR_BIT__ * __SIZEOF_LONG__)
#else
#define __BITS_PER_LONG 32
#endif

#endif

I will test and then send v3 later.

Thanks,
Tiezhu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
