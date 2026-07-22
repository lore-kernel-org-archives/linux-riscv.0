Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F7CC4453B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sc7+KV55Ee96z5YMZx8fBryfcMOxQkH8GysRsvMzz+Q=; b=zHBHFhL2Y3++QB
	mGqByhLlK2Kt7KdYDGQRPOyqmStJ/TcoiRAbQx06Mr36bUI51tOxLy7psyJV0tcbE5UOh7SjiHryP
	2U2wUOKtMSSGpM7P4CiUaio/3LfwO8iTyV0oVR3oXWG6PKiP4vn7vffKNTqeQNwe67baY5vOBkoXJ
	eUKOKvXnxS5E8FlCvrxnl04eK+iiu7m1/GcZhpFD4k8/mBJA2h7eINueXr3HYCcXUttFTPMn2GVGo
	/+5D5tU1lPKI6zGGKZiiJpdaraiNPoq3A/DGFIfTpyKimcG9KD+Aq0p31wGdIQ2A3ogiJcs4bLZ5A
	j9CB7R5kLPrjpmO/HANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmV-0000000BAUi-2IxF;
	Wed, 22 Jul 2026 07:54:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmK-0000000BAIW-1pQP;
	Wed, 22 Jul 2026 07:54:10 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb2SX77zyxaYXrQzUmclJ/k81+yHIaZBLWgIqd5QYek=;
	b=ZCBbJxE3//P0uRFzQdyh4Tk8RAFRJ0pFNAPajAbypuEOfdaAwoQfqlRO4hoXX8WLDTvNLw
	RKVKUXhH4VLrFGEO6FT9KB+r59rxBK93bY9F3IkFKzQF6YX1M1O8kHcYuNLSrnmvHtY/c5
	KP8KzN6jGQmGkqN3Gpg14x2hl3wB1/NBz7rrQ3If/cvIoDHINfOrKz0QqFOGMGzYXPFGZl
	eLd9pSn3RwWgPPMx44oGODy8r3CkZZ+QIrF6pkFp9RSPIVIfvTCRyR4JBTUyYMTnvePHRQ
	0+KMGVAMvlz1E2VqvZDLe6ZyYtdT+5+NKgNSmwwTg64MBCLiRjlOhzoV7+JLzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb2SX77zyxaYXrQzUmclJ/k81+yHIaZBLWgIqd5QYek=;
	b=DztDMZiBvtlkUKsi3537Br2VZM+T/cUdgoiTSf2nFbsp+V/enzkjjTL7RdgOtZRfV2cr02
	Sk2b6uTHaZl//+Cg==
Date: Wed, 22 Jul 2026 09:53:32 +0200
Subject: [PATCH v3 6/7] clocksource/drivers/timer-riscv: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
MIME-Version: 1.0
Message-Id: <20260722-vdso-arch-clockmodes-v3-6-4c5753191cc4@linutronix.de>
References: <20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de>
In-Reply-To: <20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784706840; l=898;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6yZi1E2ORWX3erxZ2iLgMw+pOXO/qHsB3RdbekGUNbY=;
 b=OGxNmRewbphCOeeEqi4jJWvqSgWZHS+7S8nITbTNvq2sjy66pfRkWG5/Eed//9dwpW/qsqmcf
 WZU0U94MfAOCuMaOVGEFxs42C1e4YdH9XZ5GMMfNHRGGi2GzJFbPoHL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005408_639484_8540649F 
X-CRM114-Status: UNSURE (   8.26  )
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

Tm93IHRoYXQgdGhlcmUgaXMgYSBkZWZpbml0aW9uIG9mIFZEU09fQ0xPQ0tNT0RFX0FSQ0hUSU1F
UgpldmVuIGlmIG5vIHZEU08gaXMgYnVpbHQsIHRoZSB1Z2x5IGlmZGVmZmVyeSBjYW4gYmUgcmVt
b3ZlZC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyB8
IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1l
ci1yaXNjdi5jCmluZGV4IGNmYzRkODNjNDJjMC4uYjMxMGU2NzIxZmFjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKKysrIGIvZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1yaXNjdi5jCkBAIC05OCwxMSArOTgsNyBAQCBzdGF0aWMgc3RydWN0IGNsb2Nrc291
cmNlIHJpc2N2X2Nsb2Nrc291cmNlID0gewogCS5tYXNrCQk9IENMT0NLU09VUkNFX01BU0soNjQp
LAogCS5mbGFncwkJPSBDTE9DS19TT1VSQ0VfSVNfQ09OVElOVU9VUywKIAkucmVhZAkJPSByaXNj
dl9jbG9ja3NvdXJjZV9yZHRpbWUsCi0jaWYgSVNfRU5BQkxFRChDT05GSUdfR0VORVJJQ19HRVRU
SU1FT0ZEQVkpCiAJLnZkc29fY2xvY2tfbW9kZSA9IFZEU09fQ0xPQ0tNT0RFX0FSQ0hUSU1FUiwK
LSNlbHNlCi0JLnZkc29fY2xvY2tfbW9kZSA9IFZEU09fQ0xPQ0tNT0RFX05PTkUsCi0jZW5kaWYK
IH07CiAKIHN0YXRpYyBpbnQgcmlzY3ZfdGltZXJfc3RhcnRpbmdfY3B1KHVuc2lnbmVkIGludCBj
cHUpCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
