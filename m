Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD11FC44515
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 06:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qN+2U6RC2Ns1NayFid07O3jyQraHVxJR+jZ4nfGYIkk=; b=BraKnQkN+u4e3H
	2G2fSgmyFdx3LXF3ITfKQ6DFE3Wbj28kQnZAC8uwRKKRKad3l/bQ7VCqtdHj85JitMSuvjZ6Wk4Gg
	VHooM9S4/7NIJLyn7avXZeh0QwFsO4k8Rr6G7pvxfOkvw+14zhkte86mTDQf/lKgU6oKXG8+78SdT
	VkqZW2K2sYZRSXKGOYAUerZaJaMBbSISohnwgcWk7XTZQrFwShEA/5rcczqcUbCDoh5p8i+uHSV1P
	uB/ThdhPfIlgjiVvDRmr7M9IptbhiQkEY197/1zW4YcNVxhai9/6rc1vbQxIxCOMAG9AF437S0MlR
	uPV907QhtpK09bfJpZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbr9-00000001E3l-45TX;
	Fri, 17 Jul 2026 06:15:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbqx-00000001Dtq-19i9;
	Fri, 17 Jul 2026 06:15:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784268900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=itu6k/7LjVC4xl50fE8uK9psTIOXzEDbu436igm+MQo=;
	b=17HRzV4Z0zlFiD4PG/2rWK1+7U7sk2iNELCWctH6MBXHjK2ETGdyaAoYCDTGJ3LrDrFvro
	wV16qiQ5nojRN3PcU8BRBo/4Br54fUZ+uvByQqQAJ3ATnWj3jVFIJ9r4Z9Cd2K9jROAzwx
	3TTkDkfSXLIEH6BVBrclGo4ilXSE4QvO+qxZN+v3HIvPor3fkAOn3a+rkl+hmOpBbWYwYh
	p+kUVZGCOmDqaWfGERQjDQtWA3sxAGzIt1+9W+K2/dFTvoYpJmLOst3y/V2JqvsbKqDyr+
	3sqSY3sRea6JwKgYKvyAtqIccNkdKLHRN2TlVLioucRWRYCNPGOLvpeYIVpMzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784268900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=itu6k/7LjVC4xl50fE8uK9psTIOXzEDbu436igm+MQo=;
	b=3yRzgF+EmD5sj4Dx06hxldC/keHbN8d+rP0Sdm3QquL3zoaK85M7hsoDRJT/bWsR6NOyHZ
	5RmG/Bme8ZCvrUDw==
