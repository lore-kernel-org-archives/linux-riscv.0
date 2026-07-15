Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B908C44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 07:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHchY9YxWr4kUrnD/uv8bbrjcLpvuKt3l0PH/h1FzNI=; b=OwEEszt5AOG9ta
	e4UkWnVpzQ94WVxt6ZncmDn+5hZLMtk7wYFRMZ2yXDmslYLXWcw29tid/RZ+FUe83x6aBtUx4/xXS
	MGoPGcFtvS/kEz2VO3SkmHuIaNPq2mfA5ANYLjpXhgU7xe85GqglbmdLh2LHqetyMc7k9TnPLDnkA
	lXghqFhBMba6DdZeGnbxX51ec8O7KOsZr/RK1H5Gb6whmBFCIEiw6AgWHFiBF1PqwfG6h/gk3MB0C
	YmiIiQpjULbBtnVqM9Q1jrgUdDxNZuM+e1G+cRnXMCSoan7vuEBKZvzTLjQhq87EulLWZpq8jTbe5
	V87ZJFt7SjyztZS1Xqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju3l-0000000E1kZ-0f8S;
	Wed, 15 Jul 2026 07:29:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju3g-0000000E1iC-0qGD;
	Wed, 15 Jul 2026 07:29:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86669600BB;
	Wed, 15 Jul 2026 07:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC081F000E9;
	Wed, 15 Jul 2026 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784100571;
	bh=oxqnySUc8Q87H9Bf1NcMH+aFYiamz3WK9FMyyvPdOHQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=RJ0obCk28CVa5NZXZuu1pUdenmJYIQlEs6MMF67avt9Mea6LpcXDIVL7emcqswy6r
	 UgkNH7iltfdTsoSvDqFc79LhJfEhvqLhukc8Y/Q7laC5Z3yORMErsR1kYSgdpXfpDv
	 H294L8Bf0ZCUGCplE4gq8sNMKQkSdNub3bGtTv3li48WsKckEvHNQXqbU3oeh1YSIp
	 LcPVP513nmLfDBhvxLMKjr6P7w/49KZEyBsdIErNONwnpRw9kAf9IjWCSHp51bmaed
	 mJ2iLNKEjZ3M2DA8TSMw2ugIPQced7dtn11Lt7Kygqdu+qA7a2QO/oKJt7ahGJJVzL
	 mLJU3KRFXEyxA==
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
Subject: Re: [PATCH 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
In-Reply-To: <20260709-vdso-arch-clockmodes-v1-2-3fd780bbf851@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-2-3fd780bbf851@linutronix.de>
Date: Wed, 15 Jul 2026 09:29:26 +0200
Message-ID: <87zezsogmh.ffs@fw13>
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
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvS2J1aWxkIGIvaW5jbHVkZS9hc20tZ2Vu
ZXJpYy9LYnVpbGQKPiBpbmRleCAxNWRmOWRjYjQyYTUuLjJiYzAwYzY3ZGM1NCAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL0tidWlsZAo+ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVy
aWMvS2J1aWxkCj4gQEAgLTYyLDYgKzYyLDcgQEAgbWFuZGF0b3J5LXkgKz0gdG9wb2xvZ3kuaAo+
ICBtYW5kYXRvcnkteSArPSB0cmFjZV9jbG9jay5oCj4gIG1hbmRhdG9yeS15ICs9IHVhY2Nlc3Mu
aAo+ICBtYW5kYXRvcnkteSArPSB1bndpbmRfdXNlci5oCj4gK21hbmRhdG9yeS15ICs9IHZkc28v
Y2xvY2tzb3VyY2UuaAo+ICBtYW5kYXRvcnkteSArPSB2ZXJtYWdpYy5oCj4gIG1hbmRhdG9yeS15
ICs9IHZnYS5oCj4gIG1hbmRhdG9yeS15ICs9IHZpZGVvLmgKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9hc20tZ2VuZXJpYy92ZHNvL2Nsb2Nrc291cmNlLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3Zk
c28vY2xvY2tzb3VyY2UuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAw
MDAwLi5lNjlkZTI5YmIyZDEKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS92ZHNvL2Nsb2Nrc291cmNl
LmggYi9pbmNsdWRlL3Zkc28vY2xvY2tzb3VyY2UuaAo+IGluZGV4IGM2ODJlN2M2MDI3My4uNjNl
ZThjNGVhMTVjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdmRzby9jbG9ja3NvdXJjZS5oCj4gKysr
IGIvaW5jbHVkZS92ZHNvL2Nsb2Nrc291cmNlLmgKPiBAQCAtNCw5ICs0LDEyIEBACj4gIAo+ICAj
aW5jbHVkZSA8dmRzby9saW1pdHMuaD4KPiAgCj4gLSNpZmRlZiBDT05GSUdfR0VORVJJQ19HRVRU
SU1FT0ZEQVkKPiAgI2luY2x1ZGUgPGFzbS92ZHNvL2Nsb2Nrc291cmNlLmg+Cj4gLSNlbmRpZiAv
KiBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkgKi8KPiArCj4gKyNpZiAhSVNfRU5BQkxFRChD
T05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkpICYmIGRlZmluZWQoVkRTT19BUkNIX0NMT0NLTU9E
RVMpCj4gKy8qIFVubGlua2FibGUgZHVtbXkgc3R1YnMgKi8KPiArZXh0ZXJuIGludCBWRFNPX0FS
Q0hfQ0xPQ0tNT0RFUzsKPiArI2VuZGlmCgpJJ20gdXR0ZXJseSBjb25mdXNlZCBieSB0aGlzLiBX
aGF0J3MgdGhpcyB1bmxpbmthYmxlIHN0dWIgZm9yPwoKVGhlIG9ubHkgdXNhZ2Ugb2YgVkRTT19B
UkNIX0NMT0NLTU9ERVMgaXMgaW4gZW51bSB2ZHNvX2Nsb2NrX21vZGVzIHdoZXJlCml0IGlzIGd1
YXJkZWQgd2l0aCBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkuCgpBbmQgeW91ciBjaGFuZ2Ug
bG9nIHNheXM6Cgo+IFByb3ZpZGUgdW5saW5rYWJsZSBkdW1teSBkZWZpbml0aW9ucy4gVGhlc2Ug
Y2FuIGJlIHVzZWQgd2l0aAo+IElTX0VOQUJMRUQoQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZ
KS4KCndoaWNoIGlzIGV2ZW4gbW9yZSBjb25mdXNpbmcgYmVjYXVzZSB0aGF0J3MgcmVsYXRlZCB0
byB0aGUgYWN0dWFsCmFyY2hpdGVjdHVyZSBzcGVjaWZpYyBkZWZpbmVzIGFuZCBub3QgdG8gVkRT
T19BUkNIX0NMT0NLTU9ERVMuCgpOb25lIG9mIHRoaXMgbWFrZXMgc2Vuc2UgdG8gbWUuCgpUaGFu
a3MsCgogICAgICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
