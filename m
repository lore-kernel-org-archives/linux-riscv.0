Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53802C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 21:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4zV9LU/28ICNVfUJeTJcQdrf8CTf7tPVurZg9lUhjI=; b=X9BoQORA/eZQVF
	8r9S5/Sjy9vvlz9JYqbncIwSjMzg5zb7tuS2oGS73Su8JVQSxfQKCNR065DMKs98OkIF+0837HQVT
	eeQmHY+dsvj3WAcGYKx6BH2dNKybD0FgYa9x84hltTP8OEQ0pb8qRYEHGzn5j05ouWdAZ0PG6EvRa
	5TqhONY3cd+HhSPvjyKvHwuc90ViqM8fY8h6LJJ+7lSAbI0npPfEvHT/n3PqxVDpLt2kqNgucDn3m
	7FGm6tVYN43e7v+TiOAT64JCsKj6T2TWDLgJmGAoCgHPH1RJz5cftfRK819ZyEjHfxvyNWqBakUso
	r3BaFiNjKdcotpskN4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x431W-0000000AHhd-3718;
	Tue, 08 Sep 2026 21:06:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x431U-0000000AHgu-3VOY
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 21:06:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso75462565e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2026 14:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901590; cv=none;
        d=google.com; s=arc-20260327;
        b=lb5L4Aq9RifxlhPxRqUBr+Y7I0C4X1i+Cvp6USjCXt7ly+KTgS4uevf6PzWEl961f4
         iXRhrOihG42qID5Fezs7OCzUQKvY66KiM03NgKatu928g/YnJJFT10A+UNaFwKKAWITd
         MsGglcdDZP/uOf48NJbg5jTkB+I9TeiJB9NDNWEFAkfZhfG4bc/yZLKG9noeGXrOdDxu
         V1ql8SFwreXUpiV2U9L+cYpHQ/MsixCd6C/Pc/VvJkAn9+LYISXLJi+nF4Lwz0Nu7MNU
         LUBsu734P8lFsp0BCIUb57zXSORxTvEHJwloW+w7aY16cwHDc9W2BejlJLJ7jhZVzdxJ
         UEnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        fh=y4DmF7lQfFiVs3KCE95/9r840SSpM9+8B9bXqOawzZU=;
        b=DWQUeC3ZvTjEU4cDmJM8/Z1KP228tNvFNyGg753FUCBNmsFvsGIQRd1phKulSxCC1i
         rTc+eByDzd/COw6D6+sXOt+kjLu3v96m67npDjKLBvIa5hWWepaiEPtviscugonkdGay
         UX+COjf1b+UAbMJ/TZ+e6+l1x/bgsX/+1QuyIAQEPiPnxhJwDwtMcaO81xLl7ilQCrpm
         lG0voMXDvnCnkT8NdFFQTUJppMaYMRNBawIPl57rxwNACBMItVPK/5vNZ1kkOYcZOZd4
         fPGrKJhZhk+V7vZQmYilQBv4xVr2Wd03l7Dccg1y4hS9GaayiivKXeu8HH/5mg0pj6ji
         szUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788901590; x=1789506390; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=N6T9VOjxtFmzHrBuxbMps7Apq8OLalh4p8OKPOwVrZJaIQ0VDsIOnCtOcsOxeQHhuW
         bDYvsmw4Y5j914Nwq0qs91RATupMg4dMCEP9EMgD0qDXSoEB0QSRnjymQ5DL4lRf1RmV
         j6Af30xVA0zQKODqelLtZlERaFj6PEWBpVPfA6sW+0vo8lvyliXl2IUCzSvFrw7wriN7
         MBiZWBEL1WUhkbseuygxT7bVrq6KsZ+08N9+Sx0dC2VBq0DmQ4fpYZxojfQye6ki78LD
         d4BOsarPi8TiQttzA3Ot+xLXJDNVg7nmTICt3vHZDFK06dkqOE7BliztYjE7IssE968O
         UbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901590; x=1789506390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CB3Vtp7eYFgiX1lhWfAP6WjiIrj8nFLFrnLp7SXQSY=;
        b=XvOH4jPi/m/NTln3OSxgvv5WwulDfw9gho+aFPRCVpIcSCGV22xSWDoStkDyyuboKq
         RFIotnvdsbPj3rUfiSwo+OKiFdiBziZyZXYPLRlBRkfvvotymU0q2opwx965fmuk8iIq
         bzjwPiJeEj66nk1Jvlbs3dT8jSd2x56a1hC9o/h0+rMNLT6bQsLKhzrhwxHW7U/TrimW
         36xUVhW1iho54k/zjzWJiX9x8/DHO3gdp8Z0N+BK2+Ni2AJq0sDbDPG7l/TvkVaUT47e
         1Iw4E7M5fSE9nwMJ4FkaChDPp7AnEvwk67EEBOTWFcusnqzfIGxFg1SOkQmsUU2YKfKQ
         B54A==
X-Forwarded-Encrypted: i=1; AKwUvBzqznZ9niXfHupsAcN178h3j22xNblPmhpBM7mRtKGJ0qde0Hp4aJLaG6Dw3Vm0iILZLU+UkCU76PQ1yw==@lists.infradead.org
X-Gm-Message-State: AFuF++khGP15THRL3Pla12SwE4B4QnLyQI6YQrxGPWSKKhFr4Lhu+sYT
	VogPf4cvS++YrPJ8zM0rERS7h14yQSdhgybMcWEwhFcdRRUxR+UVpgb6XG3+kwGgy5hr4MM2+yT
	Barrgcc5ekVQPATcB24POAjLTDIc9qdDOSaNKDsBC
