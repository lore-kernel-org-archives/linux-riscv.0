Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51201D1D46C
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XK2Yl4trd93CCuOzkbVzLZjxEt3ZKECY5UnhPDzl/s=; b=ovUjwGjZYEb4Vw
	XPDcN85iAaoH5Hy42y2iuvDSFM1EWybN0sp1eZf8oA1HnrYC4pYmzn0yjgZBDIO/ycNljnsnrKLUX
	uoM8HdhlOO0OE8h0jbI8zXclJSgvekyMlt02IibMtBa/sLKz4Rr0XWcKCOacqO8EgCsQl+U9xyGMa
	T1LxtYFEiUqXEELT+Dxt32FXYxpe3yDLXLcvSB27daJPl0Hn49Q0cxaZbf4e+T1dlGsTYn5VFgfVi
	gPHFwzdlqJMJlId+xJsIR8j5UFmwKN3TIGmojnXWt20mOyyT1sv/T1381MM2dBexdoUKfRo7sLSbE
	+fkq7mVCiOdIoQS90nDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrey-0000000HTMm-2u0Y;
	Thu, 08 Jan 2026 15:10:48 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrev-0000000HTLr-1rrj
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 15:10:48 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-640e065991dso3022298d50.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 07:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1767885044; x=1768489844; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTkbey9LWC4b27P/G+EnN+lFuImbI+lYFoSxJEGXtiI=;
        b=VSY3Eegdgf5l9+9s4hsJTKyX5JTYO5SFZNv8fc7Ys/IjKJXtjUChlEyQmfGtmP/Fmx
         coDSTUOzC6HoBl2mN/O5NPY6x5EHAM3ikzQoXKFF6O6P6l/zbhhNk6DeTSmYfzI5tWfl
         7Ex7l99cxgMhF5Nn0YW0k9cX64g+0CSux/Q8uUWO4sh3tEVKA2LN7DOek2xcOEi2oLwd
         Tm+O9IXSURng1AEWEejSEJGe03o4+Tdh4I+CO8FjYIjARhUUnr6G78TSIKZ92jWy8aB6
         v2Dq8DC71s07ZBCA3ZiYP4JHtgqgJ6CJ+dNIJkf+U5mSa0ZyPp6b3uSx/V60B5l0/H7a
         tSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885044; x=1768489844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QTkbey9LWC4b27P/G+EnN+lFuImbI+lYFoSxJEGXtiI=;
        b=WxgDkIw4seWl9zwUs/eUppXJZZie/POOsX/Ul7UgPQMbAK32turmpzT/gNBrpgvHcj
         NrOlAsNNa9RPMCqogh1y3NVzMHLgRgd8vOf7H0GYw4Ov560PmZhn9L5Pi9PdL7AON7vR
         sVh/LDn7NJR0oxdrzzEHdIjOw0pZp8DhXc9ciOUGoMII7hgeSuMoRnu7KmkU78QijitW
         idxkGd57ExmMfoUipq34guI27Om3Xi/vGFbUV2gHBZwTmfKcpEE3mnYoSATSBUN6ECx8
         JKOu3317HfoiV95jPfAh8sEZL69NmZ/NXkeP02PlRPKXmjORhU+nv0xM+eG1fR8mZlUA
         j7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVwjJeoRZqvpPW5VKYdvXEIb48CIacyY7WQfoIkC6NteMaTxMErRDiSqQE++t/Kf/99mJbiC6z29iiZ4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YySnLtiV9gFEVf9DiXuED1nh6VhpR+WJb2dar6gEPizGVHxC0BZ
	kjpxhW19Qz/3CL+6wRhfWn+Ae3dtR/4qqLAeizdfQl2vzXUQWG/z8tWao4BgQUqH5+zk+80V9C+
	aZ4tZ1JEsNXnqA2+0DM8xuIHAGoXw3H1nufRsoXZA5A==
X-Gm-Gg: AY/fxX5LhiZJCjYzjS96c8R2QRo7mo7i4VrdV3uL6dbDGrZaECgdv0Z6iioNDjGKGSv
	+l8dQzRQrKe8MVtC5OYFBN4JgeUaiPHnLnab6D6CIj5l3ocPBOIam25/rpa7kxPpQzYQ4gxpsbz
	lX0mPxYSgdQmpqqRjkWfXsVsM3HvdIKtbxvcDNh/QchI3l7isZ34jMzR7pGsF7DZlFL9RsINxWW
	yJo1iqyOPPuQ7/3KRwZR7j0Pi0LkZzJ/hlFRkuYxyzvedfp/RIjMHaAcQzWEeuSiEEnOg==
X-Google-Smtp-Source: AGHT+IHwlV11mJiZRvrc0ba9gyUKkJLs3Ivv5ZO/Sp66Caj6iICdWSs+vjcbtX7JeT7w+lz4Sr6DicIt8PKx9jaUzQk=
X-Received: by 2002:a05:690e:b88:b0:644:6ad4:fdfd with SMTP id
 956f58d0204a3-64716c14086mr5723963d50.71.1767885043558; Thu, 08 Jan 2026
 07:10:43 -0800 (PST)
