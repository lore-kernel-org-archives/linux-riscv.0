Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B494C79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 22:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVtiaRysAGxYv8RLJ2DAgl/rnM0nwnpqKr3S6wFcDTY=; b=YUKlY0BhLfGN8N
	Lo+m6a+gsLPqZ/HJs+dwvNoqa+Y48yEBc3P4xE+YEnBpINFN4zUgZP4a3ROqtoazi4y318kU7Z9el
	Efu7Q9RFlAmwouzW7PzT1XkHA5pWhAkcIg9eaDTu8Iy1vt1hLLc4FzE+3jtferJ4EX0LmpNy2EhVz
	OnfLX3eFknQMGMEQGoDkSpT344xSnFu9uuYozrYi/6bpoV7F+UkBL2ti6nMo6iUxjNUk5HCY2LQ+E
	8uz/KG3Jknl8TESkY7jsoVIvcJCxpzJQKUsdwl6iB5mwEbAx3EvYyW42uKjIxtKkYvOQ0IchGTYDq
	V0lR9zBNURJif3Cs/Ajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QTv-0000000CzMY-4Bhi;
	Wed, 09 Sep 2026 22:09:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QTt-0000000CzLe-3nGL
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 22:09:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4957eefd361so50577055e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 15:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788991763; cv=none;
        d=google.com; s=arc-20260327;
        b=IoxRTe36xAZJygcpEXWlfV33KIOGoifCBX71NuQsYHXmDXqi36gFoCgPPqqw6llt+6
         rfN/YYmawN3WmO1HmCVIgnJGxdl8wkDROglGgNYrktXCJ31kcuiYaDEIl3Y7v3UXgDxr
         0xupQvZqvSVKc44VB2l2F7KH0AVopRQ7Fvsm88XL8Io3feDYl1mwicV3Vu7hBQ4m4OMR
         HDK2i8mJ/PNuQOgxLZII9qdvkBGC+iW2G3AYxZLLNVtHmpOEDDxfZ1ed9cbYrg/2RxZn
         ELzIMIRiimVclW/cT9RWumkCd0Wfwal3HuDEJ3AXIJoB2wMGWSgLNA9gh7idJjp3GWS7
         Njow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        fh=OcyIQsjgpMI0XPD5jPTT/t22Yjb4N/uTNatmEHr8Ij8=;
        b=PmmLcOq2cCP2j2FHMo22bbG5xD6iKWbWJpYLvhxQwPT2VdrtfjiCABDIzZnapaxYy8
         +aA7LHp1O1ZVKxlEXgu8akLUQQhx0gJRKFuVvEKR5WaYYimE9tdCS2xt8tLvNJKYj9U/
         Sz7+58otYXP5JPcb1iAf46g0vjJAuPC/xW+5gxQHsAQ6JXCiOyP+IkGg5tq91ixVHtPS
         5qtGKoKwoG8p9YCfsxjTJO8j/E2GCExCZPgu+kn7zC38BxXMgXd4ZDuR6i6/B0C2wGKN
         YbfRKAFVwnKNFv/SsGfYMXtlH6WQVJ+nEKo8bQbwq+Ed8IXHyZGdoWpkEC6LbC/WZy5l
         Y96w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788991763; x=1789596563; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=mkXbeKUThDxYttcCd/ZD478vjKpNN70erocWfmvrw7TgXzf9IVC+4pz9WoTbgO1xEc
         NOycQe3ieHjrW7xTgtq08imMYZYR3hdb8gUjN2BinTTJ6UK9DBlDBu8INBiMFZ4GNEL7
         D1qGvVeKoOhdn4VwsPRt03k+QXlbiO5ikF1XqFtqydZYLfsm9Rusl3fvOXswVU3t/U7S
         YeioK1DTP6HQU/mVL7qve172kkQJLZUyWjTihZA1L/8AR+C34TdWfPFynsxUALwDrhwt
         AAVP4c1kFK6C/0nyMiZRS9yaw9yhI/xbg/4kfuJWKG2aAOFHJypMarty1aujxeUjl3NY
         VOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991763; x=1789596563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=bGaB92EQGJl3VsLfDQD/jR76SJ0HUDRzVxFisRFXRKGYTMVSoBbF0Ua49yd4Kt9q4w
         Imw4IQ86/+4Csbop1u472ZKiDO2DpDRlCJ6Z4+ga/f5ICaznNocTyyO8awidsmHpeYOZ
         RuKTMDa91fz49aNanXBCesgay95xWrhlSiqJXxLcRSmBk4wXIJXb+sjg941O9fTmC3AV
         KKX0uh1ib6KJ7o+rIj7/Idz6IoFWR7xLPcTF9IMnIcxISquZduoCuiwvb36P9PpK5TuB
         LGYVwQ2tDSZe9WDZ5sWbCsEhr0sZq3ulv850OvFolGRbQn8fO7J9/DdR0R7Pg+yTVgNg
         Musw==
