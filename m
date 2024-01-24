Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954EEC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 05:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sx19jw3WnwFgZVPe3NKudm3v+JWqped1jzQF034fgsw=; b=ehLllXPEswIZNn
	5p2Mk/Ad8ZZ2TtepHah/EsK+cik7f4v6rRxXcoZEjK/GerA1Sd+i8esJNXYoWJSnTqO0m4LHNQZL9
	K3hFYBwvZQm6Oqt3MVtnXd281NxwAZY1gC3+k9uMPQVfcqh+B9QSg8VZaxXMrx9zKrhjlpp23Lguj
	aHxvmxHgq4ccTY0hlz9/GSodbuaZCtzqPl8CkKKzNb+uPkM9A4tk9MYykeYvpuaBtfC6GFUJZVM3M
	3aN7ZPegDN5ORBx0TImEHYwN+BaPYjkNIGA0FPM8xfZ85STX4lxTtoQ7lQQkFEBvu+FHn5O/ktrnq
	nyEb6zV/IINtK6t4e3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSW4g-001cuL-0H;
	Wed, 24 Jan 2024 05:45:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSW4c-001crt-2I;
	Wed, 24 Jan 2024 05:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A30E60FDB;
	Wed, 24 Jan 2024 05:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA06C433F1;
	Wed, 24 Jan 2024 05:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706075117;
	bh=5dLOTB19eqgu6rIiWX9LXiC2Xe6lJz1n50JwsYBoJ6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O1skpl4y2xjw6BP+gzZ5mPe0LKyiUIrkGJSxeRvOjofb/gZvo6wl7nFZdgUFQ8p8g
	 mKeTO4ObwcUC2+OyxrBUFcF6ovICMunK8lCIQIgR+AqdvzCkI0GjG8X1Rp61fv1x0O
	 sXYkIvLLfqVyEudSZNXUQ7C6skbTv82wU+p9IkYysxMfhaPHouWfsN/hk5ltc2+h0S
	 XzFm2ohqjonzRS2gKeLXiMhGX5iu1V+ZgCwo5e1vYgDR7B50640MCgmUl3IJbLWDcS
	 qOgK2IzFJaPYHpWQn+N9JUVQLiSVJ/DJXQoM6urufjCoLD8pjAm5mcQutss0xfdEOG
	 C2zeUU0iz2qHw==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: David Hildenbrand <david@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
In-Reply-To: <794c1dc3-520c-4030-b0fe-e24782576347@redhat.com>
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
 <6703b648-10ab-4fea-b7f1-75421319465b@arm.com>
 <ae3d826f-758f-4738-b72a-e99f098bb2b3@csgroup.eu>
 <3a970289-a72f-418e-b43c-89f67f0d5283@redhat.com>
 <e0d9caab-39c7-446a-aeef-5d914d321c72@arm.com>
 <794c1dc3-520c-4030-b0fe-e24782576347@redhat.com>
Date: Wed, 24 Jan 2024 11:15:03 +0530
Message-ID: <8734unqo80.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_214518_851475_B1F2C9D9 
X-CRM114-Status: GOOD (  13.53  )
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

RGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyaXRlczoKCj4gT24gMjMuMDEu
MjQgMTI6MzgsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4gT24gMjMvMDEvMjAyNCAxMTozMSwgRGF2
aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+Cj4+Pj4+PiBJZiBoaWdoIGJpdHMgYXJlIHVzZWQg
Zm9yCj4+Pj4+PiBzb21ldGhpbmcgZWxzZSwgdGhlbiB3ZSBtaWdodCBwcm9kdWNlIGEgZ2FyYmFn
ZSBQVEUgb24gb3ZlcmZsb3csIGJ1dCB0aGF0Cj4+Pj4+PiBzaG91bGRuJ3QgcmVhbGx5IG1hdHRl
ciBJIGNvbmNsdWRlZCBmb3IgZm9saW9fcHRlX2JhdGNoKCkgcHVycG9zZXMsIHdlJ2Qgbm90Cj4+
Pj4+PiBkZXRlY3QgImJlbG9uZ3MgdG8gdGhpcyBmb2xpbyBiYXRjaCIgZWl0aGVyIHdheS4KPj4+
Pj4KPj4+Pj4gRXhhY3RseS4KPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBNYXliZSBpdCdzIGxpa2VseSBj
bGVhbmVyIHRvIGFsc28gaGF2ZSBhIGN1c3RvbSBwdGVfbmV4dF9wZm4oKSBvbiBwcGMsIEkganVz
dAo+Pj4+Pj4gaG9wZSB0aGF0IHdlIGRvbid0IGxvc2UgYW55IG90aGVyIGFyYml0cmFyeSBQVEUg
Yml0cyBieSBkb2luZyB0aGUgcHRlX3BncHJvdCgpLgo+Pj4+Pgo+Pj4+PiBJIGRvbid0IHNlZSB0
aGUgbmVlZCBmb3IgcHBjIHRvIGltcGxlbWVudCBwdGVfbmV4dF9wZm4oKS4KPj4+Pgo+Pj4+IEFn
cmVlZC4KPj4+Cj4+PiBTbyBsaWtlbHkgd2Ugc2hvdWxkIHRoZW4gZG8gb24gdG9wIGZvciBwb3dl
cnBjICh3aGl0ZXNwYWNlIGRhbWFnZSk6Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9tbS9wZ3RhYmxlLmMgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jCj4+PiBpbmRleCBhMDRh
ZTQ0NDlhMDI1Li41NDlhNDQwZWQ3ZjY1IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL21t
L3BndGFibGUuYwo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYwo+Pj4gQEAgLTIy
MCwxMCArMjIwLDcgQEAgdm9pZCBzZXRfcHRlcyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAo+Pj4gcHRlX3QgKnB0ZXAsCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcHRlcCsrOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
ZGRyICs9IFBBR0VfU0laRTsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qCj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogaW5jcmVtZW50IHRoZSBwZm4uCj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwdGUgPSBwZm5fcHRlKHB0ZV9wZm4ocHRlKSArIDEsIHB0ZV9wZ3Byb3Qo
KHB0ZSkpKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB0ZSA9IHB0ZV9uZXh0
X3BmbihwdGUpOwo+Pj4gIMKgwqDCoMKgwqDCoMKgIH0KPj4+ICDCoH0KPj4gCj4+IExvb2tzIGxp
a2UgY29tbWl0IDQ3YjhkZWY5MzU4YyAoInBvd2VycGMvbW06IEF2b2lkIGNhbGxpbmcKPj4gYXJj
aF9lbnRlci9sZWF2ZV9sYXp5X21tdSgpIGluIHNldF9wdGVzIikgY2hhbmdlZCBmcm9tIGRvaW5n
IHRoZSBzaW1wbGUKPj4gaW5jcmVtZW50IHRvIHRoaXMgbW9yZSBjb21wbGV4IGFwcHJvYWNoLCBi
dXQgdGhlIGxvZyBkb2Vzbid0IHNheSB3aHkuCj4KPiBAQW5lZXNoLCB3YXMgdGhhdCBjaGFuZ2Ug
b24gcHVycG9zZT8KPgoKQmVjYXVzZSB3ZSBoYWQgYSBidWcgd2l0aCB0aGUgcGF0Y2ggdGhhdCBp
bnRyb2R1Y2VkIHRoZSBjaGFuZ2UgYW5kIHRoYXQKbGluZSB3YXMgY29uZnVzaW5nLiBUaGUgcmln
aHQgdGhpbmcgc2hvdWxkIGhhdmUgYmVlbiB0byBhZGQKcHRlX3Bmbl9uZXh0KCkgdG8gbWFrZSBp
dCBjbGVhci4gSXQgd2FzIGNvbmZ1c2luZyBiZWNhdXNlIG5vdCBhbGwgcHRlCmZvcm1hdCBoYWQg
cGZuIGF0IFBBR0VfU0hJRlQgb2Zmc2V0IChldmVuIHRob3VnaCB3ZSBkaWQgdXNlIHRoZSBjb3Jy
ZWN0ClBURV9SUE5fU0hJRlQgaW4gdGhpcyBzcGVjaWZpYyBjYXNlKS4gVG8gbWFrZSBpdCBzaW1w
bGVyIEkgZW5kZWQgdXAKc3dpdGNoaW5nIHRoYXQgbGluZSB0byBwdGVfcGZuKHB0ZSkgKyAxIC4K
Ci1hbmVlc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
