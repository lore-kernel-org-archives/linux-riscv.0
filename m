Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681DCE77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fG2sfHF9KPNj/j0mxy3Mmp/1kyUmsW+q/pVrg3Tq/nY=; b=2oEGKLA1e3ocxj
	VNU1nxk8/OpLUJ7UEp1lKsPx3f7f8WGyFJWrKVpXH4MTbaadaHM5tkEVgxAq1xbzQsFvqMfMjYl7A
	Cv/VUSJrpWqMGJI6MeZBG5bWrX2pu0yLQBteAc/VBXWksQjk2+NbfB8FDgA7xlVgd0NaOr4RlfP4h
	akJLnaGexKhsvNYUIlP+dageB/P4ANxWvjDVs3LpzNNcmvWCNzyF/bbTqxgtALX0WKtcuBFoK551q
	zNXLt8ad6+H58YhvXn6AvJ3ypKALFamApKTG7Or7XUB+xYNYimCzels9PJZy1rlFKDAiQCm4Ff4Ob
	9QzivXHzskqlv94Q1tZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcgJ-0000000CQCn-444n;
	Fri, 03 Jan 2025 08:05:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTceE-0000000CPvS-2Ucx;
	Fri, 03 Jan 2025 08:03:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D277D150C;
	Fri,  3 Jan 2025 00:03:37 -0800 (PST)
