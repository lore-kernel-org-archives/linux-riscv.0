Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827E5E937E4
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Apr 2026 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pV4gnVJ1kyIxe+/JIoHadie+ZBmJAxMRKe+9WNZNr0o=; b=KFMH0qUGhioo3N
	WeD7RwprNzTu7U+BXtJMrEx9yo24kVwYZ8vBf5MH4rrR4zS7dIvd2F5Fe+2eqKD7GNw3W3IzeUofF
	M5s5KfW+0Zuuz1z7A6cQ/JcqQN2Q17b/LOjchU8Hsp/AS2WDzF78EppahRyURQK3oYqvLCwg2sZHE
	VvVCN9TCFtAe+fXOPGh2mo1BqMquYWddZj53JVV0246jO1HXEV/2wK5yFWGc2foO9V5ZtWZEZ4g3/
	dTpN08kRsZ8/9k/vHXsgWbD5Z7siV868WW25TYLWjJ3h3c71yWT8uX3xyxEyNSJECfOo3NUON59WE
	a4KUioH/hzO9cLv67tGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBumL-0000000EKfF-0jOx;
	Sun, 12 Apr 2026 13:23:09 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBumH-0000000EKe1-3MDn
	for linux-riscv@lists.infradead.org;
	Sun, 12 Apr 2026 13:23:07 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b97f9587e6eso465135566b.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Apr 2026 06:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776000183; cv=none;
        d=google.com; s=arc-20240605;
        b=Zhi8BOC9gMgGP3ZAoXsY+IFL1T9Qz5MuoxZi01/N5Oeg4cqaatoHl1X5xPf7WtQRfu
         lk4zdGhkn0op/3AZh+2JH1QpR34Q3pmDMsZ3Wo9SGF9N0tdFVGQmUrx6Bg3Mt2Un3rMV
         gRYNjAziLd7cyWp4CFum3VRS2BFOdemXixF6x+W9ymufuT0S7SnQDL2A7hXDq/DL1ANf
         C/UnPNCZ9PvT2rOh0qVSL4cEkLHH9uKrMsGV4CMf+Qkiym2RpDr8VMJXZa5Uu4v+xz7F
         Iebl/PLrICPHqSZlmHJM/mOK91AA6KiYPsXvnG4Yff6P1DJYWJMl+shSQUfKhf02MpHD
         RmvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        fh=GgzvJqUgOXm11kWYjSCUDGhptPn4qze6wEtkpCGlla0=;
        b=lgCF/USqgrcb5LCJnKqbprN8P2plE5KIo7BAeI3HILi/u5fZQ3U88uhT9GMt+XPArs
         8z1JrVfhzMuDXmkoEkiJX45yGAsHwfIb8ArGtyZCKY26SjfadwN0j3IuxEQNM9jOq94z
         pA6AFc7KW627Lup1nY4mntn47/aW1cHnXV9HaCPES8xCt5h/NFvM77tDN3hOUPzPS5Od
         tEbkvFgUwCtNl31AuXmfdtr5i6MLC9rmso8THEIjnDRMrmkKOO1TsptalySccm+fKAzf
         2Ls9Iw/O18A1cmugkT/kVpaOoQxpNaO/PAN+gk4y9dfuLZe5yyGfU8Nt3ya1S8fLmciH
         FEHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776000183; x=1776604983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=MqZTbFfViRV0axOduEEit0jAawpY/Wj3Y0jCA65x9Efzn0e5Rczc8IHlNpnqbF3TRH
         uJ2WhJq1dN1ShnqrxFtpFpHX6FVqZ0F88GdtMCUdloV4SmabvIM79hc4rdM2vKI9LMy5
         W2GJcgpQ9nKurXrGIBGYv2QQAdrtXW3XkevbSJxsG8kCnXht6QkGnKXk1dqmMcHeXOnA
         sln7xBzCdca1FnXgVBTmZ8pl8wTGoObr6CYYrxXXy9ClQ7suzqW+CJdi6WejAlR2TK85
         b22Qsb/Nh7MDQ9kQK9T8o1dwyJaERqEBw5S67rahMD66dHk9rKvwf/ca5S+cTZM+xjoi
         Rh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776000183; x=1776604983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=MV9pWKS7mx2vXPHl87S0C/MA/Pzbd7/xbUWqL3G66YtOIcTlMdR9/eUnJ1/mg7BAS4
         bR2Uu86Tc5yCLNOZ5JSV7PjpTfE9oek8ArbhwQfDZSurbrmYe0o4eiYY3VsMhyG+Ya1v
         simuqvMvjoy+gY6PKZ9rOdxvKhUdykcGhWlEYZzS2B5Y/++DL01J3zB94G5CuYU/wxfo
         d6cHmFW5BbRJ25cxYar8h5GroZu+bmBFdPYD4iSxL7Ic6af7gRa1/smZsn4yVQEFiLIg
         EOPvEqq5qDU3LA+Jo25jODY9kHz1C2qmpHJU+xeW7QyK3kFoFTG/AquoWcj8wMbfbdHh
         /j6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqgCOUGWT/07Fnre+RuzLPydgopjwoKTrko5pVFfEhoVbQoqWW7PUzgHYtotA0axjO4s1wVCJi7aMpGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpA9eZTuOKG2Z/KzP7NJ6OxRMA1mugUn09L8zidp/g+RgGdd+I
	Ve59Gi5i6NbOAIL5pg1qtxWY81H5I79KzqBJ3d4L2WjXaTrfB5ilPnrHkyyO7zrr1IIlULi2cbe
	s9Wm+xx86oYx629a6D6PMf3JzfUHWy3k=
