Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768E4C02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 13:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u58c4MF76o/lticX/gPGtbP/B/fTVa6IxaHGmNBU2SY=; b=ZCkiKSoSqS+1CF
	KBQdRnQBcTpJ15bSaQc8UL5VNaFD34sAJzkqpS7Bqn8TeNsObrb/NMJWhpiExUph8f7O/rblTudtt
	IX10znhs2ZTiE5ZZqaDLww2qJ/FN07t0OrxqJMF+/1t+/1XXNXvADuJkll0TfBi4W1lAwM9WGjEP7
	uh0TIbchLTqb+dfdiaYOQLjsH5Yw8HBvBauZO6LfAJjsX3OEGNvm0fA43Nn4qAeaI/L6Ht4nLjBoI
	KmrN8kNz/o6rN/IG2dWfXFxdj9YZafXkybuLSPU8iTdtzaO35mfMaXDKWFdppBMkByiQByt0+8Pz/
	DGdbrgEeyQ/m6ptjgRqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfJ10-00000000XLD-3TAz;
	Tue, 04 Feb 2025 13:30:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHh4-00000000LSa-1hYS;
	Tue, 04 Feb 2025 12:06:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8C1ebuZ0lJP3y31bGxbPXbCHBk/S+qyapGPEltlOHE=;
	b=fi6cVuzjg4MLvcYaeTAoa6PBJxAXwGkCFxgSqCxnb4+NvWS85bFlVftgTJO5gaoWhYW8i9
	7635wXYUnTxr/wUOOBfvaDrER7sH/TbkoksOLy9giCeeC4qd3dh8mpeWX3JHS/XhYn0BRk
	BqLl9VknOnJ3kGTvQHkUCtpHBUCpxGOuGJY4bdWTVCFsbKECbzdfRLilge9rJWUtlyxKC7
	VBaspiMhh+kx9gqaw7LyUjiVleFMvapfpuZHPb6xkHMZC2VIi8F5XzCQ0DSAf0fn7B2O08
	1zk1jXDoUL2Pocq+at6WCtmg+ay55jEGBG5Jj8OE7K8uyUdcePWUINunuqG/Yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8C1ebuZ0lJP3y31bGxbPXbCHBk/S+qyapGPEltlOHE=;
	b=2eYUqzXZNGGnj5Wh23qEcRcuMeOUuGUGdOStZdCHtqG/RkcxKvkcU4aNH8ixEHYcc6KAJs
	/9dVQ/HrHShoSZBA==
Date: Tue, 04 Feb 2025 13:05:48 +0100
Subject: [PATCH v3 16/18] x86/vdso/vdso2c: Remove page handling
MIME-Version: 1.0
Message-Id: <20250204-vdso-store-rng-v3-16-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
In-Reply-To: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=3853;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KrW27nKBFkTbdI5cLKoYeWIiY+efCrM238alit0fD+g=;
 b=zdDZFkIolBZYIjKWRZuJRMfq4CoiBuUv7c6wtv4Hs9U4Ltw3T91jpRe9dk3QOTK23hyGtUr39
 Yq1QUI7Wq44CTAg/ca7dKzXfjeOCKECnZPsmvD7/dIPLoNeIfUxRaFG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_040618_730089_B4D6CEC7 
X-CRM114-Status: GOOD (  12.80  )
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

