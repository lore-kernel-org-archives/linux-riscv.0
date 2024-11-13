Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFC6D41C2E
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 10:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EzABmRQVZSMUjrSf12jMB+bxp4FA6NHlvxJ/8GwEOU=; b=rU+RxpoWYjkICR
	RQBXsve8y/N568n5mlDciUWLUnIrWZulE89+4Kzr/n1SiK62L5G2iVlhPqpZB8Oeex6yQmgzPLAD2
	ZU+2b2NAdFrtZaSV3++LzqGlXIh3KLF8xeFdnOzo8zMLXBDjjQO773ZbMQHCR8Pka6W5Gtdsjs1oH
	znxkY/FIhbUfuxZb4kbw+T9J84bhpXX4PTnsTCI5TqbQDMnzSUsY62+ZRKzxOr1Tej43ZTXlLnKm+
	l87WLv3BzL999PeCdgiiV2I8YspE5+DqgrOjyM4k2TH7LVGeqpqiHwzENZyneP9o7anDThfLY3DfE
	DNUTKwiwzUNJrwcBitmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAf4-00000006S4U-0dba;
	Wed, 13 Nov 2024 10:31:46 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBATZ-00000006Q7y-3Ej0
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 10:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9culzSi+ShqZDYCmdIfn5Zynxb/HbzKAw6wYoOTRhBE=; b=TpdiaSmZcrjNpsEHYbX9cxUa1c
	y32WyVECrwT9NJ2d7/zowHK99/E71GOu8eBo1O5yRti3E6mt/gfRkOo4Vzns6FY1OKqJr0+i2rwO2
	HlYiVAcsSHBDCVk9Onp7cLgtgpafWg/E/OIgVa8L6N6UzlFpHHN58QuYQKn0YoXXRIi9f9Uo6YuO8
	NclXpLuXU8ESCG3CQSrNpFOmmm/tB+beP4gUZX3V74aUFYUgs4v9umUQLi81M5+nkdp4koR03unsT
	j7tPxOdFxzeZQNuIvXihN7Gixa6S3sp+bYmH5GDo6Jo54yyxz1vxNM8GsmnkeXAKBZry5UnVO78bw
	oPsq2D9A==;
Received: from [63.135.74.212] (helo=[192.168.1.184])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tBATW-003xC5-1E; Wed, 13 Nov 2024 10:19:50 +0000
Message-ID: <7278cda9-740b-4bf7-b6da-dd760121e31f@codethink.co.uk>
Date: Wed, 13 Nov 2024 10:19:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] riscv: ptrace: add regs_set_register()
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, alex@ghiti.fr
References: <20241113091703.3133017-1-ben.dooks@codethink.co.uk>
 <20241113091703.3133017-2-ben.dooks@codethink.co.uk>
 <20241113-58aebadd1b4916382031abaa@orel>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20241113-58aebadd1b4916382031abaa@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_021953_926164_9F656A4D 
X-CRM114-Status: GOOD (  13.27  )
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

On 13/11/2024 10:12, Andrew Jones wrote:
> On Wed, Nov 13, 2024 at 09:17:01AM +0000, Ben Dooks wrote:
>> Since we have regs_get_register() and we could use the set counterpart
>> for things like fixing up traps, add regs_set_register() to set a pt_regs
>> value from offset.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   arch/riscv/include/asm/ptrace.h | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
>> index b5b0adcc85c1..66fc1795141d 100644
>> --- a/arch/riscv/include/asm/ptrace.h
>> +++ b/arch/riscv/include/asm/ptrace.h
>> @@ -143,6 +143,26 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
>>   	return *(unsigned long *)((unsigned long)regs + offset);
>>   }
>>   
>> +/**
>> + * regs_set_register() - set register value from its offset
> 
> s/from/at/
> 
>> + * @regs:	pt_regs from which register value is gotten
> 
> s/gotten/set/
> 
>> + * @offset:	offset of the register.
>> + * @to:		value to set register to
> 
> Can we name this 'value' instead of 'to'?

Thank you, I think these are all good comments.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