MIME-Version: 1.0
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
 <e052745b-6bf0-c2a3-21b2-5ecd8b04ec70@kernel.org> <aTxf7IGlkGLgHgI2@debug.ba.rivosinc.com>
In-Reply-To: <aTxf7IGlkGLgHgI2@debug.ba.rivosinc.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 8 Jan 2026 07:10:32 -0800
X-Gm-Features: AQt7F2r-MFLse9aM2Y-9SmWOvFLm93MsLbBkGvYnQc0D6QLcC_Q6_utP6Kihh0s
Message-ID: <CAKC1njQ-hS+kUJ0C_v0oqZW1EZw2zAXMp-SnnA-ZXh_H-SoVdQ@mail.gmail.com>
Subject: Re: [PATCH v26 00/28] riscv control-flow integrity for usermode
To: Paul Walmsley <pjw@kernel.org>
Cc: x86@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, 
	Andy Chiu <andybnac@gmail.com>, kito.cheng@sifive.com, charlie@rivosinc.com, 
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
	Zong Li <zong.li@sifive.com>, Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
	Valentin Haudiquet <valentin.haudiquet@canonical.com>, Charles Mirabile <cmirabil@redhat.com>, 
	Jesse Huang <jesse.huang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_071045_602322_CF957937 
X-CRM114-Status: GOOD (  26.27  )
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

