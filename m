Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C280C982E6
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMt+9iKC8yl5qcQsCaQtEnONCnqS6O1WFDv2JFXOmiM=; b=g4kbmMHBMyyYGg
	OGB5xVa0ytq0dOSR+ICH4ByH6blOpMZHMg3//ytuSkEK7+JTmBNo+JQ4ywAlYYv2pQSYjwkTtOAPb
	4Ml/hfpitU04LMGK1cNpVfcJZd9XyrW9Orqxq+wFrhzxgmV5+Eu+kGmi4mATcxy89EJ6+1+J5tqx8
	BUKB/54eFsd9rHVl2iaMNo4g+VyB7ONicIjfKLYnARPjUO2HQgYt+DMQUgsw0Lz80vmWpd6dsNKTS
	cOg/irmXvoeLqiLLOLkcI61SzT0hKq2pFs8PNFxgKghYqz63pF1EHPb+0g1WA8WZFsKAypOQPngtU
	T3x7Anbvk1ZnN16sKSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ePM-00000002IL6-45b6;
	Mon, 21 Sep 2026 13:50:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ePK-00000002IJO-0wdI
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 13:50:11 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4843e397f74so1480583f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789998608; x=1790603408; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4xPQrVJdFgFl8luzeo5fY/IUnv52YMtHgLJT02PkgQ=;
        b=QVsV51WJ7p8ldffv8Ga4ndL+GuCpJiPIP9pH2AzfvxbcIBbzI1FoZqUjaG9JZRX8e8
         CUbJ2qGA6Z0hkdAjmt9+VkZROW0gcyXReJW/mVCPGpQvyGQD0LFOzTfs57GKWdd9QmXJ
         dcB0oRLyIVRW5dCwh9MZ2Nt5WbQDBaozqh0vCTDGH6JRv+cgL8bczoQobSV9bAeAF3LW
         KPagxZPSQmpQHaD4CR1WKirgKUAA+g9tu0Q2APgdq2uv/+8A7e98gUAs4+OcbMrbuzBg
         NvB3dAfCoIDnBa5gWNHYouCd/PHNJ4R6Lk7P/6QVGUiUuU/HSu0QtyldlEKcUzUdW6VK
         U/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998608; x=1790603408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4xPQrVJdFgFl8luzeo5fY/IUnv52YMtHgLJT02PkgQ=;
        b=yM/8XHQiMEdTRjhMtjunNjYEmHQ6XiXjQsPlfZhFhrLYsNgOVcAtOneLIkv6NreUaS
         8yzPjZG/sH0q6lTMb49q1e1zUxvM8iSQKgc4i46OZNOaXscCkJivcz/pqmek8cvw7+ya
         X7DMA1/APM1gU6vGF41el0RQA+N/iWMaOoMwpz5Q830zrEps8h0P+QyzKWU1/AArRLre
         MZ721cy5iUHbGFvHKuXNQfHAz2c5Ox7cMgk3Cf9da4+tkOMrcp9/V51mn4w+HnMA0ilF
         rfkB7Kqf8VXH5pMPFJT1bq4ERb86flgUsDrD0Wk3wrcKB1eh4w6f7ezMzT/wSKD1r0DQ
         Bo3w==
X-Forwarded-Encrypted: i=1; AKwUvBxnkOP6YCX1dT+wEl+Mq6n9IXxdauEZH2fbxle6bvdFipkLLQ8TmRFDmQ0bKxStuF6Oa+tgFt3Op8Ns8Q==@lists.infradead.org
X-Gm-Message-State: AFuF++k7qZM3qb6svwlnaFKtu1ZN/x96FaLNqY2z4ekwSgJ7A907vemz
	zlWiIsJoDGfvRJaZB5WpK3xVgl/SO8Dgk6gNDKX6qp8/XLQdAzOPcLUZWwfH2M3y/DY=
X-Gm-Gg: AYBFou2RjfVfQYh0O03KrgraRbqoopYeW46CyGWOrnqDEgZrG/+Fbexx7sQtc3ICMad
	Kno7mzo6Wosc1YHfxmKa7//9kIzBsml/iLDyivT8wBXwDD7RMs7zKHJfkdsv6AR88Zm3ghTmerw
	sj33F+KpExaWV2s2tE+yUSKuy1/6bHR18OWhM0ULLnVJlrPIROcDg1vR0hDRO51YDBRic1jVxOJ
	KnahiWVCHoPaksLCag1Q1mwXRAi0cYek4YeMyBeIrvzhcgZNk6JGHg4FnDH4iWoS/OX5m0Vz0Jd
	UV8GHZH8Be8tMi44GmNP3Pwr2pvYqnIa0U9iB3iHYN+s9PchT+SbBOzDtgoBZYN51ckkrGZW6Ag
	y5B13vyX00GGhOv5c8tEAZhxcEKaANaadS8caLEYjoHZL9dG3Tk8/LSKcJvpvaTw8HQ+r8IHmEs
	lHO8zdVXbYQgATCAs5iCvxHeA6KEOELfMOW6ZeHlr8OLyvQVcWMddrH8qvT0G8eIdm1NZaFvSwp
	iZqIT4PaO69XEqVxYUmJRhjzYqPl9fS4GA=
