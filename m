Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C092C982EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//vfS6zA2cxMZZUCdUcX91T6VJMcb8ZZh+EMpgRJjaU=; b=FnQ3Ds8OSzbJDD
	Z8Na0EEssASPqEJ0AcvKoc+IPn4sjGOM7C/PZ/WIk4EBVA5IHLsHWxjKThFBmk8mHwlBTB7iH+uyM
	ZeAeUHP6tdkkJgpsoyyLivxcPFa8Cet7mol/bBBuOtceu+uvs2H8kYkuwyblnOV3iwGBpB+lQlhIU
	ZcIbmqk1XGmLT5FFr/o/KqZ7zsuu8tLTJd7n3RM0zD+0J0M4gARv8MuQG2zkUdvo6apdutNfCuqNx
	XgV7aEC/5DGD94fzk0c85wpi6L1Dsx7SG/L8gSEFV8HnUXjAJ7YgSyNK8WgQVvqUWZWOg7HBnSWxk
	Puq9JOEydp/eda1WkTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dGA-0000000253F-2y7N;
	Mon, 21 Sep 2026 12:36:38 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dG6-0000000251l-2y7n
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 12:36:37 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e79a408deso16415295e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789994193; x=1790598993; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SRT9W/2z9fLq6Pj3t4dd8eEawuNLFrl/C3bQijqfHo=;
        b=AtCmRNbihADDwiZPBHrcdNmb990qB4/ILZZsgyGuP8xd/k//ygKHPQDsqTqvrkfaSI
         sELtPtszwRfiYiKedq2VA8qq2ZOurRBEqvIUH8g+AMPiErMfLdANHfDebjGkjzj7Dds/
         Yz/PxUPZC2dX0BRjOG0kfv24fYmDlFLG5oNrdLiXPhr5YLQHONsD8mNUSmMl6KRf9cOu
         P1b10ajzSvfr+sKYhvJrgPmEnNq6EBqbnyb8aNp3KtMB6qbBoJovTW6gyeyYcfs0g1SY
         MFhlMJ5pqEHymMKYO1iypTMwvPuKhBaJLb+AoIg4xMbOPhl/xjiVz/hxLvSthBjr9Fik
         h4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994193; x=1790598993;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SRT9W/2z9fLq6Pj3t4dd8eEawuNLFrl/C3bQijqfHo=;
        b=dHX1GTOJwUn9yGd5x/4bvCz5FXY2Iy2ypfUqlDANvreP2gevyUbaHCDnjW4CXQ5T70
         n60FJ2kDZXDWog6Gzw6kThMWc4Jk8QKU1XDhMp0K633PV3oTSo+qPQL6PzCuDAvkBVzM
         UmXnrvPpXwMePDcHiggTifJ4nl97LdlVwJ08kWcPfP7+K/VZwsmyME5RwoZmvmke2b6J
         lypH40FdwGrbEJTK6eCJXp6Im+LME8hrL5VnwObsQN/3OhT7r3ambYFMU2h4ybLH8ei8
         Dyq9Blarbfq3s17pY4+KmU6ock3Im7bqiZDNgtADsoY+2ZpmBfPLv8/zPgU6rq8uyZbA
         Pw8A==
X-Forwarded-Encrypted: i=1; AKwUvBwvz0RkUNeMnO+vgGxRclhQJboc681nUs44Usp37q8vCmFkwAEdqjk0YQc1+J5FlUfPFyYYZkprAmXz1Q==@lists.infradead.org
X-Gm-Message-State: AFuF++nH3pEwb8mPDM5mKTmZPMFwMruF82uQllw58oEmETtbHQdxFJ3j
	X0ENioC6ecBEW/Bn440efoJKK05AMcBuFiXtMjpw9E/jdymISzSVXvO/tHXSWfsD9OU=
X-Gm-Gg: AYBFou2HXCc4i4M1zKHrEjXGtQ+/+PdRSmnCwjYaLZh4jm191hrrxvxT/eT4+tstDv+
	QAFVNfXsMDpDvuYbVsCDudnUMdZYjhvRr7W3T9VvgTSWKd0F360vpL/10CKxhTrohkw9toqbaMW
	1qLOGN6i+fAPQD62fHEn0BoYDe8VvNWYyZWKK403WTcFsV3R6uP9zc6oQoH1W6kInQw3OeOIzpX
	EIUCiZCFf+VL6lnVjUfzP2PTOyLHCRjch3Q6NVzNtZT6acvlTf83pPNDNxISdvQHqqeT/QR+b5Q
	PQzVlrM9C5Lp4bAm5iFEyg8aATEwxVzb8ib0fVdDSkXfPkxUP5sRYm3Yvj3NGvea+61sBc/9coB
	0+J0ujp1ZlAnO9PvRBiqTCtglDUpOjH3p2R3OHn8P6y0IBuXkSE9cBRcdOiC53Yra77bKqX+bhR
	uxaJQTR5JZYZj4NpTsTsGisHNvkbqZ1cuQMkmh/DuqIKmAwuBnd+1JpHUQQy9yTAVVsIDyCD/Wh
	5lTgFXtHvUyk1qCdQYZZDYmKmzKXAfBzKk=
X-Received: by 2002:a05:600c:46cf:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49fc5687b6cmr159289905e9.2.1789994192617;
        Mon, 21 Sep 2026 05:36:32 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460753sm23342442f8f.10.2026.09.21.05.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:36:32 -0700 (PDT)
Message-ID: <2b27bb4b-47e3-45ed-a26a-4b9de2b20542@suse.com>
Date: Mon, 21 Sep 2026 14:36:30 +0200
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
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <arEZrFmXeCO4hZpP@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_053634_779990_F80103D9 
X-CRM114-Status: GOOD (  15.80  )
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

On 9/21/26 1:57 PM, Lorenzo Stoakes (ARM) wrote:
> (note there's a v3 see [0])
> 
> [0]: https://lore.kernel.org/linux-kbuild/20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org/

Thanks, I missed it.

> On Mon, Sep 21, 2026 at 01:25:09PM +0200, Petr Pavlu wrote:
>> On 9/14/26 11:22 AM, Lorenzo Stoakes (ARM) wrote:
>>> The sections were confirmed to be byte-for-byte identical to the C version
>>> produced - each of .modinfo, .gnu.linkonce.this_module, __ksymtab*,
>>> __ksymtab_strings, __kcrctab*, __kflagstab*, __versions,
>>> __version_ext_crcs, __version_ext_names and their relocations - for all
>>> 8,135 modules of a clang allmodconfig build with CONFIG_COMPILE_TEST off
>>> and CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
>>> CONFIG_MODULE_SRCVERSION_ALL on, and for a sample built with gcc.
>>
>> Lowering the data to assembly loses debug information for __this_module,
>> specifically that it has type `struct module`. It might be worth
> 
> No, it keeps it - every module includes linux/module.h, and the extern
> declaration of __this_module carries the type, so all of the stuff gdb
> needs (e.g. ptype, p & field access), DWARF etc. is all there in the same
> way as with .mod.c.
> 
> Have confirmed locally.

An extern declaration alone shouldn't cause its name and type to be
included in debug information. They should appear only when the variable
is referenced by some code.

Testing with a simple module that previously referenced __this_module
only in .mod.c and in no other file, such as lib/test_module.c, shows
that the .ko no longer contains debug information for this variable.

I've verified this behavior with GCC 16 and Clang 19.

-- 
Cheers,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
