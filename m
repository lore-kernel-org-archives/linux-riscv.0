Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC058C3A5A4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 17:08:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82D3223407
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 17:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n8wVd+ld"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82D3223407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=virtuozzo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vaxRupWoGUl0Ew5hN2r4iq9xRZ6MfOVBGURusjYeggA=; b=n8wVd+ldgZiJuA
	nEUuiuEUr5XEN6mMevhP02lguKY2Dyw5BiWxXeDh6AIE9YLsYGrzfyf4WxJQxuY2aNEfwMCFT4r3U
	d2E7QSSfjEswn7R3FerImlbXGx3eBgqSQ5Wc9ttcj28zBcoWyEqgtjmmSt/NZG6LTToWiNxra1nP8
	PbHCTCl1tEuo5/PnDY6ESzgnDAF/wscCPJjVCQ+16mOlz/9zjqIOvyFllIwhkudbR3gH3/9xaMRP5
	XoLaQtcsUuQtIh0At/tl0U9ZVINV7/ssiBAXvCP+mKb7UxzGxgXJlviGGI/a85Zl+ad58iaUpDgE9
	IYIS6ocx3rvNI9HOE7tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0qZL-0005lL-Io; Thu, 22 Aug 2019 17:08:15 +0000
Received: from relay.sw.ru ([185.231.240.75])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0qZI-0005kA-Qr
 for linux-riscv@lists.infradead.org; Thu, 22 Aug 2019 17:08:14 +0000
Received: from [172.16.25.5] by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <aryabinin@virtuozzo.com>)
 id 1i0qYx-0000iY-OZ; Thu, 22 Aug 2019 20:07:51 +0300
Subject: Re: [PATCH 2/2] riscv: Add KASAN support
To: Nick Hu <nickhu@andestech.com>, Christoph Hellwig <hch@infradead.org>
References: <cover.1565161957.git.nickhu@andestech.com>
 <88358ef8f7cfcb7fd01b6b989eccaddbe00a1e57.1565161957.git.nickhu@andestech.com>
 <20190812151050.GJ26897@infradead.org> <20190814074417.GA21929@andestech.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <cf7a4259-afa5-53e6-f8f2-c243339cc3e9@virtuozzo.com>
Date: Thu, 22 Aug 2019 20:08:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814074417.GA21929@andestech.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_100812_865413_EFA9A3D9 
X-CRM114-Status: GOOD (  13.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QWxhbiBRdWV5LUxpYW5nIEthbyjpq5jprYHoia8p?=
 <alankao@andestech.com>, "atish.patra@wdc.com" <atish.patra@wdc.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 =?UTF-8?B?6Zui6IG3Wm9uZyBab25nLVhpYW4gTGko5p2O5a6X5oayKQ==?=
 <zong@andestech.com>, "alexios.zavras@intel.com" <alexios.zavras@intel.com>,
 "Anup.Patel@wdc.com" <Anup.Patel@wdc.com>,
 "glider@google.com" <glider@google.com>,
 "green.hu@gmail.com" <green.hu@gmail.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "deanbo422@gmail.com" <deanbo422@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dvyukov@google.com" <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 8/14/19 10:44 AM, Nick Hu wrote:

>>
>>> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
>>> index 23cd1a9..9700980 100644
>>> --- a/arch/riscv/kernel/vmlinux.lds.S
>>> +++ b/arch/riscv/kernel/vmlinux.lds.S
>>> @@ -46,6 +46,7 @@ SECTIONS
>>>  		KPROBES_TEXT
>>>  		ENTRY_TEXT
>>>  		IRQENTRY_TEXT
>>> +		SOFTIRQENTRY_TEXT
>>
>> Hmm.  What is the relation to kasan here?  Maybe we should add this
>> separately with a good changelog?
>>
> There is a commit for it:
> 
> Author: Alexander Potapenko <glider@google.com>
> Date:   Fri Mar 25 14:22:05 2016 -0700
> 
>     arch, ftrace: for KASAN put hard/soft IRQ entries into separate sections
> 
>     KASAN needs to know whether the allocation happens in an IRQ handler.
>     This lets us strip everything below the IRQ entry point to reduce the
>     number of unique stack traces needed to be stored.
> 
>     Move the definition of __irq_entry to <linux/interrupt.h> so that the
>     users don't need to pull in <linux/ftrace.h>.  Also introduce the
>     __softirq_entry macro which is similar to __irq_entry, but puts the
>     corresponding functions to the .softirqentry.text section.
> 
> After reading the patch I understand that soft/hard IRQ entries should be
> separated for KASAN to work, but why?
> 

KASAN doesn't need soft/hard IRQ entries separated. KASAN wants to know the entry
point of IRQ (hard or soft) to filter out random non-irq part of the stacktrace before feeding it to
stack_depot_save. See filter_irq_stacks().



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
