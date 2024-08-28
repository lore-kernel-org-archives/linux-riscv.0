Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED06C5474E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 06:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kYuvPagtE83mXkTD8x7Y5mZmcZIqxlVWhsufL038F0=; b=rbGr/Zf2zNZGP1
	OmctLHj07jmN5hLYun8cL7Zu+B6Wq+nyKjQhcNcT6yx8eHlEU2DytIE3mtN0j0b8bfu1PGCp61xdD
	rMWcmt7TI0OKT5TJyEBAPYUUaKBfIf2ReShP9PYQLhhol8+7A44ejUe/IV7DVDMmpSDkkb0+1Bq8I
	1XB4o2qnC9E0SC1I/m6Ni1AaevF3D9RXANTnxyRhUcRnpkuQlpa1urzCfYtHMNQhB70pGTYrhGCyb
	YwQhYE1Ei7P4HlUZeMWZ1yuMrfiuRDPx/kV8//WmF/QCI/LDwLgpN334k0tcPuzhU2g53o/IgASF3
	ZWFhdIcQmLJr8DIVpUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCGf-0000000E6wj-41Lv;
	Wed, 28 Aug 2024 06:34:57 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCGc-0000000E6vw-2TNs;
	Wed, 28 Aug 2024 06:34:56 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wtvlv5gSRz9sRs;
	Wed, 28 Aug 2024 08:34:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jPb3ZkzpTtP; Wed, 28 Aug 2024 08:34:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wtvlt44Xsz9sRy;
	Wed, 28 Aug 2024 08:34:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 72A688B77E;
	Wed, 28 Aug 2024 08:34:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vzIG7P3XR8ze; Wed, 28 Aug 2024 08:34:50 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C02CD8B764;
	Wed, 28 Aug 2024 08:34:49 +0200 (CEST)
Message-ID: <a43c52c6-c1ac-4ef3-b511-08f0459bddad@csgroup.eu>
Date: Wed, 28 Aug 2024 08:34:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] powerpc: mm: Support MAP_BELOW_HINT
To: Charlie Jenkins <charlie@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <20240827-patches-below_hint_mmap-v1-7-46ff2eb9022d@rivosinc.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-7-46ff2eb9022d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_233454_814353_4759AB9B 
X-CRM114-Status: GOOD (  15.04  )
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

