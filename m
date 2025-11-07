Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8FCCCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 13:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oqb54RpKI5JchdUpdSmadcmkbWvKLhBVOa086azfcpc=; b=iUDB1xByDsi+CS
	xkVpipL3pAU2gU/J4sSKdiQTE7SN4EmBeEZbXSdwB4+QkR0GSq4zD8EslcjeN6OespKWfFxpeGGjm
	Lua9Em6itL7CMv16eKxY8bd5NksE0GZ1bl+5rGjzP2oz9N4NeZYcDBOx/sqlmW2BSBQTAZZsOEln2
	8cv8yse8pK3FFmzwujmn9W30d8BMGHcYKeX/+xE8bunrjWJtaAlZ6t5TnKoBfhELPd12RukMUyrbL
	KVj+3B8KHg+SPqcYS6mQOEHVdx2YO9OQ3vC3g7JZJHSjJutQJJqp6pkgXg2hOmh5QWXeyNOFMBx8+
	TOt5zFQho899DxUBGiAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMF2-0000000HNZG-2Hib;
	Fri, 07 Nov 2025 13:11:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMEz-0000000HNYP-1SwQ;
	Fri, 07 Nov 2025 13:10:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60B0B43ACD;
	Fri,  7 Nov 2025 13:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84724C19421;
	Fri,  7 Nov 2025 13:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762521056;
	bh=9yNpA1SE+6LUazhxfaVM0P+KTY2xAhLSO9vXTnuC8wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1pL5YGYFuG6hxkKpIelSp4d5IkSoL6mbBtbq2kEckqm8NKtXk0sV5yE4uZEwNt1q
	 ethdg2+fJxg4IQ7wEAJCWBsr3M4QlRFC7sKNaUDJXDpXrb0nfCOAbjbv0gQI6Bru4h
	 fydJwyetpw3hex5Orwn9R0FuIcYMuiERvBPHxKwFDX6pnNRSlfwUb95i792MUyccOa
	 O9tAxtas6uw8A1dp02fOK28qXtF/zEGda7ciCQzGk07YYgKSw4/Oe51Xdq2hvdAj40
	 vHZ4hzLyNf5jfkxq0b0gGTPJw99/B9LhRb33I8h/Xl0Ebl2LMSB+9pgDUEbMvSEIE1
	 q358Q5AwLVEig==
Date: Fri, 7 Nov 2025 13:10:47 +0000
From: Will Deacon <will@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org,
	aou@eecs.berkeley.edu, atish.patra@linux.dev,
	catalin.marinas@arm.com, dianders@chromium.org,
	johannes@sipsolutions.net, lihuafei1@huawei.com,
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org,
	mingo@kernel.org, nicolas.schier@linux.dev, palmer@dabbelt.com,
	paul.walmsley@sifive.com, suzuki.poulose@arm.com,
	thorsten.blum@linux.dev, wangjinchao600@gmail.com,
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [External] Re: [PATCH v4 1/2] watchdog: move arm64 watchdog_hld
 into common code
Message-ID: <aQ3v15yrm9JaWgrm@willie-the-truck>
References: <20251014031425.93284-1-cuiyunhui@bytedance.com>
 <20251014031425.93284-2-cuiyunhui@bytedance.com>
 <aQixsIQXTjYyhRVj@willie-the-truck>
 <CAEEQ3wk5Ru4-=4Ecnc6kQAAbR57806xxYTz0o1z4KfgZE6Cg6w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wk5Ru4-=4Ecnc6kQAAbR57806xxYTz0o1z4KfgZE6Cg6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_051058_068713_949BD2CF 
X-CRM114-Status: GOOD (  18.69  )
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

