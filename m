Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCB4E77197
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 12:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smuW+mVi70oKUBuMBh3zlFnJI9bGaoXdSUTj6KC9a34=; b=ru1pGpDhmTdUdj
	ZT7hEFQ9qid55Nt2iYctLYMfQWmQ25YlcC33v3Zpiyc8LulLb6igyRFTgFxdk+EXVPSt4WwBTyu/V
	p0koX52N7LhdxAoQ+bG5BD9ntWwPBsTp8uO3XCEfzAyiaDf8ohgAI0H6tOWK5eFISw10FN8lfcA77
	VCTVJk28JV8xDfy9Igd6asrZekszEUv1sbka7mbW3RqBXuQQ3mUBRST0VZGx36zCvDA9EuBI3K2s3
	8r8dSFFfmDM6D5+0Y6g7pReAgNP1wGn+gjtalEmoGutczENu653KbnAuhl20GN+nPzA2wCUR7ohWz
	qdcJz9G8sACo2EugxySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8N6-00000004hGj-0L0H;
	Tue, 07 Jan 2025 12:07:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8Dz-00000004f0V-0tl7;
	Tue, 07 Jan 2025 11:58:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9DC6143D;
	Tue,  7 Jan 2025 03:58:45 -0800 (PST)
Received: from [10.44.160.93] (e126510-lin.lund.arm.com [10.44.160.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 187FC3F673;
	Tue,  7 Jan 2025 03:58:09 -0800 (PST)
Message-ID: <4a0b5edb-6fc7-4df4-93d9-ca834e6a760b@arm.com>
Date: Tue, 7 Jan 2025 12:58:08 +0100
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
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <07e0c05f-cb69-4263-885d-6d20d4442152@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_035819_344021_134F1E8B 
X-CRM114-Status: GOOD (  17.42  )
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

T24gMDcvMDEvMjAyNSAxMTo1MSwgUWkgWmhlbmcgd3JvdGU6Cj4gWy4uLl0KPgo+IEF1dGhvcjog
UWkgWmhlbmcgPHpoZW5ncWkuYXJjaEBieXRlZGFuY2UuY29tPgo+IERhdGU6wqDCoCBGcmkgRGVj
IDEzIDE3OjEzOjQ4IDIwMjQgKzA4MDAKPgo+IMKgwqDCoCBtbTogcGd0YWJsZTogY29tcGxldGVs
eSBtb3ZlIHBhZ2V0YWJsZV9kdG9yKCkgdG8gZ2VuZXJpYwo+IHRsYl9yZW1vdmVfdGFibGUoKQo+
Cj4gwqDCoMKgIEZvciB0aGUgZ2VuZXJpYyB0bGJfcmVtb3ZlX3RhYmxlKCksIGl0IGlzIGltcGxl
bWVudGVkIGluIHRoZQo+IGZvbGxvd2luZyB0d28KPiDCoMKgwqAgZm9ybXM6Cj4KPiDCoMKgwqAg
MSkgQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRSBpcyBlbmFibGVkCj4KPiDCoMKgwqAgdGxi
X3JlbW92ZV90YWJsZQo+IMKgwqDCoCAtLT4gZ2VuZXJpYyBfX3RsYl9yZW1vdmVfdGFibGUoKQo+
Cj4gwqDCoMKgIDIpIENPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZSRUUgaXMgZGlzYWJsZWQKPgo+
IMKgwqDCoCB0bGJfcmVtb3ZlX3RhYmxlCj4gwqDCoMKgIC0tPiB0bGJfcmVtb3ZlX3BhZ2UKPgo+
IMKgwqDCoCBGb3IgY2FzZSAxKSwgdGhlIHBhZ2V0YWJsZV9kdG9yKCkgaGFzIGFscmVhZHkgYmVl
biBtb3ZlZCB0byBnZW5lcmljCj4gwqDCoMKgIF9fdGxiX3JlbW92ZV90YWJsZSgpLgo+Cj4gwqDC
oMKgIEZvciBjYXNlIDIpLCBub3cgb25seSBhcm0gd2lsbCBjYWxsCj4gdGxiX3JlbW92ZV90YWJs
ZSgpL3RsYl9yZW1vdmVfcHRkZXNjKCkKPiDCoMKgwqAgd2hlbiBDT05GSUdfTU1VX0dBVEhFUl9U
QUJMRV9GUkVFIGlzIGRpc2FibGVkLiBMZXQncyBtb3ZlCj4gcGFnZXRhYmxlX2R0b3IoKQo+IMKg
wqDCoCBjb21wbGV0ZWx5IHRvIGdlbmVyaWMgdGxiX3JlbW92ZV90YWJsZSgpLCBzbyB0aGF0IHRo
ZQo+IGFyY2hpdGVjdHVyZXMgY2FuCj4gwqDCoMKgIGZvbGxvdyBtb3JlIGVhc2lseS4KPgo+IMKg
wqDCoCBTaWduZWQtb2ZmLWJ5OiBRaSBaaGVuZyA8emhlbmdxaS5hcmNoQGJ5dGVkYW5jZS5jb20+
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vdGxiLmggYi9hcmNoL2FybS9p
bmNsdWRlL2FzbS90bGIuaAo+IGluZGV4IGI4ZWViZGI1OTg2MzEuLmVhNGZiZTdiMTdmNmYgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vdGxiLmgKPiArKysgYi9hcmNoL2FybS9p
bmNsdWRlL2FzbS90bGIuaAo+IEBAIC0zNCwxMCArMzQsNiBAQCBfX3B0ZV9mcmVlX3RsYihzdHJ1
Y3QgbW11X2dhdGhlciAqdGxiLCBwZ3RhYmxlX3QKPiBwdGUsIHVuc2lnbmVkIGxvbmcgYWRkcikK
PiDCoHsKPiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcHRkZXNjICpwdGRlc2MgPSBwYWdlX3B0ZGVz
YyhwdGUpOwo+Cj4gLSNpZm5kZWYgQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRQo+IC3CoMKg
wqDCoMKgwqAgcGFnZXRhYmxlX2R0b3IocHRkZXNjKTsKPiAtI2VuZGlmCgpJIGd1ZXNzIHRoaXMg
aHVuayB3aWxsIGRpc2FwcGVhciBzaW5jZSB0aGlzIGNhbGwgaXNuJ3QgcHJlc2VudCB0byBzdGFy
dAp3aXRoLgoKPiAtCj4gwqAjaWZuZGVmIENPTkZJR19BUk1fTFBBRQo+IMKgwqDCoMKgwqDCoMKg
IC8qCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFdpdGggdGhlIGNsYXNzaWMgQVJNIE1NVSwgYSBwdGUg
cGFnZSBoYXMgdHdvIGNvcnJlc3BvbmRpbmcgcG1kCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNt
LWdlbmVyaWMvdGxiLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3RsYi5oCj4gaW5kZXggNjlkZTQ3
YzdlZjNjNS4uNTNhZTc3NDhmNTU1YiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmlj
L3RsYi5oCj4gKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy90bGIuaAo+IEBAIC0yMjAsMTQgKzIy
MCwyMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX190bGJfcmVtb3ZlX3RhYmxlKHZvaWQgKnRhYmxl
KQo+Cj4gwqBleHRlcm4gdm9pZCB0bGJfcmVtb3ZlX3RhYmxlKHN0cnVjdCBtbXVfZ2F0aGVyICp0
bGIsIHZvaWQgKnRhYmxlKTsKPgo+IC0jZWxzZSAvKiAhQ09ORklHX01NVV9HQVRIRVJfSEFWRV9U
QUJMRV9GUkVFICovCj4gKyNlbHNlIC8qICFDT05GSUdfTU1VX0dBVEhFUl9UQUJMRV9GUkVFICov
CgpHb29kIGNhdGNoIQoKPgo+ICtzdGF0aWMgaW5saW5lIHZvaWQgdGxiX3JlbW92ZV9wYWdlKHN0
cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHN0cnVjdAo+IHBhZ2UgKnBhZ2UpOwoKTml0OiBtaWdodCBi
ZSBiZXR0ZXIgdG8gbW92ZSB0aGUgZGVjbGFyYXRpb24gdXAsIGUuZy4gYWJvdmUgI2lmZGVmCkNP
TkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZSRUUuCgo+IMKgLyoKPiDCoCAqIFdpdGhvdXQgTU1VX0dB
VEhFUl9UQUJMRV9GUkVFIHRoZSBhcmNoaXRlY3R1cmUgaXMgYXNzdW1lZCB0byBoYXZlCj4gcGFn
ZSBiYXNlZAo+IMKgICogcGFnZSBkaXJlY3RvcmllcyBhbmQgd2UgY2FuIHVzZSB0aGUgbm9ybWFs
IHBhZ2UgYmF0Y2hpbmcgdG8gZnJlZQo+IHRoZW0uCj4gwqAgKi8KPiAtI2RlZmluZSB0bGJfcmVt
b3ZlX3RhYmxlKHRsYiwgcGFnZSkgdGxiX3JlbW92ZV9wYWdlKCh0bGIpLCAocGFnZSkpCj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCB0bGJfcmVtb3ZlX3RhYmxlKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIs
IHZvaWQgKnRhYmxlKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgcGFnZSAqcGFnZSA9IChz
dHJ1Y3QgcGFnZSAqKXRhYmxlOwo+Cj4gK8KgwqDCoMKgwqDCoCBwYWdldGFibGVfZHRvcihwYWdl
X3B0ZGVzYyhwYWdlKSk7Cj4gK8KgwqDCoMKgwqDCoCB0bGJfcmVtb3ZlX3BhZ2UodGxiLCBwYWdl
KTsKPiArfQo+IMKgI2VuZGlmIC8qIENPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZSRUUgKi8KPgo+
IMKgI2lmZGVmIENPTkZJR19NTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFCgpMb29rcyBnb29kIHRv
IG1lIG90aGVyd2lzZS4KCi0gS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