X-Forwarded-Encrypted: i=1; AKwUvBzk+i/Q4eMeQbndFh9gAgVhcNzdEgYlxVIJkQrZD/5MVOjYW8dHrbpZOm8reC+SKBBYLL/c94GOL24oDw==@lists.infradead.org
X-Gm-Message-State: AFuF++ncYFBwQOnLYmrzAptiXiaYZAmVeA0iC+NsgDKuonEiEIb1FTu1
	OobkgpSmhMxTSomuzbfH08e9M9ewFjVu3djX2VOdknIswYGQs7DI4QBNJGv667exABYeXBRyZMf
	TR2z/sIYRq2o9lUFQmhGRnHTo+DMrgu02CcjDKaXP
X-Gm-Gg: AYBFou2GWEGPL23UqYUBXHm1d4Spegtew3wFwZcqB3ZnvKoqQvuEJM7brEXsaxYotE5
	WeegdERCuQ02EIHMFdf7Ta4ouq8zuAVi3mqv0OWLLWpKl3QTOAhGuo7GZiQ1tb5Tif6ySjIAKrD
	VP+BD60ZDlaeHHdzk38txw38AjzgzRDZnaM4Q96uz8OrHZHU2rp4ZrXl37ZgjGwdXE7LYYMAApi
	BE86lTUEKcuM47d971nRJYwYk+0XGhejUQ+JA8Nq9Hd97Drzp1CpJcrMzIK9kHyJTtC3ZWbA9a5
	pLJe5zLcHZpdiL9+vnKisnfD5J59PqSzwn0bDUqKYqoa1UUPdz+5YCOeKrM5YT0Fl0v4dERJ6VY
	KSBQsG6nSy9sgmfsdcYmmHO3Qlts9K5tHjo70iiYaSeTlXjy5WHcryPRphJS1+t+AglkpR1w=
X-Received: by 2002:a05:600c:81c8:b0:49d:1f10:8b9f with SMTP id
 5b1f17b1804b1-49d1f109802mr74781425e9.7.1788991761946; Wed, 09 Sep 2026
 15:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com> <aqFptJRjLZIL-NX7@gremlin>
In-Reply-To: <aqFptJRjLZIL-NX7@gremlin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 9 Sep 2026 15:09:10 -0700
X-Gm-Features: AcwNN1VBBOSItlzf2aBfQ1Tsn20Bkz1vl5nUIWxayca3KAiKBTvQ_pPLoFqBSq8
Message-ID: <CAKwvOdnMuwKxPB_SXDcwmrAiwZFXWUAgcS1TdAkW+bqhYEZ=ZQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_150925_959284_B94FA9BE 
X-CRM114-Status: GOOD (  15.17  )
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

T24gV2VkLCBTZXAgOSwgMjAyNiBhdCA3OjE34oCvQU0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIFNlcCAwOCwgMjAyNiBhdCAwMjowNjox
OFBNIC0wNzAwLCBOaWNrIERlc2F1bG5pZXJzIHdyb3RlOgo+ID4gSXQgd291bGQgYmUgY29vbCBp
ZiB5b3VyIExMTSBjb3VsZCBnZW5lcmF0ZSBhbnkgdmlzdWFsaXphdGlvbnMgb2YKPiA+IHdoYXQn
cyBnb2luZyBvbiBkdXJpbmcgYSBidWlsZD8gU2VlaW5nIHdoYXQncyBzZXJpYWwgdnMgcGFyYWxs
ZWxpemVkCj4gPiBpbiBwZXJoYXBzIHVzZWZ1bC4gUGFydGljdWxhcmx5IHdoZW4geW91IGNhbiBj
b21wYXJlIHRoZSBiZWZvcmUgdnMKPiA+IGFmdGVyLgo+Cj4gR3JlYXQgaWRlYSEKPgo+IEkgYXNr
ZWQgaXQgdG8gZG8gZXhhY3RseSB0aGF0LCBhdHRhY2hlZC4gQ2FtZSBvdXQgcXVpdGUgbmljZSBh
bmQgc3VtcyBpdCB1cAo+IG5pY2VseSA6KQo+Cj4gSXQgYWxzbyBwcm92aWRlZCBhbiBBU0NJSSB2
ZXJzaW9uOgoKdW5yZWFkYWJsZSwgYnV0IHRoZSBwaWN0dXJlcyB5b3UgYXR0YWNoZWQgYXJlIHdv
cnRoIGEgdGhvdXNhbmQgd29yZHMuClBhcnRpY3VsYXJseSBleGNpdGluZyBhcmUgdGhlIHNwZWVk
IHVwcyB0byB0aGUgdXN1YWwgZWRpdCtjb21waWxlK3J1bgpsb29wLgoKRm9yIHRoZSBibHVlIGdy
YXBoICh0aGUgdG9wIG9uZSwgZmlyc3QpLCBhbnkgaWRlYSB3aGF0IHRoYXQgZGlwIGluIHRoZQpt
aWRkbGUgaXM/IFRoYXQncyBhbHdheXMgd2hhdCBhbm5veWVkIG1lLgotLSAKVGhhbmtzLAp+Tmlj
ayBEZXNhdWxuaWVycwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
