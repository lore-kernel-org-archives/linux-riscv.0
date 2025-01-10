Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1AEE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKl3DhQmQa5hldobu3W0bZWFG2pizi3OuWZRVQz0XEA=; b=iCmc0Fx0cbLO91
	l8Fk4M9qikvaa0epZlfzZcAdPY/vhJ8yWRxsXJR98XRa0b6jh3Tlbu6AV+i1fQMhDMXmjf2qbxE56
	ML234xEA3nBCOjoYmmaBXyMqwnVlTKgb0p0wRlvW4rV8ZycouA2dLduLe8gndX6Ef+cJ2/U0hh4PP
	WOciTgrGJ+6bzBPxgXYyPgnHX3kxTIRx/fsQirot8uffh4ccZB/SpYDFPrRhOXXn7F96OT6XRv/w1
	NDoAiy+aawj6bsNVGmNzQ09g4nA6QUrifjHkvbLoow1ZjcDtOKblszT7F6FPYjnrWDv1WGiEhTaYL
	rI5Kei0wqZce8NIZS3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWH4y-0000000FzCw-3LDC;
	Fri, 10 Jan 2025 15:37:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGrg-0000000FtjY-14Dw;
	Fri, 10 Jan 2025 15:24:01 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736522635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hF0doQ8ABpgn/aNZsNNVwp/0/3UT02lIHINaA5tvUM=;
	b=4QuV6WLv+qM0NFq/bU50gvu9jHJbGQqi8ZhB1pWOJo78K7X8EMY2cqzf+A0eJ3euP6AoM0
	3ZgoB397PR5qBYy4Ji2YF5V5UlQDbEFyfk4u8GXDBtnxZE2qjnL+2jmv4vuaIsaezwXOSZ
	hwdc3Iqa+1S91NJqKlHixWQY9bBHOG+dGCoc8F1rFRxxvjDF5+usOvgWMbZs+TZP/R8CjB
	c5zeenPso/iK5Muu0FVxXZzMwgvBPwh6VwzXRiz9M+2AobY70sdWEN9azGRgZEoT3kGFN5
	GE1kIR8fbyssrgwer81DVIhdrwGGYCCC0p5dNAeLcv8MU05MrLi78ZR4Qu9StA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736522635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hF0doQ8ABpgn/aNZsNNVwp/0/3UT02lIHINaA5tvUM=;
	b=6C/eB/zjdtEzQvYPxdxc0wgWqNTengxBY22KHhSipUPGZt0oE+VYTtMiCbpmEs2qO3htJ6
	bAtCMpTjfRigOvCQ==
Date: Fri, 10 Jan 2025 16:23:46 +0100
Subject: [PATCH v2 07/18] vdso: Add generic architecture-specific data
 storage
MIME-Version: 1.0
Message-Id: <20250110-vdso-store-rng-v2-7-350c9179bbf1@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736522629; l=4823;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2OGLOTIn3mrK94nEr9eCVL0nPgn4S3w/pFtDFpXzfrI=;
 b=BWqHXYbHF2N14HCyKEALbacHP4B4k0Olfuqv1Ny6/4qxq5QHetPRa9vRN0DxHlVRIYSAWu+an
 Ie7iC4RpCs5CHpDT8JL7bXGs/W4j5ZDMEXMmBF0IlVo9oyq1D256JK5
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_072400_579427_D0346C80 
X-CRM114-Status: GOOD (  15.36  )
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

