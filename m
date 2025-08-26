Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A59CA0EE4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 06:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmqqKtqgp8ZwjRxrHgofvox6EKfSvmN2iW/fTDuzyz4=; b=1JJHLnXb9qa7NV
	BFJdiE8uolkSKQCOuD+rYSdyZQoNUW0v22IrniCQqVKGbnSwTodgXo4yQbjoTJ367dDTtPHFJ+ck5
	ombLmbq2XHY6KS/tP0Ty5Er083gyS9dSW3luSBCveuP38n33ipL1z7fVakX+un2wGjowdIFcxOUja
	2m/F/oGtT0qyOrlaWU3r+Ew8wh0iaNU2SW4SZqr/tsQGVG8bdjZd1IJ8DLAAncF/i/7Xtfhle0who
	hv/9GsrzLYgLPZGNbECn3/YCoIG3MLEaUFaF9yZZnCxPrJUXyVpE+Sjj8D4TfMGLT5jhGv07Q/U2d
	zF0tRc02MWEregrAqgAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn8r-0000000AhVR-43yl;
	Tue, 26 Aug 2025 06:26:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0f-0000000Af9S-0ZAc;
	Tue, 26 Aug 2025 06:18:23 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RkAC4wHTvttqFMA6WXB8e/iq2KZu43nm9iAolOlePoo=;
	b=ftFG8SBnHpOXRL9VAVhckxZYgwanzsVDNpjzugioUWi5H/xnB9LILcjisXIrzH2R+dazDg
	ZNjj2RdlNZx0OSz5vn6HERSvn8UwHlr7Q5cgeUXzSPD/sDRnQfG0ssQC5o9mys+jB6sDJk
	z4w6mODqzHiWZ8+UWGykNpJQh+5rXhZlF6+Sa6lPM1KttWeNNlu8lZXimTskuj80uPVBPS
	FopsXitSUPuUlbMt1Gw/VB/4vy9bj93+g1D7QgcBGF4K5Rs8Zjy0QPAnw0UCOBX5dxoxbz
	Afa6WIqDtpB2KnfHuFb7U8fOJqpiVBknxb225gAJVwnWK2Be0r1onSEP5TwAsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RkAC4wHTvttqFMA6WXB8e/iq2KZu43nm9iAolOlePoo=;
	b=Q8mSoKdiRiKW506l9WVulESL+9134C7qwVPD/h56gDK4cLn2hQDvtAscD0+Y7vY2LhTQCC
	HHH6+qGbv0QACRBg==
Date: Tue, 26 Aug 2025 08:17:04 +0200
Subject: [PATCH 01/11] vdso/datastore: Gate time data behind
 CONFIG_GENERIC_GETTIMEOFDAY
MIME-Version: 1.0
Message-Id: <20250826-vdso-cleanups-v1-1-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=1494;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Xwfsdm0ZK9C/lpd9jqhqOkaZcVVPlOC5pvjRYhkmXtE=;
 b=tlV3av9IKVXt0yWBFrF5Xv8jBNjjBxHO+JuqtOgaexNgBMaGIsCaUqqbuFYpe8hxCfE7QWU0D
 myFUv/1mGoXDr2ckk35aDR7U4NUTuoYXHLDHdqVI/Wbr6WCebWnlLLC
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231821_325160_06324975 
X-CRM114-Status: GOOD (  10.87  )
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

V2hlbiB0aGUgZ2VuZXJpYyB2RFNPIGRvZXMgbm90IHByb3ZpZGUgdGltZSBmdW5jdGlvbnMsIGFz
IGZvciBleGFtcGxlIG9uCnJpc2N2MzIsIHRoZW4gdGhlIHRpbWUgZGF0YSBzdG9yZSBpcyBub3Qg
bmVjZXNzYXJ5LgoKQXZvaWQgYWxsb2NhdGluZyB0aGVzZSB0aW1lIGRhdGEgcGFnZXMgd2hlbiBu
b3QgdXNlZC4KCkZpeGVzOiBkZjdmY2JlZmE3MTAgKCJ2ZHNvOiBBZGQgZ2VuZXJpYyB0aW1lIGRh
dGEgc3RvcmFnZSIpClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vp
c3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGxpYi92ZHNvL2RhdGFzdG9yZS5jIHwgNiArKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbGliL3Zkc28vZGF0YXN0b3JlLmMgYi9saWIvdmRzby9kYXRhc3RvcmUuYwppbmRl
eCAzNjkzYzZjYWYyYzRkNDFhNTI2NjEzZDVmYjc0NmNiM2E5ODFlYTJlLi5hNTY1YzMwYzcxYTA0
ZmY0MTE2YzE0ZjQzZjQ0NTAyMTBlYmE5OWM1IDEwMDY0NAotLS0gYS9saWIvdmRzby9kYXRhc3Rv
cmUuYworKysgYi9saWIvdmRzby9kYXRhc3RvcmUuYwpAQCAtMTEsMTQgKzExLDE0IEBACiAvKgog
ICogVGhlIHZEU08gZGF0YSBwYWdlLgogICovCi0jaWZkZWYgQ09ORklHX0hBVkVfR0VORVJJQ19W
RFNPCisjaWZkZWYgQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZCiBzdGF0aWMgdW5pb24gewog
CXN0cnVjdCB2ZHNvX3RpbWVfZGF0YQlkYXRhOwogCXU4CQkJcGFnZVtQQUdFX1NJWkVdOwogfSB2
ZHNvX3RpbWVfZGF0YV9zdG9yZSBfX3BhZ2VfYWxpZ25lZF9kYXRhOwogc3RydWN0IHZkc29fdGlt
ZV9kYXRhICp2ZHNvX2tfdGltZV9kYXRhID0gJnZkc29fdGltZV9kYXRhX3N0b3JlLmRhdGE7CiBz
dGF0aWNfYXNzZXJ0KHNpemVvZih2ZHNvX3RpbWVfZGF0YV9zdG9yZSkgPT0gUEFHRV9TSVpFKTsK
LSNlbmRpZiAvKiBDT05GSUdfSEFWRV9HRU5FUklDX1ZEU08gKi8KKyNlbmRpZiAvKiBDT05GSUdf
R0VORVJJQ19HRVRUSU1FT0ZEQVkgKi8KIAogI2lmZGVmIENPTkZJR19WRFNPX0dFVFJBTkRPTQog
c3RhdGljIHVuaW9uIHsKQEAgLTQ2LDcgKzQ2LDcgQEAgc3RhdGljIHZtX2ZhdWx0X3QgdnZhcl9m
YXVsdChjb25zdCBzdHJ1Y3Qgdm1fc3BlY2lhbF9tYXBwaW5nICpzbSwKIAogCXN3aXRjaCAodm1m
LT5wZ29mZikgewogCWNhc2UgVkRTT19USU1FX1BBR0VfT0ZGU0VUOgotCQlpZiAoIUlTX0VOQUJM
RUQoQ09ORklHX0hBVkVfR0VORVJJQ19WRFNPKSkKKwkJaWYgKCFJU19FTkFCTEVEKENPTkZJR19H
RU5FUklDX0dFVFRJTUVPRkRBWSkpCiAJCQlyZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwogCQlwZm4g
PSBfX3BoeXNfdG9fcGZuKF9fcGFfc3ltYm9sKHZkc29fa190aW1lX2RhdGEpKTsKIAkJaWYgKHRp
bWVuc19wYWdlKSB7CgotLSAKMi41MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
