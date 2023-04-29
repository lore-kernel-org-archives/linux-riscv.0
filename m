Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD0DC77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 17:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uu9gE7Jx/i58seYSuHv9K41WmilZDQ/GZzBaOruwk0c=; b=RLMnbGHJctOHY7
	eove/9lbLJ38NNoAbldthWWZq+ENkHYIkllR+JbUZDipJwkuAlEbR8fOov7xV5/FwkeVwjdbiZZYu
	p6DNqFU8NHfk8yKln6XSwv0X1L/eHn14UbEKgYPg5rMg5SLzqX2jLcF/IhIxFcTLglLgRhFqTP7Pw
	4KKK7BsKxMT10EwNdqLJ2jTAQS4l0pI3uZrgQDo0IcQvOuYgIuMLp8tFu5Sn2L5G0WKx456zYgogy
	ypnOR5jQBbzCklbE4lSmHgXKBoYEYHawWVhw+s/N2JtbFYqQRNGts7KCXiCotEgQRk90TwiSmd6mL
	8kdtjIVHBnmKhLyZpahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psoqR-00CyK9-2t;
	Sat, 29 Apr 2023 17:58:51 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1psoqP-00CyJM-1F;
	Sat, 29 Apr 2023 17:58:49 +0000
Message-ID: <37e6b325-44e4-8e65-68e3-eab2943018ac@infradead.org>
Date: Sat, 29 Apr 2023 10:58:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] RISC-V: fix sifive and thead section mismatches in
 errata
Content-Language: en-US
To: Evan Green <evan@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
References: <20230429155247.12131-1-rdunlap@infradead.org>
 <CALs-HsuG3EFBs60sgiMcPHoE1dF7mhi3GKt=AWvRPaUHAfA88Q@mail.gmail.com>
 <20230429-outboard-hypocrite-983e977103d2@spud>
 <CALs-HstrR3Cm3jQKt6dmfYiRRVkAVibAZDtFo0wmXz4LEvRf_A@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CALs-HstrR3Cm3jQKt6dmfYiRRVkAVibAZDtFo0wmXz4LEvRf_A@mail.gmail.com>
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

