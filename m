Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DEEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 21:18:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76FE661131
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 21:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76FE661131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzLU1yc9MQjctbr2Iw5QmZxKI4t3VquCuEnUBEmQJmo=; b=e0WS5N98PnmBZwKONd9nhmxI9p
	F4DzxVqDXwO9Z3tGqnruYqcWVfAYz0wuKqnWZR7ycbDcEC1Mq7V2q3GBnMwJ67DnlUamI3tAPA0C/
	4wT4HxuDjIKBRUmqvJUpau5F3fDci+wQ+0Jh5lJE8P/JrTKxwjZIHHx1zzkM7h81tftGsqBNXbgA6
	l2AMzYdg39dAxnHYQAtoIzCoLmdZg90k9iuuvsZUAoHMz5SJFFOgKoCy3zR0VnDDsbLlh3pdTaADz
	svgBXiXtKnPQyJzDZGQSRlT5mvv5ryhxPKoRGE7AXNOj668BNVMcvqU1loX03iFFA0/cDpd4M7E1O
	KedQozCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO4wr-007cNs-Hk; Wed, 08 Sep 2021 21:17:37 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO4wp-007cN2-Ch
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 21:17:36 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so4755638ott.10
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 14:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TPlAlW9m0l3/305TAZdOn8PajEjpurMWCxqwt3GbkS4=;
 b=k5Abv4lPU09XKV+T9DT6mwM4nvhzpbp8w1z70/OHtY75Ynul9pQ6hYn5bXFmBFeMrW
 O0+919A9pdjrK0y3dcJvzhZin3ZKvXoUiyDt23xQHj/SSnlPAAi9VRQzz8a1I4ubHeF0
 4nYBDLB8Lz6QbbDkoFiuCJHvyWUVUa3EzltHvqTW/L4+AUCf7EQWCKr68+2A7LB0C3ZB
 q4oXu0fljrYBN40kLy/hL1DYa7IAkakc0Yf4BDFQNlOFsl5vyYVrUyyUyf3OAkf0Gq/o
 aDrKuO+c9bQIEHnV0CzehyjBRrbMdQCVCf6U1wUNm2OTmqSD0tlRXzMVuymIfnAuoQV+
 izxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TPlAlW9m0l3/305TAZdOn8PajEjpurMWCxqwt3GbkS4=;
 b=5OwLxU+3uMJ6j1an2e/DuHEwa+OSCJg7IAjoXCPKaq0j71eKcM22vlo5/+weNwG53P
 +M7lp/i47JF/D85Fw4AuyUAjlnsveiHFBBbWX5BrL09siK+DBlk84UY5PDH+TWL+jskj
 mQ9Q9GHNz3kzMZZayAh5oD41dexDCKY1QRDbJuuogYczDF6nb88pQsQXOGg1JXDL72UK
 4rI9bIlUn9KVVjM0Xx4lhIvgsdrZqFX7tW2IdWWeuFTe3HVloTR7LHeEARRIpki8Ym/Z
 fyp2TMqNtlVxs6m2upY5ik0R1q246q+JSNhb+JcavAEwcTIuIlIennJbhGOAu/xypcbj
 7JjQ==
X-Gm-Message-State: AOAM530SSQpDATCpf+V8vyUqXYdmmL3lALoJkTQbluxg+kQUxcGdOYyl
 e9C0J/NPhGxWdqalOlyd7jk=
X-Google-Smtp-Source: ABdhPJxkjqUmx0EXZUtOM51rkpogDdc1elqKgJf+LSadeuZxUOTgYN8HN8JPtJWeUSz2gihbxedmdg==
X-Received: by 2002:a9d:7f07:: with SMTP id j7mr181524otq.84.1631135853295;
 Wed, 08 Sep 2021 14:17:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id j8sm39523ooc.21.2021.09.08.14.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 14:17:03 -0700 (PDT)
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
Date: Wed, 8 Sep 2021 14:16:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTkjJPCdR1VGaaVm@archlinux-ax161>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_141735_494318_FF3EA63E 
X-CRM114-Status: GOOD (  19.56  )
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

On 9/8/21 1:55 PM, Nathan Chancellor wrote:
> Hi Arnd,
> 
> On Tue, Sep 07, 2021 at 11:11:17AM +0200, Arnd Bergmann wrote:
>> On Tue, Sep 7, 2021 at 4:32 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>>
>>> arm32-allmodconfig.log: crypto/wp512.c:782:13: error: stack frame size (1176) exceeds limit (1024) in function 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
>>> arm32-allmodconfig.log: drivers/firmware/tegra/bpmp-debugfs.c:294:12: error: stack frame size (1256) exceeds limit (1024) in function 'bpmp_debug_show' [-Werror,-Wframe-larger-than]
>>> arm32-allmodconfig.log: drivers/firmware/tegra/bpmp-debugfs.c:357:16: error: stack frame size (1264) exceeds limit (1024) in function 'bpmp_debug_store' [-Werror,-Wframe-larger-than]
>>> arm32-allmodconfig.log: drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3043:6: error: stack frame size (1384) exceeds limit (1024) in function 'bw_calcs' [-Werror,-Wframe-larger-than]
>>> arm32-allmodconfig.log: drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: error: stack frame size (5560) exceeds limit (1024) in function 'calculate_bandwidth' [-Werror,-Wframe-larger-than]
>>> arm32-allmodconfig.log: drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: error: stack frame size (1064) exceeds limit (1024) in function 'cfi_intelext_writev' [-Werror,-Wframe-larger-than]
>>> arm32-allmodconfig.log: drivers/ntb/hw/idt/ntb_hw_idt.c:1041:27: error: stack frame size (1032) exceeds limit (1024) in function 'idt_scan_mws' [-Werror,-Wframe-larger-than]
>>> arm32-allmodconfig.log: drivers/staging/fbtft/fbtft-core.c:902:12: error: stack frame size (1072) exceeds limit (1024) in function 'fbtft_init_display_from_property' [-Werror,-Wframe-larger-than]
>>> arm32-allmodconfig.log: drivers/staging/fbtft/fbtft-core.c:992:5: error: stack frame size (1064) exceeds limit (1024) in function 'fbtft_init_display' [-Werror,-Wframe-larger-than]
>>> arm32-allmodconfig.log: drivers/staging/rtl8723bs/core/rtw_security.c:1288:5: error: stack frame size (1040) exceeds limit (1024) in function 'rtw_aes_decrypt' [-Werror,-Wframe-larger-than]
>>> arm32-fedora.log: drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3043:6: error: stack frame size (1376) exceeds limit (1024) in function 'bw_calcs' [-Werror,-Wframe-larger-than]
>>> arm32-fedora.log: drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: error: stack frame size (5384) exceeds limit (1024) in function 'calculate_bandwidth' [-Werror,-Wframe-larger-than]
>>>
>>> Aside from the dce_calcs.c warnings, these do not seem too bad. I
>>> believe allmodconfig turns on UBSAN but it could also be aggressive
>>> inlining by clang. I intend to look at all -Wframe-large-than warnings
>>> closely later.
>>
>> I've had them close to zero in the past, but a couple of new ones came in.
>>
>> The amdgpu ones are probably not fixable unless they stop using 64-bit
>> floats in the kernel for
>> random calculations. The crypto/* ones tend to be compiler bugs, but hard to fix
> 
> I have started taking a look at these. Most of the allmodconfig ones
> appear to be related to CONFIG_KASAN, which is now supported for
> CONFIG_ARM.
> 

Would it make sense to make KASAN depend on !COMPILE_TEST ?
After all, the point of KASAN is runtime testing, not build testing.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
