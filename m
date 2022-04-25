Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE61BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 03:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2V/JKrvRVIiIuqBMtswzOQqkkaHYaOaWFnUAW/42rKg=; b=sAR/Wb33XAh/Xd
	1hKNqBvYbpX7TTtJdrngYbIbgEmh3e6ejlzn81xgooe+VTwfndgWuohqbqJLRZY3xD/HXVsS3UM9o
	LFNqljPsTGe8L9/9NAkoppK4xc/nMR0ToxZYtyFvvzp4EuvrPKLPk1CKeZEvHmkGPcuWLLAZqPfHZ
	IVUOiIocf2MaX0fdOcQRvMIPVVI7zcU0J7byBye0mjWaHA59CmvwLefFOGGxtpeoMsMti2BJxBlDN
	TsHRPHRNfNzbSSr3u6wF7HaarG2EdbpEoYklOqPaYC2uCNc4PkHScG7wPmsOyn78Gn4C7LY/zjK3f
	als6qjESIPDb5GQgN9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nipUr-007z06-Q4; Mon, 25 Apr 2022 03:34:47 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nipUo-007yye-HV
 for linux-riscv@lists.infradead.org; Mon, 25 Apr 2022 03:34:44 +0000
Received: by mail-oi1-x229.google.com with SMTP id z8so15794638oix.3
 for <linux-riscv@lists.infradead.org>; Sun, 24 Apr 2022 20:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=B1QfoAi5AbmZrNfgKcOMoR0g+jeoWpDUXn39NnppiO8=;
 b=RP5YQMrqRBjFc1TPzDRF/VNHpK8/m7n4dXSd/cW6Z5KUCS1IKHMEhUBJ5NZBxPSlQe
 7w69F6X6ON+ARmCOQU0idD+EYWSxMlBPBMReqAsXwbNBrW3/87epvMb6ASjFylpL/qcT
 PlQP2jiXuw8pn/O8+w35QVbGxauzbtyJro3+/mru8XCY6zwaT9g3mN7ITl336PH9kTPK
 lV7kpe0CHmxr5jjvZV36lVm345wKpfd7SjO1S5pwz+Lqc12HAHCQ+CeXXfqmxvVDi/uu
 2JS8/XRGqAInv+agUB3X6u1ASYWsrcuw+QvXWEyK0vxNdPObwZHiGre7X9RvphN4xv+E
 e8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B1QfoAi5AbmZrNfgKcOMoR0g+jeoWpDUXn39NnppiO8=;
 b=Icj++gdXciu5lOmVCttqur0jNPc0CPRxZx3e28swpIj7UJEE45jSlK9CVAZy+138OV
 4Y3fbCo52e2m0AuNArAD6liacUfVfJIN2m6IuYn13CZ5UOxWmwTXn88yq6GuP79CJWUY
 1K38J1+euEbtv3trXFER3SCCqrRCjnRy1lyGGqqp1iLWQW+pcdlJf7rsJ7jDqmzEQhoK
 56upEb1VFlOyG90pT8MNO7ATSu7130ctHazn2/REeXDTWYeVvUpZpUORGK4DDgyr7Iqj
 m4JaQ3cM7qW8StiiCK27b3nRIC2SCpcehf4QcKFHuRWfVuOXvPhcXzS9srBjAhf7L6an
 umcQ==
X-Gm-Message-State: AOAM531WTZdU7LcRjfiOSL+7IpszYNtlcbCVYpQMsohHpf6GkxAp5e7m
 iLURTcCaa6jhbBBWN6NeBIbRGg==
X-Google-Smtp-Source: ABdhPJxo8MI+d6zaUs6uXLuDmIBbvncR0vS1nSWd1hInEUCXQb+VfGu0cvlm09UQJgV/8onv8BD9pw==
X-Received: by 2002:a05:6808:1690:b0:325:4159:2004 with SMTP id
 bb16-20020a056808169000b0032541592004mr214582oib.86.1650857680070; 
 Sun, 24 Apr 2022 20:34:40 -0700 (PDT)
Received: from [192.168.208.243] ([172.56.88.231])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a4a929a000000b0033a29c8d564sm3899603ooh.3.2022.04.24.20.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 20:34:39 -0700 (PDT)
Message-ID: <ab454879-5506-fe7d-cd59-812a6bc9d193@landley.net>
Date: Sun, 24 Apr 2022 22:38:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Rich Felker <dalias@libc.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, ebiederm@xmission.com,
 damien.lemoal@opensource.wdc.com, Niklas.Cassel@wdc.com,
 viro@zeniv.linux.org.uk, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, vapier@gentoo.org, stable@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, gerg@linux-m68k.org,
 linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
 ysato@users.sourceforge.jp
References: <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <mhng-32cab6aa-87a3-4a5c-bf83-836c25432fdd@palmer-ri-x1c9>
 <20220420165935.GA12207@brightrain.aerifal.cx>
 <202204201044.ACFEB0C@keescook>
From: Rob Landley <rob@landley.net>
In-Reply-To: <202204201044.ACFEB0C@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_203442_852145_59653879 
X-CRM114-Status: GOOD (  12.95  )
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

On 4/20/22 12:47, Kees Cook wrote:
>> For what it's worth, bimfmt_flat (with or without shared library
>> support) should be simple to implement as a binfmt_misc handler if
>> anyone needs the old shared library support (or if kernel wanted to
>> drop it entirely, which I would be in favor of). That's how I handled
>> old aout binaries I wanted to run after aout was removed: trivial
>> binfmt_misc loader.
> 
> Yeah, I was trying to understand why systems were using binfmt_flat and
> not binfmt_elf, given the mention of elf2flat -- is there really such a
> large kernel memory footprint savings to be had from removing
> binfmt_elf?

elf2flat is a terrible name: it doesn't take an executable as input, it takes a
.o file as input. (I mean it's an elf format .o file, but... misleading.)

> But regardless, yes, it seems like if you're doing anything remotely
> needing shared libraries with binfmt_flat, such a system could just use
> ELF instead.

A) The binfmt_elf.c loader won't run on nommu systems. The fdpic loader will,
and in theory can handle normal ELF binaries (it's ELF with _more_
capabilities), but sadly it's not supported on most architectures for reasons
that are unclear to me.

B) You can't run conventional ELF on nommu, because everything is offset from 0
so PID 1 eats that address range and you can't run exec program.

You can run PIE binaries on nommu (the symbols offset from a base pointer which
can point anywhere), but they're inefficient (can't share text or rodata
sections between instances because every symbol is offset from a single shared
base pointer), and highly vulnerable to fragmentation (because it needs a
contiguous blob of memory for text, rodata, bss, and data: see single base
pointer everything has an integer offset from).

All fdpic really does is give you 4 base pointers, one for each section. That
way you can share text and rodata, and put bss and data into smaller independent
fragments of memory. Various security guys use this as super-aslr even on mmu
systems, but tend not to advertise that they're doing so. :)

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
