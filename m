Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A695CD4F2B
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 08:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ju5BMWdJPKS2ywfoY/A8ZYIlpIZH/+gyX+8qG0UfEb4=; b=xDJitZ/Tc42P9q
	3a+bOlB+wgkRnLWIy76NvuLlM3aBgFK5W8lFqNOqWbEypAAwfaQFW9zMOvu3KyUvJrCFWmeFBM372
	kf7hQg/0c8zVe6rUamWdOk6flIxLwC8NHY8Vj7PDb1duMdT/3Seneh+XIdO0TeKYGXhl3sKhdk5z9
	2Qv/85J/N28gYyk1+bEtzsL8hpnmaxES+PS3LFCS8fF+7vu6JlnlsUQY/HOqVk6OY4cDrBvri2ajq
	CkWqc4Jjh0eOPP0wgEICgXiWDrrqWGnFiJ2wiPhhBUxocwP7oU4TbnGGEX600HFoe+BWvNvV3j8kh
	9BTa13oaOsIm9OGC9nPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbeD-008Qr6-0x;
	Fri, 22 Sep 2023 08:36:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjbe8-008Qoj-2J;
	Fri, 22 Sep 2023 08:36:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B69FDA7;
	Fri, 22 Sep 2023 01:36:52 -0700 (PDT)
