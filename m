Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76892C44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIiR+kznBNmsv4F4xzWKNY3Dv1k8qmJf+139vVh/Ano=; b=Z3L0oAQc/kVbmb
	OQT9E48MC6r17DhUaaCQHh8gO3ictNt60KwmVChUULUWCV7lldw+VU1cd3JRSXtFfUwHOYeCMJbyB
	FQngIJqSPBm9VXNSGH+JJsgKW65WboP5fu4fbOmzzffCZ72xFRzZzNs/rmhZrEYVtugav5iPOM3Vb
	0otlcCnSPJ5Q/N4TrDo79qICmRakIHk+fVx+oJ1CAD3IzN7TULFbOOGLAmOp4ja07stlXKCxodNlu
	9JSbxl58LyrD3hsdvuhnwBXyznhWuz/Q2jDsu0e+lquZjBFqjdLxvq6N/SUx+EUn/+fz/NnViNoDz
	2/KLd89YAiGTcQlBfS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whn0A-00000002CWp-2rU7;
	Thu, 09 Jul 2026 11:33:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzp-00000002Bqu-2e4i;
	Thu, 09 Jul 2026 11:32:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ukFASTVcwJCA9KHs65XStV/NanPY9+t/aJWekQ6IKw=;
	b=xLBBBBbh4/VWO9XnxdBWWEUvqzn9mmxKtghNmN65V+Cf4har8MzUX9hyoH+gOUFNJ0QDZH
	mhrQzKul8EzypjUmmlpwnx86X/j6mp+M74+44prDPC5Lb8pQqlkpFANr1hPoiweBhjIMvL
	IJQ6MiL3Yuyh11sCsUB/qGlCV3fC2EXReRUTsEgy1o+ZC4hqFkeSEsi0TIZ4voWO+rfnY1
	Dv8Px5LpQHM/R1zjHRBtez08FAjNDJgYULJlhWKa/IrL6yP6/p/2kOaw2JHAzOmlqglsU6
	/03UR9MkVzy/rbOrYQVZ342ujoRW8Tk7nPvjQmW03SqWiWzVIxa6VuNOlviODw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ukFASTVcwJCA9KHs65XStV/NanPY9+t/aJWekQ6IKw=;
	b=OgMhKys2yLyiiIrzt/ebS8mgwv4WAKvLSUlGBZDOz+da0ok2x1dai57gPiCFIfoQeTZIiC
	uHk5AT5qmEA4l1Dg==
Date: Thu, 09 Jul 2026 13:32:41 +0200
Subject: [PATCH 5/7] clocksource/drivers/arm_arch_timer: Replace
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
MIME-Version: 1.0
Message-Id: <20260709-vdso-arch-clockmodes-v1-5-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1366;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HBDbLxQ/mmLThuSCavhDFNuAv2+3px29VTHQ8QYWw1w=;
 b=/EvHsm6ydzGcPsxrNvqkQUB75XQjGIMB3dJQHMvHaYcR1e6vOjowSLWMYmBC9iC39j5MyPR+r
 GKnBIHG7yBIC0ZzIDI8rObHsO7fQLB+a+bRP7h1extXlNquFlV9wR/m
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_043249_828764_03BA937E 
X-CRM114-Status: UNSURE (   8.29  )
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

Tm93IHRoYXQgdGhlcmUgaXMgYSBkdW1teSBkZWNsYXJhdGlvbiBvZiBWRFNPX0NMT0NLTU9ERV9B
UkNIVElNRVIsCmV2ZW4gaWYgbm8gdkRTTyBpcyBidWlsdCwgdGhlIHVnbHkgaWZkZWZmZXJ5IGNh
biBiZSByZXBsYWNlZCB3aXRoCmEgY2xlYW5lciBJU19FTkFCTEVEKCkgY2hlY2suCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5k
ZT4KLS0tCiBkcml2ZXJzL2Nsb2Nrc291cmNlL2FybV9hcmNoX3RpbWVyLmMgfCA3ICsrLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS9hcm1fYXJjaF90aW1lci5jIGIvZHJpdmVycy9jbG9j
a3NvdXJjZS9hcm1fYXJjaF90aW1lci5jCmluZGV4IDRhZGY3NTY0MjNkZS4uZDY3MTI1YTg3MzBh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL2FybV9hcmNoX3RpbWVyLmMKKysrIGIv
ZHJpdmVycy9jbG9ja3NvdXJjZS9hcm1fYXJjaF90aW1lci5jCkBAIC01NiwxMSArNTYsOCBAQCBz
dGF0aWMgc3RydWN0IGNsb2NrX2V2ZW50X2RldmljZSBfX3BlcmNwdSAqYXJjaF90aW1lcl9ldnQ7
CiBzdGF0aWMgZW51bSBhcmNoX3RpbWVyX3BwaV9uciBhcmNoX3RpbWVyX3VzZXNfcHBpIF9fcm9f
YWZ0ZXJfaW5pdCA9IEFSQ0hfVElNRVJfVklSVF9QUEk7CiBzdGF0aWMgYm9vbCBhcmNoX3RpbWVy
X2Mzc3RvcCBfX3JvX2FmdGVyX2luaXQ7CiBzdGF0aWMgYm9vbCBhcmNoX2NvdW50ZXJfc3VzcGVu
ZF9zdG9wIF9fcm9fYWZ0ZXJfaW5pdDsKLSNpZmRlZiBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZE
QVkKLXN0YXRpYyBlbnVtIHZkc29fY2xvY2tfbW9kZSB2ZHNvX2RlZmF1bHQgPSBWRFNPX0NMT0NL
TU9ERV9BUkNIVElNRVI7Ci0jZWxzZQotc3RhdGljIGVudW0gdmRzb19jbG9ja19tb2RlIHZkc29f
ZGVmYXVsdCA9IFZEU09fQ0xPQ0tNT0RFX05PTkU7Ci0jZW5kaWYgLyogQ09ORklHX0dFTkVSSUNf
R0VUVElNRU9GREFZICovCitzdGF0aWMgZW51bSB2ZHNvX2Nsb2NrX21vZGUgdmRzb19kZWZhdWx0
ID0gSVNfRU5BQkxFRChDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkpID8KKwlWRFNPX0NMT0NL
TU9ERV9BUkNIVElNRVIgOiBWRFNPX0NMT0NLTU9ERV9OT05FOwogCiBzdGF0aWMgY3B1bWFza190
IGV2dHN0cm1fYXZhaWxhYmxlID0gQ1BVX01BU0tfTk9ORTsKIHN0YXRpYyBib29sIGV2dHN0cm1f
ZW5hYmxlIF9fcm9fYWZ0ZXJfaW5pdCA9IElTX0VOQUJMRUQoQ09ORklHX0FSTV9BUkNIX1RJTUVS
X0VWVFNUUkVBTSk7CgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
