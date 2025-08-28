Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99CCCA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 06:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ug4rmFm+FxsmvqJbFfj5MJpMGlr480AqdUJ44SUxrJw=; b=shOCmDZkvUNQNJ
	n53+fEjkBjCF8y2LRrAQWNLdrLSB9pipBol/j3mA1u1R0RCHSbiP06Pmop+qn0MGdBjmL2P2XeVyl
	1oWwzPprTxDFR1TulLlTlv1k/FDPUbL3beWys0S4lI1wIKljzwBBDRoPwaxHccbT9QoKDOFnT3uXa
	l65/bPHWghDch+lCqrEMPnz4qJNoKIgQ54HHtHwtxtVHw3Z4AXk8jHE7HkEpJ1O3Mmb9+jQXtR0XZ
	mn0zpThZ1mZ2W/MPuoPwaRmD/XcF87cZvCrnZv5oATvz5j1OSQJId+tzlvML4AmEatheKr4s01aUB
	stSsEIYxrj8bh2gZViiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urVws-00000000PsT-2Sjx;
	Thu, 28 Aug 2025 06:17:26 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urVuA-00000000Phx-1KCr;
	Thu, 28 Aug 2025 06:14:38 +0000
Message-ID: <61cd6dac-14e1-474e-9aa3-4fe782e81ba9@infradead.org>
Date: Wed, 27 Aug 2025 23:14:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@outflux.net>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Rutland
 <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
 <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org>
 <20250827193815.GA2293657@ax162>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250827193815.GA2293657@ax162>
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