X-Gm-Gg: AYBFou20eekxyUNt1R5f6SrjYA8TH6EJgtnokmgLZDpEXhi+Rhbxt1hHjwU7An0eAwW
	uRFspeGLXxjKJMoZ2/Din5ZEspfBXSphe8EzAbQNS1dKIGA2nzoLNb2Ch8+50cIu0zoKViNAfJM
	N9OyjbUgjU0SA5EQLXYBzD6TobZAeFUeYbcegO/ceZaYxMJL2+XvzaBmsmSwaJfYqD70p2JIw3N
	rlrhkxQy9qi6i+3Jj3jhSzao2DxKQW9C/birOiR1SnQMM8Qn/AmFfcZlfMvjSxU9UtlRIw3o9QC
	2DaTGsyKN6BTT9jLJECVA2IwevgMJ2n52OymxbfDsk47xAfPv+bpoTpX6qLClOTPwyVhpgXmAqN
	lx8nFKOAEq9naRhnto22i+sJnQ3bJn1AT+TIcOReddL7hfYlwT2WyBZmo
X-Received: by 2002:a05:600c:6091:b0:49c:eb17:cf3b with SMTP id
 5b1f17b1804b1-49cf8252497mr286154405e9.8.1788901589479; Tue, 08 Sep 2026
 14:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Sep 2026 14:06:18 -0700
X-Gm-Features: AcwNN1Vne6n6eJi0vjoX52mygVY2Bf7Bhttyek2fKXqRHQxDJ8Lg5WpFcLyZtjc
Message-ID: <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
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
X-CRM114-CacheID: sfid-20260908_140632_890242_A09BDDF3 
X-CRM114-Status: GOOD (  16.15  )
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

T24gVHVlLCBTZXAgOCwgMjAyNiBhdCAxOjU14oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBBIHR5cGljYWwga2VybmVsIGJ1aWxkIGNvbnNpc3Rz
IG9mIGEgZnJ1c3RyYXRpbmdseSBsYXJnZSBhbW91bnQgb2YgdGltZQo+IHNwZW50IHN0dWNrIGlu
IHNpbmdsZS10aHJlYWRlZCBib3R0bGVuZWNrcy4KPgo+IEl0IHR1cm5zIG91dCB0aGF0IHRoZXJl
J3MgYSBsb3Qgd2UgY2FuIGRvIGFib3V0IHRoaXMgYW5kIGRvaW5nIHNvCj4gc2lnbmlmaWNhbnRs
eSBpbXBhY3RzIGtlcm5lbCBidWlsZCB0aW1lcy4KCgo+IEZ1bmRhbWVudGFsbHkgdGhlIHNlcmll
cyBpbXByb3ZlcyBidWlsZCB0aW1lcyBieSBwYXJhbGxlbGlzaW5nCj4gc2luZ2xlLXRocmVhZGVk
IHRhc2tzIGFzIG11Y2ggYXMgcG9zc2libGUgYW5kIGltcHJvdmluZyB0aGUgZWZmaWNpZW5jeSBv
Zgo+IGNvZGUgdXNlZCBpbiB0aGUgYnVpbGQgcHJvY2Vzcy4KCkNvb2whICBJIGhhdmUgbm90IHJl
dmlld2VkIHRoaXMgcGF0Y2ggc2VyaWVzLCBidXQgYW0gc3VwcG9ydGl2ZSBvZgpzb2x2aW5nIHRo
ZSBwcm9ibGVtLCBzaW5jZSBJIGRvIHJlY2FsbCB0aGlzIGJlaW5nIGFuIGlzc3VlOwoKaS5lLiBp
dCBhbHdheXMgYW5ub3llZCBtZSB0aGF0IGRlc3BpdGUgaGF2ZSBhIDEyOCBjb3JlIG1hY2hpbmUs
IG11Y2gKb2YgdGhlIGJ1aWxkIGlzIHNlcXVlbnRpYWwhICBIYXZpbmcgYWxsIHRob3NlIGNvcmVz
IGFuZCBub3Qgc2F0dXJhdGluZwp0aGVtIGR1cmluZyBhIGJ1aWxkIHdhcyBhbHdheXMgc29tZXRo
aW5nIEkgbm90aWNlZCAodXN1YWxseSBoYXZlCnN5c3RlbSBtb25pdG9yIGFsd2F5cyBzaG93aW5n
IHN5c3RlbSBsb2FkLCBhbHdheXMpIGJ1dCBuZXZlciBoYWQgdGltZQp0byBsb29rIGludG8uCgpJ
dCB3b3VsZCBiZSBjb29sIGlmIHlvdXIgTExNIGNvdWxkIGdlbmVyYXRlIGFueSB2aXN1YWxpemF0
aW9ucyBvZgp3aGF0J3MgZ29pbmcgb24gZHVyaW5nIGEgYnVpbGQ/IFNlZWluZyB3aGF0J3Mgc2Vy
aWFsIHZzIHBhcmFsbGVsaXplZAppbiBwZXJoYXBzIHVzZWZ1bC4gUGFydGljdWxhcmx5IHdoZW4g
eW91IGNhbiBjb21wYXJlIHRoZSBiZWZvcmUgdnMKYWZ0ZXIuCi0tIApUaGFua3MsCn5OaWNrIERl
c2F1bG5pZXJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
