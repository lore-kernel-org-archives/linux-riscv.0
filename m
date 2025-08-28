Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA3CCA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 23:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQl3U7+eSMobHCaP/KW0hsE8iD6zXk79A6LeXfvFJ4I=; b=mYbDXPWS86OmTn
	mriiMwmDkBKjwmaRBAdejJUe8Q078vrTCpferBNoShxLIuS9lM82jdk/kQ/DzIVL515CkvmWhr7cW
	L8r4/Lfa7fmCnYjSLCBKFpprRTRxtajCgJWPMThQ3EqdTA2bY+aSS/ijyZDslg5kIVJSlrBOfMCGm
	BkGdMa8gojzfvjxSn1sp9d350Vo2tKgd0qKBvDoG+hQ4XgqTP2/lSylxo/CR32yR0KXwM8THowywy
	9aOKqUC3QgIpkaGN+Q7r5UGQ9PhY6tiqwGhQ0JYvi5LWX/duGlZMi0/fPS5/VnUGhR7eDrOCfzqWc
	Qe8G4LZM7DFIH3OndUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm1Q-00000003g6P-0Vtm;
	Thu, 28 Aug 2025 23:27:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1url0j-00000003UWN-1o0s;
	Thu, 28 Aug 2025 22:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 99DBA6013C;
	Thu, 28 Aug 2025 22:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04117C4CEEB;
	Thu, 28 Aug 2025 22:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756419744;
	bh=d/92f6J5aPp1ufMfnBooQwWAih94z2/6gNAZnQHQ1yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHsAjhoMTnZN7Ni9jW2DbXEcOWN6o9IGBCgqiQSwF2bf8CVwARs2lPfx+RWUxguEY
	 WY7vxk94VGhxjkAOomShDAb23QLFSNQG5bkUYgx+5MQ54lXPVPHiVONINXxwkXSlXV
	 KircQjPnCz/FwjJFE14oGi83LKS8/lcmMZQqvQc9yajCYL+ZuWYnR0ySrCx2CWt5WN
	 u/vUOMIMaqn3josSGA10QBXkuqZ/gV3nrAsH5pS6pVcz+4ZZKFznVG22iE8mTWFu+q
	 evzzghYy4zPxVtIAW1dnVFRRXY6LNzix24QfLFaLJv6s4XtNEd448oHIdtTEZV9/FU
	 OhApFBu5bZ0JA==
Date: Thu, 28 Aug 2025 15:22:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
Message-ID: <20250828222218.GA3029249@ax162>
References: <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
 <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org>
 <20250827193815.GA2293657@ax162>
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
 <20250828201915.GA219815@ax162>
 <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
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

