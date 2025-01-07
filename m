Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828A2E77197
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 14:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNxT8nfbUuW0R4OXfTt33D12/sqgy72+EdsW9WCCdQc=; b=l258yEw9kTehAZ
	RAEzGq9APXz+xjTS+o4/tUb7NdiBjx59mAMPzajsIsgY+/Dhv3WduMXwkCqR99a3Vdbt3vDj8+G73
	txVPn/IfoIZwUkFu9foapHNiZX1DS7QF5v4jvpZZtulGZ3TMImecZDayg4Re3nexhnY2i18lcqTqJ
	HtpnzF5rePVigoaTUbNRzt6AmtLXPb9CucjhGvQ2cNkPTBCR94tV3+Grk4riS1rCfJl++mQETUNu9
	J4Ukk0I3a1qcL3xnNWUNPc/AnmksRdV6c+hg8g9ccOIUqDBqkTNvEbCbJdqJ/YI40p+JglnzMsnpg
	aRriorYni/DyuIWgw0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAVG-00000005BjE-3JM1;
	Tue, 07 Jan 2025 14:24:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAOg-000000059f1-0kcZ;
	Tue, 07 Jan 2025 14:17:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F4761424;
	Tue,  7 Jan 2025 06:17:57 -0800 (PST)
Received: from [10.44.160.93] (e126510-lin.lund.arm.com [10.44.160.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91DCA3F59E;
	Tue,  7 Jan 2025 06:17:20 -0800 (PST)
Message-ID: <f1f98c3d-2db0-455f-80e7-b7d4c3154de6@arm.com>
Date: Tue, 7 Jan 2025 15:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 peterz@infradead.org, akpm@linux-foundation.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
 <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
 <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
 <de8756aa-dbf7-4f6f-91f0-934270397192@bytedance.com>
 <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
 <07e0c05f-cb69-4263-885d-6d20d4442152@bytedance.com>
 <4a0b5edb-6fc7-4df4-93d9-ca834e6a760b@arm.com>
 <fca0d7de-b563-4d11-9ed8-c6b8290c4cf9@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <fca0d7de-b563-4d11-9ed8-c6b8290c4cf9@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_061730_303771_13E45E84 
X-CRM114-Status: GOOD (  18.14  )
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

T24gMDcvMDEvMjAyNSAxMzozMSwgUWkgWmhlbmcgd3JvdGU6Cj4gT24gMjAyNS8xLzcgMTk6NTgs
IEtldmluIEJyb2Rza3kgd3JvdGU6Cj4+IE9uIDA3LzAxLzIwMjUgMTE6NTEsIFFpIFpoZW5nIHdy
b3RlOgo+Pj4gWy4uLl0KPj4+Cj4+PiBBdXRob3I6IFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hAYnl0
ZWRhbmNlLmNvbT4KPj4+IERhdGU6wqDCoCBGcmkgRGVjIDEzIDE3OjEzOjQ4IDIwMjQgKzA4MDAK
Pj4+Cj4+PiDCoMKgwqDCoCBtbTogcGd0YWJsZTogY29tcGxldGVseSBtb3ZlIHBhZ2V0YWJsZV9k
dG9yKCkgdG8gZ2VuZXJpYwo+Pj4gdGxiX3JlbW92ZV90YWJsZSgpCj4+Pgo+Pj4gwqDCoMKgwqAg
Rm9yIHRoZSBnZW5lcmljIHRsYl9yZW1vdmVfdGFibGUoKSwgaXQgaXMgaW1wbGVtZW50ZWQgaW4g
dGhlCj4+PiBmb2xsb3dpbmcgdHdvCj4+PiDCoMKgwqDCoCBmb3JtczoKPj4+Cj4+PiDCoMKgwqDC
oCAxKSBDT05GSUdfTU1VX0dBVEhFUl9UQUJMRV9GUkVFIGlzIGVuYWJsZWQKPj4+Cj4+PiDCoMKg
wqDCoCB0bGJfcmVtb3ZlX3RhYmxlCj4+PiDCoMKgwqDCoCAtLT4gZ2VuZXJpYyBfX3RsYl9yZW1v
dmVfdGFibGUoKQo+Pj4KPj4+IMKgwqDCoMKgIDIpIENPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZS
RUUgaXMgZGlzYWJsZWQKPj4+Cj4+PiDCoMKgwqDCoCB0bGJfcmVtb3ZlX3RhYmxlCj4+PiDCoMKg
wqDCoCAtLT4gdGxiX3JlbW92ZV9wYWdlCj4+Pgo+Pj4gwqDCoMKgwqAgRm9yIGNhc2UgMSksIHRo
ZSBwYWdldGFibGVfZHRvcigpIGhhcyBhbHJlYWR5IGJlZW4gbW92ZWQgdG8KPj4+IGdlbmVyaWMK
Pj4+IMKgwqDCoMKgIF9fdGxiX3JlbW92ZV90YWJsZSgpLgo+Pj4KPj4+IMKgwqDCoMKgIEZvciBj
YXNlIDIpLCBub3cgb25seSBhcm0gd2lsbCBjYWxsCj4+PiB0bGJfcmVtb3ZlX3RhYmxlKCkvdGxi
X3JlbW92ZV9wdGRlc2MoKQo+Pj4gwqDCoMKgwqAgd2hlbiBDT05GSUdfTU1VX0dBVEhFUl9UQUJM
RV9GUkVFIGlzIGRpc2FibGVkLiBMZXQncyBtb3ZlCj4+PiBwYWdldGFibGVfZHRvcigpCj4+PiDC
oMKgwqDCoCBjb21wbGV0ZWx5IHRvIGdlbmVyaWMgdGxiX3JlbW92ZV90YWJsZSgpLCBzbyB0aGF0
IHRoZQo+Pj4gYXJjaGl0ZWN0dXJlcyBjYW4KPj4+IMKgwqDCoMKgIGZvbGxvdyBtb3JlIGVhc2ls
eS4KPj4+Cj4+PiDCoMKgwqDCoCBTaWduZWQtb2ZmLWJ5OiBRaSBaaGVuZyA8emhlbmdxaS5hcmNo
QGJ5dGVkYW5jZS5jb20+Cj4KPiBJIG1pc3NlZCB5b3VyIFN1Z2dlc3RlZC1ieSwgd2lsbCBhZGQg
aXQgaW4gdjUuCgpBaCB5ZXMgdGhhbmtzIQoKPgo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS90bGIuaCBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3RsYi5oCj4+PiBpbmRl
eCBiOGVlYmRiNTk4NjMxLi5lYTRmYmU3YjE3ZjZmIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm0v
aW5jbHVkZS9hc20vdGxiLmgKPj4+ICsrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3RsYi5oCj4+
PiBAQCAtMzQsMTAgKzM0LDYgQEAgX19wdGVfZnJlZV90bGIoc3RydWN0IG1tdV9nYXRoZXIgKnRs
YiwgcGd0YWJsZV90Cj4+PiBwdGUsIHVuc2lnbmVkIGxvbmcgYWRkcikKPj4+IMKgwqB7Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBwdGRlc2MgKnB0ZGVzYyA9IHBhZ2VfcHRkZXNjKHB0ZSk7
Cj4+Pgo+Pj4gLSNpZm5kZWYgQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRQo+Pj4gLcKgwqDC
oMKgwqDCoCBwYWdldGFibGVfZHRvcihwdGRlc2MpOwo+Pj4gLSNlbmRpZgo+Pgo+PiBJIGd1ZXNz
IHRoaXMgaHVuayB3aWxsIGRpc2FwcGVhciBzaW5jZSB0aGlzIGNhbGwgaXNuJ3QgcHJlc2VudCB0
byBzdGFydAo+PiB3aXRoLgo+Cj4gWWVzLCBJIHBsYW4gdG8gYWRkIHRoaXMgaW4gdGhlIHBhdGNo
ICM4LCBhbmQgcmVtb3ZlIGl0IGluIHRoaXMgcGF0Y2guCgpSaWdodCBJIGd1ZXNzIHRoaXMgaXMg
cmVxdWlyZWQgdG8ga2VlcCBwYXRjaCA4IHNlbGYtY29udGFpbmVkLCBtYWtlcyBzZW5zZS4KCj4K
Pj4KPj4+IC0KPj4+IMKgwqAjaWZuZGVmIENPTkZJR19BUk1fTFBBRQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoCAvKgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICogV2l0aCB0aGUgY2xhc3NpYyBBUk0gTU1V
LCBhIHB0ZSBwYWdlIGhhcyB0d28KPj4+IGNvcnJlc3BvbmRpbmcgcG1kCj4+PiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy90bGIuaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmgK
Pj4+IGluZGV4IDY5ZGU0N2M3ZWYzYzUuLjUzYWU3NzQ4ZjU1NWIgMTAwNjQ0Cj4+PiAtLS0gYS9p
bmNsdWRlL2FzbS1nZW5lcmljL3RsYi5oCj4+PiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3Rs
Yi5oCj4+PiBAQCAtMjIwLDE0ICsyMjAsMjAgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fdGxiX3Jl
bW92ZV90YWJsZSh2b2lkCj4+PiAqdGFibGUpCj4+Pgo+Pj4gwqDCoGV4dGVybiB2b2lkIHRsYl9y
ZW1vdmVfdGFibGUoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgdm9pZCAqdGFibGUpOwo+Pj4KPj4+
IC0jZWxzZSAvKiAhQ09ORklHX01NVV9HQVRIRVJfSEFWRV9UQUJMRV9GUkVFICovCj4+PiArI2Vs
c2UgLyogIUNPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZSRUUgKi8KPj4KPj4gR29vZCBjYXRjaCEK
Pj4KPj4+Cj4+PiArc3RhdGljIGlubGluZSB2b2lkIHRsYl9yZW1vdmVfcGFnZShzdHJ1Y3QgbW11
X2dhdGhlciAqdGxiLCBzdHJ1Y3QKPj4+IHBhZ2UgKnBhZ2UpOwo+Pgo+PiBOaXQ6IG1pZ2h0IGJl
IGJldHRlciB0byBtb3ZlIHRoZSBkZWNsYXJhdGlvbiB1cCwgZS5nLiBhYm92ZSAjaWZkZWYKPj4g
Q09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRS4KPgo+IE5vdyBvbmx5IHRoZSB0bGJfcmVtb3Zl
X3RhYmxlKCkgYmVsb3cgY2FsbHMgaXQsIG1heWJlIGl0J3MgYmV0dGVyIHRvCj4ga2VlcCB0aGUg
aW1wYWN0IHRvIG1pbmltdW0/CgpJIGZlZWwgaXQgbWlnaHQgYmUgYmV0dGVyIHRvIG1ha2UgdGhl
IGRlY2xhcmF0aW9uIHVuY29uZGl0aW9uYWwsIGJ1dAp0aGlzIGlzIHJlYWxseSBhIGRldGFpbCwg
SSBkb24ndCBtaW5kIGVpdGhlciB3YXkuCgo+Cj4+Cj4+PiDCoMKgLyoKPj4+IMKgwqAgKiBXaXRo
b3V0IE1NVV9HQVRIRVJfVEFCTEVfRlJFRSB0aGUgYXJjaGl0ZWN0dXJlIGlzIGFzc3VtZWQgdG8g
aGF2ZQo+Pj4gcGFnZSBiYXNlZAo+Pj4gwqDCoCAqIHBhZ2UgZGlyZWN0b3JpZXMgYW5kIHdlIGNh
biB1c2UgdGhlIG5vcm1hbCBwYWdlIGJhdGNoaW5nIHRvIGZyZWUKPj4+IHRoZW0uCj4+PiDCoMKg
ICovCj4+PiAtI2RlZmluZSB0bGJfcmVtb3ZlX3RhYmxlKHRsYiwgcGFnZSkgdGxiX3JlbW92ZV9w
YWdlKCh0bGIpLCAocGFnZSkpCj4+PiArc3RhdGljIGlubGluZSB2b2lkIHRsYl9yZW1vdmVfdGFi
bGUoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgdm9pZAo+Pj4gKnRhYmxlKQo+Pj4gK3sKPj4+ICvC
oMKgwqDCoMKgwqAgc3RydWN0IHBhZ2UgKnBhZ2UgPSAoc3RydWN0IHBhZ2UgKil0YWJsZTsKPj4+
Cj4+PiArwqDCoMKgwqDCoMKgIHBhZ2V0YWJsZV9kdG9yKHBhZ2VfcHRkZXNjKHBhZ2UpKTsKPj4+
ICvCoMKgwqDCoMKgwqAgdGxiX3JlbW92ZV9wYWdlKHRsYiwgcGFnZSk7Cj4+PiArfQo+Pj4gwqDC
oCNlbmRpZiAvKiBDT05GSUdfTU1VX0dBVEhFUl9UQUJMRV9GUkVFICovCj4+Pgo+Pj4gwqDCoCNp
ZmRlZiBDT05GSUdfTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRQo+Pgo+PiBMb29rcyBnb29kIHRv
IG1lIG90aGVyd2lzZS4KPgo+IEkgd2lsbCBhZGQgeW91ciBSZXZpZXdlZC1ieSB0byBhbGwgcGF0
Y2hlcyAoZXhjZXB0IHlvdXJzKSBpbiB2NSwgY2FuCj4gSSBhbHNvIGFkZCBpdCB0byB0aGlzIG5l
dyBhZGRlZCBwYXRjaD8gKGlmIHdlIGFncmVlIHdpdGggdGhlIGRpc2N1c3Npb24KPiBhYm92ZSkg
OykKClllcyBwbGVhc2UgZG8sIHRoYW5rcyEKCi0gS2V2aW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
