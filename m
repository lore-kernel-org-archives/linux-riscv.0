Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D6E7718F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 13:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VPD62AgS/gFdouiqEKWz0GKcYMkRZOUra0wCBcCezI=; b=JQa06It1X91SOh
	VhgtZCEadzhYCg+O/d06vcAjvZhKnFIR7OTqieeI6a9zoFG6yCyntiMYvRWXSf/fM9hmFckv/yZS/
	cy1Njk0mE+6FpZTcK+DoPfE369TTor/wUMP6gEfpMrAWxDdkYmLFqyyI3xMdfoV+5j/24Hb6UBkzF
	X9SJrIdI3g2ty/QFrUEwEnaFZmRe0BenqRrHapLq72ah2vwm671ZnEQrrSehNIXlHMNrjzST/DFC1
	yFO39H5Gxnb4JCrMb0iW2H2fqvHTtDt0A7EJpFJKLFJX8GFzBVg7ZR8RphCvKBOOBmB1nBI2xcxnV
	PE59R1wNqpoQSUbwWy9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tThj3-0000000D0Hc-2P3o;
	Fri, 03 Jan 2025 13:28:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tThhp-0000000D055-0T7N;
	Fri, 03 Jan 2025 13:27:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 330911480;
	Fri,  3 Jan 2025 05:27:39 -0800 (PST)
