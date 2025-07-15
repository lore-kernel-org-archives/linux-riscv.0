Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16D6C83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 21:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYqmgKK13xzt5XYNuc3P3O5ANiZ3DufzKLJeUycZXNo=; b=PlYTRMUFQ2Zs2/
	bMfWaljKaIp/yFlevROdC/oxgSBL8OrOaMDZwGHnLnf/NPxVXPkuG1lEuF5iaxsjleBKE6jp1DCnm
	nr9/OVRePoZkM6kqIS4hl+wYtZfc/YFn4NW6D62ae0xKn4yULtJcNAuZo8+T2ZCP3BAQk5uheLHDw
	bnyweWYq9vMM05Q1Rh2DPADts88DpAL/Gch8Mec1wuNw0229E0NcbSuNSzo7OQyAhH7oMVGjDMxWu
	5MXAk8xP04Nk3wgXd9+R4iayyru7wDvlSCjfhlCby+yRLUTOTap09WducvAg2lQe7Na9Ua6iIkfMY
	R8roPaUhqYXYBGWEpf5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnHo-00000006GEt-2qYb;
	Tue, 15 Jul 2025 21:34:04 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnHl-00000006GDz-1d57
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 21:34:03 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e8bbeee8450so631563276.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 14:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752615239; x=1753220039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrtJ2tPWtnyQlcXjVKipZJ0PUZK8lOTycW08ecfRLFU=;
        b=o4zGnl+9lIna8msY+w93Cwix+rI+3mYZaiwvOWa/UHKZ/zVsNUJqB1D4Z5IP7qc06t
         JumFzo3F3vm/pmUxvl8O6gnBajv6VfHjwm1t+86RrDajDUqRJJ6n1f4WPQbT6uTo6MF/
         upeA55Mypb/3s6PSw91vh/dOXWs84ahd/X1nx+HtZneOAGodfAJ05KxlMYdWg+GopQk3
         zII0Tix7/OJBbIp12TrtatOZV/rC+TIxBCPMVMbWsrIn7wFImNk4KIceErMrVdlCYBV3
         QqrVk/KTFoDSKPJXfoFXZPyZfuRCiEItRFDcUMuvunuhgCMAkcqxwyhl2NI9u+CjR1c/
         nHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752615239; x=1753220039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrtJ2tPWtnyQlcXjVKipZJ0PUZK8lOTycW08ecfRLFU=;
        b=DWjBq/iyqDZ3G2h8/y4tBsKteN45Zci77+k87ags5f8RLnrR06P/f/Cosm6G87jCr+
         7AdxozaM5QmhIhMFgZj1qoylIP3xqcnyEzAZcircd35MX0MdnGw7GHb4MCGMExIxIIkj
         GYJ3S9ClskE70dmYl01JLCgGGdR9PdrddLwRJnKt0qtSOU8Yl8pH/IgqaVCgB6d3lgZe
         Fy6Q/DgMOur0k3I1G8vMFa7h0gpywWrnrCUlftZO69q7YBVbBpvxQ4EzepksTkTyDh5H
         ZZvLLjrceBDmHeGooxEfr5NapH4rcHjK4nXdis5yw4B+lEyNPSlgmjue4L2VLEBGFAgj
         /Y5w==
X-Forwarded-Encrypted: i=1; AJvYcCWTOOqxiM9ACd4ZAjABTDxKawqq3Ete+kMg8P6jKLF6TIsdUVRrIYQNo4XRKyb1Ws6+PVOwX1iVuD63wA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzP/qx9rOdUP38Xy4squqWP/2o6MTg7kdCQRqvP+E6OTnsm4JyH
	FGefLQqSi3NiDznRWFM187N+JanqdhQsdPdv13JUGqi4N7eWktTtZPxOn+OOaxrD5wkQxBGJgz3
	kadW2iRDBiZh0445z+RBQ/kKidu42qrurbo/TDEQz+g==
X-Gm-Gg: ASbGncttg/vc302Y6HTqB5JY8K6c4MZ/D8FtUdoRDBr5U9iKJOEjCB3zdFjBnyUvJE/
	K7su/bN167SEw1Gf6mWLwiBktSBusRyLqPQeHvmf5Q/2VrnrJOrIS+um/B3ALqWRqwe73v/fCii
	x6MYV19GOmYEY8ZzzX4NFHR/V9xKd2JvSB4jT40sCSLrD1eXRrHPesKg31IL4MuZWTpLbN6GgFX
	KsBkxpm
