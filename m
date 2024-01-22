Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78236C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 17:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DO7H+Ak+smVAbzCumdBfqCUFhBzZB4G2igOvGDT03MU=; b=FlUOY7bh+PvcjN
	e8y+0PDt0VWyeJF0R4dSbjmZAjP9fWkDwPUhH7jLN6Co0i4zN9hN+EElfdk7URKGHc71XOTMv0wzq
	FWQ9qsWjSSJYSj3Enij0vr3VpoO8WmzqHhz0tzCiJ5IjQ1UhEPtcUX5GigOhWrExWHh+IFe/jOg6x
	dcoUfvWgsDKtJ6F5MWFtRw/hU7KudLJUx6Be7WB3RK4pi8na4jguKeDDjgtXQ+TdMbIIZtTH9warr
	U5nUcCMveadl/wT/beQphrp+s1NAZxzEag8+7ZAhiwD36dtJHvMLNN4NgFeHE2d+ZhKRKQRd50LAg
	gP/n756e1YVZKaRUjt2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxtq-00DAKm-1G;
	Mon, 22 Jan 2024 17:15:54 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxtn-00DAJM-1V
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 17:15:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d6ff29293dso19307185ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 09:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705943750; x=1706548550; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7wauAHZjPbJhqs+zpIZbtti9g0b0LXU1JBTcWTNXgSc=;
        b=b5X04UBydmS2PY/w1pNNKGqLbIqsvzyenspSRp0xEyrIDT5im9tpAIvfLaq9mBseni
         F1Dhkusp5Lxo2IUdIDV/HnBgcKlZG3kUr1lXkhEVIrcHGGFNXu1iHzCbFkysUK19JTLS
         CQjISkj5a5jrjpDZo3bYWmVxvsOdtytrdfVyL7qvEoHqMxWKZ8LPv/wXpEmIFAzgfpdr
         B+uenfqb16iIlr4IS0Sjc7ZxGPQc3Vn5sdhsGtgHMVBJCpqXhd6/ox6LfHebXIlZkIgh
         dyhY61gotbf3CBxvX0xA/D0MlUlHcpKzu0QTXPowCQbWiw05CfTxiO1DjUECwtO1Xh/F
         OfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705943750; x=1706548550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wauAHZjPbJhqs+zpIZbtti9g0b0LXU1JBTcWTNXgSc=;
        b=VmvSJ2L+Vg0CpFiVyhng1L16w8f/Nut+totzUh30ceyuGVpiX6BXDJcNvZHNKt9/Bf
         +aXtH0kPegxt9r8NmbR3jaZoO7cJJd/I43ASDxtzyckd/UHCdedmpQFKVdTPqkWEXVtd
         HC7nW2AHLNQH/QZKawRb3wmC/akoPt+Vuxh+f8TZV8t3lmlnE8WaPJNv5eDxw8Hmvi4X
         iZeVZ8BcmlxmcnmNq1RMjm2xlNWPrs5kmVM3SsPuqIKUxpoDz6gRjWiStduRzYWH5FHz
         WWofld6usOzN945TE9ANRJeEx7f4pHhX+J9anww4MRa1OXKP2MQE7ysBCcXMWn8zhxX6
         Z6Eg==
X-Gm-Message-State: AOJu0YyAEUg/Q8NoJqsKklqaimVOJtbYBIv+OHWunuBoH37QXUOR+sgT
	xS0ieghkpw2aimNmJeOyKScSyuziL8nepyRdOs1M4PbwpTzSoz2v
X-Google-Smtp-Source: AGHT+IGb9qZ9ThUvwf2SP/ET+iq/Tlz8BjhmlsDoV9xbRbTAfLK/KjrzuGGHfxZkf26S+frZL2w+OA==
X-Received: by 2002:a17:903:2441:b0:1d7:3ffc:c2bc with SMTP id l1-20020a170903244100b001d73ffcc2bcmr1661498pls.13.1705943749857;
        Mon, 22 Jan 2024 09:15:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902e9cd00b001d403f114d2sm7486862plk.303.2024.01.22.09.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 09:15:49 -0800 (PST)
Message-ID: <1dd253a5-9fe9-4d0a-b0cd-3775f089ca0c@roeck-us.net>
Date: Mon, 22 Jan 2024 09:15:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 5/5] kunit: Add tests for csum_ipv6_magic and
 ip_fast_csum
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Xiao Wang
 <xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>,
 Guo Ren <guoren@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>
