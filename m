Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D89CD8C9D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 23:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nWodY+1D88WeJavaAVEy9iIIHmJF5mua9AOxlSuGlbM=; b=KkXkzH/9xJqCpP
	l7hatpSbyZXVMKciakzS0XaFmQBrsTJsjxa7s3ftKCQt/LZf74l90Sn8fm2F6MN0O0W14OgECKJmQ
	gOT6igegZEBxF3YsAJSnO/fCEUoVejrY64F1r0W+EjgEgqSWKTtvDOcA2k5I2z0HCmD/6iyQnF3Hu
	PdeVVHMfWRlixeSN4Xzn6gnlFYWrOQA9DphwrQEYRJUvxNrQOydLlmkslvylyz3GKwWJWNTiGoPKP
	1DhvDcrRQxfcsn4xgz/YWycptzd3j2A9v+0hsZC0SY4DyhMvjLYtcsmrcIUncCuu0ns/InsUkXhju
	bVpGcSi+xyV47BOyMwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWNMD-00000002doq-1idG;
	Sun, 07 Jun 2026 23:56:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWNMA-00000002doL-0viA
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 23:56:44 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso25032745ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jun 2026 16:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780876601; x=1781481401; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mQEY43TKXmVzVuz2rt6OfQ1VUbuizVngZzaF2qvwCqk=;
        b=LWYSYy3CRAwMKxLBT3WdrUWgVy8fUIL+Nb8eUdsR/3oHrxOGmub5AUf0OaSUX6+Vnl
         zk1Vcgi/FgYtBOFET61iRzrCuYeAuMTbPE3MYgQMeMUbM8dBaIZmfifa1NJ4uNcWqnMy
         uPbqVQmW4XNU3Jc87TFPei8T+N30IIVj4nd5+KBJJKSIxKATq3WDpAivHA2P1j558EmL
         gcxKRv9Fw0KxbUJlru+kMJwTHahMEC/2Wf344r4OgRbE2SNJAz3ss2qg9GD9ZdtMxytB
         sZ7wpbK0ziGLrtL0wLIHVrEsHknP/82ROjBmUkH9cBCXr7SFKz9ePjTgJ9BMviCuYz9S
         NZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780876601; x=1781481401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQEY43TKXmVzVuz2rt6OfQ1VUbuizVngZzaF2qvwCqk=;
        b=TSlItZ/zz3RGm601ajBUm3ONka30YXUAlZHW5rZ/CummwTkUibtMLSOCRQa2hAlTNQ
         FbidZ/G6gUYY3LB/i1PwmxjU0pF+tS2ttuC48GoEIaYESHIjPuAJ3sPYtHbYLjSESEge
         SOF5qjP/wGzaUolOvdZSb1BEm0LwOI3Sd13+ZeazwoH3MKMJkBLopDbaJxYuJcPi/cS1
         luGSSbrZPumahsbugfMRiqBjB/4rgG69Z7Bbzd9F30Qzzr4mNxWEYsRZpv/By17y9bOr
         OUl0J7J1jbXoQnRdIIk4YAdppHe8Fhzi5pb5pyCUTskQNdOFm2S3mKNhmV7LK3/pV/Gv
         D1cA==
X-Forwarded-Encrypted: i=1; AFNElJ/SXF43Rlwu/ElH8qs5xZLqNi19bf6M2ZmMVCvYK5J0NZNrHmX26wRRohSm7HPcNcAIAsWdZjGoaO2Wsg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/6fvCpthh89BVb6vYG5svkJDmGPXiqqJiIFpd0aCb8kAw8Fo9
	vi06LVbK+Avf16RdPeKj7rQiDf2UKTpGSkN9dykBQ3BqfL3c4K0jA6Sn
