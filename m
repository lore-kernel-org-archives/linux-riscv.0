Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1D1E77197
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 09:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCvSPjbVDreEV/DLZPNNKhyvmJTg0F7/4zYZSpnCz08=; b=E5eMXmgqW2q36T
	eNekOaWW6j4Ki8oEYGcGOagGHYvcAQULYmDRpYGxpmis6AnclkJsMmNfN2tyjn/L/qq4zQtR5gECI
	w4l7zTC9uce7ZWUJCaoCkYXBemQDvAXmjYS5zPjEwVyJnoF6g46JIQyeETJZQK4K1tcFGD1aQ+Q23
	crEe+10dL+ZT/f2qtagAAd13No0iiTY86Fug4GqH5o5SD8WsX9CgTg70YyRenW4CW75/1wOgq1QOs
	6J60EuPEfncjNUuSZE2q6zwNOSZUQPHEdlmFFjbdOkb8fj8xyXxFQMrYibQdhM6Qt3OQ7aTQT2OmA
	F8uBSze9qQ++3H0VyirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5rK-000000047GB-1IMI;
	Tue, 07 Jan 2025 09:26:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5oi-000000046Wy-3Nmu;
	Tue, 07 Jan 2025 09:24:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADFCE143D;
	Tue,  7 Jan 2025 01:24:31 -0800 (PST)
