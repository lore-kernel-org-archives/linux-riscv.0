Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE307CD4F32
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 08:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmVrHNT6KmTil+mu/iqsszS+nzgob46fcFLRFRklxgs=; b=Svhj6eTs2EJTij
	Hi/RetD70inAS4HhOT0meyeK2DeGgHck1d8CWluflYjRxbFIlUQQ4PnO/ntSpT8Ue5coiW2yA9TRI
	e61rGUQv2WoP9QG/BbeEigWJbkhrzCa6LJ7uYt5oYbudPWQVrLOF964VTVcKlCcGKDZR87xPR1pIY
	I/nPUj94WLTNwWLXoiR+Rcj2XTdLBxxVc/IgfU+SM0jBU7CCt0bnFacn6S51c6hwCtIpDQhFeTUpK
	IvNXqCxhwiVxQC1s2ZPayrKEFoLDWAg88yP/bh8LNwz9zd+NdSsPDLhyn08xcmiidTSwkWUH64ieD
	gRM9ymvM88SHizEaP6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbis-008RYy-02;
	Fri, 22 Sep 2023 08:41:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbin-008RWi-2f;
	Fri, 22 Sep 2023 08:41:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED220DA7;
	Fri, 22 Sep 2023 01:41:43 -0700 (PDT)
