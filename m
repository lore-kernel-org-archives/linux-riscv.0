Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B8FCAC5A7
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 12:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0mWy+IOd23EEqIUXTFq71oxwpmeVJztD9l7GICxk54=; b=lz9ywNHwPSBZhk
	lO3l6HXRwqoXZ/WrayDgIHR8uVfKsJFH37m7o282zBWhjutjFoSsIOf+Is5s1fEeuZtPELIZ1r3Hp
	9NLbyiHKypROQ8aW7ftIydBJTMtb8V67IyOFjEW8ZAlqNONSoNwE5u9ICa2y8USN9GNbSX18KMH7x
	EHbIEyUiTP0dWB8twCKaVWNvRfkI0tnXFm22kZT2wo74s6XkfyINdedADouUpxDtwJDno/ezzYw/C
	dDLquCU6Ve/wKPxXG37saXkvP7JKGH0hA0JEXlNitZTJaImPAIMyyyrk0go2CuzRuZ+gNCtEZP8Qg
	Ou2Ykg02fp9aah471xbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1l7A-00000008z0a-2FFG;
	Thu, 25 Sep 2025 12:30:24 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1l78-00000008yzZ-3dJy
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 12:30:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so1165422a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 05:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758803420; x=1759408220; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpogRHSrLfl51nWywJppLMZXYXi2KQs1G3uCf0+H8cQ=;
        b=bFqIF0WLsxsDI720TOy8gH07Xdi18zJCFyX5+PbpwglMHsUJ8TGUgYm0yTICe3ju3b
         Mk95VUPPbP6jrJNuRR6eklxC48l/142yQ0hxTwbQuzqFMxyHbQgGFKP1R26JdRlevYWw
         j51ivYxvC67t5tZcI57gQodX8fFm72eujWvt5lHFyJRqUIkLOBRnEvC08CtpkMdOf2zo
         yOyKOO6WOUJldyxR5WQSFh1aOM/NqzIn7ukR3B6qGmyXm89EkAw4P+FZA7La2YWy8uop
         RxdbUKfat7DkM3X5zIKFFpFwegVh3fQv338uyaQ1DXki3ok2IhEjQSwSQHXLbuhMwnJS
         kVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758803420; x=1759408220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpogRHSrLfl51nWywJppLMZXYXi2KQs1G3uCf0+H8cQ=;
        b=WizWYYDSEkfwkL+1XyaAKGsblGcn1IjBK4cnsAp6kfHyXnd+k9pZIc9W6so3abVl2O
         IT8jPTZcpYjsN8l0909gSrnrK5RuCx93xJtADXsGWR2cg8XWxRHuvp/jOeP2dw5yk3i9
         ICXzzfUhVCg+N0C1LsMsfFZGqxyHWs76AzJ7VwW9fYhSB+sOLzjkYJf+Ta49eWiMirdc
         oujzf3iA+C9W+Hij+jztRcTtVR352egL/ms6bAC+bCFhjlzpcvGpxLzJ0hrFg4fkZrJs
         2tGBL1qej8WMwJ5reIK81bFuXM6SmMkKGggzQWmaJt7lzE/UpB24GrGcJItCmNe+3PhM
         1ZfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAcYBNdPYSvttP7iOXUZsPxA6mfSUpkB/HUO8tEq51N2SZm3Q1YImjXIfU6/dI8/92U0EotB8i6eYUzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjN8IymnJLcImqaj0+HwXbWkg9oHFgC8jkIEWoIV02Zdj+qH/b
	xa0JNSO50IRDveEGChAa0/GvzkK5G/ayrXrNl8SoLYw/VtcRgkSHgacOig62f1fSTybQEuO2Zi7
	3YPycX4gI4HrlfxzMajEY4E8dYc0Hpy4=
X-Gm-Gg: ASbGnctqx/koKr6nUrcp/UmwZIhmdal66YVPfN3TbgvFESYdmeeYR2OCBBEbuN1SETN
	5Ebt+r6NVpLRMvDNIYdWhc004Um6l97t8jl9GECFJe3dVr1ZFBhxxLDxDo6LQvcL6OpmHc8a3EL
	yqZ5Z57dvx7MoilREOPQ4rfUiYbgQFhKYL4U65zJU0/IaG39rq0+g7SoblDzCfk1BySzmexfbpl
	S5j
