Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAD3CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jN1nZKolTno7h1qnta77NrfLb0yRIfI8i8I7i0G2uGI=; b=ScyEQicaftkZuB
	Jr++IVA5DxueyxZMuW8ONFgWmFh8usPIXT6IRSCAK554V4k/lxOSR0i1emKlG87TvrT8qN5rlDcRQ
	JKsWkvB6CvYYPsCE3Oel801mrCrd/CXrT+6a+TZGl/4MnLfhkimcf5tdbB6+mpQHfT/abGKuokcva
	Ufw7vAFoOnOrltFMlL9gA+ZZpWgy/pWOY3eHy+Ht1rwG0IrTbG9KntKVonlmV1YYrICFWfGNE5J/w
	zRM9c5vJS9K5BgGwwQe1bKU2yZAhM9ykjGb18Z7eNCa9JDr//2rWE1QrujcR7Cs+mbdcHv8vzwS+6
	gLwZElFxta9Z7NXNXLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej5-0000000GO8j-2Jie;
	Tue, 14 Oct 2025 13:06:03 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eiy-0000000GO0K-3rbE
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:05:59 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0CYU5O26JQub+yqWqbpQg+oK8k+3uTAokj7TeaLTkvI=;
	b=Cdzz+KJzTSoATXV5Ljvowdfgd+hQ49C2HiCspOUMSbLN4Y/KVwHbpcJlPKJDrYKwBpV1Cl
	nl8yCfx9g0blauWEMvgfadUL1Xs67s2WkQmzFvJzw9Skl6Se6lLax4sHGzAsfb26klKK4r
	1BR7dCS9II5sV9DxZS2LrinYR6AYT+BArKduD/fSTt/Rp2tk85LB4DGeGNLC0+s3ZjHIEu
	COxW7QHALQxTwh7TIVAWN9EATLtrOBhFbB2fenbToNZVXr9gPZ2uc6XeCAsm5sSbnusf+D
	IkBXOvaPA9/tEih0RaZgPFGhQsTs/IhEkpHFcxJdnU0UXlm4UHC30/jqEm0elg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0CYU5O26JQub+yqWqbpQg+oK8k+3uTAokj7TeaLTkvI=;
	b=BwzlN2uXPCg/X47u0Uh4Y8N28ll/JnhCE8duJmS0jRH2zsnGwBT82W4JCx3IH8lzXaM7kD
	xkxDEF1BudBfnOCA==
Date: Tue, 14 Oct 2025 15:05:20 +0200
Subject: [PATCH v2 05/10] s390: Implement custom CC_CAN_LINK
MIME-Version: 1.0
Message-Id: <20251014-kbuild-userprogs-bits-v2-5-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1192;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=C5yzpCLqrEUvmfCc9tgMT4vkB0PmGsIVmeRJ/wm+ukg=;
 b=6KMNxZohvV8U55EvTgd5gt+n+aQ06tzHiTyepjAkWCXf3bRHfASgeYcybxotqxOnkE219kD9n
 3f3fejzuvHFChDTTBo0UVdS4/IrKpsCny3q6UyLNz4mbPAvOrT8AK4d
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060557_219146_B37778D2 
X-CRM114-Status: UNSURE (   6.38  )
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

VGhlIGdlbmVyaWMgQ0NfQ0FOX0xJTksgZGV0ZWN0aW9uIHJlbGllcyBvbiAtbTMyLy1tNjQgY29t
cGlsZXIgZmxhZ3MuCnMzOTAgdXNlcyAtbTMxIGluc3RlYWQgb2YgLW0zMi4KClVzZSBhcmNoaXRl
Y3R1cmUtc3BlY2lmaWMgbG9naWMgdXNpbmcgLW0zMS8tbTY0IGluc3RlYWQuCgpTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4K
LS0tCiBhcmNoL3MzOTAvS2NvbmZpZyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9LY29uZmlnIGIvYXJjaC9z
MzkwL0tjb25maWcKaW5kZXggYzQxNDU2NzJjYTM0MmE2NTZlZWNlMTA3MDQ3MDZkNGIxMmZmOWZk
Ni4uNzdlYTE3NTM3ZmEyZjkzOGFlZTFmY2UwMDUzYTQ4ODUzYjFjZTYzOCAxMDA2NDQKLS0tIGEv
YXJjaC9zMzkwL0tjb25maWcKKysrIGIvYXJjaC9zMzkwL0tjb25maWcKQEAgLTgyLDYgKzgyLDcg
QEAgY29uZmlnIFMzOTAKIAlzZWxlY3QgQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFJFTU9WRQogCXNl
bGVjdCBBUkNIX0VOQUJMRV9TUExJVF9QTURfUFRMT0NLIGlmIFBHVEFCTEVfTEVWRUxTID4gMgog
CXNlbGVjdCBBUkNIX0VOQUJMRV9USFBfTUlHUkFUSU9OIGlmIFRSQU5TUEFSRU5UX0hVR0VQQUdF
CisJc2VsZWN0IEFSQ0hfSEFTX0NDX0NBTl9MSU5LCiAJc2VsZWN0IEFSQ0hfSEFTX0NQVV9GSU5B
TElaRV9JTklUCiAJc2VsZWN0IEFSQ0hfSEFTX0NVUlJFTlRfU1RBQ0tfUE9JTlRFUgogCXNlbGVj
dCBBUkNIX0hBU19ERUJVR19WSVJUVUFMCkBAIC0yOTAsNiArMjkxLDE2IEBAIGNvbmZpZyBQR1RB
QkxFX0xFVkVMUwogCiBzb3VyY2UgImtlcm5lbC9saXZlcGF0Y2gvS2NvbmZpZyIKIAorY29uZmln
IEFSQ0hfQ0NfQ0FOX0xJTksKKwlib29sCisJZGVmYXVsdCAkKGNjX2Nhbl9saW5rX3VzZXIsLW02
NCkgaWYgNjRCSVQKKwlkZWZhdWx0ICQoY2NfY2FuX2xpbmtfdXNlciwtbTMxKQorCitjb25maWcg
QVJDSF9VU0VSRkxBR1MKKwlzdHJpbmcKKwlkZWZhdWx0ICItbTY0IiBpZiA2NEJJVAorCWRlZmF1
bHQgIi1tMzEiCisKIGNvbmZpZyBBUkNIX1NVUFBPUlRTX0tFWEVDCiAJZGVmX2Jvb2wgeQogCgot
LSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
