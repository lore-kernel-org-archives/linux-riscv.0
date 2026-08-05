Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF27BC55ABA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lga2Fi8kzCWDK4f/EUDYz0PWUG23kuvBKRtrlQHs9TA=; b=MsvJEUR06QYwMJ
	o8M7Lcyt7TaDrIeLJFpS9goYcVV9FCLchAo7KZckCIMBJ8kT8csZaP/c9sG7FDCvtLm77KIS3XC0r
	KMHIdEBKCJW9MCB6WwbI1Hbj5gI0huIq6MsnZ0ShVqSkynOpxkNRUkQdtrUeET6DxSMBK4vq8dFbQ
	wEKWmvXcJNVC1dwVnsUuIivKF7xM4n/Q8gKap6NMD/f7D9ZxkSpplpB6W6WohfL7jDbnalGM3nVCt
	f4wIGt41y3wggumrs8v01nxAUVrVH1so/vnEhxhT2nWW5xcakbx9xtDGYs+E+m8TEdYNuDkAWDQDu
	jxKbInBeLZYOWnUe4Rfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraP3-00000003rvj-2GB2;
	Wed, 05 Aug 2026 12:07:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraP1-00000003rv9-2sHQ;
	Wed, 05 Aug 2026 12:07:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFC4760A9D;
	Wed,  5 Aug 2026 12:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A82F1F000E9;
	Wed,  5 Aug 2026 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785931638;
	bh=aGl+2n0y8opMkIO+tIk0uV2YGP/4CHQ7NMUa3eVt6C8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=G08xuQ9vztT8MWAY4GWQjNu0SA3oW0WrAzxB+WUMH6xTvVM4MnCCvAzMX4Y2bXu9/
	 wMQarK/Q0WzmH8cJs2dytIclXaHZiQrRUQW2XaJHZZyivkVl4Hy24GBiNCN796Df+y
	 2CzrddHZ/z5jmR+FqtxzKW00oGiX2uY3jNIgcnVBHu+JGJoYG6tUcNsk5lKbqM/zi4
	 nvu4A4Z/uwi6godbKpH5dHpUVRyOLRICUQPbrtp8FehB8uI3y++d5t0FWhLzy/JTGh
	 PJ9ozl262SzjHQNrxDhcJRvOBQJo4aA/7EyfOJtrMCFELMOATMaHl0coqmtItf6c/P
	 aGqVAA3RBHoPw==
Message-ID: <33fc9d31-2866-4315-9510-0004deb93994@kernel.org>
Date: Wed, 5 Aug 2026 14:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] mm: introduce MMF_KERNEL flag and set it for
 init_mm
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
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
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <01f07ea2-8bdd-4450-8a49-548f8b646cfd@kernel.org>
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

