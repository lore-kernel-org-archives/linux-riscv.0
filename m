Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDE7CF07BF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7h37w2OKNcg0NDAG1oFXDXqpukYqpGxlrmYWsPDZLC0=; b=PMp9MAvaqVrQ8q
	a/9sxlvNB+3QWfzAY9b2jJ2/SwV+QJgxvmFvC3iUf5rF4S+tDbWluusqS615frJP/n24zOvmx+9cf
	m9929Wyze08vMEPMCTq3P5YCHF6IWVE+R3Loic2sY/XmKKo1kjsuglhr5tEnDX8uoTwMGtTxS1XHC
	YSqdiLf3QmfzkIiQO+usb+ZvV6EsqpbFF7RnPKko4ERgxQKw0uptjKV6AMWb/+ZDFhsAVGxqSS9rl
	qvvAa5P9Pdr133bYqScW+dr32wEinjPSlqarCzsQ/pHafkCt2V8jQdCD9Vqli1k+ybSGNdBDUodwv
	EbT0ssQGAsL0x+SM6uXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syoZe-0000000C0z3-3pV5;
	Thu, 10 Oct 2024 08:31:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBj-0000000BlnB-1A3U;
	Thu, 10 Oct 2024 07:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=NOmDYcigYQIrIJIh3Um8635h5qr4veQV5uL1dAIYrXA=; b=dRZzuCYrRNyMgQx4eLMUr2pWFs
	lgQ9I4/g0u4iaCXKluWCPgfm1HTq5e+KY208+99rvl82pW4KY8zYcKS/0wPp0C0bSUJ2uOqwmm4rZ
	TBpbfDBwUdf2GTDePQioKlL3hceBpZiGl74zR5GA3tzdCwTAaBSqhu/F+T9eA4W8+/N4MrcdrjuSb
	WUsfgrQyt6tWtBbOvtm2bgadcg5yFqgQiXE/gkN3wqKNgR2dZhGxbGDxZupS8yHtDLmYeNY70WTCd
	B/6xtS5WyXZ5lmHxyEw3jlgV3Egu0fQA9BKNMB1QPdBgL3ymVQaHiS1xw3y3DRfSaa/0tAhX4NsDo
	IhRzkutw==;
Received: from galois.linutronix.de ([193.142.43.55])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBe-00000006yEb-35h4;
	Thu, 10 Oct 2024 07:02:18 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOmDYcigYQIrIJIh3Um8635h5qr4veQV5uL1dAIYrXA=;
	b=SVOAmEfpcB9zjCSlIl/abBlZtdgNslJZDJhREX69+DVllRbdyJNzuQ9AUCZ75N6Gz4WpZ7
	ZzujaAdmYucVDATv5ONGlJ2963QEzqFmk/Rk9S6pFIMYiCxodZILexuFmlQMMzMDNC+87s
	K0BdiS1EdKrWR0R5MRBmx7Ffm4zulKbHUGftMJBMzRtA0nmpseK4qzdOKsuVVkSxDG2VHq
	lHdzYfeiBMnlcxyrOurvyj6FQlKxtzMxqhO2rciK5mFv1Nkp817+IPI2195wt4Q35Br1Ea
	wqlXmTuoPsoo1NFKXetYn4Ucz4lsPC0KyLg6pbZvs6LOWRxmNNASWOz5JhGhGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOmDYcigYQIrIJIh3Um8635h5qr4veQV5uL1dAIYrXA=;
	b=fxHYPA0y490ySRRaI+Ew/229aCO/TeUTWvw3My8s0Y/ybAlV0Dr/e+mn6NyTne6zMb0eLm
	w824UqsUTq7vi+BA==
Date: Thu, 10 Oct 2024 09:01:18 +0200
Subject: [PATCH 16/28] x86: vdso: Access rng vdso data without vvar.h
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-16-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2664;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mPoW5wkTlEwrk7j/HBgEku1axNP1bE6//krdhLeEj6A=;
 b=SOS85n3wR1QQHupApY/YV5xsjsehWzr0JxWLt8ReYzlvQC1/64wff4+HN/GVvYTspFT1+NgJm
 f2EbWP1fw2vAOLJykZQlYW9djXtP20HkUIkKEWSQ98SEQdV4MsIKmia
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080215_544226_2F3C5C2E 
X-CRM114-Status: GOOD (  11.91  )
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