X-Google-Smtp-Source: AGHT+IEsY/f+Tj3u2hxiQCd69XmHGIDqZZR/UYSpflr/g5ySMTGOn/8ny5hxzQ44lrvSZqgfPjGQAPQXva81ZPiNP2c=
X-Received: by 2002:a05:690c:4884:b0:70f:9fcd:2075 with SMTP id
 00721157ae682-71836c27373mr5257327b3.3.1752615239506; Tue, 15 Jul 2025
 14:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
 <20250604-v5_user_cfi_series-v17-15-4565c2cf869f@rivosinc.com>
 <CANXhq0pRXX_OMW2g2ui-k7Z_ZT+5a8Sra8oE28nBh5B9K2L5bQ@mail.gmail.com> <CANXhq0p3MVLMsr_r0RWMti476pT0EMx61PQArjo2fUauTdpXaQ@mail.gmail.com>
In-Reply-To: <CANXhq0p3MVLMsr_r0RWMti476pT0EMx61PQArjo2fUauTdpXaQ@mail.gmail.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 15 Jul 2025 14:33:47 -0700
X-Gm-Features: Ac12FXzRTF7Dfs5zrF9r6Tx3chJ4aSIUc73QZXj0R8v3aOAPdwPOPGlfEeN5Jbw
Message-ID: <CAKC1njRNkSfb_0pUQoH0RwJQhWTsz9sdg_3o08w-NuSO5WypcA@mail.gmail.com>
Subject: Re: [PATCH v17 15/27] riscv/traps: Introduce software check exception
 and uprobe handling
To: Zong Li <zong.li@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_143401_666946_1C3D4D63 
X-CRM114-Status: GOOD (  30.18  )
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