SGkgUGF1bCwKCkkgaGF2ZSBhIGJ1Z2ZpeCBmb3IgYSBidWcgcmVwb3J0ZWQgYnkgSmVzc2UgSHVh
bmcgKHRoYW5rcyBKZXNzZSkgaW4gcmlzY3YKaW1wbGVtZW50YXRpb24gb2YgYG1hcF9zaGFkb3df
c3RhY2tgLgoKU2hvdWxkIEkgc2VuZCBhIG5ldyBzZXJpZXMgb3Igb25seSB0aGUgYnVnZml4LXBh
dGNoIGZvciBpbXBsZW1lbnRhdGlvbgpvZiBgbWFwX3NoYWRvd19zdGFja2AKCkxldCBtZSBrbm93
LiBUaGFua3MuCgotRGVlcGFrCgotRGVlcGFrCgoKCk9uIEZyaSwgRGVjIDEyLCAyMDI1IGF0IDEw
OjMz4oCvQU0gRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24g
RnJpLCBEZWMgMTIsIDIwMjUgYXQgMDE6MzA6MjlBTSAtMDcwMCwgUGF1bCBXYWxtc2xleSB3cm90
ZToKPiA+T24gVGh1LCAxMSBEZWMgMjAyNSwgRGVlcGFrIEd1cHRhIHZpYSBCNCBSZWxheSB3cm90
ZToKPiA+Cj4gPj4gdjI2OiBDT05GSUdfUklTQ1ZfVVNFUl9DRkkgZGVwZW5kcyBvbiBDT05GSUdf
TU1VIChkZXBlbmRlbmN5IG9mIHNoYWRvdyBzdGFjawo+ID4+IG9uIE1NVSkuIFVzZWQgYjQgdG8g
cGljayB0YWdzLCBhcHBhcmFudGx5IGl0IG1lc3NlZCB1cCBzb21lIHRhZyBwaWNrcy4gRml4aW5n
IGl0Cj4gPgo+ID5EZWVwYWs6IEknbSBub3cgKGF0IGxlYXN0KSB0aGUgdGhpcmQgcGVyc29uIHRv
IHRlbGwgeW91IHRvIHN0b3AgcmVzZW5kaW5nCj4gPnRoaXMgZW50aXJlIHNlcmllcyBvdmVyIGFu
ZCBvdmVyIGFnYWluLgo+Cj4gVG8gYmUgdmVyeSBob25lc3QgSSBhbHNvIGZlZWwgdmVyeSBiYWQg
ZG9pbmcgYW5kIERPU2luZyB0aGUgbGlzdHMuIFNvcnJ5IHRvIHlvdQo+IGFuZCBldmVyeW9uZSBl
bHNlLgo+Cj4gQnV0IEkgaGF2ZSBiZWVuIHNpdHRpbmcgb24gdGhpcyBwYXRjaCBzZXJpZXMgZm9y
IGxhc3QgMy00IG1lcmdlIHdpbmRvd3Mgd2l0aAo+IHBhdGNoZXMgYmVpbmcgZXhhY3RseSBzYW1l
L3NpbWlsYXIuIFNvIEkgaGF2ZSBiZWVuIGEgbGl0dGxlIG1vcmUgdGhhbiBkZXNwZXJhdGUKPiB0
byBnZXQgaXQgaW4uCj4KPiBJIHJlYWxseSBoYXZlbid0IGhhZCBhbnkgbWVhbmluZ2Z1bCBmZWVk
YmFjayBvbiBwYXRjaCBzZXJpZXMgZXhjZXB0IHN0YWxsaW5nCj4ganVzdCBiZWZvcmUgZWFjaCBt
ZXJnZSB3aW5kb3cgZm9yIHJlYXNvbnMgd2hpY2ggcmVhbGx5IHNob3VsZG4ndCBzdGFsbCBpdHMK
PiBtZXJnZS4gU3VyZSB0aGF0J3MgdGhlIG5hdHVyZSBvZiBvcGVuIHNvdXJjZSBkZXZlbG9wbWVu
dCBhbmQgaXQncyBtYWludGFpbmVyJ3MKPiBjYWxsIGF0IHRoZSBlbmQgb2YgdGhlIGRheS4gQW5k
IEkgYW0gbmV3IHRvIHRoaXMuIEknbGwgaW1wcm92ZS4KPgo+ID4KPiA+Rmlyc3QsIGEgbW9kaWZp
ZWQgdmVyc2lvbiBvZiB0aGUgQ0ZJIHYyMyBzZXJpZXMgd2FzIEFMUkVBRFkgU0lUVElORyBJTgo+
ID5MSU5VWC1ORVhULiAgU28gdGhlcmUncyBubyByZWFzb24geW91IHNob3VsZCBiZSByZXNlbmRp
bmcgdGhlIGVudGlyZQo+ID5zZXJpZXMsIFVOTEVTUyB5b3VyIGludGVudGlvbiBmb3IgbWUgaXMg
dG8gZHJvcCB0aGUgZW50aXJlIGV4aXN0aW5nIHNlcmllcwo+ID5hbmQgd2FpdCBmb3IgYW5vdGhl
ciBtZXJnZSB3aW5kb3cuCj4gPgo+ID5TZWNvbmQ6IHdoZW4gc29tZW9uZSBhc2tzIHlvdSBxdWVz
dGlvbnMgYWJvdXQgYW4gaW5kaXZpZHVhbCBwYXRjaCwgYW5kIHlvdQo+ID53YW50IHRvIGFuc3dl
ciB0aG9zZSBxdWVzdGlvbnMsIGl0J3MgTk9UIEdPT0QgZm9yIHlvdSB0byByZXNlbmQgdGhlIGVu
dGlyZQo+ID4yOCBzZXJpZXMgYXMgdGhlIHJlc3BvbnNlISAgWW91IGFyZSBERE9TaW5nIGEgYnVu
Y2ggb2YgbGlzdHMgYW5kIEUtbWFpbAo+ID5pbmJveGVzLiAgSnVzdCBhbnN3ZXIgdGhlIHF1ZXN0
aW9uIGluIGEgc2luZ2xlIEUtbWFpbC4gIElmIHlvdSB3YW50IHRvCj4gPnVwZGF0ZSBhIHNpbmds
ZSBwYXRjaCwganVzdCBzZW5kIHRoYXQgb25lIHBhdGNoLgo+Cj4gTm90ZWQuIEkgd2Fzbid0IHN1
cmUgYWJvdXQgaXQuIEknbGwgZXhwbGljaXRseSBhc2sgbmV4dCB0aW1lIGlmIHlvdSB3YW50IG1l
IHRvCj4gc2VuZCBhbm90aGVyIG9uZS4KPgo+ID4KPiA+SWYgeW91IGRvbid0IHN0YXJ0IHBheWlu
ZyBhdHRlbnRpb24gdG8gdGhlc2UgcnVsZXMgdGhlbiBwZW9wbGUgYXJlIGdvaW5nCj4gPnRvIHN0
YXJ0IGlnbm9yaW5nIHlvdSAtLSBhdCBiZXN0ISAtLSBhbmQgaXQncyBnb2luZyB0byBnaXZlIHRo
ZSBlbnRpcmUKPiA+Y29tbXVuaXR5IGEgYmFkIHJlcHV0YXRpb24uCj4KPiBFdmVuIGJlZm9yZSB0
aGlzLCB0aGlzIHBhdGNoIHNlcmllcyBoYXMgYmVlbiBpZ25vcmVkIGxhcmdlbHkuIEkgZG9uJ3Qg
a25vdwo+IGhvdyB0byBnZXQgYXR0ZW50aW9uLiBBbGwgSSB3YW50ZWQgd2FzIGVpdGhlciBmZWVk
YmFjayBvciBnZXQgaXQgaW4uIEFuZCBhcyBJCj4gc2FpZCBJJ3ZlIGJlZW4gZGVzcGFyYXRlIHRv
IGdldCBpdCBpbi4gQWxzbyBhcyBJIHNhaWQsIEknbGwgaW1wcm92ZS4KPgo+ID4KPiA+UGxlYXNl
IGFja25vd2xlZGdlIHRoYXQgeW91IHVuZGVyc3RhbmQgdGhpcywKPgo+IEFDS2VkLgo+Cj4gPgo+
ID4KPiA+LSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
