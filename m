Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D6BC5B56A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24d7F6RqIX+xQnS4TfwFhcZngN5ZdljH4P4qE7KOtSM=; b=VP9v9JrAX0Ci65
	I3EKZj91fHv88grMSPVeD6uS98q2BcS07tMG4BAGb8rFQxCG/EFfA7vDbsrooAuY/AnyV0KA8qiut
	d3lAR4BaL3rpeCTr+LakVRKd52f5QVj+PedTRwr72rEUAGTCrHw/5WPDFYDxFXpHqKThucQry1qbA
	pjgUskGgjk2rlRddB7dI0X5SrXq0FKrPDO2BS8/3RQPBdnBcdFD0jgnB7CNwnlDWFSA3a62n60h65
	HzoXHF0FzqaQZQ9bd3zlruz+ue+N2TKSQqdRqr2NfM39eDpW3ra4URLWJVoFl2D/y3HNSFFuxzZJ/
	Kh2exxghQnwrTqJkQovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpds-0000000EY6p-3Lfg;
	Tue, 11 Aug 2026 16:47:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpdp-0000000EY5Q-14Dt;
	Tue, 11 Aug 2026 16:47:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 392871516;
	Tue, 11 Aug 2026 09:47:45 -0700 (PDT)
Received: from [10.57.5.246] (unknown [10.57.5.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAF723F86F;
	Tue, 11 Aug 2026 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786466869; bh=k6fuvdQDvEP8Vgz2PTv5lXUtwGGjwj2b08wkJAsWaVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gTV/2I8He3BRcDFubFelv3SAtZiIJOlWDCGYb/PqwlMmSJRZUV+SfPlIf2y0trfly
	 nKQsPwWsI+/aVoYR5dV3ihriAWJ5e9TgHciz8Ikf7zi44esgAkNV9YyJAGhPOgjzVd
	 dWAjOsQ/MfHlSTn8IGEVVhT1EzNUwNUvSRhbFuk4=
Message-ID: <ac24fe96-dbe2-419f-86eb-2d0f78912877@arm.com>
Date: Tue, 11 Aug 2026 18:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] mm: introduce MMF_KERNEL flag and set it for
 init_mm
To: David Laight <david.laight.linux@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
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
 <20260811142507.4c6c760f@pumpkin>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260811142507.4c6c760f@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_094753_461604_BB9591B9 
X-CRM114-Status: GOOD (  17.13  )
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

T24gMTEvMDgvMjAyNiAxNToyNSwgRGF2aWQgTGFpZ2h0IHdyb3RlOgo+IE9uIE1vbiwgMyBBdWcg
MjAyNiAxNTo1OTozNSArMDIwMAo+ICJDaHJpc3RvcGhlIExlcm95IChDUyBHUk9VUCkiIDxjaGxl
cm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4+IExlIDE0LzA3LzIwMjYgw6AgMTY6MDMsIEtldmlu
IEJyb2Rza3kgYSDDqWNyaXTCoDoKPj4+IG1tIGNvZGUgb2Z0ZW4gbmVlZHMgdG8ga25vdyB3aGV0
aGVyIHNvbWUgbW0gcmVwcmVzZW50cyBhIGtlcm5lbCBvcgo+Pj4gdXNlciBhZGRyZXNzIHNwYWNl
LiBUaGlzIGlzIGN1cnJlbnRseSBkb25lIGJ5IGNvbXBhcmluZyB0aGUgbW0KPj4+IHBvaW50ZXIg
d2l0aCAmaW5pdF9tbTsgYmVzaWRlcyBub3QgYmVpbmcgcGFydGljdWxhcmx5IGVsZWdhbnQsIHRo
aXMKPj4+IGlnbm9yZXMgdGhlIGZhY3QgdGhhdCBvdGhlciBtbSdzIChlLmcuIGVmaV9tbSkgbWF5
IGFsc28gcmVwcmVzZW50Cj4+PiBwYXJ0cyBvZiB0aGUga2VybmVsIGFkZHJlc3Mgc3BhY2UuCj4+
Pgo+Pj4gSW50cm9kdWNlIGEgbmV3IG1tIGZsYWcgTU1GX0tFUk5FTCBhbmQgc2V0IGl0IGZvciBp
bml0X21tLgo+Pj4gU3Vic2VxdWVudCBwYXRjaGVzIHdpbGwgdXNlIHRoaXMgZmxhZyB0byByZXBs
YWNlIGNvbXBhcmlzb25zIHdpdGgKPj4+ICZpbml0X21tLiBObyBmdW5jdGlvbmFsIGNoYW5nZSBp
cyBpbnRyb2R1Y2VkIGZvciBub3cuICAKPj4gRGlkIHlvdSBjb25zaWRlciBwZXJmb3JtYW5jZSBp
bXBhY3QgPyBUaGlzIHRlc3QgaXMgdXN1YWxseSBkb25lIGluIHF1aXRlIAo+PiBjcml0aWNhbCBt
ZW1vcnkgaGFuZGxpbmcgZnVuY3Rpb25zLgo+Pgo+PiBpbml0X21tIGlzIGtub3duIGF0IGxpbmsg
dGltZS4gQmVmb3JlIHlvdXIgcGF0Y2ggMDgvMjIgdGhlcmUgaXMganVzdCBhIAo+PiBjb21wYXJp
c29uIG9mIG1tIChyMykgd2l0aCBhIGNvbnN0YW50IChsb2FkZWQgaW4gcjEwKToKPj4KPj4gYzAw
MTQwNDggPGFzc2VydF9wdGVfbG9ja2VkPjoKPj4gYzAwMTQwNDg6CTNkIDQwIGMxIDA5IAlsaXMg
ICAgIHIxMCwtMTYxMTkKPj4gYzAwMTQwNGM6CTM5IDRhIDAzIDk4IAlhZGRpICAgIHIxMCxyMTAs
OTIwCj4+IGMwMDE0MDUwOgk3YyAwMyA1MCAwMCAJY21wdyAgICByMyxyMTAKPj4gYzAwMTQwNTQ6
CTRkIDgyIDAwIDIwIAliZXFscgo+PiAuLi4KPj4KPj4gQWZ0ZXIgcGF0Y2ggMDgvMjIgd2UgaGF2
ZSwgaXQgZmlyc3QgY2hlY2tzIHRoYXQgbW0gaXMgbm90IDAsIHRoZW4gaXQgCj4+IGxvYWRzIHRo
ZSB3b3JkIGxvY2F0ZWQgYXQgbW0rNTI4IHRoZW4gQU5EIGl0IHdpdGggMHgxLiBUaGlzIGxvYWQg
bWlnaHQgCj4+IGJlIGNvc3RseS4KPj4KPj4gYzAwMTQwNDggPGFzc2VydF9wdGVfbG9ja2VkPjoK
Pj4gYzAwMTQwNDg6CTJjIDAzIDAwIDAwIAljbXB3aSAgIHIzLDAKPj4gYzAwMTQwNGM6CTdjIDg1
IDIzIDc4IAltciAgICAgIHI1LHI0Cj4+IGMwMDE0MDUwOgk0MSA4MiAwMCAxMCAJYmVxICAgICBj
MDAxNDA2MCA8YXNzZXJ0X3B0ZV9sb2NrZWQrMHgxOD4KPj4gYzAwMTQwNTQ6CTgxIDIzIDAyIDEw
IAlsd3ogICAgIHI5LDUyOChyMykKPj4gYzAwMTQwNTg6CTcxIDI5IDAwIDAxIAlhbmRpLiAgIHI5
LHI5LDEKPj4gYzAwMTQwNWM6CTRjIDgyIDAwIDIwIAlibmVscgo+PiAuLi4KPiBUaG91Z2h0Li4u
Cj4gQ291bGQgdGhlIGNoZWNrIGJlIHJlcGxhY2VkIGJ5IG9uZSB0aGF0IGNoZWNrcyBmb3Iga2Vy
bmVsIHN0YXRpYyBkYXRhPwo+IFRoYXQgd291bGQgcmVxdWlyZSB0aGF0IG90aGVyIG1tIHRoYXQg
cmVwcmVzZW50IHBhcnQgb2YgdGhlIGtlcm5lbAo+IGFkZHJlc3Mgc3BhY2UgYmUgc3RhdGljIChh
bmQgcHJvYmFibHkgbm90IGluIG1vZHVsZXMpLgo+IElTVFIgdGhlcmUgaXMgYW4gYWRkcmVzcyBy
YW5nZSBjaGVjayB0aGF0IGNhbiBiZSB1c2VkIC0gYW5kIG1pZ2h0IGJlCj4gY2hlYXBlciB0aGFu
IHRoZSBleHBsaWNpdCB0ZXN0IGZvciBpbml0X21tIG9uIG1hbnkgNjRiaXQgYXJjaHMuCgpUaGF0
IGlzIGFjdHVhbGx5IGFuIGludGVyZXN0aW5nIGlkZWEuIEZpbmRpbmcgdGhvc2UgImtlcm5lbCBt
bXMiIGJvaWxzCmRvd24gdG8gbG9va2luZyBmb3IgZ2xvYmFsIG1tX3N0cnVjdCwgc28gY2hlY2tp
bmcgaWYgbW0gcG9pbnRzIHRvIGdsb2JhbApkYXRhIHdvdWxkIGFjaGlldmUgZXNzZW50aWFsbHkg
dGhlIHNhbWUgdGhpbmcgd2l0aG91dCBhIGZsYWcgKGFuZCBsaWtlbHkKZmFzdGVyKS4gSSdtIG5v
dCBzdXJlIHdlIHdhbnQgdG8gYmFrZSBpbiB0aGUgYXNzdW1wdGlvbiB0aGF0ICJrZXJuZWwgbW0i
CmlzIGVxdWl2YWxlbnQgdG8gIm1tIGlzIGdsb2JhbCIgdGhvdWdoLgoKLSBLZXZpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
