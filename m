Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8CDC5AD55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 14:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+qARUiD19KvdQhe6KR7G73Mv2P+bM2uNkZ3L8W4BUk=; b=Il49aYLmWSQxWd
	2bNWTpYSZ+/z+Sr3YA81e2N+ZFhoY3dKpPwEAji0e9vxRf0QLMjDdDaGq19eKxiGFP13MM8XenDzT
	SmCbAsFxZzycJk5P4ICtzsoWC5gIHUx9DoVUijKsgUH1UQvZjK2Bk5NG1ZDxr2xPykjlG1InIOPkX
	4SxJID/k2ZRmmiR7QTEQdO+4FkamaaabzgfEgaMom6dNLVAFQ6cMvAtFd1qcsquTyAFg6ZPZnDWbR
	Ua4xCPkp5KHKyDv8x25GfK49LJtMMygIou402P5nI315aZ0gR/ztu/drHQmJMAcVOtwInDqNAd9DB
	wDDJUO7yeYyxe54jReLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQfa-0000000BxQn-18NW;
	Mon, 10 Aug 2026 14:08:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQfX-0000000BxQI-0b84;
	Mon, 10 Aug 2026 14:08:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 737BD14BF;
	Mon, 10 Aug 2026 07:07:50 -0700 (PDT)