CgpPbiA0LzI5LzIzIDEwOjQ4LCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFNhdCwgQXByIDI5LCAy
MDIzIGF0IDEwOjI04oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToK
Pj4KPj4gT24gU2F0LCBBcHIgMjksIDIwMjMgYXQgMTA6MjE6MzlBTSAtMDcwMCwgRXZhbiBHcmVl
biB3cm90ZToKPj4+IE9uIFNhdCwgQXByIDI5LCAyMDIzIGF0IDg6NTLigK9BTSBSYW5keSBEdW5s
YXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4+Pj4KPj4+PiBXaGVuIENPTkZJR19N
T0RVTEVTIGlzIHNldCwgX19pbml0X29yX21vZHVsZSBiZWNvbWVzIDxlbXB0eT4sIGJ1dCB3aGVu
Cj4+Pj4gQ09ORklHX01PRFVMRVMgaXMgbm90IHNldCwgX19pbml0X29yX21vZHVsZSBiZWNvbWVz
IF9faW5pdC4KPj4+PiBJbiB0aGUgbGF0dGVyIGNhc2UsIGl0IGNhdXNlcyBzZWN0aW9uIG1pc21h
dGNoIHdhcm5pbmdzOgo+Pj4+Cj4+Pj4gV0FSTklORzogbW9kcG9zdDogdm1saW51eC5vOiBzZWN0
aW9uIG1pc21hdGNoIGluIHJlZmVyZW5jZTogcmlzY3ZfZmlsbF9jcHVfbWZyX2luZm8gKHNlY3Rp
b246IC50ZXh0KSAtPiBzaWZpdmVfZXJyYXRhX3BhdGNoX2Z1bmMgKHNlY3Rpb246IC5pbml0LnRl
eHQpCj4+Pj4gV0FSTklORzogbW9kcG9zdDogdm1saW51eC5vOiBzZWN0aW9uIG1pc21hdGNoIGlu
IHJlZmVyZW5jZTogcmlzY3ZfZmlsbF9jcHVfbWZyX2luZm8gKHNlY3Rpb246IC50ZXh0KSAtPiB0
aGVhZF9lcnJhdGFfcGF0Y2hfZnVuYyAoc2VjdGlvbjogLmluaXQudGV4dCkKPj4+Pgo+Pj4+IEZp
eGVzOiBiYjNmODk0ODdmZDkgKCJSSVNDLVY6IGh3cHJvYmU6IFJlbW92ZSBfX2luaXQgb24gcHJv
YmVfdmVuZG9yX2ZlYXR1cmVzKCkiKQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8
cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+Pj4+IENjOiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250
ZWNoLmRlPgo+Pj4+IENjOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+
Cj4+Pj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4+Pj4gQ2M6IEFs
YmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1Pgo+Pj4+IENjOiBsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCj4+Pj4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4K
Pj4+PiBDYzogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Cj4+Pj4gLS0tCj4+Pgo+Pj4g
VGhhbmtzLCBSYW5keS4gSSdtIGNvbmZ1c2VkIGF0IGhvdyBJIGRpZG4ndCBzZWUgdGhhdCB3aGVu
IEkgbWFkZSB0aGUKPj4+IG9yaWdpbmFsIGZpeC4gSSBmZWVsIGxpa2UgcmVwcm8gb2YgdGhlc2Ug
c2VjdGlvbiBtaXNtYXRjaCBlcnJvcnMKPj4+IGRlcGVuZCBvbiBzb21lIG90aGVyIGZhY3RvciBJ
J20gbm90IHVuZGVyc3RhbmRpbmcuIEluIGFueSBjYXNlOgo+Pgo+PiBQZXJoYXBzIHlvdSBoYWQg
YSBjdXQtZG93biBjb25maWcgdGhhdCBkaWQgbm90IGVuYWJsZSBlaXRoZXIgb2YgdGhlCj4+IHJl
bGV2YW50IEFSQ0hfIG9wdGlvbnMgdG8gZ2V0IHRob3NlIGVycmF0YSBjb21waWxlZD8KPiAKPiBJ
dCB3YXMgd2VpcmQsIG15IG9yaWdpbmFsICJmaXgiICh0aGUgb25lIGxpc3RlZCBpbiB0aGlzIEZp
eGVzIHRhZykgd2FzCj4gbmVlZGVkIGJlY2F1c2Ugd2hpbGUgdGhlIGh3cHJvYmUgc2VyaWVzIHdh
cyBjbGVhbiBvbiBQYWxtZXIncyBicmFuY2gsCj4gaXQgZ2VuZXJhdGVkIGEgInNlY3Rpb24gbWlz
bWF0Y2giIG9uIGxpbnV4LW5leHQuIEFzIG5vdGVkIGhlcmUsIGl0IHdhcwo+IG9ubHkgd2l0aCAh
Q09ORklHX01PRFVMRVMsIHNvIEkgZXhwbGljaXRseSByZW1lbWJlciBnZW5lcmF0aW5nIHRoYXQK
PiBjb25maWcgYW5kIGNoZWNraW5nIGl0IG9uIGxpbnV4LW5leHQgdG8gZ2VuZXJhdGUgdGhpcyAi
Zml4IiwgYW5kIGl0Cj4gY2FtZSBvdXQgY2xlYW4uIEl0J3MgbGlrZSB0aGUgcm9ib3RzIGFyZSBn
ZXR0aW5nIHNtYXJ0ZXIuCj4gLUV2YW4KCkkgb2JzZXJ2ZWQgdGhlIHByb2JsZW0gaW4gOCBvdXQg
b2YgMjAgcmFuZGNvbmZpZyBidWlsZHMsCnVzaW5nIGxpbnV4LW5leHQgMjAyMzA0MjcuCgotLSAK
flJhbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
