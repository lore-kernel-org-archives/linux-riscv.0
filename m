Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96AACF07BE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PS/DukN3Q+dQnH+0BSEXVn0LIUy1LNMfktY1Kzn8M8o=; b=ZYtNUHPd74ZVhl
	5LXseUkAZqnAB9yC6U6Cqen+xVcMO7qbEbVjed0Fbef3ptkXapvoe/P33ISSOm3qpG2oYgRAsklOf
	O1PZYF/W0d5On/XrA7IsJYeu6SzMJJG0LgbO/e9TZt8QhyF3HCbGuaiDN3PW+9158VCPb4YXPwkPF
	xUdHoccbXR8Ca5hbssOBYKj975UnZ2wO9jUNe3wGsVvpqqpntgzafecoRc1LTruDLzbCfwoKTDdMt
	0qjzAfg6U2QMMJeksTMz/528IRwjhUJ3s4+ifEq2G9mRcBzBA0LAJMoKEt1v/WQ/sNtuMIZFnkH8T
	mY3jF9gAVTywmsz4CuEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synZ2-0000000Bpfd-49FK;
	Thu, 10 Oct 2024 07:26:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBl-0000000BloM-0b6O;
	Thu, 10 Oct 2024 07:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=o80BJ2ePq/KTeWTph/dk3r0TbxIJWIzYIWjc4f8IPAY=; b=TQNZfEdVgAT3UK/4epv+WZ4wTi
	swKWoStCVuo+9//Mrs+tkcCsdfU5S3VDh4yJi961N9hIgxaYiNfcPPUv1qEfWg0/zBbHFyimXaMgB
	U2H57jFl3OLHqvyLc3GeNroE73+9xcwwXDazACY19Zs8ucjonnUY8DONiRdXZYBQI40vdPhYfTY6D
	2FljC36kGP4PrFW/+Uuega3aVi0HBj2G9ZoiZuRaHwR9zJ6oVpl8hquezeChAPibaNwps6LF258SC
	FJOymyTij2S+kbpmW+EJMGskeH4Vy9n/SZASW5k2r6DcaT45MLi0fO6LImK5B61NXMgZXvTwF6Y5n
	yWq6QCMg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBf-00000005Cw5-11uY;
	Thu, 10 Oct 2024 07:02:19 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o80BJ2ePq/KTeWTph/dk3r0TbxIJWIzYIWjc4f8IPAY=;
	b=oR2MBOmC8kYuKrHMx461FC2+cUPMhFJ6D1VRIgry34xBIrBo+VzVzj6Q1kbJMDxDxrpM5w
	BibcvUOsfhxeZFqpFe7Dz3h4X9VmsWB+vh6eXtf185bxeWUSTPYSPnpDOtrmjGGOB1FDvs
	80mXlYYzDOGq/4GWwybYZvhu3a/zol6Hvqcy+5MBkQyVqNu1DBjnxzOXgUCaq8o8B/78/V
	H7bArnDGZnvw8As8rr6shQ5aoLBScYPP5T7h7+yRqkBGpCGZCOy6eSgicp2xIEJpc5BP88
	ku3YK6VW/Ygn+VBqB6hc3nhQ87EUtji+qTi8KCJp0BaEUuuX+AG1zT0Wpqpi0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o80BJ2ePq/KTeWTph/dk3r0TbxIJWIzYIWjc4f8IPAY=;
	b=OLc0/IzcI1/Q0xfn6++5SSfFHZnsZswl+T5N39o23MMYsZ/2b515TSBPnlXG7UYDBAK8nH
	0W/YxVH5uAC0RrCA==
Date: Thu, 10 Oct 2024 09:01:17 +0200
Subject: [PATCH 15/28] x86: vdso: Access timens vdso data without vvar.h
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-15-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2753;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=5q/oYmCSAPWM0DZS09Zn4vubsvf/hAs/b2wMHxglk/E=;
 b=kReKc4w+yDADDmj9s544US9VPVSloE8UMIfnmrPa7aAdPH4ejj+L3bd9L+1xbmEfjoHrX8qSs
 maEyo7KotmKA6M0V/aylVq3f/Ugs1ZBlarmgyjV66OmOTx3DXEQv6Uj
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080215_492748_16535DDF 
X-CRM114-Status: GOOD (  11.87  )
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

