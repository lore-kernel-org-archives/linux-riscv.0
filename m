Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD25CD4F27
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=veU1tqoUq3Xjj6U/JR2kFKa26hdRAruNUFjwk05NFjY=; b=RGtj0LZ4maELe3
	nhsQwIKsIREcbkIkBIb61rd2RBscAxdfiU6Gf445vJHhZetIGCMbTMTzDXQkCkR0avwD9Jy5sD+sx
	1y0tZ67+Mh0A3IsTqP3Ncp9Z9XoE92cV0k3p1SuRTgJjt/8C6bl/tWJXjmzskdn8HimYgyBQ4emuv
	ArXCbZr8fK/mX1ySJi/egA/TGI3KEdJ/H7GIdSRjbtUvz+uHZAA9wEWupBUXIsbv3pYyrkfCNm4E6
	ZThx6fUT8/CME8lHbYYQ3mTw45tsrDuRQQnpArEClclPMBvp9K571zVNHW+MpBseRL2WCFzJVOkzG
	VJOd/y8+h2rU60a/VtzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjafT-008CUT-0a;
	Fri, 22 Sep 2023 07:33:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjafP-008CSK-0r;
	Fri, 22 Sep 2023 07:33:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B091CDA7;
	Fri, 22 Sep 2023 00:34:09 -0700 (PDT)
