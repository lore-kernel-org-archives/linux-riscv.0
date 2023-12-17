Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7910C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 22:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrbwAVgZpsmj0z47ni7ZVBnQl/zxW85j6yxX+UyBSrE=; b=j2zNXv8uLp4Zfm
	ZAQVAsXTpnmrR+gzNVpWapaFsp9c59nIiFLFzZBJUf8kBl4uwI6rO3jg3Mdo8GedzF9PUHYD60ipa
	JJhK+EMiinZUk1EgRwkqjNCHwM54DqYLDFSV6Rp+yeX8Q9hqmOM6q6LAM2AUAI7M1LCmsNfZfyqlM
	meIsXMg5LH8Ip1W9FThDNfO2rsf4it7YZHKt/qf19XfKZ1DqNytNaM3ahfXf/9VTXBVQ4l6B5cOP0
	vVL2UtreU0eJEIQgU0ajdYk/sYR4SwjZIi2bXZWrAPeZg0+cCV0e8DlQDqV6ntkRKpdmr5WfhR+3d
	CH5kUhOK23KlvR+S+/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF01w-008bkt-2j;
	Sun, 17 Dec 2023 22:54:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF01u-008bkV-0f
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 22:54:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c32e205fcso4740885e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 14:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702853675; x=1703458475; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPvpS7R4wE5DRxO9i/YwUOLdN8AtChaRRgGgCZAfswA=;
        b=A35otIvSyNH1mXfzVJw+5styL4WFVtJdpnjX7xFRV7iyQNBaMonZJoiy/meLpYA6BN
         GhOmczJanzKp9LHIJzu5//ilAwg0zsVak9EWCK1LmxZ0MJq4uNM//DQoWtRrL7U76QVg
         sqaqnArA2ZYLzGHPGIXGMKC3SyITZuhNKojEPg9WBaIEZZwEXo7W6qGWe6YX8+R3mYi0
         YAH/fiA93W28eR8AHnUAILK62NZE0W527Et/gBEMAMuqHdWR3q8HizYu0B35I3Bp5ytp
         N1m4KpMHP02aGKZtl/sC1iPbf4S+V/bXx5/2zqnNrGRFqbLnuiuSDMcst2z5vyyOJhnb
         m8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702853675; x=1703458475;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPvpS7R4wE5DRxO9i/YwUOLdN8AtChaRRgGgCZAfswA=;
        b=k2FFPeJNwfKuRTN2ceOi7saFSKZJXv9qbBwZ4U2sP+vm9Xef7ldZOgAYRTpGpOYFDB
         oWH6MJUuqPILLIqaACQ/dHvYK1aa3VXgoZpd1/8KfSpcT6mmbSFCcH7Q8pKbaPRdLFx4
         eLidVrnOjymMH/X6YO2KZxyQla2YUwStUu5e61yOy1012svHdVNWpu6I7EuoUoMLFOFE
         Ymyv7+LZXI79L6p3m2oSchyQkeHzcKy4/Xf7MdQmcivzHWDQC5gMsPjDJD5Fnv4h7aTh
         9qYRHr6mzFQHF8szP8+SUxbDTFIBsqeeW5CKt+XkG96TkBRfea16G3aoGAvNYFq0QbBJ
         05HQ==
X-Gm-Message-State: AOJu0Yxs0Qh7ENwKhGH3SBxM84OKlu+kUMzXItGxCG6N6bxq3a8rJYb6
	it4jOTKjQYmgwwxknoVbiTFnQFDECfTFAw==
X-Google-Smtp-Source: AGHT+IEJCSwNB+HrllWWy73g8O07cH+Zn/P3nm9F7Zdktr+2W5C10RdUqxDxWXnGUmwWwKV8EVDHew==
X-Received: by 2002:a05:600c:1d23:b0:40d:123a:50eb with SMTP id l35-20020a05600c1d2300b0040d123a50ebmr2931119wms.3.1702853674720;
        Sun, 17 Dec 2023 14:54:34 -0800 (PST)
Received: from ?IPV6:2a01:4b00:d20e:7300:c482:b9a:a1b4:9bfa? ([2a01:4b00:d20e:7300:c482:b9a:a1b4:9bfa])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b0040c4c9c52a3sm27532512wmo.12.2023.12.17.14.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 14:54:33 -0800 (PST)
Message-ID: <f495519c-c681-4445-aedc-0f44fbd192e8@gmail.com>
Date: Sun, 17 Dec 2023 22:52:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] riscv: lib: Optimize 'strlen' function
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
Content-Language: en-US
In-Reply-To: <86d3947bce1f49c395224998e7d65dc2@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_145438_244220_469953CD 
X-CRM114-Status: GOOD (  21.79  )
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

On 12/17/23 17:00, David Laight wrote:
> From: Ivan Orlov
>> Sent: 13 December 2023 15:46
>>
>> The current non-ZBB implementation of 'strlen' function iterates the
>> memory bytewise, looking for a zero byte. It could be optimized to use
>> the wordwise iteration instead, so we will process 4/8 bytes of memory
>> at a time.
> ...
>> 1. If the address is unaligned, iterate SZREG - (address % SZREG) bytes
>> to align it.
> 
> An alternative is to mask the address and 'or' in non-zero bytes
> into the first word - might be faster.
> 
Hi David,

Yeah, it might be an option, I'll test it. Thanks!

> ...
>> Here you can find the benchmarking results for the VisionFive2 board
>> comparing the old and new implementations of the strlen function.
>>
>> Size: 1 (+-0), mean_old: 673, mean_new: 666
>> Size: 2 (+-0), mean_old: 672, mean_new: 676
>> Size: 4 (+-0), mean_old: 685, mean_new: 659
>> Size: 8 (+-0), mean_old: 682, mean_new: 673
>> Size: 16 (+-0), mean_old: 718, mean_new: 694
> ...
> 
> Is that 32bit or 64bit?
> The word-at-a-time strlen() is typically not worth it for 32bit.
> 

I tested it on 64-bit board only as it is the only board I have...

I assume the performance gain would be less noticeable on 32bit, 
probably the word-oriented function could be even slower than the 
byte-oriented one for shorter strings.

However, I'm not sure if any physical 32-bit risc-v boards with Linux 
support actually exist at the moment... So the only way to test the 
solution on the 32-bit system would be QEMU, and probably it wouldn't be 
really representative, right?

But it definitely worth a try and probably I could include a separate 
implementation for 32-bit RISC-V which will simply iterate the bytes in 
case if QEMU 32-bit test will show significant overhead for 
word-oriented function.

> I'd also guess that pretty much all the calls in-kernel are short.

I'm 99% sure they are! However, I believe if word-oriented solution 
doesn't introduce performance overhead for shorter strings but works 
much faster for longer strings, it still worth an implementation! :)

> You might try counting as: histogram[ilog2(strlen_result)]++
> and seeing what it shows for some workload.
> I bet you (a beer if I see you!) that you won't see many over 1k.

Sounds like a funny experiment, and I accept a bet! Beer is more than 
doable as I'm also located in the UK (Manchester).

-- 
Kind regards,
Ivan Orlov


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