X-Gm-Gg: AeBDiesEPH5nD+eCoo7E+VoFXSLpx3HwgBLhCiJYGDguEpGCxML8Va/eMgFFHGboSUN
	Yg+FwJVcUhk6JLM6HNi32hL8n7RUeGIefUnuYy6o/goJqY7VTJarb9TUVcL+SZpHtZYG6PfUG0E
	ZZhkA0cP/OaLrf8vysffZhH3zrb8lLUPGj4GQuLTtYbuzn3LtnOYOVqgvH7zMd7PJkCCyTB/cPJ
	FDgURRIHl8aBr8xHXi/+rDC5mPx10+hiRpUOqnLbFBBOlqCDMOm7DCv3RtqVnym7NjfNf5lie+l
	AiuX0pLYRsTw1pmlVP5IAhdmeLlu2U7Uae4IF7kF
X-Received: by 2002:a17:907:e113:b0:b9c:6ef1:ed18 with SMTP id
 a640c23a62f3a-b9d727aa4fdmr352963766b.25.1776000183133; Sun, 12 Apr 2026
 06:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.131582521@kernel.org>
In-Reply-To: <20260410120319.131582521@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 12 Apr 2026 15:22:51 +0200
X-Gm-Features: AQROBzAeMsaeSVePCJ__tEd4f2rWAY6MixXzp_fii2b8vyUpLt4xjSbtYzENFaw
Message-ID: <CA+=Fv5S68wZQapeaYTspOfsuGk=nBj60sx-ojHBSqrxV59Q+ZA@mail.gmail.com>
Subject: Re: [patch 23/38] alpha: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, 
	iommu@lists.linux.dev, Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_062305_851425_0EE20555 
X-CRM114-Status: GOOD (  13.30  )
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

T24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgMjozNuKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoZSBvbmx5IHJlbWFpbmluZyB1c2FnZSBvZiBnZXRfY3lj
bGVzKCkgaXMgdG8gcHJvdmlkZQo+IHJhbmRvbV9nZXRfZW50cm9weSgpLgo+Cj4gU3dpdGNoIGFs
cGhhIG92ZXIgdG8gdGhlIG5ldyBzY2hlbWUgb2Ygc2VsZWN0aW5nIEFSQ0hfSEFTX1JBTkRPTV9F
TlRST1BZCj4gYW5kIHByb3ZpZGluZyByYW5kb21fZ2V0X2VudHJvcHkoKSBpbiBhc20vcmFuZG9t
LmguCj4KPiBSZW1vdmUgYXNtL3RpbWV4LmggYXMgaXQgaGFzIG5vIGZ1bmN0aW9uYWxpdHkgYW55
bW9yZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3Jn
Pgo+IENjOiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4K
PiBDYzogbGludXgtYWxwaGFAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gIGFyY2gvYWxwaGEvS2Nv
bmZpZyAgICAgICAgICAgICAgfCAgICAxICsKPiAgYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9yYW5k
b20uaCB8ICAgMTQgKysrKysrKysrKysrKysKPiAgYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS90aW1l
eC5oICB8ICAgMjYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKCkhpLAoKVGhlIEFscGhhIHNpZGUg
bG9va3MgZmluZSB0byBtZS4KCkkndmUgYXBwbGllZCB0aGlzIHBhdGNoIG9uIHRvcCBvZiB2Ny4w
LXJjNywgYnVpbHQgYSBrZXJuZWwgc3VjY2Vzc2Z1bGx5LApib290LXRlc3RlZCBpdCBvbiBhbiBB
bHBoYSBVUDIwMDArIChTTVApIHdpdGhvdXQgaXNzdWVzLgoKQWNrZWQtYnk6IE1hZ251cyBMaW5k
aG9sbSA8bGlubWFnN0BnbWFpbC5jb20+ClRlc3RlZC1ieTogTWFnbnVzIExpbmRob2xtIDxsaW5t
YWc3QGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
