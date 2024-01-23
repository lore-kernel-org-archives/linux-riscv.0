Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D23C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 11:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9cX5rmKBtfIo08FPAQRz8V8GN9/hjzOIrsEHuUIweBA=; b=wDuwgSdms/UJEi
	TKelbpax8Aji7jijCIvn0P2DqH3AlVU0gp2Rd4eiJE6uySH0otsTPe9XQVXwI5I32Y0K6Qs0NmoM/
	YnAM+M9ZNEcEGsUa/wgcrwy2l7rshMnxVpwcnnJDgajNkT793VT6wCh84RQxJ4+VcLexfC2velb5j
	XpRqCJvftgMD5K7xYvjZ30KcyMWDdpkIl/HzmmWcVr/FuH+G/3wLIAkiyX0IBtPOD2Lraa90D1gkr
	7H44OMEQrP6DfpS+kxBbUHcUkFLaZXiuFtczvPbD+i9mmMu/UR9G5JknQx6Zc6VtvmMwXFQ+yQxM0
	1TMGjJqFn4DX4MvjDwUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSF74-00GGY5-2A;
	Tue, 23 Jan 2024 11:38:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSF71-00GGUX-2F;
	Tue, 23 Jan 2024 11:38:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 345D81FB;
	Tue, 23 Jan 2024 03:39:22 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A33F3F762;
	Tue, 23 Jan 2024 03:38:31 -0800 (PST)
Message-ID: <e0d9caab-39c7-446a-aeef-5d914d321c72@arm.com>
Date: Tue, 23 Jan 2024 11:38:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
 <6703b648-10ab-4fea-b7f1-75421319465b@arm.com>
 <ae3d826f-758f-4738-b72a-e99f098bb2b3@csgroup.eu>
 <3a970289-a72f-418e-b43c-89f67f0d5283@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <3a970289-a72f-418e-b43c-89f67f0d5283@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_033839_844083_9C58783D 
X-CRM114-Status: GOOD (  12.55  )
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

T24gMjMvMDEvMjAyNCAxMTozMSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pgo+Pj4+IElm
IGhpZ2ggYml0cyBhcmUgdXNlZCBmb3IKPj4+PiBzb21ldGhpbmcgZWxzZSwgdGhlbiB3ZSBtaWdo
dCBwcm9kdWNlIGEgZ2FyYmFnZSBQVEUgb24gb3ZlcmZsb3csIGJ1dCB0aGF0Cj4+Pj4gc2hvdWxk
bid0IHJlYWxseSBtYXR0ZXIgSSBjb25jbHVkZWQgZm9yIGZvbGlvX3B0ZV9iYXRjaCgpIHB1cnBv
c2VzLCB3ZSdkIG5vdAo+Pj4+IGRldGVjdCAiYmVsb25ncyB0byB0aGlzIGZvbGlvIGJhdGNoIiBl
aXRoZXIgd2F5Lgo+Pj4KPj4+IEV4YWN0bHkuCj4+Pgo+Pj4+Cj4+Pj4gTWF5YmUgaXQncyBsaWtl
bHkgY2xlYW5lciB0byBhbHNvIGhhdmUgYSBjdXN0b20gcHRlX25leHRfcGZuKCkgb24gcHBjLCBJ
IGp1c3QKPj4+PiBob3BlIHRoYXQgd2UgZG9uJ3QgbG9zZSBhbnkgb3RoZXIgYXJiaXRyYXJ5IFBU
RSBiaXRzIGJ5IGRvaW5nIHRoZSBwdGVfcGdwcm90KCkuCj4+Pgo+Pj4gSSBkb24ndCBzZWUgdGhl
IG5lZWQgZm9yIHBwYyB0byBpbXBsZW1lbnQgcHRlX25leHRfcGZuKCkuCj4+Cj4+IEFncmVlZC4K
PiAKPiBTbyBsaWtlbHkgd2Ugc2hvdWxkIHRoZW4gZG8gb24gdG9wIGZvciBwb3dlcnBjICh3aGl0
ZXNwYWNlIGRhbWFnZSk6Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxl
LmMgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jCj4gaW5kZXggYTA0YWU0NDQ5YTAyNS4uNTQ5
YTQ0MGVkN2Y2NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jCj4gKysr
IGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYwo+IEBAIC0yMjAsMTAgKzIyMCw3IEBAIHZvaWQg
c2V0X3B0ZXMoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPiBwdGVf
dCAqcHRlcCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGJyZWFrOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwdGVwKys7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZHIgKz0gUEFHRV9TSVpFOwo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IGluY3JlbWVudCB0aGUgcGZuLgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8K
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwdGUgPSBwZm5fcHRlKHB0ZV9wZm4ocHRl
KSArIDEsIHB0ZV9wZ3Byb3QoKHB0ZSkpKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwdGUgPSBwdGVfbmV4dF9wZm4ocHRlKTsKPiDCoMKgwqDCoMKgwqDCoCB9Cj4gwqB9CgpMb29r
cyBsaWtlIGNvbW1pdCA0N2I4ZGVmOTM1OGMgKCJwb3dlcnBjL21tOiBBdm9pZCBjYWxsaW5nCmFy
Y2hfZW50ZXIvbGVhdmVfbGF6eV9tbXUoKSBpbiBzZXRfcHRlcyIpIGNoYW5nZWQgZnJvbSBkb2lu
ZyB0aGUgc2ltcGxlCmluY3JlbWVudCB0byB0aGlzIG1vcmUgY29tcGxleCBhcHByb2FjaCwgYnV0
IHRoZSBsb2cgZG9lc24ndCBzYXkgd2h5LgoKPiDCoAo+IAo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