References: <20240108-optimize_checksum-v15-0-1c50de5f2167@rivosinc.com>
 <20240108-optimize_checksum-v15-5-1c50de5f2167@rivosinc.com>
 <2c8e98b6-336e-4bc7-81ba-5a4d35ac868a@roeck-us.net>
 <6b0dc20f392c488a9080651a2a2cd4bd@AcuMS.aculab.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <6b0dc20f392c488a9080651a2a2cd4bd@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_091551_503486_EB2598FB 
X-CRM114-Status: GOOD (  18.10  )
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

On 1/22/24 08:52, David Laight wrote:
> From: Guenter Roeck
>> Sent: 22 January 2024 16:40
>>
>> Hi,
>>
>> On Mon, Jan 08, 2024 at 03:57:06PM -0800, Charlie Jenkins wrote:
>>> Supplement existing checksum tests with tests for csum_ipv6_magic and
>>> ip_fast_csum.
>>>
>>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>>> ---
>>
>> With this patch in the tree, the arm:mps2-an385 qemu emulation gets a bad hiccup.
>>
>> [    1.839556] Unhandled exception: IPSR = 00000006 LR = fffffff1
>> [    1.839804] CPU: 0 PID: 164 Comm: kunit_try_catch Tainted: G                 N 6.8.0-rc1 #1
>> [    1.839948] Hardware name: Generic DT based system
>> [    1.840062] PC is at __csum_ipv6_magic+0x8/0xb4
>> [    1.840408] LR is at test_csum_ipv6_magic+0x3d/0xa4
>> [    1.840493] pc : [<21212f34>]    lr : [<21117fd5>]    psr: 0100020b
>> [    1.840586] sp : 2180bebc  ip : 46c7f0d2  fp : 21275b38
>> [    1.840664] r10: 21276b60  r9 : 21275b28  r8 : 21465cfc
>> [    1.840751] r7 : 00003085  r6 : 21275b4e  r5 : 2138702c  r4 : 00000001
>> [    1.840847] r3 : 2c000000  r2 : 1ac7f0d2  r1 : 21275b39  r0 : 21275b29
>> [    1.840942] xPSR: 0100020b
>>
>> This translates to:
>>
>> PC is at __csum_ipv6_magic (arch/arm/lib/csumipv6.S:15)
>> LR is at test_csum_ipv6_magic (./arch/arm/include/asm/checksum.h:60
>> ./arch/arm/include/asm/checksum.h:163 lib/checksum_kunit.c:617)
>>
>> Obviously I can not say if this is a problem with qemu or a problem with
>> the Linux kernel. Given that, and the presumably low interest in
>> running mps2-an385 with Linux, I'll simply disable that test. Just take
>> it as a heads up that there _may_ be a problem with this on arm
>> nommu systems.
> 
> Can you drop in a disassembly of __csum_ipv6_magic ?
> Actually I think it is:

It is, as per the PC pointer above. I don't know anything about arm assembler,
much less about its behavior with THUMB code.

> ENTRY(__csum_ipv6_magic)
> 		str	lr, [sp, #-4]!
> 		adds	ip, r2, r3
> 		ldmia	r1, {r1 - r3, lr}
> 
> So the fault is (probably) a misaligned ldmia ?
> Are they ever supported?
> 

Good question. My primary guess is that this never worked. As I said,
this was just intended to be informational, (probably) no reason to bother.

Of course one might ask if it makes sense to even keep the arm nommu code
in the kernel, but that is of course a different question. I do wonder though
if anyone but me is running it.

Thanks,
Guenter

> 	David
> 
> 		adcs	ip, ip, r1
> 		adcs	ip, ip, r2
> 		adcs	ip, ip, r3
> 		adcs	ip, ip, lr
> 		ldmia	r0, {r0 - r3}
> 		adcs	r0, ip, r0
> 		adcs	r0, r0, r1
> 		adcs	r0, r0, r2
> 		ldr	r2, [sp, #4]
> 		adcs	r0, r0, r3
> 		adcs	r0, r0, r2
> 		adcs	r0, r0, #0
> 		ldmfd	sp!, {pc}
> ENDPROC(__csum_ipv6_magic)
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
