Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2E5C79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 12:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWWF0KBBwumCIoHZUw2TnKqwKJ/2OaZtPAS0HpdkV4U=; b=WCe9iKclZGYeCW
	yW75p9vMw7J830Vvo+nN4LMr7QgRbMzpa84DClG0nmP1PfA6Tr9rEPBOYCaB0s7yHDewxZ1KXuocn
	8wmC/84uGNME+q3Yr1MTTtTGVNPph/O0m7cvVTX6g1fkhsLwRNGw3Ig/QnZPmIZMD2+lN7pzZj+Bi
	wDfvTqbt2TYm57+g7PxyKKa6z7tCf5apl5hEeOIuJSe2Yzg/ErTsoBpSWdsVNuaDjGbR7q5m4+IAa
	x91+rCRQaf+vsl3ZE60pQ6g3o1w8T42XdTgIjH9z6sBXZnZynJ+XDmgE06uTguzbBuuIfDlui8Zlj
	6kQDmvY2xIpsVkafDc8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hth-0000000BiRh-2NG5;
	Wed, 09 Sep 2026 12:59:29 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Htf-0000000BiQz-3lkH
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 12:59:29 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39666bed443so1479784a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 05:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788958767; cv=none;
        d=google.com; s=arc-20260327;
        b=DnWYXnqQg2nLB6S7wTrWbNs/ZLboNgf2V+plbKIJDodrlDVFs4AQhUgnxjYim6K6RD
         6DV7x1NpiNIAOS6gCDAPYSzjVpVI1rC4DLQwEL9JvavJmB8YSW4Rzl0/Dqxep620W/Fn
         sN06k4b8A9MeAmd1k8GN7wr8eiVLWscRtx9HbijTytSm38ezgHoXjsr2gvqcTfka1Tan
         Chxl3WdCoAnb8ZMs85gG8PqGvPWi4Zf5SHcvZqxWzfMBYw+rVhk58c2v58TarqC09MhR
         0VuvIJgfRAyFh4ZQwNGPjY1Ba0TfQcVTpeXP6O4Xy6ygb5xsuh3x0A+c/mZBHXPjeaqD
         yIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        fh=yjkdQokCsgKJzjdUoZNZcV87TLLLiAtV3/T03bA3FrI=;
        b=sGrNj7GI9xg8SoZt+Sv+gPa2u+WvNhnkes4yHbfYHRySq2XR2US1TwdjCWTGb3Tia3
         hV0ITjmdBPid/RzQK5X2n6Kp7JpDmFlq9b16WAP3tVOqBR7da0YUZG22A+iLKgeBdJrW
         n02HB+FBIi8KDwKMGoT4mdm7AmdNaLPL+pd2Q8H4OkpcKtcWMNnD4yrZ7kBYG1C1lXqr
         HzVvVWbutAyT5ppL4RCabPqWnR6Yfy0ZeCFw+sDPIaVmZkAOH+VjYhTzl7jCxOnnnG6w
         eWpGMmKUp+e5a7XGIOwcVKTMQma5MLcheyx/uBWyisjTjTywfisEj7rJuEgteWoDGfpE
         LVsQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958767; x=1789563567; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        b=MIIflCE4hNV5fq9WL50YIHQG/bHxMdbnsE4ugNJV/BjyDOvGL5//oF1QQFgcQWNEXZ
         ZDzpnELpIRlnIqlrqWLhXLatTVBXA22QTXEx6koUmQv8jpLr/QA7ldSLdwBYOkolrRke
         bsBJzpZGUrLasCgwAdne5OXzpayRpstqCBaa+JxB7IXvBBmPhfyaMHN+9h0khYzBjmuw
         DKVG8r606xNPKPw8x475Rqh7H3wJupsrZi6ZyJPLuyTVU9JQo4ejtNwMeKn4GFWgSQkb
         lChNQ++fZvJ2wDnBy5d19n7VTpDRkkV1+zBDxwIF2IEty1+pm89h9GmQBDVBD3kyIxnn
         roAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958767; x=1789563567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        b=r2xl8rnI/cWpffkISl6dKhsEScrDVay/6YNfqDsrRBD3L5vN69qGd8hoLNr8Ep90/4
         1xqy9BsDGg22HXY5xa5YVVAvH0jXdasu86HFxhLi/V8zMAZOVRYpxkbjY6HjUYLIT82M
         AhCXSwZPAHdXAcFrU8+ZEcuV6wvGHEt0mZ7TLF6xbcvaatx4/gshJODCwfOlawx+8lp4
         YSaxfJAA1fQFHO8QQ6WZ89Yh4g2IiKW+pKC+BCxakov2EZC7MfJeyaRKxIS/aHu6153H
         pvPBMFks81SYLJ41e7RayMB/u/hwONs3ha4yBYk9i397eomJo5CibgbOS3gJFDyFZG6G
         dWKg==
