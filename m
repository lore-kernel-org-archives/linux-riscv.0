Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26227D1951A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 20:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUe0Ezgyi3h74khdYncys1gDXzxVn/EhqVI02PP4+p0=; b=VQx3r9WJpnKxTO6MJKuKhBv+ri
	DcuwXbEXuK0jzNDO1wk0M8TaWqmEzP99kd2NJW4y6anUk39gnsDdlZWhlGqHuHUz/TliZua0/OLBJ
	Sn89N6TgBOcpzvMD/ADwdsei9Ioo4hp3VobFzkR2+pl64L7REgVYCnwveRIZndmaV47gccE8ZtUD/
	RFDdKsVJOwuIeQFKDN5PiHUQ71d5IMw/UKP31D8cDrdVz3esBhddRFgA3mdEu4Ddi1wfWbfNqn1O0
	7dvZlqOzBaZA8vAf3kTU8YJEkOw3X/8TDqRL19mCxb2b6XyLNYc/NvR86yd3W/WGnspX90jTvBOWH
	ThnwiRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTQo-0000000DDkO-3d3k;
	Mon, 26 Jan 2026 20:43:30 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTQm-0000000DDjp-0JWg
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 20:43:30 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-2b6fd5bec41so595068eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 12:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1769460207; x=1770065007; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s0UipC5QHyJnTmDWXctjUpxhkNyTA6jh9RjXD3Q3T9M=;
        b=NMrssAJxEJCrL5aLt3BV0BqaAVKqu2JBXA9MOz6Im6cPL5NEHYpKfX+HLDzIoNbqXW
         tgzNNKEvHjU1mQh99KD2StvW9aIqZtJnLiXCirVeOuFO5y+QqKhlsSkFh/aGbGVu+Bu6
         zxM/vnGKn0SBIbVAozsVXuwMvYJilnWz+UyLgA7ZoGtE1MvLUtGp9fGR3cRXIlzI7pZi
         ghenHdvlTIrkxxTcTzxEPMLdmDYEW3HA8gdUP0igL/wKPLNBMzNLbwrx12hDVHMbs1F/
         FS1MmLA8vtIrZVw+2fOsGxv2LW2GYeZDhIenu7Bttbf/dgQ8FJeOiiAc2FjfMMihaHJ1
         2aQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769460207; x=1770065007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0UipC5QHyJnTmDWXctjUpxhkNyTA6jh9RjXD3Q3T9M=;
        b=v7oIV6h/2/b3c4wP7YdIFcnCVnDkDOg1ZKEim7iomA89eFUUQADwAGK7xFFwdT2TJT
         AN9z3e1gQIyHUTDxSav8KoS43rTVRNSsJkgKMe6lPBNCiZZbGqwVbSu4sRPG428IcSo/
         K+eEIvdGqsmNE/gf4QLxWzgIlXoGGtb7lzlwH8Cm73axvnrZqUYm61D30C6+geUrwsRS
         qwwu4fijrkOySQ0Mw842bqwSvkrCGNs0THVHxFXcsosACtTnucUk1dO+h2jl/R0KP7hg
         /bagaZXiIXfl4S/yIrpzR3vs2PYizQnpqnr3LuFMTa9G7ONDylnkqOQybULXDngJa+VD
         27Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVAv4pxAezRsdNuF73O3liSuLN7pQQ8YYTZA7AFKXnhnqcNPX42QYA3ml1aHF1ISNjEU8cIIalFShhBZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZJJS3xS/z4WV83yx8vKZSewsso5jos/qeN+cMl886weo68Jyo
	bhEg2SyJN9sY6s9wkQz4aKMm3kETi6XuT9a/z7+ZLlDpvCiAtPQKXDN1lLR1Fr4I5Ec=
