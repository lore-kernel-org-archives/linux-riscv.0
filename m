Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC4AE7719C
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QpkO9hzL/WXG0uSpBgqq6/qUxxm0LiYq8/ahVtiyZA=; b=C0h7/9kiI+Q1ts
	7YNTuIIZwBzWhgX4CDZ4olM1hidnpga6H68/3gZvdxpUwIOqvDZXE3LSzbFLFN7ev4ldcgkiFv5/o
	R/OqwIibStNpkgSVzNNQ9sfFrs+tyJzdLlDIYxY9vDm/muHCK0NtW8N1Sv20fNcktEfD6VtjPA2BJ
	+d011qZ5iR55r3bxjan3KYYBbih5+sIlmxuD9cz/ndhABrCpnAM4IQyTCEr1Oa63L0An2VLVMMsjo
	bFIvvwtmyTh58uEaT+b+gIe6hT3c0gZBGoN++0cLUjYHA3ZlkcRxNNio6KXJ2sxNZ3+bXFskFyVop
	FzTPRc+EvKcVq88DyLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHDR-0000000G4NV-00pR;
	Fri, 10 Jan 2025 15:46:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGrk-0000000FtoE-3nVs;
	Fri, 10 Jan 2025 15:24:06 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736522641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpJJBpExepilr1e2LDfuHty6WeJflNVwrGD4fcjF/+8=;
	b=WNKGqavyPePiDg61FU1H3x/H8y3RjJi1u1HoBkEUUayQduQ3z96s99+3Vr0oOkE+XkV6Ic
	p+q9po91IlUb6D2P44CCEXV43soEj6r7dTZigibgsRLqK9HGVwr1lgE3RP0HHqIN9gmNFT
	ukIArHjKKvFy1SOiSlDQpXb20ViaiClRnxyejp+0vbIx0N78cbmLrhWy+wJGKBy2sCfm+V
	XT6rOKwlAAFAg4afID05I2HU0HBBYVjz+F6hNdouBYH/Fay/8RbXCyiALE1mwF4BxiINw/
	KQj2E/8BbWDsUWuGxUp0RGUYNRDctvYXP5QE+PT44e5gfirulIQUMIzdHXFbHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736522641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpJJBpExepilr1e2LDfuHty6WeJflNVwrGD4fcjF/+8=;
	b=KNQwmbhIFkev3kV3ZI1pztbVIIRhKfE1Z3u8tALSaFxLJgyPKNSjSTz4MaMRqgMtzsFlvz
	SulSEKg3Mge2EPBA==
Date: Fri, 10 Jan 2025 16:23:56 +0100
Subject: [PATCH v2 17/18] vdso: Remove remnants of architecture-specific
 random state storage
MIME-Version: 1.0
Message-Id: <20250110-vdso-store-rng-v2-17-350c9179bbf1@linutronix.de>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
In-Reply-To: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736522629; l=1909;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ebVxN/FJGifv+RO3iXgSdQkCkRwa0yMwOEaRcM3+4TE=;
 b=4OgYlLAdlumC2HZPf6WpVDZ0oQlx07ye+dlpuiMf/+Yazg/+7P69RNR3Heeo9H6T28mxYF1hU
 3Vo0yL53jzkCVw9t4CjnFsMJ6T2ReF7nZhE8sTzBKOv3OdHS+5/tiL0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_072405_252648_AE50BC10 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

