Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBC8C55179
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgNlYikKx5eHBpFSJ0k+P0caw1FAZA1jGXaz6D0oRIo=; b=xbIgVSAZKhc5CT
	K9gV+G1S8RIhVY9Ww43EYCVWIXz6fhO/yzbIzfJdlN8vX/mJJZ9yAHTP4WIyyLIeI8YobZhnvinQF
	hkqO53x6gW1gWYAfUAOc3AMvKrAbH5SWo6VrSjo59Z6AAE8IuiwCF/gkguOCl8QdCKE1jcVH9ojCR
	8rFNJ1Ee0AmLLaPwQIeP5zikzyKZof78L1FqzXKE8zAz92BZhSIbWjv9lfoXzuEmHkAq9NrlCTBTf
	sZJE5UA0bqcOXkglLidMitIWuc+DqBdCXbd0P7DWVCVz63CbVBj49KVoom/eNeRWYoeOruktQp7jb
	3sfIhDJ8vGeK4Jh4JfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtCp-0000000HHkE-0nvO;
	Mon, 03 Aug 2026 13:59:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtCn-0000000HHjn-1Ryu;
	Mon, 03 Aug 2026 13:59:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A2EB60A78;
	Mon,  3 Aug 2026 13:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4B91F000E9;
	Mon,  3 Aug 2026 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785765588;
	bh=JgJjMGVQwXfN1+lfqi/7mzYbORC4vBXwntqjWOpjj5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VdJzXRQmCKCQ7JgyKiUD1/ILZ8ALjapAPRXEniDDnzS1EoQJOd2Rh4mnj01mS0kaC
	 SkdwvAXDVmUbSsA21mXsGUsV6UFqBCfzHqr7sKaMJIwGAPUZ/EuQ/qXVQNy9gbWQou
	 k9r4ZeSmv7XSpcXC6vcb89age58OUEyz0Y3jtZ3UkudyTNaZ5gI+4+nRjmeVka/o9q
	 /dN7dYJ78mn13G49euOFXvjaEbz3SgPDfvCdEu2cZqtsnpAXKCLf+lhpTv+wU8hwAu
	 5uCt9p7JGa3sPVxgYgc/nGl9g631hfgqX2Lq234uZ0mjzzpUHJEqevNTssxpWPfwhD
	 A251zj+Snu4hw==
Message-ID: <01f07ea2-8bdd-4450-8a49-548f8b646cfd@kernel.org>
Date: Mon, 3 Aug 2026 15:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] mm: introduce MMF_KERNEL flag and set it for
 init_mm
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260714-remove_pgtable_cdtor-v1-3-44be8a7685d7@arm.com>
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

