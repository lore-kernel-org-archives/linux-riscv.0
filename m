Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C032C8303F
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 07:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbstgRxNE27EG/6YaxFpO6sb83u8n2wm1Sf/0GwhE4Y=; b=PUImOGeA/vFxFA
	jseZnYE01dx0/C+Tdv598unrujatHy4vF9jxqa/Bz+vYfrQVbe5IrnhUGKDbLNcpIvwJiqB7G+KCa
	WL++7B5TT9ruRKIIXNgOSqyzQsBs0aNxWGfTnu6sN504tC6PjVHy+L+iOqsF9xMMWQF3RBKUDPlDd
	ag+4Zi2dQ4XgYc0jSBgigtwK5OGFgvulN6MT4mzruvQ8YdaZsjLX3m3Qj1OHNEG0HrdcPRg74fzS4
	odU/YhJ42AAmQR7rM5ZQwYIkyuzWX9ScVlxwRUcg6EMaQhlEIbCe4TE71KNQwRT6TR4DjMu5Lh4lg
	CuLr9JxcskJ/Jqd+mp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAjN-0000000ES8v-1Y7Q;
	Wed, 27 Aug 2025 07:38:05 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urAga-0000000ERTT-435N;
	Wed, 27 Aug 2025 07:35:13 +0000
Message-ID: <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org>
Date: Wed, 27 Aug 2025 00:35:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@outflux.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
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
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250827013444.GA2859318@ax162>
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