QWxsIHVzZXJzIG9mIHRoZSByYW5kb20gdkRTTyBhcmUgdXNpbmcgdGhlIGdlbmVyaWMgc3RvcmFn
ZQppbXBsZW1lbnRhdGlvbi4gUmVtb3ZlIHRoZSBub3cgdW5uZWNlc3NhcnkgY29tcGF0aWJpbGl0
eSBhY2Nlc3NvcgpmdW5jdGlvbnMgYW5kIHN5bWJvbHMuCgpDby1kZXZlbG9wZWQtYnk6IE5hbSBD
YW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBOYW0gQ2FvIDxuYW1jYW9A
bGludXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53
ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogaW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNvL3Zz
eXNjYWxsLmggfCA1IC0tLS0tCiBpbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaCAgICAgICAgICAgICB8
IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvYXNtLWdlbmVyaWMvdmRzby92c3lzY2FsbC5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNv
L3ZzeXNjYWxsLmgKaW5kZXggYTVmOTczZTRlMjcyM2VmMTgxNWM4OGE3ODQ2ZjdjNDc3ZTNmZWJk
OS4uMTNlMmFjMzczNmVlOWI0YWVhNjgwMDExNzk5N2VlMTY1YTdlMmI5ZCAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNvL3ZzeXNjYWxsLmgKKysrIGIvaW5jbHVkZS9hc20tZ2Vu
ZXJpYy92ZHNvL3ZzeXNjYWxsLmgKQEAgLTMyLDExICszMiw2IEBAIHN0YXRpYyBfX2Fsd2F5c19p
bmxpbmUgc3RydWN0IHZkc29fZGF0YSAqX19hcmNoX2dldF9rX3Zkc29fZGF0YSh2b2lkKQogCiAj
ZGVmaW5lIF9fYXJjaF9nZXRfdmRzb191X3RpbWVfZGF0YSBfX2FyY2hfZ2V0X3Zkc29fZGF0YQog
Ci0jaWZuZGVmIF9fYXJjaF9nZXRfdmRzb191X3JuZ19kYXRhCi0jZGVmaW5lIF9fYXJjaF9nZXRf
dmRzb191X3JuZ19kYXRhKCkgX19hcmNoX2dldF92ZHNvX3JuZ19kYXRhKCkKLSNlbmRpZgotI2Rl
ZmluZSB2ZHNvX2tfcm5nX2RhdGEgX19hcmNoX2dldF9rX3Zkc29fcm5nX2RhdGEoKQotCiAjZW5k
aWYgLyogQ09ORklHX0dFTkVSSUNfVkRTT19EQVRBX1NUT1JFICovCiAKICNpZm5kZWYgX19hcmNo
X3VwZGF0ZV92c3lzY2FsbApkaWZmIC0tZ2l0IGEvaW5jbHVkZS92ZHNvL2RhdGFwYWdlLmggYi9p
bmNsdWRlL3Zkc28vZGF0YXBhZ2UuaAppbmRleCA0NjY1OGIzOWMyODI1MGU5NzdmNWEzNDU0MjI0
YzNlZDBmYjRjODFkLi40OTc5MDdjM2FhMTFmY2FlOTEzZjYyZWY3MzczYmJlNmExMDI2YmQ2IDEw
MDY0NAotLS0gYS9pbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaAorKysgYi9pbmNsdWRlL3Zkc28vZGF0
YXBhZ2UuaApAQCAtMTUyLDcgKzE1Miw2IEBAIHN0cnVjdCB2ZHNvX3JuZ19kYXRhIHsKICNpZm5k
ZWYgQ09ORklHX0dFTkVSSUNfVkRTT19EQVRBX1NUT1JFCiBleHRlcm4gc3RydWN0IHZkc29fdGlt
ZV9kYXRhIF92ZHNvX2RhdGFbQ1NfQkFTRVNdIF9fYXR0cmlidXRlX18oKHZpc2liaWxpdHkoImhp
ZGRlbiIpKSk7CiBleHRlcm4gc3RydWN0IHZkc29fdGltZV9kYXRhIF90aW1lbnNfZGF0YVtDU19C
QVNFU10gX19hdHRyaWJ1dGVfXygodmlzaWJpbGl0eSgiaGlkZGVuIikpKTsKLWV4dGVybiBzdHJ1
Y3QgdmRzb19ybmdfZGF0YSBfdmRzb19ybmdfZGF0YSBfX2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5
KCJoaWRkZW4iKSkpOwogI2Vsc2UKIGV4dGVybiBzdHJ1Y3QgdmRzb190aW1lX2RhdGEgdmRzb191
X3RpbWVfZGF0YVtDU19CQVNFU10gX19hdHRyaWJ1dGVfXygodmlzaWJpbGl0eSgiaGlkZGVuIikp
KTsKIGV4dGVybiBzdHJ1Y3QgdmRzb19ybmdfZGF0YSB2ZHNvX3Vfcm5nX2RhdGEgX19hdHRyaWJ1
dGVfXygodmlzaWJpbGl0eSgiaGlkZGVuIikpKTsKCi0tIAoyLjQ3LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
