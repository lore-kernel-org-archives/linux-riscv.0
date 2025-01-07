Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022D0E7719B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5uNeD69VGtRyXxWY5n+PQWBYmlHYIjFZMCvXQIu+/Es=; b=SG93he3ErGZ/qp
	Undy24aCtTPbWiCvEF5bl2zvPvsVJTf4cDYTr8qBs6aM5+w3LNTElvmonLLsxbNFmdiQBiXz3zKiH
	nR54L7dY/fy50CLH6XLlRdRQoM2klMNYAlvFXNgkPxtCYtoF2kod7ASKBq/3287TjtqgQUk6G4BJN
	UPDJaLdpwaRRl4Bw0/t4gdOzph/TwByCM9cg/pOkxokjR8b9Eu+a8gWsA0ZFecYA4nvIocFQm0loo
	Ab+1j/6WfccTbxRlOQ9XkClDeq9mZ/1A75cX0QsFCyJcUOimI01HEqa5bztAzMfdmgnwv40r4CUpx
	z9LNo2Y3NR85+6ZpqFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6lj-00000004KKp-0TM9;
	Tue, 07 Jan 2025 10:25:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6Li-00000004Eb2-0qvc;
	Tue, 07 Jan 2025 09:58:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D1D0143D;
	Tue,  7 Jan 2025 01:58:37 -0800 (PST)