T24gRnJpLCBOb3YgMDcsIDIwMjUgYXQgMTA6NDI6MjVBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBPbiBNb24sIE5vdiAzLCAyMDI1IGF0IDk6NDTigK9QTSBXaWxsIERlYWNvbiA8d2lsbEBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIE9jdCAxNCwgMjAyNSBhdCAxMToxNDoy
NEFNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gPiBAQCAtMzA2LDMgKzMwNyw4NSBAQCB2
b2lkIF9faW5pdCBoYXJkbG9ja3VwX2NvbmZpZ19wZXJmX2V2ZW50KGNvbnN0IGNoYXIgKnN0cikK
PiA+ID4gICAgICAgd2RfaHdfYXR0ci50eXBlID0gUEVSRl9UWVBFX1JBVzsKPiA+ID4gICAgICAg
d2RfaHdfYXR0ci5jb25maWcgPSBjb25maWc7Cj4gPiA+ICB9Cj4gPiA+ICsKPiA+ID4gKyNpZmRl
ZiBDT05GSUdfV0FUQ0hET0dfUEVSRl9BREpVU1RfUEVSSU9ECj4gPiA+ICsvKgo+ID4gPiArICog
U2FmZSBtYXhpbXVtIENQVSBmcmVxdWVuY3kgaW4gY2FzZSBhIHBhcnRpY3VsYXIgcGxhdGZvcm0g
ZG9lc24ndCBpbXBsZW1lbnQKPiA+ID4gKyAqIGNwdWZyZXEgZHJpdmVyLiBBbHRob3VnaCwgYXJj
aGl0ZWN0dXJlIGRvZXNuJ3QgcHV0IGFueSByZXN0cmljdGlvbnMgb24KPiA+ID4gKyAqIG1heGlt
dW0gZnJlcXVlbmN5IGJ1dCA1IEdIeiBzZWVtcyB0byBiZSBzYWZlIG1heGltdW0gZ2l2ZW4gdGhl
IGF2YWlsYWJsZQo+ID4gPiArICogQ1BVcyBpbiB0aGUgbWFya2V0IHdoaWNoIGFyZSBjbG9ja2Vk
IG11Y2ggbGVzcyB0aGFuIDUgR0h6LiBPbiB0aGUgb3RoZXIKPiA+ID4gKyAqIGhhbmQsIHdlIGNh
bid0IG1ha2UgaXQgbXVjaCBoaWdoZXIgYXMgaXQgd291bGQgbGVhZCB0byBhIGxhcmdlIGhhcmQt
bG9ja3VwCj4gPiA+ICsgKiBkZXRlY3Rpb24gdGltZW91dCBvbiBwYXJ0cyB3aGljaCBhcmUgcnVu
bmluZyBzbG93ZXIgKGVnLiAxR0h6IG9uCj4gPiA+ICsgKiBEZXZlbG9wZXJib3gpIGFuZCBkb2Vz
bid0IHBvc3Nlc3MgYSBjcHVmcmVxIGRyaXZlci4KPiA+ID4gKyAqLwo+ID4gPiArI2RlZmluZSBT
QUZFX01BWF9DUFVfRlJFUSAgICA1MDAwMDAwMDAwVUwgLy8gNSBHSHoKPiA+ID4gK19fd2VhayB1
NjQgaHdfbm1pX2dldF9zYW1wbGVfcGVyaW9kKGludCB3YXRjaGRvZ190aHJlc2gpCj4gPiA+ICt7
Cj4gPiA+ICsgICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4gPiA+
ICsgICAgIHVuc2lnbmVkIGxvbmcgbWF4X2NwdV9mcmVxOwo+ID4gPiArCj4gPiA+ICsgICAgIG1h
eF9jcHVfZnJlcSA9IGNwdWZyZXFfZ2V0X2h3X21heF9mcmVxKGNwdSkgKiAxMDAwVUw7Cj4gPiA+
ICsgICAgIGlmICghbWF4X2NwdV9mcmVxKQo+ID4gPiArICAgICAgICAgICAgIG1heF9jcHVfZnJl
cSA9IFNBRkVfTUFYX0NQVV9GUkVROwo+ID4gPiArCj4gPiA+ICsgICAgIHJldHVybiAodTY0KW1h
eF9jcHVfZnJlcSAqIHdhdGNoZG9nX3RocmVzaDsKPiA+ID4gK30KPiA+Cj4gPiBXaHkgZG9lcyB0
aGlzIGZ1bmN0aW9uIGJlY29tZSBfX3dlYWs/IE5laXRoZXIgYXJtNjQgbm9yIHJpc2N2IG92ZXJy
aWRlCj4gPiBpdCBhZmFpY3QuCj4gCj4gV291bGQgeW91IHNheSB0aGVyZeKAmXMgYW55IHBhcnRp
Y3VsYXIgaXNzdWUgaGVyZT8gSWYgc29tZSBhcmNoaXRlY3R1cmVzCj4gbWlnaHQgbmVlZCB0byBv
dmVycmlkZSB0aGUgaHdfbm1pX2dldF9zYW1wbGVfcGVyaW9kKCkgZnVuY3Rpb24gbGF0ZXIKPiBv
biwgd291bGRu4oCZdCBfX3dlYWsgYmUgYSBtb3JlIHJlYXNvbmFibGUgY2hvaWNlPwoKX193ZWFr
IGlzIHByZXR0eSBicml0dGxlIChpdCBjYW4gZGVwZW5kIG9uIGxpbmsgb3JkZXIgaWYgeW91IGhh
dmUgbXVsdGlwbGUKdGFyZ2V0cykgYW5kIEkgc3VzcGVjdCBpdCBwcmV2ZW50cyBpbmxpbmluZyB3
aGVuIExUTyBpc24ndCBlbmFibGVkLiBJdCdzCmNsZWFuZXIgYW5kIG1vcmUgcm9idXN0IGZvciBh
cmNoaXRlY3R1cmVzIHRvIHByb3ZpZGUgdGhlaXIgaG9va3MgYnkKI2RlZmluaW5nIHRoZSBzeW1i
b2wsIGFzIGlzIGRvbmUgY29tbW9ubHkgaW4gb3RoZXIgcGFydHMgb2YgdGhlIGtlcm5lbC4KCkJ1
dCBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgaXQncyBjb21wbGV0ZWx5IHVubmVjZXNzYXJ5IGJl
Y2F1c2UgdGhlcmUKaXNuJ3QgYW4gYXJjaGl0ZWN0dXJhbCBvdmVycmlkZSBhbmQgc28gdGhpcyBm
dW5jdGlvbiBzaG91bGQgc2ltcGx5IGJlCnN0YXRpYy4KCldpbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
