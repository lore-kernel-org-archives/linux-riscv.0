Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A45E77198
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZAuCULis4/WpzjOOBQtMK9mM8x1mPpSgtpNM9mEprQ=; b=0F8O3Njmn9as2O
	mbswr3b5fEFB9HT06iJdLw7gzSaent+9eKPDGFEsc5WoEOuWDR85dzoW7l/LSdqKU4Gnb+VdQ/cme
	tlJs5uIlqkMAV3Ntzjpl0u/5gwyzAo/1eXIkv2f5TOrtl+xhPrtLMMHvlvM/Rx6THTPLwiWsyckZx
	w2lWLbHt/q1rlsjeZfBjwMyiWyQoPlxdYshBIn/uMS0Tkf8I1LLddPz96ZantH/ZvzFbV36rgrOIm
	pZXWtFNlZz94vdB25EUaHWvmna3cOD9kuktU+6+FHmmRgqje1deFfjYgV5uyyf7/yMjxnnEAyGMgT
	gtsamvY70RDuQTEXp10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8kA-00000004m8j-0E4l;
	Tue, 07 Jan 2025 12:31:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8k5-00000004m6q-109K
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 12:31:33 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-215770613dbso167964045ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2025 04:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736253088; x=1736857888; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2Sg0kNPwV4gGCFeUvrc0oDDUwUGkE4XjlNGrPro8W4=;
        b=Tuumc6bTuLFON+vU/KMMCkkGo3ivZjdxJj3VDcd4+sPb9s4x8fEv/S33kUyGTnG218
         QrmdHN9yj1OSWQjEXVJ+TRTte7kLZKcAP97llVKouQO0/H1gSXP7ZMZzc/HOdTvmDSrS
         oMaV2U/WwYaI+kKxq2lOVqj23jbVEH2vm0AGHDDwyljpA/mSs+lN2MCEBbi2Jt+uFZJl
         cXcnqW4Mu5Qf7ActvOEisPp8EowSd2C02HrCOkCkYjcmulnlv06M83bMjVVgWlEhk5oP
         FgccGVuZ9ym8qewiNvKbPXiegM4Wq2z1uz4YbQgmph13U+skgJUQ3dXWuxV74rR4qd46
         UDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736253088; x=1736857888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2Sg0kNPwV4gGCFeUvrc0oDDUwUGkE4XjlNGrPro8W4=;
        b=XcRzVWOaN3tb90ZcgdsUfUkm1s7pU6KvIX5ATFU7Q2okI1yxJEXOP5amjYtTMyX8eb
         wcBB0UIKgtCBlHJWE9e7LHXNI81vvpLNDNAcOPjxuTcRbEGCQ/up1Jfy7Qoz7AoBPTZp
         nmHjGDFEn416varLffFkuNRwckkJREGKQ3YrxlFtp7OuvB3MIBevlNmWAPKg6v/Ts2HY
         GD5CFHi3IRBCK2Pz6YhDuqd2irh+/LunRpmND7Fuk5t7d4lV4MhRzsaZFtSUkdGmr1dB
         1lJ8WfnT+SKurqvBH8wD3H46icklSXhRGvnsMlglPMiYBuvj+3AKDVV0NwiMRjySebeJ
         OTFA==
X-Forwarded-Encrypted: i=1; AJvYcCUIpk04hc2KqI+S9kwCBa88ruWKWYxcNq1msr+NPKMoOZoh0a04WnoH9eRtxTbOPZ99Als4QynoX6HB4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxzPTJNv7zozE7fkIH+oGZBbzdHJlwtyxOdIhJpXMlgMRHWxdm
	kJlays48xp+dVb3l5YWw4RsV/uKGfku2gn2LAaZyueOpZQC5lwLbNjxrmeLhIM0=
X-Gm-Gg: ASbGncvel0RDw1y5wJG44YslmpnHoNN5VxXJnrvo+XZZgVDeradyicPMf2pMqN6Gvvc
	axhED4/DCIdXlryJu9xF0O+7wcK4trCyEn+hKzWW9a3GO7FPJLejLrOefU29MFOHkVaiFY0/wPb
	sHg4cdyDl/JJk+QEmLNNazlyk8la9pGewivpT1rxFZZdG1byxBqNHjE86huxb5RP0i2VG3/6k7l
	VwivNUubjAY4qB5iodRAk5lW0jVplGWT6jdFZT4gNlsj6sDQFTeGVNFTOxlYDu9hCNm01O37TW1
	iDZE
X-Google-Smtp-Source: AGHT+IHdrC/g0o4yqle0rmLjmhkyYNUhmDJ4pfXjCTmOvwgBk4798gzhlJqtML37UPom2J/Tnd9DQg==
X-Received: by 2002:a17:902:ce81:b0:216:282d:c692 with SMTP id d9443c01a7336-219e6ec1499mr788151455ad.34.1736253087824;
        Tue, 07 Jan 2025 04:31:27 -0800 (PST)