Date: Fri, 17 Jul 2026 08:14:46 +0200
Subject: [PATCH v2 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
MIME-Version: 1.0
Message-Id: <20260717-vdso-arch-clockmodes-v2-2-756f5a5d1467@linutronix.de>
References: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
In-Reply-To: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784268894; l=1814;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=p9rZWKtD6/YfP8onrdLafhoNLyPoeTcrsrG5G4dPJoE=;
 b=udpLwy9jwLglOQZMDRkLQ+0ay9CxwhEU9AUOW0opBLf8VjiBjnYIcthAPCsMXPCGNmjqmBrF1
 Wc3RBEpM/TLAmmUd4/wBA4QiNO/5mDrOoBQ10HU1Y7P+0ELeuNkD+6b
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_231519_493677_70675FB5 
X-CRM114-Status: GOOD (  11.20  )
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

U29tZSBjb2RlLCBmb3IgZXhhbXBsZSBjbG9ja3NvdXJjZSBkcml2ZXJzLCBtYXkgd2FudCB0byB1
c2UgdGhlIHZEU08KY2xvY2ttb2RlIGNvbnN0YW50cyBldmVuIHdoZW4gQ09ORklHX0dFTkVSSUNf
R0VUVElNRU9GREFZPW4uCkJ1dCB0aGUgc3ltYm9scyBhcmUgY29tcGxldGVseSBoaWRkZW4gaW4g
dGhhdCBjYXNlLCBtYWtpbmcgdWdseQppZmRlZmZlcnkgbmVjZXNzYXJ5LgoKUHJvdmlkZSB1bmxp
bmthYmxlIGR1bW15IGRlZmluaXRpb25zLiBUaGVzZSBjYW4gYmUgdXNlZCB3aXRoCklTX0VOQUJM
RUQoQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZKS4KCkFzIG5vdCBhbGwgYXJjaGl0ZWN0dXJl
cyBwcm92aWRlIGFzbS92ZHNvL2Nsb2Nrc291cmNlLmgsCnByb3ZpZGUgYW4gZW1wdHkgc3R1YiBp
biBhc20tZ2VuZXJpYyBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBpbmNsdWRlL2FzbS1nZW5lcmlj
L0tidWlsZCAgICAgICAgICAgICB8IDEgKwogaW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNvL2Nsb2Nr
c291cmNlLmggfCAwCiBpbmNsdWRlL3Zkc28vY2xvY2tzb3VyY2UuaCAgICAgICAgICAgICB8IDQg
Ky0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVpbGQgYi9pbmNsdWRlL2FzbS1nZW5l
cmljL0tidWlsZAppbmRleCAxNWRmOWRjYjQyYTUuLjJiYzAwYzY3ZGM1NCAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVpbGQKKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVp
bGQKQEAgLTYyLDYgKzYyLDcgQEAgbWFuZGF0b3J5LXkgKz0gdG9wb2xvZ3kuaAogbWFuZGF0b3J5
LXkgKz0gdHJhY2VfY2xvY2suaAogbWFuZGF0b3J5LXkgKz0gdWFjY2Vzcy5oCiBtYW5kYXRvcnkt
eSArPSB1bndpbmRfdXNlci5oCittYW5kYXRvcnkteSArPSB2ZHNvL2Nsb2Nrc291cmNlLmgKIG1h
bmRhdG9yeS15ICs9IHZlcm1hZ2ljLmgKIG1hbmRhdG9yeS15ICs9IHZnYS5oCiBtYW5kYXRvcnkt
eSArPSB2aWRlby5oCmRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL3Zkc28vY2xvY2tz
b3VyY2UuaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby9jbG9ja3NvdXJjZS5oCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZTY5ZGUyOWJiMmQxCmRpZmYgLS1naXQg
YS9pbmNsdWRlL3Zkc28vY2xvY2tzb3VyY2UuaCBiL2luY2x1ZGUvdmRzby9jbG9ja3NvdXJjZS5o
CmluZGV4IGM2ODJlN2M2MDI3My4uYmNlODFjMDJhN2M2IDEwMDY0NAotLS0gYS9pbmNsdWRlL3Zk
c28vY2xvY2tzb3VyY2UuaAorKysgYi9pbmNsdWRlL3Zkc28vY2xvY2tzb3VyY2UuaApAQCAtNCwx
MyArNCwxMSBAQAogCiAjaW5jbHVkZSA8dmRzby9saW1pdHMuaD4KIAotI2lmZGVmIENPTkZJR19H
RU5FUklDX0dFVFRJTUVPRkRBWQogI2luY2x1ZGUgPGFzbS92ZHNvL2Nsb2Nrc291cmNlLmg+Ci0j
ZW5kaWYgLyogQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZICovCiAKIGVudW0gdmRzb19jbG9j
a19tb2RlIHsKIAlWRFNPX0NMT0NLTU9ERV9OT05FLAotI2lmZGVmIENPTkZJR19HRU5FUklDX0dF
VFRJTUVPRkRBWQorI2lmZGVmIFZEU09fQVJDSF9DTE9DS01PREVTCiAJVkRTT19BUkNIX0NMT0NL
TU9ERVMsCiAjZW5kaWYKIAlWRFNPX0NMT0NLTU9ERV9NQVgsCgotLSAKMi41NS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
