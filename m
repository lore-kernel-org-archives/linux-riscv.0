Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7285EC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVYQ4Dy93X7Jd5zXRWBek4fD4POu86ZCI2ua0gKfKms=; b=PtmTflbZsLEjjy
	lH22cw0HCigM87ZwFuDH3frb7pPvC++d0jOsOfac+wY2r0lI8whEWlJy8Krc3nYsZe9fV8kvPak2b
	+DgzJgF/7GXsdsEIaUaNScyaB7h7dgOjL6P7wKW6SafafA9PCq7k23dnNPn5WUPMdht1blQ32XQM+
	6xUDlGtx4rRKQKcbq2ZaYIMNK5GC9qYIdzu07+N4nqvmW4raFrcNTdjOSXqA7o9aKsnaljQw3oucT
	RPVlrNFm1mtDINLyI1Jk/WhVRlLnUJxUu81+qDfsc+nprZqelO635VgyQnHek+94/TgbQIml5xit2
	BXOYebg+N5F96nQypX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5q6-0000000GG9R-2MRK;
	Wed, 17 Apr 2024 14:00:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx5pt-0000000GG4D-3YK9
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 14:00:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6F9F339;
	Wed, 17 Apr 2024 07:00:56 -0700 (PDT)
Received: from [192.168.20.58] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 598433F738;
	Wed, 17 Apr 2024 07:00:25 -0700 (PDT)
Message-ID: <260d9932-bf51-43ac-8490-99c39f5e9258@arm.com>
Date: Wed, 17 Apr 2024 09:00:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH v3 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
Content-Language: en-US
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com,
 james.morse@arm.com, jhugo@codeaurora.org, john.garry@huawei.com,
 Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, sudeep.holla@arm.com,
 tiantao6@huawei.com
References: <20240416031438.7637-1-cuiyunhui@bytedance.com>
 <20240416031438.7637-2-cuiyunhui@bytedance.com>
 <9f36bedd-1a68-43a9-826d-ce56caf01c52@arm.com>
 <CAEEQ3w=W+xLGP3WsyAQmRNaHm1xVRtqcGJ+t0TnZvJdCTR4v6w@mail.gmail.com>
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <CAEEQ3w=W+xLGP3WsyAQmRNaHm1xVRtqcGJ+t0TnZvJdCTR4v6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_070030_056111_9A7DFF54 
X-CRM114-Status: GOOD (  18.50  )
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