Received: from [10.4.33.153] ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca006fasm309326755ad.227.2025.01.07.04.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:31:27 -0800 (PST)
Message-ID: <fca0d7de-b563-4d11-9ed8-c6b8290c4cf9@bytedance.com>
Date: Tue, 7 Jan 2025 20:31:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <4a0b5edb-6fc7-4df4-93d9-ca834e6a760b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_043129_277780_1C6F5A75 
X-CRM114-Status: GOOD (  19.02  )
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

CgpPbiAyMDI1LzEvNyAxOTo1OCwgS2V2aW4gQnJvZHNreSB3cm90ZToKPiBPbiAwNy8wMS8yMDI1
IDExOjUxLCBRaSBaaGVuZyB3cm90ZToKPj4gWy4uLl0KPj4KPj4gQXV0aG9yOiBRaSBaaGVuZyA8
emhlbmdxaS5hcmNoQGJ5dGVkYW5jZS5jb20+Cj4+IERhdGU6wqDCoCBGcmkgRGVjIDEzIDE3OjEz
OjQ4IDIwMjQgKzA4MDAKPj4KPj4gIMKgwqDCoCBtbTogcGd0YWJsZTogY29tcGxldGVseSBtb3Zl
IHBhZ2V0YWJsZV9kdG9yKCkgdG8gZ2VuZXJpYwo+PiB0bGJfcmVtb3ZlX3RhYmxlKCkKPj4KPj4g
IMKgwqDCoCBGb3IgdGhlIGdlbmVyaWMgdGxiX3JlbW92ZV90YWJsZSgpLCBpdCBpcyBpbXBsZW1l
bnRlZCBpbiB0aGUKPj4gZm9sbG93aW5nIHR3bwo+PiAgwqDCoMKgIGZvcm1zOgo+Pgo+PiAgwqDC
oMKgIDEpIENPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZSRUUgaXMgZW5hYmxlZAo+Pgo+PiAgwqDC
oMKgIHRsYl9yZW1vdmVfdGFibGUKPj4gIMKgwqDCoCAtLT4gZ2VuZXJpYyBfX3RsYl9yZW1vdmVf
dGFibGUoKQo+Pgo+PiAgwqDCoMKgIDIpIENPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZSRUUgaXMg
ZGlzYWJsZWQKPj4KPj4gIMKgwqDCoCB0bGJfcmVtb3ZlX3RhYmxlCj4+ICDCoMKgwqAgLS0+IHRs
Yl9yZW1vdmVfcGFnZQo+Pgo+PiAgwqDCoMKgIEZvciBjYXNlIDEpLCB0aGUgcGFnZXRhYmxlX2R0
b3IoKSBoYXMgYWxyZWFkeSBiZWVuIG1vdmVkIHRvIGdlbmVyaWMKPj4gIMKgwqDCoCBfX3RsYl9y
ZW1vdmVfdGFibGUoKS4KPj4KPj4gIMKgwqDCoCBGb3IgY2FzZSAyKSwgbm93IG9ubHkgYXJtIHdp
bGwgY2FsbAo+PiB0bGJfcmVtb3ZlX3RhYmxlKCkvdGxiX3JlbW92ZV9wdGRlc2MoKQo+PiAgwqDC
oMKgIHdoZW4gQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRSBpcyBkaXNhYmxlZC4gTGV0J3Mg
bW92ZQo+PiBwYWdldGFibGVfZHRvcigpCj4+ICDCoMKgwqAgY29tcGxldGVseSB0byBnZW5lcmlj
IHRsYl9yZW1vdmVfdGFibGUoKSwgc28gdGhhdCB0aGUKPj4gYXJjaGl0ZWN0dXJlcyBjYW4KPj4g
IMKgwqDCoCBmb2xsb3cgbW9yZSBlYXNpbHkuCj4+Cj4+ICDCoMKgwqAgU2lnbmVkLW9mZi1ieTog
UWkgWmhlbmcgPHpoZW5ncWkuYXJjaEBieXRlZGFuY2UuY29tPgoKSSBtaXNzZWQgeW91ciBTdWdn
ZXN0ZWQtYnksIHdpbGwgYWRkIGl0IGluIHY1LgoKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL3RsYi5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vdGxiLmgKPj4gaW5kZXgg
YjhlZWJkYjU5ODYzMS4uZWE0ZmJlN2IxN2Y2ZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vaW5j
bHVkZS9hc20vdGxiLmgKPj4gKysrIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vdGxiLmgKPj4gQEAg
LTM0LDEwICszNCw2IEBAIF9fcHRlX2ZyZWVfdGxiKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHBn
dGFibGVfdAo+PiBwdGUsIHVuc2lnbmVkIGxvbmcgYWRkcikKPj4gIMKgewo+PiAgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IHB0ZGVzYyAqcHRkZXNjID0gcGFnZV9wdGRlc2MocHRlKTsKPj4KPj4gLSNp
Zm5kZWYgQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRQo+PiAtwqDCoMKgwqDCoMKgIHBhZ2V0
YWJsZV9kdG9yKHB0ZGVzYyk7Cj4+IC0jZW5kaWYKPiAKPiBJIGd1ZXNzIHRoaXMgaHVuayB3aWxs
IGRpc2FwcGVhciBzaW5jZSB0aGlzIGNhbGwgaXNuJ3QgcHJlc2VudCB0byBzdGFydAo+IHdpdGgu
CgpZZXMsIEkgcGxhbiB0byBhZGQgdGhpcyBpbiB0aGUgcGF0Y2ggIzgsIGFuZCByZW1vdmUgaXQg
aW4gdGhpcyBwYXRjaC4KCj4gCj4+IC0KPj4gIMKgI2lmbmRlZiBDT05GSUdfQVJNX0xQQUUKPj4g
IMKgwqDCoMKgwqDCoMKgIC8qCj4+ICDCoMKgwqDCoMKgwqDCoMKgICogV2l0aCB0aGUgY2xhc3Np
YyBBUk0gTU1VLCBhIHB0ZSBwYWdlIGhhcyB0d28gY29ycmVzcG9uZGluZyBwbWQKPj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3Rs
Yi5oCj4+IGluZGV4IDY5ZGU0N2M3ZWYzYzUuLjUzYWU3NzQ4ZjU1NWIgMTAwNjQ0Cj4+IC0tLSBh
L2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmgKPj4gKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy90
bGIuaAo+PiBAQCAtMjIwLDE0ICsyMjAsMjAgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fdGxiX3Jl
bW92ZV90YWJsZSh2b2lkICp0YWJsZSkKPj4KPj4gIMKgZXh0ZXJuIHZvaWQgdGxiX3JlbW92ZV90
YWJsZShzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCB2b2lkICp0YWJsZSk7Cj4+Cj4+IC0jZWxzZSAv
KiAhQ09ORklHX01NVV9HQVRIRVJfSEFWRV9UQUJMRV9GUkVFICovCj4+ICsjZWxzZSAvKiAhQ09O
RklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRSAqLwo+IAo+IEdvb2QgY2F0Y2ghCj4gCj4+Cj4+ICtz
dGF0aWMgaW5saW5lIHZvaWQgdGxiX3JlbW92ZV9wYWdlKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIs
IHN0cnVjdAo+PiBwYWdlICpwYWdlKTsKPiAKPiBOaXQ6IG1pZ2h0IGJlIGJldHRlciB0byBtb3Zl
IHRoZSBkZWNsYXJhdGlvbiB1cCwgZS5nLiBhYm92ZSAjaWZkZWYKPiBDT05GSUdfTU1VX0dBVEhF
Ul9UQUJMRV9GUkVFLgoKTm93IG9ubHkgdGhlIHRsYl9yZW1vdmVfdGFibGUoKSBiZWxvdyBjYWxs
cyBpdCwgbWF5YmUgaXQncyBiZXR0ZXIgdG8Ka2VlcCB0aGUgaW1wYWN0IHRvIG1pbmltdW0/Cgo+
IAo+PiAgwqAvKgo+PiAgwqAgKiBXaXRob3V0IE1NVV9HQVRIRVJfVEFCTEVfRlJFRSB0aGUgYXJj
aGl0ZWN0dXJlIGlzIGFzc3VtZWQgdG8gaGF2ZQo+PiBwYWdlIGJhc2VkCj4+ICDCoCAqIHBhZ2Ug
ZGlyZWN0b3JpZXMgYW5kIHdlIGNhbiB1c2UgdGhlIG5vcm1hbCBwYWdlIGJhdGNoaW5nIHRvIGZy
ZWUKPj4gdGhlbS4KPj4gIMKgICovCj4+IC0jZGVmaW5lIHRsYl9yZW1vdmVfdGFibGUodGxiLCBw
YWdlKSB0bGJfcmVtb3ZlX3BhZ2UoKHRsYiksIChwYWdlKSkKPj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCB0bGJfcmVtb3ZlX3RhYmxlKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHZvaWQgKnRhYmxlKQo+
PiArewo+PiArwqDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlICpwYWdlID0gKHN0cnVjdCBwYWdlICop
dGFibGU7Cj4+Cj4+ICvCoMKgwqDCoMKgwqAgcGFnZXRhYmxlX2R0b3IocGFnZV9wdGRlc2MocGFn
ZSkpOwo+PiArwqDCoMKgwqDCoMKgIHRsYl9yZW1vdmVfcGFnZSh0bGIsIHBhZ2UpOwo+PiArfQo+
PiAgwqAjZW5kaWYgLyogQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRSAqLwo+Pgo+PiAgwqAj
aWZkZWYgQ09ORklHX01NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUKPiAKPiBMb29rcyBnb29kIHRv
IG1lIG90aGVyd2lzZS4KCkkgd2lsbCBhZGQgeW91ciBSZXZpZXdlZC1ieSB0byBhbGwgcGF0Y2hl
cyAoZXhjZXB0IHlvdXJzKSBpbiB2NSwgY2FuCkkgYWxzbyBhZGQgaXQgdG8gdGhpcyBuZXcgYWRk
ZWQgcGF0Y2g/IChpZiB3ZSBhZ3JlZSB3aXRoIHRoZSBkaXNjdXNzaW9uCmFib3ZlKSA7KQoKVGhh
bmtzIQoKPiAKPiAtIEtldmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