T24gOC8zLzI2IDE1OjU5LCBDaHJpc3RvcGhlIExlcm95IChDUyBHUk9VUCkgd3JvdGU6Cj4gCj4g
Cj4gTGUgMTQvMDcvMjAyNiDDoCAxNjowMywgS2V2aW4gQnJvZHNreSBhIMOpY3JpdMKgOgo+PiBt
bSBjb2RlIG9mdGVuIG5lZWRzIHRvIGtub3cgd2hldGhlciBzb21lIG1tIHJlcHJlc2VudHMgYSBr
ZXJuZWwgb3IKPj4gdXNlciBhZGRyZXNzIHNwYWNlLiBUaGlzIGlzIGN1cnJlbnRseSBkb25lIGJ5
IGNvbXBhcmluZyB0aGUgbW0KPj4gcG9pbnRlciB3aXRoICZpbml0X21tOyBiZXNpZGVzIG5vdCBi
ZWluZyBwYXJ0aWN1bGFybHkgZWxlZ2FudCwgdGhpcwo+PiBpZ25vcmVzIHRoZSBmYWN0IHRoYXQg
b3RoZXIgbW0ncyAoZS5nLiBlZmlfbW0pIG1heSBhbHNvIHJlcHJlc2VudAo+PiBwYXJ0cyBvZiB0
aGUga2VybmVsIGFkZHJlc3Mgc3BhY2UuCj4+Cj4+IEludHJvZHVjZSBhIG5ldyBtbSBmbGFnIE1N
Rl9LRVJORUwgYW5kIHNldCBpdCBmb3IgaW5pdF9tbS4KPj4gU3Vic2VxdWVudCBwYXRjaGVzIHdp
bGwgdXNlIHRoaXMgZmxhZyB0byByZXBsYWNlIGNvbXBhcmlzb25zIHdpdGgKPj4gJmluaXRfbW0u
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGlzIGludHJvZHVjZWQgZm9yIG5vdy4KPiAKPiBEaWQgeW91
IGNvbnNpZGVyIHBlcmZvcm1hbmNlIGltcGFjdCA/IFRoaXMgdGVzdCBpcyB1c3VhbGx5IGRvbmUg
aW4gcXVpdGUKPiBjcml0aWNhbCBtZW1vcnkgaGFuZGxpbmcgZnVuY3Rpb25zLgo+IAo+IGluaXRf
bW0gaXMga25vd24gYXQgbGluayB0aW1lLiBCZWZvcmUgeW91ciBwYXRjaCAwOC8yMiB0aGVyZSBp
cyBqdXN0IGEKPiBjb21wYXJpc29uIG9mIG1tIChyMykgd2l0aCBhIGNvbnN0YW50IChsb2FkZWQg
aW4gcjEwKToKPiAKPiBjMDAxNDA0OCA8YXNzZXJ0X3B0ZV9sb2NrZWQ+Ogo+IGMwMDE0MDQ4OsKg
wqDCoCAzZCA0MCBjMSAwOcKgwqDCoMKgIGxpc8KgwqDCoMKgIHIxMCwtMTYxMTkKPiBjMDAxNDA0
YzrCoMKgwqAgMzkgNGEgMDMgOTjCoMKgwqDCoCBhZGRpwqDCoMKgIHIxMCxyMTAsOTIwCj4gYzAw
MTQwNTA6wqDCoMKgIDdjIDAzIDUwIDAwwqDCoMKgwqAgY21wd8KgwqDCoCByMyxyMTAKPiBjMDAx
NDA1NDrCoMKgwqAgNGQgODIgMDAgMjDCoMKgwqDCoCBiZXFscgo+IC4uLgo+IAo+IEFmdGVyIHBh
dGNoIDA4LzIyIHdlIGhhdmUsIGl0IGZpcnN0IGNoZWNrcyB0aGF0IG1tIGlzIG5vdCAwLCB0aGVu
IGl0IGxvYWRzIHRoZQo+IHdvcmQgbG9jYXRlZCBhdCBtbSs1MjggdGhlbiBBTkQgaXQgd2l0aCAw
eDEuIFRoaXMgbG9hZCBtaWdodCBiZSBjb3N0bHkuCj4gCj4gYzAwMTQwNDggPGFzc2VydF9wdGVf
bG9ja2VkPjoKPiBjMDAxNDA0ODrCoMKgwqAgMmMgMDMgMDAgMDDCoMKgwqDCoCBjbXB3acKgwqAg
cjMsMAo+IGMwMDE0MDRjOsKgwqDCoCA3YyA4NSAyMyA3OMKgwqDCoMKgIG1ywqDCoMKgwqDCoCBy
NSxyNAo+IGMwMDE0MDUwOsKgwqDCoCA0MSA4MiAwMCAxMMKgwqDCoMKgIGJlccKgwqDCoMKgIGMw
MDE0MDYwIDxhc3NlcnRfcHRlX2xvY2tlZCsweDE4Pgo+IGMwMDE0MDU0OsKgwqDCoCA4MSAyMyAw
MiAxMMKgwqDCoMKgIGx3esKgwqDCoMKgIHI5LDUyOChyMykKPiBjMDAxNDA1ODrCoMKgwqAgNzEg
MjkgMDAgMDHCoMKgwqDCoCBhbmRpLsKgwqAgcjkscjksMQo+IGMwMDE0MDVjOsKgwqDCoCA0YyA4
MiAwMCAyMMKgwqDCoMKgIGJuZWxyCgpJcyB0aGF0IGEgcmVhbCBwcm9ibGVtLCB0aG91Z2g/CgpX
aGF0IHdlIGNvdWxkIGRvIGlzIHRvIGp1c3Qga2VlcCB0aGUgPT0gJmluaXRfbW0gY2hlY2sgaW50
ZXJuYWxseSBvbiBjb25maWdzCndoZXJlIHdlIGtub3cgdGhhdCB0aGVyZSBpcyBvbmx5IGEgc2lu
Z2xlIHN1Y2ggTU0gY29udGV4dC4KCkp1c3QgYSB0aG91Z2h0LgoKLS0gCkNoZWVycywKCkRhdmlk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
