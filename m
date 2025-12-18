Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BF9D6ACDA
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/Rtex4jbdxTn+Vrq0/S0TGMhw5B6mDAsey75U6tKNU=; b=XPb1iZ2U6rzjPm
	wWe/AbWKN799KcPRp6ihHDZb1xxG1Bol4J6iq2sKhc7Op2HHpNCS8D6Tc8GwbQByhMsG7oPdyqbJQ
	joF5m4VhyILbixPKMVQqdHin4Aep1RioPiIi2nvLwZNNBTOspQqm424VdtT38suu0rqX2KfCuhAcS
	WwXkB6TwV0CHyBJsI3A6XXAaAO4Dtc4dZpPH+CiTy8gf2f15y5XhhC5rDpgt+oUX1IpK9nVzQUkPV
	OurD+I8NSuti6bW2nfiaZ4hH5VyMruAORR1vtA8r2346mDYckanIVV+RP3991qlqOPecqs9/TzmZn
	lbtVTaXHVOnECTl3Btww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAdb-00000008B5K-1Ud8;
	Thu, 18 Dec 2025 09:49:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAda-00000008B5D-1DG5
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 09:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A675600AC;
	Thu, 18 Dec 2025 09:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F25C4CEFB;
	Thu, 18 Dec 2025 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766051372;
	bh=jpct4wgiQvvz63Cwe2t0WKmpu8qE8JWTj+D4fEqN3KU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i+zreEJolTQBByW8JlPjfJ3Z1VMPes2Pd7PeJAb/lYS9S+kjePXS6fxK/1oiCfHLA
	 SApDHO3FssA1sTS4F0w9Fy38cvl6WxkWVC0byQPuPQVMzC/aSU38p7T3YrTzKe/lEq
	 +t3yiGig3MducPpc0NbGREP5v9YB9iZndsqe1W4uJCR6ayBC+wFjG6VFCOs/Ruqnwr
	 /aqNqVbKxX2atQFftfDEC4z1dyMeo2hNdSyY1J2kx4C/dxYP0m2u9xYNOYoJOhOi8v
	 V67YJYBgk8qBspVZuXfk+ga0SVCqlyGMbpJhXfGQGXvZ8Lw12uC/zGimGfkUK+YzIy
	 Z5I+jzlJ5xCgg==
Message-ID: <cbea0364-b8e3-4e3b-852f-b16436b60de1@kernel.org>
Date: Thu, 18 Dec 2025 10:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/22] mm: Allow page table accessors to be
 non-idempotent
To: Ryan Roberts <ryan.roberts@arm.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org
Cc: devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-9-samuel.holland@sifive.com>
 <fbfef7fc-4030-462b-b514-498eea6620aa@arm.com>
 <c2597d43-d909-4259-bb5b-9294e4069385@kernel.org>
 <af8fd275-a34d-4b2f-8834-9c85dab2bbae@sifive.com>
 <a063f6c5-2785-4a9f-8079-25edb3e54cef@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <a063f6c5-2785-4a9f-8079-25edb3e54cef@arm.com>
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