SGksCgpPbiA0LzE2LzI0IDIyOjE1LCB5dW5odWkgY3VpIHdyb3RlOgo+IEhpIEplcmVteSwKPiAK
PiBPbiBXZWQsIEFwciAxNywgMjAyNCBhdCA0OjA04oCvQU0gSmVyZW15IExpbnRvbiA8amVyZW15
LmxpbnRvbkBhcm0uY29tPiB3cm90ZToKPj4KPj4gSGksCj4+Cj4+Cj4+IE9uIDQvMTUvMjQgMjI6
MTQsIFl1bmh1aSBDdWkgd3JvdGU6Cj4+PiBCZWZvcmUgY2FjaGVpbmZvIGNhbiBiZSBidWlsdCBj
b3JyZWN0bHksIHdlIG5lZWQgdG8gaW5pdGlhbGl6ZSBsZXZlbAo+Pj4gYW5kIHR5cGUuIFNpbmNl
IFJTSUMtViBjdXJyZW50bHkgZG9lcyBub3QgaGF2ZSBhIHJlZ2lzdGVyIGdyb3VwIHRoYXQKPj4+
IGRlc2NyaWJlcyBjYWNoZS1yZWxhdGVkIGF0dHJpYnV0ZXMgbGlrZSBBUk02NCwgd2UgY2Fubm90
IG9idGFpbiB0aGVtCj4+PiBkaXJlY3RseSwgc28gbm93IHdlIG9idGFpbiBjYWNoZSBsZWF2ZXMg
ZnJvbSB0aGUgQUNQSSBQUFRUIHRhYmxlCj4+PiAoYWNwaV9nZXRfY2FjaGVfaW5mbygpKSBhbmQg
c2V0IHRoZSBjYWNoZSB0eXBlIHRocm91Z2ggc3BsaXRfbGV2ZWxzLgo+Pj4KPj4+IFN1Z2dlc3Rl
ZC1ieTogSmVyZW15IExpbnRvbiA8amVyZW15LmxpbnRvbkBhcm0uY29tPgo+Pj4gU3VnZ2VzdGVk
LWJ5OiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xsYUBhcm0uY29tPgo+Pj4gU2lnbmVkLW9mZi1i
eTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4+PiAtLS0KPj4+ICAgIGFy
Y2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPj4+
ICAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVp
bmZvLmMKPj4+IGluZGV4IDMwYTY4NzgyODdhZC4uZGM1ZmI3MDM2MmYxIDEwMDY0NAo+Pj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2NhY2hlaW5mby5jCj4+PiBAQCAtNiw2ICs2LDcgQEAKPj4+ICAgICNpbmNsdWRlIDxsaW51
eC9jcHUuaD4KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+Pj4gICAgI2luY2x1ZGUgPGFz
bS9jYWNoZWluZm8uaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvYWNwaS5oPgo+Pj4KPj4+ICAgIHN0
YXRpYyBzdHJ1Y3QgcmlzY3ZfY2FjaGVpbmZvX29wcyAqcnZfY2FjaGVfb3BzOwo+Pj4KPj4+IEBA
IC03OCw2ICs3OSwyNSBAQCBpbnQgcG9wdWxhdGVfY2FjaGVfbGVhdmVzKHVuc2lnbmVkIGludCBj
cHUpCj4+PiAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwcmV2ID0gTlVMTDsKPj4+ICAgICAg
ICBpbnQgbGV2ZWxzID0gMSwgbGV2ZWwgPSAxOwo+Pj4KPj4+ICsgICAgIGlmICghYWNwaV9kaXNh
YmxlZCkgewo+Pj4gKyAgICAgICAgICAgICBpbnQgcmV0LCBpZHgsIGZ3X2xldmVscywgc3BsaXRf
bGV2ZWxzOwo+Pj4gKwo+Pj4gKyAgICAgICAgICAgICByZXQgPSBhY3BpX2dldF9jYWNoZV9pbmZv
KGNwdSwgJmZ3X2xldmVscywgJnNwbGl0X2xldmVscyk7Cj4+PiArICAgICAgICAgICAgIGlmIChy
ZXQpCj4+PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+ICsKPj4+ICsgICAg
ICAgICAgICAgZm9yIChpZHggPSAwOyBsZXZlbCA8PSB0aGlzX2NwdV9jaS0+bnVtX2xldmVscyAm
Jgo+Pj4gKyAgICAgICAgICAgICAgICAgIGlkeCA8IHRoaXNfY3B1X2NpLT5udW1fbGVhdmVzOyBp
ZHgrKywgbGV2ZWwrKykgewo+Pgo+PiBBRkFJSyB0aGUgcHVycG9zZSBvZiBpZHggaGVyZSBpdCB0
byBhc3N1cmUgdGhhdCB0aGUgbnVtYmVyIG9mIGNhY2hlCj4+IGxlYXZlcyBpcyBub3Qgb3ZlcmZs
b3dpbmcuIEJ1dCByaWdodCBiZWxvdyB3ZSBhcmUgdXRpbGl6aW5nIHR3byBvZiB0aGVtCj4+IGF0
IG9uY2UsIHNvIHRoaXMgY2hlY2sgaXNuJ3QgY29ycmVjdC4gT1RPSCwgc2luY2UgaXRzIGFsbG9j
YXRlZCBhcwo+PiBsZXZlbHMgKyBzcGxpdF9sZXZlbHMgSSBkb24ndCB0aGluayBpdHMgYWN0dWFs
bHkgcG9zc2libGUgZm9yIHRoaXMgdG8KPj4gY2F1c2UgYSBwcm9ibGVtLiBNaWdodCBiZSB3b3J0
aHdoaWxlIHRvIGp1c3QgaG9pc3QgaXQgYmVmb3JlIHRoZSBsb29wCj4+IGFuZCByZXZhbGlkYXRl
IHRoZSB0b3RhbCBsZWF2ZXMgYWJvdXQgdG8gYmUgdXRpbGl6ZWQuCj4+CgpJIHRoaW5rIEkgd2Fz
IHN1Z2dlc3Rpbmcgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZjoKCkJVR19PTigoc3BsaXRf
bGV2ZWxzID4gZndfbGV2ZWxzKSB8fCAoc3BsaXRfbGV2ZWxzICsgZndfbGV2ZWxzID4gCnRoaXNf
Y3B1X2NpLT5udW1fbGVhdmVzKSk7CgpUaGVuIHJlbW92aW5nIGlkeCBlbnRpcmVseS4gZXg6Cgpm
b3IgKDsgbGV2ZWwgPD0gdGhpc19jcHVfY2ktPm51bV9sZXZlbHM7IGxldmVsKyspCi4uLgo+IAo+
IERvIHlvdSBtZWFuIHRvIG1vZGlmeSB0aGUgbG9naWMgYXMgZm9sbG93cyB0byBtYWtlIGl0IG1v
cmUgY29tcGxldGU/ClN1cmUgdGhhdCBpcyBvbmUgd2F5IHRvIGRvIGl0LCBidXQgdGhlbiB5b3Ug
bmVlZCB0byBwcm9iYWJseSByZXBlYXQgdGhlIAppZHggY2hlY2s6Cj4gZm9yIChpZHggPSAwOyBs
ZXZlbCA8PSB0aGlzX2NwdV9jaS0+bnVtX2xldmVscyAmJgo+ICAgICAgICBpZHggPCB0aGlzX2Nw
dV9jaS0+bnVtX2xlYXZlczsgbGV2ZWwrKykgewo+ICAgICAgICAgIGlmIChsZXZlbCA8PSBzcGxp
dF9sZXZlbHMpIHsKPiAgICAgICAgICAgICAgICAgY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBD
QUNIRV9UWVBFX0RBVEEsIGxldmVsKTsKPiAgICAgICAgICAgICAgICAgaWR4Kys7CmlmIChpZHgg
Pj0gdGhpc19jcHVfY2ktPm51bV9sZWF2ZXMpIGJyZWFrOwo+ICAgICAgICAgICAgICAgICBjaV9s
ZWFmX2luaXQodGhpc19sZWFmKyssIENBQ0hFX1RZUEVfSU5TVCwgbGV2ZWwpOwo+ICAgICAgICAg
ICAgICAgICBpZHgrKzsKPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgIGNpX2xl
YWZfaW5pdCh0aGlzX2xlYWYrKywgQ0FDSEVfVFlQRV9VTklGSUVELCBsZXZlbCk7Cj4gICAgICAg
ICAgICAgICAgIGlkeCsrOwo+ICAgICAgICB9Cj4gfQoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
