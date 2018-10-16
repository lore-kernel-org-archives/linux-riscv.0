Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C80C5ACC6
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 22:42:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E490721471
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 22:42:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UJWLaeO2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HunfM1ZY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E490721471
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4z1c24h1fxeVXM2eccplZ8pUH1X71OYe0mkW6uwuTG8=; b=UJWLaeO2RoXa0mxyAI6xjeRWb
	OZQrkGVB3aQ+j/A/NpPn7z9wc5X1BBx7NeU+cUMT8NfgevjeojjFnTAUrMKAFL5MEm5jEgOMn46Sd
	D8fQwvVQQP9ZbZYEHy8VzU8S99gg4qHzdc87Y8M5GSUJvsB9FZPdVbKrYigwT1B1BB/xmUYMj1NsP
	NUU/YeGKPzFz7Rm/jEIQEU9/lAMjDGxhs1o2Bfng8uVdymFNVLYe+pMrwRCdU+lfUmby2BdvtmX45
	8eYURs9jzc7uAXRHqp7qjMWnnqvKu7WS8tUG+Ez33mI7g+idV8qkW1qIYbmVY0BBxtlNSOAkXx/8y
	hi58nzYFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCY2a-00064A-3o; Tue, 16 Oct 2018 22:42:16 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCY2W-00062C-Fr
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 22:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1539729745; x=1571265745;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=bIKrHmJ5r6oX+d3ZG6SZwoyMJNUWYLEyxfD0C4trCHo=;
 b=HunfM1ZYuqAbuz9NSMbRvrCrf1T6bRxCcif9T6llTpc8TTf1rLcJej+h
 YySdLgYMCHZQq0Cmma7lY7YWpMMzfDTP6HtHkcllt9PirlUpXDcyZC7Z5
 40hzlYBWpein9XOWgXLlv3hoP3j+AeAP4OYZ3VzfUPcNd3SbnLS5U9arz
 ldHpg0+tB5walDJVGNf6t+t9txN2GG7XGy3q93Gxz4FPYBVf5v8QyHpnE
 AxtftKm3JtB88zwGqbvMXSu1W4cMcXI0N2CjVOLPXDu5LKHDHRSVONtpG
 s05nMnwGCxAbW1ut66hU+unIGVXfHEZtorvHh4qI0bTeo5OolP+x2dS5D g==;
X-IronPort-AV: E=Sophos;i="5.54,389,1534780800"; d="scan'208";a="189794712"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2018 06:42:08 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 16 Oct 2018 15:26:34 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.73.114])
 ([10.111.73.114])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Oct 2018 15:42:01 -0700
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
To: Thierry Reding <thierry.reding@gmail.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010135109.GE21134@ulmo> <ef19e79a-d975-bde4-1692-65389ead7c15@wdc.com>
 <20181016105103.GB8852@ulmo>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <c702cf04-a565-dc76-a3bb-dbed922a9c80@wdc.com>
Date: Tue, 16 Oct 2018 15:42:00 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181016105103.GB8852@ulmo>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_154212_568142_337B8EAF 
X-CRM114-Status: GOOD (  19.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Wesley Terpstra <wesley@sifive.com>, linus.walleij@linaro.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016224200.C-UNSXKVJjNIIjnus80MJZveo5gUZKDrn2bT4WAYJdU@z>

On 10/16/18 3:51 AM, Thierry Reding wrote:
> On Mon, Oct 15, 2018 at 03:45:46PM -0700, Atish Patra wrote:
>> On 10/10/18 6:51 AM, Thierry Reding wrote:
>>> On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
>>> [...]
>>>> +- interrupts: one interrupt per PWM channel (currently unused in the driver)
>>>
>>> This should probably say what the interrupt is used for. And once you
>>> have that, remove the comment about it being unused in the driver. DT
>>> is OS agnostic, so "driver" is very unspecific and your claim may
>>> actually be false.
>>>
>>> Thierry
>>>
>> As per my understanding, they are generated by hardware but no usage of pwm
>> interrupts as of now.
> 
> It might be useful to say when they are generated. Are they generated
> once per period? At the beginning or the end of the period? That kind
> of thing.
> 

Sure. I might have over simplified the statement above.
I could only find this about pwm interrupts in spec.
"The PWM can be configured to provide periodic counter interrupts by 
enabling auto-zeroing of the count register when a comparator 0 fires"

I may be wrong here but it looks like we need to configure the hardware 
to generate periodic interrupts. I will confirm with Wesly and update it 
in v2.

>> I am not sure if removing the entire entry is a good idea.
>> What would be the best way to represent that information ?
>>
>> May be this ?
>>
>> +-interrupts: one interrupt per PWM channel. No usage in HiFive Unleashed
>> SoC.
> 
> Why do you think you need to say that they are unused? If the hardware
> generates these interrupts, then they are "used". If no driver currently
> has a use for them, that's driver specific and doesn't belong in the DT
> bindings.
> 

Sounds good. I will update accordingly.

Regards,
Atish
> Thierry
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
