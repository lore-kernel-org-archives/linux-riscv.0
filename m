Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA7DCF07C3
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJvEk0AZ68MxU8NZyDl05Vh6+VZuIKfc6xw0/N43mSk=; b=p+mH0pUqIwDhjc
	ND0y4i3i/169hbpxY6oxwmlp5RbvWmXASExvYW1UhvFJsvwPrZ6dIMpWIXtK1GQKmfDqPj2BMZDyX
	QEQXdoMTdiCFWm6IVH+uOrLDhDO2h4ScN20RXlQpmuyX+rlKLiNVjxrdYKnKMD7Zn/7u4lR7ED4qT
	PJO9acs2Brp/qFgz8VSzhPOF85TmghFwQjFvTFt7k0ZY+cg3btUoiHj2dxKjs+OOzHTfZYsQXCarg
	XuvuXTGACOhTObjwV0SFFuWojKw6d/CE+lv5gCuu94uh6wyXPBJszChScG/ZpqRRehkdmIODaIQNy
	9ZAuKZGAcqVaae5EZnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syoZZ-0000000C0vN-2LlG;
	Thu, 10 Oct 2024 08:31:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBg-0000000Blko-2jgL;
	Thu, 10 Oct 2024 07:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iDYhkJLEk/wNM8RHtmH5cLtwxKP5hseONhnLJBEEc0o=; b=B/IqAMoNsziDIyT/6FBEVpsQ4q
	MyWslgtYILAP4yEGwx8YWDzVpbo2VQbtm+3THAzBmWxcaPTvlYLSZJFA3YOs0CdplEe4TMhfng92u
	UPv2kIbjFxU24nibDr+TGJBE6L73yzzpHA4c4KZtW0QxyNsgIs73l0Qxwo28QIvMUi3blBEVDXw+o
	gOg382Yy7gw5QKcXK8B1y9ynpcdHjQ/0j5Yl4yOOeYw7LVNT3CfPJf9Dj4RY9zuUuWbA4Vs8JhEbP
	yZIzz3TtXdbBEl90vY51A1oBVP2xGRrxcxDqSJvgioIO0LEg3/6Q1CKxJhbbVbbAikEkre/nGbGyb
	A8d/w9Ig==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBa-00000005CsA-2j1h;
	Thu, 10 Oct 2024 07:02:15 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDYhkJLEk/wNM8RHtmH5cLtwxKP5hseONhnLJBEEc0o=;
	b=DlOxxwETZAxA9RhV/JznUypAblffACAwmhmbzWihKTz6AoOeLhwRnA1ukaJoAnRtozKk26
	DlbvYyplIjBFkbxJypcleV9ML9vwxUDVv/g+9gCL9qmBbsFnAi0SfOMKflBkLNFsATVS40
	BR0/LBnPUS+8jbGZlbJZq16s2s1+l2ZsznjzDOB5pvzlWqP3mgUeBOEadfANZHOKL6B1JT
	C8ZBNqILWkhCxqxwPwivhO0T8fVwHmMeEsMW7j7YRAniTcVCr9Kss3aGKxedaEpObq32hP
	y/Xw7Y7vnw7KWQiNy1c11xFD2KpQzMkoXx5vzuV7pYNCXdw/FGHyFM7vLSDrzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iDYhkJLEk/wNM8RHtmH5cLtwxKP5hseONhnLJBEEc0o=;
	b=/5YBI8zMSmdgRX+tzQmAYFuw+rKVOSXC6dss2zODxuOwAxU8/niqmHv7dePR8JKJCXe+bE
	3l94qY6mRiWTU/BA==
Date: Thu, 10 Oct 2024 09:01:13 +0200
Subject: [PATCH 11/28] x86: vdso: Use __arch_get_vdso_data() to access vdso
 data
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-11-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1197;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=l5D8fVN3aaA8131sEeFVg9vgV5lu/zKv8tftufGa+9s=;
 b=yMtNmStMkDOKrNizRAIE2blEjN7roFN5utdJ25lrGaymlV+mNbkoLLCg0uck8P2iyvgDKwB45
 x92w3Z4p27QBEyzr4NDw5s4XKataw8016PEsD81PtJ1XALVRg28suWI
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080210_919957_23C885A7 
X-CRM114-Status: GOOD (  10.48  )
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

VGhlIGltcGxlbWVudGF0aW9uIGRldGFpbHMgb2YgdGhlIHZkc29fZGF0YSBhY2Nlc3Mgd2lsbCBj
aGFuZ2UuClByZXBhcmUgZm9yIHRoYXQgYnkgdXNpbmcgdGhlIGV4aXN0aW5nIGhlbHBlciBmdW5j
dGlvbi4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0cmFuZG9t
LmggfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaCBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0cmFuZG9tLmgKaW5kZXggZmY1MzM0YWQzMmEw
ZjU2YjJkNDI2NWZkMzhkOWMyODdkZTNkZmFhMS4uZWNkY2RiY2QzMzkyNTMzZTU2MTlkN2YwOTQw
M2Q2MGE5ODEwY2VhYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby9nZXRy
YW5kb20uaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oCkBAIC0z
Miw4ICszMiw4IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgc3NpemVfdCBnZXRyYW5kb21fc3lz
Y2FsbCh2b2lkICpidWZmZXIsIHNpemVfdCBsZW4sIHVuc2lnCiAKIHN0YXRpYyBfX2Fsd2F5c19p
bmxpbmUgY29uc3Qgc3RydWN0IHZkc29fcm5nX2RhdGEgKl9fYXJjaF9nZXRfdmRzb19ybmdfZGF0
YSh2b2lkKQogewotCWlmIChJU19FTkFCTEVEKENPTkZJR19USU1FX05TKSAmJiBfX3Zkc29fZGF0
YS0+Y2xvY2tfbW9kZSA9PSBWRFNPX0NMT0NLTU9ERV9USU1FTlMpCi0JCXJldHVybiAodm9pZCAq
KSZfX3Zkc29fcm5nX2RhdGEgKyAoKHZvaWQgKikmX190aW1lbnNfdmRzb19kYXRhIC0gKHZvaWQg
KikmX192ZHNvX2RhdGEpOworCWlmIChJU19FTkFCTEVEKENPTkZJR19USU1FX05TKSAmJiBfX2Fy
Y2hfZ2V0X3Zkc29fZGF0YSgpLT5jbG9ja19tb2RlID09IFZEU09fQ0xPQ0tNT0RFX1RJTUVOUykK
KwkJcmV0dXJuICh2b2lkICopJl9fdmRzb19ybmdfZGF0YSArICgodm9pZCAqKSZfX3RpbWVuc192
ZHNvX2RhdGEgLSAodm9pZCAqKV9fYXJjaF9nZXRfdmRzb19kYXRhKCkpOwogCXJldHVybiAmX192
ZHNvX3JuZ19kYXRhOwogfQogCgotLSAKMi40Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
