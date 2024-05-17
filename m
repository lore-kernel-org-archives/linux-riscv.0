Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25011C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynAk9nUHQD9nnp046TVbMl4jh0vmu09TE8Ru2dO9LTs=; b=IAOaxN253UixTY
	qLXLh4CGXlaCDFEqp35ncAtrkXfAoiu+ElBeI7Lr5pdVFo0zr34KWQgWv3aOB8vt2m0NPWv9Yflp8
	mRkkIo0pomB0AsAZulL20RvRuvZToH6ntcePLvQJy29G/6BKLUmN5iI58le04jV0B5Xo6gKBW/2nC
	HYPRrPKVqBvTZz8qwyxh0WfSQOqV0uHaVHw4WmfdFWxCeNbtafBgYNQtqpZSYzlLFHJE7r4+Y62NH
	NWVynxX7is5ovdQZQ2PZ/UGXZBpsG2ixbUh2VE2HIKS2ZlypkVr0WA+67WJxECzKJJUctqecmz/qX
	8v/FhhbGiQH2lvU+yh0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s809a-00000008LF4-0O5A;
	Fri, 17 May 2024 16:09:54 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s809U-00000008LCL-3oSO;
	Fri, 17 May 2024 16:09:51 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so1013388e87.3;
        Fri, 17 May 2024 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715962186; x=1716566986; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IstAfylTBNaTxmmaRyk4imp16sEYUHGaznoMjv7UZHs=;
        b=kW8JWxtRg8pik7WLoCrnEnumJ5VxRKNODdTGmq5yWmnmQIGt1BH+7mg11C8UAMd+9d
         jCcmyOUA/1H7YRPJF7ntP/vwPBA+ibYtiIfF1YOsEjTQhpmREwzboaeX3MrHjtBCkhf4
         cYv4oSXpuGUxhSA5ECZuVbtXC7I6nYwxQj6Xsl6B7dY04KPoKxKlxz/2U/bFKy0RqWSF
         dQQO6xrVr5YDa1+oRW1n1jnDJn0P6qFku5fv5lJqTgr7+fKJtSFTXGi3llu6PINH4uSY
         RYls3IuWPApXSxWTj0ZYbHD9zRZXmBZ0JHxfls7lBqwtohbcsKWVbYRE2VRldsxFdkHX
         UTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715962186; x=1716566986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IstAfylTBNaTxmmaRyk4imp16sEYUHGaznoMjv7UZHs=;
        b=iqeyz7GMpA0sq9jHZ/Q0RjLpzc24dnZXi4pJyoDMnnscTk2lVzB7WoTGKx0e4nY1yw
         kWpnrT7GcJ2Vyk2U9YfVbMZCLKHC9vBROjCQSJ6H68MIJ3MIr/zFf3UA//1quzDQER2z
         8Hxlmp7Rxj10GJ5ajUW6Zc+jB21O1S1SUP9Bpa4WAd5wuMVniD9nlTu2UjV8rTMgnpOP
         FPb9vHTA/kZtJDAae7p6ZCRZw/a41t8Ur8f5yaZRv0/ISFlBSdUZdaKtyzeeronD771L
         Ybna4Tgm3vDUCqQxGnYrFxToDxixwh+VQBA/VviD4Tes05gDShnRS/bGNCjO4e+zEDe6
         fdkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJIA7kp4kk4C7yN6mbLN40KWfdvWM5i9BcSAmXOQqTGuD8jhgdRmhSIaFozU3pWi7MfXK2U1qNsFlA5XHKwMOOLccev4Eb0NEvJryrXBUJtv1kaIuqPe8gGzKX625pDxIvKYfYB/1QDpAF0T/YT1NwSAI3CLg=
X-Gm-Message-State: AOJu0YyddsyEsHB57KzZUbyqklWU46YztCw6vU8ET+b2TTHyuEl/WS9Q
	xq0xLdMkxGWrX7jsBXYPTFba7vl7RI18WU+BYR9NPJuzhJNiF/D5
X-Google-Smtp-Source: AGHT+IHgmwwit2WhgD28ItKwKm0UGYj6mPQDthm9VUXNUEsMkvdnQLGvWiUajRHCK+r/d8TH466Lzg==
X-Received: by 2002:ac2:54b9:0:b0:51f:d72:cd2d with SMTP id 2adb3069b0e04-5220fc7aeb4mr13493469e87.22.1715962185544;
        Fri, 17 May 2024 09:09:45 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1202:2659:d6e4:5d55:b864? (soda.int.kasm.eu. [2001:678:a5c:1202:2659:d6e4:5d55:b864])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d7ee4sm3314135e87.182.2024.05.17.09.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 09:09:45 -0700 (PDT)
Message-ID: <170eca58-8950-40b5-b2af-3ac3844af3aa@gmail.com>
Date: Fri, 17 May 2024 18:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v8 16/16] bpf: remove CONFIG_BPF_JIT dependency on
 CONFIG_MODULES of
To: Will Deacon <will@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>, Liviu Dudau
 <liviu@dudau.co.uk>, Luis Chamberlain <mcgrof@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20240505160628.2323363-1-rppt@kernel.org>
 <20240505160628.2323363-17-rppt@kernel.org>
 <7983fbbf-0127-457c-9394-8d6e4299c685@gmail.com>
 <20240517154632.GA320@willie-the-truck>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <20240517154632.GA320@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_090949_050794_D9319CE1 
X-CRM114-Status: GOOD (  22.93  )
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

On 2024-05-17 17:46, Will Deacon wrote:
> Hi Klara,
> 
> On Fri, May 17, 2024 at 01:00:31AM +0200, Klara Modin wrote:
>>
>> This does not seem to work entirely. If build with BPF_JIT without module
>> support for my Raspberry Pi 3 B I get warnings in my kernel log (easiest way
>> to trigger it seems to be trying to ssh into it, which fails).
> 
> Thanks for the report. I was able to reproduce this using QEMU and it
> looks like the problem is because bpf_arch_text_copy() silently fails
> to write to the read-only area as a result of patch_map() faulting and
> the resulting -EFAULT being chucked away.
> 
> Please can you try the diff below?
> 
> Will
> 
> --->8
> 
> diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
> index 255534930368..94b9fea65aca 100644
> --- a/arch/arm64/kernel/patching.c
> +++ b/arch/arm64/kernel/patching.c
> @@ -36,7 +36,7 @@ static void __kprobes *patch_map(void *addr, int fixmap)
>   
>          if (image)
>                  page = phys_to_page(__pa_symbol(addr));
> -       else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
> +       else if (IS_ENABLED(CONFIG_EXECMEM))
>                  page = vmalloc_to_page(addr);
>          else
>                  return addr;
> 

This seems to work from my short testing.

Thanks,
Tested-by: Klara Modin <klarasmodin@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