VGhlIHZkc29fcm5nX2RhdGEgaXMgYXQgYSB3ZWxsLWtub3duIG9mZnNldCBpbiB0aGUgdnZhciBw
YWdlLgpNYWtlIHVzZSBvZiB0aGlzIGludmFyaWFudCB0byByZW1vdmUgdGhlIHVzYWdlIG9mIHZ2
YXIuaC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gveDg2L2VudHJ5L3Zkc28vdmRzby1sYXlvdXQubGRz
LlMgfCAyICsrCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRvbS5oIHwgOCArKysr
LS0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20vdnZhci5oICAgICAgICAgICB8IDUgLS0tLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2VudHJ5L3Zkc28vdmRzby1sYXlvdXQubGRzLlMgYi9hcmNoL3g4Ni9lbnRy
eS92ZHNvL3Zkc28tbGF5b3V0Lmxkcy5TCmluZGV4IDUxYzBjYzAxMTk3NDhkZGEwZjI5ZDU3NzE5
N2M1MjBmMjcyZmQwMmYuLmFjY2U2MDczMmU1NDFmNDlkZmMyMWQ3NWUxYjUyNWM4YTc0ZjIzNDEg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2VudHJ5L3Zkc28vdmRzby1sYXlvdXQubGRzLlMKKysrIGIv
YXJjaC94ODYvZW50cnkvdmRzby92ZHNvLWxheW91dC5sZHMuUwpAQCAtMjQsNiArMjQsOCBAQCBT
RUNUSU9OUwogI2luY2x1ZGUgPGFzbS92dmFyLmg+CiAjdW5kZWYgRU1JVF9WVkFSCiAKKwl2ZHNv
X3JuZ19kYXRhID0gdnZhcl9wYWdlICsgX19WRFNPX1JORF9EQVRBX09GRlNFVDsKKwogCXB2Y2xv
Y2tfcGFnZSA9IHZ2YXJfc3RhcnQgKyBQQUdFX1NJWkU7CiAJaHZjbG9ja19wYWdlID0gdnZhcl9z
dGFydCArIDIgKiBQQUdFX1NJWkU7CiAJdGltZW5zX3BhZ2UgID0gdnZhcl9zdGFydCArIDMgKiBQ
QUdFX1NJWkU7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL2dldHJhbmRv
bS5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaAppbmRleCBkMDcxM2M4
MjkyNTRjYzgxNzJjNTkwM2ExZmRiYTE2OGI1MmZmMWVhLi4yYmY5YzBlOTcwYzNlN2QyYTJkZGZj
YjFkMDA3Y2I3M2RhMjAwNDk0IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNv
L2dldHJhbmRvbS5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0cmFuZG9tLmgK
QEAgLTgsNyArOCw2IEBACiAjaWZuZGVmIF9fQVNTRU1CTFlfXwogCiAjaW5jbHVkZSA8YXNtL3Vu
aXN0ZC5oPgotI2luY2x1ZGUgPGFzbS92dmFyLmg+CiAKIC8qKgogICogZ2V0cmFuZG9tX3N5c2Nh
bGwgLSBJbnZva2UgdGhlIGdldHJhbmRvbSgpIHN5c2NhbGwuCkBAIC0yOCwxMyArMjcsMTQgQEAg
c3RhdGljIF9fYWx3YXlzX2lubGluZSBzc2l6ZV90IGdldHJhbmRvbV9zeXNjYWxsKHZvaWQgKmJ1
ZmZlciwgc2l6ZV90IGxlbiwgdW5zaWcKIAlyZXR1cm4gcmV0OwogfQogCi0jZGVmaW5lIF9fdmRz
b19ybmdfZGF0YSAoVlZBUihfdmRzb19ybmdfZGF0YSkpCitleHRlcm4gc3RydWN0IHZkc29fcm5n
X2RhdGEgdmRzb19ybmdfZGF0YQorCV9fYXR0cmlidXRlX18oKHZpc2liaWxpdHkoImhpZGRlbiIp
KSk7CiAKIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgY29uc3Qgc3RydWN0IHZkc29fcm5nX2RhdGEg
Kl9fYXJjaF9nZXRfdmRzb19ybmdfZGF0YSh2b2lkKQogewogCWlmIChJU19FTkFCTEVEKENPTkZJ
R19USU1FX05TKSAmJiBfX2FyY2hfZ2V0X3Zkc29fZGF0YSgpLT5jbG9ja19tb2RlID09IFZEU09f
Q0xPQ0tNT0RFX1RJTUVOUykKLQkJcmV0dXJuICh2b2lkICopJl9fdmRzb19ybmdfZGF0YSArICgo
dm9pZCAqKSZ0aW1lbnNfcGFnZSAtICh2b2lkICopX19hcmNoX2dldF92ZHNvX2RhdGEoKSk7Ci0J
cmV0dXJuICZfX3Zkc29fcm5nX2RhdGE7CisJCXJldHVybiAodm9pZCAqKSZ2ZHNvX3JuZ19kYXRh
ICsgKCh2b2lkICopJnRpbWVuc19wYWdlIC0gKHZvaWQgKilfX2FyY2hfZ2V0X3Zkc29fZGF0YSgp
KTsKKwlyZXR1cm4gJnZkc29fcm5nX2RhdGE7CiB9CiAKICNlbmRpZiAvKiAhX19BU1NFTUJMWV9f
ICovCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92dmFyLmggYi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS92dmFyLmgKaW5kZXggZmUzNDM0ZDNiNWIxZWVmODA2ZTgzMjhiODY2NTBlMDAx
YjE3N2RlMi4uYjYwNTkxNGY0ZDQzNDdjMTYzNDRlNWI1ZTA2MzY5NzUzOGQ0ODk1ZSAxMDA2NDQK
LS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdnZhci5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUv
YXNtL3Z2YXIuaApAQCAtNjIsMTEgKzYyLDYgQEAgZXh0ZXJuIGNoYXIgX192dmFyX3BhZ2U7CiAK
IERFQ0xBUkVfVlZBUigwLCBzdHJ1Y3QgdmRzb19kYXRhLCBfdmRzb19kYXRhKQogCi0jaWYgIWRl
ZmluZWQoX1NJTkdMRV9EQVRBKQotI2RlZmluZSBfU0lOR0xFX0RBVEEKLURFQ0xBUkVfVlZBUl9T
SU5HTEUoX19WRFNPX1JORF9EQVRBX09GRlNFVCwgc3RydWN0IHZkc29fcm5nX2RhdGEsIF92ZHNv
X3JuZ19kYXRhKQotI2VuZGlmCi0KICN1bmRlZiBERUNMQVJFX1ZWQVIKICN1bmRlZiBERUNMQVJF
X1ZWQVJfU0lOR0xFCiAKCi0tIAoyLjQ3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