VGhlIHZhbHVlcyBhcmUgbm90IHVzZWQgYW55bW9yZS4KQWxzbyB0aGUgc2FuaXR5IGNoZWNrcyBw
ZXJmb3JtZWQgYnkgdmRzbzJjIGNhbiBuZXZlciB0cmlnZ2VyIGFzIHRoZXkKb25seSB2YWxpZGF0
ZSBpbnZhcmlhbnRzIGFscmVhZHkgZW5mb3JjZWQgYnkgdGhlIGxpbmtlciBzY3JpcHQuCgpTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25p
eC5kZT4KLS0tCiBhcmNoL3g4Ni9lbnRyeS92ZHNvL3Zkc28tbGF5b3V0Lmxkcy5TIHwgIDQgLS0t
LQogYXJjaC94ODYvZW50cnkvdmRzby92ZHNvMmMuYyAgICAgICAgICB8IDIxIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogYXJjaC94ODYvZW50cnkvdmRzby92ZHNvMmMuaCAgICAgICAgICB8IDIwIC0t
LS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvLmggICAgICAgICAg
IHwgIDYgLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDUxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2VudHJ5L3Zkc28vdmRzby1sYXlvdXQubGRzLlMgYi9hcmNoL3g4Ni9lbnRy
eS92ZHNvL3Zkc28tbGF5b3V0Lmxkcy5TCmluZGV4IGU1Y2VjZGIwZmVkZjAwMDUxNmJiNzg5ZDZh
Y2E0Yzk1MmMzMDM1ZTUuLmVjMWFjMTkxYTA1NzhlNTVkYzcyY2VmZjdmNWI1ZWIxMDQwNDI4ODEg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2VudHJ5L3Zkc28vdmRzby1sYXlvdXQubGRzLlMKKysrIGIv
YXJjaC94ODYvZW50cnkvdmRzby92ZHNvLWxheW91dC5sZHMuUwpAQCAtMjQsMTAgKzI0LDYgQEAg
U0VDVElPTlMKIAlwdmNsb2NrX3BhZ2UgPSB2Y2xvY2tfcGFnZXMgKyBWRFNPX1BBR0VfUFZDTE9D
S19PRkZTRVQgKiBQQUdFX1NJWkU7CiAJaHZjbG9ja19wYWdlID0gdmNsb2NrX3BhZ2VzICsgVkRT
T19QQUdFX0hWQ0xPQ0tfT0ZGU0VUICogUEFHRV9TSVpFOwogCi0JLyogRm9yIGNvbXBhdGliaWxp
dHkgd2l0aCB2ZHNvMmMgKi8KLQl2dmFyX3BhZ2UgPSB2ZHNvX3VfZGF0YTsKLQl2dmFyX3N0YXJ0
ID0gdmRzb191X2RhdGE7Ci0KIAkuID0gU0laRU9GX0hFQURFUlM7CiAKIAkuaGFzaAkJOiB7ICoo
Lmhhc2gpIH0JCQk6dGV4dApkaWZmIC0tZ2l0IGEvYXJjaC94ODYvZW50cnkvdmRzby92ZHNvMmMu
YyBiL2FyY2gveDg2L2VudHJ5L3Zkc28vdmRzbzJjLmMKaW5kZXggOTBkMTVmMmE3MjA1NWUzN2Yy
ZWY0MjkyMDk2ZGQ3ODBhMDUxYmM4NC4uZjg0ZThmOGZhNWZlNmQxYmM2ODA4OTVkZmVmMjhmZTky
NTFhN2ZlMyAxMDA2NDQKLS0tIGEvYXJjaC94ODYvZW50cnkvdmRzby92ZHNvMmMuYworKysgYi9h
cmNoL3g4Ni9lbnRyeS92ZHNvL3Zkc28yYy5jCkBAIC02OSwzMyArNjksMTIgQEAKIAogY29uc3Qg
Y2hhciAqb3V0ZmlsZW5hbWU7CiAKLS8qIFN5bWJvbHMgdGhhdCB3ZSBuZWVkIGluIHZkc28yYy4g
Ki8KLWVudW0gewotCXN5bV92dmFyX3N0YXJ0LAotCXN5bV92dmFyX3BhZ2UsCi0Jc3ltX3B2Y2xv
Y2tfcGFnZSwKLQlzeW1faHZjbG9ja19wYWdlLAotCXN5bV90aW1lbnNfcGFnZSwKLX07Ci0KLWNv
bnN0IGludCBzcGVjaWFsX3BhZ2VzW10gPSB7Ci0Jc3ltX3Z2YXJfcGFnZSwKLQlzeW1fcHZjbG9j
a19wYWdlLAotCXN5bV9odmNsb2NrX3BhZ2UsCi0Jc3ltX3RpbWVuc19wYWdlLAotfTsKLQogc3Ry
dWN0IHZkc29fc3ltIHsKIAljb25zdCBjaGFyICpuYW1lOwogCWJvb2wgZXhwb3J0OwogfTsKIAog
c3RydWN0IHZkc29fc3ltIHJlcXVpcmVkX3N5bXNbXSA9IHsKLQlbc3ltX3Z2YXJfc3RhcnRdID0g
eyJ2dmFyX3N0YXJ0IiwgdHJ1ZX0sCi0JW3N5bV92dmFyX3BhZ2VdID0geyJ2dmFyX3BhZ2UiLCB0
cnVlfSwKLQlbc3ltX3B2Y2xvY2tfcGFnZV0gPSB7InB2Y2xvY2tfcGFnZSIsIHRydWV9LAotCVtz
eW1faHZjbG9ja19wYWdlXSA9IHsiaHZjbG9ja19wYWdlIiwgdHJ1ZX0sCi0JW3N5bV90aW1lbnNf
cGFnZV0gPSB7InRpbWVuc19wYWdlIiwgdHJ1ZX0sCiAJeyJWRFNPMzJfTk9URV9NQVNLIiwgdHJ1
ZX0sCiAJeyJfX2tlcm5lbF92c3lzY2FsbCIsIHRydWV9LAogCXsiX19rZXJuZWxfc2lncmV0dXJu
IiwgdHJ1ZX0sCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9lbnRyeS92ZHNvL3Zkc28yYy5oIGIvYXJj
aC94ODYvZW50cnkvdmRzby92ZHNvMmMuaAppbmRleCA2N2IzZTM3NTc2YTY0YTI5ZWNiZGM2ZmQ3
NWU0MTBmYzUyYTgyZTU4Li43OGVkMWMxZjI4YjkyYjk3OTczZjU3ZDNmNjViOWM0ZDQ2OTRmNDYy
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9lbnRyeS92ZHNvL3Zkc28yYy5oCisrKyBiL2FyY2gveDg2
L2VudHJ5L3Zkc28vdmRzbzJjLmgKQEAgLTE1MCwyNiArMTUwLDYgQEAgc3RhdGljIHZvaWQgQklU
U0ZVTkMoZ28pKHZvaWQgKnJhd19hZGRyLCBzaXplX3QgcmF3X2xlbiwKIAkJfQogCX0KIAotCS8q
IFZhbGlkYXRlIG1hcHBpbmcgYWRkcmVzc2VzLiAqLwotCWZvciAoaSA9IDA7IGkgPCBzaXplb2Yo
c3BlY2lhbF9wYWdlcykgLyBzaXplb2Yoc3BlY2lhbF9wYWdlc1swXSk7IGkrKykgewotCQlJTlRf
QklUUyBzeW12YWwgPSBzeW1zW3NwZWNpYWxfcGFnZXNbaV1dOwotCi0JCWlmICghc3ltdmFsKQot
CQkJY29udGludWU7ICAvKiBUaGUgbWFwcGluZyBpc24ndCB1c2VkOyBpZ25vcmUgaXQuICovCi0K
LQkJaWYgKHN5bXZhbCAlIDQwOTYpCi0JCQlmYWlsKCIlcyBtdXN0IGJlIGEgbXVsdGlwbGUgb2Yg
NDA5NlxuIiwKLQkJCSAgICAgcmVxdWlyZWRfc3ltc1tpXS5uYW1lKTsKLQkJaWYgKHN5bXZhbCAr
IDQwOTYgPCBzeW1zW3N5bV92dmFyX3N0YXJ0XSkKLQkJCWZhaWwoIiVzIHVuZGVycnVucyB2dmFy
X3N0YXJ0XG4iLAotCQkJICAgICByZXF1aXJlZF9zeW1zW2ldLm5hbWUpOwotCQlpZiAoc3ltdmFs
ICsgNDA5NiA+IDApCi0JCQlmYWlsKCIlcyBpcyBvbiB0aGUgd3Jvbmcgc2lkZSBvZiB0aGUgdmRz
byB0ZXh0XG4iLAotCQkJICAgICByZXF1aXJlZF9zeW1zW2ldLm5hbWUpOwotCX0KLQlpZiAoc3lt
c1tzeW1fdnZhcl9zdGFydF0gJSA0MDk2KQotCQlmYWlsKCJ2dmFyX2JlZ2luIG11c3QgYmUgYSBt
dWx0aXBsZSBvZiA0MDk2XG4iKTsKLQogCWlmICghaW1hZ2VfbmFtZSkgewogCQlmd3JpdGUoc3Ry
aXBwZWRfYWRkciwgc3RyaXBwZWRfbGVuLCAxLCBvdXRmaWxlKTsKIAkJcmV0dXJuOwpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
dmRzby5oCmluZGV4IGQ3ZjY1OTJiNzRhOTRmNmZlY2JhNTljZThmMjNlYjM5OTA4NDNkYjQuLjgw
YmUwZGE3MzNkZjQzZGU3NTIwYmVmNjlhZDEyMGNlMDVkMzc5OTQgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL3Zkc28uaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvLmgK
QEAgLTE4LDEyICsxOCw2IEBAIHN0cnVjdCB2ZHNvX2ltYWdlIHsKIAl1bnNpZ25lZCBsb25nIGV4
dGFibGVfYmFzZSwgZXh0YWJsZV9sZW47CiAJY29uc3Qgdm9pZCAqZXh0YWJsZTsKIAotCWxvbmcg
c3ltX3Z2YXJfc3RhcnQ7ICAvKiBOZWdhdGl2ZSBvZmZzZXQgdG8gdGhlIHZ2YXIgYXJlYSAqLwot
Ci0JbG9uZyBzeW1fdnZhcl9wYWdlOwotCWxvbmcgc3ltX3B2Y2xvY2tfcGFnZTsKLQlsb25nIHN5
bV9odmNsb2NrX3BhZ2U7Ci0JbG9uZyBzeW1fdGltZW5zX3BhZ2U7CiAJbG9uZyBzeW1fVkRTTzMy
X05PVEVfTUFTSzsKIAlsb25nIHN5bV9fX2tlcm5lbF9zaWdyZXR1cm47CiAJbG9uZyBzeW1fX19r
ZXJuZWxfcnRfc2lncmV0dXJuOwoKLS0gCjIuNDguMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