X-Google-Smtp-Source: AGHT+IGrMTtF3rO6PyqglimJ6kWsoCOnyf9RbZPnOG2/Nl32fMXOunJIE5E6zYa1d9+08xohVhzghLhulRn9g+pvf4U=
X-Received: by 2002:a17:907:3f87:b0:b09:2331:f150 with SMTP id
 a640c23a62f3a-b34b84aba85mr396036566b.16.1758803420120; Thu, 25 Sep 2025
 05:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
 <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org> <aNQ7D6_ZYMhCdkmL@debug.ba.rivosinc.com>
In-Reply-To: <aNQ7D6_ZYMhCdkmL@debug.ba.rivosinc.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Thu, 25 Sep 2025 07:30:08 -0500
X-Gm-Features: AS18NWByhWo0dHTSYL4t2oFRcok3gmrZ-pBxSOOqriMBIQLUznFC4iXNOpyJQRE
Message-ID: <CAFTtA3Nxq0UmXcuN7jmQOiuTbrenKbR4ihH027ya1WWybgLq4Q@mail.gmail.com>
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, kito.cheng@sifive.com, 
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com, 
	cleger@rivosinc.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
	broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>, 
	David Hildenbrand <david@redhat.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Florian Weimer <fweimer@redhat.com>, bharrington@redhat.com, 
	Aurelien Jarno <aurel32@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_053022_950948_F6FA6673 
X-CRM114-Status: GOOD (  53.64  )
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

