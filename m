Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC81C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=So3ysNU2WX7PPE6jwlFSopvRDRQO55psgbjb+aVxQN0=; b=P+cf71sbx0PUE/
	eWVduB84ohZl8ztsKKmh0WfQUoqgqNDTyAZY0s8NDV3zntOcYXVuH9Dy1aTyXRgkZox384LLin1nk
	MbtcJXtKXFJqmmzoOpnQDCzjS76Cf12AurAqFt9+cqTCuLav1/LVEeSu0KeQgvKcHM+98dIQFoZRL
	nhzFMnv/5/Y0ucswC6JQTJvTxFHIRq9s4npFrBHm9T5y2Xz3w9ozotidw344dA6Hlz7607l1Z4OkN
	4L1ux/9z2wadm9ANgJa/b2glz0AcOC8dmeOl93fkNC9gLoljltc+G5L/eb3mh23TKTmK9SuXIyM+s
	BhJHhPoQxoHza/bNLFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzBtK-0000000GXbK-44Bs;
	Tue, 23 Apr 2024 08:52:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzBtH-0000000GXaE-39mC;
	Tue, 23 Apr 2024 08:52:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A3D3339;
	Tue, 23 Apr 2024 01:53:06 -0700 (PDT)
Received: from [10.57.74.127] (unknown [10.57.74.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84B663F64C;
	Tue, 23 Apr 2024 01:52:36 -0700 (PDT)
Message-ID: <23a2e491-f4e2-4ab0-859c-8637ffb3d21e@arm.com>
Date: Tue, 23 Apr 2024 09:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-GB
To: Alexandre Ghiti <alex@ghiti.fr>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: alexghiti@rivosinc.com, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org
References: <CAHVXubiH64beFuB_GHSq5BKCus=O_+bqYTCwWQ+=2Q-F=T=ctQ@mail.gmail.com>
 <mhng-911ba065-e6c8-4d42-978c-e47897bcb493@palmer-ri-x1c9a>
 <20240419110306.GA2972@willie-the-truck>
 <f6488073-b93f-4945-9d30-1ceb548d6bb4@ghiti.fr>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <f6488073-b93f-4945-9d30-1ceb548d6bb4@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_015239_936953_210D532B 
X-CRM114-Status: GOOD (  17.44  )
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

T24gMjIvMDQvMjAyNCAwOTo1MCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDE5LzA0LzIwMjQgMTM6MDMsIFdpbGwgRGVhY29uIHdyb3RlOgo+PiBPbiBUaHUsIEFwciAxOCwg
MjAyNCBhdCAwMzoxMTo1NlBNIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4+IE9uIEZy
aSwgMDEgTWFyIDIwMjQgMDM6Mjk6MTggUFNUICgtMDgwMCksIGFsZXhnaGl0aUByaXZvc2luYy5j
b20gd3JvdGU6Cj4+Pj4gT24gRnJpLCBNYXIgMSwgMjAyNCBhdCAxMTo0NeKAr0FNIFJ5YW4gUm9i
ZXJ0cyA8cnlhbi5yb2JlcnRzQGFybS5jb20+IHdyb3RlOgo+Pj4+PiBJIGNvbmZlc3MgSSBoYXZl
bid0IGxvb2tlZCBhdCB0aGUgcGF0Y2hlcyB5ZXQsIGJ1dCB0aGlzIGNvdmVyIGxldHRlciByYWlz
ZXMgYQo+Pj4+PiBmZXcgcXVlc2lvbnMgZm9yIG1lLiBJJ2xsIGFpbSB0byBsb29rIGF0IHRoZSBh
Y3R1YWwgcGF0Y2hlcyBpbiBkdWUgY291cnNlLgo+Pj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0
IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+Pj4KPj4+IGluIGNhc2Ugc29tZW9uZSB3YW50cyB0byBw
aWNrIHRoZW0gdXAgdmlhIGEgZ2VuZXJpYyB0cmVlLsKgIEknbSBoYXBweSB0byB0YWtlCj4+PiB0
aGVtIHZpYSB0aGUgUklTQy1WIHRyZWUgaWYgZm9sayB3YW50LCBubyBydXNoIG9uIG15IGVuZCBJ
J20ganVzdCBzY3J1YmJpbmcKPj4+IHRocm91Z2ggb2xkIHN0dWZmLgo+PiBJJ2QgZGVmaW5pdGVs
eSBsaWtlIHRvIHRha2UgdGhlIGFybTY0IHBhcnRzIHZpYSB0aGUgYXJtNjQgdHJlZSAob24gYQo+
PiBzaGFyZWQgYnJhbmNoKSwgYXMgaXQncyBhIG5vbi10cml2aWFsIGFtb3VudCBvZiBtbSBjb2Rl
IHdoaWNoIG1heSBlbmQgdXAKPj4gY29uZmxpY3RpbmcuIEknZCBhbHNvIGxpa2UgdG8gc2VlIFJ5
YW4ncyBBY2sgb24gdGhlIGNoYW5nZXMgYmVmb3JlIHRoZXNlCj4+IGVuZCB1cCBpbiAtbmV4dC4K
Pj4KPj4gV2lsbAo+IAo+IAo+IFRoZSByZWJhc2Ugb24gdG9wIG9mIHRoZSBjb250cHRlIG1USFAg
c3VwcG9ydCBjaGFuZ2VkIHF1aXRlIGEgZmV3IHRoaW5ncywgSSBoYXZlCj4gc29tZXRoaW5nIHdv
cmtpbmcgYW5kIHdpbGwgc2VuZCBpdCBzb29uLCBzbyBubyBuZWVkIHRvIHJldmlldyB0aGlzIHBh
dGNoc2V0LgoKU29ycnkgdGhpcyBmZWxsIG9mZiBteSBkZXNrLiBDQyBtZSBvbiB0aGUgbmV4dCB2
ZXJzaW9uIGFuZCBJJ2xsIHRha2UgYSBsb29rLgoKPiAKPiBUaGFua3MsCj4gCj4gQWxleAo+IAo+
IAo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