X-Forwarded-Encrypted: i=1; AKwUvBxV/VnLCX6w6o+06l1KkjYysZLg5hJ/gPVU4JG3R2JFpkrXvdQdJKQ9vcEHk9yS7Y72RuEjMnJZaQYYGA==@lists.infradead.org
X-Gm-Message-State: AFuF++kDnY4KZ+jgFPAGwZiw+ZoKTvWRsiOOpZudAFmN/0fDA4xwJZRv
	FaU5kftOFUzMXvGhPB2DQ7J9WlVo34WdHNDK+GgP1VxFhhaB2yedOGcVM1CNt3SxQNnAphlbJ+g
	6pDh4TNgQY8YgIQ69Ln8YlnHp9EZDkvo=
X-Gm-Gg: AYBFou2KKBaR9nM3L9wiEh0iQRSK3N9q8HXDMOjV0eW4ZXuJXeSs7bgnKcRzShjicbC
	I757pHhbxbsVTo08WpFs347NQbD+AUq6rPfqB+uKVsMn87h6UBslZUF9it8DCUqZYhEtgzRhJU+
	75juzP4oYDVWo4hFBzU6hON0/kw+duj9rS/GbhqZe9PlxzXWl2Ze2QseVPc0kqsDTsQNbH3G3ZP
	b0mdLjhuosF50yvLZ3v9gnS9oMwGM3Agf73/RdD9OgkcznF68H72O1VExutgwIzJMMoEJyStX3C
	TM2+vckPRCYFQbz8wSSgOxmD0IspUOBzDfcj2ARwj3O0X/WOe51SS1LqAFvdyOa8Saam0iKz5ya
	m2Gp1BNArRE1MQ3w1tv2ZOFYBL+q7KFX/6JGp8I/6SC0HVz7XUo4yYkmbToDQdG8AUGTdiAw9Hs
	LgK2fITDZWPD4LHVGq7/fa+H7LhZCZgussU82QC303nk1ItURnYro=
X-Received: by 2002:a17:90b:2888:b0:398:cee0:67dc with SMTP id
 98e67ed59e1d1-39b2699849cmr33697284a91.5.1788958766896; Wed, 09 Sep 2026
 05:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org> <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
