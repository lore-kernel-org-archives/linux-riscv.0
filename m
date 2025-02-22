Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDB7C021B2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kGCVDXQa8wd6o0GwwYBDFYYUb/QUmD4vt1pSWZ0QsA=; b=PGJnqeZkfUdMcm
	perZKXCVK5Hnhy0wsFbFo8QPSwVyzGxZWNAHOyLQQeuTWkGXIbNAikgmD+JRwAQg+bvi3xP8cgQBj
	d4CVM9iQ8DMFLls6+Kea2Ya3dVHnoDvamz259Lv60gwqTeCpsEXmUV6jWm5qcJQ5ENXcN7iy8rrIr
	Kwpnh6e9znC+cvAT6fb3JITe4ORJeGL3X6kj74PV4dyKBf0S7OrUbCI9YOadUSasy7vrjI/0Wi6HZ
	pnLUPptD0we9DKyV3gNHq80uovl5bg/pkdHpLFyeiBpnJgxE2Z0X7ZUgGIK/V9aouukYLkgZDT/Tw
	szLrdxP5h0bww9oDPJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlkmR-00000007diN-1mx4;
	Sat, 22 Feb 2025 08:22:35 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlkkw-00000007dQw-2Zh1;
	Sat, 22 Feb 2025 08:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740212460;
	bh=1q+MziLP+LRP2VrK2FzjijCA1tPSm0Mct61S8QV7OY4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ndlk6Xh1LDQ4IVzyCwXm+//RroUMYlrg93bkaGOnu/PB6zPDKJjYVM1f8u1zbnorm
	 6Wj9dxVkDjMZ8iYBCSeLLJkBb4sDAbSbTyaqhai1+lbpRWyuiyTuixexNlOL6xLK8h
	 Mbghzm1Uih9WOBd+JPF+dxhjdCJtmTB+W3bP4HQ8=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id BF6C9676E3;
	Sat, 22 Feb 2025 03:20:52 -0500 (EST)
Message-ID: <afc16fdc2417c3a761b880950c6c03998366e92f.camel@xry111.site>
Subject: Re: [PATCH v3 10/18] LoongArch: vDSO: Switch to generic storage
 implementation
From: Xi Ruoyao <xry111@xry111.site>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,  Thomas Gleixner
 <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anna-Maria Behnsen	 <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Theodore
 Ts'o <tytso@mit.edu>, "Jason A. Donenfeld"	 <Jason@zx2c4.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt	 <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen	 <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Russell King	 <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik	 <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Bogendoerfer	 <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao	 <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Ingo Molnar	 <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen	 <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,  Arnd Bergmann	
 <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
	linux-csky@vger.kernel.org
Date: Sat, 22 Feb 2025 16:20:51 +0800
In-Reply-To: <20250204-vdso-store-rng-v3-10-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
	 <20250204-vdso-store-rng-v3-10-13a4669dfc8c@linutronix.de>
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_002102_660984_928FD4C8 
X-CRM114-Status: GOOD (  10.68  )
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

T24gVHVlLCAyMDI1LTAyLTA0IGF0IDEzOjA1ICswMTAwLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90
ZToKPiBUaGUgZ2VuZXJpYyBzdG9yYWdlIGltcGxlbWVudGF0aW9uIHByb3ZpZGVzIHRoZSBzYW1l
IGZlYXR1cmVzIGFzIHRoZQo+IGN1c3RvbSBvbmUuIEhvd2V2ZXIgaXQgY2FuIGJlIHNoYXJlZCBi
ZXR3ZWVuIGFyY2hpdGVjdHVyZXMsIG1ha2luZwo+IG1haW50ZW5hbmNlIGVhc2llci4KPiAKPiBD
by1kZXZlbG9wZWQtYnk6IE5hbSBDYW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgo+IFNpZ25lZC1v
ZmYtYnk6IE5hbSBDYW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgo+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgoKVGVzdGVk
LWJ5OiBYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KCi8qIHNuaXAgKi8KCj4gZGlmZiAt
LWdpdCBhL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3Zkc28vZ2V0cmFuZG9tLmggYi9hcmNo
L2xvb25nYXJjaC9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oCj4gaW5kZXggZTgwZjNjNGFj
NzQ4MWJhN2Y5ZjVkOTIxMGZlZmE3OGMzMjkzMjQzYi4uNDhjNDNmNTViMDM5YjQyMTY4Njk4NjE0
ZDA0NzliN2E4NzJkMjBmMyAxMDA2NDQKPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2Fz
bS92ZHNvL2dldHJhbmRvbS5oCj4gKysrIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vdmRz
by9nZXRyYW5kb20uaAoKWW91IGNhbiBkcm9wICIjaW5jbHVkZSA8dmRzby92ZHNvLmg+IiBpbiB0
aGlzIGZpbGUuCgo+IEBAIC0yOCwxMSArMjgsNiBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHNz
aXplX3QgZ2V0cmFuZG9tX3N5c2NhbGwodm9pZCAqX2J1ZmZlciwgc2l6ZV90IF9sZW4sIHVucwo+
IMKgCXJldHVybiByZXQ7Cj4gwqB9Cj4gwqAKPiAtc3RhdGljIF9fYWx3YXlzX2lubGluZSBjb25z
dCBzdHJ1Y3QgdmRzb19ybmdfZGF0YSAqX19hcmNoX2dldF92ZHNvX3JuZ19kYXRhKHZvaWQpCj4g
LXsKPiAtCXJldHVybiAmX2xvb25nYXJjaF9kYXRhLnJuZ19kYXRhOwo+IC19Cj4gLQo+IMKgI2Vu
ZGlmIC8qICFfX0FTU0VNQkxZX18gKi8KPiDCoAo+IMKgI2VuZGlmIC8qIF9fQVNNX1ZEU09fR0VU
UkFORE9NX0ggKi8KCi0tIApYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KU2Nob29sIG9m
IEFlcm9zcGFjZSBTY2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRpYW4gVW5pdmVyc2l0eQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