Received: from [10.57.92.237] (unknown [10.57.92.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CED73F673;
	Fri,  3 Jan 2025 00:03:01 -0800 (PST)
Message-ID: <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
Date: Fri, 3 Jan 2025 09:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_000310_727700_4FCFD5B3 
X-CRM114-Status: GOOD (  18.22  )
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

T24gMDMvMDEvMjAyNSAwNDo0OCwgUWkgWmhlbmcgd3JvdGU6Cj4gSGkgS2V2aW4sCj4KPiBPbiAy
MDI1LzEvMyAwMDo1MywgS2V2aW4gQnJvZHNreSB3cm90ZToKPj4gT24gMzAvMTIvMjAyNCAxMDow
NywgUWkgWmhlbmcgd3JvdGU6Cj4+PiDCoCBzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3ZfdGxiX3Jl
bW92ZV9wdGRlc2Moc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwKPj4+IHZvaWQgKnB0KQo+Pj4gwqAg
ewo+Pj4gLcKgwqDCoCBpZiAocmlzY3ZfdXNlX3NiaV9mb3JfcmZlbmNlKCkpCj4+PiArwqDCoMKg
IGlmIChyaXNjdl91c2Vfc2JpX2Zvcl9yZmVuY2UoKSkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHRsYl9yZW1vdmVfcHRkZXNjKHRsYiwgcHQpOwo+Pj4gLcKgwqDCoCBlbHNlCj4+PiArwqDCoMKg
IH0gZWxzZSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcGFnZXRhYmxlX2R0b3IocHQpOwo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHRsYl9yZW1vdmVfcGFnZV9wdGRlc2ModGxiLCBwdCk7Cj4+Cj4+IEkg
ZmluZCB0aGUgaW1iYWxhbmNlIHByZXR0eSBjb25mdXNpbmc6IHBhZ2V0YWJsZV9kdG9yKCkgaXMg
Y2FsbGVkCj4+IGV4cGxpY2l0bHkgYmVmb3JlIHVzaW5nIHRsYl9yZW1vdmVfcGFnZSgpIGJ1dCBu
b3QgdGxiX3JlbW92ZV9wdGRlc2MoKS4KPj4gRG9lc24ndCB0aGF0IGFzc3VtZSB0aGF0IENPTkZJ
R19NTVVfR0FUSEVSX0hBVkVfVEFCTEVfRlJFRSBpcyBzZWxlY3RlZD8KPj4gQ291bGQgd2Ugbm90
IGNhbGwgcGFnZXRhYmxlX2R0b3IoKSBmcm9tIF9fdGxiX2JhdGNoX2ZyZWVfZW5jb2RlZF9wYWdl
cygpCj4+IHRvIGVuc3VyZSB0aGF0IHRoZSBkdG9yIGlzIGFsd2F5cyBjYWxsZWQganVzdCBiZWZv
cmUgZnJlZWluZywgYW5kIHJlbW92ZQo+Cj4gSW4gX190bGJfYmF0Y2hfZnJlZV9lbmNvZGVkX3Bh
Z2VzKCksIHdlIGNhbiBpbmRlZWQgZGV0ZWN0IFBhZ2VUYWJsZSgpCj4gYW5kIGNhbGwgcGFnZXRh
YmxlX2R0b3IoKSB0byBkdG9yIHRoZSBwYWdlIHRhYmxlIHBhZ2VzLgo+IEJ1dCBfX3RsYl9iYXRj
aF9mcmVlX2VuY29kZWRfcGFnZXMoKSBpcyBhbHNvIHVzZWQgdG8gZnJlZSBub3JtYWwgcGFnZXMK
PiAobm90IHBhZ2UgdGFibGUgcGFnZXMpLCBzbyBJIGRvbid0IHdhbnQgdG8gYWRkIG92ZXJoZWFk
IHRoZXJlLgoKSW50ZXJlc3RpbmcsIGNhbiBhIHRsYiBiYXRjaCByZWZlciB0byBwYWdlcyB0aGFu
IGFyZSBub3QgUFRQcyB0aGVuPwoKPgo+IEJ1dCBub3cgSSB0aGluayBtYXliZSB3ZSBjYW4gZG8g
dGhpcyBpbiB0bGJfcmVtb3ZlX3BhZ2VfcHRkZXNjKCksIGxpa2UKPiB0aGlzOgo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKPiBiL2FyY2gvY3NreS9pbmNs
dWRlL2FzbS9wZ2FsbG9jLmgKPiBpbmRleCBmMWNlNWI3YjI4ZjIyLi5lNDVjN2U5MWRjYmY5IDEw
MDY0NAo+IC0tLSBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKPiArKysgYi9hcmNo
L2Nza3kvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4gQEAgLTYzLDcgKzYzLDYgQEAgc3RhdGljIGlu
bGluZSBwZ2RfdCAqcGdkX2FsbG9jKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+Cj4gwqAjZGVmaW5l
IF9fcHRlX2ZyZWVfdGxiKHRsYiwgcHRlLCBhZGRyZXNzKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPiDCoGRvIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPiAtwqDCoMKgwqDCoMKgIHBhZ2V0YWJsZV9kdG9yKHBhZ2VfcHRkZXNjKHB0ZSkpO8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+IMKgwqDCoMKgwqDCoMKgIHRsYl9yZW1vdmVfcGFn
ZV9wdGRlc2ModGxiLCBwYWdlX3B0ZGVzYyhwdGUpKTvCoCBcCj4gwqB9IHdoaWxlICgwKQo+Cj4g
Wy4uLl0KPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL3RsYi5oIGIvaW5jbHVk
ZS9hc20tZ2VuZXJpYy90bGIuaAo+IGluZGV4IGE5NmQ0YjQ0MGYzZGEuLmE1OTIwNTg2M2Y0MzEg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJpYy90bGIuaAo+ICsrKyBiL2luY2x1ZGUv
YXNtLWdlbmVyaWMvdGxiLmgKPiBAQCAtNTA2LDYgKzUwNiw3IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCB0bGJfcmVtb3ZlX3B0ZGVzYyhzdHJ1Y3QKPiBtbXVfZ2F0aGVyICp0bGIsIHZvaWQgKnB0KQo+
IMKgLyogTGlrZSB0bGJfcmVtb3ZlX3B0ZGVzYywgYnV0IGZvciBwYWdlLWxpa2UgcGFnZSBkaXJl
Y3Rvcmllcy4gKi8KPiDCoHN0YXRpYyBpbmxpbmUgdm9pZCB0bGJfcmVtb3ZlX3BhZ2VfcHRkZXNj
KHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsCj4gc3RydWN0IHB0ZGVzYyAqcHQpCj4gwqB7Cj4gK8Kg
wqDCoMKgwqDCoCBwYWdldGFibGVfZHRvcihwdCk7Cj4gwqDCoMKgwqDCoMKgwqAgdGxiX3JlbW92
ZV9wYWdlKHRsYiwgcHRkZXNjX3BhZ2UocHQpKTsKPiDCoH0KCkkgdGhpbmsgdGhpcyBpcyBhbiBp
bnRlcmVzdGluZyBpZGVhLCBpdCBkb2VzIG1ha2UgYXJjaCBjb2RlIGVhc2llciB0bwpmb2xsb3cu
IE9UT0ggaXQgd291bGQgaGF2ZSBiZWVuIG1vcmUgbmF0dXJhbCB0byBtZSB0byBjYWxsCnBhZ2V0
YWJsZV9kdG9yKCkgZnJvbSB0bGJfcmVtb3ZlX3BhZ2UoKS4gSSBjYW4gaG93ZXZlciBzZWUgdGhh
dCB0aGlzCmRvZXNuJ3Qgd29yaywgYmVjYXVzZSB0bGJfcmVtb3ZlX3RhYmxlKCkgaXMgZGVmaW5l
ZCBhcyB0bGJfcmVtb3ZlX3BhZ2UoKQppZiBDT05GSUdfTU1VX0dBVEhFUl9IQVZFX1RBQkxFX0ZS
RUUgaXNuJ3Qgc2VsZWN0ZWQuIFdoaWNoIGJyaW5ncyBtZQpiYWNrIHRvIG15IGVhcmxpZXIgcXVl
c3Rpb246IGluIHRoYXQgY2FzZSwgYXJlbid0IHdlIG1pc3NpbmcgYSBjYWxsIHRvCnBhZ2V0YWJs
ZV9kdG9yKCkgd2hlbiB1c2luZyB0bGJfcmVtb3ZlX3RhYmxlKCkgKG9yIHRsYl9yZW1vdmVfcHRk
ZXNjKCkpPwoKLSBLZXZpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