T24gVGh1LCBBdWcgMjgsIDIwMjUgYXQgMDQ6MzI6MTZQTSAtMDQwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IE9uIEF1Z3VzdCAyOCwgMjAyNSA0OjE5OjE1IFBNIEVEVCwgTmF0aGFuIENoYW5jZWxsb3Ig
PG5hdGhhbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+T24gVGh1LCBBdWcgMjgsIDIwMjUgYXQgMDI6
MTE6NTFQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdyb3RlOgo+ID4+IE9uIFdlZCwgQXVnIDI3LCAy
MDI1IGF0IDk6MzjigK9QTSBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4+ID4gQW5vdGhlciBpZGVhIEkgaGFkIHRvIGF2b2lkIHRoaXMgaXMgaW50cm9kdWNp
bmcgQ09ORklHX0NGSV9HQ0MgYXMgYSB1c2VyCj4gPj4gPiBzZWxlY3RhYmxlIHN5bWJvbCBhbmQg
bWFraW5nIENPTkZJR19DRkkgdGhlIGhpZGRlbiBzeW1ib2wgdGhhdCBib3RoCj4gPj4gPiBjb21w
aWxlciBzeW1ib2xzIHNlbGVjdC4gQWZ0ZXIgYSBjb3VwbGUgb2YgcmVsZWFzZXMgKG9yIG1heWJl
IHRoZSBuZXh0Cj4gPj4gPiBMVFMpLCBib3RoIENPTkZJR19DRklfQ0xBTkcgYW5kIENPTkZJR19D
RklfR0NDIGNvdWxkIGJlIGVsaW1pbmF0ZWQgd2l0aAo+ID4+ID4gQ09ORklHX0NGSSBiZWNvbWlu
ZyB1c2VyIHNlbGVjdGFibGUsIHdoaWNoIHdvdWxkIGtlZXAgdGhpbmdzIHdvcmtpbmcKPiA+PiA+
IHNpbmNlIENPTkZJR19DRkk9eSB3aWxsIGJlIHByZXNlbnQgaW4gdGhlIHByZXZpb3VzIGNvbmZp
Z3VyYXRpb24uCj4gPj4gCj4gPj4gSWYgd2UgYXJlIE9LIHdpdGggc29tZXRoaW5nIGxpa2UgdGhp
cyAoaS5lLiB3YWl0aW5nIGEgZmV3IHJlbGVhc2VzKSwKPiA+PiB0aGVuIGlzbid0IGl0IHNpbXBs
ZXIgdGhlIGBkZWZfYm9vbGAgYXBwcm9hY2ggSSBtZW50aW9uZWQ/IGkuZS4gaXQKPiA+PiBtZWFu
cyBvbmUgbGVzcyBzeW1ib2wgYW5kIG9uZSBsZXNzIHJlbmFtZSBsYXRlciwgcmlnaHQ/Cj4gPgo+
ID5BaCB5ZXMsIEkgcmVyZWFkIHlvdXIgc3VnZ2VzdGlvbiBhbmQgdGhhdCB3b3VsZCBwcm9iYWJs
eSBiZSB0aGUgYmVzdAo+ID5jb3Vyc2Ugb2YgYWN0aW9uLCBhcyBpdCBkb2VzIGF2b2lkIHRoZSBl
eHRyYSBzeW1ib2wgKGFsdGhvdWdoIEkgYW0gbm90Cj4gPnN1cmUgd2hhdCB5b3UgbWVhbiBieSBv
bmUgbGVzcyByZW5hbWU/KS4gQXMgSSB1bmRlcnN0YW5kIGl0Ogo+ID4KPiA+ICBjb25maWcgQ0ZJ
X0NMQU5HCj4gPiAgICAgIGJvb2wgIlVzZSBLZXJuZWwgQ29udHJvbCBGbG93IEludGVncml0eSAo
a0NGSSkiCj4gPiAgICAgIGRlcGVuZHMgb24gQVJDSF9TVVBQT1JUU19DRkkKPiA+ICAgICAgZGVw
ZW5kcyBvbiAkKGNjLW9wdGlvbiwtZnNhbml0aXplPWtjZmkpCj4gPiAgICAgIGhlbHAKPiA+ICAg
ICAgICA8Z2VuZXJpYyBoZWxwIHRleHQ+Cj4gPgo+ID4gIGNvbmZpZyBDRkkKPiA+ICAgICAgZGVm
X2Jvb2wgQ0ZJX0NMQU5HCj4gCj4gT2ghIEtlZXAgQ0ZJX0NMQU5HIHRoZSB2aXNpYmxlIG9wdGlv
bj8gV2lsbCB0aGUgbGF0ZXIgcmVuYW1lIHdvcmsgcmlnaHQ/IEknbGwgZ2l2ZSBpdCBhIHRyeS4K
Ckl0IHNob3VsZCwgYXMgbG9uZyBhcyBwZW9wbGUgYXJlIGF0IGxlYXN0IHVwZ3JhZGluZyBMVFMg
cmVsZWFzZXMKY29udGludW91c2x5LiBJbiB0aGVvcnksIHRoZXJlIGNvdWxkIGJlIHBlb3BsZSB3
aG8gdXBncmFkZSB3aXRoIGEKY29uZmlndXJhdGlvbiB0aGF0IGhhcyBDT05GSUdfQ0ZJX0NMQU5H
PXkgdG8gYSByZWxlYXNlIGFmdGVyIHRoZSByZW5hbWUKdG8gQ09ORklHX0NGSSBoYXBwZW5zIGJ1
dCBhdCB0aGF0IHBvaW50LCBJIHdvdWxkIGV4cGVjdCB0aGVtIHRvIG5lZWQgdG8KZGlmZiB0aGVp
ciBjb25maWd1cmF0aW9uIHRvIG1ha2Ugc3VyZSBvdGhlciBpdGVtcyBkaWQgbm90IGdvIG1pc3Np
bmcgb3IKY2hhbmdlIHNpbmNlIHRoZXkgYXJlIGdvaW5nIGFjcm9zcyBtYW55IG1vbnRocy9yZWxl
YXNlcyB3aGVuIHVwZ3JhZGluZy4KSSB0aGluayBkb2luZyBpdCB0aGlzIHdheSBpcyBhIGhlYWx0
aHkgYmFsYW5jZSBvZiBub3QgYnJlYWtpbmcgdGhlCnBlb3BsZSB3aG8gdXBncmFkZSB0aGVpciBr
ZXJuZWxzIHllYXJseSAodmlhIExUUykgb3IgZXZlcnkgc3RhYmxlCnJlbGVhc2Ugd2hpbGUgYWxs
b3dpbmcgdGhlIGNvZGUgYXMgYSB3aG9sZSB0byBiZWNvbWUgbW9yZSBnZW5lcmljIGluIHRoZQpt
ZWFudGltZS4KCkZvbGtzIHdobyBoYXZlIENPTkZJR19DRklfQ0xBTkc9eSBpbiBkZWZjb25maWdz
IGxpa2UgQW5kcm9pZCBzaG91bGQKbm90aWNlIGl0IGRpc2FwcGVhcmluZyBhbmQgYmUgYWJsZSB0
byBmaWd1cmUgb3V0IHRoYXQgaXQgZ290IHJlbmFtZWQgYW5kCmFkanVzdCwgc2luY2UgdGhleSBh
bHJlYWR5IGhhdmUgdG8gZG8gdGhhdCBmb3Igb3RoZXIgc3ltYm9scy4KCkNoZWVycywKTmF0aGFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
