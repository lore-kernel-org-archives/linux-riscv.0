Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED413D4A603
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 06:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:References:In-Reply-To:
	Mime-Version:Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3nDsuHtu+Kw3Gh6AtBCXV0gttPqS77+2xL/dx/DZt0=; b=AglT6P2UjfPKVN
	mNLSLo2ceR5VBcqjH5jYEDqWGigTWsOfi/iREaxy/zGEtF/g+pydQoMW6y12HTuQTfXMmZ30fwMVx
	eSQELb3Qpygly8uNch7j27okgRCJl6o51rOnqO41p6W0oX0cDw128NG6IYzSaqpoXyL5OH1w1HLw6
	Zd5HpJxG2GPoU0MyHMOzq1ZP3C+PJeKLtvDOCIERN/FCk+1Rntv0yEjMEdUS5eAyhbS7p42P+I+rT
	hzVsSW2hFBqASMlMxykYGqZcPc4MwhOI9sIAsv7KQBzd0ppL+ItY6vVI1wbTDf8o27hWPdd0vPu5C
	coogWp8hEILmdtR+vX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgd8X-0000000DeLn-0AYH;
	Fri, 16 Jan 2026 06:16:45 +0000
Received: from sg-1-38.ptr.blmpb.com ([118.26.132.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgd8U-0000000DeLP-3hEj
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 06:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1768544186;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=nS5l9OAFjCcF/gbstrCS5nqFISTWoTR1nrXzxjnaQUU=;
 b=oT0QByLlw9Cggxrp7kZ0B4hN6wKLPmW6xK5q/9L6vB8mfhRcu6Z6ZGH+6IxogweQ/F24zi
 U9krz/B79L6iXphLKeV8hkcX/ycChfhYr0M5qvj6Vjm6Lp5vD6Kou2mxiK/B3IpgUd58J1
 yDVKci1m2kutxwUTpTYzdj5APCrqQMKMssmUhKQgagEze/RU6GdHVHKad7fGIW07mW4KGW
 gWf9Ump2eFRe7HqrbhzCiZiXAn75fDGS5L+Axezf4lmQA8xG5YvEe/Vcphv5TMZR/lEXFS
 eARvgSYtrLtG1kgN8KPGoC4q2WqAlLqfuO8Qg4Qjiq54ypCTIR3/tnXRu2u3lg==
Subject: Re: [PATCH] irqchip/riscv-aplic: Register the driver prior to device creation
Received: from [172.16.153.176] ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Fri, 16 Jan 2026 14:16:24 +0800
To: "Thomas Gleixner" <tglx@kernel.org>, 
	"Anup Patel" <apatel@ventanamicro.com>
Cc: <yang.yicong@picoheart.com>, <anup@brainfault.org>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<geshijian@picoheart.com>, <weidong.wd@picoheart.com>, 
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	"Danilo Krummrich" <dakr@kernel.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Fri, 16 Jan 2026 14:16:21 +0800
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Content-Language: en-US
User-Agent: Mozilla Thunderbird
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26969d7b8+dfc8cf+lists.infradead.org+yang.yicong@picoheart.com>
In-Reply-To: <87y0lz2ef6.ffs@tglx>
References: <20260114063730.78009-1-yang.yicong@picoheart.com> <CAK9=C2XrExRLihwveMxs-Ourr+8bXja5UAmN_muAJz5FSpFW8A@mail.gmail.com> <7b859dd5-9262-4d68-9a8e-e0be0c24ac4a@picoheart.com> <877btkht2v.ffs@tglx> <e30ee004-64f9-4003-8907-c407a76fc244@picoheart.com> <87y0lz2ef6.ffs@tglx>
Message-Id: <b2eb7f70-8ee9-43f6-b086-f0c17b1f9e39@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_221643_205990_637783E9 
X-CRM114-Status: GOOD (  12.96  )
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

On 1/15/26 9:28 PM, Thomas Gleixner wrote:
> On Thu, Jan 15 2026 at 16:31, Yicong Yang wrote:
>> so based on above, if we use async_wq (with async_schedule* APIs) in
>> acpi_scan_clear_dep_queue() for creating these devices, the issue
>> could be solved since we're sure to have these devices before entering
>> userspace, since the barrier of async_synchronize_full(). This should be
>> a solution with a conceptual support and I did a quick test on our
>> platform it solves the issue.
> 
> Sounds about right to me. The drivers core and ACPI folks might have
> opinions though :)
> 

sure I'll wait a bit to see if there's further comment before sending out
next version.

>> As for the order of console_on_rootfs()/async_synchronize_full(),
>> though our issue is not directly caused by it, it will cause the
>> same issue (by the console open time the async probing maybe not
>> finised) theoretically and needs to be fixed, is it?
> 
> Yes, that should move past the synchronization point.
> 

will include this fix as a separate patch since they're two separate issue.

thanks a lot for the useful discussion to help find a better solution :)

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
