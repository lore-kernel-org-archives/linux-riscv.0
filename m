Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE51CCD192
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0r90FPUHxmtPAPOX22TFbLK0elGaxSHgUWGEoAFQzmo=; b=ngZP3uRWKGbK6j
	kLPE7XxelHFZetu+qb1Hz6vFm9/EqGsSxAhSGevobEGlDcTYWqv1AZJnPgzkFu1V14ActbhFiEm67
	/20i+iIwMkjfA6k42pCw2ztTHDXn8IlWqinhz2P3iixLVZ8JY9MVNVXvkAYTQj5hzJJj/PZRJ+m2s
	3pOJLB7Ee2A4aidIigV75AWW0oH+wG1BZURgjUPeRA/qcq20EjmI7z91/jKXjtvkUwIS9kOx7nQNc
	5Bvb4hWlmXF0CoP3nKToCIdIfubaDYIpYoyUFFflTrHR6IdpdmcCKFiy5AklypPV4lRQtZsH4NxPm
	BFxVvHwxsTjxgOYvsYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej7-0000000GOAE-0ABe;
	Tue, 14 Oct 2025 13:06:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eiz-0000000GO1B-2grw
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:06:00 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZtOYvzpIdd5rLNd2E6ncSSFN/khjvYbV63TeavHrvw=;
	b=toZTeHZe1uNjGasrKJzCw6aRjpZ0C4FjxOgf9/0KgK/6vuqPpjSuKY8pi+AlgZxcL6swRy
	gOENcZJv/3PR89wwogqpdZv+lmpci6bHbGRzvHqAR3++S9m2+RTKjniq3b8tO0QKubLcxl
	tFHW4ODlDTHBdB3n123fRMtazhGmb7f3VwyOsp7lvdlFQzRL2hNN0BTMWOHNAzjKKuI3lV
	GJWFeiRFUcvqCMGx+IZj2svBi4ifDeN2pd0O9n+JMu2/mJPzso3CCIvMc7dFNGYjR9NNzx
	hx0ycsNzzhLVpxb5oUuzJZ/hw7Nk5Ubi9y3fDQ2UxfceKUkDgWPT6+kqsIhLfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZtOYvzpIdd5rLNd2E6ncSSFN/khjvYbV63TeavHrvw=;
	b=FpLM2FIx9lrBLiAi7rZaKk9FxVWGfANDCuRfpLNEQaxOZ4jrMhHLjZzj7y1UkktQxNo626
	7RN/FMNDE+jb/eCA==
Date: Tue, 14 Oct 2025 15:05:23 +0200
Subject: [PATCH v2 08/10] x86/Kconfig: Implement custom CC_CAN_LINK
MIME-Version: 1.0
Message-Id: <20251014-kbuild-userprogs-bits-v2-8-faeec46e887a@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1290;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=b6y5QGf5n/DoFSSYq7Ft561zy3R7m1YixtDRRPC4Syk=;
 b=+vm1vR0r4FMZsBIpxV3QN+K0oPDB9pgEvBhAhkeTZXmgDTN7eahpL0dYrQ0dL6ILzr02HF2Zf
 XPjaMmqydtlDwVhKaxupXaW4qFJpS0EQZgzEo/MYf61/Wk9vqQb5nXq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060557_846074_D68B61E4 
X-CRM114-Status: UNSURE (   7.67  )
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

VGhlIGdlbmVyaWMgQ0NfQ0FOX0xJTksgZGV0ZWN0aW9uIGRvZXMgbm90IHdvcmsgZm9yIGFsbCBh
cmNoaXRlY3R1cmVzLgpUbyBtYWtlIGl0IGNsZWFyZXIgaG93IHRoZSBkZXRlY3Rpb24gd29ya3Mg
b24geDg2IGNyZWF0ZSBhbgphcmNoaXRlY3R1cmUtc3BlY2lmaWMgdmFyaWFudC4KClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRl
PgotLS0KIGFyY2gveDg2L0tjb25maWcgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9LY29uZmlnIGIvYXJjaC94
ODYvS2NvbmZpZwppbmRleCBmYTNiNjE2YWYwM2EyZDUwZWFmNWY5MjJiYzhjZDRlMDhhMjg0MDQ1
Li5hOTg2NzVjZDAxYzBjMjdlMmE1NzE2ZmI2ZDA1MTQxNmRkY2M5NTZmIDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni9LY29uZmlnCisrKyBiL2FyY2gveDg2L0tjb25maWcKQEAgLTczLDYgKzczLDcgQEAg
Y29uZmlnIFg4NgogCXNlbGVjdCBBUkNIX0VOQUJMRV9TUExJVF9QTURfUFRMT0NLIGlmIChQR1RB
QkxFX0xFVkVMUyA+IDIpICYmIChYODZfNjQgfHwgWDg2X1BBRSkKIAlzZWxlY3QgQVJDSF9FTkFC
TEVfVEhQX01JR1JBVElPTiBpZiBYODZfNjQgJiYgVFJBTlNQQVJFTlRfSFVHRVBBR0UKIAlzZWxl
Y3QgQVJDSF9IQVNfQUNQSV9UQUJMRV9VUEdSQURFCWlmIEFDUEkKKwlzZWxlY3QgQVJDSF9IQVNf
Q0NfQ0FOX0xJTksKIAlzZWxlY3QgQVJDSF9IQVNfQ1BVX0FUVEFDS19WRUNUT1JTCWlmIENQVV9N
SVRJR0FUSU9OUwogCXNlbGVjdCBBUkNIX0hBU19DQUNIRV9MSU5FX1NJWkUKIAlzZWxlY3QgQVJD
SF9IQVNfQ1BVX0NBQ0hFX0lOVkFMSURBVEVfTUVNUkVHSU9OCkBAIC0zMTcxLDYgKzMxNzIsMTYg
QEAgY29uZmlnIEhBVkVfQVRPTUlDX0lPTUFQCiAJZGVmX2Jvb2wgeQogCWRlcGVuZHMgb24gWDg2
XzMyCiAKK2NvbmZpZyBBUkNIX0NDX0NBTl9MSU5LCisJYm9vbAorCWRlZmF1bHQgJChjY19jYW5f
bGlua191c2VyLC1tNjQpIGlmIDY0QklUCisJZGVmYXVsdCAkKGNjX2Nhbl9saW5rX3VzZXIsLW0z
MikKKworY29uZmlnIEFSQ0hfVVNFUkZMQUdTCisJc3RyaW5nCisJZGVmYXVsdCAiLW02NCIgaWYg
NjRCSVQKKwlkZWZhdWx0ICItbTMyIgorCiBzb3VyY2UgImFyY2gveDg2L2t2bS9LY29uZmlnIgog
CiBzb3VyY2UgImFyY2gveDg2L0tjb25maWcuY3B1ZmVhdHVyZXMiCgotLSAKMi41MS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
