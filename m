Return-Path: <SRS0=fYNd=P2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C910C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 02:10:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C26020855
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 02:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RtDFLXRi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JZ+ybG7r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C26020855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uNLj/brjG06cq5aC4nwreH0bihp73RhBQjsrwL27ru0=; b=RtDFLXRienxGakSbkbGWxbbDR
	1R4lYGr/02e1iUmn2IZjY285TydTGewvTRU6ZRYme4Q6gpC7KvlRzcUUKXuHj5gAOeybq10wX+4EU
	GsI9N2qusekYRjEvHKCGftnBU4ITMbF9sf0eN6+8Y9ga7fKlWwuasAMBC14sO5Ko4T4jyqqVBxxnt
	ZyK10guZDLTAFGBNxBbBL62b2uSIPs8p1BfagzATQF19CniLAgeXoss+D15pEMl7JEs/tQcm/iVkR
	/yPyvb5yB6bXDcg4E0WS4FapiUdfLBkKhUhxBAQia21YTauGbbtuoc9EKJpangCDbKkXOmEOKbRO3
	PDOJ5abeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkJcN-0004VH-Tu; Fri, 18 Jan 2019 02:10:47 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkJcL-0004Uv-0z
 for linux-riscv@lists.infradead.org; Fri, 18 Jan 2019 02:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1547777445; x=1579313445;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=zlOkxdwgTtcKUukUT/zB3tM58Winto37alvQsq8ejgo=;
 b=JZ+ybG7rM3yaX0W2MoRCNsJYnyyBhDh607NNSYZmCAUVH6G7TEl0J+Xw
 bweuHeRK7TgGgzTK+SZ/wiawavhaXnyyZEoxtA+Rm++c4B9KBe6lvxYUh
 oPK15wQu5/9D4EeipLtaY7rjh4c0PalPUdzqmmjIDwJ5mrD/neiZzLvG0
 WIaro5rnvYpv7IA9ZNGzZ+8hfMlFlcYoNVv6c7YQMAK1RyxCU0MooOaku
 wykqPmDXMNXXYngnmOH69Q+PQB6vhdVm3ze08dWgzohyfdlCWqI6+H2ax
 sGWx7uEe0Why0AOgX2aYpMWTVAkRB9a4uce37r07VZAYHr/m4oxXKwl5Y Q==;
X-IronPort-AV: E=Sophos;i="5.56,489,1539619200"; d="scan'208";a="104043425"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2019 10:10:41 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 17 Jan 2019 17:51:59 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.68.123])
 ([10.111.68.123])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2019 18:10:42 -0800
Subject: Re: [PATCH v2 7/8] RISC-V: Check and continue in case of an invalid
 cpuid.
To: Anup Patel <anup@brainfault.org>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-8-git-send-email-atish.patra@wdc.com>
 <CAAhSdy17H_XpDea9bowUoinVmb17p8+ZAzZ7cyFuDfFDJ-LwaA@mail.gmail.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <a92933c7-c489-04a9-5b21-ed78aac927ec@wdc.com>
Date: Thu, 17 Jan 2019 18:10:40 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy17H_XpDea9bowUoinVmb17p8+ZAzZ7cyFuDfFDJ-LwaA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_181045_181972_D9799365 
X-CRM114-Status: GOOD (  15.82  )
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
Cc: =?UTF-8?Q?Patrick_St=c3=a4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/8/19 4:00 AM, Anup Patel wrote:
> Prefer, commit prefix "irqchip/irq-sifive-plic:" instead of "RISC-V:"
> 

Will do.

Regards,
Atish
> On Tue, Jan 8, 2019 at 3:08 PM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> riscv_hartid_to_cpuid can return invalid cpuid for a hart
>> that is present in DT but was never brought up.
>>
>> Print the appropriate warning message and continue.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   drivers/irqchip/irq-sifive-plic.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
>> index 357e9daf..254ecd76 100644
>> --- a/drivers/irqchip/irq-sifive-plic.c
>> +++ b/drivers/irqchip/irq-sifive-plic.c
>> @@ -237,6 +237,11 @@ static int __init plic_init(struct device_node *node,
>>                  }
>>
>>                  cpu = riscv_hartid_to_cpuid(hartid);
>> +               if (cpu < 0) {
>> +                       pr_warn("Invalid cpuid for context %d\n", i);
>> +                       continue;
>> +               }
>> +
>>                  handler = per_cpu_ptr(&plic_handlers, cpu);
>>                  handler->present = true;
>>                  handler->ctxid = i;
>> --
>> 2.7.4
>>
> 
> Otherwise, looks good to me.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> 
> Regards,
> Anup
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
