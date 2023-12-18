Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DBDC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u91EKRekwbwXXjHlx2drINzNZYWQmCIDaR2dBNL2Iv0=; b=5F98+BlHaTnwvB
	ZcuguvrNuvi4zVNedRllJOTLl5/ak8NluXO6n9BNKsy3NQGLXXm9v/UOYP6qii6BHhPqiv71/4IQF
	8ZWgbqveLjCWu71fykSlF8X2zEZkQsFbWlsByG+feaKhuqy8nDsItnoiDtoD7D2r5i7UfD3wlxoW3
	hBA1xbK2sG/jjxL9ywzP/lAFGB7jSO+m5wN6AOto1DF7kIR3febyNk9Rz+p3OY7K4gc/8tk2MGftN
	aj4ELqZiho4YIbQieJl11MfxoiaXum7KciM2RTJPaK+zl/HKZEvujKZxTmWQwGcPRrrSIGWY15V+H
	Z+uPPYz00WV8iMyei3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFAT9-009lJB-2Y;
	Mon, 18 Dec 2023 10:03:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFAT7-009lIH-1n
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 10:03:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c79b61904so4755645e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 02:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702893803; x=1703498603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAJ4t+ZlF+9GvsUCLeFJqAzncniYoth3/FkzEne5oZw=;
        b=jNpfZMRVs8wb0GYZq+bR5Qqm+/Twaiv7h1QEu+CkwkJyTHjeWTWO6sOh3AdJXk8RJU
         cdsoEg4Y8oBoCEPpVG5GbbrizjAhEiRdBPnwzReWfoA8H8ZXcotnwApI29y2q3ZGO6VO
         Ldg0y75ShS4E1pJT5QojyVcK+e/Usg1Qr+rpEzW4NkVSuqXzr2FJyiFK31w5X0kJiWYR
         rsgNIBNpqtrxqlfFB1hrAcXbRPvlnBWfzZBL1WNbI+XwjSniCXSO28F8SoMU15PPSc6V
         U+Iw8czGmm04HfR0GJN+jyAeki1lKkmaCFnCMd/fcZ1UORsnYSe+L5W7WpsJmCkJD8+y
         iMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702893803; x=1703498603;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAJ4t+ZlF+9GvsUCLeFJqAzncniYoth3/FkzEne5oZw=;
        b=eSB+HXei+8WlIhxDlrIC5cgKsRZmPtHjsbA/X9q57jTZpnIcXaImGmr2esdZa0/bqU
         xRZeFDFvyN+e86Qj1CXD6ieqNnwB23OYKc++Rwl0UZpVKmg+0rR7qNGoSw0kPOsvxH4g
         Ahok1xb8qG7EXn7ZZ6eYmZb2Qem6GwIeJJf+wS24cWM5lpdosP8YON0qUHGMh/LtcMoa
         tDkNhscqxVaE9v9hlUKhDbUS0bV1VZcJaCMS8BF5E0mlai0NjFch0NmZrgsGnNtSfqpu
         sKSCxqbIXCvqBvkaE6gjZWolLUwNTpqHqjz5X/aquLWYdXNM9f1MG/YkmrUBUP5rXgnt
         EshA==
X-Gm-Message-State: AOJu0Yz3JmPrEMadJvcwZzDq+vqgaVrF9MgOLs1ImujVvGOxu4UOWKh6
	ar26r09uHXTcbo8Hr7iqBgQ=
X-Google-Smtp-Source: AGHT+IFs8F4MaXExSYtt4MkPmPlq58aSE/hyCEVFB6HJE1s5fFzh90VRsJObpMFYCYdJuuH093Flvw==
X-Received: by 2002:a05:600c:1c9d:b0:408:3836:525f with SMTP id k29-20020a05600c1c9d00b004083836525fmr19264207wms.1.1702893802949;
        Mon, 18 Dec 2023 02:03:22 -0800 (PST)
Received: from ?IPV6:2a01:4b00:d20e:7300:aa3f:acb9:5744:ea8f? ([2a01:4b00:d20e:7300:aa3f:acb9:5744:ea8f])
        by smtp.gmail.com with ESMTPSA id m29-20020a05600c3b1d00b0040b3515cdf8sm41329359wms.7.2023.12.18.02.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 02:03:22 -0800 (PST)
Message-ID: <f12ef9ea-14fe-491a-890b-a645bb4827cb@gmail.com>
Date: Mon, 18 Dec 2023 10:03:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: lib: Optimize 'strlen' function
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Cc: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "ajones@ventanamicro.com" <ajones@ventanamicro.com>,
 "samuel@sholland.org" <samuel@sholland.org>,
 "alexghiti@rivosinc.com" <alexghiti@rivosinc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>