CgpMZSAxNC8wNy8yMDI2IMOgIDE2OjAzLCBLZXZpbiBCcm9kc2t5IGEgw6ljcml0wqA6Cj4gbW0g
Y29kZSBvZnRlbiBuZWVkcyB0byBrbm93IHdoZXRoZXIgc29tZSBtbSByZXByZXNlbnRzIGEga2Vy
bmVsIG9yCj4gdXNlciBhZGRyZXNzIHNwYWNlLiBUaGlzIGlzIGN1cnJlbnRseSBkb25lIGJ5IGNv
bXBhcmluZyB0aGUgbW0KPiBwb2ludGVyIHdpdGggJmluaXRfbW07IGJlc2lkZXMgbm90IGJlaW5n
IHBhcnRpY3VsYXJseSBlbGVnYW50LCB0aGlzCj4gaWdub3JlcyB0aGUgZmFjdCB0aGF0IG90aGVy
IG1tJ3MgKGUuZy4gZWZpX21tKSBtYXkgYWxzbyByZXByZXNlbnQKPiBwYXJ0cyBvZiB0aGUga2Vy
bmVsIGFkZHJlc3Mgc3BhY2UuCj4gCj4gSW50cm9kdWNlIGEgbmV3IG1tIGZsYWcgTU1GX0tFUk5F
TCBhbmQgc2V0IGl0IGZvciBpbml0X21tLgo+IFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIHVzZSB0
aGlzIGZsYWcgdG8gcmVwbGFjZSBjb21wYXJpc29ucyB3aXRoCj4gJmluaXRfbW0uIE5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGlzIGludHJvZHVjZWQgZm9yIG5vdy4KCkRpZCB5b3UgY29uc2lkZXIgcGVy
Zm9ybWFuY2UgaW1wYWN0ID8gVGhpcyB0ZXN0IGlzIHVzdWFsbHkgZG9uZSBpbiBxdWl0ZSAKY3Jp
dGljYWwgbWVtb3J5IGhhbmRsaW5nIGZ1bmN0aW9ucy4KCmluaXRfbW0gaXMga25vd24gYXQgbGlu
ayB0aW1lLiBCZWZvcmUgeW91ciBwYXRjaCAwOC8yMiB0aGVyZSBpcyBqdXN0IGEgCmNvbXBhcmlz
b24gb2YgbW0gKHIzKSB3aXRoIGEgY29uc3RhbnQgKGxvYWRlZCBpbiByMTApOgoKYzAwMTQwNDgg
PGFzc2VydF9wdGVfbG9ja2VkPjoKYzAwMTQwNDg6CTNkIDQwIGMxIDA5IAlsaXMgICAgIHIxMCwt
MTYxMTkKYzAwMTQwNGM6CTM5IDRhIDAzIDk4IAlhZGRpICAgIHIxMCxyMTAsOTIwCmMwMDE0MDUw
Ogk3YyAwMyA1MCAwMCAJY21wdyAgICByMyxyMTAKYzAwMTQwNTQ6CTRkIDgyIDAwIDIwIAliZXFs
cgouLi4KCkFmdGVyIHBhdGNoIDA4LzIyIHdlIGhhdmUsIGl0IGZpcnN0IGNoZWNrcyB0aGF0IG1t
IGlzIG5vdCAwLCB0aGVuIGl0IApsb2FkcyB0aGUgd29yZCBsb2NhdGVkIGF0IG1tKzUyOCB0aGVu
IEFORCBpdCB3aXRoIDB4MS4gVGhpcyBsb2FkIG1pZ2h0IApiZSBjb3N0bHkuCgpjMDAxNDA0OCA8
YXNzZXJ0X3B0ZV9sb2NrZWQ+OgpjMDAxNDA0ODoJMmMgMDMgMDAgMDAgCWNtcHdpICAgcjMsMApj
MDAxNDA0YzoJN2MgODUgMjMgNzggCW1yICAgICAgcjUscjQKYzAwMTQwNTA6CTQxIDgyIDAwIDEw
IAliZXEgICAgIGMwMDE0MDYwIDxhc3NlcnRfcHRlX2xvY2tlZCsweDE4PgpjMDAxNDA1NDoJODEg
MjMgMDIgMTAgCWx3eiAgICAgcjksNTI4KHIzKQpjMDAxNDA1ODoJNzEgMjkgMDAgMDEgCWFuZGku
ICAgcjkscjksMQpjMDAxNDA1YzoJNGMgODIgMDAgMjAgCWJuZWxyCi4uLgoKQ2hyaXN0b3BoZQoK
PiAKPiBBc3Npc3RlZC1ieTogQ29kZXg6R1BULTUuNQo+IFNpZ25lZC1vZmYtYnk6IEtldmluIEJy
b2Rza3kgPGtldmluLmJyb2Rza3lAYXJtLmNvbT4KPiAtLS0KPiAgIGluY2x1ZGUvbGludXgvbW1f
dHlwZXMuaCB8IDEwICsrKysrKysrKysKPiAgIG1tL2luaXQtbW0uYyAgICAgICAgICAgICB8ICAx
ICsKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmggYi9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmgKPiBp
bmRleCBhMmUwZGM1ODkyZmYuLjc4MzhlYTNhYWMwMCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L21tX3R5cGVzLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmgKPiBAQCAtMTQx
NCw2ICsxNDE0LDggQEAgc3RydWN0IG1tX3N0cnVjdCB7Cj4gICAJY2hhciBmbGV4aWJsZV9hcnJh
eVtdIF9fYWxpZ25lZChfX2FsaWdub2ZfXyh1bnNpZ25lZCBsb25nKSk7Cj4gICB9Owo+ICAgCj4g
KyNkZWZpbmUgTU1fRkxBR1NfSU5JVChmbGFncykJeyAuX19tbV9mbGFncyA9IHsgQklUTUFQX0ZS
T01fVTY0KGZsYWdzKSB9IH0KPiArCj4gICBzdGF0aWMgaW5saW5lIGJvb2wgbW1fZmxhZ3NfdGVz
dChpbnQgZmxhZywgY29uc3Qgc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gICB7Cj4gICAJcmV0dXJu
IHRlc3RfYml0KGZsYWcsIEFDQ0VTU19QUklWQVRFKCZtbS0+ZmxhZ3MsIF9fbW1fZmxhZ3MpKTsK
PiBAQCAtMjAwMSw2ICsyMDAzLDkgQEAgZW51bSB7Cj4gICAjZGVmaW5lIE1NRl9UT1BET1dOCQkz
MQkvKiBtbSBzZWFyY2hlcyB0b3AgZG93biBieSBkZWZhdWx0ICovCj4gICAjZGVmaW5lIE1NRl9U
T1BET1dOX01BU0sJQklUKE1NRl9UT1BET1dOKQo+ICAgCj4gKyNkZWZpbmUgTU1GX0tFUk5FTAkJ
MzIJLyogbW0gYmVsb25ncyB0byB0aGUga2VybmVsICovCj4gKyNkZWZpbmUgTU1GX0tFUk5FTF9N
QVNLCQlCSVRfVUxMKE1NRl9LRVJORUwpCj4gKwo+ICAgI2RlZmluZSBNTUZfSU5JVF9MRUdBQ1lf
TUFTSwkoTU1GX0RVTVBfRklMVEVSX01BU0sgfFwKPiAgIAkJCQkgTU1GX0RJU0FCTEVfVEhQX01B
U0sgfCBNTUZfSEFTX01EV0VfTUFTSyB8XAo+ICAgCQkJCSBNTUZfVk1fTUVSR0VfQU5ZX01BU0sg
fCBNTUZfVE9QRE9XTl9NQVNLKQo+IEBAIC0yMDA4LDYgKzIwMTMsMTEgQEAgZW51bSB7Cj4gICAv
KiBMZWdhY3kgZmxhZ3MgbXVzdCBmaXQgd2l0aGluIDMyIGJpdHMuICovCj4gICBzdGF0aWNfYXNz
ZXJ0KCh1NjQpTU1GX0lOSVRfTEVHQUNZX01BU0sgPD0gKHU2NClVSU5UX01BWCk7Cj4gICAKPiAr
c3RhdGljIGlubGluZSBib29sIG1tX2lzX2tlcm5lbChjb25zdCBzdHJ1Y3QgbW1fc3RydWN0ICpt
bSkKPiArewo+ICsJcmV0dXJuIG1tICYmIG1tX2ZsYWdzX3Rlc3QoTU1GX0tFUk5FTCwgbW0pOwo+
ICt9Cj4gKwo+ICAgLyoKPiAgICAqIEluaXRpYWxpc2UgbGVnYWN5IGZsYWdzIGFjY29yZGluZyB0
byBtYXNrcywgcHJvcGFnYXRpbmcgc2VsZWN0ZWQgZmxhZ3Mgb24KPiAgICAqIGZvcmsuIEZ1cnRo
ZXIgZmxhZyBtYW5pcHVsYXRpb24gY2FuIGJlIHBlcmZvcm1lZCBieSB0aGUgY2FsbGVyLgo+IGRp
ZmYgLS1naXQgYS9tbS9pbml0LW1tLmMgYi9tbS9pbml0LW1tLmMKPiBpbmRleCAzZTc5MmFhZDc2
MjYuLjkzNzczMjY5YmY4NyAxMDA2NDQKPiAtLS0gYS9tbS9pbml0LW1tLmMKPiArKysgYi9tbS9p
bml0LW1tLmMKPiBAQCAtMzQsNiArMzQsNyBAQCBzdHJ1Y3QgbW1fc3RydWN0IGluaXRfbW0gPSB7
Cj4gICAJLnBnZAkJPSBzd2FwcGVyX3BnX2RpciwKPiAgIAkubW1fdXNlcnMJPSBBVE9NSUNfSU5J
VCgyKSwKPiAgIAkubW1fY291bnQJPSBBVE9NSUNfSU5JVCgxKSwKPiArCS5mbGFncwkJPSBNTV9G
TEFHU19JTklUKE1NRl9LRVJORUxfTUFTSyksCj4gICAJLndyaXRlX3Byb3RlY3Rfc2VxID0gU0VR
Q05UX1pFUk8oaW5pdF9tbS53cml0ZV9wcm90ZWN0X3NlcSksCj4gICAJTU1BUF9MT0NLX0lOSVRJ
QUxJWkVSKGluaXRfbW0pCj4gICAJLnBhZ2VfdGFibGVfbG9jayA9ICBfX1NQSU5fTE9DS19VTkxP
Q0tFRChpbml0X21tLnBhZ2VfdGFibGVfbG9jayksCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