CgpPbiA4LzI2LzI1IDY6MzQgUE0sIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+IE9uIE1vbiwg
QXVnIDI1LCAyMDI1IGF0IDAzOjMxOjM0UE0gLTA0MDAsIEtlZXMgQ29vayB3cm90ZToKPj4gT24g
QXVndXN0IDI1LCAyMDI1IDE6MDA6MjIgUE0gRURULCBNaWd1ZWwgT2plZGEgPG1pZ3VlbC5vamVk
YS5zYW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOgo+Pj4gT24gTW9uLCBBdWcgMjUsIDIwMjUgYXQg
NTozNeKAr1BNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPiB3cm90ZToKPj4+Pgo+Pj4+IFll
YWgsIHRoYXQncyBhIGdvb2QgaWRlYS4gV2hhdCB0aGUgcmlnaHQgd2F5IHRvIGRvIHRoYXQ/Cj4+
Pj4KPj4+PiBjb25maWcgQ0ZJX0NMQU5HCj4+Pj4gICAgICAgICBib29sICJVc2UgQ2xhbmcncyBD
b250cm9sIEZsb3cgSW50ZWdyaXR5IChDRkkpIgo+Pj4+ICAgICAgICAgZGVwZW5kcyBvbiBBUkNI
X1NVUFBPUlRTX0NGSQo+Pj4+ICAgICAgICAgc2VsZWN0IENGSQo+Pj4+Cj4+Pj4gPwo+Pj4KPj4+
IEkgZG9uJ3QgcmVjYWxsIHdoYXQgaXMgdGhlIGlkaW9tYXRpYyBzb2x1dGlvbiBmb3IgcmVuYW1l
cywgYnV0IEkKPj4+IHJlbWVtYmVyIExpbnVzIHRhbGtpbmcgYWJvdXQgdGhpcyB0b3BpYyBhbmQg
YWJvdXQgYXZvaWRpbmcgbG9zaW5nIG9sZAo+Pj4gdmFsdWVzIGlmIHBvc3NpYmxlIChwZXJoYXBz
IGdldHRpbmcgYSBuZXcgcXVlc3Rpb24gaW4gYG9sZGNvbmZpZ2AgaXMKPj4+IE9LIGFzIGxvbmcg
YXMgdGhlIGBvbGRkZWZjb25maWdgIHJlc3BlY3RzIHRoZSBvbGQgdmFsdWUpLgo+Pj4KPj4+IEkg
dGhpbmsgeW91ciBzdWdnZXN0aW9uIGFib3ZlIHdpbGwgc3RpbGwgbWFrZSBpdCBhcHBlYXIgdHdp
Y2UgaW4KPj4+IGBtZW51Y29uZmlnYCAtLSB0aGVyZSBtYXkgYmUgYSB3YXkgdG8gcGxheSB3aXRo
IHZpc2liaWxpdHkgdG8gbWFrZSBpdAo+Pj4gYmV0dGVyLgo+Pj4KPj4+IEEgc2ltcGxlIHBvc3Np
YmlsaXR5IEkgY2FuIHRoaW5rIG9mIChhc3N1bWluZyBpdCB3b3JrcykgaXMgaGF2aW5nIHRoZQo+
Pj4gQ0ZJIHN5bWJvbCBmb3IgdGhlIHRpbWUgYmVpbmcgaW50cm9kdWNlZCBqdXN0IGFzIGEgYGRl
Zl9ib29sCj4+PiBDRklfQ0xBTkdgIGZvciBhIGZldyByZWxlYXNlcyBzbyB0aGF0IHBlb3BsZSBn
ZXQgdGhlIG5ldyBvbmUgaW4gdGhlaXIKPj4+IGNvbmZpZ3MuCj4+Cj4+IEFoLCBJIHRoaW5rIHRo
aXMgd29ya3M6Cj4+Cj4+IGNvbmZpZyBDRklfQ0xBTkcKPj4gICAgIGJvb2wKPj4KPj4gY29uZmln
IENGSQo+PiAgICAgYm9vbCAiLi4uLiIKPj4gICAgIGRlZmF1bHQgQ0ZJX0NMQU5HCj4+Cj4+IEkg
d2lsbCBhZGQgdGhhdCBmb3IgdjIuCj4gCj4gVGhhdCBkb2VzIG5vdCBhcHBlYXIgdG8gd29yayBm
b3IgbWUuIEkgYXBwbGllZAo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL0tjb25maWcgYi9hcmNoL0tj
b25maWcKPiBpbmRleCBjMjVhNDVkOWFhOTYuLjBkM2VkMDNjNzZjMiAxMDA2NDQKPiAtLS0gYS9h
cmNoL0tjb25maWcKPiArKysgYi9hcmNoL0tjb25maWcKPiBAQCAtODc2LDggKzg3NiwxMiBAQCBj
b25maWcgQVJDSF9TVVBQT1JUU19DRkkKPiAgY29uZmlnIEFSQ0hfVVNFU19DRklfVFJBUFMKPiAg
ICAgICAgIGJvb2wKPiAKPiArY29uZmlnIENGSV9DTEFORwo+ICsgICAgICAgYm9vbAo+ICsKPiAg
Y29uZmlnIENGSQo+ICAgICAgICAgYm9vbCAiVXNlIEtlcm5lbCBDb250cm9sIEZsb3cgSW50ZWdy
aXR5IChrQ0ZJKSIKPiArICAgICAgIGRlZmF1bHQgQ0ZJX0NMQU5HCj4gICAgICAgICBkZXBlbmRz
IG9uIEFSQ0hfU1VQUE9SVFNfQ0ZJCj4gICAgICAgICBkZXBlbmRzIG9uICQoY2Mtb3B0aW9uLC1m
c2FuaXRpemU9a2NmaSkKPiAgICAgICAgIGhlbHAKPiAKPiBvbiB0b3Agb2YgdGhpcyBzZXJpZXMg
YW5kCj4gCj4gICBDT05GSUdfQ0ZJX0NMQU5HPXkKPiAgICMgQ09ORklHX0NGSV9JQ0FMTF9OT1JN
QUxJWkVfSU5URUdFUlMgaXMgbm90IHNldAo+ICAgIyBDT05GSUdfQ0ZJX1BFUk1JU1NJVkUgaXMg
bm90IHNldAo+IAo+IGdldHMgdHVybmVkIGludG8KPiAKPiAgICMgQ09ORklHX0NGSSBpcyBub3Qg
c2V0Cj4gCj4gYWZ0ZXIgb2xkZGVmY29uZmlnLiBDT05GSUdfQ0ZJX0NMQU5HIGhhcyB0byBiZSB1
c2VyIHNlbGVjdGFibGUgd2l0aCBhCgpDb3VsZC9kaWQgeW91IHRlc3Qgd2l0aCAnb2xkY29uZmln
JyBpbnN0ZWFkPwoKb2xkZGVmY29uZmlnIGlzIGdvaW5nIHRvIHVzZSB0aGUgZGVmYXVsdCB2YWx1
ZSBmcm9tIHRoZSBLY29uZmlnIGZpbGUsCndoaWNoIGlmIENGSV9DTEFORyB3aGljaCBpcyB1bmRl
ZmluZWQvTm8vTm90IHNldC4KCm9sZGNvbmZpZyB3aWxsIHVzZSB0aGUgb2xkIHZhbHVlIGZyb20g
dGhlIC5jb25maWcgZmlsZS4KCgoKPiBwcm9tcHQgYnV0IHRoZSBvbmx5IHNvbHV0aW9uIEkgY2Fu
IHRoaW5rIG9mIGF0IHRoZSBtb21lbnQgcmVzdWx0cyBpbiBhCj4gZHVwbGljYXRlIHByb21wdCBm
b3IgQ2xhbmcuCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvS2NvbmZpZyBiL2FyY2gvS2NvbmZpZwo+
IGluZGV4IGMyNWE0NWQ5YWE5Ni4uOTNiZjliNDFhOWRlIDEwMDY0NAo+IC0tLSBhL2FyY2gvS2Nv
bmZpZwo+ICsrKyBiL2FyY2gvS2NvbmZpZwo+IEBAIC04NzYsOCArODc2LDE3IEBAIGNvbmZpZyBB
UkNIX1NVUFBPUlRTX0NGSQo+ICBjb25maWcgQVJDSF9VU0VTX0NGSV9UUkFQUwo+ICAgICAgICAg
Ym9vbAo+IAo+ICtjb25maWcgQ0ZJX0NMQU5HCj4gKyAgICAgICBib29sICJVc2UgS2VybmVsIENv
bnRyb2wgRmxvdyBJbnRlZ3JpdHkgKGtDRkkpIC0gVHJhbnNpdGlvbmFsIiBpZiBDQ19JU19DTEFO
Rwo+ICsgICAgICAgc2VsZWN0IENGSQo+ICsgICAgICAgZGVwZW5kcyBvbiBBUkNIX1NVUFBPUlRT
X0NGSQo+ICsgICAgICAgZGVwZW5kcyBvbiAkKGNjLW9wdGlvbiwtZnNhbml0aXplPWtjZmkpCj4g
KyAgICAgICBoZWxwCj4gKyAgICAgICAgIFRoaXMgaXMgYSB0cmFuc2l0aW9uYWwgc3ltYm9sIHRv
IENPTkZJR19DRkksIHNlZSBpdHMgaGVscCB0ZXh0Cj4gKyAgICAgICAgIGZvciBtb3JlIGluZm9y
bWF0aW9uLgo+ICsKPiAgY29uZmlnIENGSQo+IC0gICAgICAgYm9vbCAiVXNlIEtlcm5lbCBDb250
cm9sIEZsb3cgSW50ZWdyaXR5IChrQ0ZJKSIKPiArICAgICAgIGJvb2wgIlVzZSBLZXJuZWwgQ29u
dHJvbCBGbG93IEludGVncml0eSAoa0NGSSkiIGlmIENDX0lTX0dDQwo+ICAgICAgICAgZGVwZW5k
cyBvbiBBUkNIX1NVUFBPUlRTX0NGSQo+ICAgICAgICAgZGVwZW5kcyBvbiAkKGNjLW9wdGlvbiwt
ZnNhbml0aXplPWtjZmkpCj4gICAgICAgICBoZWxwCj4gCj4gTWF5YmUgdGhhdCBkb2VzIG5vdCBt
YXR0ZXIgZm9yIHRoZSBzYWtlIG9mIGtlZXBpbmcgdGhpbmdzIHdvcmtpbmc/Cj4gT3RoZXJ3aXNl
LCB3ZSBjb3VsZCBqdXN0IGtlZXAgdGhpbmdzIGFzIHRoZXkgYXJlIHdpdGggdGhlIHBhdGNoIHNl
dCBhbmQKPiBleHBlY3QgcGVvcGxlIHRvIGFjdHVhbGx5IHVzZSBvbGRjb25maWcgb3IgZGlmZiB0
aGUgcmVzdWx0cyBvZgo+IG9sZGRlZmNvbmZpZyAod2hpY2ggSSB0aGluayBpcyBnb29kIHByYWN0
aWNlIGFueXdheXMpLgo+IAo+IENoZWVycywKPiBOYXRoYW4KPiAKCi0tIAp+UmFuZHkKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
