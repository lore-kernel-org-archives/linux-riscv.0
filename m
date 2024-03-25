Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE697C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4D/GCb9w9Va9/6qshWbsFnSt4Yu9+tMbkxvrMFUAac=; b=kM7dz5fcbIZ6nx
	Imus6gNV0JODEa75T6Ik/ppOilWjh221waETDRPl3f1yaZZ2QXSVIHYvxv8B7QLRcrRoFEEqLYoTo
	jVa5uHdLfOVhPdcU6u3eMON9Ky5+BHjqxHzwWqkvJHtJREqILwFdyZOE4J8cpM6cSWi7PyMZ/cuwI
	MeefIWYGO3kCVYBEmmR0M4j1BPtBNyvV892WuTTfUv3CFrTqez0a8KabjLoTlXpAy/7S804P40NBA
	nCjidPtJhrMTJajoa8SzGChz1pJ/AKz4lWlFgkqX8p6MPM3vMBTMD8zKDxgFviKtF+JzB6B+2bWBS
	25+7FPi8GNcumO24dNhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropsL-00000001ZCv-48fq;
	Mon, 25 Mar 2024 19:20:53 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropsI-00000001ZBU-3y0n
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 19:20:52 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7cc01644f51so203602639f.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 12:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711394448; x=1711999248; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sv+dTeEhRx84ZTiMETbHHNzVA6gJg2UXSOcI57+q+UU=;
        b=MpcKEFO7VZl/rNGijARMg6qmxv4Pb2RmFdQptpQRkReoK4F0/7YHj0NSbEmaETUaWE
         e1dRkb7Gn4J6sLJOOWYtMzOlXkOOJcGlg7Lldw6OeUJ35bZQh7D3n3TrLZ9UDg28JZZB
         qMnfRVOseDLZPHPp1mtOqzD8EYfiaoLFzR5zRwuRkc3/wrwM5WKpglsSKogLjNNiXIIh
         60YY4UAdFXalYxwqW7oJW6qIdfxhGPQHMGWLcPlbgUnpmq2ym3EZPFDE0KEONKkY51Cf
         aY+MU9Qc+Ge1xaKH3d35CbMDELwgo97HqN2t33hTo69DU1rs5U7JRj5j6+nZmzxa+c4K
         XskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711394448; x=1711999248;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv+dTeEhRx84ZTiMETbHHNzVA6gJg2UXSOcI57+q+UU=;
        b=iKlLRvsgP3mTfsvW+LkwjRyBfIU+E1YS9pgEzYHTq4GSA56BwhKB2QxNqWIh9uZ+0/
         8U1oiaFt2VtEseZ46+blKHLQOZ6hoN5UxGxaEzYB1pNymPgmwT8DklLm8nGvN7uwY1NY
         HGqa6AjIImzEdcFsVvXtdHGEzVNthaOkfgrrUETbSRY6AGysG5ldCEHKn0ClyVkd5gK9
         jrR1jk7cXMMFJ6g7ijr0ye2CwBjNGzo8Thbpu4itumv3Gkw2PO1lp4yraI9t0gleqbeq
         zcYjTnoODNy7EYqJb1znRAo2AlqzQ18mtOXRHl23UykVflziBhgQ+l4F823u4LBiwr2h
         g6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVqv2uR++Ys2K3eIZY6jmweIX6FP522n3ny2cKjC0gWAeU33SjdxDRmbIa620+E22TJPNjPSrDBxjlEO9sqGW8oTT8X7Au1NMrsTD5hiign
X-Gm-Message-State: AOJu0YyA6xNwUWM4nwgU4+sdrS935tSzXJA+PgwYI6fYLSQi9prBX2Xc
	NNp6clBrYnWsC+XP33g0mFKr4govhQe9eBCzz3MP+7f/KjHS5chyC+4wyYlsPY8=
X-Google-Smtp-Source: AGHT+IGgMqUl4sRDrJG66cYxeIJMFjP1ZhvADblr9V63c5aanNrfT587vEs2VxCiJVrrEMzfdd4+Lg==
X-Received: by 2002:a05:6602:4f11:b0:7c8:bbdc:ebed with SMTP id gl17-20020a0566024f1100b007c8bbdcebedmr8382717iob.6.1711394448046;
        Mon, 25 Mar 2024 12:20:48 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id j11-20020a02a68b000000b0047c1f2e4960sm749632jam.56.2024.03.25.12.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 12:20:47 -0700 (PDT)
