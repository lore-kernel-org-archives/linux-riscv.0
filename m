Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30C3C4453B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dguotnnJHnuv63W0KjxOwZlaqHhAgkpDtwO6Krbde+U=; b=BoROdNPGfCmA/u
	oq3FP+vRGwNqAgom5DkJxzrETGZgUi4+kEYgn0Ug2Y8iWI8bOzmDzqQb22yGhr2BXAQQYE+Wyt3se
	s6JI2yXwcg9lpWPbsOxRu3zPGSzXjpsEOlIo7AF8HA2BnYx0xJNDsPtc95INli2oSRIpSfw4zREVK
	j9yZ5SCW69HZ22oB5n+H7Q0PiByA1KQjpS3Ewugt/stJ8c4QYhpG1MZ6g/aBeQqefwtQ4ZsHBMHLN
	S85cfAXpXECIKiw4Y5ftJRbFFnAZWAsY9lk0mzoQcqSErB6WuA1U4R14nIyy0JZ29DQbgTXFeBvYP
	RSKGh0O4yz1RdIKc4Skg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmQ-0000000BAOU-48kD;
	Wed, 22 Jul 2026 07:54:15 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmI-0000000BAGI-0sVY;
	Wed, 22 Jul 2026 07:54:07 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DETzi99iW5LSyN+yHRyHD/USkiX0xstftPX39RhkXRQ=;
	b=F61HdFymViC3ukVd01nJrWkuHvyUyfEkTyjXYwQdSGa1VcGUAFtLgIFQDyzo/SlZQjhdOz
	hcr748HWnqQ2iNyQh2fh946cCB/vpvqtvBN5Two2EEPARvAz4b9/xVIz5UDT9k6GwTU1oe
	JInpKgTPCXngYDyOhmzz5scEvHI21UV263HuHudO4phGg30NvbXax2uxnAS0CLN+V9qZke
	Hx63wFpY7+uAbjHWvTMYMrMtDlXZoRhoFc3+kEhLYcWOjYAIQEYnaCwO1B1oq2DqyUeZfZ
	m9JGaBHLbFQOID65bbBGeTOSf7kOK5Lw3iJLixldcujkODCcf//cbZ2bwf0dEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DETzi99iW5LSyN+yHRyHD/USkiX0xstftPX39RhkXRQ=;
	b=Zrn6X7ywEQ2VhnWDfmjyo8A17SuZSw/fMV4ucdja337+xN6fnXGR7tpU66i/wAvLLNWEVw
	ATyakOMGiXGIuqBA==
Date: Wed, 22 Jul 2026 09:53:28 +0200
Subject: [PATCH v3 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
MIME-Version: 1.0
Message-Id: <20260722-vdso-arch-clockmodes-v3-2-4c5753191cc4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784706840; l=1748;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sXLjsimGUSXXUsc2qCiD2uC+XdCfB1PERWY6JkUJ0UM=;
 b=cXaFIgcYiUB2wwrHHfBslBD7y0L62mFnT4tLN0nF30Bff5jzXmwM85Ect4R6/BWgWEyjN6qvd
 VxIt+W4M/+6AfjXy4eatdZbv3Fs/PhuGkcZr60JIA/xjb/L4ldzmP4R
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005406_398899_7EC7A020 
X-CRM114-Status: GOOD (  11.11  )
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
