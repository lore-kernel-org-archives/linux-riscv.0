Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC5FC44507
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 06:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sc7+KV55Ee96z5YMZx8fBryfcMOxQkH8GysRsvMzz+Q=; b=gAko/16BQLXQEH
	LzpkTEcO7plhFEHxlPLgHLFFx5u5vSndi3qbRJT6gLHYYeh4L81avmQ/a5gQNrcEPM9HgNz4qFwSk
	lkrFKG3mlF8KNS06xul8h84wxRBuq9MT8m/E9qsWA8d+/zFQGvkmmw5ERArv2fIAjVUIPLNIjjSw5
	H+ehq7hT8bbqkGaQ88raPRY7ake+hOWjgV52Mx8zwZgxnK5aWQ8PlKBJlTo6/90swDILzj3ZeDCms
	KYry1jQW6KHsXXAc1Z+vXcF2gmYAk/zLs85SBWLzJf9zk6h9CDTSfvpY2sAl49Ny5yU5IWiYneDKG
	TZX+dTD8/BIAn1oX0REw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbrT-00000001EMr-0cfa;
	Fri, 17 Jul 2026 06:15:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbr0-00000001Dwy-0jD5;
	Fri, 17 Jul 2026 06:15:24 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784268902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb2SX77zyxaYXrQzUmclJ/k81+yHIaZBLWgIqd5QYek=;
	b=u4eNl9UUcvupBQzTRkd62Gu0i5e4taE85FUWmk/2jcLm9rp2S5n/GfHRkmR+4f8ngi5KAJ
	MtraBnPkgvXVZxTIMrynXKcN17bVph83CXMLuyexF//+Uqvlil1Taya0TAZI7Z5QHUaG26
	5F9I4Keypt2pkMjC6Gr/2eYpOVz5mAMsNEXFTYn68ZeVNTQp9Rf8eDGwcx1lvI+aWwzgkR
	vm5g+VcPXgE7npGpF5ONYgK8WmLrE1ImuT8cX+jDBN2T1DXUjB2iizF/l3ob03D+vq1bY0
	uKf9eKwKUO/IzEO0/Yj+Xyg5ZBTC5lELET7QPGdAZNR0TyUxza0fwfuUr/FMFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784268902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb2SX77zyxaYXrQzUmclJ/k81+yHIaZBLWgIqd5QYek=;
	b=rGP6vb6JJmsFltlNED4hUaJ8a+h2yiSVYkGq/zIdu5++Fs8noFiqCMpoTCpb3SPHjdr84A
	L4PBLwGCTsOiDKCg==
Date: Fri, 17 Jul 2026 08:14:50 +0200
Subject: [PATCH v2 6/7] clocksource/drivers/timer-riscv: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
MIME-Version: 1.0
Message-Id: <20260717-vdso-arch-clockmodes-v2-6-756f5a5d1467@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784268894; l=898;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6yZi1E2ORWX3erxZ2iLgMw+pOXO/qHsB3RdbekGUNbY=;
 b=rGhEvH4eB3yQp5VIIcgk0f5HSBovo4PTZyNAEZbeclqqk6dXhrkWD3CoKxYIoBOGuJgAsnYhP
 VCnQJqzmezKD+StMJTmIgFSq9ask+Vsf9Llxdphw8XKMcC+cV2EzgaT
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_231522_358117_ED972458 
X-CRM114-Status: UNSURE (   7.76  )
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