SGkgQ2hhcmxpZSwKCkxlIDI4LzA4LzIwMjQgw6AgMDc6NDksIENoYXJsaWUgSmVua2lucyBhIMOp
Y3JpdMKgOgo+IEFkZCBzdXBwb3J0IGZvciBNQVBfQkVMT1dfSElOVCB0byBhcmNoX2dldF9tbWFw
X2Jhc2UoKSBhbmQKPiBhcmNoX2dldF9tbWFwX2VuZCgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENo
YXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gLS0tCj4gICBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vdGFza19zaXplXzY0LmggfCAzNiArKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGFza19z
aXplXzY0LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGFza19zaXplXzY0LmgKPiBpbmRl
eCAyMzliMzYzODQxYWEuLmEzN2E1YTgxMzY1ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vdGFza19zaXplXzY0LmgKPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vdGFza19zaXplXzY0LmgKPiBAQCAtNzIsMTIgKzcyLDM2IEBACj4gICAjZGVmaW5lIFNUQUNL
X1RPUF9NQVggVEFTS19TSVpFX1VTRVI2NAo+ICAgI2RlZmluZSBTVEFDS19UT1AgKGlzXzMyYml0
X3Rhc2soKSA/IFNUQUNLX1RPUF9VU0VSMzIgOiBTVEFDS19UT1BfVVNFUjY0KQo+ICAgCj4gLSNk
ZWZpbmUgYXJjaF9nZXRfbW1hcF9iYXNlKGFkZHIsIGxlbiwgYmFzZSwgZmxhZ3MpIFwKPiAtCSgo
KGFkZHIpID4gREVGQVVMVF9NQVBfV0lORE9XKSA/IChiYXNlKSArIFRBU0tfU0laRSAtIERFRkFV
TFRfTUFQX1dJTkRPVyA6IChiYXNlKSkKPiArI2RlZmluZSBhcmNoX2dldF9tbWFwX2Jhc2UoYWRk
ciwgbGVuLCBiYXNlLCBmbGFncykJCQkJCVwKClRoaXMgbWFjcm8gbG9va3MgcXVpdGUgYmlnIGZv
ciBhIG1hY3JvLCBjYW4gaXQgYmUgYSBzdGF0aWMgaW5saW5lIApmdW5jdGlvbiBpbnN0ZWFkID8g
U2FtZSBmb3IgdGhlIG90aGVyIG1hY3JvIGJlbG93LgoKPiArKHsJCQkJCQkJCQkJCVwKPiArCXVu
c2lnbmVkIGxvbmcgbW1hcF9iYXNlOwkJCQkJCQlcCj4gKwl0eXBlb2YoZmxhZ3MpIF9mbGFncyA9
IChmbGFncyk7CQkJCQkJCVwKPiArCXR5cGVvZihhZGRyKSBfYWRkciA9IChhZGRyKTsJCQkJCQkJ
XAo+ICsJdHlwZW9mKGJhc2UpIF9iYXNlID0gKGJhc2UpOwkJCQkJCQlcCj4gKwl0eXBlb2YobGVu
KSBfbGVuID0gKGxlbik7CQkJCQkJCVwKPiArCXVuc2lnbmVkIGxvbmcgcm5kX2dhcCA9IERFRkFV
TFRfTUFQX1dJTkRPVyAtIChfYmFzZSk7CQkJCVwKPiArCWlmIChfZmxhZ3MgJiBNQVBfQkVMT1df
SElOVCAmJiBfYWRkciAhPSAwICYmICgoX2FkZHIgKyBfbGVuKSA+IEJJVChWQV9CSVRTIC0gMSkp
KVwKPiArCQltbWFwX2Jhc2UgPSAoX2FkZHIgKyBfbGVuKSAtIHJuZF9nYXA7CQkJCQlcCj4gKwll
bHNlCQkJCQkJCQkJCVwKPiArCQltbWFwX2VuZCA9ICgoX2FkZHIgPiBERUZBVUxUX01BUF9XSU5E
T1cpID8JCQkJXAo+ICsJCQkJX2Jhc2UgKyBUQVNLX1NJWkUgLSBERUZBVUxUX01BUF9XSU5ET1cg
OgkJXAo+ICsJCQkJX2Jhc2UpOwkJCQkJCQlcCj4gKwltbWFwX2VuZDsJCQkJCQkJCQlcCgptbWFw
X2VuZCBkb2Vzbid0IGV4aXN0LCBkaWQgeW91IG1lYW4gbW1hcF9iYXNlID8KCj4gK30pCj4gICAK
PiAtI2RlZmluZSBhcmNoX2dldF9tbWFwX2VuZChhZGRyLCBsZW4sIGZsYWdzKSBcCj4gLQkoKChh
ZGRyKSA+IERFRkFVTFRfTUFQX1dJTkRPVykgfHwgXAo+IC0JICgoKGZsYWdzKSAmIE1BUF9GSVhF
RCkgJiYgKChhZGRyKSArIChsZW4pID4gREVGQVVMVF9NQVBfV0lORE9XKSkgPyBUQVNLX1NJWkUg
OiBcCj4gLQkJCQkJCQkJCSAgICBERUZBVUxUX01BUF9XSU5ET1cpCj4gKyNkZWZpbmUgYXJjaF9n
ZXRfbW1hcF9lbmQoYWRkciwgbGVuLCBmbGFncykJCQkJCQkJXAo+ICsoewkJCQkJCQkJCQkJCVwK
PiArCXVuc2lnbmVkIGxvbmcgbW1hcF9lbmQ7CQkJCQkJCQkJXAo+ICsJdHlwZW9mKGZsYWdzKSBf
ZmxhZ3MgPSAoZmxhZ3MpOwkJCQkJCQkJXAo+ICsJdHlwZW9mKGFkZHIpIF9hZGRyID0gKGFkZHIp
OwkJCQkJCQkJXAo+ICsJdHlwZW9mKGxlbikgX2xlbiA9IChsZW4pOwkJCQkJCQkJXAo+ICsJaWYg
KF9mbGFncyAmIE1BUF9CRUxPV19ISU5UICYmIF9hZGRyICE9IDAgJiYgKChfYWRkciArIF9sZW4p
ID4gQklUKFZBX0JJVFMgLSAxKSkpCVwKPiArCQltbWFwX2VuZCA9IChfYWRkciArIF9sZW4pOwkJ
CQkJCQlcCj4gKwllbHNlCQkJCQkJCQkJCQlcCj4gKwkJbW1hcF9lbmQgPSAoKChfYWRkcikgPiBE
RUZBVUxUX01BUF9XSU5ET1cpIHx8CQkJCQlcCj4gKwkJCQkoKChfZmxhZ3MpICYgTUFQX0ZJWEVE
KSAmJiAoKF9hZGRyKSArIChfbGVuKSA+IERFRkFVTFRfTUFQX1dJTkRPVykpXAo+ICsJCQkJPyBU
QVNLX1NJWkUgOiBERUZBVUxUX01BUF9XSU5ET1cpCQkJCVwKPiArCW1tYXBfZW5kOwkJCQkJCQkJ
CQlcCj4gK30pCj4gICAKPiAgICNlbmRpZiAvKiBfQVNNX1BPV0VSUENfVEFTS19TSVpFXzY0X0gg
Ki8KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
