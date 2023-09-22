Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6D1CD4F42
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxzVDGQ+FzW6c4GSxztsPrG3f8EhVt1Q+jBY6TU07Zo=; b=HNgkYk+2/ClThq
	23R1svFpXakY+F2I6xlG4u3jprpHoW4Oz37106dzlg/hYOrOpT70RrtEFS4zzUBQ5JE3ToPPc5Bj6
	d0bme8d3wJe/17ialxZPkgeBr+TC+t+6KRF5A/AgnBSiOmUqH3fdHOBwzv7yxT3ulvY60bRMBVPKu
	jSf3utwBMVCKbt5YCizE5iBWNN0PYYz0HS3oCi40QMKVN8A6PSntjETv2RVncletRv6N01X0doKYH
	In2DIx1efEQ4pAjcoCmpMs3TJrDAf3BbVz0D9y6aSb4wi1evEJEGodApULK/yhXYtKCqXhID2/zhi
	0fp4HalkHWWxC0bhXN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcbu-008bLO-2w;
	Fri, 22 Sep 2023 09:38:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcbr-008bJS-0K;
	Fri, 22 Sep 2023 09:38:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8769DA7;
	Fri, 22 Sep 2023 02:38:34 -0700 (PDT)
Received: from [10.57.65.11] (unknown [10.57.65.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A97B3F5A1;
	Fri, 22 Sep 2023 02:37:53 -0700 (PDT)
Message-ID: <806eceac-8f97-403d-bee7-4fbc9e75e872@arm.com>
Date: Fri, 22 Sep 2023 10:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] powerpc: hugetlb: Convert set_huge_pte_at() to
 take vma
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
 Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Peter Xu <peterx@redhat.com>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-3-ryan.roberts@arm.com>
 <0f2dd31a-a361-24ba-154d-4e614c0eff73@csgroup.eu>
 <597e7496-ef99-4505-88ee-91701af02835@arm.com>
 <5ee382da-0ed0-9fb1-7640-35ef77c195fc@csgroup.eu>
 <871d277e-6c4e-418a-9574-2e9117646ca2@arm.com>
 <1cc4d995-efeb-9d15-446f-475e63154a2d@csgroup.eu>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <1cc4d995-efeb-9d15-446f-475e63154a2d@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_023803_231658_D5361ECB 
X-CRM114-Status: GOOD (  14.95  )
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

T24gMjIvMDkvMjAyMyAxMDoxNCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAy
Mi8wOS8yMDIzIMOgIDEwOjQxLCBSeWFuIFJvYmVydHMgYSDDqWNyaXTCoDoKPj4gT24gMjIvMDkv
MjAyMyAwOToxMCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4+Cj4+Pgo+Pj4+IEknbSBoYXBw
eSB0byB0YWtlIHlvdXIgcHJvcG9zZWQgYXBwcm9hY2ggaWYgdGhhdCdzIHlvdXIgcHJlZmVyZW5j
ZS4gQW5vdGhlcgo+Pj4+IG9wdGlvbiBpcyB0byB1c2UgYSBkdW1teSBWTUEsIGFzIEkgaGF2ZSBk
b25lIGluIHRoZSBjb3JlIGNvZGUsIGZvciB0aGUgb25lIGNhbGwKPj4+PiBzaXRlIHRoYXQgY2Fs
bHMgc2V0X2h1Z2VfcHRlX2F0KCkgd2l0aCBpbml0X21tOgo+Pj4+Cj4+Pj4gc3RydWN0IHZtX2Fy
ZWFfc3RydWN0IHZtYSA9IFRMQl9GTFVTSF9WTUEoJmluaXRfbW0sIDApOwo+Pj4+Cj4+Pj4gVGhp
cyBpcyBhbiBleGlzdGluZyBtYWNybyB0aGF0IGNyZWF0ZXMgYSBkdW1teSB2bWEgd2l0aCB2bWEt
PnZtX21tIGZpbGxlZCBpbi4KPj4+PiBUaGVuIEkgcGFzcyAmdm1hIHRvIHRoZSBmdW5jdGlvbi4K
Pj4+Cj4+PiBJIGRvbid0IGxpa2UgdGhhdCwgSSBwcmVmZXIgdGhlIHNvbHV0aW9uIEkgcHJvcG9z
ZWQuIFdlIGFscmVhZHkgaGF2ZSBhCj4+PiBjb3VwbGUgcGxhY2VzIHdoZXJlIHBvd2VycGMgZG8g
dGhpbmdzIGJhc2VkIG9uIHdoZXRoZXIgdm1hIGlzIE5VTEwgb3Igbm90Lgo+Pj4KPj4+Pgo+Pj4+
IE9yIHlldCBhbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBrZWVwIHRoZSBtbSBwYXJhbSBhcyBp
cyBpbiBzZXRfaHVnZV9wdGVfYXQoKSwKPj4+PiBhbmQgYWRkIGEgc2l6ZSBwYXJhbSB0byB0aGUg
ZnVuY3Rpb24uIEJ1dCB0aGVuIGFsbCBjYWxsIHNpdGVzIGhhdmUgdGhlIGJ1cmRlbiBvZgo+Pj4+
IGZpZ3VyaW5nIG91dCB0aGUgc2l6ZSBvZiB0aGUgaHVnZSBwdGUgKGFsdGhvdWdoIEkgdGhpbmsg
bW9zdCBrbm93IGFscmVhZHkpLgo+Pj4KPj4+IEluZGVlZC4KPj4+Cj4+PiBhcmNoX21ha2VfaHVn
ZV9wdGUoKSB1c2VkIHRvIHRha2UgYSB2bWEgdW50aWwgY29tbWl0IDc5YzFjNTk0ZjQ5YQo+Pj4g
KCJtbS9odWdldGxiOiBjaGFuZ2UgcGFyYW1ldGVycyBvZiBhcmNoX21ha2VfaHVnZV9wdGUoKSIp
Lgo+Pj4KPj4+IFNob3VsZCB3ZSB0cnkgYW5kIGhhdmUgdGhlIHNhbWUgYXBwcm9hY2ggPyBPciBp
cyBpdCBpcnJlbGV2YW50ID8KPj4KPj4gU2VlIFsxXTsgSSdtIGdvaW5nIHRvIHJld29yayB0byBw
YXNzIG1tICsgc2l6ZSBwYXJhbWV0ZXIgc2luY2UgdGhlIGN1cnJlbnQKPj4gYXBwcm9hY2ggd2ls
bCBicmVhayByaXNjdi4KPiAKPiBDYW4geW91IHBhc3MgYSBzaGlmdCBwYXJhbWV0ZXIgaW5zdGVh
ZCBvZiBhIHNpemUsIGxpa2UgCj4gYXJjaF9tYWtlX2h1Z2VfcHRlKCkgPyBBcyBmYXIgYXMgSSBy
ZW1lbWJlciBpdCBpcyBlYXNpZXIgdG8gaGFuZGxlIGEgCj4gc2hpZnQgdGhhbiBhIHNpemUuCgpN
b3N0IG9mIHRoZSBjYWxsIHNpdGVzIGFscmVhZHkgaGF2ZSB0aGUgc2l6ZSwgbm90IHRoZSBzaGlm
dC4gQW5kIGFybTY0IG5lZWRzIHRoZQpzaXplLCBzbyBpdCB3b3VsZCBoYXZlIGRvICgxVUwgPDwg
c2hpZnQpLiBTbyBvbiB0aGF0IGJhc2lzLCBJIHByZWZlciB0byBwYXNzCnNpemUuIGh1Z2VfcHRl
X2NsZWFyKCkgYWxyZWFkeSBwYXNzZXMgbG9uZyB1bnNpZ25lZCBzeiwgc28gSSdkIHJhdGhlciBm
b2xsb3cKdGhhdCBwYXR0ZXJuLgoKPiAKPiBDaHJpc3RvcGhlCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