X-Gm-Gg: AZuq6aIk57If9+IugUmtjcMkut6x90WY+s7yHiFU/kTtQsr3Ke0LvRU1BEsG52n2sa2
	Df+VtdrwZ074OQha2Gjm1q2Ubbg1jTwVTU6mzPZMdrxBqAYiMGgpmJEvqYJRIFQ67uZhQnR2IZX
	l53Ynbn3g7yhCADpMmliZu5JRhKfi+u4BcCBiImaV6qKBJ7Mv2vjDtRbr/5lRAmhVzSgwXcHBZ4
	VDBc69SSktPGz1cq1NGNTm95mwbl8BwgrrfkauwUT/ByrVlh9RI6CARCqSHRHJErCU4ooFw3CKo
	HqZo/GV7lFZqoD93GeoRe6r9s+FIdNdx6LmDQBPrY4c0xEu9YFHCiUKS0pdBOqAI6lcV1BFlEe9
	9yWT4hz+C2x5RydmmUB+D6ROuE5XtyWsvRYAtJD0N1uBKvhVRDcI9zjX7+iTKQYBrk5Bbm2o+Gk
	misR3OQ60xR/Vgj48w1+/Y
X-Received: by 2002:a05:7301:d16:b0:2af:7ee:5300 with SMTP id 5a478bee46e88-2b7643466e8mr2954218eec.14.1769460207055;
        Mon, 26 Jan 2026 12:43:27 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa08964sm14741354eec.28.2026.01.26.12.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 12:43:26 -0800 (PST)
Date: Mon, 26 Jan 2026 12:43:24 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, x86@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	Andy Chiu <andybnac@gmail.com>, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Jesse Huang <jesse.huang@sifive.com>
Subject: Re: [PATCH v26 00/28] riscv control-flow integrity for usermode
Message-ID: <aXfR7NhAxHlND3z9@debug.ba.rivosinc.com>
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
 <e052745b-6bf0-c2a3-21b2-5ecd8b04ec70@kernel.org>
 <aTxf7IGlkGLgHgI2@debug.ba.rivosinc.com>
 <CAKC1njQ-hS+kUJ0C_v0oqZW1EZw2zAXMp-SnnA-ZXh_H-SoVdQ@mail.gmail.com>
 <CANXhq0rpjSvOThACrB6_MMc8S34--xJsUYZ+HtMu1GUNyk8zOg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0rpjSvOThACrB6_MMc8S34--xJsUYZ+HtMu1GUNyk8zOg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_124329_291248_D8B32865 