Received: from [10.57.65.11] (unknown [10.57.65.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E23B3F67D;
	Fri, 22 Sep 2023 01:41:02 -0700 (PDT)
Message-ID: <871d277e-6c4e-418a-9574-2e9117646ca2@arm.com>
Date: Fri, 22 Sep 2023 09:41:00 +0100
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <5ee382da-0ed0-9fb1-7640-35ef77c195fc@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_014109_960639_CD51ABD4 
X-CRM114-Status: GOOD (  23.47  )
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

T24gMjIvMDkvMjAyMyAwOToxMCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAy
Mi8wOS8yMDIzIMOgIDA5OjMzLCBSeWFuIFJvYmVydHMgYSDDqWNyaXTCoDoKPj4gT24gMjIvMDkv
MjAyMyAwNzo1NiwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4+Cj4+Pgo+Pj4gTGUgMjEvMDkv
MjAyMyDDoCAxODoyMCwgUnlhbiBSb2JlcnRzIGEgw6ljcml0wqA6Cj4+Pj4gSW4gb3JkZXIgdG8g
Zml4IGEgYnVnLCBhcm02NCBuZWVkcyBhY2Nlc3MgdG8gdGhlIHZtYSBpbnNpZGUgaXQncwo+Pj4+
IGltcGxlbWVudGF0aW9uIG9mIHNldF9odWdlX3B0ZV9hdCgpLiBQcm92aWRlIGZvciB0aGlzIGJ5
IGNvbnZlcnRpbmcgdGhlCj4+Pj4gbW0gcGFyYW1ldGVyIHRvIGJlIGEgdm1hLiBBbnkgaW1wbGVt
ZW50YXRpb25zIHRoYXQgcmVxdWlyZSB0aGUgbW0gY2FuCj4+Pj4gYWNjZXNzIGl0IHZpYSB2bWEt
PnZtX21tLgo+Pj4+Cj4+Pj4gVGhpcyBjb21taXQgbWFrZXMgdGhlIHJlcXVpcmVkIHBvd2VycGMg
bW9kaWZpY2F0aW9ucy4gU2VwYXJhdGUgY29tbWl0cwo+Pj4+IHVwZGF0ZSB0aGUgb3RoZXIgYXJj
aGVzIGFuZCBjb3JlIGNvZGUsIGJlZm9yZSB0aGUgYWN0dWFsIGJ1ZyBpcyBmaXhlZCBpbgo+Pj4+
IGFybTY0Lgo+Pj4+Cj4+Pj4gTm8gYmVoYXZpb3JhbCBjaGFuZ2VzIGludGVuZGVkLgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogUnlhbiBSb2JlcnRzIDxyeWFuLnJvYmVydHNAYXJtLmNvbT4KPj4+
PiAtLS0KPj4+PiAgICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL2h1Z2V0bGIt
OHh4LmggfCAzICsrLQo+Pj4+ICAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9odWdldGxicGFn
ZS5jICAgICAgICAgICB8IDIgKy0KPj4+PiAgICBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFk
aXhfaHVnZXRsYnBhZ2UuYyAgICAgfCAyICstCj4+Pj4gICAgYXJjaC9wb3dlcnBjL21tL25vaGFz
aC84eHguYyAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+Pj4+ICAgIGFyY2gvcG93ZXJwYy9t
bS9wZ3RhYmxlLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDcgKysrKysrLQo+Pj4+ICAgIDUg
ZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL2h1Z2V0bGIt
OHh4LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL2h1Z2V0bGItOHh4LmgK
Pj4+PiBpbmRleCBkZTA5MmIwNGVlMWEuLmZmZjhjZDcyNmJjNyAxMDA2NDQKPj4+PiAtLS0gYS9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL2h1Z2V0bGItOHh4LmgKPj4+PiArKysg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL2h1Z2V0bGItOHh4LmgKPj4+PiBA
QCAtNDYsNyArNDYsOCBAQCBzdGF0aWMgaW5saW5lIGludCBjaGVja19hbmRfZ2V0X2h1Z2VfcHNp
emUoaW50IHNoaWZ0KQo+Pj4+ICAgIH0KPj4+PiAgICAKPj4+PiAgICAjZGVmaW5lIF9fSEFWRV9B
UkNIX0hVR0VfU0VUX0hVR0VfUFRFX0FUCj4+Pj4gLXZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVfdCBw
dGUpOwo+Pj4+ICt2b2lkIHNldF9odWdlX3B0ZV9hdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRlKTsKPj4+PiArdm9p
ZCBfX3NldF9odWdlX3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBh
ZGRyLCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRlKTsKPj4+Cj4+PiBEb24ndCBhZGQgdGhlIGJ1cmRl
biBvZiBhbiBhZGRpdGlvbmFsIGZ1bmN0aW9uLCBzZWUgYmVsb3cKPj4+Cj4+Pj4gICAgCj4+Pj4g
ICAgI2RlZmluZSBfX0hBVkVfQVJDSF9IVUdFX1BURV9DTEVBUgo+Pj4+ICAgIHN0YXRpYyBpbmxp
bmUgdm9pZCBodWdlX3B0ZV9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9u
ZyBhZGRyLAo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaHVnZXRs
YnBhZ2UuYyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9odWdldGxicGFnZS5jCj4+Pj4gaW5k
ZXggM2JjMGViMjFiMmEwLi5hZTdmZDdjOTBlYjggMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9wb3dl
cnBjL21tL2Jvb2szczY0L2h1Z2V0bGJwYWdlLmMKPj4+PiArKysgYi9hcmNoL3Bvd2VycGMvbW0v
Ym9vazNzNjQvaHVnZXRsYnBhZ2UuYwo+Pj4+IEBAIC0xNDcsNyArMTQ3LDcgQEAgdm9pZCBodWdl
X3B0ZXBfbW9kaWZ5X3Byb3RfY29tbWl0KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNp
Z25lZCBsb25nIGFkZHIKPj4+PiAgICAJaWYgKHJhZGl4X2VuYWJsZWQoKSkKPj4+PiAgICAJCXJl
dHVybiByYWRpeF9faHVnZV9wdGVwX21vZGlmeV9wcm90X2NvbW1pdCh2bWEsIGFkZHIsIHB0ZXAs
Cj4+Pj4gICAgCQkJCQkJCSAgIG9sZF9wdGUsIHB0ZSk7Cj4+Pj4gLQlzZXRfaHVnZV9wdGVfYXQo
dm1hLT52bV9tbSwgYWRkciwgcHRlcCwgcHRlKTsKPj4+PiArCXNldF9odWdlX3B0ZV9hdCh2bWEs
IGFkZHIsIHB0ZXAsIHB0ZSk7Cj4+Pj4gICAgfQo+Pj4+ICAgIAo+Pj4+ICAgIHZvaWQgX19pbml0
IGh1Z2V0bGJwYWdlX2luaXRfZGVmYXVsdHNpemUodm9pZCkKPj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X2h1Z2V0bGJwYWdlLmMgYi9hcmNoL3Bvd2VycGMv
bW0vYm9vazNzNjQvcmFkaXhfaHVnZXRsYnBhZ2UuYwo+Pj4+IGluZGV4IDE3MDc1Yzc4ZDRiYy4u
N2NkNDBhMzM0YzNhIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9y
YWRpeF9odWdldGxicGFnZS5jCj4+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3Jh
ZGl4X2h1Z2V0bGJwYWdlLmMKPj4+PiBAQCAtNTgsNSArNTgsNSBAQCB2b2lkIHJhZGl4X19odWdl
X3B0ZXBfbW9kaWZ5X3Byb3RfY29tbWl0KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+Pj4+
ICAgIAkgICAgYXRvbWljX3JlYWQoJm1tLT5jb250ZXh0LmNvcHJvcykgPiAwKQo+Pj4+ICAgIAkJ
cmFkaXhfX2ZsdXNoX2h1Z2V0bGJfcGFnZSh2bWEsIGFkZHIpOwo+Pj4+ICAgIAo+Pj4+IC0Jc2V0
X2h1Z2VfcHRlX2F0KHZtYS0+dm1fbW0sIGFkZHIsIHB0ZXAsIHB0ZSk7Cj4+Pj4gKwlzZXRfaHVn
ZV9wdGVfYXQodm1hLCBhZGRyLCBwdGVwLCBwdGUpOwo+Pj4+ICAgIH0KPj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL21tL25vaGFzaC84eHguYyBiL2FyY2gvcG93ZXJwYy9tbS9ub2hhc2gv
OHh4LmMKPj4+PiBpbmRleCBkYmJmZTg5NzQ1NWQuLjY1MGE3YTg0OTZiNiAxMDA2NDQKPj4+PiAt
LS0gYS9hcmNoL3Bvd2VycGMvbW0vbm9oYXNoLzh4eC5jCj4+Pj4gKysrIGIvYXJjaC9wb3dlcnBj
L21tL25vaGFzaC84eHguYwo+Pj4+IEBAIC05MSw3ICs5MSw3IEBAIHN0YXRpYyBpbnQgX19yZWYg
X19lYXJseV9tYXBfa2VybmVsX2h1Z2VwYWdlKHVuc2lnbmVkIGxvbmcgdmEsIHBoeXNfYWRkcl90
IHBhLAo+Pj4+ICAgIAlpZiAobmV3ICYmIFdBUk5fT04ocHRlX3ByZXNlbnQoKnB0ZXApICYmIHBn
cHJvdF92YWwocHJvdCkpKQo+Pj4+ICAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4+Pj4gICAgCj4+Pj4g
LQlzZXRfaHVnZV9wdGVfYXQoJmluaXRfbW0sIHZhLCBwdGVwLCBwdGVfbWtodWdlKHBmbl9wdGUo
cGEgPj4gUEFHRV9TSElGVCwgcHJvdCkpKTsKPj4+PiArCV9fc2V0X2h1Z2VfcHRlX2F0KCZpbml0
X21tLCB2YSwgcHRlcCwgcHRlX21raHVnZShwZm5fcHRlKHBhID4+IFBBR0VfU0hJRlQsIHByb3Qp
KSk7Cj4+Pgo+Pj4gQ2FsbCBzZXRfaHVnZV9wdGVfYXQoKSB3aXRoIGEgTlVMTCB2bWEgaW5zdGVh
ZC4KPj4KPj4gSSdtIGhhcHB5IHRvIHRha2UgeW91ciBwcm9wb3NlZCBhcHByb2FjaCBpZiB0aGF0
J3MgeW91ciBwcmVmZXJlbmNlLiBBbm90aGVyCj4+IG9wdGlvbiBpcyB0byB1c2UgYSBkdW1teSBW
TUEsIGFzIEkgaGF2ZSBkb25lIGluIHRoZSBjb3JlIGNvZGUsIGZvciB0aGUgb25lIGNhbGwKPj4g
c2l0ZSB0aGF0IGNhbGxzIHNldF9odWdlX3B0ZV9hdCgpIHdpdGggaW5pdF9tbToKPj4KPj4gc3Ry
dWN0IHZtX2FyZWFfc3RydWN0IHZtYSA9IFRMQl9GTFVTSF9WTUEoJmluaXRfbW0sIDApOwo+Pgo+
PiBUaGlzIGlzIGFuIGV4aXN0aW5nIG1hY3JvIHRoYXQgY3JlYXRlcyBhIGR1bW15IHZtYSB3aXRo
IHZtYS0+dm1fbW0gZmlsbGVkIGluLgo+PiBUaGVuIEkgcGFzcyAmdm1hIHRvIHRoZSBmdW5jdGlv
bi4KPiAKPiBJIGRvbid0IGxpa2UgdGhhdCwgSSBwcmVmZXIgdGhlIHNvbHV0aW9uIEkgcHJvcG9z
ZWQuIFdlIGFscmVhZHkgaGF2ZSBhIAo+IGNvdXBsZSBwbGFjZXMgd2hlcmUgcG93ZXJwYyBkbyB0
aGluZ3MgYmFzZWQgb24gd2hldGhlciB2bWEgaXMgTlVMTCBvciBub3QuCj4gCj4+Cj4+IE9yIHll
dCBhbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBrZWVwIHRoZSBtbSBwYXJhbSBhcyBpcyBpbiBz
ZXRfaHVnZV9wdGVfYXQoKSwKPj4gYW5kIGFkZCBhIHNpemUgcGFyYW0gdG8gdGhlIGZ1bmN0aW9u
LiBCdXQgdGhlbiBhbGwgY2FsbCBzaXRlcyBoYXZlIHRoZSBidXJkZW4gb2YKPj4gZmlndXJpbmcg
b3V0IHRoZSBzaXplIG9mIHRoZSBodWdlIHB0ZSAoYWx0aG91Z2ggSSB0aGluayBtb3N0IGtub3cg
YWxyZWFkeSkuCj4gCj4gSW5kZWVkLgo+IAo+IGFyY2hfbWFrZV9odWdlX3B0ZSgpIHVzZWQgdG8g
dGFrZSBhIHZtYSB1bnRpbCBjb21taXQgNzljMWM1OTRmNDlhIAo+ICgibW0vaHVnZXRsYjogY2hh
bmdlIHBhcmFtZXRlcnMgb2YgYXJjaF9tYWtlX2h1Z2VfcHRlKCkiKS4KPiAKPiBTaG91bGQgd2Ug
dHJ5IGFuZCBoYXZlIHRoZSBzYW1lIGFwcHJvYWNoID8gT3IgaXMgaXQgaXJyZWxldmFudCA/CgpT
ZWUgWzFdOyBJJ20gZ29pbmcgdG8gcmV3b3JrIHRvIHBhc3MgbW0gKyBzaXplIHBhcmFtZXRlciBz
aW5jZSB0aGUgY3VycmVudAphcHByb2FjaCB3aWxsIGJyZWFrIHJpc2N2LgoKWzFdCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvZmM4NWY1OGUtZThlZC00YjI0LWEzZTUt
ZDYyODgxNTY1OTVlQGFybS5jb20vCgo+IAo+IENocmlzdG9waGUKPiAKPj4KPj4gVGhhbmtzLAo+
PiBSeWFuCj4+Cj4+Pgo+Pj4+ICAgIAo+Pj4+ICAgIAlyZXR1cm4gMDsKPj4+PiAgICB9Cj4+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMgYi9hcmNoL3Bvd2VycGMvbW0v
cGd0YWJsZS5jCj4+Pj4gaW5kZXggM2Y4NmZkMjE3NjkwLi45Y2JjYjU2MWE0ZDggMTAwNjQ0Cj4+
Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYwo+Pj4+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9tbS9wZ3RhYmxlLmMKPj4+PiBAQCAtMjg4LDcgKzI4OCw3IEBAIGludCBodWdlX3B0ZXBfc2V0
X2FjY2Vzc19mbGFncyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPj4+PiAgICB9Cj4+Pj4g
ICAgCj4+Pj4gICAgI2lmIGRlZmluZWQoQ09ORklHX1BQQ184eHgpCj4+Pj4gLXZvaWQgc2V0X2h1
Z2VfcHRlX2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90
ICpwdGVwLCBwdGVfdCBwdGUpCj4+Pj4gK3ZvaWQgX19zZXRfaHVnZV9wdGVfYXQoc3RydWN0IG1t
X3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwgcHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZSkK
Pj4+Cj4+PiBLZWVwIGl0IGFzIHNldF9odWdlX3B0ZV9hdCgpIHdpdGggdm1hIGFyZ3VtZW50Lgo+
Pj4KPj4+PiAgICB7Cj4+Pj4gICAgCXBtZF90ICpwbWQgPSBwbWRfb2ZmKG1tLCBhZGRyKTsKPj4+
Cj4+PiBDaGFuZ2UgdG86Cj4+Pgo+Pj4gCXBtZF90ICpwbWQgPSB2bWEgPyBwbWRfb2ZmKHZtYS0+
dm1fbW0sIGFkZHIpIDogcG1kX29mZl9rKGFkZHIpOwo+Pj4KPj4+PiAgICAJcHRlX2Jhc2ljX3Qg
dmFsOwo+Pj4+IEBAIC0zMTAsNiArMzEwLDExIEBAIHZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVfCj4+
Pj4gICAgCWZvciAoaSA9IDA7IGkgPCBudW07IGkrKywgZW50cnkrKywgdmFsICs9IFNaXzRLKQo+
Pj4+ICAgIAkJKmVudHJ5ID0gdmFsOwo+Pj4+ICAgIH0KPj4+PiArCj4+Pj4gK3ZvaWQgc2V0X2h1
Z2VfcHRlX2F0KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIs
IHB0ZV90ICpwdGVwLCBwdGVfdCBwdGUpCj4+Pj4gK3sKPj4+PiArCV9fc2V0X2h1Z2VfcHRlX2F0
KHZtYS0+dm1fbW0sIGFkZHIsIHB0ZXAsIHB0ZSk7Cj4+Pj4gK30KPj4+Cj4+PiBSZW1vdmUgdGhp
cyBidXJkZW4uCj4+Pgo+Pj4+ICAgICNlbmRpZgo+Pj4+ICAgICNlbmRpZiAvKiBDT05GSUdfSFVH
RVRMQl9QQUdFICovCj4+Pj4gICAgCj4+Pgo+Pj4KPj4+IENocmlzdG9waGUKPj4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
