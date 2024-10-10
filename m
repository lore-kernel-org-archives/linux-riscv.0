Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE55CF07BD
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+dhO6bkn0b4Xi094WxamIp43Lqt2Ytl0DaWwlbnlMo=; b=DlJL/B3BVtcDrp
	6Tf5fnVZkHIMW4Cl6j1UKriLPCzFF45pTbgPPbuUa5Tz1qZHGgmzbMtB94q2RtpGhFC+p0VC0hkak
	JNbU/bz4krZiYsmpcQXgepCP6SPegL/ObZtut9vbDMlyUG9P/TDgJGg9ovVGN630zdnuyq44JqAAr
	OLgzX66H03j5MAGdJQAZ1KNIDATHjhA4jYiSLgVo6/j6o12Kca72XAkbDJC5CEaUvKC3BMQI08PSk
	f54EBW85Ur+t0N6QirN7cfNhgCU4aaG+p/YI2s6mVUurA4KoVOOpvWs1xYhQjA+mqUd1ebW6CJHwd
	vQYiuCIOiGRTyWrNaX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synh0-0000000BqsO-1nPX;
	Thu, 10 Oct 2024 07:34:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBn-0000000Blpe-2a1D;
	Thu, 10 Oct 2024 07:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=9IUwLjLb5Rv+Z3rKO8x7unJr00Ts0LBgoCGki607yuU=; b=fxWHyngmOpObuAM0bmppdlEB4B
	vmQKTBWuj+UUgmTJ9H5j0J2yvvG/RSv/KZVkLAMgka6ZnGHB7htOm7H7zU+YI1zmuj6JtGyMyM1PL
	GzG5YW4R92TxbHasc09+Uy9jtT9mymihmGDrrC5nz9j0cHtd30eL7nQoXpznrEbeeI1MSBZ6uSlo4
	AkLT3ulJ1MqnD9hcrtb/fgH40XkVFxHx14xd1sJcTsnuDxVZ7Y7JIyXqpwgrtNXzVrNMyx7kqdziM
	bfxVOIL5AAka58zEoWXPB1IN7zjDIp6QhMVyR2vTMx4aFJyjqHNy5d/POdJTiMKTo6xqhhuglYP1M
	9ecGYiGg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBh-00000006yHE-0nqX;
	Thu, 10 Oct 2024 07:02:22 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9IUwLjLb5Rv+Z3rKO8x7unJr00Ts0LBgoCGki607yuU=;
	b=VUkjSFBk2MQwzN+ejztrVxQKhRHQ+9Yl/6wxSFJwKQcH9II+0ehbH0LPd0MM6vQoZ/HDO3
	AQEr2gejOYAR2XAGB/sSNVekevUe6V1wcGFw/QL+DLmC9N99X8j5fyvXaPipiVRRc5Yf4O
	2pSZstOJBdCblxxzLGpOQ4jtJFNtb0KRN+2tpga3h86cWvTE6FK95XshBy3V5sBp1pQfAw
	lD8vKj8R6WKLzfjFUkxp6JxMmVY9z2fhJ2R8eY9/ZtCjHbSjayyacu2J3HORJcdf18+jz4
	VXyUxfxScOWvjlPDHn6Gwvam4Q+L7qGpCm+XbyjKpJEpwm1H+HJi1H8JSzzFgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9IUwLjLb5Rv+Z3rKO8x7unJr00Ts0LBgoCGki607yuU=;
	b=d3/0sfbJfcCoywGbj+ofl3ZPzDeWOe3+X1t86Ir5PG/WJxdDRPOcIBAdlleGtqmDvX4E/l
	LIXafBtIM6E7x2CA==
Date: Thu, 10 Oct 2024 09:01:24 +0200
Subject: [PATCH 22/28] powerpc: procfs: Propagate error of
 remap_pfn_range()
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-22-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1079;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ILVVV4C4Cn6a/ycb+VwQKK6Cv18zEgAwyS7MEYqbXP8=;
 b=rFDW1DuF1EN9zH9ReKWGHDOnqsiH+sp/YP1SF/BKn15kPFCLbQRqr8F1aO3GxLRfzj/ugXTr9
 m+/fZDMJUB6DZ3liFKdAy994YFnGHbTZc+LlsXSeuQdIxLarPfK3zOJ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080217_952543_C7BABC44 
X-CRM114-Status: GOOD (  10.40  )
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

SWYgdGhlIG9wZXJhdGlvbiBmYWlscyBhbmQgdXNlcnNwYWNlIGlzIHVuYXdhcmUgaXQgd2lsbCBh
Y2Nlc3MgdW5tYXBwZWQKbWVtb3J5LCBjcmFzaGluZyB0aGUgcHJvY2Vzcy4KClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgot
LS0KIGFyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY19wb3dlcnBjLmMgfCA3ICsrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jX3Bvd2VycGMuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwv
cHJvY19wb3dlcnBjLmMKaW5kZXggYjEwOWNkN2I1ZDAxZmJlNjg3MGI2MGU2MDk2NWVmZmE4NmVj
ZjNiNi4uOTEwZDIwODJlMDVmZDg2YmQxMTQ2ODE1ZDRiNjc2MzNhNmYyYjQ1OSAxMDA2NDQKLS0t
IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jX3Bvd2VycGMuYworKysgYi9hcmNoL3Bvd2VycGMv
a2VybmVsL3Byb2NfcG93ZXJwYy5jCkBAIC0zMywxMCArMzMsOSBAQCBzdGF0aWMgaW50IHBhZ2Vf
bWFwX21tYXAoIHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSAp
CiAJaWYgKCh2bWEtPnZtX2VuZCAtIHZtYS0+dm1fc3RhcnQpID4gUEFHRV9TSVpFKQogCQlyZXR1
cm4gLUVJTlZBTDsKIAotCXJlbWFwX3Bmbl9yYW5nZSh2bWEsIHZtYS0+dm1fc3RhcnQsCi0JCQlf
X3BhKHBkZV9kYXRhKGZpbGVfaW5vZGUoZmlsZSkpKSA+PiBQQUdFX1NISUZULAotCQkJUEFHRV9T
SVpFLCB2bWEtPnZtX3BhZ2VfcHJvdCk7Ci0JcmV0dXJuIDA7CisJcmV0dXJuIHJlbWFwX3Bmbl9y
YW5nZSh2bWEsIHZtYS0+dm1fc3RhcnQsCisJCQkgICAgICAgX19wYShwZGVfZGF0YShmaWxlX2lu
b2RlKGZpbGUpKSkgPj4gUEFHRV9TSElGVCwKKwkJCSAgICAgICBQQUdFX1NJWkUsIHZtYS0+dm1f
cGFnZV9wcm90KTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwcm9jX29wcyBwYWdlX21hcF9w
cm9jX29wcyA9IHsKCi0tIAoyLjQ3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
