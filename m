Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99753C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 12:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbllJ3lVeHiN5m+oRji9U04FWcffYVa2hXIZAbl1LLI=; b=byBTQBJmjl+D6N
	JMoyZc/mF3jJnc7XZwNCZfFi58oGXKiCiUJMOnoJUd+hwx/iNcI+yemHH2NUkOVmQ/B3hO3g8/0Nt
	0C7zJLC4qTi4uIj3ZpwNFzTkX+pz0EdLRSvFPuUte1x63iQ2IJY0gLgL67SVeIZuQcSearZnvF473
	PPFwfgEuToBHiIyrcizFEM+1m89ATf6BU7zbxo4RtzNPCaiTiSk2zrbFssIe1vyQBzYTW7F+z6iLQ
	Sery4otXDt/FkDdOkuFyuM/tu/TUyLJ+rzJtUHjlDlOma36pWun6sXKVjkANAbGyrRznIH5p76TuK
	EXzBchaPlrWF7jtnf6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFtL-00GPaw-23;
	Tue, 23 Jan 2024 12:28:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFtI-00GPZ4-0O;
	Tue, 23 Jan 2024 12:28:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B0011FB;
	Tue, 23 Jan 2024 04:29:15 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6882C3F762;
	Tue, 23 Jan 2024 04:28:26 -0800 (PST)
Message-ID: <40112a27-eddb-4c1a-a859-a34e202e6564@arm.com>
Date: Tue, 23 Jan 2024 12:28:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/11] mm/memory: optimize fork() with PTE-mapped THP
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-10-david@redhat.com>
 <63be0c3c-bf34-4cbb-b47b-7c9be0e65058@arm.com>
 <31a0661e-fa69-419c-9936-98bfe168d5a7@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <31a0661e-fa69-419c-9936-98bfe168d5a7@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_042832_252954_1FD06B50 
X-CRM114-Status: GOOD (  23.11  )
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

