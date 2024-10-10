Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF832CFC5E2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWfuRy6BpDIQOoXmunjXe6wqaWl9XvPeTPEYFoiRaZQ=; b=FmAgneVx6Oj5uv
	kX5wTRQWkFytw/IE4sFuq23NAbBHpDdH9IzWiR3jbgKcxIJTwuyoTIcxQm8LLaa2SjQHLDFCSluIt
	V6eeoU2CaKp+0jCyr9q9o1+exp1nGd5ZDYYwXVSfmr3zCTNyOah2xjlkNd3UONeNX7cT/t+1l82Hw
	jhKBhQp5xDEKM3Omq3gpegaqSZC2u0/Th8ZBsaOU9J+H+4SHYatGtmwiEmhY/Fws9tryIk44hM31E
	LxFWKDfcRfgUeCP8fjqnro2iai6hyFVuWLztA3LP6b40EoWzmetal54+YQpRvbZW1/nFCR9/m7T19
	jgv03XSrl+0398bU5fcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sywm4-0000000DdxS-2k9R;
	Thu, 10 Oct 2024 17:16:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLZ-0000000DOcI-0Kpz;
	Thu, 10 Oct 2024 15:45:24 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CaseVhBtdpQtjTcTpmIfibKjxpzap/T9WUWXl9xwak=;
	b=pMtaSsQ8UrCsbp0jWIphuw/8nDX6xrSAMhkuRxGYx7ednp2ZohFYZNLSwmRC6nGSe96v2R
	myIxY30VOOL+YKTv4KEKjTFAQTFXZxKDzvwO0vdUUx1QOQbBpCECJmfsfCyqDvsc5ltoSf
	sxlDi8TJSOv1F5Xd+LjfoHO7JYjK2etzhLqqeqj4MV6ncu885QuT2gk989A8np/TdqjLeJ
	sAi5Fuo7FllnsTpDwTgpwZDaBvRpi59Lio6+uH2rkZaGgKPjDroa4CVten3bk1oOk52Hzw
	23NiNwtZgS+25/KXZ/e4rP7stFRyMr/IejAb2q1gfs4+vnoDCdiO/hPnPzLaFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CaseVhBtdpQtjTcTpmIfibKjxpzap/T9WUWXl9xwak=;
	b=aF5YLex66+lKNdsdoeGgHL1V07NVdOH+rxgXzLe0/EuBdxw2xWHmfdy3blPVHY68rEImru
	Q6CrxNOILwfKytBg==
Date: Thu, 10 Oct 2024 17:44:49 +0200
Subject: [PATCH 6/9] s390/vdso: Remove timekeeper includes
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-6-7fe5a3ea4382@linutronix.de>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1648;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Yn7KlHbEU0MJ+dl8y9vpCiJdVRBNRAPzXohBNMI7g0A=;
 b=U2qMs1WEZtI+3Gz7n0ZlWNu0+kuRgmXI0J5su635wqTf1yCSL0UPUdTMPKc+UQDEA1H6FwQAV
 QZnsg/j8477BGlLQZ+LPIOF96Iz9MwCJvbWAUGHv/zuGibQhhFvb0Mo
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_084501_357425_46FFC84F 
X-CRM114-Status: UNSURE (   9.65  )
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

U2luY2UgdGhlIGdlbmVyaWMgVkRTTyBjbG9jayBtb2RlIHN0b3JhZ2UgaXMgdXNlZCwgdGhpcyBo
ZWFkZXIgZmlsZSBpcwp1bnVzZWQgYW5kIGNhbiBiZSByZW1vdmVkLgoKVGhpcyBhdm9pZHMgaW5j
bHVkaW5nIGEgbm9uLVZEU08gaGVhZGVyIHdoaWxlIGJ1aWxkaW5nIHRoZSBWRFNPLAp3aGljaCBj
YW4gbGVhZCB0byBjb21waWxhdGlvbiBlcnJvcnMuCgpBbHNvIGRyb3AgdGhlIGNvbW1lbnQgd2hp
Y2ggaXMgb3V0IG9mIGRhdGUgYW5kIGluIHRoZSB3cm9uZyBwbGFjZS4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0K
IGFyY2gvczM5MC9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggfCA1IC0tLS0tCiBhcmNoL3Mz
OTAva2VybmVsL3RpbWUuYyAgICAgICAgICAgICAgIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDYg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3Zkc28vdnN5
c2NhbGwuaCBiL2FyY2gvczM5MC9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKaW5kZXggM2M1
ZDVlNDc4MTRlMTZkY2ZjMjBmOTkwMTQ4MTEyNzI0NmU4ZjM0OC4uM2ViNTc2ZWNkM2JkOTk4ZGFm
OTM3MmE1MmJlZmE4Yjc2ZDUyZjJiZiAxMDA2NDQKLS0tIGEvYXJjaC9zMzkwL2luY2x1ZGUvYXNt
L3Zkc28vdnN5c2NhbGwuaAorKysgYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vdmRzby92c3lzY2Fs
bC5oCkBAIC03LDcgKzcsNiBAQAogI2lmbmRlZiBfX0FTU0VNQkxZX18KIAogI2luY2x1ZGUgPGxp
bnV4L2hydGltZXIuaD4KLSNpbmNsdWRlIDxsaW51eC90aW1la2VlcGVyX2ludGVybmFsLmg+CiAj
aW5jbHVkZSA8dmRzby9kYXRhcGFnZS5oPgogI2luY2x1ZGUgPGFzbS92ZHNvLmg+CiAKQEAgLTE3
LDEwICsxNiw2IEBAIGVudW0gdnZhcl9wYWdlcyB7CiAJVlZBUl9OUl9QQUdFUwogfTsKIAotLyoK
LSAqIFVwZGF0ZSB0aGUgdkRTTyBkYXRhIHBhZ2UgdG8ga2VlcCBpbiBzeW5jIHdpdGgga2VybmVs
IHRpbWVrZWVwaW5nLgotICovCi0KIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgc3RydWN0IHZkc29f
ZGF0YSAqX19zMzkwX2dldF9rX3Zkc29fZGF0YSh2b2lkKQogewogCXJldHVybiB2ZHNvX2RhdGE7
CmRpZmYgLS1naXQgYS9hcmNoL3MzOTAva2VybmVsL3RpbWUuYyBiL2FyY2gvczM5MC9rZXJuZWwv
dGltZS5jCmluZGV4IGI3MTNlZmZlMDU3OTY3NjIzZjY0ZGE4Mjk3MzE0ZmNjNDJmZjFhZjIuLjRm
YWU2YzcwMTc4NDc0NjUxOWJhYjBiMjk1NDI5MDgyNTI5ZTQ1MDEgMTAwNjQ0Ci0tLSBhL2FyY2gv
czM5MC9rZXJuZWwvdGltZS5jCisrKyBiL2FyY2gvczM5MC9rZXJuZWwvdGltZS5jCkBAIC0zNiw3
ICszNiw2IEBACiAjaW5jbHVkZSA8bGludXgvcHJvZmlsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Rp
bWV4Lmg+CiAjaW5jbHVkZSA8bGludXgvbm90aWZpZXIuaD4KLSNpbmNsdWRlIDxsaW51eC90aW1l
a2VlcGVyX2ludGVybmFsLmg+CiAjaW5jbHVkZSA8bGludXgvY2xvY2tjaGlwcy5oPgogI2luY2x1
ZGUgPGxpbnV4L2dmcC5oPgogI2luY2x1ZGUgPGxpbnV4L2twcm9iZXMuaD4KCi0tIAoyLjQ3LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
