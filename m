Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9484DC5AC67
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WiPJAeGSmhD4BQgMsSpAmGbobAjqTrbdVeWaxyBwqTY=; b=Ey5ET/e71kLTvF
	/ZtynjVUyXWkIpp8rFGbW26To9aLpb3reS/MRXVbdZZjAxLazIhIzv0wQ2Ck/eyocoVOf1UhO8+QP
	DELJwKa7OHq2IUzYbBuYWNx8rgpHZAu3SllkRg96ENnjweajPEvj0i5+BbhAxbNPjbK1xX99fv59v
	p+le1QBJzRY0q8J5cMSg809VKzEi9xaNyPnRNpojJsCSsaz8FW6eE9QlQGsgMhLOgRv5T4bRlrPEY
	zIqyBqRb3lQN+gWuKAQsoQ/8VNRrCTDW67rNGoD3HSGKszlMOvvYucZM7yvfjOOO25A52NPgeJ7wb
	Ko1/yTVURgd46RmX8SEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiLc-0000000DfuD-33DP;
	Tue, 11 Aug 2026 09:00:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiLY-0000000Dft6-0yrc;
	Tue, 11 Aug 2026 09:00:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7549F1516;
	Tue, 11 Aug 2026 02:00:26 -0700 (PDT)
Received: from [10.57.5.193] (unknown [10.57.5.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B19F3F86F;
	Tue, 11 Aug 2026 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786438830; bh=tUiTGK9kLGJYJG38Hawj4v69yMlo3kmE+u/Tuup4Yg4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p0EklLMHJGrKLnVqOINCl1ZfxhRZ+BNvpIRznN2rLsga1Dwdloi6U4xuE1VCQAm02
	 kBFiXP3tqlA3ARY2zoYWjzb5WjBU+6w3Cb3dcRQRjE/0+/SN3iB10dvAMI84fhbPXQ
	 52YnfLEkfwAxucsSI1ar27PS56iSCcvkFqLRrZM8=
Message-ID: <643a624d-0106-44ed-a7f5-aaf9316f94fd@arm.com>
Date: Tue, 11 Aug 2026 11:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] mm: introduce MMF_KERNEL flag and set it for
 init_mm
To: David Laight <david.laight.linux@gmail.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, linux-um@lists.infradead.org,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ning Sun <ning.sun@intel.com>,
 x86@kernel.org, tboot-devel@lists.sourceforge.net,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 Vishal Moola <vishal.moola@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
References: <20260714-remove_pgtable_cdtor-v1-0-44be8a7685d7@arm.com>
 <20260714-remove_pgtable_cdtor-v1-3-44be8a7685d7@arm.com>
 <01f07ea2-8bdd-4450-8a49-548f8b646cfd@kernel.org>
 <33fc9d31-2866-4315-9510-0004deb93994@kernel.org>
 <20260811091016.5ca67143@pumpkin>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260811091016.5ca67143@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_020032_349473_98F8C435 
X-CRM114-Status: GOOD (  15.50  )
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

T24gMTEvMDgvMjAyNiAxMDoxMCwgRGF2aWQgTGFpZ2h0IHdyb3RlOgo+IE9uIFdlZCwgNSBBdWcg
MjAyNiAxNDowNzowMSArMDIwMAo+ICJEYXZpZCBIaWxkZW5icmFuZCAoQXJtKSIgPGRhdmlkQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4+IE9uIDgvMy8yNiAxNTo1OSwgQ2hyaXN0b3BoZSBMZXJveSAo
Q1MgR1JPVVApIHdyb3RlOgo+Pj4KPj4+IExlIDE0LzA3LzIwMjYgw6AgMTY6MDMsIEtldmluIEJy
b2Rza3kgYSDDqWNyaXTCoDogIAo+Pj4+IG1tIGNvZGUgb2Z0ZW4gbmVlZHMgdG8ga25vdyB3aGV0
aGVyIHNvbWUgbW0gcmVwcmVzZW50cyBhIGtlcm5lbCBvcgo+Pj4+IHVzZXIgYWRkcmVzcyBzcGFj
ZS4gVGhpcyBpcyBjdXJyZW50bHkgZG9uZSBieSBjb21wYXJpbmcgdGhlIG1tCj4+Pj4gcG9pbnRl
ciB3aXRoICZpbml0X21tOyBiZXNpZGVzIG5vdCBiZWluZyBwYXJ0aWN1bGFybHkgZWxlZ2FudCwg
dGhpcwo+Pj4+IGlnbm9yZXMgdGhlIGZhY3QgdGhhdCBvdGhlciBtbSdzIChlLmcuIGVmaV9tbSkg
bWF5IGFsc28gcmVwcmVzZW50Cj4+Pj4gcGFydHMgb2YgdGhlIGtlcm5lbCBhZGRyZXNzIHNwYWNl
Lgo+Pj4+Cj4+Pj4gSW50cm9kdWNlIGEgbmV3IG1tIGZsYWcgTU1GX0tFUk5FTCBhbmQgc2V0IGl0
IGZvciBpbml0X21tLgo+Pj4+IFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIHVzZSB0aGlzIGZsYWcg
dG8gcmVwbGFjZSBjb21wYXJpc29ucyB3aXRoCj4+Pj4gJmluaXRfbW0uIE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGlzIGludHJvZHVjZWQgZm9yIG5vdy4gIAo+Pj4gRGlkIHlvdSBjb25zaWRlciBwZXJm
b3JtYW5jZSBpbXBhY3QgPyBUaGlzIHRlc3QgaXMgdXN1YWxseSBkb25lIGluIHF1aXRlCj4+PiBj
cml0aWNhbCBtZW1vcnkgaGFuZGxpbmcgZnVuY3Rpb25zLgo+Pj4KPj4+IGluaXRfbW0gaXMga25v
d24gYXQgbGluayB0aW1lLiBCZWZvcmUgeW91ciBwYXRjaCAwOC8yMiB0aGVyZSBpcyBqdXN0IGEK
Pj4+IGNvbXBhcmlzb24gb2YgbW0gKHIzKSB3aXRoIGEgY29uc3RhbnQgKGxvYWRlZCBpbiByMTAp
Ogo+Pj4KPj4+IGMwMDE0MDQ4IDxhc3NlcnRfcHRlX2xvY2tlZD46Cj4+PiBjMDAxNDA0ODrCoMKg
wqAgM2QgNDAgYzEgMDnCoMKgwqDCoCBsaXPCoMKgwqDCoCByMTAsLTE2MTE5Cj4+PiBjMDAxNDA0
YzrCoMKgwqAgMzkgNGEgMDMgOTjCoMKgwqDCoCBhZGRpwqDCoMKgIHIxMCxyMTAsOTIwCj4+PiBj
MDAxNDA1MDrCoMKgwqAgN2MgMDMgNTAgMDDCoMKgwqDCoCBjbXB3wqDCoMKgIHIzLHIxMAo+Pj4g
YzAwMTQwNTQ6wqDCoMKgIDRkIDgyIDAwIDIwwqDCoMKgwqAgYmVxbHIKPj4+IC4uLgo+Pj4KPj4+
IEFmdGVyIHBhdGNoIDA4LzIyIHdlIGhhdmUsIGl0IGZpcnN0IGNoZWNrcyB0aGF0IG1tIGlzIG5v
dCAwLCB0aGVuIGl0IGxvYWRzIHRoZQo+Pj4gd29yZCBsb2NhdGVkIGF0IG1tKzUyOCB0aGVuIEFO
RCBpdCB3aXRoIDB4MS4gVGhpcyBsb2FkIG1pZ2h0IGJlIGNvc3RseS4KPj4+Cj4+PiBjMDAxNDA0
OCA8YXNzZXJ0X3B0ZV9sb2NrZWQ+Ogo+Pj4gYzAwMTQwNDg6wqDCoMKgIDJjIDAzIDAwIDAwwqDC
oMKgwqAgY21wd2nCoMKgIHIzLDAKPj4+IGMwMDE0MDRjOsKgwqDCoCA3YyA4NSAyMyA3OMKgwqDC
oMKgIG1ywqDCoMKgwqDCoCByNSxyNAo+Pj4gYzAwMTQwNTA6wqDCoMKgIDQxIDgyIDAwIDEwwqDC
oMKgwqAgYmVxwqDCoMKgwqAgYzAwMTQwNjAgPGFzc2VydF9wdGVfbG9ja2VkKzB4MTg+Cj4+PiBj
MDAxNDA1NDrCoMKgwqAgODEgMjMgMDIgMTDCoMKgwqDCoCBsd3rCoMKgwqDCoCByOSw1MjgocjMp
Cj4+PiBjMDAxNDA1ODrCoMKgwqAgNzEgMjkgMDAgMDHCoMKgwqDCoCBhbmRpLsKgwqAgcjkscjks
MQo+Pj4gYzAwMTQwNWM6wqDCoMKgIDRjIDgyIDAwIDIwwqDCoMKgwqAgYm5lbHIgIAo+PiBJcyB0
aGF0IGEgcmVhbCBwcm9ibGVtLCB0aG91Z2g/Cj4gVGhlIGNvc3Qgb2YgdGhlIHJlYWQgaXMgbGlr
ZWx5IHRvIG1hdHRlciBtb3N0IGlmIHRoZSBicmFuY2ggZ2V0cyBtaXNwcmVkaWN0ZWQuCj4gSSdk
IGFsc28gZ3Vlc3MgdGhlIG1tIGlzbid0IHVzdWFsbHkgTlVMTCAtIHNvIHRoYXQgYnJhbmNoIG5l
ZWRzIHRvIHN0YXRpY2FsbHkKPiBwcmVkaWN0ZWQgY29ycmVjdGx5IGFzIHdlbGwuCj4gSSdkIGFs
c28gbm90IGFzc3VtZSB0aGF0IHRoZSBtbSBpcyBpbiB0aGUgY2FjaGUgKHVubGVzcyB0aGUgc3Vy
cm91bmRpbmcgY29kZQo+IGhhcyBhbHJlYWR5IGFjY2Vzc2VkIGl0KSwgdGhlIEwxIGRhdGEgY2Fj
aGVzIGFyZSBzbWFsbC4KCllvdSdyZSByaWdodCwgSSBkaWRuJ3QgdGhpbmsgYWJvdXQgdGhpcyB0
aGUgcmlnaHQgd2F5IHJvdW5kIC0gaW4gZ2VuZXJhbAppdCBtYXkgbm90IGJlIGVhc3kgdG8gcHJl
ZGljdCB0aGF0IG1tIHBvaW50cyB0byBpbml0X21tLCBhbmQgYW4KYXJiaXRyYXJ5IHVzZXIgbW0g
aXNuJ3QgZ3VhcmFudGVlZCB0byBiZSBjYWNoZWQuIFJlcGVhdGVkIGNhbGxzIHRvCm1tX2lzX2tl
cm5lbChtbSkgaW4gdGhlIHNhbWUgZnVuY3Rpb24gc2hvdWxkbid0IGNvc3QgbXVjaCB0aG91Z2gu
CgpXb3VsZCBzb21lIChtaWNybyliZW5jaG1hcmsgYmUgcGFydGljdWxhcmx5IHJlbGV2YW50IHRv
IG1lYXN1cmUgdGhlCm92ZXJoZWFkLCBpZiBhbnk/CgotIEtldmluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