CgpPbiA4LzI3LzI1IDEyOjM4IFBNLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiBPbiBXZWQs
IEF1ZyAyNywgMjAyNSBhdCAxMjozNToxMkFNIC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+
IE9uIDgvMjYvMjUgNjozNCBQTSwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4+PiBPbiBNb24s
IEF1ZyAyNSwgMjAyNSBhdCAwMzozMTozNFBNIC0wNDAwLCBLZWVzIENvb2sgd3JvdGU6Cj4+Pj4g
T24gQXVndXN0IDI1LCAyMDI1IDE6MDA6MjIgUE0gRURULCBNaWd1ZWwgT2plZGEgPG1pZ3VlbC5v
amVkYS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOgo+Pj4+PiBPbiBNb24sIEF1ZyAyNSwgMjAy
NSBhdCA1OjM14oCvUE0gS2VlcyBDb29rIDxrZWVzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pj4K
Pj4+Pj4+IFllYWgsIHRoYXQncyBhIGdvb2QgaWRlYS4gV2hhdCB0aGUgcmlnaHQgd2F5IHRvIGRv
IHRoYXQ/Cj4+Pj4+Pgo+Pj4+Pj4gY29uZmlnIENGSV9DTEFORwo+Pj4+Pj4gICAgICAgICBib29s
ICJVc2UgQ2xhbmcncyBDb250cm9sIEZsb3cgSW50ZWdyaXR5IChDRkkpIgo+Pj4+Pj4gICAgICAg
ICBkZXBlbmRzIG9uIEFSQ0hfU1VQUE9SVFNfQ0ZJCj4+Pj4+PiAgICAgICAgIHNlbGVjdCBDRkkK
Pj4+Pj4+Cj4+Pj4+PiA/Cj4+Pj4+Cj4+Pj4+IEkgZG9uJ3QgcmVjYWxsIHdoYXQgaXMgdGhlIGlk
aW9tYXRpYyBzb2x1dGlvbiBmb3IgcmVuYW1lcywgYnV0IEkKPj4+Pj4gcmVtZW1iZXIgTGludXMg
dGFsa2luZyBhYm91dCB0aGlzIHRvcGljIGFuZCBhYm91dCBhdm9pZGluZyBsb3Npbmcgb2xkCj4+
Pj4+IHZhbHVlcyBpZiBwb3NzaWJsZSAocGVyaGFwcyBnZXR0aW5nIGEgbmV3IHF1ZXN0aW9uIGlu
IGBvbGRjb25maWdgIGlzCj4+Pj4+IE9LIGFzIGxvbmcgYXMgdGhlIGBvbGRkZWZjb25maWdgIHJl
c3BlY3RzIHRoZSBvbGQgdmFsdWUpLgo+Pj4+Pgo+Pj4+PiBJIHRoaW5rIHlvdXIgc3VnZ2VzdGlv
biBhYm92ZSB3aWxsIHN0aWxsIG1ha2UgaXQgYXBwZWFyIHR3aWNlIGluCj4+Pj4+IGBtZW51Y29u
ZmlnYCAtLSB0aGVyZSBtYXkgYmUgYSB3YXkgdG8gcGxheSB3aXRoIHZpc2liaWxpdHkgdG8gbWFr
ZSBpdAo+Pj4+PiBiZXR0ZXIuCj4+Pj4+Cj4+Pj4+IEEgc2ltcGxlIHBvc3NpYmlsaXR5IEkgY2Fu
IHRoaW5rIG9mIChhc3N1bWluZyBpdCB3b3JrcykgaXMgaGF2aW5nIHRoZQo+Pj4+PiBDRkkgc3lt
Ym9sIGZvciB0aGUgdGltZSBiZWluZyBpbnRyb2R1Y2VkIGp1c3QgYXMgYSBgZGVmX2Jvb2wKPj4+
Pj4gQ0ZJX0NMQU5HYCBmb3IgYSBmZXcgcmVsZWFzZXMgc28gdGhhdCBwZW9wbGUgZ2V0IHRoZSBu
ZXcgb25lIGluIHRoZWlyCj4+Pj4+IGNvbmZpZ3MuCj4+Pj4KPj4+PiBBaCwgSSB0aGluayB0aGlz
IHdvcmtzOgo+Pj4+Cj4+Pj4gY29uZmlnIENGSV9DTEFORwo+Pj4+ICAgICBib29sCj4+Pj4KPj4+
PiBjb25maWcgQ0ZJCj4+Pj4gICAgIGJvb2wgIi4uLi4iCj4+Pj4gICAgIGRlZmF1bHQgQ0ZJX0NM
QU5HCj4+Pj4KPj4+PiBJIHdpbGwgYWRkIHRoYXQgZm9yIHYyLgo+Pj4KPj4+IFRoYXQgZG9lcyBu
b3QgYXBwZWFyIHRvIHdvcmsgZm9yIG1lLiBJIGFwcGxpZWQKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9LY29uZmlnIGIvYXJjaC9LY29uZmlnCj4+PiBpbmRleCBjMjVhNDVkOWFhOTYuLjBkM2Vk
MDNjNzZjMiAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvS2NvbmZpZwo+Pj4gKysrIGIvYXJjaC9LY29u
ZmlnCj4+PiBAQCAtODc2LDggKzg3NiwxMiBAQCBjb25maWcgQVJDSF9TVVBQT1JUU19DRkkKPj4+
ICBjb25maWcgQVJDSF9VU0VTX0NGSV9UUkFQUwo+Pj4gICAgICAgICBib29sCj4+Pgo+Pj4gK2Nv
bmZpZyBDRklfQ0xBTkcKPj4+ICsgICAgICAgYm9vbAo+Pj4gKwo+Pj4gIGNvbmZpZyBDRkkKPj4+
ICAgICAgICAgYm9vbCAiVXNlIEtlcm5lbCBDb250cm9sIEZsb3cgSW50ZWdyaXR5IChrQ0ZJKSIK
Pj4+ICsgICAgICAgZGVmYXVsdCBDRklfQ0xBTkcKPj4+ICAgICAgICAgZGVwZW5kcyBvbiBBUkNI
X1NVUFBPUlRTX0NGSQo+Pj4gICAgICAgICBkZXBlbmRzIG9uICQoY2Mtb3B0aW9uLC1mc2FuaXRp
emU9a2NmaSkKPj4+ICAgICAgICAgaGVscAo+Pj4KPj4+IG9uIHRvcCBvZiB0aGlzIHNlcmllcyBh
bmQKPj4+Cj4+PiAgIENPTkZJR19DRklfQ0xBTkc9eQo+Pj4gICAjIENPTkZJR19DRklfSUNBTExf
Tk9STUFMSVpFX0lOVEVHRVJTIGlzIG5vdCBzZXQKPj4+ICAgIyBDT05GSUdfQ0ZJX1BFUk1JU1NJ
VkUgaXMgbm90IHNldAo+Pj4KPj4+IGdldHMgdHVybmVkIGludG8KPj4+Cj4+PiAgICMgQ09ORklH
X0NGSSBpcyBub3Qgc2V0Cj4+Pgo+Pj4gYWZ0ZXIgb2xkZGVmY29uZmlnLiBDT05GSUdfQ0ZJX0NM
QU5HIGhhcyB0byBiZSB1c2VyIHNlbGVjdGFibGUgd2l0aCBhCj4+Cj4+IENvdWxkL2RpZCB5b3Ug
dGVzdCB3aXRoICdvbGRjb25maWcnIGluc3RlYWQ/Cj4+Cj4+IG9sZGRlZmNvbmZpZyBpcyBnb2lu
ZyB0byB1c2UgdGhlIGRlZmF1bHQgdmFsdWUgZnJvbSB0aGUgS2NvbmZpZyBmaWxlLAo+PiB3aGlj
aCBpZiBDRklfQ0xBTkcgd2hpY2ggaXMgdW5kZWZpbmVkL05vL05vdCBzZXQuCj4+Cj4+IG9sZGNv
bmZpZyB3aWxsIHVzZSB0aGUgb2xkIHZhbHVlIGZyb20gdGhlIC5jb25maWcgZmlsZS4KPiAKPiBJ
IGFtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuIGhlcmUuIFdpdGggdGhlIHNl
cmllcyBhcyBpdCBpcwo+IG9yIEtlZXMncyBzdWdnZXN0ZWQgZml4LCBvbGRjb25maWcgc3RpbGwg
cHJvbXB0cyB0aGUgdXNlciB0byBlbmFibGUKCk9LLCBJIGRvbid0IGtub3cgdGhlIHN0YXRlIG9m
IHRoZSBDRklfQ0xBTkcgLyBDTEFORyBwYXRjaChlcykuCgpJIGp1c3QgbWVhbiB0aGUgZGlmZmVy
ZW5jZSBpbiAnbWFrZSBvbGRjb25maWcnIGFuZCAnbWFrZSBvbGRkZWZjb25maWcnCihhdCBsZWFz
dCBBSVVJKS4KCgo+IENPTkZJR19DRkkgd2l0aCBDT05GSUdfQ0ZJX0NMQU5HPXkgaW4gdGhlIG9s
ZCBjb25maWd1cmF0aW9uLiBCb3RoIE1pZ3VlbAo+IGFuZCBJIGFsbHVkZSB0byB0aGF0IGJlaW5n
IGZpbmUgYnV0IGl0IHdvdWxkIGJlIHJlYWxseSBuaWNlIGlmIHVzZXJzCj4gd2l0aCBDT05GSUdf
Q0ZJX0NMQU5HPXkgd2VyZSBhdXRvbWF0aWNhbGx5IHRyYW5zaXRpb25lZCB0byBDT05GSUdfQ0ZJ
PXkKPiB3aXRob3V0IGFueSBhY3Rpb24gb24gdGhlaXIgcGFydC4gVGhhdCBzZWVtcyB0byBiZSBp
biBsaW5lIHdpdGggaG93CgpZZXMsIEkgYWdyZWUuCgo+IExpbnVzIGZlZWxzIGV2ZW4gYXMgcmVj
ZW50bHkgYXMgdGhpcyBwYXN0IG1lcmdlIHdpbmRvdzoKPiAKPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9DQUhrLT13Z08wUngyTGNZVDRmNzVYczQ2b3JiSjRKeE8yamJBRlFuVktEWUFqVjVIZVFA
bWFpbC5nbWFpbC5jb20vCj4gCj4gQW5vdGhlciBpZGVhIEkgaGFkIHRvIGF2b2lkIHRoaXMgaXMg
aW50cm9kdWNpbmcgQ09ORklHX0NGSV9HQ0MgYXMgYSB1c2VyCj4gc2VsZWN0YWJsZSBzeW1ib2wg
YW5kIG1ha2luZyBDT05GSUdfQ0ZJIHRoZSBoaWRkZW4gc3ltYm9sIHRoYXQgYm90aAo+IGNvbXBp
bGVyIHN5bWJvbHMgc2VsZWN0LiBBZnRlciBhIGNvdXBsZSBvZiByZWxlYXNlcyAob3IgbWF5YmUg
dGhlIG5leHQKPiBMVFMpLCBib3RoIENPTkZJR19DRklfQ0xBTkcgYW5kIENPTkZJR19DRklfR0ND
IGNvdWxkIGJlIGVsaW1pbmF0ZWQgd2l0aAo+IENPTkZJR19DRkkgYmVjb21pbmcgdXNlciBzZWxl
Y3RhYmxlLCB3aGljaCB3b3VsZCBrZWVwIHRoaW5ncyB3b3JraW5nCj4gc2luY2UgQ09ORklHX0NG
ST15IHdpbGwgYmUgcHJlc2VudCBpbiB0aGUgcHJldmlvdXMgY29uZmlndXJhdGlvbi4KCgotLSAK
flJhbmR5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