X-Received: by 2002:a05:6000:64a:b0:487:c3e:d6cc with SMTP id ffacd0b85a97d-48713c7f005mr24266022f8f.31.1789998608134;
        Mon, 21 Sep 2026 06:50:08 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724596604sm23426141f8f.30.2026.09.21.06.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:50:07 -0700 (PDT)
Message-ID: <58605613-8a43-40e7-a00a-b0d09f089ec8@suse.com>
Date: Mon, 21 Sep 2026 15:50:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] modpost: emit module descriptors as assembly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-hardening@vger.kernel.org
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-13-39817ec5db23@kernel.org>
 <95baacfb-d8d9-4d2f-bc89-592df6f6f8e3@suse.com> <arEZrFmXeCO4hZpP@gremlin>
 <2b27bb4b-47e3-45ed-a26a-4b9de2b20542@suse.com> <arEnCzzQa9XDd4LT@gremlin>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <arEnCzzQa9XDd4LT@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_065010_291832_3D72BABE 
X-CRM114-Status: GOOD (  21.50  )
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

On 9/21/26 2:48 PM, Lorenzo Stoakes (ARM) wrote:
> On Mon, Sep 21, 2026 at 02:36:30PM +0200, Petr Pavlu wrote:
>> On 9/21/26 1:57 PM, Lorenzo Stoakes (ARM) wrote:
>>> (note there's a v3 see [0])
>>>
>>> [0]: https://lore.kernel.org/linux-kbuild/20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org/
>>
>> Thanks, I missed it.
>>
>>> On Mon, Sep 21, 2026 at 01:25:09PM +0200, Petr Pavlu wrote:
>>>> On 9/14/26 11:22 AM, Lorenzo Stoakes (ARM) wrote:
>>>>> The sections were confirmed to be byte-for-byte identical to the C version
>>>>> produced - each of .modinfo, .gnu.linkonce.this_module, __ksymtab*,
>>>>> __ksymtab_strings, __kcrctab*, __kflagstab*, __versions,
>>>>> __version_ext_crcs, __version_ext_names and their relocations - for all
>>>>> 8,135 modules of a clang allmodconfig build with CONFIG_COMPILE_TEST off
>>>>> and CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
>>>>> CONFIG_MODULE_SRCVERSION_ALL on, and for a sample built with gcc.
>>>>
>>>> Lowering the data to assembly loses debug information for __this_module,
>>>> specifically that it has type `struct module`. It might be worth
>>>
>>> No, it keeps it - every module includes linux/module.h, and the extern
>>> declaration of __this_module carries the type, so all of the stuff gdb
>>> needs (e.g. ptype, p & field access), DWARF etc. is all there in the same
>>> way as with .mod.c.
>>>
>>> Have confirmed locally.
>>
>> An extern declaration alone shouldn't cause its name and type to be
>> included in debug information. They should appear only when the variable
>> is referenced by some code.
> 
> Ack yeah sorry my mistake, I had the LLM check that and should have known
> better than to trust it without reviewing what it said (as I have done for
> the most part for everything in this series).
> 
>>
>> Testing with a simple module that previously referenced __this_module
>> only in .mod.c and in no other file, such as lib/test_module.c, shows
>> that the .ko no longer contains debug information for this variable.
>>
>> I've verified this behavior with GCC 16 and Clang 19.
> 
> Ack confirmed locally.
> 
> Can put a fix in module-common.c.
> 
> The LLM came up with a reference as an alternative:
> 
> static struct module *const __this_module_dbg __used __section(".discard.this_module") = &__this_module;
> 
> Would that work? Or should we go with your original suggestion? -
> 
> __weak __section(".discard.this_module") struct module __this_module;

With GCC, the LLM's suggestion produces debug information for both
__this_module_dbg and __this_module. However, Clang only generates debug
information for __this_module_dbg, so it is not quite what is needed.

-- 
Thanks,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