Received: from [10.57.5.211] (unknown [10.57.5.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0B0D3F86F;
	Mon, 10 Aug 2026 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786370874; bh=l/l2H3T3xXRxtAlEmVxkMBjt3GQq1sSw4qqDUaZjjxc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VDMFqS+FI7dztumWUIj0YSzO03RhoFJUBQIQzYUdFvqVl9cEv8Iw/mDKNo7PN1C6X
	 1VHMihPE5KmCMT17k5n8XBwRp9N9Pbg9cGBMMV/3LzWSgApFGs1tQxNrK6u2zmk9z2
	 n2fKbvDMQjaTvkmApv2yhkGVWehw0StqDsKzTy6c=
Message-ID: <efd52893-bf66-40cc-a53d-980b89cee448@arm.com>
Date: Mon, 10 Aug 2026 16:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] mm: introduce MMF_KERNEL flag and set it for
 init_mm
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linux-mm@kvack.org
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
 <33fc9d31-2866-4315-9510-0004deb93994@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <33fc9d31-2866-4315-9510-0004deb93994@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_070759_281854_77F45A61 
X-CRM114-Status: GOOD (  15.21  )
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

T24gMDUvMDgvMjAyNiAxNDowNywgRGF2aWQgSGlsZGVuYnJhbmQgKEFybSkgd3JvdGU6Cj4gT24g
OC8zLzI2IDE1OjU5LCBDaHJpc3RvcGhlIExlcm95IChDUyBHUk9VUCkgd3JvdGU6Cj4+IExlIDE0
LzA3LzIwMjYgw6AgMTY6MDMsIEtldmluIEJyb2Rza3kgYSDDqWNyaXTCoDoKPj4+IG1tIGNvZGUg
b2Z0ZW4gbmVlZHMgdG8ga25vdyB3aGV0aGVyIHNvbWUgbW0gcmVwcmVzZW50cyBhIGtlcm5lbCBv
cgo+Pj4gdXNlciBhZGRyZXNzIHNwYWNlLiBUaGlzIGlzIGN1cnJlbnRseSBkb25lIGJ5IGNvbXBh
cmluZyB0aGUgbW0KPj4+IHBvaW50ZXIgd2l0aCAmaW5pdF9tbTsgYmVzaWRlcyBub3QgYmVpbmcg
cGFydGljdWxhcmx5IGVsZWdhbnQsIHRoaXMKPj4+IGlnbm9yZXMgdGhlIGZhY3QgdGhhdCBvdGhl
ciBtbSdzIChlLmcuIGVmaV9tbSkgbWF5IGFsc28gcmVwcmVzZW50Cj4+PiBwYXJ0cyBvZiB0aGUg
a2VybmVsIGFkZHJlc3Mgc3BhY2UuCj4+Pgo+Pj4gSW50cm9kdWNlIGEgbmV3IG1tIGZsYWcgTU1G
X0tFUk5FTCBhbmQgc2V0IGl0IGZvciBpbml0X21tLgo+Pj4gU3Vic2VxdWVudCBwYXRjaGVzIHdp
bGwgdXNlIHRoaXMgZmxhZyB0byByZXBsYWNlIGNvbXBhcmlzb25zIHdpdGgKPj4+ICZpbml0X21t
LiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpcyBpbnRyb2R1Y2VkIGZvciBub3cuCj4+IERpZCB5b3Ug
Y29uc2lkZXIgcGVyZm9ybWFuY2UgaW1wYWN0ID8gVGhpcyB0ZXN0IGlzIHVzdWFsbHkgZG9uZSBp
biBxdWl0ZQo+PiBjcml0aWNhbCBtZW1vcnkgaGFuZGxpbmcgZnVuY3Rpb25zLgo+Pgo+PiBpbml0
X21tIGlzIGtub3duIGF0IGxpbmsgdGltZS4gQmVmb3JlIHlvdXIgcGF0Y2ggMDgvMjIgdGhlcmUg
aXMganVzdCBhCj4+IGNvbXBhcmlzb24gb2YgbW0gKHIzKSB3aXRoIGEgY29uc3RhbnQgKGxvYWRl
ZCBpbiByMTApOgo+Pgo+PiBjMDAxNDA0OCA8YXNzZXJ0X3B0ZV9sb2NrZWQ+Ogo+PiBjMDAxNDA0
ODrCoMKgwqAgM2QgNDAgYzEgMDnCoMKgwqDCoCBsaXPCoMKgwqDCoCByMTAsLTE2MTE5Cj4+IGMw
MDE0MDRjOsKgwqDCoCAzOSA0YSAwMyA5OMKgwqDCoMKgIGFkZGnCoMKgwqAgcjEwLHIxMCw5MjAK
Pj4gYzAwMTQwNTA6wqDCoMKgIDdjIDAzIDUwIDAwwqDCoMKgwqAgY21wd8KgwqDCoCByMyxyMTAK
Pj4gYzAwMTQwNTQ6wqDCoMKgIDRkIDgyIDAwIDIwwqDCoMKgwqAgYmVxbHIKPj4gLi4uCj4+Cj4+
IEFmdGVyIHBhdGNoIDA4LzIyIHdlIGhhdmUsIGl0IGZpcnN0IGNoZWNrcyB0aGF0IG1tIGlzIG5v
dCAwLCB0aGVuIGl0IGxvYWRzIHRoZQo+PiB3b3JkIGxvY2F0ZWQgYXQgbW0rNTI4IHRoZW4gQU5E
IGl0IHdpdGggMHgxLiBUaGlzIGxvYWQgbWlnaHQgYmUgY29zdGx5Lgo+Pgo+PiBjMDAxNDA0OCA8
YXNzZXJ0X3B0ZV9sb2NrZWQ+Ogo+PiBjMDAxNDA0ODrCoMKgwqAgMmMgMDMgMDAgMDDCoMKgwqDC
oCBjbXB3acKgwqAgcjMsMAo+PiBjMDAxNDA0YzrCoMKgwqAgN2MgODUgMjMgNzjCoMKgwqDCoCBt
csKgwqDCoMKgwqAgcjUscjQKPj4gYzAwMTQwNTA6wqDCoMKgIDQxIDgyIDAwIDEwwqDCoMKgwqAg
YmVxwqDCoMKgwqAgYzAwMTQwNjAgPGFzc2VydF9wdGVfbG9ja2VkKzB4MTg+Cj4+IGMwMDE0MDU0
OsKgwqDCoCA4MSAyMyAwMiAxMMKgwqDCoMKgIGx3esKgwqDCoMKgIHI5LDUyOChyMykKPj4gYzAw
MTQwNTg6wqDCoMKgIDcxIDI5IDAwIDAxwqDCoMKgwqAgYW5kaS7CoMKgIHI5LHI5LDEKPj4gYzAw
MTQwNWM6wqDCoMKgIDRjIDgyIDAwIDIwwqDCoMKgwqAgYm5lbHIKPiBJcyB0aGF0IGEgcmVhbCBw
cm9ibGVtLCB0aG91Z2g/CgpJIGRvdWJ0IGl0LCB0aGlzIGlzIGEgbG9hZCBmcm9tIGEgZml4ZWQg
YWRkcmVzcyBhbmQgdGhlcmVmb3JlIGhpZ2hseQpjYWNoZWFibGUvcHJlZGljdGFibGUuIEF0IHdv
cnN0IHdlJ3JlIGtlZXBpbmcgYW4gZXh0cmEgY2FjaGUgbGluZQphbGxvY2F0ZWQsIGJ1dCBJJ2Qg
ZXhwZWN0IGluaXRfbW0gdG8gYmUgYWxyZWFkeSBpbiB0aGUgY2FjaGUgbW9zdCBvZiB0aGUKdGlt
ZS4KCj4gV2hhdCB3ZSBjb3VsZCBkbyBpcyB0byBqdXN0IGtlZXAgdGhlID09ICZpbml0X21tIGNo
ZWNrIGludGVybmFsbHkgb24gY29uZmlncwo+IHdoZXJlIHdlIGtub3cgdGhhdCB0aGVyZSBpcyBv
bmx5IGEgc2luZ2xlIHN1Y2ggTU0gY29udGV4dC4KClN1cmUsIGlmIHRoaXMgcHJvdmlkZXMgYSBj
bGVhciBwZXJmb3JtYW5jZSBiZW5lZml0IG9uIHBvd2VycGMgb3Igb3RoZXIKYXJjaGl0ZWN0dXJl
cy9jb25maWdzIHRoYXQgZG9uJ3QgaGF2ZSBhbiBlZmlfbW0gd2UgY291bGQgZG8gdGhhdC4KCi0g
S2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