T24gMTIvMTEvMjUgMTQ6NTksIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPiBPbiAxMS8xMi8yMDI1IDAw
OjMzLCBTYW11ZWwgSG9sbGFuZCB3cm90ZToKPj4gT24gMjAyNS0xMS0yOCAyOjQ3IEFNLCBEYXZp
ZCBIaWxkZW5icmFuZCAoUmVkIEhhdCkgd3JvdGU6Cj4+PiBPbiAxMS8yNy8yNSAxNzo1NywgUnlh
biBSb2JlcnRzIHdyb3RlOgo+Pj4+IE9uIDEzLzExLzIwMjUgMDE6NDUsIFNhbXVlbCBIb2xsYW5k
IHdyb3RlOgo+Pj4+PiBDdXJyZW50bHksIHNvbWUgZnVuY3Rpb25zIHN1Y2ggYXMgcHRlX29mZnNl
dF9tYXAoKSBhcmUgcGFzc2VkIGJvdGgKPj4+Pj4gcG9pbnRlcnMgdG8gaGFyZHdhcmUgcGFnZSB0
YWJsZXMsIGFuZCBwb2ludGVycyB0byBwcmV2aW91c2x5LXJlYWQgUE1ECj4+Pj4+IGVudHJpZXMg
b24gdGhlIHN0YWNrLiBUbyBlbnN1cmUgY29ycmVjdG5lc3MgaW4gdGhlIGZpcnN0IGNhc2UsIHRo
ZXNlCj4+Pj4+IGZ1bmN0aW9ucyBtdXN0IHVzZSB0aGUgcGFnZSB0YWJsZSBhY2Nlc3NvciBmdW5j
dGlvbiAocG1kcF9nZXQoKSkgdG8KPj4+Pj4gZGVyZWZlcmVuY2UgdGhlIHN1cHBsaWVkIHBvaW50
ZXIuIEhvd2V2ZXIsIHRoaXMgbWVhbnMgcG1kcF9nZXQoKSBpcwo+Pj4+PiBjYWxsZWQgdHdpY2Ug
aW4gdGhlIHNlY29uZCBjYXNlLiBUaGlzIGRvdWJsZSBjYWxsIG11c3QgYmUgYXZvaWRlZCBpZgo+
Pj4+PiBwbWRwX2dldCgpIGFwcGxpZXMgc29tZSBub24taWRlbXBvdGVudCB0cmFuc2Zvcm1hdGlv
biB0byB0aGUgdmFsdWUuCj4+Pj4+Cj4+Pj4+IEF2b2lkIHRoZSBkb3VibGUgdHJhbnNmb3JtYXRp
b24gYnkgY2FsbGluZyBzZXRfcG1kKCkgb24gdGhlIHN0YWNrCj4+Pj4+IHZhcmlhYmxlcyB3aGVy
ZSBuZWNlc3NhcnkgdG8ga2VlcCBzZXRfcG1kKCkvcG1kcF9nZXQoKSBjYWxscyBiYWxhbmNlZC4K
Pj4+Pgo+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIGdvb2Qgc29sdXRpb24uCj4+Pgo+Pj4g
QWdyZWVkLAo+Pj4KPj4+ICDCoMKgwqDCoHNldF9wbWQoJnBtZCwgcG1kKTsKPj4+Cj4+PiBpcyBy
YXRoZXIgaG9ycmlibGUuCj4+IEkgYWdyZWUgdGhhdCB0aGlzIHBhdGNoIGlzIHVnbHkuIFRoZSBv
bmx5IHdheSBJIHNlZSB0byBhdm9pZCBjb2RlIGxpa2UgdGhpcyBpcwo+PiB0byByZWZhY3RvciAo
b3IgZHVwbGljYXRlKSB0aGUgZnVuY3Rpb25zIHNvIG5vIGZ1bmN0aW9uIHRha2VzIHBvaW50ZXJz
IHRvIGJvdGgKPj4gaGFyZHdhcmUgcGFnZSB0YWJsZXMgYW5kIG9uLXN0YWNrIHBhZ2UgdGFibGUg
ZW50cmllcy4gSXMgdGhhdCBzb3J0IG9mCj4+IHJlZmFjdG9yaW5nIHRoZSByaWdodCBkaXJlY3Rp
b24gdG8gZ28gZm9yIHY0Pwo+IAo+ICBGcm9tIGEgcXVpY2sgbG9vayBhdCB0aGUgY29kZSwgSSB0
aGluayB0aGF0IHNvbWUgY2FzZXMgYXJlIHNvbHZhYmxlIGJ5Cj4gcmVmYWN0b3JpbmcgdG8gcGFz
cyB0aGUgdmFsdWUgaW5zdGVhZCBvZiB0aGUgcG9pbnRlciwgYW5kIGxlYXZlIGl0IHRvIHRoZSBo
aWdoZXIKPiBsZXZlbCBkZWNpZGUgaG93IHRvIHJlYWQgdGhlIHZhbHVlIGZyb20gdGhlIHBvaW50
ZXIgLSBpdCBrbm93cyBpZiBpdCBpcyBwb2ludGluZwo+IHRvIEhXIHBndGFibGUgb3IgaWYgaXQn
cyBhIChlLmcpIHN0YWNrIHZhbHVlLgo+IAo+IEJ1dCB0aGUgbW9yZSBJIGxvb2sgYXQgdGhlIGNv
ZGUsIHRoZSBtb3JlIGluc3RhbmNlcyBJIGZpbmQgd2hlcmUgcG9pbnRlcnMgdG8KPiBzdGFjayB2
YXJpYWJsZXMgYXJlIGJlaW5nIHBhc3NlZCB0byBhcmNoIHBndGFibGUgaGVscGVycyBhcyBpZiB0
aGV5IGFyZSBIVwo+IHBndGFibGUgZW50cnkgcG9pbnRlcnMuIChNYWlubHkgcG1kIGxldmVsKS4K
PiAKPiBJIHdvbmRlciBpZiB3ZSBuZWVkIHRvIGJpdGUgdGhlIGJ1bGxldCBhbmQgZXhwbGljaXRs
eSBzZXBhcmF0ZSB0aGUgdHlwZXM/IEF0Cj4gZWFjaCBsZXZlbCwgd2UgaGF2ZToKPiAKPiAgIDEu
IHBhZ2UgdGFibGUgZW50cnkgdmFsdWUKPiAgIDIuIHBvaW50ZXIgdG8gcGFnZSB0YWJsZSBlbnRy
eSBfdmFsdWVfIChlLmcuIHBvaW50ZXIgdG8gcFhYX3Qgb24gc3RhY2spCj4gICAzLiBwb2ludGVy
IHRvIHBhZ2UgdGFibGUgZW50cnkgaW4gSFcgcGd0YWJsZQo+IAo+IFRvZGF5LCAxIGlzIHJlcHJl
c2VudGVkIGJ5IHB0ZV90LCBwbWRfdCwgZXRjLiAyIGFuZCAzIGFyZSByZXByZXNlbnRlZCBieSB0
aGUKPiBzYW1lIHR5cGU7IHB0ZV90KiwgcG1kX3QqLCBldGMuCj4gCj4gSWYgd2UgY3JlYXRlIGEg
bmV3IHR5cGUgZm9yIDMsIGl0IHdpbGwgYm90aCBkb2N1bWVudCBhbmQgZW5mb3JjZSB3aGVuIHR5
cGUgMiBvcgo+IHR5cGUgMyBpcyByZXF1aXJlZC4KPiAKPiBlLmc6Cj4gCj4gLy8gcHRlX3Q6IGRl
ZmluZWQgYnkgYXJjaC4KPiB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgcHRlX3Q7Cj4gCj4gLy8gcHRl
cF90OiBuZXcgb3BhcXVlIHR5cGUgdGhhdCBjYW4ndCBiZSBkZXJlZmVyZW5jZWQuCj4gc3RydWN0
IF9fcHRlcF90Owo+IHR5cGVkZWYgc3RydWN0IF9fcHRlcF90ICpwdGVwX3Q7CgpUaGlzIGlzIHdo
YXQgSSBoYWQgaW4gbWluZCB3aGVuIHdlIGxhc3QgZGlzY3Vzc2VkIHRoaXMgdG9waWMgYW5kIEkg
CnN1Z2dlc3RlZCBhIHdheSBmb3J3YXJkIHRvIG5vdCBwbGF5IHdoYWNrLWEtbW9sZSB3aXRoIG5l
dyB1c2VycyB0aGF0IGRvIAoqcHRlcCBzaG93aW5nIHVwLgoKQWdyZWVkIHRoYXQgd2UgaWRlYWxs
eSBpbmRpY2F0ZSB0aGF0IHRoaXMgaXMgYSBIVyBQVEUgcG9pbnRlciB0aGF0IG11c3QgCmJlIGRl
LXJlZmVyZW5jZWQgdGhyb3VnaCBwdGVwX2dldCgpIG9yIHNpbWlsYXIuIChtYXliZSB3ZSdkIGZp
bmQgYSBuZXcgCm5hbWUgZm9yIHRoaXMgc2V0IG9mIGZ1bmN0aW9ucykuCgpJIHRhbGtlZCB0byBT
YW11ZWwgYXQgTFBDLCBwb2ludGluZyBoaW0gYXQgdGhlIHdheSBYRU4tcHYgaW1wbGVtZW50ZWQg
CnN1cHBvcnQgZm9yIGNoYW5naW5nIFBGTnMgaW4gcHRlcy4gV2UgbWlnaHQgbm90IG5lZWQgYWxs
IG9mIHRoYXQgcmV3b3JrIAp0byBtb3ZlIGZvcndhcmQgd2l0aCB0aGUgcmlzYy12IGNoYW5nZS4K
CkhhdmluZyB0aGF0IHNhaWQsIEkgYWxzbyBhZ3JlZSB0aGF0IHRoaXMgd291bGQgYmUgYSBjbGVh
bnVwIHdvcnRoIGhhdmluZyAKKHdoaWNoIHdpbGwgcmVzdWx0IGluIHF1aXRlIGEgYml0IG9mIGNo
dXJuIDopICkuCgpTbyBpZiBzb21lb25lIHdhbnRzIHRvIGJ1bXAgdXAgdGhlIHBhdGNoIGNvdW50
LCBzcGVhayBub3cuCgotLSAKQ2hlZXJzCgpEYXZpZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
