Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDB4C44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGorF/L/9XJspnEu3xQMrekzQ51z3VzslWh5BGqKJVg=; b=rvgsc+x308TteE
	pqvPcoNXACboFWapxTcxAwyANgVvOo4XF5ffdpy+b2ZRKo15/QsXgGK/1hLxalsz4KL6XOXpbkZyI
	uJuIV+5y8s0c2AQb0Q25e2dg7NXDs3HCzhgKaSuRyMJkU66ixu8uZ8Nt+pO4pjH1QIdjPhl6Fl/lU
	KuakxHek68mNTc71W7VQFE3vwUz1mHLRwIPKgeGi2KNltW3659LvchuL+b646l0iK+nZc2Pevec4m
	RfLFuNn4XxGlEb8yn5YkUbbGWEWgk8EDdnz7b40FWJ8GQCxP+vBwnJ/w0OAbBQeFVL3hSCeX9fYzA
	VuMo2wfSrMw2WsRac9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuvm-0000000E9jV-3bf6;
	Wed, 15 Jul 2026 08:25:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuvk-0000000E9iW-3A1i;
	Wed, 15 Jul 2026 08:25:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2172943A31;
	Wed, 15 Jul 2026 08:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4271F000E9;
	Wed, 15 Jul 2026 08:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103924;
	bh=0hWGr6yIYZ3hmyl+qH6n3K7Fm452o43E71VabCLMJ2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=M1Pb9WQu0IhR3P6JRYVgpOzljOTuLBL5n6r0R+i3T6Cj6Pfq/BbEAeyvAAd6q+GwU
	 yoh16hddpke8YRXj4bfC0BlqZXoh2oOxkxxfr/ZZ4LtH1IwctkRUOsAZ2DTsl5MwXL
	 OgwbU2Z0EXRTi2suwmOEdZwMcMw1UwD4qnCb2U0UIGMxWSKqmkI4rJV0fOaz7frsyp
	 2UgeFb3NExlZX58pouMZoZOq3U2RBWV9ghRcw3YrJThQyIqJBrSR5X77jMSfD+Yh9P
	 Vqa0sNn/IVBkbkj+87yT6Eh8x08MbkvvvCwenfxyZ52gn69bWZbYdUyMpeOjJGr8Vu
	 P097FVeUHn00g==
From: Thomas Gleixner <tglx@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Arnd Bergmann
 <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery with IS_ENABLED()
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
Date: Wed, 15 Jul 2026 10:25:19 +0200
Message-ID: <87wluwoe1c.ffs@fw13>
MIME-Version: 1.0
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

T24gVGh1LCBKdWwgMDkgMjAyNiBhdCAxMzozMiwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4g
Tm93IHRoYXQgdGhlcmUgaXMgYSBkdW1teSBkZWNsYXJhdGlvbiBvZiBWRFNPX0NMT0NLTU9ERV9S
NEssIGV2ZW4gaWYgbm8KPiB2RFNPIGlzIGJ1aWx0LCB0aGUgdWdseSBpZmRlZmZlcnkgY2FuIGJl
IHJlcGxhY2VkIHdpdGggYSBjbGVhbmVyCj4gSVNfRU5BQkxFRCgpIGNoZWNrLgoKRHVoLiBUaGlz
IHN0dWZmIGlzIHJlYWxseSBvYmZ1c2NhdGVkLiBJIGp1c3QgcmVhbGl6ZWQgdGhhdCB0aGUgcHJl
dmlvdXMKb25lIGFjdHVhbGx5IGV4cGFuZHMgdGhlIGFyY2hpdGVjdHVyZSBkZWZpbmVzIHRvIG5v
bi1kZWZpbmVkIGludGVnZXIKdmFyaWFibGUgZGVjbGFyYXRpb25zLgoKU21hcnQsIGJ1dCBzZXJp
b3VzbHk/CgpJIGp1c3QgZG91YmxlIGNoZWNrZWQgYW5kIGl0IHR1cm5zIG91dCB0aGF0IG5vbmUg
b2YgdGhpcyBpZmRlZmZlcnkgaXMKcmVxdWlyZWQuIElmIENPTkZJR19HRU5FUklDX0dFVFRJTUVP
RkRBWSBpcyBkaXNhYmxlZCwgdGhlbiBpdCBkb2VzIG5vdAptYXR0ZXIgYXQgYWxsIHdoZXRoZXIg
dGhlIGFjdHVhbCBBUkNIX0NMT0NLX1ZEU09fTU9ERSBpcyBzZXQgaW4KY2xvY2tzb3VyY2U6OnZk
c29fbW9kZSBvciBub3QuCgpOb3RoaW5nIHVzZXMgdGhlIHZkc28gbW9kZSBmaWVsZCBvdXRzaWRl
IG9mIHVwZGF0ZV92c3lzY2FsbCBhbmQgdGhhdCdzCmNvbXBpbGVkIG91dCB3aGVuIENPTkZJR19H
RU5FUklDX0dFVFRJTUVPRkRBWT1uLgoKU28gYWxsIHdoYXQncyByZXF1aXJlZCBpczoKCi0tLSBh
L2luY2x1ZGUvdmRzby9jbG9ja3NvdXJjZS5oCisrKyBiL2luY2x1ZGUvdmRzby9jbG9ja3NvdXJj
ZS5oCkBAIC0zLDE0ICszLDExIEBACiAjZGVmaW5lIF9fVkRTT19DTE9DS1NPVVJDRV9ICiAKICNp
bmNsdWRlIDx2ZHNvL2xpbWl0cy5oPgotCi0jaWZkZWYgQ09ORklHX0dFTkVSSUNfR0VUVElNRU9G
REFZCiAjaW5jbHVkZSA8YXNtL3Zkc28vY2xvY2tzb3VyY2UuaD4KLSNlbmRpZiAvKiBDT05GSUdf
R0VORVJJQ19HRVRUSU1FT0ZEQVkgKi8KIAogZW51bSB2ZHNvX2Nsb2NrX21vZGUgewogCVZEU09f
Q0xPQ0tNT0RFX05PTkUsCi0jaWZkZWYgQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZCisjaWZk
ZWYgVkRTT19BUkNIX0NMT0NLTU9ERVMKIAlWRFNPX0FSQ0hfQ0xPQ0tNT0RFUywKICNlbmRpZgog
CVZEU09fQ0xPQ0tNT0RFX01BWCwKCmFuZCB0aGVuIHlvdSBjYW4ganVzdCB1bmNvbmRpdGlvbmFs
bHkgc2V0IGNsb2Nrc291cmNlOjp2ZHNvX2Nsb2NrX21vZGUKaW4gYWxsIGRyaXZlcnMuCgpObz8K
ClRoYW5rcywKCiAgICAgICAgdGdseAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