Received: from [10.57.93.53] (unknown [10.57.93.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96F593F66E;
	Tue,  7 Jan 2025 01:23:54 -0800 (PST)
Message-ID: <83df51a5-5eb9-4470-92a1-e69fd12b98b4@arm.com>
Date: Tue, 7 Jan 2025 10:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] mm: pgtable: introduce pagetable_dtor()
To: Qi Zheng <zhengqi.arch@bytedance.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, palmer@dabbelt.com, tglx@linutronix.de,
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
 <8ada95453180c71b7fca92b9a9f11fa0f92d45a6.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxwiEhYHDqdTh3@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <e1de887c-6193-48ee-a9b3-04c8a0cdda45@bytedance.com>
 <Z3vOZ18jcCpHIcPD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <bce4bb4e-459a-44c8-945b-8889149377fd@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <bce4bb4e-459a-44c8-945b-8889149377fd@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_012404_887239_34D3927F 
X-CRM114-Status: GOOD (  10.74  )
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

T24gMDYvMDEvMjAyNSAxNDoyMywgUWkgWmhlbmcgd3JvdGU6Cj4gT24gMjAyNS8xLzYgMjA6MzYs
IEFsZXhhbmRlciBHb3JkZWV2IHdyb3RlOgo+PiBPbiBNb24sIEphbiAwNiwgMjAyNSBhdCAwNjo1
NTo1OFBNICswODAwLCBRaSBaaGVuZyB3cm90ZToKPj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBw
YWdldGFibGVfZHRvcihzdHJ1Y3QgcHRkZXNjICpwdGRlc2MpCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKg
wqAgc3RydWN0IGZvbGlvICpmb2xpbyA9IHB0ZGVzY19mb2xpbyhwdGRlc2MpOwo+Pj4+PiArCj4+
Pj4+ICvCoMKgwqAgcHRsb2NrX2ZyZWUocHRkZXNjKTsKPj4+Pj4gK8KgwqDCoCBfX2ZvbGlvX2Ns
ZWFyX3BndGFibGUoZm9saW8pOwo+Pj4+PiArwqDCoMKgIGxydXZlY19zdGF0X3N1Yl9mb2xpbyhm
b2xpbywgTlJfUEFHRVRBQkxFKTsKPj4+Pj4gK30KPj4+Pj4gKwo+Pj4+Cj4+Pj4gSWYgSSBhbSBu
b3QgbWlzdGFrZW4sIGl0IGlzIGp1c3QgcGFnZXRhYmxlX3B0ZV9kdG9yKCkgcmVuYW1lLgo+Pj4+
IFdoYXQgaXMgdGhlIHBvaW50IGluIG1vdmluZyB0aGUgY29kZSBhcm91bmQ/Cj4+Pgo+Pj4gTm8s
IHRoaXMgaXMgdG8gdW5pZnkgcGFnZXRhYmxlX3AqX2R0b3IoKSBpbnRvIHBhZ2V0YWJsZV9kdG9y
KCksIHNvCj4+PiB0aGF0IHdlIGNhbiBtb3ZlIHBhZ2V0YWJsZV9kdG9yKCkgdG8gX190bGJfcmVt
b3ZlX3RhYmxlKCksIGFuZCB0aGVuCj4+PiBwdGxvY2sgYW5kIFBURSBwYWdlIGNhbiBiZSBmcmVl
ZCB0b2dldGhlciB0aHJvdWdoIFJDVSwgd2hpY2ggaXMKPj4+IGFsc28gdGhlIG1haW4gcHVycG9z
ZSBvZiB0aGlzIHBhdGNoIHNlcmllcy4KPj4KPj4gSSBhbSBvbmx5IHRhbGtpbmcgYWJvdXQgdGhp
cyBwYXRjaC4gcGFnZXRhYmxlX2R0b3IoKSBjb2RlIGFib3ZlIGlzCj4+IHRoZSBzYW1lIHBhZ2V0
YWJsZV9wdGVfZHRvcigpIGJlbG93IC0gaXQgaXMgb25seSB0aGUgZnVuY3Rpb24gbmFtZQo+PiB0
aGF0IGNoYW5nZWQuIFNvIHdoeSB0byBtb3ZlIHRoZSBmdW5jdGlvbiBib2R5PyBBbnl3YXksIHRo
YXQgaXMKPgo+IEFoLCBJIGp1c3QgZG9uJ3Qgd2FudCB0byBwdXQgcGFnZXRhYmxlX2R0b3IoKSBp
biBiZXR3ZWVuCj4gcGFnZXRhYmxlX3B0ZV9jdG9yKCkgYW5kIF9fX3B0ZV9vZmZzZXRfbWFwKCks
IHNvIEkgbW92ZWQgaXQgYWJvdmUKPiBwYWdldGFibGVfcHRlX2N0b3IoKS4gTm8gb3RoZXIgc3Bl
Y2lhbCByZWFzb24uIPCfmIkgCgpJIHRoaW5rIGluc2VydGluZyBwYWdldGFibGVfZHRvcigpIHRo
ZXJlIG1ha2VzIHNlbnNlLiBJIHdvdWxkbid0IHNheQp0aGF0IHBhZ2V0YWJsZV9wdGVfZHRvcigp
IGlzIGJlaW5nIHJlbmFtZWQgdG8gcGFnZXRhYmxlX2R0b3IoKSwgYmVjYXVzZQppbiBmYWN0IHRo
aXMgcGF0Y2ggcmVwbGFjZXMgYWxsIG9mIHBhZ2V0YWJsZV97cHRlLHBtZCxwdWR9X2R0b3IoKSB3
aXRoCnBhZ2V0YWJsZV9kdG9yKCksIGFuZCBpdCBpcyBhcmd1YWJseSBjbGVhcmVyIHRvIGluc2Vy
dCB0aGUgbGF0dGVyIGhpZ2hlcgp1cCBpbiBtbS5oLgoKRldJVyBteSBmb2xsb3ctdXAgc2VyaWVz
IGludHJvZHVjZXMgYSBjb21tb24gX19wYWdldGFibGVfZHRvcigpLAppbnNlcnRlZCBiZWxvdyBw
YWdldGFibGVfY3RvcigpIFsxXS4KCi0gS2V2aW4KClsxXQpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1tbS8yMDI1MDEwMzE4NDQxNS4yNzQ0NDIzLTIta2V2aW4uYnJvZHNreUBhcm0uY29t
LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