References: <20231213154530.1970216-1-ivan.orlov0322@gmail.com>
 <86d3947bce1f49c395224998e7d65dc2@AcuMS.aculab.com>
 <de80b4c7-1ffb-478e-9117-9d5b829470bd@gmail.com>
 <bd9159806a2e4fd188a78515b58ec51e@AcuMS.aculab.com>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <bd9159806a2e4fd188a78515b58ec51e@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_020325_593307_869EC93A 
X-CRM114-Status: GOOD (  19.03  )
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

On 12/18/23 09:20, David Laight wrote:
> From: Ivan Orlov
>> Sent: 18 December 2023 01:42
>>
>> On 12/17/23 17:00, David Laight wrote:
>>> I'd also guess that pretty much all the calls in-kernel are short.
>>> You might try counting as: histogram[ilog2(strlen_result)]++
>>> and seeing what it shows for some workload.
>>> I bet you (a beer if I see you!) that you won't see many over 1k.
>>
>> Hi David,
>>
>> Here is the statistics for strlen result:
>>
>> [  223.169575] Calls count for 2^0: 6150
>> [  223.173293] Calls count for 2^1: 184852
>> [  223.177142] Calls count for 2^2: 313896
>> [  223.180990] Calls count for 2^3: 185844
>> [  223.184881] Calls count for 2^4: 87868
>> [  223.188660] Calls count for 2^5: 9916
>> [  223.192368] Calls count for 2^6: 1865
>> [  223.196062] Calls count for 2^7: 0
>> [  223.199483] Calls count for 2^8: 0
>> [  223.202952] Calls count for 2^9: 0
>> ...
>>
>> Looks like I've just lost a beer :)
>>
>> Considering this statistics, I'd say implementing the word-oriented
>> strlen is an overcomplication - we wouldn't get any performance gain and
>> it just doesn't worth it.
> 
> And the 32bit version is about half the speed of the 64bit one.
> 
> Of course, the fast way to do strlen is add a custom instruction!
> 
>> I simplified your code a little bit, it looks like the alignment there
>> is unnecessary: QEMU test shows the same performance independently from
>> alignment. Tests on the board gave the same result (perhaps because the
>> CPU on the board has 2 DDR channels?)
> 
> The alignment is there because it can overread the string end
> by one byte - and that mustn't cross a page boundary.
> So you either have to mark the second load as 'may fault return
> zero' or just not do it.
> 
> If the data isn't in cache the cache load will dominate.
> The DDR channels only affect cache load times.
> Get a TLB miss and add a few thousand more clocks!
> 

Ah, right, sounds reasonable...

Overall, I believe your solution is better and it would be more fair if 
you send it as a patch :) Here is benchmark results for your version vs 
the original (the old) one on the Starfive VisionFive2 RISC-V board:

Size: 1 (+-0), mean_old: 350, mean_new: 340
Size: 2 (+-0), mean_old: 337, mean_new: 347
Size: 4 (+-0), mean_old: 322, mean_new: 355
Size: 8 (+-0), mean_old: 345, mean_new: 335
Size: 16 (+-0), mean_old: 352, mean_new: 367
Size: 32 (+-0), mean_old: 425, mean_new: 362
Size: 64 (+-4), mean_old: 507, mean_new: 407
Size: 128 (+-10), mean_old: 730, mean_new: 442
Size: 256 (+-19), mean_old: 1142, mean_new: 592
Size: 512 (+-6), mean_old: 1945, mean_new: 812
Size: 1024 (+-21), mean_old: 3565, mean_new: 1312
Size: 2048 (+-108), mean_old: 6812, mean_new: 2280
Size: 4096 (+-362), mean_old: 13302, mean_new: 4242
Size: 8192 (+-385), mean_old: 26393, mean_new: 8160
Size: 16384 (+-1115), mean_old: 52689, mean_new: 15953
Size: 32768 (+-2515), mean_old: 107293, mean_new: 32391
Size: 65536 (+-6041), mean_old: 213789, mean_new: 74354
Size: 131072 (+-12352), mean_old: 426619, mean_new: 146972
Size: 262144 (+-2635), mean_old: 848115, mean_new: 291309
Size: 524288 (+-3336), mean_old: 1712847, mean_new: 589654



>>
>> --
>> Kind regards,
>> Ivan Orlov
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

-- 
Kind regards,
Ivan Orlov


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