SGkgWm9uZywKCgpPbiBUaHUsIEp1biAxOSwgMjAyNSBhdCA3OjE24oCvUE0gWm9uZyBMaSA8em9u
Zy5saUBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDE2LCAyMDI1IGF0IDM6MzHi
gK9QTSBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwg
SnVuIDUsIDIwMjUgYXQgMToxN+KAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29t
PiB3cm90ZToKPiA+ID4KPiA+ID4gemljZmlzcyAvIHppY2ZpbHAgaW50cm9kdWNlcyBhIG5ldyBl
eGNlcHRpb24gdG8gcHJpdiBpc2EgYHNvZnR3YXJlIGNoZWNrCj4gPiA+IGV4Y2VwdGlvbmAgd2l0
aCBjYXVzZSBjb2RlID0gMTguIFRoaXMgcGF0Y2ggaW1wbGVtZW50cyBzb2Z0d2FyZSBjaGVjawo+
ID4gPiBleGNlcHRpb24uCj4gPiA+Ci4uLi4uCgo+ID4gV2hlbiBhIHVzZXIgbW9kZSBDRkkgdmlv
bGF0aW9uIG9jY3VycywgdGhlIEVMUCBzdGF0ZSBzaG91bGQgYmUgMSwgYW5kCj4gPiB0aGUgc3lz
dGVtIHRyYXBzIGludG8gc3VwZXJ2aXNvciBtb2RlLiBEdXJpbmcgdGhpcyB0cmFwLCBzc3RhdHVz
LlNQRUxQCj4gPiBpcyBzZXQgdG8gMSwgYW5kIHRoZSBFTFAgc3RhdGUgaXMgcmVzZXQgdG8gMC4g
SWYgd2UgZG9u4oCZdCBjbGVhcgo+ID4gc3N0YXR1cy5TUEVMUCwgdGhlIEVMUCBzdGF0ZSB3aWxs
IGJlY29tZSAxIGFnYWluIGFmdGVyIGV4ZWN1dGluZyB0aGUKPiA+IHNyZXQgaW5zdHJ1Y3Rpb24u
IEFzIGEgcmVzdWx0LCB0aGUgc3lzdGVtIG1pZ2h0IHRyaWdnZXIgYW5vdGhlcgo+ID4gZm9yd2Fy
ZCBDRkkgdmlvbGF0aW9uIHVwb24gZXhlY3V0aW5nIHRoZSBuZXh0IGluc3RydWN0aW9uIGluIHRo
ZSB1c2VyCj4gPiBwcm9ncmFtLCB1bmxlc3MgaXQgaGFwcGVucyB0byBiZSBhIGxwYWQgaW5zdHJ1
Y3Rpb24uCj4gPgo+ID4gVGhlIHByZXZpb3VzIHBhdGNoIHdhcyB0ZXN0ZWQgb24gUUVNVSwgYnV0
IFFFTVUgZG9lcyBub3Qgc2V0IHRoZQo+ID4gc3N0YXR1cy5TUEVMUCBiaXQgdG8gMSB3aGVuIGEg
Zm9yd2FyZCBDRkkgdmlvbGF0aW9uIG9jY3Vycy4gVGhlcmVmb3JlLAo+ID4gSSBzdXNwZWN0IHRo
YXQgUUVNVSBtaWdodCBhbHNvIHJlcXVpcmUgc29tZSBmaXhlcy4KPgo+IEhpIERlZXBhaywKPiBU
aGUgaXNzdWUgd2l0aCBRRU1VIHdhcyB0aGF0IHRoZSBzdy1jaGVjayBleGNlcHRpb24gYml0IGlu
IG1lZGVsZWcKPiBjb3VsZG4ndCBiZSBzZXQuIFRoaXMgaGFzIGJlZW4gZml4ZWQgaW4gdGhlIGxh
dGVzdCBRRU1VIG1haW5saW5lLiBJCj4gaGF2ZSByZS10ZXN0ZWQgdGhlIGxhdGVzdCBRRU1VIHZl
cnNpb24sIGFuZCBpdCB3b3Jrcy4KCldoYXQgd2FzIHRoaXMgaXNzdWUsIGNhbiB5b3UgcG9pbnQg
bWUgdG8gdGhlIHBhdGNoIGluIG1haW5saW5lPwoKPgo+ID4KPiA+IFRoYW5rcwo+ID4KPiA+ID4g
Kwo+ID4gPiArICAgICAgIGlmIChpc19mY2ZpIHx8IGlzX2JjZmkpIHsKPiA+ID4gKyAgICAgICAg
ICAgICAgIGRvX3RyYXBfZXJyb3IocmVncywgU0lHU0VHViwgU0VHVl9DUEVSUiwgcmVncy0+ZXBj
LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiT29wcyAtIGNvbnRyb2wgZmxv
dyB2aW9sYXRpb24iKTsKPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gPiAr
ICAgICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gK30KPiA+
ID4gKwo+ID4gPiArLyoKPiA+ID4gKyAqIHNvZnR3YXJlIGNoZWNrIGV4Y2VwdGlvbiBpcyBkZWZp
bmVkIHdpdGggcmlzYy12IGNmaSBzcGVjLiBTb2Z0d2FyZSBjaGVjawo+ID4gPiArICogZXhjZXB0
aW9uIGlzIHJhaXNlZCB3aGVuOi0KPiA+ID4gKyAqIGEpIEFuIGluZGlyZWN0IGJyYW5jaCBkb2Vz
bid0IGxhbmQgb24gNCBieXRlIGFsaWduZWQgUEMgb3IgYGxwYWRgCj4gPiA+ICsgKiAgICBpbnN0
cnVjdGlvbiBvciBgbGFiZWxgIHZhbHVlIHByb2dyYW1tZWQgaW4gYGxwYWRgIGluc3RyIGRvZXNu
J3QKPiA+ID4gKyAqICAgIG1hdGNoIHdpdGggdmFsdWUgc2V0dXAgaW4gYHg3YC4gcmVwb3J0ZWQg
Y29kZSBpbiBgeHR2YWxgIGlzIDIuCj4gPiA+ICsgKiBiKSBgc3Nwb3BjaGtgIGluc3RydWN0aW9u
IGZpbmRzIGEgbWlzbWF0Y2ggYmV0d2VlbiB0b3Agb2Ygc2hhZG93IHN0YWNrIChzc3ApCj4gPiA+
ICsgKiAgICBhbmQgeDEveDUuIHJlcG9ydGVkIGNvZGUgaW4gYHh0dmFsYCBpcyAzLgo+ID4gPiAr
ICovCj4gPiA+ICthc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3Ry
YXBfc29mdHdhcmVfY2hlY2soc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiA+ICt7Cj4gPiA+ICsg
ICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+ID4gPiArICAgICAgICAgICAgICAgaXJxZW50
cnlfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncyk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAg
ICAgIC8qIG5vdCBhIGNmaSB2aW9sYXRpb24sIHRoZW4gbWVyZ2UgaW50byBmbG93IG9mIHVua25v
d24gdHJhcCBoYW5kbGVyICovCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIWhhbmRsZV91c2Vy
X2NmaV92aW9sYXRpb24ocmVncykpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRvX3Ry
YXBfdW5rbm93bihyZWdzKTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAgaXJxZW50cnlf
ZXhpdF90b191c2VyX21vZGUocmVncyk7Cj4gPiA+ICsgICAgICAgfSBlbHNlIHsKPiA+ID4gKyAg
ICAgICAgICAgICAgIC8qIHN3IGNoZWNrIGV4Y2VwdGlvbiBjb21pbmcgZnJvbSBrZXJuZWwgaXMg
YSBidWcgaW4ga2VybmVsICovCj4gPiA+ICsgICAgICAgICAgICAgICBkaWUocmVncywgIktlcm5l
bCBCVUciKTsKPiA+ID4gKyAgICAgICB9Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gICNpZmRlZiBD
T05GSUdfTU1VCj4gPiA+ICBhc21saW5rYWdlIF9fdmlzaWJsZSBub2luc3RyIHZvaWQgZG9fcGFn
ZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gIHsKPiA+ID4KPiA+ID4gLS0KPiA+
ID4gMi40My4wCj4gPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
