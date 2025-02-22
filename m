Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22709C021B2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7urPGuvmFgN+Sd6xvqu9F7TrXFH3tpcr3V+ZSTxAcIc=; b=pkkrerEAbOogYe
	VDAAU/U6rSqapS3aMzY+GMIwm6PMcGZboP7OuiCEAl6Gx0WVTs3qcGvjUJtzftiGh+WY8MInZopoD
	dWmi2RRIKcnPKZ7EFsqPK0Ju2ONloLSWDbkyPMmFaqkWQEBC5tpe8GrALtcqvLYtT6iAq256pLKJK
	a0vytcbGhSwWAy5OA0h6j3V9RDWy54kjWRZuJgSFaMbQo3v+Ih7i8W18CFluFcF5sOQdHsq7Bizwk
	KXCNBN6m/H9aqw9uH6d/YUfkBCPl6xf6TCSzI8HnlSKlT/tLU0cpm8ketwJQLDscKVJySQqAF6V7H
	+TYz09Ri9W2tgY0Af2eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmYF-00000007oZ6-1Sxj;
	Sat, 22 Feb 2025 10:16:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmWj-00000007oKT-28QK;
	Sat, 22 Feb 2025 10:14:33 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740219265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYt57ZYgbjy6ej8hXDty7Cfp9Tf5nA32oYEo7YLt3U4=;
	b=E0xbOLPRJ+XD/M3Ao9By6szoKCsyLxcxtVTGsSbhAcE5NU1NK5C2+Dfl+zJ4+rpk8p2vce
	IgpgL+eLpTnyqk83xyrJHvEqqHTXl3g07KURIn1lsZ0aq6OKRUYTD54okHfdjXqNbDsSjC
	8vSMloBPM2AV4QgA0stwUEWMG6uZx3A9biypqi3p4tS6E2BLtlPpYMDvXniwVQOifJQaz1
	6Qig6O/uBgxjjBbGrOo71YvA2kL4peLeza5WOnn/Kdf4/Lf3rBALBWYLzmAVI3S8o31rMK
	Fy+Fe19AlwTl2IsoJXlYAVNRDdBMW1sP8B0maDlcTMTjaB57ZbWi7eIerkehlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740219265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYt57ZYgbjy6ej8hXDty7Cfp9Tf5nA32oYEo7YLt3U4=;
	b=z74TsqYtERi/FO28k1WNxuOk/eCrttvKrCalx/NPgzVgRgvry4d1qCKiaSmbcNlhBsMonW
	bE0L5AunrFXssYCw==
To: Xi Ruoyao <xry111@xry111.site>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Madhavan
 Srinivasan <maddy@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann
 <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>,
 linux-csky@vger.kernel.org
Subject: Re: [PATCH v3 09/18] riscv: vdso: Switch to generic storage
 implementation
In-Reply-To: <1adbf1603237b654a2948ae13692c6b6db0ab7eb.camel@xry111.site>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
 <20250204-vdso-store-rng-v3-9-13a4669dfc8c@linutronix.de>
 <1adbf1603237b654a2948ae13692c6b6db0ab7eb.camel@xry111.site>
Date: Sat, 22 Feb 2025 11:14:23 +0100
Message-ID: <87a5aegubk.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_021429_741896_CE7928AE 
X-CRM114-Status: GOOD (  11.58  )
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

T24gU2F0LCBGZWIgMjIgMjAyNSBhdCAxNjoxNywgWGkgUnVveWFvIHdyb3RlOgo+IE9uIFR1ZSwg
MjAyNS0wMi0wNCBhdCAxMzowNSArMDEwMCwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4+IFRo
ZSBnZW5lcmljIHN0b3JhZ2UgaW1wbGVtZW50YXRpb24gcHJvdmlkZXMgdGhlIHNhbWUgZmVhdHVy
ZXMgYXMgdGhlCj4+IGN1c3RvbSBvbmUuIEhvd2V2ZXIgaXQgY2FuIGJlIHNoYXJlZCBiZXR3ZWVu
IGFyY2hpdGVjdHVyZXMsIG1ha2luZwo+PiBtYWludGVuYW5jZSBlYXNpZXIuCj4+IAo+PiBDby1k
ZXZlbG9wZWQtYnk6IE5hbSBDYW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgo+PiBTaWduZWQtb2Zm
LWJ5OiBOYW0gQ2FvIDxuYW1jYW9AbGludXRyb25peC5kZT4KPj4gU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Cj4KPiBJIG1h
ZGUgYSBSSVNDLVYgdkRTTyBnZXRyYW5kb20gaW1wbGVtZW50YXRpb24gb24gdG9wIG9mIHRoaXMg
YW5kIGl0Cj4gd29ya3MgZmluZS4gIEknbGwgc3VibWl0IGl0IHdoZW4gdGhpcyBpcyBtZXJnZWQu
CgpZb3UgY2FuIHN1Ym1pdCBpdCByaWdodCBub3cuIElmIGl0J3MgcmV2aWV3ZWQgYW5kIGlmIEph
c29uIGFncmVlcywgdGhpcwpjYW4gYmUgbWVyZ2VkIHRocm91Z2ggdGhlIHRpbWVycy92ZHNvIGJy
YW5jaCBvbiB0b3Agb2YgdGhlIHBlbmRpbmcKY2hhbmdlcy4KClRoYW5rcyBmb3IgdGVzdGluZyBp
dCEKCiAgICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