In-Reply-To: <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 14:59:13 +0200
X-Gm-Features: AcwNN1Vwugoxsn23N3HKo79fRO4c4hCKpdWpUEii2k3VTwCoJF2DILgisLp6T0w
Message-ID: <CANiq72=rUrjFD8dHggtO5g0D5Yu-LjO4s7t=+yoKtteD56KfXw@mail.gmail.com>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
To: =?UTF-8?B?QmrDtnJuIEJhcm9u?= <bjorn3_gh@protonmail.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_055927_940922_D73C90BE 
X-CRM114-Status: GOOD (  17.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgOSwgMjAyNiBhdCAxMjoyMuKAr1BNIEJqw7ZybiBCYXJvbiA8Ympvcm4zX2do
QHByb3Rvbm1haWwuY29tPiB3cm90ZToKPgo+IFRoZXJlIGFyZSBzdGlsbCBzZXZlcmFsIGtub3du
IHJlcHJvZHVjaWJpbGl0eSBpc3N1ZXMgZm9yIHRoZSBwYXJhbGxlbAo+IGZyb250ZW5kWzFdIGFu
ZCBhdCBsZWFzdCB1bnRpbCBmYWlybHkgcmVjZW50bHkgdGhlcmUgd2VyZSBhbHNvIGRlYWRsb2Nr
Cj4gaXNzdWVzIGFuZCBpbmNvcnJlY3QgZXJyb3JzWzJdLCBzbyBJIHdvdWxkIG5vdCByZWNvbW1l
bmQgZW5hYmxpbmcgaXQgd2l0aG91dAo+IGFuIGV4cGxpY2l0IHJlcXVlc3QgZnJvbSB0aGUgdXNl
ci4gUGVyaGFwcyBldmVuIG9ubHkgYWxsb3cgaXQgb24gbmlnaHRseQo+IHJ1c3RjIGZvciBub3cs
IHRoZW4geW91IGRvbid0IG5lZWQgdG8gY2hlY2sgd2hpY2ggb2YgdGhlIHR3byBzcGVsbGluZ3Mg
b2YKPiB0aGUgZmxhZyBpcyBzdXBwb3J0ZWQuCgpUaGFua3MgYSBsb3QgZm9yIHRha2luZyBhIGxv
b2sgQmrDtnJuLgoKSWYgdGhlcmUgYXJlIHN0aWxsIG1ham9yIGlzc3VlcyBldmVuIGluIG5pZ2h0
bHksIHRoZW4gSSB3b3VsZCBzYXkKbGV0J3Mgbm90IGFkZCBpdCB5ZXQgLS0gc29tZSB1c2Vycy9D
SXMgYXJlIHRlc3Rpbmcgd2l0aCBuaWdodGx5CnJvdXRpbmVseSwgc28gaXQgaXMgcHJvYmFibHkg
YmVzdCB0byBhdm9pZCBzdXJwcmlzZXMgZm9yIHRoZW0uIChJZgpzb21lb25lIHdhbnRzIHRvIHRl
c3QgdGhlIGZsYWcsIHRoZXkgY2FuIHN0aWxsIHBhc3MgaXQgbWFudWFsbHkuKQoKT24gdGhlIG90
aGVyIGhhbmQsIGlmIHRoZXJlIGFyZSBubyBtYWpvciBpc3N1ZXMgbGVmdCBhbmQgaXQgaXMganVz
dApyZXByb2R1Y2liaWxpdHkgaXNzdWVzLCB0aGVuIEkgZ3Vlc3Mgd2UgY291bGQgYWRkIGl0IHRv
IGhlbHAgZmlndXJlCnRob3NlIGlzc3VlcyBvdXQgYW5kIGF2b2lkIHN1cnByaXNlcyBsYXRlciBv
bi4KCj4gQnkgdGhlIHdheSwgY3VycmVudGx5IGJhY2tlbmQgcGFyYWxsZWxpc20gaXMgZW50aXJl
bHkgZGlzYWJsZWQgZHVlIHRvIHRoZQo+IHVzYWdlIG9mIC0tZW1pdCBvYmogKHdoaWNoIGZvcmNl
cyAtQ2NvZGVnZW4tdW5pdHM9MSkuIEZvciAtTzIvMyBidWlsZHMKClllYWgsIHdlIGV2ZW4gc2V0
IGAtQ2NvZGVnZW4tdW5pdHM9MWAgZXhwbGljaXRseSBhdCB0aGUgbW9tZW50LCBzbyB3ZQp3b3Vs
ZCBuZWVkIHRvIGNoYW5nZSB0aGF0IHRvbyAoYW5kIGxpa2VseSBtYWtlIGl0IGFuIG9wdGlvbiwg
YmVjYXVzZQpub3JtYWxseSBlbmQgdXNlcnMgd2lsbCB3YW50IHRoZSBiZXN0IHJlc3VsdHMsIHdo
aWxlIGRldmVsb3BlcnMgbWF5CndhbnQgc3BlZWQgb2YgaXRlcmF0aW9uKS4KCkNoZWVycywKTWln
dWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