Received: from [10.44.160.93] (e126510-lin.lund.arm.com [10.44.160.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46B0F3F673;
	Tue,  7 Jan 2025 01:58:01 -0800 (PST)
Message-ID: <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
Date: Tue, 7 Jan 2025 10:57:59 +0100
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
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <de8756aa-dbf7-4f6f-91f0-934270397192@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_015810_320361_C67CC3BF 
X-CRM114-Status: GOOD (  17.54  )
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

T24gMDYvMDEvMjAyNSAwNDo0OSwgUWkgWmhlbmcgd3JvdGU6Cj4gWy4uLl0KPgo+PiBPbmNlIHRo
aXMgaXMgZG9uZSwgd2Ugc2hvdWxkIGJlIGFibGUgdG8gcmVwbGFjZSBhbGwgdGhvc2UgY29uZnVz
aW5nCj4+IGNhbGxzIHRvIHRsYl9yZW1vdmVfcGFnZSgpIG9uIFBUUHMgd2l0aCB0bGJfcmVtb3Zl
X3RhYmxlKCkgYW5kIHJlbW92ZQo+PiB0aGUgZXhwbGljaXQgY2FsbCB0byBwYWdldGFibGVfZHRv
cigpLiBBSVVJIHRoaXMgaXMgZXNzZW50aWFsbHkgd2hhdAo+PiBQZXRlciBzdWdnZXN0ZWQgb24g
djMgWzJdLgo+Cj4gU2luY2UgdGhpcyBwYXRjaCBzZXJpZXMgaXMgbWFpbmx5IGZvciBidWcgZml4
LCBJIHRoaW5rIHRoYXQgdGhlc2UgdGhpbmdzCj4gY2FuIGJlIGRvbmUgaW4gc2VwYXJhdGUgcGF0
Y2ggc2VyaWVzIGxhdGVyLgoKU3VyZSB0aGF0J3MgZmFpci4KCj4KPj4KPj4gWy4uLl0KPj4KPj4+
IE9yIGNhbiB3ZSBqdXN0IG5vdCBsZXQgdGxiX3JlbW92ZV90YWJsZSgpIGZhbGwgYmFjayB0bwo+
Pj4gdGxiX3JlbW92ZV9wYWdlKCk/IExpa2UgdGhlIGZvbGxvd2luZzoKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy90bGIuaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxi
LmgKPj4+IGluZGV4IGE1OTIwNTg2M2Y0MzEuLjM1NGZmYWE0YmQxMjAgMTAwNjQ0Cj4+PiAtLS0g
YS9pbmNsdWRlL2FzbS1nZW5lcmljL3RsYi5oCj4+PiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmlj
L3RsYi5oCj4+PiBAQCAtMTk1LDggKzE5NSw2IEBACj4+PiDCoMKgICrCoCB2YXJpb3VzIHB0ZXBf
Z2V0X2FuZF9jbGVhcigpIGZ1bmN0aW9ucy4KPj4+IMKgwqAgKi8KPj4+Cj4+PiAtI2lmZGVmIENP
TkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZSRUUKPj4+IC0KPj4+IMKgwqBzdHJ1Y3QgbW11X3RhYmxl
X2JhdGNoIHsKPj4+IMKgwqAjaWZkZWYgQ09ORklHX01NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUK
Pj4+IMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHJjdV9oZWFkwqDCoMKgwqDCoMKgwqDCoCByY3U7
Cj4+PiBAQCAtMjE5LDE2ICsyMTcsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX190bGJfcmVtb3Zl
X3RhYmxlKHZvaWQgKnRhYmxlKQo+Pj4KPj4+IMKgwqBleHRlcm4gdm9pZCB0bGJfcmVtb3ZlX3Rh
YmxlKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHZvaWQgKnRhYmxlKTsKPj4+Cj4+PiAtI2Vsc2Ug
LyogIUNPTkZJR19NTVVfR0FUSEVSX0hBVkVfVEFCTEVfRlJFRSAqLwo+Pj4gLQo+Pj4gLS8qCj4+
PiAtICogV2l0aG91dCBNTVVfR0FUSEVSX1RBQkxFX0ZSRUUgdGhlIGFyY2hpdGVjdHVyZSBpcyBh
c3N1bWVkIHRvIGhhdmUKPj4+IHBhZ2UgYmFzZWQKPj4+IC0gKiBwYWdlIGRpcmVjdG9yaWVzIGFu
ZCB3ZSBjYW4gdXNlIHRoZSBub3JtYWwgcGFnZSBiYXRjaGluZyB0byBmcmVlCj4+PiB0aGVtLgo+
Pj4gLSAqLwo+Pj4gLSNkZWZpbmUgdGxiX3JlbW92ZV90YWJsZSh0bGIsIHBhZ2UpIHRsYl9yZW1v
dmVfcGFnZSgodGxiKSwgKHBhZ2UpKQo+Pgo+PiBXZSBzdGlsbCBuZWVkIGEgZGlmZmVyZW50IGlt
cGxlbWVudGF0aW9uIG9mIHRsYl9yZW1vdmVfdGFibGUoKSBpbiB0aGlzCj4+IGNhc2UuIFdlIGNv
dWxkIGRlZmluZSBpdCBpbmxpbmUgaGVyZToKPj4KPj4gc3RhdGljIGlubGluZSB2b2lkIHRsYl9y
ZW1vdmVfdGFibGUoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgdm9pZCAqdGFibGUpCj4+IHsKPj4g
wqDCoMKgwqAgc3RydWN0IHBhZ2UgKnBhZ2UgPSB0YWJsZTsKPj4KPj4gwqDCoMKgwqAgcGFnZXRh
YmxlX2R0b3IocGFnZV9wdGRlc2MocGFnZSkpOwo+PiDCoMKgwqDCoCB0bGJfcmVtb3ZlX3BhZ2Uo
cGFnZSk7Cj4+IH0KPgo+IFJpZ2h0LiBBcyBJIHNhaWQgYWJvdmUsIHdpbGwgYWRkIHRoaXMgdG8g
dGhlIHVwZGF0ZWQgcGF0Y2ggIzguCgpJIHRoaW5rIGl0IHdvdWxkIGJlIHByZWZlcmFibGUgdG8g
bWFrZSBpdCBhIHN0YW5kYWxvbmUgcGF0Y2gsIGJlY2F1c2UKdGhpcyBpcyBhIGNoYW5nZSB0byBn
ZW5lcmljIGNvZGUgdGhhdCBjb3VsZCBpbiBwcmluY2lwbGUgaW1wYWN0IG90aGVyCmFyY2gncyB0
b28uCgotIEtldmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
