Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1932DC531F9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dguotnnJHnuv63W0KjxOwZlaqHhAgkpDtwO6Krbde+U=; b=yEkDuUcq8LAdQn
	y61yBCXfb5VpkhhT9ACAtBbsmFZoldpvYzsKS/MI39O2HPp++UMIYppJlqLKlZZLV+XWB/R3GBvAY
	MSypyOMj91Ebfa2JzgIkRHBHf498ssa3Y9TsrtIzvS/sSwd1QVw4B2HDTOD9uYmUci146s5xGOEKY
	5pWG1mn9ab2EFO0efgL3XibW33a9JDTHLsA0Eny8+LHp8LuyF/QpttxfxthJC2I2/wmJzys/HXJOC
	FYjN9XPnoSv3IFKZPUhZxRX9nAiL89fZH+9Q6lM4k+sb6moHIud1S8EBnN/YJZcd5R71KENEtLZ6p
	R8eM9CmFc488m2ApXlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6v-0000000GUXU-0hf1;
	Fri, 24 Jul 2026 13:38:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6P-0000000GUGU-1B6T;
	Fri, 24 Jul 2026 13:38:16 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DETzi99iW5LSyN+yHRyHD/USkiX0xstftPX39RhkXRQ=;
	b=LolrfjT1ZGrmlYO3lelRd/aVORyCKK8u8LHEs2BF0CPZxtrSs34o3ETbtxQXZLrJT3GHkW
	6xdSI+iQY2zJIJf55MvFtJI/vLyADG+NdN1Zxq3U7wgNdfdjsYWInb035OxjI7r9Kn5VQC
	YM5yk8cpElby5ltCNP4pHzr9k5eHi/TfCo0Fiy8n15+stdjouXdxHV7bNFnoUFa6VzCr4L
	9/J+IGjlivsOOW3m6hbHOhsZLDvmZ7siI8goneELAAe8rDdMDeHXGf7VO+oPHlAX6uNGGN
	rtC8sZaCqtQRRVor3mDNBb2WAKtyr1jWxzvjj47RVo0XRsBRwThfNtj/33IzzQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DETzi99iW5LSyN+yHRyHD/USkiX0xstftPX39RhkXRQ=;
	b=1yJn5T7c38mgra6MmxYGQjPXTkR8qdUsJwkbLwdHP5fN0xvA+PYhuJsNfoen+JYeufSEoT
	86Pa5cItesv5l5Bg==
Date: Fri, 24 Jul 2026 15:36:19 +0200
Subject: [PATCH v4 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
MIME-Version: 1.0
Message-Id: <20260724-vdso-arch-clockmodes-v4-2-ddbe447be860@linutronix.de>
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=1748;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sXLjsimGUSXXUsc2qCiD2uC+XdCfB1PERWY6JkUJ0UM=;
 b=YQZ4SJ9LKPw2mQO9sn76zUzwQfDIDMnEmscVXz+TzF1vluXpBJaS9RGdqqF/NblxiYNxs8IRa
 PiJSseFUHzVCchlR4q/bDKZC51QjWoXOGODpdcX2t+5nx4A9atnsJMK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063813_494883_DCD97E2C 
X-CRM114-Status: GOOD (  10.74  )
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

U29tZSBjb2RlLCBmb3IgZXhhbXBsZSBjbG9ja3NvdXJjZSBkcml2ZXJzLCBtYXkgd2FudCB0byB1
c2UgdGhlIHZEU08KY2xvY2ttb2RlIGNvbnN0YW50cyBldmVuIHdoZW4gQ09ORklHX0dFTkVSSUNf
R0VUVElNRU9GREFZPW4uCkJ1dCB0aGUgc3ltYm9scyBhcmUgY29tcGxldGVseSBoaWRkZW4gaW4g
dGhhdCBjYXNlLCBtYWtpbmcgdWdseQppZmRlZmZlcnkgbmVjZXNzYXJ5LgoKQWx3YXlzIHByb3Zp
ZGUgdGhlIGVudW0gZGVmaW5pdGlvbnMuCgpBcyBub3QgYWxsIGFyY2hpdGVjdHVyZXMgcHJvdmlk
ZSBhc20vdmRzby9jbG9ja3NvdXJjZS5oLApwcm92aWRlIGFuIGVtcHR5IHN0dWIgaW4gYXNtLWdl
bmVyaWMgZm9yIGl0LgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53
ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVpbGQg
ICAgICAgICAgICAgfCAxICsKIGluY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby9jbG9ja3NvdXJjZS5o
IHwgMAogaW5jbHVkZS92ZHNvL2Nsb2Nrc291cmNlLmggICAgICAgICAgICAgfCA0ICstLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvS2J1aWxkIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVp
bGQKaW5kZXggMTVkZjlkY2I0MmE1Li4yYmMwMGM2N2RjNTQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
YXNtLWdlbmVyaWMvS2J1aWxkCisrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvS2J1aWxkCkBAIC02
Miw2ICs2Miw3IEBAIG1hbmRhdG9yeS15ICs9IHRvcG9sb2d5LmgKIG1hbmRhdG9yeS15ICs9IHRy
YWNlX2Nsb2NrLmgKIG1hbmRhdG9yeS15ICs9IHVhY2Nlc3MuaAogbWFuZGF0b3J5LXkgKz0gdW53
aW5kX3VzZXIuaAorbWFuZGF0b3J5LXkgKz0gdmRzby9jbG9ja3NvdXJjZS5oCiBtYW5kYXRvcnkt
eSArPSB2ZXJtYWdpYy5oCiBtYW5kYXRvcnkteSArPSB2Z2EuaAogbWFuZGF0b3J5LXkgKz0gdmlk
ZW8uaApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNvL2Nsb2Nrc291cmNlLmgg
Yi9pbmNsdWRlL2FzbS1nZW5lcmljL3Zkc28vY2xvY2tzb3VyY2UuaApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmU2OWRlMjliYjJkMQpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS92ZHNvL2Nsb2Nrc291cmNlLmggYi9pbmNsdWRlL3Zkc28vY2xvY2tzb3VyY2UuaAppbmRleCBj
NjgyZTdjNjAyNzMuLmJjZTgxYzAyYTdjNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS92ZHNvL2Nsb2Nr
c291cmNlLmgKKysrIGIvaW5jbHVkZS92ZHNvL2Nsb2Nrc291cmNlLmgKQEAgLTQsMTMgKzQsMTEg
QEAKIAogI2luY2x1ZGUgPHZkc28vbGltaXRzLmg+CiAKLSNpZmRlZiBDT05GSUdfR0VORVJJQ19H
RVRUSU1FT0ZEQVkKICNpbmNsdWRlIDxhc20vdmRzby9jbG9ja3NvdXJjZS5oPgotI2VuZGlmIC8q
IENPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWSAqLwogCiBlbnVtIHZkc29fY2xvY2tfbW9kZSB7
CiAJVkRTT19DTE9DS01PREVfTk9ORSwKLSNpZmRlZiBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZE
QVkKKyNpZmRlZiBWRFNPX0FSQ0hfQ0xPQ0tNT0RFUwogCVZEU09fQVJDSF9DTE9DS01PREVTLAog
I2VuZGlmCiAJVkRTT19DTE9DS01PREVfTUFYLAoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