T24gMjMvMDEvMjAyNCAxMjoxOSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gWy4uLl0KPiAK
Pj4KPj4gSSB3cm90ZSBzb21lIGRvY3VtZW50YXRpb24gZm9yIHRoaXMgKGJhc2VkIG9uIE1hdHRo
ZXcncyBkb2NzIGZvciBzZXRfcHRlcygpIGluCj4+IG15IHZlcnNpb24uIFBlcmhhcHMgaXQgbWFr
ZXMgc2Vuc2UgdG8gYWRkIGl0IGhlcmUsIGdpdmVuIHRoaXMgaXMgb3ZlcnJpZGFibGUgYnkKPj4g
dGhlIGFyY2guCj4+Cj4+IC8qKgo+PiDCoCAqIHdycHJvdGVjdF9wdGVzIC0gV3JpdGUgcHJvdGVj
dCBhIGNvbnNlY3V0aXZlIHNldCBvZiBwYWdlcy4KPj4gwqAgKiBAbW06IEFkZHJlc3Mgc3BhY2Ug
dGhhdCB0aGUgcGFnZXMgYXJlIG1hcHBlZCBpbnRvLgo+PiDCoCAqIEBhZGRyOiBBZGRyZXNzIG9m
IGZpcnN0IHBhZ2UgdG8gd3JpdGUgcHJvdGVjdC4KPj4gwqAgKiBAcHRlcDogUGFnZSB0YWJsZSBw
b2ludGVyIGZvciB0aGUgZmlyc3QgZW50cnkuCj4+IMKgICogQG5yOiBOdW1iZXIgb2YgcGFnZXMg
dG8gd3JpdGUgcHJvdGVjdC4KPj4gwqAgKgo+PiDCoCAqIE1heSBiZSBvdmVycmlkZGVuIGJ5IHRo
ZSBhcmNoaXRlY3R1cmUsIGVsc2UgaW1wbGVtZW50ZWQgYXMgYSBsb29wIG92ZXIKPj4gwqAgKiBw
dGVwX3NldF93cnByb3RlY3QoKS4KPj4gwqAgKgo+PiDCoCAqIENvbnRleHQ6IFRoZSBjYWxsZXIg
aG9sZHMgdGhlIHBhZ2UgdGFibGUgbG9jay4gVGhlIFBURXMgYXJlIGFsbCBpbiB0aGUgc2FtZQo+
PiDCoCAqIFBNRC4KPj4gwqAgKi8KPj4KPiAKPiBJIGNvdWxkIGhhdmUgc3dvcm4gSSBoYWQgYSBk
b2N1bWVudGF0aW9uIGF0IHNvbWUgcG9pbnQuIExldCBtZSBhZGQgc29tZSwgdGhhbmtzLgo+IAo+
IFsuLi5dCj4gCj4+PiArCj4+PiArwqDCoMKgIC8qCj4+PiArwqDCoMKgwqAgKiBJZiB3ZSBsaWtl
bHkgaGF2ZSB0byBjb3B5LCBqdXN0IGRvbid0IGJvdGhlciB3aXRoIGJhdGNoaW5nLiBNYWtlCj4+
PiArwqDCoMKgwqAgKiBzdXJlIHRoYXQgdGhlIGNvbW1vbiAic21hbGwgZm9saW8iIGNhc2Ugc3Rh
eXMgYXMgZmFzdCBhcyBwb3NzaWJsZQo+Pj4gK8KgwqDCoMKgICogYnkga2VlcGluZyB0aGUgYmF0
Y2hpbmcgbG9naWMgc2VwYXJhdGUuCj4+PiArwqDCoMKgwqAgKi8KPj4+ICvCoMKgwqAgaWYgKHVu
bGlrZWx5KCEqcHJlYWxsb2MgJiYgZm9saW9fdGVzdF9sYXJnZShmb2xpbykgJiYgbWF4X25yICE9
IDEpKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgbnIgPSBmb2xpb19wdGVfYmF0Y2goZm9saW8sIGFk
ZHIsIHNyY19wdGUsIHB0ZSwgbWF4X25yKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZm9saW9f
dGVzdF9hbm9uKGZvbGlvKSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9saW9fcmVm
X2FkZChmb2xpbywgbnIpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5
KGZvbGlvX3RyeV9kdXBfYW5vbl9ybWFwX3B0ZXMoZm9saW8sIHBhZ2UsCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG5yLCBzcmNfdm1hKSkpIHsKPj4KPj4gV2hhdCBoYXBwZW5zIGlmIGl0cyBub3QgdGhlIGZpcnN0
IHBhZ2Ugb2YgdGhlIGJhdGNoIHRoYXQgZmFpbHMgaGVyZT8gQXJlbid0IHlvdQo+PiBzaWduYWxs
aW5nIHRoYXQgeW91IG5lZWQgYSBwcmVhbGxvYydlZCBwYWdlIGZvciB0aGUgd3JvbmcgcHRlPyBT
aG91bGRuJ3QgeW91Cj4+IHN0aWxsIGJhdGNoIGNvcHkgYWxsIHRoZSB3YXkgdXAgdG8gdGhlIGZh
aWxpbmcgcGFnZSBmaXJzdD8gUGVyaGFwcyBpdCBhbGwgY29tZXMKPj4gb3V0IGluIHRoZSB3YXNo
IGFuZCB0aGVzZSBldmVudHMgYXJlIHNvIGluZnJlcXVlbnQgdGhhdCB3ZSBkb24ndCBjYXJlIGFi
b3V0IHRoZQo+PiBsb3N0IGJhdGNoaW5nIG9wcG9ydHVuaXR5Pwo+IAo+IEkgYXNzdW1lIHlvdSBt
ZWFuIHRoZSB3ZWlyZCBjb3JuZXIgY2FzZSB0aGF0IHNvbWUgZm9saW8gcGFnZXMgaW4gdGhlIHJh
bmdlIGhhdmUKPiBQQUUgc2V0LCBvdGhlcnMgZG9uJ3QgLS0gYW5kIHRoZSBmb2xpbyBtYXliZSBw
aW5uZWQuCj4gCj4gSW4gdGhhdCBjYXNlLCB3ZSBmYWxsYmFjayB0byBpbmRpdmlkdWFsIHBhZ2Vz
LCBhbmQgbWlnaHQgaGF2ZSBwcmVhbGxvY2F0ZWQgYQo+IHBhZ2UgYWx0aG91Z2ggd2Ugd291bGRu
J3QgaGF2ZSB0byBwcmVhbGxvY2F0ZSBvbmUgZm9yIHByb2Nlc3NpbmcgdGhlIG5leHQgcGFnZQo+
ICh0aGF0IGRvZXNuJ3QgaGF2ZSBQQUUgc2V0KS4KPiAKPiBJdCBzaG91bGQgYWxsIHdvcmssIGFs
dGhvdWdoIG5vdCBvcHRpbWl6ZWQgdG8gdGhlIGV4dHJlbWUsIGFuZCBhcyBpdCdzIGEgY29ybmVy
Cj4gY2FzZSwgd2UgZG9uJ3QgcGFydGljdWxhcmx5IGNhcmUuIEhvcGVmdWxseSwgaW4gdGhlIGZ1
dHVyZSB3ZSdsbCBvbmx5IGhhdmUgYQo+IHNpbmdsZSBQQUUgZmxhZyBwZXIgZm9saW8uCj4gCj4g
T3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KCk5vLCB5b3VyIGV4cGxhbmF0aW9uIG1ha2VzIHNl
bnNlLiBKdXN0IHdhbnRlZCB0byBjaGVjayB0aGlzIGFsbCBkZWZpbml0ZWx5CndvcmtlZCwgYmVj
YXVzZSB0aGUgZmxvdyBpcyBzbGlnaHRseSBkaWZmZXJlbnQgdG8gbXkgcHJldmlvdXMgdmVyc2lv
biB0aGF0IHdhcwpkb2luZyB0cnlfZHVwX3JtYXAgcGFnZS1ieS1wYWdlLgoKPiAKPj4KPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9saW9fcmVmX3N1Yihmb2xpbywgbnIpOwo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVBR0FJTjsKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJzc1tN
TV9BTk9OUEFHRVNdICs9IG5yOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVk1fV0FSTl9P
Tl9GT0xJTyhQYWdlQW5vbkV4Y2x1c2l2ZShwYWdlKSwgZm9saW8pOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIH0gZWxzZSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb2xpb19yZWZfYWRkKGZv
bGlvLCBucik7Cj4+Cj4+IFBlcmhhcHMgaG9pc3QgdGhpcyBvdXQgdG8gaW1tZWRpYXRlbHkgYWZ0
ZXIgZm9saW9fcHRlX2JhdGNoKCkgc2luY2UgeW91J3JlCj4+IGNhbGxpbmcgaXQgb24gYm90aCBi
cmFuY2hlcz8KPiAKPiBNYWtlcyBzZW5zZSwgdGhhbmtzLgo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
