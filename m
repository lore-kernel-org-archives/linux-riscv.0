Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04EDC44507
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 09:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYEEDEm9WiPx9c486G5knqoY9XiRxA3dk6v8eM5ZIPg=; b=oIVw4h1ZKZRe5w
	EOmfKVxdROxOhaEMjUSyCPZRijrOh0/hIimwY69czF0SdDH8JYQgX4sJQdmdz5O1XauV4pZrorz3u
	B+0NRpzpbqVw7UOuw7fdDJbd+9zoi3psz0s2jJ5lUdXVQr/JRJN9Hz94PIJFRsK2DudfUlEKNBNc7
	XFu7mczZmNcGN8EcmA0pVC/9P0CbBAmc81yko3M5bz7shhQ6xmOHhNjkQKMKI43C9JzGFnZEsrDwO
	2EA+1TZ35sse5036bIsvuiKP0ZENb/jxMuwbMhD/YNRZK5ZlZdjk6vYiuKtCcMOLRjWzFhH907vmW
	UlUZeZfN9nAz7KEyhWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvX0-0000000EFwT-3Jxy;
	Wed, 15 Jul 2026 09:03:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvWx-0000000EFw0-2joo;
	Wed, 15 Jul 2026 09:03:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B29A43B69;
	Wed, 15 Jul 2026 09:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110871F000E9;
	Wed, 15 Jul 2026 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784106230;
	bh=VX7v5KznOGst/S32zIq13isYK9aQbcFUdNYlBguUuc0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Mp9b9tA1KsQJcysDV5RgBKBMJTWV+8PyD1YK/DtL5YbfSJnfI2mdI68YW8UhLCZsN
	 yHzbUs5VcVEC4mFb+D2l+PtQWybslLwNtVqM7ljXGi8kYsmMs56+Ijv0vyr+iRpsC8
	 vOP7qSTE8VGiPtNWfpzA4RhaYAMQMF0cuxho3kGHt/9zuP7emOkG0JxyBE2dIs4Zzj
	 i7WyuimjZqPZ6UkZO9oPeX19hsIGSbz06E13ot/gmtLrxK24748nIGVEqQI+cbKF/d
	 Sm4O626cWSzvQEDbEtTWkY9c4yJvyd4TGLZfKBAuRRkw7ohLEo2/kz0DKlHbUrG8lY
	 ZgWrFIC1PQf0w==
From: Thomas Gleixner <tglx@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery with IS_ENABLED()
In-Reply-To: <20260715102751-d1ed7195-f541-484e-9843-73ee4237b7b5@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
 <87wluwoe1c.ffs@fw13>
 <20260715102751-d1ed7195-f541-484e-9843-73ee4237b7b5@linutronix.de>
Date: Wed, 15 Jul 2026 11:03:47 +0200
Message-ID: <87tsq0oc98.ffs@fw13>
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

T24gV2VkLCBKdWwgMTUgMjAyNiBhdCAxMDo0MywgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4g
T24gV2VkLCBKdWwgMTUsIDIwMjYgYXQgMTA6MjU6MTlBTSArMDIwMCwgVGhvbWFzIEdsZWl4bmVy
IHdyb3RlOgo+PiBhbmQgdGhlbiB5b3UgY2FuIGp1c3QgdW5jb25kaXRpb25hbGx5IHNldCBjbG9j
a3NvdXJjZTo6dmRzb19jbG9ja19tb2RlCj4+IGluIGFsbCBkcml2ZXJzLgo+PiAKPj4gTm8/Cj4K
PiBJdCB3aWxsIHdlYWtlbiB0aGUgc2FuaXR5IGNoZWNrIGluIF9fY2xvY2tzb3VjZV9yZWdpc3Rl
cl9zY2FsZSgpIGlmCj4gQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZPW4uIEkgYW0gbm90IHN1
cmUgd2hhdCB0aGF0IHNhbml0eSBjaGVjawo+IGlzIHN1cHBvc2VkIHRvIHByb3RlY3QgYWdhaW5z
dCwgc28gSSBsZWZ0IGl0IGFzIGlzLgo+IElmIHdlIGNhbiB3ZWFrZW4gdGhlIGNoZWNrLCBvciBt
YXliZSBldmVuIHJlbW92ZSBpdCwKPiBJJ20gYWxsIGZvciB5b3VyIHNpbXBsZXIgYXByb2FjaC4K
ClRoZSBzYW5pdHkgY2hlY2sgaXMgdGhlcmUgdG8gY2F0Y2ggcmFuZG9tIG51bWJlcnMgYmVpbmcg
YXNzaWduZWQuIEkKZG9lcyBub3Qgd2Vha2VuIHdoZW4gaXQncyBhY3R1YWxseSB1bnVzZWQgOikK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
