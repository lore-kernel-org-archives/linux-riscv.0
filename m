Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6931C04FF8
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 13:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P51hIez6nKZPppVqfVHhTNZLS2+siRfmlI7qpTI2ztk=; b=fpNVolzdcLQeF1
	W2NiC6ttSk1ERlVEypgUux5DTaySrrplRRwIGNCer1CoBHJZtmaKhuRvytTgFxj06awhJu5E/F+yZ
	In7XSPNYSOne4DJ7qkuPBum5R5MaX3I91rL6xfCS3pcPkNJHkkA13hJ2fSNgpu7iMYeK5BrgxT3U7
	Ssql2og5hK6ZfQFyyjyUt0NwNY/g1Z6SjqlZ+RP54SvnM6zFbWrUE2d78YEjmHk/DSvZkNm9uQJY7
	PfGIGS/p9BoihhzZVq5Y32vxGwJR1U1i47rtVlK4cQ7sdtAvc7rFb4IqUfxp1lQxbcJhWgUdoO7Qm
	n7WApSbAbO/5SwJ1k8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMHe-00000008Rau-1MCB;
	Mon, 15 Apr 2024 13:22:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMHa-00000008RYU-3gHf
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 13:22:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E47FCDA7;
	Mon, 15 Apr 2024 06:22:27 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D2AF3F7CE;
	Mon, 15 Apr 2024 06:21:57 -0700 (PDT)
Date: Mon, 15 Apr 2024 14:21:54 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, bhelgaas@google.com,
	james.morse@arm.com, jhugo@codeaurora.org, jeremy.linton@arm.com,
	john.garry@huawei.com, Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com, tiantao6@huawei.com
