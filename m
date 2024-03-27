Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9B8C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 14:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vLwngxbZ+ucl2F3NY9mDaj6OdhHXZeSvMIjV6H9cFk4=; b=VtpaiCZu2KlrhhSyPv0mSz5Cpe
	MEtdLx/0FC2ziWv631JvVCfzqbwp8qUGS0+gWsThgEa2SidY1CI5MhJAelcX78lfXbxnEqzZ4ziet
	DcnXLuAvqE258o8uwB53iIB0ZNLc/heyYMi5d5ckeuW1BV0wIN13DuQOCjZcXoGEafrq2Z3OBl7BD
	EpJWy2MF6C7VPNLsdtXeedJ/vwKBo443d/7V0GeEL5YowfMI4ajIPD6/0z1+ke0sed1I6AZBKR3G5
	r7F0/6SsnClnlK/K+LmunjnQryLzEwk4at9AOOKEVDIw+O+Lcy63S4d5nMieRoqr+ibfcWckNP29n
	fPwWuUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpU9N-00000009Qsm-1kAi;
	Wed, 27 Mar 2024 14:21:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpU9K-00000009Qqe-1JbP
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 14:21:07 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dddbe47ac1so6405545ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1711549263; x=1712154063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OkgKPAxyfJOPfckAh4fQ9ROWymFhlRPpwnWkiLvmDg=;
        b=mVzCz3ptbSsh5HAYudiSdwuJjaSgPpZIxz7PDI8B/WK8hRHxZ/d6/AL723s+6e6J3L
         CqenV0xMa6yFOLI40CtBCV7FHhFpOJ7Jsfe011SupnknmBRD2ownNWz2w65o6DUPMFON
         2E1KsWvDPPliQykcsoLOkyby1VSqg00a1nhm8rLe3C5dPW7IKuzTDIKe3/CoFzblWHN3
         gfRBB9V310lR8UnAUGCLUSu0oy0DyjRKBz7Y+k7bBH+xpFlc9TSQiCdY8vGjFajpOx4s
         ekE5HETVftQev405LITtePm73kPbwYghok7/6Uhc+vHs/mRBh4nsx1uZc0MW6rjVBe0N
         ClQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711549263; x=1712154063;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OkgKPAxyfJOPfckAh4fQ9ROWymFhlRPpwnWkiLvmDg=;
        b=ncMyhOF0dhENbKTySHUFK2otdJhAfYYI8rj5kF1jALPcKAFkGShmyj9m2aCMFXjN/e
         KVRWO5ypf48var+hlv6aStaYW49FFR344uDp9NxMMoSMZC6yTQhBa7w+4j2gHK9uP3fM
         g0foq1kLbIHhokuI09t0lD+4bWXeXY7r4KIl5p7BFDmsf+j6oKYBhWyNpBTKMONgDB5M
         wVWR3ditO1xjTOZjRI5sUV1hOxTambmRhvXE9j8kWC83URQkTUwn9cwF9LcX6HTxFlmy
         Bh6idDmEFMJ75JQvppl4TEoHzvfXXieTi5r3z/s0PBNs2h+IY9rSojJmjtCBmQQVh5iO
         +pRQ==
X-Forwarded-Encrypted: i=1; AJvYcCULdnxPirAMnt+ou49jgbZb9YZ3wdqoUvx63KN6mM8GAnxJZvna/nAoRBOhXYkhh8MWXup9x8cG9hnTvECVHA22IsbN9cBGCICBi0HQGRH/
X-Gm-Message-State: AOJu0YzxDZWEuDm+zs0xw8tGJ6Od3F29PzP7vb6r1mKjJ/NBokzlAtGb
	a28MQvc/lPDlNdFBk8oyot7O7PrbnpiUJqw0H8bikXPqw/6RRkL2t4Z6akNt3xw=
X-Google-Smtp-Source: AGHT+IGj0H8wddyVpJYathwsKQ01aXo/mhOioGyXZjPvlpsI1o++lQ02DxLCeo2ElOxEmY/tL8qzyg==
X-Received: by 2002:a17:902:db08:b0:1e0:b677:293b with SMTP id m8-20020a170902db0800b001e0b677293bmr7337175plx.29.1711549262937;
        Wed, 27 Mar 2024 07:21:02 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id i10-20020a1709026aca00b001e03b2f7ab1sm4715467plt.92.2024.03.27.07.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:21:02 -0700 (PDT)
Date: Wed, 27 Mar 2024 07:21:02 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Mar 2024 07:21:00 PDT (-0700)
Subject: Re: [PATCH] riscv: lib: Implement optimized memchr function
In-Reply-To: <8002710f-66f4-32aa-df45-fb8901773a26@codethink.co.uk>
CC: ajones@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>,
  Bjorn Topel <bjorn@rivosinc.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ivan.orlov@codethink.co.uk
Message-ID: <mhng-36b05ed9-dd1c-45ad-aeec-921b30a75f7a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_072106_465244_A8CF2080 
X-CRM114-Status: GOOD (  27.13  )
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