Message-ID: <757b0f1c-b8ff-4a1a-8edc-8dc651a348fb@sifive.com>
Date: Mon, 25 Mar 2024 14:20:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
To: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Ghiti <alex@ghiti.fr>, David Laight <David.Laight@aculab.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer Dabbelt
 <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton
 <akpm@linux-foundation.org>, Charlie Jenkins <charlie@rivosinc.com>,
 guoren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Matthew Wilcox
 <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Xiao W Wang
 <xiao.w.wang@intel.com>, Yangyu Chen <cyy@cyyself.name>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
 <f786e02245424e02b38f55ae6b29d14a@AcuMS.aculab.com>
 <d323eb10-c79b-49cb-94db-9b135e6fd280@ghiti.fr>
 <ZgGosOiW6mTeSnTL@FVFF77S0Q05N>
 <eeccbc9f-7544-42c9-964f-2b4c924c2b2f@app.fastmail.com>
 <ZgHCpgHh1ypSyrtv@FVFF77S0Q05N>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <ZgHCpgHh1ypSyrtv@FVFF77S0Q05N>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_122051_084608_9CED74DB 
X-CRM114-Status: GOOD (  25.74  )
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

On 2024-03-25 1:30 PM, Mark Rutland wrote:
> On Mon, Mar 25, 2024 at 07:02:13PM +0100, Arnd Bergmann wrote:
>> On Mon, Mar 25, 2024, at 17:39, Mark Rutland wrote:
>>
>>> Using a compile-time constant TASK_SIZE_MAX allows the compiler to generate
>>> much better code for access_ok(), and on arm64 we use a compile-time constant
>>> even when our page table depth can change at runtime (and when native/compat
>>> task sizes differ). The only abosolute boundary that needs to be maintained is
>>> that access_ok() fails for kernel addresses.
>>
>> As I understand, this works on arm64 and x86 because the kernel
>> mapping starts on negative 64-bit addresses, so the highest user
>> address (TASK_SIZE = 0x000fffffffffffff) is still smaller than the
>> lowest kernel address (PAGE_OFFSET = 0xfff0000000000000).
> 
> Yep; the highest posible user address is always below the lowest possible
> kernel address, and any "non-canonical" address between the two ranges faults.
> There's some fun with TBI (Top Byte Ignore) and MTE, but that only affects how
> to mangle the pointer before the check, and doesn't affect the definition of
> the VA boundary.
> 
> In general, so long as TASK_SIZE_MAX is <= the lowest possible kernel address
> and TASK_SIZE_MAX > the highest possible user address, it all works out.
> 
>> If an architecture ignores all the top bits of a virtual address,
>> the largest TASK_SIZE would be higher than the smallest (positive,
>> unsigned) PAGE_OFFSET, so you need TASK_SIZE_MAX to be dynamic.
> 
> Agreed, but do we even support such architectures within Linux?
> 
>> It doesn't look like this is the case on riscv, but I'm not sure
>> about this part.
> 
> It looks like riscv is in the same bucket as arm64 and x86 per:
> 
>   https://www.kernel.org/doc/html/next/riscv/vm-layout.html
> 
> ... which says:
> 
> | The RISC-V privileged architecture document states that the 64bit addresses
> | "must have bits 63-48 all equal to bit 47, or else a page-fault exception
> | will occur.": that splits the virtual address space into 2 halves separated
> | by a very big hole, the lower half is where the userspace resides, the upper
> | half is where the RISC-V Linux Kernel resides.

Right, and while RISC-V has a pointer masking extension[1] similar to arm64's
TBI, it will be handled[2] the same way: by sign extending the address prior to
checking against TASK_SIZE_MAX. So we maintain the property that userspace
addresses are always "positive" and kernel addresses are always "negative".

Regards,
Samuel

[1]: https://github.com/riscv/riscv-j-extension/raw/a1e68469c60/zjpm-spec.pdf
[2]:
https://lore.kernel.org/linux-riscv/20240319215915.832127-1-samuel.holland@sifive.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