SGkgRGVlcGFrLAoKT24gV2VkLCBTZXAgMjQsIDIwMjUgYXQgMTo0MOKAr1BNIERlZXBhayBHdXB0
YSA8ZGVidWdAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgU2VwIDI0LCAyMDI1IGF0
IDA4OjM2OjExQU0gLTA2MDAsIFBhdWwgV2FsbXNsZXkgd3JvdGU6Cj4gPkhpLAo+ID4KPiA+T24g
VGh1LCAzMSBKdWwgMjAyNSwgRGVlcGFrIEd1cHRhIHdyb3RlOgo+ID4KPiA+WyAuLi4gXQo+ID4K
PiA+PiB2RFNPIHJlbGF0ZWQgT3BlbnMgKGluIHRoZSBmbHV4KQo+ID4+ID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQo+ID4+Cj4gPj4gSSBhbSBsaXN0aW5nIHRoZXNlIG9wZW5zIGZv
ciBsYXlpbmcgb3V0IHBsYW4gYW5kIHdoYXQgdG8gZXhwZWN0IGluIGZ1dHVyZQo+ID4+IHBhdGNo
IHNldHMuIEFuZCBvZiBjb3Vyc2UgZm9yIHRoZSBzYWtlIG9mIGRpc2N1c3Npb24uCj4gPj4KPiA+
Cj4gPlsgLi4uIF0KPiA+Cj4gPj4gSG93IG1hbnkgdkRTT3MKPiA+PiAtLS0tLS0tLS0tLS0tLS0K
PiA+PiBTaGFkb3cgc3RhY2sgaW5zdHJ1Y3Rpb25zIGFyZSBjYXJ2ZWQgb3V0IG9mIHppbW9wICht
YXkgYmUgb3BlcmF0aW9ucykgYW5kIGlmIENQVQo+ID4+IGRvZXNuJ3QgaW1wbGVtZW50IHppbW9w
LCB0aGV5J3JlIGlsbGVnYWwgaW5zdHJ1Y3Rpb25zLiBLZXJuZWwgY291bGQgYmUgcnVubmluZyBv
bgo+ID4+IGEgQ1BVIHdoaWNoIG1heSBvciBtYXkgbm90IGltcGxlbWVudCB6aW1vcC4gQW5kIHRo
dXMga2VybmVsIHdpbGwgaGF2ZSB0byBjYXJyeSAyCj4gPj4gZGlmZmVyZW50IHZEU09zIGFuZCBl
eHBvc2UgdGhlIGFwcHJvcHJpYXRlIG9uZSBkZXBlbmRpbmcgb24gd2hldGhlciBDUFUgaW1wbGVt
ZW50cwo+ID4+IHppbW9wIG9yIG5vdC4KPiA+Cj4gPklmIHdlIG1lcmdlIHRoaXMgc2VyaWVzIHdp
dGhvdXQgdGhpcywgdGhlbiB3aGVuIENGSSBpcyBlbmFibGVkIGluIHRoZQo+ID5LY29uZmlnLCB3
ZSdsbCB3aW5kIHVwIHdpdGggYSBub24tcG9ydGFibGUga2VybmVsIHRoYXQgd29uJ3QgcnVuIG9u
IG9sZGVyCj4gPmhhcmR3YXJlLiAgV2UgZ28gdG8gZ3JlYXQgbGVuZ3RocyB0byBlbmFibGUga2Vy
bmVsIGJpbmFyeSBwb3J0YWJpbGl0eQo+ID5hY3Jvc3MgdGhlIHByZXNlbmNlIG9yIGFic2VuY2Ug
b2Ygb3RoZXIgUklTQy1WIGV4dGVuc2lvbnMsIGFuZCBJIHRoaW5rCj4gPnRoZXNlIENGSSBleHRl
bnNpb25zIHNob3VsZCBiZSBubyBkaWZmZXJlbnQuCj4gPgo+ID5TbyBiZWZvcmUgY29uc2lkZXJp
bmcgdGhpcyBmb3IgbWVyZ2luZywgSSdkIGxpa2UgdG8gc2VlIGF0IGxlYXN0IGFuCj4gPmF0dGVt
cHQgdG8gaW1wbGVtZW50IHRoZSBkdWFsLXZEU08gYXBwcm9hY2ggKG9yIHNvbWV0aGluZyBlcXVp
dmFsZW50KQo+ID53aGVyZSB0aGUgc2FtZSBrZXJuZWwgYmluYXJ5IHdpdGggQ0ZJIGVuYWJsZWQg
Y2FuIHJ1biBvbiBib3RoIHByZS1aaW1vcAo+ID5hbmQgcG9zdC1aaW1vcCBoYXJkd2FyZSwgd2l0
aCB0aGUgZXhpc3RpbmcgdXNlcnNwYWNlcyB0aGF0IGFyZSBjb21tb24KPiA+dG9kYXkuCj4KPiBB
ZGRlZCBzb21lIGRpc3RybyBmb2xrcyBpbiB0aGlzIGVtYWlsIGNoYWluLgo+Cj4gQWZ0ZXIgcGF0
Y2h3b3JrIG1lZXRpbmcgdG9kYXksIEkgd2FudGVkIHRvIGNvbnRpbnVlIGRpc2N1c3Npb24gaGVy
ZS4gU28gdGhhbmtzCj4gUGF1bCBmb3IgbG9va2luZyBpbnRvIGl0IGFuZCBpbml0aWF0aW5nIGEg
ZGlzY3Vzc2lvbiBoZXJlLgo+Cj4gVGhpcyBwYXRjaCBzZXJpZXMgaGFzIGJlZW4gaW4gdGhlIHF1
ZXVlIGZvciBxdWl0ZSBhIGxvbmcgdGltZSBhbmQgd2UgaGF2ZSBoYWQKPiBkZWxpYmVyYXRpb25z
IG9uIHZEU08gdG9waWMgZWFybGllciBhcyB3ZWxsIGFuZCBhZnRlciB0aG9zZSBkZWxpYmVyYXRp
b25zIGl0Cj4gd2FzIGRlY2lkZWQgdG8gZ28gYWhlYWQgd2l0aCBtZXJnZSBhbmQgaXQgaW5kZWVk
IHdhcyBzZW50IGZvciA2LjE3IG1lcmdlCj4gd2luZG93LiBVbmZvcnR1bmF0bGV5IGR1ZSB0byBv
dGhlciB1bmZvcmVzZWVuIHJlYXNvbnMsIGVudGlyZXR5IG9mIHJpc2N2Cj4gY2hhbmdlcyB3ZXJl
IG5vdCBwaWNrZWQuIFNvIGl0J3MgYSBiaXQgZGlzYXBwb2ludGluZyB0byBzZWUgYmFjay1wYWRk
bGluZyBvbgo+IHRoaXMgdG9waWMuCj4KPiBBbnl3YXlzLCB3ZSBhcmUgaGVyZS4gU28gSSdsbCBw
cm92aWRlIGEgYml0IG9mIGNvbnRleHQgZm9yIHRoZSBsaXN0IGFib3V0Cj4gZGVsaWJlcmF0aW9u
cyBhbmQgZGlzY3Vzc2lvbnMgd2UgaGF2ZSBiZWVuIGhhdmluZyBmb3Igc28gbWFueSBtZXJnZSB3
aW5kb3dzLgo+IFRoaXMgc28gdGhhdCBhIGhvbGlzdGljIGRpc2N1c3Npb24gY2FuIGhhcHBlbiBv
biB0aGlzIGJlZm9yZSB3ZSBtYWtlIGEKPiBkZWNpc2lvbi4KPgo+IElzc3VlCj4gPT09PT09Cj4K
PiBJbnN0cnVjdGlvbnMgaW4gUklTQy1WIHNoYWRvdyBzdGFjayBleHRlbnNpb24gKHppY2Zpc3Mg
LSBbMV0pIGFyZSBjYXJ2ZWQgb3V0IG9mCj4gIm1heSBiZSBvcHMiIGFrYSB6aW1vcCBleHRlbnNp
b24gWzJdLiAibWF5IGJlIG9wcyIgYXJlIGlsbGVnYWwgb24gbm9uLVJWQTIzCj4gaGFyZHdhcmUu
IFRoaXMgbWVhbnMgYW55IGV4aXN0aW5nIHJpc2N2IENQVSBvciBmdXR1cmUgQ1BVIHdoaWNoIGlz
bid0IFJWQTIzCj4gY29tcGxpYW50IGFuZCBub3QgaW1wbGVtZW50aW5nIHppbW9wIHdpbGwgdHJl
YXQgdGhlc2UgZW5jb2RpbmdzIGFzIGlsbGVnYWwuCj4KPiBDdXJyZW50IGtlcm5lbCBwYXRjaGVz
IGVuYWJsZSBzaGFkb3cgc3RhY2sgYW5kIGxhbmRpbmcgcGFkIHN1cHBvcnQgZm9yCj4gdXNlcnNw
YWNlIHVzaW5nIGNvbmZpZyBgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJYC4gSWYgdGhpcyBjb25maWcg
aXMgc2VsZWN0ZWQgdGhlbgo+IHZEU08gdGhhdCB3aWxsIGJlIGV4cG9zZWQgdG8gdXNlciBzcGFj
ZSB3aWxsIGFsc28gaGF2ZSBzaGFkb3cgc3RhY2sKPiBpbnN0cnVjdGlvbnMgaW4gdGhlbS4gS2Vy
bmVsIGNvbXBpbGVkIHdpdGggYENPTkZJR19SSVNDVl9VU0VSX0NGSWAsIGZvciBzYWtlIG9mCj4g
dGhpcyBkaXNjdXNzaW9uIGxldHMgY2FsbCBpdCBSVkEyMyBjb21waWxlZCBrZXJuZWwuCj4KPiBJ
c3N1ZSB0aGF0IHdlIGRpc2N1c3NlZCBlYXJsaWVyIGFuZCBldmVuIHRvZGF5IGlzICJUaGlzIFJW
QTIzIGNvbXBpbGVkIGtlcm5lbAo+IHdvbid0IGJlIGFibGUgdG8gc3VwcG9ydCBub24tUlZBMjMg
dXNlcnNwYWNlIG9uIG5vbi1SVkEyMyBoYXJkd2FyZSBiZWNhdXNlIi4KPiBQbGVhc2Ugbm90ZSB0
aGF0IGlzc3VlIGV4aXN0cyBvbmx5IG9uIG5vbi1SVkEyMyBoYXJkd2FyZSAod2hpY2ggaXMgZXhp
c3RpbmcKPiBoYXJkd2FyZSBhbmQgZnV0dXJlIGhhcmR3YXJlIHdoaWNoIGlzIG5vdCBpbXBsZW1l
bnRpbmcgemltb3ApLiBSVkEyMyBjb21waWxlZAo+IGtlcm5lbCBjYW4gc3VwcG9ydCBhbnkgc29y
dCBvZiB1c2Vyc3BhY2Ugb24gUlZBMjMgaGFyZHdhcmUuCj4KPgo+IERpc2N1c3Npb24KPiA9PT09
PT09PT09PQo+Cj4gU28gdGhlIGlzc3VlIGlzIG5vdCByZWFsbHkgc2hhZG93IHN0YWNrIGluc3Ry
dWN0aW9ucyBidXQgcmF0aGVyIG1heSBiZSBvcAo+IGluc3RydWN0aW9ucyBpbiBjb2RlZ2VuIChi
aW5hcmllcyBhbmQgdkRTTykgd2hpY2ggYXJlbid0IGhpZGRlbiBiZWhpbmQgYW55Cj4gZmxhZyAo
dG8gaGlkZSB0aGVtIGlmIGhhcmR3YXJlIGRvZXNuJ3Qgc3VwcG9ydCkuIEFuZCBpZiBJIGNhbiBu
YXJyb3cgZG93bgo+IGZ1cnRoZXIsIHByaW1hcnkgaXNzdWUgd2UgYXJlIGRpc2N1c3NpbmcgaXMg
dGhhdCBpZiBjZmkgaXMgZW5hYmxlZCBkdXJpbmcKPiBrZXJuZWwgY29tcGlsZSwgaXQgaXMgYnJp
bmdpbmcgaW4gYSBwaWVjZSBvZiBjb2RlICh2RFNPKSB3aGljaCB3b24ndCB3b3JrCj4gb24gZXhp
c3RpbmcgaGFyZHdhcmUuIEJ1dCB0aGUgY291bnRlciBwb2ludCBpcyBpZiBzb21lb25lIHdlcmUg
dG8gZGVwbG95Cj4gUlZBMjMgY29tcGlsZWQga2VybmVsIG9uIG5vbi1SVkEyMyBoYXJkd2FyZSwg
dGhleSBtdXN0IGhhdmUgY29tcGlsZWQKPiByZXN0IG9mIHRoZSB1c2Vyc3BhY2Ugd2l0aG91dCBz
aGFkb3cgc3RhY2sgaW5zdHJ1Y3Rpb25zIGluIHRoZW0gZm9yIHN1Y2gKPiBhIGhhcmR3YXJlLiBB
bmQgdGh1cyBhdCB0aGlzIHBvaW50IHRoZXkgY291bGQgc2ltcGx5IGNob29zZSAqbm90KiB0byB0
dXJuIG9uCj4gYENPTkZJR19SSVNDVl9VU0VSX0NGSWAgd2hlbiBjb21waWxpbmcgc3VjaCBrZXJu
ZWwuIEl0J3Mgbm90IHRoYXQgZGlmZmljdWx0IHRvCj4gZG8gc28uCj4KPiBBbnkgZGlzdHJvIHdo
byBpcyBzaGlwcGluZyB1c2Vyc3BhY2UgKHdoaWNoIGFsbCBvZiB0aGVtIGFyZSkgYWxvbmcgd2l0
aCBrZXJuZWwKPiB3aWxsIG5vdCBiZSBzaGlwcGluZyB0d28gZGlmZmVyZW50IHVzZXJzcGFjZXMg
KG9uZSB3aXRoIHNoYWRvdyBzdGFjayBhbmQgb25lCj4gd2l0aG91dCB0aGVtKS4gSWYgZGlzdHJv
IGFyZSBzaGlwcGluZyB0d28gZGlmZmVyZW50IHVzZXJzcGFjZXMsIHRoZW4gdGhleSBtaWdodAo+
IGFzIHdlbGwgc2hpcCB0d28gZGlmZmVyZW50IGtlcm5lbHMuIFRhZ2dpbmcgc29tZSBkaXN0cm8g
Zm9sa3MgaGVyZSB0byBnZXQgdGhlaXIKPiB0YWtlIG9uIHNoaXBwaW5nIGRpZmZlcmVudCB1c2Vy
c3BhY2UgZGVwZW5kaW5nIG9uIHdoZXRoZXIgaGFyZHdhcmUgaXMgUlZBMjMgb3IKPiBub3QuIEBI
ZWlucmljaCwgQEZsb3JpYW4sIEByZWRiZWFyZCBhbmQgQEF1cmVsaWVuLgo+Cj4gTWFqb3IgZGlz
dHJvJ3MgaGF2ZSBhbHJlYWR5IGRyYXduIGEgZGlzdGluY3Rpb24gaGVyZSB0aGF0IHRoZXkgd2ls
bCBkcm9wCj4gc3VwcG9ydCBmb3IgaGFyZHdhcmUgd2hpY2ggaXNuJ3QgUlZBMjMgZm9yIHRoZSBz
YWtlIG9mIGtlZXBpbmcgYmluYXJ5Cj4gZGlzdHJpYnV0aW9uIHNpbXBsZS4KPgo+IE9ubHkgb3Ro
ZXIgdXNlIGNhc2UgdGhhdCB3YXMgZGlzY3Vzc2VkIG9mIGEgcG93ZXJmdWwgbGludXggdXNlciB3
aG8ganVzdCB3YW50cwo+IHRvIHVzZSBhIHNpbmdsZSBrZXJuZWwgb24gYWxsIGtpbmRzIG9mIHJp
c2N2IGhhcmR3YXJlLiBJIGFtIGltYWdpbmluZyBzdWNoIGEKPiB1c2VyIGtub3dzIGVub3VnaCBh
Ym91dCBrZXJuZWwgYW5kIGlmIGlzIHJlYWxseSBkZWFyIHRvIHRoZW0sIHRoZXkgY2FuIGRldmVs
b3AKPiB0aGVpciBvd24gcGF0Y2hlcyBhbmQgc2VuZCBpdCB1cHN0cmVhbSB0byBzdXBwb3J0IHRo
ZWlyIG93biB1c2VjYXNlIGFuZCB3ZSBjYW4KPiBkaXNjdXNzIHRoZW0gb3V0LiBDdXJyZW50IHBh
dGNoc2V0IGRvbid0IHByZXZlbnQgc3VjaCBhIGRldmVsb3BlciB0byBzZW5kIHN1Y2gKPiBwYXRj
aGVzIHVwc3RyZWFtLgo+Cj4gSSBoZWFyZCB0aGUgYXJndW1lbnQgaW4gbWVldGluZyB0b2RheSB0
aGF0ICJaYmIiIGVuYWJsaW5nIHdvcmtzIHNpbWlsYXIgZm9yCj4ga2VybmVsIHRvZGF5LiBJIGxv
b2tlZCBhdCAiWmJiIiBlbmFibGluZy4gSXQncyBmb3Iga2VybmVsIHVzYWdlIGFuZCBpdCdzCj4g
c3VyZ2ljYWxseSBwbGFjZWQgaW4ga2VybmVsIHVzaW5nIGFzbSBoaWRkZW4gYmVoaW5kIGFsdGVy
bmF0aXZlcy4gdkRTTyBpc24ndAo+IGNvbXBpbGVkIHdpdGggWmJiLiBTaGFkb3cgc3RhY2sgaW5z
dHJ1Y3Rpb25zIGFyZSBwYXJ0IG9mIGNvZGVnZW4gZm9yIEMgZmlsZXMKPiBjb21waWxlZCBpbnRv
IHZEU08uCj4KPiBGdXJ0aGVybW9yZSwKPgo+IEtlcm5lbCBjb250cm9sIGZsb3cgaW50ZWdyaXR5
IHdpbGwgaW50cm9kdWNlIHNoYWRvdyBzdGFjayBpbnN0cnVjdGlvbnMgYWxsCj4gb3ZlciB0aGUg
a2VybmVsIGJpbmFyeS4gU3VjaCBrZXJuZWwgd29uJ3QgYmUgZGVwbG95YWJsZSBvbiBub24tUlZB
MjMgaGFyZHdhcmUuCj4gSG93IHRvIGRlYWwgd2l0aCB0aGlzIHByb2JsZW0gZm9yIGEgc2F2dnkg
a2VybmVsIGRldmVsb3BlciB3aG8gd2FudHMgdG8gcnVuCj4gc2FtZSBjZmkgZW5hYmxlZCBrZXJu
ZWwgYmluYXJ5IG9uIG11bHRpcGxlIGhhcmR3YXJlPwo+Cj4gQ29taW5nIGZyb20gZW5naW5lZXJp
bmcgYW5kIGhhY2tlciBwb2ludCBvZiB2aWV3LCBJIHVuZGVyc3RhbmQgdGhlIGRlc2lyZSBoZXJl
Cj4gYnV0IEkgc3RpbGwgc2VlIHRoYXQgaXQncyBjb21wbGV4aXR5IGVuZm9yY2VkIG9uIHJlc3Qg
b2YgdGhlIGtlcm5lbCBmcm9tIGEgdXNlcgo+IGJhc2Ugd2hpY2ggYW55d2F5cyBjYW4gYWNoaWV2
ZSBzdWNoIGdvYWxzLiBGb3IgbWFqb3JpdHkgb2YgdXNlY2FzZXMsIEkgZG9uJ3QKPiBzZWUgYSBy
ZWFzb24gdG8gaW5jcmVhc2UgY29tcGxleGl0eSBpbiB0aGUga2VybmVsIGZvciBidWlsZCwgcG9z
c2libHkgcnVudGltZQo+IHBhdGNoaW5nIGFuZCB0aHVzIHBvc3NpYmx5IGludHJvZHVjZSBtb3Jl
IGlzc3VlcyBhbmQgZXJyb3JzIGp1c3QgZm9yIHRoZSBzYWtlCj4gb2YgYSBzY2llbmNlIHByb2pl
Y3QuCj4KPiBCZWluZyBzYWlkIHRoYXQsIHJlLWl0ZXJhdGluZyB0aGF0IGN1cnJlbnRseSBkZWZh
dWx0IGZvciBgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJYAo+IGlzICJuIiB3aGljaCBtZWFucyBpdCB3
b24ndCBiZSBicmVha2luZyBhbnl0aGluZyB1bmxlc3MgYSB1c2VyIG9wdHMgIlkiLiBTbyBldmVu
Cj4gdGhvdWdoIEkgcmVhbGx5IGRvbid0IHNlZSBhIHJlYXNvbiBhbmQgdXNhYmlsaXR5IHRvIGhh
dmUgY29tcGxleGl0eSBpbiBrZXJuZWwgdG8KPiBjYXJyeSBtdWx0aXBsZSB2RFNPcywgY3VycmVu
dCBwYXRjaHNldHMgYXJlIG5vdCBhIGhpbmRlcmFuY2UgZm9yIHN1Y2ggZnV0dXJlCj4gY2FwYWJp
bGl0eSAoYmVjYXVzZSBjdXJyZW50IGRlZmF1bHQgaXMgTm8pIGFuZCBtb3RpdmF0ZWQgZGV2ZWxv
cGVyIGlzIHdlbGNvbWUKPiB0byBidWlsZCBvbiB0b3Agb2YgaXQuIEJvdHRvbWxpbmUgaXMgSSBk
b24ndCBzZWUgYSByZWFzb24gdG8gYmxvY2sgY3VycmVudAo+IHBhdGNoc2V0IGZyb20gbWVyZ2lu
ZyBpbiB2Ni4xOC4KClNvcnJ5IGZvciByZWl0ZXJhdGluZywgSSBoYXZlIGJlZW4gZ29uZSBmb3Ig
YSB3aGlsZSwgc28gbWF5YmUgSSBsb3N0IGEKYml0IG9mIGNvbnRleHQuCgpJbiB0aGF0IGNhc2Us
IHNob3VsZCB3ZSBhZGQgYSBjb21tZW50IGluIHRoZSBLY29uZmlnIHRoYXQgc2F5cyAiaXQKYnJl
YWtzIHVzZXJzcGFjZSBvbiBvbGRlci10aGFuIFJWQTIzIHBsYXRmb3JtcyI/CgpQZXJoYXBzIGEg
dmVyeSB1Z2x5IHdheSB0byBtYWtlIFJWQTIzLWNvbXBpbGVkIGtlcm5lbCBjb21wYXRpYmxlIHdp
dGgKcHJlLVJWQTIzIHBsYXRmb3JtcyBpcyB0byBkZWNvZGUgbWF5YmUtb3BzIGluIHRoZSBpbGxl
Z2FsIGV4Y2VwdGlvbgpoYW5kbGVyLi4uCgpCdHcsIEkgZG9uJ3QgdGhpbmsga2VucmVsLWxldmVs
IHNoYWRvdyBzdGFjayBzaG91bGQgYmUgYW4gYXJndW1lbnQKaGVyZSwgYXMga2VybmVsLWxldmVs
IEFQSXMgYXJlIG1vcmUgZmxleGlibGUgYnkgbmF0dXJlLgoKVGhhbmtzLApBbmR5CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
