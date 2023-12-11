Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C7EC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z70w0sxVKVjfF1LOHRRinlF3mS9OgS/pzyL2CEOn0fk=; b=2ivty3MMd6kJMB
	KsSTgcbpc/30SwkYNZwAhkNBXBGpxpjQhgFwRTE92hEUYQMdob4y1t6iRkRaZ40x5IjNQZI47bmFi
	63heLmD9qoxUyOu+jHOrrUdAupO0xbKoJUZtVyVKOz/5XXUbBIQtlzstL7crQoD/pt2Xb9NHHFld5
	MQ98jaABlU7cF0X69xJ5H9ll/9TA347EW2Kedsr3ycJVPmzzyaCAcx09Xwz4poK/ZRc5XEGv7UMpA
	D4t/SHZD4OtdIkEFNJGnRZLsiYDkrsJ4wgf7lc99oqXzd5niCDCJUdJLQTQs0MLqN5vWjpMymmpD8
	kCPxzxYMZaGGMn6+mDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCi9w-005PaZ-1v;
	Mon, 11 Dec 2023 15:25:28 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCi9s-005PVX-1U
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 15:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IwEWgbkoYJm7uABHz8pQkFOpv075TP+Bit3Au8JGFAk=; b=Syz6wYtlu/8QrxUdaACh7bWWG5
	qaTTRogpCDQJN/UuccLVi7i0CpMz1Q8OzvfsKC1JIR5KSrw771Df+Mc5WhvS89R0bEQ9xFH/Qv2yi
	SIjZMxjrucuvQQnc2zPmFUk26DLlv9v4ESpAuQC24oSjXHQIAQFiCmtwsry041eFKwILi6shaXVGz
	N8BY3AP7jUbV8zpUJS6CZsPYre3w8Imhduy4ZHroZZXRF9YMXbJc9eLmE7zMspUjaKlw8JzlWdS2H
	eXL4HfnVQ8qKqfs/Ekv4wfS6QmQaHDCfLSzJXTkbG9XfVzPpsrZ5/Ldz3ZDMy/V9+u4dR31WMRiUO
	ZVv2jZsA==;
Received: from [167.98.27.226] (helo=[172.16.100.86])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1rCi9j-00FAzE-4h; Mon, 11 Dec 2023 15:25:16 +0000
Message-ID: <8002710f-66f4-32aa-df45-fb8901773a26@codethink.co.uk>
Date: Mon, 11 Dec 2023 15:25:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] riscv: lib: Implement optimized memchr function
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 conor.dooley@microchip.com, heiko@sntech.de, bjorn@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231208141839.174284-1-ivan.orlov@codethink.co.uk>
 <20231211-b65c8d828ace61714b0eacf5@orel>
From: Ivan Orlov <ivan.orlov@codethink.co.uk>
In-Reply-To: <20231211-b65c8d828ace61714b0eacf5@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_072524_608684_7C6EAE14 
X-CRM114-Status: GOOD (  28.72  )
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

On 11/12/2023 15:08, Andrew Jones wrote:
>> As you can see, the new function shows much better results even for
>> the small arrays of 256 elements, therefore I believe it could be a
>> useful addition to the existing riscv-specific string functions.
> 
> Looks good, but do we want to maintain both this version and a zbb
> version? I'd expect a zbb version to be even better.
> 

Hi Andrew,

Yes, ZBB analog would be much better, and if we use ZBB operations we 
could avoid the most part of bit magic happening there.

>> +	add t1, x0, a2
> 
> move t1, a2
> 
> and for the remainder of the function s/x0/zero/
> 

Alright, will be fixed in the next version.
>> +	sltiu t2, a2, MIN_BORDER
>> +	bnez t2, 6f
>> +
>> +	// get the number of bytes we should iterate before alignment
> 
> I'm not sure, but I think even in assembly we prefer the /* */ comment
> format.
> 
>> +	andi t0, a0, SZREG - 1
>> +	beqz t0, 4f
>> +
>> +	# get the SZREG - t0
> 
> I'm 99% sure we don't want to use the # comment syntax.
> 
>> +	xor t0, t0, SZREG - 1
> 
> xori?
> 

Hmm, I'm surprised that it is actually compilable... Yeah, should be fixed
>> +	addi t0, t0, 1
>> +
>> +	sub a2, a2, t0
> 
> nit: Looks a bit odd to put a blank line above the sub line above,
> instead of above the below comment.
> 
>> +	// iterate before alignment
>> +1:
>> +	beq t0, x0, 4f
>> +	lbu t2, 0(a0)
>> +	beq t2, a1, 3f
>> +	addi t0, t0, -1
> 
> This addi t0... isn't necessary if we do
> 

Yeah, sounds reasonable, we can make it faster
> 	add t0, a0, t0
> 1:
> 	beq a0, t0, 4f
> 	...
> 	...
> 	addi a0, a0, 1
> 	j 1b
> 
>> +	addi a0, a0, 1
>> +	j 1b
>> +
>> +2:
>> +	// found a word. Iterate it until we find the target byte
>> +	li t1, SZREG
>> +	j 6f
> 
> These instructions seem oddly placed among the rest.
> 
>> +3:
>> +	ret
> 
> And this is an odd place to put this ret (after unconditional jump and
> in the middle of the function). We can just put a label at the bottom ret.
> 

I agree, thanks!
>> +
>> +4:
>> +	// get the count remainder
>> +	andi t1, a2, SZREG - 1
>> +
>> +	// align the count
>> +	sub a2, a2, t1
>> +
>> +	// if we have no words to iterate, iterate the remainder
>> +	beqz a2, 6f
>> +
>> +	// from 0xBA we will get 0xBABABABABABABABA
>> +	li t3, REP_01
>> +	mul t3, t3, a1
> 
> I don't think we want to implement an optimized assembly function with
> mul. We can just use a few shifts and ors.
> 
> 	slli	t3, a1, 8
> 	or	t3, t3, a1
> 	slli	t4, t3, 16
> 	or	t3, t4, t3
> #if __riscv_xlen == 64
> 	slli	t4, t3, 32
> 	or	t3, t4, t3
> #endif
> 

Nice point, thanks! Will be optimized :)
>> +
>> +	add a2, a2, a0
>> +
>> +	li t4, REP_01
>> +	li t5, REP_80
>> +
>> +5:
>> +	REG_L t2, 0(a0)
>> +
>> +	// after this xor we will get one zero byte in the word if it contains the target byte
>> +	xor t2, t2, t3
>> +
>> +	// word v contains the target byte if (v - 0x01010101) & (~v) & 0x80808080 is positive
> 
> s/is positive/is not zero/
> 
>> +	sub t0, t2, t4
>> +
>> +	not t2, t2
>> +
>> +	and t0, t0, t2
>> +	and t0, t0, t5
>> +
>> +	bnez t0, 2b
>> +	addi a0, a0, SZREG
>> +	bne a0, a2, 5b
>> +
>> +6:
>> +	// iterate the remainder
>> +	beq t1, x0, 7f
>> +	lbu t4, 0(a0)
>> +	beq t4, a1, 3b
>> +	addi a0, a0, 1
>> +	addi t1, t1, -1
> 
> Same comment as above about being able to drop the addi t1...
> 
>> +	j 6b
>> +
>> +7:
>> +	addi a0, x0, 0
> 
> li a0, 0
> 
>> +	ret
>> +SYM_FUNC_END(memchr)
>> +SYM_FUNC_ALIAS(__pi_memchr, memchr)
>> -- 
>> 2.34.1
>>
> 
> Thanks,
> drew
>

Thanks a lot for the review!

--
Kind regards,
Ivan Orlov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