Received: from [10.57.65.11] (unknown [10.57.65.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 412E53F5A1;
	Fri, 22 Sep 2023 00:33:09 -0700 (PDT)
Message-ID: <597e7496-ef99-4505-88ee-91701af02835@arm.com>
Date: Fri, 22 Sep 2023 08:33:03 +0100
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <0f2dd31a-a361-24ba-154d-4e614c0eff73@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_003335_591131_815E7393 
X-CRM114-Status: GOOD (  22.67  )
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

T24gMjIvMDkvMjAyMyAwNzo1NiwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAy
MS8wOS8yMDIzIMOgIDE4OjIwLCBSeWFuIFJvYmVydHMgYSDDqWNyaXTCoDoKPj4gSW4gb3JkZXIg
dG8gZml4IGEgYnVnLCBhcm02NCBuZWVkcyBhY2Nlc3MgdG8gdGhlIHZtYSBpbnNpZGUgaXQncwo+
PiBpbXBsZW1lbnRhdGlvbiBvZiBzZXRfaHVnZV9wdGVfYXQoKS4gUHJvdmlkZSBmb3IgdGhpcyBi
eSBjb252ZXJ0aW5nIHRoZQo+PiBtbSBwYXJhbWV0ZXIgdG8gYmUgYSB2bWEuIEFueSBpbXBsZW1l
bnRhdGlvbnMgdGhhdCByZXF1aXJlIHRoZSBtbSBjYW4KPj4gYWNjZXNzIGl0IHZpYSB2bWEtPnZt
X21tLgo+Pgo+PiBUaGlzIGNvbW1pdCBtYWtlcyB0aGUgcmVxdWlyZWQgcG93ZXJwYyBtb2RpZmlj
YXRpb25zLiBTZXBhcmF0ZSBjb21taXRzCj4+IHVwZGF0ZSB0aGUgb3RoZXIgYXJjaGVzIGFuZCBj
b3JlIGNvZGUsIGJlZm9yZSB0aGUgYWN0dWFsIGJ1ZyBpcyBmaXhlZCBpbgo+PiBhcm02NC4KPj4K
Pj4gTm8gYmVoYXZpb3JhbCBjaGFuZ2VzIGludGVuZGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBS
eWFuIFJvYmVydHMgPHJ5YW4ucm9iZXJ0c0Bhcm0uY29tPgo+PiAtLS0KPj4gICBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL2h1Z2V0bGItOHh4LmggfCAzICsrLQo+PiAgIGFyY2gv
cG93ZXJwYy9tbS9ib29rM3M2NC9odWdldGxicGFnZS5jICAgICAgICAgICB8IDIgKy0KPj4gICBh
cmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfaHVnZXRsYnBhZ2UuYyAgICAgfCAyICstCj4+
ICAgYXJjaC9wb3dlcnBjL21tL25vaGFzaC84eHguYyAgICAgICAgICAgICAgICAgICAgIHwgMiAr
LQo+PiAgIGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMgICAgICAgICAgICAgICAgICAgICAgICB8
IDcgKysrKysrLQo+PiAgIDUgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hh
c2gvMzIvaHVnZXRsYi04eHguaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIv
aHVnZXRsYi04eHguaAo+PiBpbmRleCBkZTA5MmIwNGVlMWEuLmZmZjhjZDcyNmJjNyAxMDA2NDQK
Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9odWdldGxiLTh4eC5o
Cj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRsYi04eHgu
aAo+PiBAQCAtNDYsNyArNDYsOCBAQCBzdGF0aWMgaW5saW5lIGludCBjaGVja19hbmRfZ2V0X2h1
Z2VfcHNpemUoaW50IHNoaWZ0KQo+PiAgIH0KPj4gICAKPj4gICAjZGVmaW5lIF9fSEFWRV9BUkNI
X0hVR0VfU0VUX0hVR0VfUFRFX0FUCj4+IC12b2lkIHNldF9odWdlX3B0ZV9hdChzdHJ1Y3QgbW1f
c3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRlKTsK
Pj4gK3ZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNp
Z25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVfdCBwdGUpOwo+PiArdm9pZCBfX3NldF9o
dWdlX3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVf
dCAqcHRlcCwgcHRlX3QgcHRlKTsKPiAKPiBEb24ndCBhZGQgdGhlIGJ1cmRlbiBvZiBhbiBhZGRp
dGlvbmFsIGZ1bmN0aW9uLCBzZWUgYmVsb3cKPiAKPj4gICAKPj4gICAjZGVmaW5lIF9fSEFWRV9B
UkNIX0hVR0VfUFRFX0NMRUFSCj4+ICAgc3RhdGljIGlubGluZSB2b2lkIGh1Z2VfcHRlX2NsZWFy
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaHVnZXRsYnBhZ2UuYyBiL2FyY2gvcG93ZXJwYy9t
bS9ib29rM3M2NC9odWdldGxicGFnZS5jCj4+IGluZGV4IDNiYzBlYjIxYjJhMC4uYWU3ZmQ3Yzkw
ZWI4IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaHVnZXRsYnBhZ2Uu
Ywo+PiArKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaHVnZXRsYnBhZ2UuYwo+PiBAQCAt
MTQ3LDcgKzE0Nyw3IEBAIHZvaWQgaHVnZV9wdGVwX21vZGlmeV9wcm90X2NvbW1pdChzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyCj4+ICAgCWlmIChyYWRpeF9l
bmFibGVkKCkpCj4+ICAgCQlyZXR1cm4gcmFkaXhfX2h1Z2VfcHRlcF9tb2RpZnlfcHJvdF9jb21t
aXQodm1hLCBhZGRyLCBwdGVwLAo+PiAgIAkJCQkJCQkgICBvbGRfcHRlLCBwdGUpOwo+PiAtCXNl
dF9odWdlX3B0ZV9hdCh2bWEtPnZtX21tLCBhZGRyLCBwdGVwLCBwdGUpOwo+PiArCXNldF9odWdl
X3B0ZV9hdCh2bWEsIGFkZHIsIHB0ZXAsIHB0ZSk7Cj4+ICAgfQo+PiAgIAo+PiAgIHZvaWQgX19p
bml0IGh1Z2V0bGJwYWdlX2luaXRfZGVmYXVsdHNpemUodm9pZCkKPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9odWdldGxicGFnZS5jIGIvYXJjaC9wb3dlcnBj
L21tL2Jvb2szczY0L3JhZGl4X2h1Z2V0bGJwYWdlLmMKPj4gaW5kZXggMTcwNzVjNzhkNGJjLi43
Y2Q0MGEzMzRjM2EgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRp
eF9odWdldGxicGFnZS5jCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9o
dWdldGxicGFnZS5jCj4+IEBAIC01OCw1ICs1OCw1IEBAIHZvaWQgcmFkaXhfX2h1Z2VfcHRlcF9t
b2RpZnlfcHJvdF9jb21taXQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4+ICAgCSAgICBh
dG9taWNfcmVhZCgmbW0tPmNvbnRleHQuY29wcm9zKSA+IDApCj4+ICAgCQlyYWRpeF9fZmx1c2hf
aHVnZXRsYl9wYWdlKHZtYSwgYWRkcik7Cj4+ICAgCj4+IC0Jc2V0X2h1Z2VfcHRlX2F0KHZtYS0+
dm1fbW0sIGFkZHIsIHB0ZXAsIHB0ZSk7Cj4+ICsJc2V0X2h1Z2VfcHRlX2F0KHZtYSwgYWRkciwg
cHRlcCwgcHRlKTsKPj4gICB9Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vbm9oYXNo
Lzh4eC5jIGIvYXJjaC9wb3dlcnBjL21tL25vaGFzaC84eHguYwo+PiBpbmRleCBkYmJmZTg5NzQ1
NWQuLjY1MGE3YTg0OTZiNiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL25vaGFzaC84
eHguYwo+PiArKysgYi9hcmNoL3Bvd2VycGMvbW0vbm9oYXNoLzh4eC5jCj4+IEBAIC05MSw3ICs5
MSw3IEBAIHN0YXRpYyBpbnQgX19yZWYgX19lYXJseV9tYXBfa2VybmVsX2h1Z2VwYWdlKHVuc2ln
bmVkIGxvbmcgdmEsIHBoeXNfYWRkcl90IHBhLAo+PiAgIAlpZiAobmV3ICYmIFdBUk5fT04ocHRl
X3ByZXNlbnQoKnB0ZXApICYmIHBncHJvdF92YWwocHJvdCkpKQo+PiAgIAkJcmV0dXJuIC1FSU5W
QUw7Cj4+ICAgCj4+IC0Jc2V0X2h1Z2VfcHRlX2F0KCZpbml0X21tLCB2YSwgcHRlcCwgcHRlX21r
aHVnZShwZm5fcHRlKHBhID4+IFBBR0VfU0hJRlQsIHByb3QpKSk7Cj4+ICsJX19zZXRfaHVnZV9w
dGVfYXQoJmluaXRfbW0sIHZhLCBwdGVwLCBwdGVfbWtodWdlKHBmbl9wdGUocGEgPj4gUEFHRV9T
SElGVCwgcHJvdCkpKTsKPiAKPiBDYWxsIHNldF9odWdlX3B0ZV9hdCgpIHdpdGggYSBOVUxMIHZt
YSBpbnN0ZWFkLgoKSSdtIGhhcHB5IHRvIHRha2UgeW91ciBwcm9wb3NlZCBhcHByb2FjaCBpZiB0
aGF0J3MgeW91ciBwcmVmZXJlbmNlLiBBbm90aGVyCm9wdGlvbiBpcyB0byB1c2UgYSBkdW1teSBW
TUEsIGFzIEkgaGF2ZSBkb25lIGluIHRoZSBjb3JlIGNvZGUsIGZvciB0aGUgb25lIGNhbGwKc2l0
ZSB0aGF0IGNhbGxzIHNldF9odWdlX3B0ZV9hdCgpIHdpdGggaW5pdF9tbToKCnN0cnVjdCB2bV9h
cmVhX3N0cnVjdCB2bWEgPSBUTEJfRkxVU0hfVk1BKCZpbml0X21tLCAwKTsKClRoaXMgaXMgYW4g
ZXhpc3RpbmcgbWFjcm8gdGhhdCBjcmVhdGVzIGEgZHVtbXkgdm1hIHdpdGggdm1hLT52bV9tbSBm
aWxsZWQgaW4uClRoZW4gSSBwYXNzICZ2bWEgdG8gdGhlIGZ1bmN0aW9uLgoKT3IgeWV0IGFub3Ro
ZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGtlZXAgdGhlIG1tIHBhcmFtIGFzIGlzIGluIHNldF9odWdl
X3B0ZV9hdCgpLAphbmQgYWRkIGEgc2l6ZSBwYXJhbSB0byB0aGUgZnVuY3Rpb24uIEJ1dCB0aGVu
IGFsbCBjYWxsIHNpdGVzIGhhdmUgdGhlIGJ1cmRlbiBvZgpmaWd1cmluZyBvdXQgdGhlIHNpemUg
b2YgdGhlIGh1Z2UgcHRlIChhbHRob3VnaCBJIHRoaW5rIG1vc3Qga25vdyBhbHJlYWR5KS4KClRo
YW5rcywKUnlhbgoKPiAKPj4gICAKPj4gICAJcmV0dXJuIDA7Cj4+ICAgfQo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMK
Pj4gaW5kZXggM2Y4NmZkMjE3NjkwLi45Y2JjYjU2MWE0ZDggMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
cG93ZXJwYy9tbS9wZ3RhYmxlLmMKPj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYwo+
PiBAQCAtMjg4LDcgKzI4OCw3IEBAIGludCBodWdlX3B0ZXBfc2V0X2FjY2Vzc19mbGFncyhzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPj4gICB9Cj4+ICAgCj4+ICAgI2lmIGRlZmluZWQoQ09O
RklHX1BQQ184eHgpCj4+IC12b2lkIHNldF9odWdlX3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRlKQo+PiArdm9pZCBf
X3NldF9odWdlX3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRy
LCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRlKQo+IAo+IEtlZXAgaXQgYXMgc2V0X2h1Z2VfcHRlX2F0
KCkgd2l0aCB2bWEgYXJndW1lbnQuCj4gCj4+ICAgewo+PiAgIAlwbWRfdCAqcG1kID0gcG1kX29m
ZihtbSwgYWRkcik7Cj4gCj4gQ2hhbmdlIHRvOgo+IAo+IAlwbWRfdCAqcG1kID0gdm1hID8gcG1k
X29mZih2bWEtPnZtX21tLCBhZGRyKSA6IHBtZF9vZmZfayhhZGRyKTsKPiAKPj4gICAJcHRlX2Jh
c2ljX3QgdmFsOwo+PiBAQCAtMzEwLDYgKzMxMCwxMSBAQCB2b2lkIHNldF9odWdlX3B0ZV9hdChz
dHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwgcHRl
Xwo+PiAgIAlmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyssIGVudHJ5KyssIHZhbCArPSBTWl80SykK
Pj4gICAJCSplbnRyeSA9IHZhbDsKPj4gICB9Cj4+ICsKPj4gK3ZvaWQgc2V0X2h1Z2VfcHRlX2F0
KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpw
dGVwLCBwdGVfdCBwdGUpCj4+ICt7Cj4+ICsJX19zZXRfaHVnZV9wdGVfYXQodm1hLT52bV9tbSwg
YWRkciwgcHRlcCwgcHRlKTsKPj4gK30KPiAKPiBSZW1vdmUgdGhpcyBidXJkZW4uCj4gCj4+ICAg
I2VuZGlmCj4+ICAgI2VuZGlmIC8qIENPTkZJR19IVUdFVExCX1BBR0UgKi8KPj4gICAKPiAKPiAK
PiBDaHJpc3RvcGhlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
