Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9774BD2B92E
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3+FKTQJUOxJTPf2l/o8C8plF4/K84yqWmgXNpyIhbY=; b=2Td0RUOIMVXM38
	vJ8rHcMucWWaLIrfZMJateKvYie5oZ4D4k/fLAOzmqcoyKFtsdIr/UAYN9gbjtOUxSxgJQoJoxwKm
	7FTFexiWl+jOEDV2I/sg76YyPozaCHGrpwX+BRtJCi6F6xu1ftei0aqazKWshu/0xk2QNV4Qq3VEJ
	RYsa8+aKkonFCpPYajGnYJc4ItJYjsy1xEQaFxdUbh4gEWkeaC0CdfHlMkDF9KvzK7Or+WbJTe9nG
	Kj0FogWI0Ri4zgMMAA4w5fN3oSDfPvlQbpXLsrr+Sw7Y6mbjs2cgSN4vFau5rHWeaQQRZZo4PXWQS
	SvijmpSr7FFkbcgZNkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KbN-0000000HHB9-2KVq;
	Tue, 05 Nov 2024 14:32:13 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KAl-0000000HCof-0AlK;
	Tue, 05 Nov 2024 14:04:45 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XjVT20D0Vz9sRr;
	Tue,  5 Nov 2024 15:04:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LoXpUD9JBUwx; Tue,  5 Nov 2024 15:04:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XjVSw68fmz9rvV;
	Tue,  5 Nov 2024 15:04:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BC0698B763;
	Tue,  5 Nov 2024 15:04:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DUJhllzpqdGg; Tue,  5 Nov 2024 15:04:32 +0100 (CET)
Received: from [192.168.232.44] (unknown [192.168.232.44])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 228F48B770;
	Tue,  5 Nov 2024 15:04:32 +0100 (CET)
Message-ID: <e33569c8-1591-462c-9388-4a514e156bfa@csgroup.eu>
Date: Tue, 5 Nov 2024 15:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
To: Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Nam Cao <namcao@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <871pzxzuny.ffs@tglx>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <871pzxzuny.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_060443_257656_1807337C 
X-CRM114-Status: GOOD (  11.69  )
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

CgpMZSAzMC8xMC8yMDI0IMOgIDEyOjM5LCBUaG9tYXMgR2xlaXhuZXIgYSDDqWNyaXTCoDoKPiBG
b2xrcyEKPiAKPiBPbiBUaHUsIE9jdCAxMCAyMDI0IGF0IDA5OjAxLCBUaG9tYXMgV2Vpw59zY2h1
aCB3cm90ZToKPj4gSGlzdG9yaWNhbGx5IGVhY2ggYXJjaGl0ZWN0dXJlIGRlZmluZWQgdGhlaXIg
b3duIGRhdGFwYWdlIHRvIHN0b3JlIHRoZQo+PiBWRFNPIGRhdGEuIFRoaXMgc3RhbmRzIGluIGNv
bnRyYXN0IHRvIHRoZSBnZW5lcmljIG5hdHVyZSBvZiB0aGUgVkRTTwo+PiBjb2RlIGl0c2VsZi4K
Pj4gV2UgcGxhbiB0byBpbnRyb2R1Y2UgYSBnZW5lcmljIGZyYW1ld29yayBmb3IgdGhlIG1hbmFn
ZW1lbnQgb2YgdGhlIFZEU08KPj4gZGF0YSBzdG9yYWdlIHRoYXQgY2FuIGJlIHVzZWQgYnkgYWxs
IGFyY2hpdGVjdHVyZXMgYW5kIHdoaWNoIHdvcmtzCj4+IHRvZ2V0aGVyIHdpdGggdGhlIGV4aXN0
aW5nIGdlbmVyaWMgVkRTTyBjb2RlLgo+Pgo+PiBCZWZvcmUgdGhhdCBpcyBwb3NzaWJsZSBhbGln
biB0aGUgZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMgYnkKPj4gc3RhbmRhcmRpemluZyBvbiB0aGUg
ZXhpc3RpbmcgZ2VuZXJpYyBpbmZyYXN0cnVjdHVyZSBhbmQgbW92aW5nIHRoaW5ncwo+PiBvdXQg
b2YgdGhlIFZEU08gZGF0YSBwYWdlIHdoaWNoIGRvZXMgbm90IGJlbG9uZyB0aGVyZS4KPj4KPj4g
UGF0Y2hlcwkgMS0gMjoJY3NreQo+PiBQYXRjaAkgICAgMzoJczM5MAo+PiBQYXRjaGVzCSA0LSA1
Oglhcm02NAo+PiBQYXRjaAkgICAgNjoJcmlzY3YKPj4gUGF0Y2gJICAgIDc6CWFybQo+PiBQYXRj
aAkgICAgODoJTG9vbmdBcmNoCj4+IFBhdGNoCSAgICA5OglNSVBTCj4+IFBhdGNoZXMgMTAtMjA6
CXg4Ngo+PiBQYXRjaGVzIDIxLTI3Oglwb3dlcnBjCj4+IFBhdGNoICAgICAgMjg6IAlSZW5hbWlu
Z3MgdG8gYXZvaWQgYSBuYW1lIGNsYXNoIHdpdGggdGhlIG5ldyBjb2RlLgo+IAo+IEFzIHRoaXMg
aGFzIGJlZW4gc2l0dGluZyBmb3IgdHdvIHdlZWtzIG5vdyB3aXRob3V0IG1ham9yIGNvbW1lbnRz
LCBJJ20KPiBwbGFubmluZyB0byBtZXJnZSB0aGF0IHRocm91Z2ggdGhlIHRpcCB0cmVlIHRvbW9y
cm93LgoKVG8gYXZvaWQgYW55IGZ1dHVyZSBjb25mbGljdHMgd2l0aCBwb3dlcnBjIHRyZWUsIEkg
c3VnZ2VzdCB5b3UgbWVyZ2UgCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3Bvd2VycGMvbGludXguZ2l0IAp0b3BpYy92ZHNvIGludG8geW91ciB0cmVlIGJl
Zm9yZSBhcHBseWluZyB0aGlzIHNlcmllcy4KCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