Received: from [10.57.65.11] (unknown [10.57.65.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F7F03F67D;
	Fri, 22 Sep 2023 01:36:09 -0700 (PDT)
Message-ID: <fc85f58e-e8ed-4b24-a3e5-d6288156595e@arm.com>
Date: Fri, 22 Sep 2023 09:36:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] riscv: hugetlb: Convert set_huge_pte_at() to take
 vma
Content-Language: en-GB
To: Alexandre Ghiti <alex@ghiti.fr>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-4-ryan.roberts@arm.com>
 <7bbceed4-c5f6-42d4-5d94-060032b73385@ghiti.fr>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <7bbceed4-c5f6-42d4-5d94-060032b73385@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_013620_863697_561704DE 
X-CRM114-Status: GOOD (  29.02  )
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

T24gMjIvMDkvMjAyMyAwODo1NCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIFJ5YW4sCj4g
Cj4gT24gMjEvMDkvMjAyMyAxODoyMCwgUnlhbiBSb2JlcnRzIHdyb3RlOgo+PiBJbiBvcmRlciB0
byBmaXggYSBidWcsIGFybTY0IG5lZWRzIGFjY2VzcyB0byB0aGUgdm1hIGluc2lkZSBpdCdzCj4+
IGltcGxlbWVudGF0aW9uIG9mIHNldF9odWdlX3B0ZV9hdCgpLiBQcm92aWRlIGZvciB0aGlzIGJ5
IGNvbnZlcnRpbmcgdGhlCj4+IG1tIHBhcmFtZXRlciB0byBiZSBhIHZtYS4gQW55IGltcGxlbWVu
dGF0aW9ucyB0aGF0IHJlcXVpcmUgdGhlIG1tIGNhbgo+PiBhY2Nlc3MgaXQgdmlhIHZtYS0+dm1f
bW0uCj4+Cj4+IFRoaXMgY29tbWl0IG1ha2VzIHRoZSByZXF1aXJlZCByaXNjdiBtb2RpZmljYXRp
b25zLiBTZXBhcmF0ZSBjb21taXRzCj4+IHVwZGF0ZSB0aGUgb3RoZXIgYXJjaGVzIGFuZCBjb3Jl
IGNvZGUsIGJlZm9yZSB0aGUgYWN0dWFsIGJ1ZyBpcyBmaXhlZCBpbgo+PiBhcm02NC4KPj4KPj4g
Tm8gYmVoYXZpb3JhbCBjaGFuZ2VzIGludGVuZGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSeWFu
IFJvYmVydHMgPHJ5YW4ucm9iZXJ0c0Bhcm0uY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9odWdldGxiLmggfCAyICstCj4+IMKgIGFyY2gvcmlzY3YvbW0vaHVnZXRsYnBh
Z2UuY8KgwqDCoMKgwqAgfCAzICsrLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHVnZXRsYi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9odWdldGxiLmgKPj4gaW5k
ZXggMzRlMjRmMDc4Y2MxLi5iZTFhYzg1ODJiYzIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHVnZXRsYi5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHVn
ZXRsYi5oCj4+IEBAIC0xNyw3ICsxNyw3IEBAIHZvaWQgaHVnZV9wdGVfY2xlYXIoc3RydWN0IG1t
X3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGxvbmcgc3opOwo+PiDCoCDCoCAjZGVmaW5lIF9f
SEFWRV9BUkNIX0hVR0VfU0VUX0hVR0VfUFRFX0FUCj4+IC12b2lkIHNldF9odWdlX3B0ZV9hdChz
dHJ1Y3QgbW1fc3RydWN0ICptbSwKPj4gK3ZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVk
IGxvbmcgYWRkciwgcHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZSk7Cj4+IMKgIMKgICNkZWZpbmUgX19I
QVZFX0FSQ0hfSFVHRV9QVEVQX0dFVF9BTkRfQ0xFQVIKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvbW0vaHVnZXRsYnBhZ2UuYyBiL2FyY2gvcmlzY3YvbW0vaHVnZXRsYnBhZ2UuYwo+PiBpbmRl
eCA5NjIyNWE4NTMzYWQuLjdjZGJmMDk2MDc3MiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9t
bS9odWdldGxicGFnZS5jCj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaHVnZXRsYnBhZ2UuYwo+PiBA
QCAtMTc3LDExICsxNzcsMTIgQEAgcHRlX3QgYXJjaF9tYWtlX2h1Z2VfcHRlKHB0ZV90IGVudHJ5
LCB1bnNpZ25lZCBpbnQKPj4gc2hpZnQsIHZtX2ZsYWdzX3QgZmxhZ3MpCj4+IMKgwqDCoMKgwqAg
cmV0dXJuIGVudHJ5Owo+PiDCoCB9Cj4+IMKgIC12b2lkIHNldF9odWdlX3B0ZV9hdChzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwKPj4gK3ZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcg
YWRkciwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwdGVfdCAqcHRlcCwKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwdGVfdCBwdGUpCj4+IMKgIHsKPj4gK8KgwqDCoCBz
dHJ1Y3QgbW1fc3RydWN0ICptbSA9IHZtYS0+dm1fbW07Cj4+IMKgwqDCoMKgwqAgaW50IGksIHB0
ZV9udW07Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKCFwdGVfbmFwb3QocHRlKSkgewo+IAo+IAo+IFlv
dSBjYW4gYWRkOgo+IAo+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUBy
aXZvc2luYy5jb20+CgpUaGFua3MhCgo+IAo+IEkgcmVhbGl6ZSB0aGF0IHdlIG1heSBoYXZlIHRo
ZSBzYW1lIGlzc3VlIHdpdGggb3VyIGNvbnRpZyBwdGUgaW1wbGVtZW50YXRpb24KPiAoY2FsbGVk
IG5hcG90IGluIHJpc2N2KSBhcyB3ZSBkb24ndCBoYW5kbGUgc3dhcC9taWdyYXRpb24gZW50cmll
cyBhdCBhbGwuIFNvIEkKPiBndWVzcyB3ZSBuZWVkIHNvbWV0aGluZyBzaW1pbGFyLCBhbmQgSSds
bCBpbXBsZW1lbnQgaXQgKHVubGVzcyB5b3Ugd2FudCB0byBkbyBpdAo+IG9mIGNvdXJzZSwgYnV0
IEkgZ3Vlc3MgaXQncyBlYXNpZXIgZm9yIG1lIHRvIHRlc3QpLiAKClllcyAtSSdsbCBsZWF2ZSB5
b3UgdG8gZG8gdGhlIHJpc2N2IHBhcnQuCgo+IE9uZSAobWF5YmUgc3R1cGlkKSBxdWVzdGlvbgo+
IHRob3VnaDogd291bGRuJ3QgaXQgYmUgcG9zc2libGUgdG8gZXh0cmFjdCB0aGUgY29udGlnIHB0
ZSBzaXplIGZyb20gdGhlIHZhbHVlIG9mCj4gcHRlcCBpbnN0ZWFkIG9mIHVzaW5nIGEgdm1hPwoK
Tm90IGZvciBhcm02NDogV2Ugc3VwcG9ydCBjb250cG1kLCBwbWQgYW5kIGNvbnRwdGUgZW50cmll
cyBhcyBiYWNraW5nIGZvciB0aGUKbG9naWNhbCBodWdlIHB0ZSwgZGVwZW5kaW5nIG9uIHNpemUu
IFNvIHdpdGhvdXQgdGhlIHNpemUsIHdlIGNhbid0IGRpc3Rpbmd1aXNoCmJldHdlZW4gYSBjb2lu
Y2lkZW50YWxseS1hbGlnbmVkIHBtZCBlbnRyeSB2cyBhIGNvbnRwbWQgZW50cnkgKHdoaWNoIGlz
IGp1c3QgYQpmaXhlZCBzaXplIGJsb2NrIG9mIHBtZCBlbnRyaWVzKS4KCkRpc2N1c3Npb24gd2l0
aCBDaHJpc3RvcGhlIG9uIHRoZSBwb3dlcnBjIHBhdGNoIHRyaWdnZXJlZCBzb21lIHRoaW5raW5n
OyBUaGVyZQppcyB0aGVvcmV0aWNhbCBwcm9ibGVtIHdpdGggbXkgY3VycmVudCBhcHByb2FjaCBi
ZWNhdXNlIHRoZXJlIGlzIG9uZSBjYWxsIHNpdGUKaW4gdGhlIGNvcmUgY29kZSB0aGF0IGNhbGxz
IHNldF9odWdlX3B0ZV9hdCgmaW5pdF9tbSkuIEkndmUgY2hhbmdlZCB0aGF0IHRvOgoKICBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3Qgdm1hID0gVExCX0ZMVVNIX1ZNQSgmaW5pdF9tbSwgMCk7CiAgc2V0
X2h1Z2VfcHRlX2F0KCZ2bWEpOwoKa25vd2luZyB0aGF0IHRoaXMgd2lsbCBuZXZlciBhY3R1YWxs
eSBnZXQgY2FsbGVkIGZvciBhcm02NCBiZWNhdXNlIHdlIHJldHVybgpQQUdFX1NJWkUgZm9yIGFy
Y2hfdm1hcF9wdGVfcmFuZ2VfbWFwX3NpemUoKSBhbmQgYWxsIG90aGVyIGFyY2hlcyBqdXN0IHRh
a2UgdGhlCm1tIGFuZCBpZ25vcmUgdGhlIHJlc3Qgb2YgdGhlIHZtYS4gU28gaXQncyBzYWZlLCBi
dXQgZnJhZ2lsZS4KCkJ1dCBpdCBsb29rcyBsaWtlIHJpc2N2IG92ZXJyaWRlcyBhcmNoX3ZtYXBf
cHRlX3JhbmdlX21hcF9zaXplKCkgYW5kIHRoZXJlZm9yZQp0aGUgY2FsbCB3aWxsIGJlIG1hZGUg
dGhlcmUuIEFuZCBpZiByaXNjdiBhbHNvIG5lZWRzIHRvIGRldGVybWluZSB0aGUgc2l6ZSBmcm9t
CnRoZSB2bWEsIHRoZW4gYmFuZy4KClNvIEknbSBnb2luZyB0byByZXdvcmsgaXQgdG8gY29udGlu
dWUgdG8gcGFzcyB0aGUgbW0gaW4sIGJ1dCBhbHNvIGFkZCBhIHNpemUKcGFyYW1ldGVyLiBUaGVu
IGl0J3MgdG90YWxseSBzYWZlLiBXaWxsIHBvc3QgYSB2MiBsYXRlciB0b2RheS4KClRoYW5rcywK
UnlhbgoKPiAKPiBUaGFua3MsCj4gCj4gQWxleAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
