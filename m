Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73B7C02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 12:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNIEE2whjff4EH+7COmA3HecQIbGI6T2gxM9Rj6VhDI=; b=3C+b+MBsTecSMy
	MrUi5e+5LDhOXzu8uQhAtdu+4ECaO0ky7ruQ4iOIrTFpqr2+2vEdFQiEGOFFDiiYCrd4UDNB6ygMm
	k9ir/xCtC9BSKIqddS3M+SY0zY1dfe6B6+2fUO8SSeeiIyQ4E43FTvAfK1kd07AGys2GP6nw97wlg
	qhxaNruvKznX99wFvtOPsjJ/SUmvnX34pk/xq6yRAJWLyBKl0dtmRTUZKqdA5ysY6BPyKKJi1aP9R
	d7wv0NCoIMMxaTVmgYAFJq48y8BPIr8BdYWRtWffh8yNyvFejN6IWpm2R72rV9oh2M8XkPpE/nQu7
	x0ijmk6GCsKWv+izqWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHt5-00000000Owf-1460;
	Tue, 04 Feb 2025 12:18:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHgz-00000000LLp-3YDk;
	Tue, 04 Feb 2025 12:06:16 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JAOVW8H/jmZUurJoSsBqrn657OqlOYnQawrkcGFYNtg=;
	b=oEXuPSFJw3vOyfHksK8gvKbLrFFkz0qxmosTiczrxSReVtw/8Ch595sZtd44xx2JO9t/e6
	HIgrZyL10KywpVcEq5/M7tlolFDd3E/UBCv2USw56HpQP9iQuPRJPc5cgMmRcecQPAWUgU
	BfNGUOwJxXyKERem6dKoQSgxYlWE5pF+AdZuEFLEIawoURCs/ls98rDZE3JSP828TH6Kbv
	LzzqiR/Fu2Wo/uifYNdGYju1bziKAy6XnLpBi+I9QBPRDLqlnhF7T1fc3T3b+vRwZxk+L6
	zZk8QFrgh72taIf2qRAvrIDKsQWI4B/eg+pDubW5ET5z5JUZXmAvpQpNcr4DyQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JAOVW8H/jmZUurJoSsBqrn657OqlOYnQawrkcGFYNtg=;
	b=JWZ2VRs+cdR71gOVuHVaODZFDW60BiYqFTQqa41rwfR9c+wkqnBvPnlxsY3xKO44U64EDJ
	Y8GIGe1DjznazdBQ==
Date: Tue, 04 Feb 2025 13:05:39 +0100
Subject: [PATCH v3 07/18] vdso: Add generic architecture-specific data
 storage
MIME-Version: 1.0
Message-Id: <20250204-vdso-store-rng-v3-7-13a4669dfc8c@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=4823;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hqYzcPXwdjmayHj4U7VVt9y+emzZQxkmpVtEmg40Qdg=;
 b=eT418J3Cm/UT46u3wK7qwnCsDxT/tmxu49usXJsjpoj8C3SYD1MzSQXHqYZhez8ul/Cc3g2m6
 Bz3DxyokUDfAL/pz7NPVpBrIIDX51xI7KrQDJQFryKy2sECT03IsTYB
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_040614_214572_BE558AF8 
X-CRM114-Status: GOOD (  15.22  )
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
IGIvYXJjaC9LY29uZmlnCmluZGV4IGI4YTRmZjM2NTU4MjI4MjQwMDgwYTU2NzdmNzAyZDM3ZjRm
OGQ1NDcuLjlmNmViMDllZjEyZDc2ZTc1NWMwZmQyZGY3MWJhNzAzYzI1MTA1MmYgMTAwNjQ0Ci0t
LSBhL2FyY2gvS2NvbmZpZworKysgYi9hcmNoL0tjb25maWcKQEAgLTE1ODQsNiArMTU4NCwxMCBA
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
Mi40OC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
