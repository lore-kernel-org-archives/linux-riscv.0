Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1DCCA0EE4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 06:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJ8kwysBYZ33QJH6dRZ3yrvG5v0RO2LwzciHgMfS36s=; b=lJl+0eQ7ObA+iD
	B0UvahgvY9MfCGabUoqtI0D1iqGdl4JeztnCq6/b3fr80t2ViYcTl9IshmX1n95dHXH9K3GaxX5L/
	jcT5ChLOtrXFEzKaYOjvgA9++heoFMYByj0j+KJjJC3SdZNEAiaPxE7vguYEiDBt1nkBWZNSjBdya
	Y65rLtKdYC7W+g9FV+hoYkkAgCpl4CAP37cOIEFfiCF206lq3VvynPAg88CL85DApvGJKIxelJfRF
	7Ltw0iNcT+FRIg49aPd1wgg6jISG5naO5je3ThxH92nTRY1m6VPKB2U/mojnuBbMwwyJ7SzFKQONi
	ioerEcDsnuHsXdXZsjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnEG-0000000AiNl-1FWZ;
	Tue, 26 Aug 2025 06:32:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0f-0000000AfA2-2rCY;
	Tue, 26 Aug 2025 06:18:24 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6H2kK7oB9XL3kf3qEPW1KLZGm1z/W4mCckKnzb/rKs=;
	b=qt50fHhkADqQAuGueYGo1TQTCS9pRKukjkJcKGMOVdY+09d6hUTKCyc1AyfhiAYF831YBL
	4q99aXnzXtByc6BFg3oxoOao3aYxAJC/4V4yv6pRmF5M82cdIFMVR2cYlHIKLsm2rpv9id
	oUjPKAO+oKu1SN3APxKQuqKX/DGssbMKCw4Xz2n4zZRJ7UN5maoM+zI/Lf0RlegSXAgyuq
	/yWxcu5VK+/r04Tbb+GtsRhZKDrv/mWRyQGwmgm3a7+vendx0i7Ty/I1Fshrv0+b0ZWwlG
	SH+n/VsvVlEtE2tm2DP+xUhGKNTJBp08j1K4fjgxsZPCn8yrdRPmmOis69Lp3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6H2kK7oB9XL3kf3qEPW1KLZGm1z/W4mCckKnzb/rKs=;
	b=4r2qNWGAXu/UOi8WftkYX57YkiorzJNR/wCQ1OowTx3aIeHRybvVVg1TQp7nZhB0xzChNO
	mlSahIjP53UFu/BQ==
Date: Tue, 26 Aug 2025 08:17:06 +0200
Subject: [PATCH 03/11] vdso: Move ENABLE_COMPAT_VDSO from core to arm64
MIME-Version: 1.0
Message-Id: <20250826-vdso-cleanups-v1-3-d9b65750e49f@linutronix.de>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
In-Reply-To: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=4201;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jRrDQXs97w6WapLhaOa7Pkm+jLScLDYfjSl6yi3XN18=;
 b=zVe/bWMXPBpBICIiM3Xs7CuOoAOqkdw7N9nfQnVMF1yQFhNpPWnyujMRcuO3pxZbGv51ey0DT
 uPROdPxZB3gDVO9rZsFSY0vOzcTTDPeOEOBO9SI9WjiLictQ4yCGkTS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231821_911867_82EEBC24 
X-CRM114-Status: GOOD (  15.33  )
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