Received: from [10.44.160.93] (e126510-lin.lund.arm.com [10.44.160.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB2C23F673;
	Fri,  3 Jan 2025 05:27:02 -0800 (PST)
Message-ID: <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
Date: Fri, 3 Jan 2025 14:27:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
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
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
 <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_052713_243707_AF58B286 
X-CRM114-Status: GOOD (  19.56  )
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

T24gMDMvMDEvMjAyNSAxMDozNSwgUWkgWmhlbmcgd3JvdGU6Cj4gT24gMjAyNS8xLzMgMTc6MTMs
IFFpIFpoZW5nIHdyb3RlOgo+PiBPbiAyMDI1LzEvMyAxNjowMiwgS2V2aW4gQnJvZHNreSB3cm90
ZToKPj4+IE9uIDAzLzAxLzIwMjUgMDQ6NDgsIFFpIFpoZW5nIHdyb3RlOgo+Pj4+IFsuLi5dCj4+
Pj4KPj4+PiBJbiBfX3RsYl9iYXRjaF9mcmVlX2VuY29kZWRfcGFnZXMoKSwgd2UgY2FuIGluZGVl
ZCBkZXRlY3QgUGFnZVRhYmxlKCkKPj4+PiBhbmQgY2FsbCBwYWdldGFibGVfZHRvcigpIHRvIGR0
b3IgdGhlIHBhZ2UgdGFibGUgcGFnZXMuCj4+Pj4gQnV0IF9fdGxiX2JhdGNoX2ZyZWVfZW5jb2Rl
ZF9wYWdlcygpIGlzIGFsc28gdXNlZCB0byBmcmVlIG5vcm1hbCBwYWdlcwo+Pj4+IChub3QgcGFn
ZSB0YWJsZSBwYWdlcyksIHNvIEkgZG9uJ3Qgd2FudCB0byBhZGQgb3ZlcmhlYWQgdGhlcmUuCj4+
Pgo+Pj4gSW50ZXJlc3RpbmcsIGNhbiBhIHRsYiBiYXRjaCByZWZlciB0byBwYWdlcyB0aGFuIGFy
ZSBub3QgUFRQcyB0aGVuPwo+Pgo+PiBZZXMsIHlvdSBjYW4gc2VlIHRoZSBjYWxsZXIgb2YgX190
bGJfcmVtb3ZlX2ZvbGlvX3BhZ2VzKCkgb3IKPj4gdGxiX3JlbW92ZV9wYWdlX3NpemUoKS4KCkkg
aGFkIGEgYnJpZWYgbG9vayBidXQgY2xlYXJseSBub3QgYSBnb29kIGVub3VnaCBvbmUhIEkgaGFk
bid0IHJlYWxpc2VkCnRoYXQgInRhYmxlIiBpbiB0bGJfcmVtb3ZlX3RhYmxlKCkgbWVhbnMgUFRQ
LCB3aGlsZSAicGFnZSIgaW4KdGxiX3JlbW92ZV9wYWdlKCkgY2FuIG1lYW4gYW55IHBhZ2UsIGFu
ZCBpdCdzIG1ha2luZyBtb3JlIHNlbnNlIG5vdy4KClsuLi5dCgo+Pgo+PiBGb3IgYXJtLCB0aGUg
Y2FsbCB0byBwYWdldGFibGVfZHRvcigpIGlzIGluZGVlZCBtaXNzZWQgaW4gdGhlCj4+IG5vbi1N
TVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFIGNhc2UuIFRoaXMgbmVlZHMgdG8gYmUgZml4ZWQuIEJ1
dCB3ZQo+PiBjYW4ndCBmaXggdGhpcyBieSBhZGRpbmcgcGFnZXRhYmxlX2R0b3IoKSB0byB0bGJf
cmVtb3ZlX3RhYmxlKCksCj4+IGJlY2F1c2Ugc29tZSBhcmNoaXRlY3R1cmVzIGNhbGwgdGxiX3Jl
bW92ZV90YWJsZSgpIGJ1dCBkb24ndCBzdXBwb3J0Cj4+IHBhZ2UgdGFibGUgc3RhdGlzdGljcywg
bGlrZSBzcGFyYy4KCldoZW4gSSBpbnZlc3RpZ2F0ZWQgdGhpcyBmb3IgbXkgb3duIHNlcmllcywg
SSBmb3VuZCB0aGF0IHRoZSBvbmx5IGNhc2UKd2hlcmUgY3Rvci9kdG9yIGFyZSBub3QgY2FsbGVk
IGZvciBwYWdlLXNpemVkIHBhZ2UgdGFibGVzIGlzIDMyLWJpdApzcGFyYyAoc2VlIHRhYmxlIGF0
IHRoZSBlbmQgb2YgWzFdKS4gSG93ZXZlciBvbmx5IDY0LWJpdCBzcGFyYyBtYWtlcyB1c2UKb2Yg
dGxiX3JlbW92ZV90YWJsZSgpIChhdCBQVEUgbGV2ZWwsIHdoZXJlIGN0b3IvZHRvciBhcmUgYWxy
ZWFkeSBjYWxsZWQpLgoKU28gcmVhbGx5IGNhbGxpbmcgcGFnZXRhYmxlX2R0b3IoKSBmcm9tIHRs
Yl9yZW1vdmVfdGFibGUoKSBpbiB0aGUKbm9uLU1NVV9HQVRIRVJfVEFCTEVfRlJFRSBjYXNlIHNl
ZW1zIHRvIGJlIHRoZSBvYnZpb3VzIHRoaW5nIHRvIGRvLgoKT25jZSB0aGlzIGlzIGRvbmUsIHdl
IHNob3VsZCBiZSBhYmxlIHRvIHJlcGxhY2UgYWxsIHRob3NlIGNvbmZ1c2luZwpjYWxscyB0byB0
bGJfcmVtb3ZlX3BhZ2UoKSBvbiBQVFBzIHdpdGggdGxiX3JlbW92ZV90YWJsZSgpIGFuZCByZW1v
dmUKdGhlIGV4cGxpY2l0IGNhbGwgdG8gcGFnZXRhYmxlX2R0b3IoKS4gQUlVSSB0aGlzIGlzIGVz
c2VudGlhbGx5IHdoYXQKUGV0ZXIgc3VnZ2VzdGVkIG9uIHYzIFsyXS4KClsxXQpodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1tbS8yMDI0MTIxOTE2NDQyNS4yMjc3MDIyLTEta2V2aW4uYnJv
ZHNreUBhcm0uY29tLwpbMl0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vMjAyNTAx
MDMxMTE0NTcuR0MyMjkzNEBub2lzeS5wcm9ncmFtbWluZy5raWNrcy1hc3MubmV0LwoKWy4uLl0K
Cj4gT3IgY2FuIHdlIGp1c3Qgbm90IGxldCB0bGJfcmVtb3ZlX3RhYmxlKCkgZmFsbCBiYWNrIHRv
Cj4gdGxiX3JlbW92ZV9wYWdlKCk/IExpa2UgdGhlIGZvbGxvd2luZzoKPgo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2FzbS1nZW5lcmljL3RsYi5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy90bGIuaAo+
IGluZGV4IGE1OTIwNTg2M2Y0MzEuLjM1NGZmYWE0YmQxMjAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9hc20tZ2VuZXJpYy90bGIuaAo+ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmgKPiBA
QCAtMTk1LDggKzE5NSw2IEBACj4gwqAgKsKgIHZhcmlvdXMgcHRlcF9nZXRfYW5kX2NsZWFyKCkg
ZnVuY3Rpb25zLgo+IMKgICovCj4KPiAtI2lmZGVmIENPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZS
RUUKPiAtCj4gwqBzdHJ1Y3QgbW11X3RhYmxlX2JhdGNoIHsKPiDCoCNpZmRlZiBDT05GSUdfTU1V
X0dBVEhFUl9SQ1VfVEFCTEVfRlJFRQo+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCByY3VfaGVhZMKg
wqDCoMKgwqDCoMKgwqAgcmN1Owo+IEBAIC0yMTksMTYgKzIxNyw2IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBfX3RsYl9yZW1vdmVfdGFibGUodm9pZCAqdGFibGUpCj4KPiDCoGV4dGVybiB2b2lkIHRs
Yl9yZW1vdmVfdGFibGUoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgdm9pZCAqdGFibGUpOwo+Cj4g
LSNlbHNlIC8qICFDT05GSUdfTU1VX0dBVEhFUl9IQVZFX1RBQkxFX0ZSRUUgKi8KPiAtCj4gLS8q
Cj4gLSAqIFdpdGhvdXQgTU1VX0dBVEhFUl9UQUJMRV9GUkVFIHRoZSBhcmNoaXRlY3R1cmUgaXMg
YXNzdW1lZCB0byBoYXZlCj4gcGFnZSBiYXNlZAo+IC0gKiBwYWdlIGRpcmVjdG9yaWVzIGFuZCB3
ZSBjYW4gdXNlIHRoZSBub3JtYWwgcGFnZSBiYXRjaGluZyB0byBmcmVlCj4gdGhlbS4KPiAtICov
Cj4gLSNkZWZpbmUgdGxiX3JlbW92ZV90YWJsZSh0bGIsIHBhZ2UpIHRsYl9yZW1vdmVfcGFnZSgo
dGxiKSwgKHBhZ2UpKQoKV2Ugc3RpbGwgbmVlZCBhIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiBv
ZiB0bGJfcmVtb3ZlX3RhYmxlKCkgaW4gdGhpcwpjYXNlLiBXZSBjb3VsZCBkZWZpbmUgaXQgaW5s
aW5lIGhlcmU6CgpzdGF0aWMgaW5saW5lIHZvaWQgdGxiX3JlbW92ZV90YWJsZShzdHJ1Y3QgbW11
X2dhdGhlciAqdGxiLCB2b2lkICp0YWJsZSkKewrCoMKgwqAgc3RydWN0IHBhZ2UgKnBhZ2UgPSB0
YWJsZTsKCsKgwqDCoCBwYWdldGFibGVfZHRvcihwYWdlX3B0ZGVzYyhwYWdlKSk7CsKgwqDCoCB0
bGJfcmVtb3ZlX3BhZ2UocGFnZSk7Cn0KCi0gS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