U29tZSBhcmNoaXRlY3R1cmVzIG5lZWQgdG8gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGRhdGEgdG8g
dGhlIHZEU08uCkVuYWJsZSB0aGUgZ2VuZXJpYyB2RFNPIHN0b3JhZ2UgbWVjaGFuaXNtIHRvIGJv
dGggc3RvcmUgYW5kIG1hcCB0aGlzCmRhdGEuIFNvbWUgYXJjaGl0ZWN0dXJlcyByZXF1aXJlIG1v
cmUgdGhhbiBhIHNpbmdsZSBwYWdlLCBsaWtlCkxvb25nQXJjaCwgc28gcHJlcGFyZSBmb3IgdGhh
dCB1c2VjYXNlLCB0b28uCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFz
LndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL0tjb25maWcgICAgICAgICAgICB8
ICA0ICsrKysKIGluY2x1ZGUvdmRzby9kYXRhcGFnZS5oIHwgMjUgKysrKysrKysrKysrKysrKysr
KysrKysrKwogbGliL3Zkc28vZGF0YXN0b3JlLmMgICAgfCAxNCArKysrKysrKysrKysrKwogMyBm
aWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9LY29uZmln
IGIvYXJjaC9LY29uZmlnCmluZGV4IDY2ODJiMmE1M2UzNDJjYmFjYzA1YjcwZWY5OWNiMWM0N2Vm
ZTU1ZTguLjQ4ZjM3ZTZjMDA2NzRmNDMzYTBkNmU2ZTA1Y2U3MmMyN2NmMDAwYjcgMTAwNjQ0Ci0t
LSBhL2FyY2gvS2NvbmZpZworKysgYi9hcmNoL0tjb25maWcKQEAgLTE1NzYsNiArMTU3NiwxMCBA
QCBjb25maWcgSEFWRV9TUEFSU0VfU1lTQ0FMTF9OUgogCSAgZW50cmllcyBhdCA0MDAwLCA1MDAw
IGFuZCA2MDAwIGxvY2F0aW9ucy4gVGhpcyBvcHRpb24gdHVybnMgb24gc3lzY2FsbAogCSAgcmVs
YXRlZCBvcHRpbWl6YXRpb25zIGZvciBhIGdpdmVuIGFyY2hpdGVjdHVyZS4KIAorY29uZmlnIEFS
Q0hfSEFTX1ZEU09fQVJDSF9EQVRBCisJZGVwZW5kcyBvbiBHRU5FUklDX1ZEU09fREFUQV9TVE9S
RQorCWJvb2wKKwogY29uZmlnIEFSQ0hfSEFTX1ZEU09fVElNRV9EQVRBCiAJYm9vbAogCmRpZmYg
LS1naXQgYS9pbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaCBiL2luY2x1ZGUvdmRzby9kYXRhcGFnZS5o
CmluZGV4IDdkYmM4Nzk3ZTNiODkyM2MwNmY0YjZiMzQ3OTA3NjZlNjhiMmFiZDIuLjQ2NjU4YjM5
YzI4MjUwZTk3N2Y1YTM0NTQyMjRjM2VkMGZiNGM4MWQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdmRz
by9kYXRhcGFnZS5oCisrKyBiL2luY2x1ZGUvdmRzby9kYXRhcGFnZS5oCkBAIC05LDExICs5LDEz
IEBACiAjaW5jbHVkZSA8dWFwaS9saW51eC90eXBlcy5oPgogI2luY2x1ZGUgPHVhcGkvYXNtLWdl
bmVyaWMvZXJybm8tYmFzZS5oPgogCisjaW5jbHVkZSA8dmRzby9hbGlnbi5oPgogI2luY2x1ZGUg
PHZkc28vYml0cy5oPgogI2luY2x1ZGUgPHZkc28vY2xvY2tzb3VyY2UuaD4KICNpbmNsdWRlIDx2
ZHNvL2t0aW1lLmg+CiAjaW5jbHVkZSA8dmRzby9saW1pdHMuaD4KICNpbmNsdWRlIDx2ZHNvL21h
dGg2NC5oPgorI2luY2x1ZGUgPHZkc28vcGFnZS5oPgogI2luY2x1ZGUgPHZkc28vcHJvY2Vzc29y
Lmg+CiAjaW5jbHVkZSA8dmRzby90aW1lLmg+CiAjaW5jbHVkZSA8dmRzby90aW1lMzIuaD4KQEAg
LTI1LDYgKzI3LDE1IEBACiBzdHJ1Y3QgYXJjaF92ZHNvX3RpbWVfZGF0YSB7fTsKICNlbmRpZgog
CisjaWYgZGVmaW5lZChDT05GSUdfQVJDSF9IQVNfVkRTT19BUkNIX0RBVEEpCisjaW5jbHVkZSA8
YXNtL3Zkc28vYXJjaF9kYXRhLmg+CisjZWxpZiBkZWZpbmVkKENPTkZJR19HRU5FUklDX1ZEU09f
REFUQV9TVE9SRSkKK3N0cnVjdCB2ZHNvX2FyY2hfZGF0YSB7CisJLyogTmVlZGVkIGZvciB0aGUg
Z2VuZXJpYyBjb2RlLCBuZXZlciBhY3R1YWxseSB1c2VkIGF0IHJ1bnRpbWUgKi8KKwljaGFyIF9f
dW51c2VkOworfTsKKyNlbmRpZgorCiAjZGVmaW5lIFZEU09fQkFTRVMJKENMT0NLX1RBSSArIDEp
CiAjZGVmaW5lIFZEU09fSFJFUwkoQklUKENMT0NLX1JFQUxUSU1FKQkJfCBcCiAJCQkgQklUKENM
T0NLX01PTk9UT05JQykJCXwgXApAQCAtMTQ1LDkgKzE1NiwxMSBAQCBleHRlcm4gc3RydWN0IHZk
c29fcm5nX2RhdGEgX3Zkc29fcm5nX2RhdGEgX19hdHRyaWJ1dGVfXygodmlzaWJpbGl0eSgiaGlk
ZGVuIikpKQogI2Vsc2UKIGV4dGVybiBzdHJ1Y3QgdmRzb190aW1lX2RhdGEgdmRzb191X3RpbWVf
ZGF0YVtDU19CQVNFU10gX19hdHRyaWJ1dGVfXygodmlzaWJpbGl0eSgiaGlkZGVuIikpKTsKIGV4
dGVybiBzdHJ1Y3QgdmRzb19ybmdfZGF0YSB2ZHNvX3Vfcm5nX2RhdGEgX19hdHRyaWJ1dGVfXygo
dmlzaWJpbGl0eSgiaGlkZGVuIikpKTsKK2V4dGVybiBzdHJ1Y3QgdmRzb19hcmNoX2RhdGEgdmRz
b191X2FyY2hfZGF0YSBfX2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5KCJoaWRkZW4iKSkpOwogCiBl
eHRlcm4gc3RydWN0IHZkc29fdGltZV9kYXRhICp2ZHNvX2tfdGltZV9kYXRhOwogZXh0ZXJuIHN0
cnVjdCB2ZHNvX3JuZ19kYXRhICp2ZHNvX2tfcm5nX2RhdGE7CitleHRlcm4gc3RydWN0IHZkc29f
YXJjaF9kYXRhICp2ZHNvX2tfYXJjaF9kYXRhOwogI2VuZGlmCiAKIC8qKgpAQCAtMTYwLDEwICsx
NzMsMTUgQEAgdW5pb24gdmRzb19kYXRhX3N0b3JlIHsKIAogI2lmZGVmIENPTkZJR19HRU5FUklD
X1ZEU09fREFUQV9TVE9SRQogCisjZGVmaW5lIFZEU09fQVJDSF9EQVRBX1NJWkUgQUxJR04oc2l6
ZW9mKHN0cnVjdCB2ZHNvX2FyY2hfZGF0YSksIFBBR0VfU0laRSkKKyNkZWZpbmUgVkRTT19BUkNI
X0RBVEFfUEFHRVMgKFZEU09fQVJDSF9EQVRBX1NJWkUgPj4gUEFHRV9TSElGVCkKKwogZW51bSB2
ZHNvX3BhZ2VzIHsKIAlWRFNPX1RJTUVfUEFHRV9PRkZTRVQsCiAJVkRTT19USU1FTlNfUEFHRV9P
RkZTRVQsCiAJVkRTT19STkdfUEFHRV9PRkZTRVQsCisJVkRTT19BUkNIX1BBR0VTX1NUQVJULAor
CVZEU09fQVJDSF9QQUdFU19FTkQgPSBWRFNPX0FSQ0hfUEFHRVNfU1RBUlQgKyBWRFNPX0FSQ0hf
REFUQV9QQUdFUyAtIDEsCiAJVkRTT19OUl9QQUdFUwogfTsKIApAQCAtMTkzLDEwICsyMTEsMTcg
QEAgZW51bSB2ZHNvX3BhZ2VzIHsKICNkZWZpbmUgX192ZHNvX3Vfcm5nX2RhdGEKICNlbmRpZgog
CisjaWZkZWYgQ09ORklHX0FSQ0hfSEFTX1ZEU09fQVJDSF9EQVRBCisjZGVmaW5lIF9fdmRzb191
X2FyY2hfZGF0YQlQUk9WSURFKHZkc29fdV9hcmNoX2RhdGEgPSB2ZHNvX3VfZGF0YSArIDMgKiBQ
QUdFX1NJWkUpOworI2Vsc2UKKyNkZWZpbmUgX192ZHNvX3VfYXJjaF9kYXRhCisjZW5kaWYKKwog
I2RlZmluZSBWRFNPX1ZWQVJfU1lNUwkJCQkJCVwKIAlQUk9WSURFKHZkc29fdV9kYXRhID0gLiAt
IF9fVkRTT19QQUdFUyAqIFBBR0VfU0laRSk7CVwKIAlQUk9WSURFKHZkc29fdV90aW1lX2RhdGEg
PSB2ZHNvX3VfZGF0YSk7CQlcCiAJX192ZHNvX3Vfcm5nX2RhdGEJCQkJCVwKKwlfX3Zkc29fdV9h
cmNoX2RhdGEJCQkJCVwKIAogCiAjZW5kaWYgLyogIV9fQVNTRU1CTFlfXyAqLwpkaWZmIC0tZ2l0
IGEvbGliL3Zkc28vZGF0YXN0b3JlLmMgYi9saWIvdmRzby9kYXRhc3RvcmUuYwppbmRleCA5MjYw
YjAwZGM4NTIwYWYxMDliZDlkZDA1YWM3Zjc1MDRlYWZiZWEwLi4wOTU5ZDYyZDc4NTg2ZWY0NThl
YjVmN2MxZTE1MmY2YjVkNGNiZjg1IDEwMDY0NAotLS0gYS9saWIvdmRzby9kYXRhc3RvcmUuYwor
KysgYi9saWIvdmRzby9kYXRhc3RvcmUuYwpAQCAtMjYsNiArMjYsMTQgQEAgc3RydWN0IHZkc29f
cm5nX2RhdGEgKnZkc29fa19ybmdfZGF0YSA9ICZ2ZHNvX3JuZ19kYXRhX3N0b3JlLmRhdGE7CiBz
dGF0aWNfYXNzZXJ0KHNpemVvZih2ZHNvX3JuZ19kYXRhX3N0b3JlKSA9PSBQQUdFX1NJWkUpOwog
I2VuZGlmIC8qIENPTkZJR19WRFNPX0dFVFJBTkRPTSAqLwogCisjaWZkZWYgQ09ORklHX0FSQ0hf
SEFTX1ZEU09fQVJDSF9EQVRBCitzdGF0aWMgdW5pb24geworCXN0cnVjdCB2ZHNvX2FyY2hfZGF0
YQlkYXRhOworCXU4CQkJcGFnZVtWRFNPX0FSQ0hfREFUQV9TSVpFXTsKK30gdmRzb19hcmNoX2Rh
dGFfc3RvcmUgX19wYWdlX2FsaWduZWRfZGF0YTsKK3N0cnVjdCB2ZHNvX2FyY2hfZGF0YSAqdmRz
b19rX2FyY2hfZGF0YSA9ICZ2ZHNvX2FyY2hfZGF0YV9zdG9yZS5kYXRhOworI2VuZGlmIC8qIENP
TkZJR19BUkNIX0hBU19WRFNPX0FSQ0hfREFUQSAqLworCiBzdGF0aWMgdm1fZmF1bHRfdCB2dmFy
X2ZhdWx0KGNvbnN0IHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgKnNtLAogCQkJICAgICBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiB7CkBAIC02Nyw2
ICs3NSwxMiBAQCBzdGF0aWMgdm1fZmF1bHRfdCB2dmFyX2ZhdWx0KGNvbnN0IHN0cnVjdCB2bV9z
cGVjaWFsX21hcHBpbmcgKnNtLAogCQkJcmV0dXJuIFZNX0ZBVUxUX1NJR0JVUzsKIAkJcGZuID0g
X19waHlzX3RvX3BmbihfX3BhX3N5bWJvbCh2ZHNvX2tfcm5nX2RhdGEpKTsKIAkJYnJlYWs7CisJ
Y2FzZSBWRFNPX0FSQ0hfUEFHRVNfU1RBUlQgLi4uIFZEU09fQVJDSF9QQUdFU19FTkQ6CisJCWlm
ICghSVNfRU5BQkxFRChDT05GSUdfQVJDSF9IQVNfVkRTT19BUkNIX0RBVEEpKQorCQkJcmV0dXJu
IFZNX0ZBVUxUX1NJR0JVUzsKKwkJcGZuID0gX19waHlzX3RvX3BmbihfX3BhX3N5bWJvbCh2ZHNv
X2tfYXJjaF9kYXRhKSkgKworCQkJdm1mLT5wZ29mZiAtIFZEU09fQVJDSF9QQUdFU19TVEFSVDsK
KwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJcmV0dXJuIFZNX0ZBVUxUX1NJR0JVUzsKIAl9CgotLSAK
Mi40Ny4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