On Mon, 11 Dec 2023 07:25:15 PST (-0800), ivan.orlov@codethink.co.uk wrote:
> On 11/12/2023 15:08, Andrew Jones wrote:
>>> As you can see, the new function shows much better results even for
>>> the small arrays of 256 elements, therefore I believe it could be a
>>> useful addition to the existing riscv-specific string functions.
>>
>> Looks good, but do we want to maintain both this version and a zbb
>> version? I'd expect a zbb version to be even better.
>>
>
> Hi Andrew,
>
> Yes, ZBB analog would be much better, and if we use ZBB operations we
> could avoid the most part of bit magic happening there.
>
>>> +	add t1, x0, a2
>>
>> move t1, a2
>>
>> and for the remainder of the function s/x0/zero/
>>
>
> Alright, will be fixed in the next version.
>>> +	sltiu t2, a2, MIN_BORDER
>>> +	bnez t2, 6f
>>> +
>>> +	// get the number of bytes we should iterate before alignment
>>
>> I'm not sure, but I think even in assembly we prefer the /* */ comment
>> format.
>>
>>> +	andi t0, a0, SZREG - 1
>>> +	beqz t0, 4f
>>> +
>>> +	# get the SZREG - t0
>>
>> I'm 99% sure we don't want to use the # comment syntax.
>>
>>> +	xor t0, t0, SZREG - 1
>>
>> xori?
>>
>
> Hmm, I'm surprised that it is actually compilable... Yeah, should be fixed
>>> +	addi t0, t0, 1
>>> +
>>> +	sub a2, a2, t0
>>
>> nit: Looks a bit odd to put a blank line above the sub line above,
>> instead of above the below comment.
>>
>>> +	// iterate before alignment
>>> +1:
>>> +	beq t0, x0, 4f
>>> +	lbu t2, 0(a0)
>>> +	beq t2, a1, 3f
>>> +	addi t0, t0, -1
>>
>> This addi t0... isn't necessary if we do
>>
>
> Yeah, sounds reasonable, we can make it faster
>> 	add t0, a0, t0
>> 1:
>> 	beq a0, t0, 4f
>> 	...
>> 	...
>> 	addi a0, a0, 1
>> 	j 1b
>>
>>> +	addi a0, a0, 1
>>> +	j 1b
>>> +
>>> +2:
>>> +	// found a word. Iterate it until we find the target byte
>>> +	li t1, SZREG
>>> +	j 6f
>>
>> These instructions seem oddly placed among the rest.
>>
>>> +3:
>>> +	ret
>>
>> And this is an odd place to put this ret (after unconditional jump and
>> in the middle of the function). We can just put a label at the bottom ret.
>>
>
> I agree, thanks!
>>> +
>>> +4:
>>> +	// get the count remainder
>>> +	andi t1, a2, SZREG - 1
>>> +
>>> +	// align the count
>>> +	sub a2, a2, t1
>>> +
>>> +	// if we have no words to iterate, iterate the remainder
>>> +	beqz a2, 6f
>>> +
>>> +	// from 0xBA we will get 0xBABABABABABABABA
>>> +	li t3, REP_01
>>> +	mul t3, t3, a1
>>
>> I don't think we want to implement an optimized assembly function with
>> mul. We can just use a few shifts and ors.
>>
>> 	slli	t3, a1, 8
>> 	or	t3, t3, a1
>> 	slli	t4, t3, 16
>> 	or	t3, t4, t3
>> #if __riscv_xlen == 64
>> 	slli	t4, t3, 32
>> 	or	t3, t4, t3
>> #endif
>>
>
> Nice point, thanks! Will be optimized :)
>>> +
>>> +	add a2, a2, a0
>>> +
>>> +	li t4, REP_01
>>> +	li t5, REP_80
>>> +
>>> +5:
>>> +	REG_L t2, 0(a0)
>>> +
>>> +	// after this xor we will get one zero byte in the word if it contains the target byte
>>> +	xor t2, t2, t3
>>> +
>>> +	// word v contains the target byte if (v - 0x01010101) & (~v) & 0x80808080 is positive
>>
>> s/is positive/is not zero/
>>
>>> +	sub t0, t2, t4
>>> +
>>> +	not t2, t2
>>> +
>>> +	and t0, t0, t2
>>> +	and t0, t0, t5
>>> +
>>> +	bnez t0, 2b
>>> +	addi a0, a0, SZREG
>>> +	bne a0, a2, 5b
>>> +
>>> +6:
>>> +	// iterate the remainder
>>> +	beq t1, x0, 7f
>>> +	lbu t4, 0(a0)
>>> +	beq t4, a1, 3b
>>> +	addi a0, a0, 1
>>> +	addi t1, t1, -1
>>
>> Same comment as above about being able to drop the addi t1...
>>
>>> +	j 6b
>>> +
>>> +7:
>>> +	addi a0, x0, 0
>>
>> li a0, 0
>>
>>> +	ret
>>> +SYM_FUNC_END(memchr)
>>> +SYM_FUNC_ALIAS(__pi_memchr, memchr)
>>> --
>>> 2.34.1
>>>
>>
>> Thanks,
>> drew
>>
>
> Thanks a lot for the review!

Do you have a v2?  Sorry if I lost it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