VGhlIHZkc29fZGF0YSBpcyBhdCB0aGUgc3RhcnQgb2YgdGhlIHRpbWVucyBwYWdlLgpNYWtlIHVz
ZSBvZiB0aGlzIGludmFyaWFudCB0byByZW1vdmUgdGhlIHVzYWdlIG9mIHZ2YXIuaC4KVGhpcyBh
bHNvIG1hdGNoZXMgdGhlIGxvZ2ljIGZvciB0aGUgcHZjbG9jayBhbmQgaHZjbG9jayBwYWdlcy4K
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51
dHJvbml4LmRlPgotLS0KIGFyY2gveDg2L2VudHJ5L3Zkc28vdmRzby1sYXlvdXQubGRzLlMgICAg
fCA2IC0tLS0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaCAgICB8IDIg
Ky0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmggfCA2ICsrKystLQog
MyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYvZW50cnkvdmRzby92ZHNvLWxheW91dC5sZHMuUyBiL2FyY2gveDg2L2Vu
dHJ5L3Zkc28vdmRzby1sYXlvdXQubGRzLlMKaW5kZXggYmFmYTczZjA5ZTkyODVmYmYyOWNmM2Y3
M2UxM2I2ZDkyZGYyZjM3Ni4uNTFjMGNjMDExOTc0OGRkYTBmMjlkNTc3MTk3YzUyMGYyNzJmZDAy
ZiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvZW50cnkvdmRzby92ZHNvLWxheW91dC5sZHMuUworKysg
Yi9hcmNoL3g4Ni9lbnRyeS92ZHNvL3Zkc28tbGF5b3V0Lmxkcy5TCkBAIC0yOCwxMiArMjgsNiBA
QCBTRUNUSU9OUwogCWh2Y2xvY2tfcGFnZSA9IHZ2YXJfc3RhcnQgKyAyICogUEFHRV9TSVpFOwog
CXRpbWVuc19wYWdlICA9IHZ2YXJfc3RhcnQgKyAzICogUEFHRV9TSVpFOwogCi0jdW5kZWYgX0FT
TV9YODZfVlZBUl9ICi0JLyogUGxhY2UgYWxsIHZ2YXJzIGluIHRpbWVucyB0b28gYXQgdGhlIG9m
ZnNldHMgaW4gYXNtL3Z2YXIuaC4gKi8KLSNkZWZpbmUgRU1JVF9WVkFSKG5hbWUsIG9mZnNldCkg
dGltZW5zXyAjIyBuYW1lID0gdGltZW5zX3BhZ2UgKyBvZmZzZXQ7Ci0jaW5jbHVkZSA8YXNtL3Z2
YXIuaD4KLSN1bmRlZiBFTUlUX1ZWQVIKLQogCS4gPSBTSVpFT0ZfSEVBREVSUzsKIAogCS5oYXNo
CQk6IHsgKiguaGFzaCkgfQkJCTp0ZXh0CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS92ZHNvL2dldHJhbmRvbS5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20u
aAppbmRleCBlY2RjZGJjZDMzOTI1MzNlNTYxOWQ3ZjA5NDAzZDYwYTk4MTBjZWFiLi5kMDcxM2M4
MjkyNTRjYzgxNzJjNTkwM2ExZmRiYTE2OGI1MmZmMWVhIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zk
c28vZ2V0cmFuZG9tLmgKQEAgLTMzLDcgKzMzLDcgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBz
c2l6ZV90IGdldHJhbmRvbV9zeXNjYWxsKHZvaWQgKmJ1ZmZlciwgc2l6ZV90IGxlbiwgdW5zaWcK
IHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgY29uc3Qgc3RydWN0IHZkc29fcm5nX2RhdGEgKl9fYXJj
aF9nZXRfdmRzb19ybmdfZGF0YSh2b2lkKQogewogCWlmIChJU19FTkFCTEVEKENPTkZJR19USU1F
X05TKSAmJiBfX2FyY2hfZ2V0X3Zkc29fZGF0YSgpLT5jbG9ja19tb2RlID09IFZEU09fQ0xPQ0tN
T0RFX1RJTUVOUykKLQkJcmV0dXJuICh2b2lkICopJl9fdmRzb19ybmdfZGF0YSArICgodm9pZCAq
KSZfX3RpbWVuc192ZHNvX2RhdGEgLSAodm9pZCAqKV9fYXJjaF9nZXRfdmRzb19kYXRhKCkpOwor
CQlyZXR1cm4gKHZvaWQgKikmX192ZHNvX3JuZ19kYXRhICsgKCh2b2lkICopJnRpbWVuc19wYWdl
IC0gKHZvaWQgKilfX2FyY2hfZ2V0X3Zkc29fZGF0YSgpKTsKIAlyZXR1cm4gJl9fdmRzb19ybmdf
ZGF0YTsKIH0KIApkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1l
b2ZkYXkuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmgKaW5kZXgg
YjJkMmRmMDI2ZjZlNzA3YjgxNjRkODg0MmMzM2VkZWE5YTY1ODQ2Ni4uMWU2MTE2MTcyYTY1Y2Qw
N2VmMjkwOTJkYmE2MjQxZDcxOWYwNzQ0OCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9h
c20vdmRzby9nZXR0aW1lb2ZkYXkuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL2dl
dHRpbWVvZmRheS5oCkBAIC0yMSw3ICsyMSw5IEBACiAjaW5jbHVkZSA8Y2xvY2tzb3VyY2UvaHlw
ZXJ2X3RpbWVyLmg+CiAKICNkZWZpbmUgX192ZHNvX2RhdGEgKFZWQVIoX3Zkc29fZGF0YSkpCi0j
ZGVmaW5lIF9fdGltZW5zX3Zkc29fZGF0YSAoVElNRU5TKF92ZHNvX2RhdGEpKQorCitleHRlcm4g
c3RydWN0IHZkc29fZGF0YSB0aW1lbnNfcGFnZQorCV9fYXR0cmlidXRlX18oKHZpc2liaWxpdHko
ImhpZGRlbiIpKSk7CiAKICNkZWZpbmUgVkRTT19IQVNfVElNRSAxCiAKQEAgLTYxLDcgKzYzLDcg
QEAgZXh0ZXJuIHN0cnVjdCBtc19oeXBlcnZfdHNjX3BhZ2UgaHZjbG9ja19wYWdlCiBzdGF0aWMg
X19hbHdheXNfaW5saW5lCiBjb25zdCBzdHJ1Y3QgdmRzb19kYXRhICpfX2FyY2hfZ2V0X3RpbWVu
c192ZHNvX2RhdGEoY29uc3Qgc3RydWN0IHZkc29fZGF0YSAqdmQpCiB7Ci0JcmV0dXJuIF9fdGlt
ZW5zX3Zkc29fZGF0YTsKKwlyZXR1cm4gJnRpbWVuc19wYWdlOwogfQogI2VuZGlmCiAKCi0tIAoy
LjQ3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