X-CRM114-Status: GOOD (  33.19  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMjEsIDIwMjYgYXQgMDk6MzI6MjBBTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
Pk9uIFRodSwgSmFuIDgsIDIwMjYgYXQgMTE6MTDigK9QTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIFBhdWwsCj4+Cj4+IEkgaGF2ZSBhIGJ1Z2ZpeCBm
b3IgYSBidWcgcmVwb3J0ZWQgYnkgSmVzc2UgSHVhbmcgKHRoYW5rcyBKZXNzZSkgaW4gcmlzY3YK
Pj4gaW1wbGVtZW50YXRpb24gb2YgYG1hcF9zaGFkb3dfc3RhY2tgLgo+Pgo+PiBTaG91bGQgSSBz
ZW5kIGEgbmV3IHNlcmllcyBvciBvbmx5IHRoZSBidWdmaXgtcGF0Y2ggZm9yIGltcGxlbWVudGF0
aW9uCj4+IG9mIGBtYXBfc2hhZG93X3N0YWNrYAo+Pgo+Cj5IaSBEZWVwYWssCj5Ob3Qgc3VyZSBp
ZiBJIG1pc3NlZCB0aGUgYnVnZml4IHBhdGNoLCBJIGNvdWxkbid0IGZpbmQgaXQgb24gdGhlCj5t
YWlsaW5nIGxpc3QuIENvdWxkIEkga25vdyBoYXZlIHlvdSBzdWJtaXR0ZWQgaXQ/IElmIHNvLCBj
b3VsZCB5b3UKPnBsZWFzZSBwb2ludCBtZSB3aGVyZSB0aGUgcGF0Y2ggaXM/Cj5UaGFua3MKCk5v
IHlvdSBkaWRuJ3QgbWlzcyBhbnl0aGluZy4gSSBoYWQgYmVlbiBidXN5IHdpdGggam9iIGNoYW5n
ZSBhbmQgZXZlbiB0aG91Z2gKY2hhbmdlIHdhcyBzbWFsbC4gSSB3YW50ZWQgdG8gZG8gc29tZSBi
YXNpYyB0ZXN0aW5nIGJlZm9yZSBzZW5kaW5nIGZpeC4gSSBqdXN0CnNlbnQgdGhlIGZpeCBvbiB0
aGlzIHYyNiBzZXJpZXMsIHBhdGNoICMxMC8yOC4KClNvcnJ5IGFib3V0IHRoZSBkZWxheSBoZXJl
LgoKPgo+PiBMZXQgbWUga25vdy4gVGhhbmtzLgo+Pgo+PiAtRGVlcGFrCj4+Cj4+IC1EZWVwYWsK
Pj4KPj4KPj4KPj4gT24gRnJpLCBEZWMgMTIsIDIwMjUgYXQgMTA6MzPigK9BTSBEZWVwYWsgR3Vw
dGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBPbiBGcmksIERlYyAxMiwg
MjAyNSBhdCAwMTozMDoyOUFNIC0wNzAwLCBQYXVsIFdhbG1zbGV5IHdyb3RlOgo+PiA+ID5PbiBU
aHUsIDExIERlYyAyMDI1LCBEZWVwYWsgR3VwdGEgdmlhIEI0IFJlbGF5IHdyb3RlOgo+PiA+ID4K
Pj4gPiA+PiB2MjY6IENPTkZJR19SSVNDVl9VU0VSX0NGSSBkZXBlbmRzIG9uIENPTkZJR19NTVUg
KGRlcGVuZGVuY3kgb2Ygc2hhZG93IHN0YWNrCj4+ID4gPj4gb24gTU1VKS4gVXNlZCBiNCB0byBw
aWNrIHRhZ3MsIGFwcGFyYW50bHkgaXQgbWVzc2VkIHVwIHNvbWUgdGFnIHBpY2tzLiBGaXhpbmcg
aXQKPj4gPiA+Cj4+ID4gPkRlZXBhazogSSdtIG5vdyAoYXQgbGVhc3QpIHRoZSB0aGlyZCBwZXJz
b24gdG8gdGVsbCB5b3UgdG8gc3RvcCByZXNlbmRpbmcKPj4gPiA+dGhpcyBlbnRpcmUgc2VyaWVz
IG92ZXIgYW5kIG92ZXIgYWdhaW4uCj4+ID4KPj4gPiBUbyBiZSB2ZXJ5IGhvbmVzdCBJIGFsc28g
ZmVlbCB2ZXJ5IGJhZCBkb2luZyBhbmQgRE9TaW5nIHRoZSBsaXN0cy4gU29ycnkgdG8geW91Cj4+
ID4gYW5kIGV2ZXJ5b25lIGVsc2UuCj4+ID4KPj4gPiBCdXQgSSBoYXZlIGJlZW4gc2l0dGluZyBv
biB0aGlzIHBhdGNoIHNlcmllcyBmb3IgbGFzdCAzLTQgbWVyZ2Ugd2luZG93cyB3aXRoCj4+ID4g
cGF0Y2hlcyBiZWluZyBleGFjdGx5IHNhbWUvc2ltaWxhci4gU28gSSBoYXZlIGJlZW4gYSBsaXR0
bGUgbW9yZSB0aGFuIGRlc3BlcmF0ZQo+PiA+IHRvIGdldCBpdCBpbi4KPj4gPgo+PiA+IEkgcmVh
bGx5IGhhdmVuJ3QgaGFkIGFueSBtZWFuaW5nZnVsIGZlZWRiYWNrIG9uIHBhdGNoIHNlcmllcyBl
eGNlcHQgc3RhbGxpbmcKPj4gPiBqdXN0IGJlZm9yZSBlYWNoIG1lcmdlIHdpbmRvdyBmb3IgcmVh
c29ucyB3aGljaCByZWFsbHkgc2hvdWxkbid0IHN0YWxsIGl0cwo+PiA+IG1lcmdlLiBTdXJlIHRo
YXQncyB0aGUgbmF0dXJlIG9mIG9wZW4gc291cmNlIGRldmVsb3BtZW50IGFuZCBpdCdzIG1haW50
YWluZXIncwo+PiA+IGNhbGwgYXQgdGhlIGVuZCBvZiB0aGUgZGF5LiBBbmQgSSBhbSBuZXcgdG8g
dGhpcy4gSSdsbCBpbXByb3ZlLgo+PiA+Cj4+ID4gPgo+PiA+ID5GaXJzdCwgYSBtb2RpZmllZCB2
ZXJzaW9uIG9mIHRoZSBDRkkgdjIzIHNlcmllcyB3YXMgQUxSRUFEWSBTSVRUSU5HIElOCj4+ID4g
PkxJTlVYLU5FWFQuICBTbyB0aGVyZSdzIG5vIHJlYXNvbiB5b3Ugc2hvdWxkIGJlIHJlc2VuZGlu
ZyB0aGUgZW50aXJlCj4+ID4gPnNlcmllcywgVU5MRVNTIHlvdXIgaW50ZW50aW9uIGZvciBtZSBp
cyB0byBkcm9wIHRoZSBlbnRpcmUgZXhpc3Rpbmcgc2VyaWVzCj4+ID4gPmFuZCB3YWl0IGZvciBh
bm90aGVyIG1lcmdlIHdpbmRvdy4KPj4gPiA+Cj4+ID4gPlNlY29uZDogd2hlbiBzb21lb25lIGFz
a3MgeW91IHF1ZXN0aW9ucyBhYm91dCBhbiBpbmRpdmlkdWFsIHBhdGNoLCBhbmQgeW91Cj4+ID4g
PndhbnQgdG8gYW5zd2VyIHRob3NlIHF1ZXN0aW9ucywgaXQncyBOT1QgR09PRCBmb3IgeW91IHRv
IHJlc2VuZCB0aGUgZW50aXJlCj4+ID4gPjI4IHNlcmllcyBhcyB0aGUgcmVzcG9uc2UhICBZb3Ug
YXJlIERET1NpbmcgYSBidW5jaCBvZiBsaXN0cyBhbmQgRS1tYWlsCj4+ID4gPmluYm94ZXMuICBK
dXN0IGFuc3dlciB0aGUgcXVlc3Rpb24gaW4gYSBzaW5nbGUgRS1tYWlsLiAgSWYgeW91IHdhbnQg
dG8KPj4gPiA+dXBkYXRlIGEgc2luZ2xlIHBhdGNoLCBqdXN0IHNlbmQgdGhhdCBvbmUgcGF0Y2gu
Cj4+ID4KPj4gPiBOb3RlZC4gSSB3YXNuJ3Qgc3VyZSBhYm91dCBpdC4gSSdsbCBleHBsaWNpdGx5
IGFzayBuZXh0IHRpbWUgaWYgeW91IHdhbnQgbWUgdG8KPj4gPiBzZW5kIGFub3RoZXIgb25lLgo+
PiA+Cj4+ID4gPgo+PiA+ID5JZiB5b3UgZG9uJ3Qgc3RhcnQgcGF5aW5nIGF0dGVudGlvbiB0byB0
aGVzZSBydWxlcyB0aGVuIHBlb3BsZSBhcmUgZ29pbmcKPj4gPiA+dG8gc3RhcnQgaWdub3Jpbmcg
eW91IC0tIGF0IGJlc3QhIC0tIGFuZCBpdCdzIGdvaW5nIHRvIGdpdmUgdGhlIGVudGlyZQo+PiA+
ID5jb21tdW5pdHkgYSBiYWQgcmVwdXRhdGlvbi4KPj4gPgo+PiA+IEV2ZW4gYmVmb3JlIHRoaXMs
IHRoaXMgcGF0Y2ggc2VyaWVzIGhhcyBiZWVuIGlnbm9yZWQgbGFyZ2VseS4gSSBkb24ndCBrbm93
Cj4+ID4gaG93IHRvIGdldCBhdHRlbnRpb24uIEFsbCBJIHdhbnRlZCB3YXMgZWl0aGVyIGZlZWRi
YWNrIG9yIGdldCBpdCBpbi4gQW5kIGFzIEkKPj4gPiBzYWlkIEkndmUgYmVlbiBkZXNwYXJhdGUg
dG8gZ2V0IGl0IGluLiBBbHNvIGFzIEkgc2FpZCwgSSdsbCBpbXByb3ZlLgo+PiA+Cj4+ID4gPgo+
PiA+ID5QbGVhc2UgYWNrbm93bGVkZ2UgdGhhdCB5b3UgdW5kZXJzdGFuZCB0aGlzLAo+PiA+Cj4+
ID4gQUNLZWQuCj4+ID4KPj4gPiA+Cj4+ID4gPgo+PiA+ID4tIFBhdWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