VGhlIEVOQUJMRV9DT01BUFRfVkRTTyBzeW1ib2wgaXMgb25seSB1c2VkIGJ5IGFybTY0IGFuZCBv
bmx5IGZvciB0aGUKdGltZS1yZWxhdGVkIGZ1bmN0aW9uYWxpdHkuIFRoZXJlIHNob3VsZCBiZSBu
byBuZXcgdXNlcnMsIHNvIGl0IGRvZXNuJ3QKbmVlZCB0byBiZSBpbiB0aGUgZ2VuZXJpYyB2RFNP
IGNvZGUuCgpNb3ZlIHRoZSBsb2dpYyBpbnRvIGFybTY0IGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBj
b2RlIGFuZCByZXBsYWNlIHRoZQpleHBsaWNpdCBkZWZpbmUgYnkgdGhlIHN0YW5kYXJkICcjaWZk
ZWYgX19hYXJjaDY0X18nLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21h
cy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC9hcm02NC9pbmNsdWRlL2FzbS92
ZHNvL2NvbXBhdF9iYXJyaWVyLmggICAgICB8IDcgKysrLS0tLQogYXJjaC9hcm02NC9pbmNsdWRl
L2FzbS92ZHNvL2NvbXBhdF9nZXR0aW1lb2ZkYXkuaCB8IDYgKysrLS0tCiBhcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmggICAgICAgIHwgOCArKysrKysrKwogYXJjaC9h
cm02NC9rZXJuZWwvdmRzbzMyL01ha2VmaWxlICAgICAgICAgICAgICAgICB8IDEgLQogaW5jbHVk
ZS92ZHNvL2RhdGFwYWdlLmggICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgLS0tLQogNSBm
aWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Zkc28vY29tcGF0X2JhcnJpZXIuaCBiL2FyY2gv
YXJtNjQvaW5jbHVkZS9hc20vdmRzby9jb21wYXRfYmFycmllci5oCmluZGV4IDNhYzM1ZjRhNjY3
Y2ZjOGMwM2ZiNmI2OTEzYzVhMDJiMjMwYTE2NTkuLjZkNzVlMDNkMzgyNzRhNmI4NTQ5YWIxMGEw
ZjNjOTczMmU3ZmFlNTYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby9j
b21wYXRfYmFycmllci5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby9jb21wYXRf
YmFycmllci5oCkBAIC03LDExICs3LDEwIEBACiAKICNpZm5kZWYgX19BU1NFTUJMWV9fCiAvKgot
ICogV2FybmluZzogVGhpcyBjb2RlIGlzIG1lYW50IHRvIGJlIHVzZWQgd2l0aAotICogRU5BQkxF
X0NPTVBBVF9WRFNPIG9ubHkuCisgKiBXYXJuaW5nOiBUaGlzIGNvZGUgaXMgbWVhbnQgdG8gYmUg
dXNlZCBmcm9tIHRoZSBjb21wYXQgdkRTTyBvbmx5LgogICovCi0jaWZuZGVmIEVOQUJMRV9DT01Q
QVRfVkRTTwotI2Vycm9yIFRoaXMgaGVhZGVyIGlzIG1lYW50IHRvIGJlIHVzZWQgd2l0aCBFTkFC
TEVfQ09NUEFUX1ZEU08gb25seQorI2lmZGVmIF9fYXJjaDY0X18KKyNlcnJvciBUaGlzIGhlYWRl
ciBpcyBtZWFudCB0byBiZSB1c2VkIHdpdGggZnJvbSB0aGUgY29tcGF0IHZEU08gb25seQogI2Vu
ZGlmCiAKICNpZmRlZiBkbWIKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRz
by9jb21wYXRfZ2V0dGltZW9mZGF5LmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Zkc28vY29t
cGF0X2dldHRpbWVvZmRheS5oCmluZGV4IGQ2MGVhN2E3MmE5Y2IzNDU3YzQxMmQwZWNlMjFlZDc2
YWU3Nzc4MmQuLjdkMWExMTY1NDliMWI5OGQ2ZWI3YTc4ZDA1Mzk1OGM2YTcxNzk5ZWMgMTAwNjQ0
Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby9jb21wYXRfZ2V0dGltZW9mZGF5LmgK
KysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS92ZHNvL2NvbXBhdF9nZXR0aW1lb2ZkYXkuaApA
QCAtMiw4ICsyLDggQEAKIC8qCiAgKiBDb3B5cmlnaHQgKEMpIDIwMTggQVJNIExpbWl0ZWQKICAq
LwotI2lmbmRlZiBfX0FTTV9WRFNPX0dFVFRJTUVPRkRBWV9ICi0jZGVmaW5lIF9fQVNNX1ZEU09f
R0VUVElNRU9GREFZX0gKKyNpZm5kZWYgX19BU01fVkRTT19DT01QQVRfR0VUVElNRU9GREFZX0gK
KyNkZWZpbmUgX19BU01fVkRTT19DT01QQVRfR0VUVElNRU9GREFZX0gKIAogI2lmbmRlZiBfX0FT
U0VNQkxZX18KIApAQCAtMTYzLDQgKzE2Myw0IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB2ZHNvX2Ns
b2Nrc291cmNlX29rKGNvbnN0IHN0cnVjdCB2ZHNvX2Nsb2NrICp2YykKIAogI2VuZGlmIC8qICFf
X0FTU0VNQkxZX18gKi8KIAotI2VuZGlmIC8qIF9fQVNNX1ZEU09fR0VUVElNRU9GREFZX0ggKi8K
KyNlbmRpZiAvKiBfX0FTTV9WRFNPX0NPTVBBVF9HRVRUSU1FT0ZEQVlfSCAqLwpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oIGIvYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oCmluZGV4IGRhMWFiODc1OTU5MjVmZGZh
NzRmZDEwZDBjOTU0OGYxMDk5NzA1ODguLmM1OWU4NDEwNWI0M2NkYjBjODIzZGEzZGQ3OTNhODM3
ODFmODQzMDIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1l
b2ZkYXkuaAorKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmgK
QEAgLTUsNiArNSw4IEBACiAjaWZuZGVmIF9fQVNNX1ZEU09fR0VUVElNRU9GREFZX0gKICNkZWZp
bmUgX19BU01fVkRTT19HRVRUSU1FT0ZEQVlfSAogCisjaWZkZWYgX19hYXJjaDY0X18KKwogI2lm
bmRlZiBfX0FTU0VNQkxZX18KIAogI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPgpAQCAtOTYs
NCArOTgsMTAgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBjb25zdCBzdHJ1Y3QgdmRzb190aW1l
X2RhdGEgKl9fYXJjaF9nZXRfdmRzb191X3RpbWVfZGF0YSgKIAogI2VuZGlmIC8qICFfX0FTU0VN
QkxZX18gKi8KIAorI2Vsc2UgLyogIV9fYWFyY2g2NF9fICovCisKKyNpbmNsdWRlICJjb21wYXRf
Z2V0dGltZW9mZGF5LmgiCisKKyNlbmRpZiAvKiBfX2FhcmNoNjRfXyAqLworCiAjZW5kaWYgLyog
X19BU01fVkRTT19HRVRUSU1FT0ZEQVlfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJu
ZWwvdmRzbzMyL01ha2VmaWxlIGIvYXJjaC9hcm02NC9rZXJuZWwvdmRzbzMyL01ha2VmaWxlCmlu
ZGV4IGYyZGZkYzdkYzgxODViYzA0NTkwNzI4M2I2OGFiMThmZWQ5ODAzMTIuLjIzMGZkYzI2Nzk2
YWE1YmE1NjE1MTliY2YyZGU4Y2NkN2FkM2I5ZjggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQva2Vy
bmVsL3Zkc28zMi9NYWtlZmlsZQorKysgYi9hcmNoL2FybTY0L2tlcm5lbC92ZHNvMzIvTWFrZWZp
bGUKQEAgLTU5LDcgKzU5LDYgQEAgVkRTT19DQUZMQUdTICs9IC1ERElTQUJMRV9CUkFOQ0hfUFJP
RklMSU5HCiBWRFNPX0NBRkxBR1MgKz0gLW1hcmNoPWFybXY4LWEKIAogVkRTT19DRkxBR1MgOj0g
JChWRFNPX0NBRkxBR1MpCi1WRFNPX0NGTEFHUyArPSAtREVOQUJMRV9DT01QQVRfVkRTTz0xCiAj
IEtCVUlMRF9DRkxBR1MgZnJvbSB0b3AtbGV2ZWwgTWFrZWZpbGUKIFZEU09fQ0ZMQUdTICs9IC1X
YWxsIC1XdW5kZWYgLVdzdHJpY3QtcHJvdG90eXBlcyAtV25vLXRyaWdyYXBocyBcCiAgICAgICAg
ICAgICAgICAtZm5vLXN0cmljdC1hbGlhc2luZyAtZm5vLWNvbW1vbiBcCmRpZmYgLS1naXQgYS9p
bmNsdWRlL3Zkc28vZGF0YXBhZ2UuaCBiL2luY2x1ZGUvdmRzby9kYXRhcGFnZS5oCmluZGV4IDAy
NTMzMDM4NjQwZTUzYzQwMjkxYzdlMDkxMzllMGY5YjMyZjUwMmEuLjBiMTk4MmYxNWRlNDI3NzIz
YzlmZjg1MDJjYTFlYWExOTVmOWE2YTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdmRzby9kYXRhcGFn
ZS5oCisrKyBiL2luY2x1ZGUvdmRzby9kYXRhcGFnZS5oCkBAIC0xOTYsMTEgKzE5Niw3IEBAIGVu
dW0gdmRzb19wYWdlcyB7CiAgKiAtIGNsb2NrX2dldHRpbWVfZmFsbGJhY2soKTogZmFsbGJhY2sg
Zm9yIGNsb2NrX2dldHRpbWUuCiAgKiAtIGNsb2NrX2dldHJlc19mYWxsYmFjaygpOiBmYWxsYmFj
ayBmb3IgY2xvY2tfZ2V0cmVzLgogICovCi0jaWZkZWYgRU5BQkxFX0NPTVBBVF9WRFNPCi0jaW5j
bHVkZSA8YXNtL3Zkc28vY29tcGF0X2dldHRpbWVvZmRheS5oPgotI2Vsc2UKICNpbmNsdWRlIDxh
c20vdmRzby9nZXR0aW1lb2ZkYXkuaD4KLSNlbmRpZiAvKiBFTkFCTEVfQ09NUEFUX1ZEU08gKi8K
IAogI2Vsc2UgLyogIV9fQVNTRU1CTFlfXyAqLwogCgotLSAKMi41MC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