Subject: Re: [External] Re: [PATCH v2 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
Message-ID: <Zh0p8iJe05d71yZK@bogus>
References: <20240414025826.64025-1-cuiyunhui@bytedance.com>
 <20240414025826.64025-2-cuiyunhui@bytedance.com>
 <Zhzo_gWFiURs_geD@bogus>
 <CAEEQ3wkzvOpahzPuoD7=aMG3srjdyCA21tnh-j9PvY3Qerk_hg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wkzvOpahzPuoD7=aMG3srjdyCA21tnh-j9PvY3Qerk_hg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_062203_039873_01D8DF00 
X-CRM114-Status: GOOD (  28.49  )
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

T24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgMDg6MDM6MzhQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBTdWRlZXAsCj4gCj4gT24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgNDo0NeKAr1BNIFN1
ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFN1biwg
QXByIDE0LCAyMDI0IGF0IDEwOjU4OjI1QU0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiA+
IEJlZm9yZSBjYWNoZWluZm8gY2FuIGJlIGJ1aWx0IGNvcnJlY3RseSwgd2UgbmVlZCB0byBpbml0
aWFsaXplIGxldmVsCj4gPiA+IGFuZCB0eXBlLiBTaW5jZSBSU0lDLVYgY3VycmVudGx5IGRvZXMg
bm90IGhhdmUgYSByZWdpc3RlciBncm91cCB0aGF0Cj4gPiA+IGRlc2NyaWJlcyBjYWNoZS1yZWxh
dGVkIGF0dHJpYnV0ZXMgbGlrZSBBUk02NCwgd2UgY2Fubm90IG9idGFpbiB0aGVtCj4gPiA+IGRp
cmVjdGx5LCBzbyBub3cgd2Ugb2J0YWluIGNhY2hlIGxlYXZlcyBmcm9tIHRoZSBBQ1BJIFBQVFQg
dGFibGUKPiA+ID4gKGFjcGlfZ2V0X2NhY2hlX2luZm8oKSkgYW5kIHNldCB0aGUgY2FjaGUgdHlw
ZSB0aHJvdWdoIHNwbGl0X2xldmVscy4KPiA+ID4KPiA+ID4gU3VnZ2VzdGVkLWJ5OiBKZXJlbXkg
TGludG9uIDxqZXJlbXkubGludG9uQGFybS5jb20+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogU3VkZWVw
IEhvbGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVp
IEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNj
di9rZXJuZWwvY2FjaGVpbmZvLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVp
bmZvLmMKPiA+ID4gaW5kZXggMzBhNjg3ODI4N2FkLi5lY2U5MmFhNDA0ZTMgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCj4gPiA+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NhY2hlaW5mby5jCj4gPiA+IEBAIC02LDYgKzYsNyBAQAo+ID4gPiAgI2luY2x1
ZGUgPGxpbnV4L2NwdS5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gPiA+ICAjaW5j
bHVkZSA8YXNtL2NhY2hlaW5mby5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPiA+
ID4KPiA+ID4gIHN0YXRpYyBzdHJ1Y3QgcmlzY3ZfY2FjaGVpbmZvX29wcyAqcnZfY2FjaGVfb3Bz
Owo+ID4gPgo+ID4gPiBAQCAtNzgsNiArNzksMjggQEAgaW50IHBvcHVsYXRlX2NhY2hlX2xlYXZl
cyh1bnNpZ25lZCBpbnQgY3B1KQo+ID4gPiAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnByZXYg
PSBOVUxMOwo+ID4gPiAgICAgICBpbnQgbGV2ZWxzID0gMSwgbGV2ZWwgPSAxOwo+ID4gPgo+ID4g
PiArICAgICBpZiAoIWFjcGlfZGlzYWJsZWQpIHsKPiA+ID4gKyAgICAgICAgICAgICBpbnQgcmV0
LCBpZHgsIGZ3X2xldmVscywgc3BsaXRfbGV2ZWxzOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAg
ICAgcmV0ID0gYWNwaV9nZXRfY2FjaGVfaW5mbyhjcHUsICZmd19sZXZlbHMsICZzcGxpdF9sZXZl
bHMpOwo+ID4gPiArICAgICAgICAgICAgIGlmIChyZXQpCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gcmV0Owo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgLyogbXVzdCBiZSBz
ZXQsIHNvIHdlIGNhbiBkcm9wIG51bV9sZWF2ZXMgYXNzaWdubWVudCBiZWxvdyAqLwo+ID4KPiA+
IEkgaW50ZW50aW9uYWxseSBhZGRlZCB0aGlzIGFib3ZlIGNvbW1lbnQgdG8gY2hlY2sgYW5kIGRy
b3AgdGhlIGJlbG93IHN0YXRlbWVudAo+ID4gaWYgaXQgaXMgYWxyZWFkeSBzZXQuIFBsZWFzZSBj
aGVjayBpZiB0aGUgdmFsdWUgaXMgYWxyZWFkeSBzZXQgd2hlbiB3ZSBjYWxsCj4gPiBpbnRvIHRo
aXMgZnVuY3Rpb24od2hpY2ggSSB0aGluayBpcyB0aGUgY2FzZSkuCj4gPgo+ID4gPiArICAgICAg
ICAgICAgIHRoaXNfY3B1X2NpLT5udW1fbGVhdmVzID0gZndfbGV2ZWxzICsgc3BsaXRfbGV2ZWxz
Owo+IAo+IFVoLGdvdCBpdC4gSSB1bmRlcnN0YW5kIHRoYXQgdGhlcmUgaXMgbm8gbmVlZCB0byBh
ZGQgdGhpcyBsaW5lOgo+ICJ0aGlzX2NwdV9jaS0+bnVtX2xlYXZlcyA9IGZ3X2xldmVscyArIHNw
bGl0X2xldmVsczsgIiAsIGJlY2F1c2UgaW4KPiB0aGUgTWFzdGVyIGNvcmUgZmlyc3QgaXQgd2ls
bDoKPiBzbXBfcHJlcGFyZV9jcHVzCj4gICAgICAtPmluaXRfY3B1X3RvcG9sb2d5Cj4gICAgICAg
ICAgIC0+Zm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkgewo+ICAgICAgICAgICAgICAgICAgZmV0
Y2hfY2FjaGVfaW5mbyhjcHUpOyAvL251bV9sZWF2ZXMgYW5kIG51bV9sZXZlbHMgd2lsbCBiZSBz
ZXQKPiBUaGVuIHN0b3JlX2NwdV90b3BvbG9neS0+dXBkYXRlX3NpYmxpbmdzX21hc2tzLT5kZXRl
Y3RfY2FjaGVfYXR0cmlidXRlcy0+cG9wdWxhdGVfY2FjaGVfbGVhdmVzKCkuCj4gCj4gU2xhdmUg
Y29yZSB3aWxsIGZvbGxvdyB0aGUgbG9naWMgb2Ygc21wX2NhbGxpbi0+c3RvcmVfY3B1X3RvcG9s
b2d5KCkuCj4gSXQncyB0aGUgc2FtZSBhZnRlciBJIHRlc3RlZCBpdCwgc28gSSBwbGFuIHRvIHJl
bW92ZSB0aGF0IGxpbmUgYW5kCj4gdXBkYXRlIFYzLCB3aGF0IGRvIHlvdSB0aGluaz8KPgoKQ29y
cmVjdCwganVzdCBkcm9wIHRoZSBzdGF0ZW1lbnQgdXBkYXRpbmcgInRoaXNfY3B1X2NpLT5udW1f
bGVhdmVzIi4KCi0tIApSZWdhcmRzLApTdWRlZXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