X-Gm-Gg: Acq92OGYV/2hj/Ay58SzhsllHD9D8t6WzdzGjjpxLRJhj35wqErneynzgjIRgs8DL8W
	9cfPsDE7MQ48l1/Ls4F94a4VD+RsqDvyMJSsjIPLo0UHVm30nsXvMkHZ+doYNe9GY27yX4j/6GS
	M6uq6XuuQwpk0LZKGvx2SBDKBb7RytQY8Ln2/ekIRnSzcqpnZ4LRqgkb1MBSs/lWk0904FT1gKM
	Tk7BDTrEHvcI/FIvpTDltz26QsHvESkNDPV3gCuUd52CCh2xRbGl40rgEp7NEjZXkcoALWzySb2
	nVx88eL11ar9krUFHUMu5LcJY7SoTKLtHnLWgg9byC2MJoOGRJp+HmOrbh8YZV8WzzgW8IWWVxg
	9xYdnZJgrGgOUoaOpFwN+SJHC4I8QBQNx0fQQZnUMM96/H4t5f35B4aF7qdqORTf0YNS33q3bNx
	nbaEe76y7cmpor4UWFdcCJk4VTgeZ1nDYBQ5bRaINnCzcy+h2A/iQtwUgGlrCRCq6zP0Wqix0s8
	ZCuOr3s21E=
X-Received: by 2002:a17:903:4b28:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2c1e89579ccmr133614095ad.35.1780876600973;
        Sun, 07 Jun 2026 16:56:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e2e2sm156389165ad.49.2026.06.07.16.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 16:56:40 -0700 (PDT)
Message-ID: <73557336-94d6-4eef-bcc3-da59af188f86@roeck-us.net>
Date: Sun, 7 Jun 2026 16:56:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
To: Conor Dooley <conor@kernel.org>
Cc: linux-hwmon@vger.kernel.org, Lars Randers <lranders@mail.dk>,
 Conor Dooley <conor.dooley@microchip.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Daire McNamara <daire.mcnamara@microchip.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Valentina.FernandezAlanis@microchip.com
References: <20260527-earring-bully-eb4a268c2e68@spud>
 <b49d4781-0827-4f26-9ca2-ccd177f90237@roeck-us.net>
 <20260528-defog-lasso-84891a72775a@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260528-defog-lasso-84891a72775a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_165642_295459_44A358AC 
X-CRM114-Status: GOOD (  21.04  )
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

On 5/28/26 15:34, Conor Dooley wrote:
> On Wed, May 27, 2026 at 09:07:20PM -0700, Guenter Roeck wrote:
>> On Wed, May 27, 2026 at 10:06:11AM +0100, Conor Dooley wrote:
>>> From: Lars Randers <lranders@mail.dk>
>>>
>>> Add a driver for the temperature and voltage sensors on PolarFire SoC.
>>> The temperature reports how hot the die is, and the voltages are the
>>> SoC's 1.05, 1.8 and 2.5 volt rails respectively.
>>>
>>> The hardware supports alarms in theory, but there is an unconfirmed
>>> erratum that prevents clearing them once triggered, so no support is
>>> added.
>>>
>>> The hardware measures voltage with 16 bits, of which 1 is a sign bit and
>>> the remainder holds the voltage as a fixed point integer value. It's
>>> improbable that the hardware will work if the voltages are negative, so
>>> the driver ignores the sign bits.
>>>
>>> There's no dt support etc here because this is the child of a simple-mfd
>>> syscon.
>>>
>>> Signed-off-by: Lars Randers <lranders@mail.dk>
>>> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> Guenter, there's one question here about the unit that update_interval
>>> is in, I didn't see anyone else using us, but I assume that's okay since
>>> the resolution that ms would give would be 8 steps only?
>>> RFC cos the question is also in the driver as a comment.
>>>
>>
>> That just came up in a different context. We'll add a new standard attribute
>> update_interval_us. The existing attribute MUST use ms. Everything else
>> would be an ABI violation.
> 
> Cool. Sounds like Ferdinand is working on that based on the other
> thread.
> 
> Do you think I should support both update_interval and update_interval_us in
> this driver?
> 

I have been thinking about only supporting one for a given driver, but that
doesn't work because there are existing drivers which would benefit from
supporting microsecond-based intervals, so both it is (unless you want to
wait for _us support to be available and then just support that).

> If yes, should I do the ms version now and add the us version later once
> Ferdinand's work is complete?
> 

Yes, that is what I would recommend.

Thanks,
Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
