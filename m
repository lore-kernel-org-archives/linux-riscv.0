Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDB3D5CC9F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 11:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEXvQA4LvwrDOZkGOm3juL4+eff9ekCmyrD2gG4OqDQ=; b=zpul9nO8ZksPvC
	XajqA/odw73ZSUtRTa0VLM2Oe+XFR3fVhr6onFhGwX3nslCJA14GGKYbSKH58Cm86H8G9oetYBRgk
	kj5WLE8tiFJwqTUnSnw2OjJWd6Ni5lkClvjNxR3VCcRU6D/qitywonOe0k5CWnEbbYj1vq0fyHzhK
	xxzJ2Qeu3QvMD+bN8tBDGw/3FZrrms6MypBMZsV3GWlv0moX5ey2s1bZjq6iY1aJGd6uHFbgijMrk
	iI4z7XBRlSPabVGz1ru3qFXeXdM8YJEgihBWB+DwJLvNgAChOi7o5y/1rK1F3/pQzOEccAnf1ouiT
	10ezt2C/ibzv8cYv0vlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67F4-00000000Dmm-36us;
	Wed, 30 Oct 2024 11:52:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t673E-00000000Ark-2oQ4;
	Wed, 30 Oct 2024 11:39:59 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730288386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeIG/ZcqI3p+nLl4RvpoP3/dtuBOLvCoB03RCodl0P0=;
	b=rhEg0d1z87PUbjnSMEsHa2ZTMjm4V7As2oyILf5i4K2VK/32cI0L1o8550RHGdp6sqGjh3
	ErfD1VAW2o++iRalLhw8wi1ciSvnXToQPU/7Dqz5Wlnc51fuF7yZtMempbYTt2HzLBGqx0
	Y9YSzHbUO+IR24Yjq+Ny338RBqa0jzNLUw2m9Vrr52kzfVeGJB4+uj1JaJRYCIo3DE6Lly
	bobxafA+CuOfJYFL3jZUIAtXVESnMTctTppzVthR6fn1ijnvzGIvSfDwZ8yFMWE8zMh75v
	CjtAzrsY5JQC46+IYsUu5faYS3U6XCuR8hSr6G0+pno9IQ0T9vFbLX0np3OHDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730288386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeIG/ZcqI3p+nLl4RvpoP3/dtuBOLvCoB03RCodl0P0=;
	b=Sf9t6VjHntegt94+/ZST48Lk206fyTt9ZFie/7zblKXgaCtLwerDU5H5dAAiGuPUAe0Y5b
	9F1eFOTF9JGc5hBw==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Guo
 Ren
 <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Russell
 King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Nam Cao
 <namcao@linutronix.de>
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
Date: Wed, 30 Oct 2024 12:39:45 +0100
Message-ID: <871pzxzuny.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_043948_900220_D570B883 
X-CRM114-Status: GOOD (  12.63  )
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

Rm9sa3MhCgpPbiBUaHUsIE9jdCAxMCAyMDI0IGF0IDA5OjAxLCBUaG9tYXMgV2Vpw59zY2h1aCB3
cm90ZToKPiBIaXN0b3JpY2FsbHkgZWFjaCBhcmNoaXRlY3R1cmUgZGVmaW5lZCB0aGVpciBvd24g
ZGF0YXBhZ2UgdG8gc3RvcmUgdGhlCj4gVkRTTyBkYXRhLiBUaGlzIHN0YW5kcyBpbiBjb250cmFz
dCB0byB0aGUgZ2VuZXJpYyBuYXR1cmUgb2YgdGhlIFZEU08KPiBjb2RlIGl0c2VsZi4KPiBXZSBw
bGFuIHRvIGludHJvZHVjZSBhIGdlbmVyaWMgZnJhbWV3b3JrIGZvciB0aGUgbWFuYWdlbWVudCBv
ZiB0aGUgVkRTTwo+IGRhdGEgc3RvcmFnZSB0aGF0IGNhbiBiZSB1c2VkIGJ5IGFsbCBhcmNoaXRl
Y3R1cmVzIGFuZCB3aGljaCB3b3Jrcwo+IHRvZ2V0aGVyIHdpdGggdGhlIGV4aXN0aW5nIGdlbmVy
aWMgVkRTTyBjb2RlLgo+Cj4gQmVmb3JlIHRoYXQgaXMgcG9zc2libGUgYWxpZ24gdGhlIGRpZmZl
cmVudCBhcmNoaXRlY3R1cmVzIGJ5Cj4gc3RhbmRhcmRpemluZyBvbiB0aGUgZXhpc3RpbmcgZ2Vu
ZXJpYyBpbmZyYXN0cnVjdHVyZSBhbmQgbW92aW5nIHRoaW5ncwo+IG91dCBvZiB0aGUgVkRTTyBk
YXRhIHBhZ2Ugd2hpY2ggZG9lcyBub3QgYmVsb25nIHRoZXJlLgo+Cj4gUGF0Y2hlcwkgMS0gMjoJ
Y3NreQo+IFBhdGNoCSAgICAzOglzMzkwCj4gUGF0Y2hlcwkgNC0gNToJYXJtNjQKPiBQYXRjaAkg
ICAgNjoJcmlzY3YKPiBQYXRjaAkgICAgNzoJYXJtCj4gUGF0Y2gJICAgIDg6CUxvb25nQXJjaAo+
IFBhdGNoCSAgICA5OglNSVBTCj4gUGF0Y2hlcyAxMC0yMDoJeDg2Cj4gUGF0Y2hlcyAyMS0yNzoJ
cG93ZXJwYwo+IFBhdGNoICAgICAgMjg6IAlSZW5hbWluZ3MgdG8gYXZvaWQgYSBuYW1lIGNsYXNo
IHdpdGggdGhlIG5ldyBjb2RlLgoKQXMgdGhpcyBoYXMgYmVlbiBzaXR0aW5nIGZvciB0d28gd2Vl
a3Mgbm93IHdpdGhvdXQgbWFqb3IgY29tbWVudHMsIEknbQpwbGFubmluZyB0byBtZXJnZSB0aGF0
IHRocm91Z2ggdGhlIHRpcCB0cmVlIHRvbW9ycm93LgoKVGhhbmtzLAoKICAgICAgICB0Z2x4Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
