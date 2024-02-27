Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E54C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5Qqm7v20FB6CP8k/FONjTTZt3WfhssYm34tkpH5tcE=; b=Mxx1ow7ZOEcGvy
	sXLsth3CoROkXEz2Oj0YkJ1a4BW5OWHRsB4K/ZsTsJIr9Rz7GhR/T7g/+8TNczkQQa5itexExE6dP
	KsMIdFDYT6YQSNm058oZBOVGDeLoWSBG47GOV7gejwDrKOMaU+LSrnHIZp9MxByepjPQcWZQoARtp
	G3b4dLDRrXSVWDNvjNM8LInCCKhnFIcG08wNs0sbqkEbgMY8XTK87epYBWCUf7cHrA8X1fPj4e0Q/
	oSBrKjfvH1dU0wND8/HmTWpUaVP2qnIzygCiklvjc6Vj5Ebs+b08KR594g5su2NGoY2F8/4N8KcS3
	iiDAx26ijIqS0W27rhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex1k-00000005HJy-3mPV;
	Tue, 27 Feb 2024 12:57:44 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex1h-00000005HIT-1xsj;
	Tue, 27 Feb 2024 12:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709038654;
	bh=swDhxalnop+40QyzTwmELhQq8fYEaBd8gs0d47AC/h8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lbeHOiisvAviMzJQIz1moD9CMIwDWnyEkMBx5y4p+r5c4IjQoB18qgrlVCvB1x8lp
	 iw5qgUFtP6yhK80WEdbT7VjiMz5ok3ncpSQJrzolcOlwZxH0A6OqtUbvamzsIkn3yn
	 RBV09p6PQKg3ejTTuOeVaiqbz3dvd4in83oOIMRRq6JTZgTEUiakFeAj3srmtE6C78
	 mi6JAHZh6pFZdAUi8XVUbjcFAS71GtwQc2qeDeH5P4Xuct27XPV7LT/rxZnWTHu126
	 fiuYYKa4gKtFpVdOYRIR7pO1OxjT3IRFVQPGGzi+xxv3ckTfZSwTY4PM6V5s6Vt2Jl
	 0WyDEwagYDlRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tkcvp132Mz4wbQ;
	Tue, 27 Feb 2024 23:57:26 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Kees Cook <keescook@chromium.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet
 Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, Brian Cain
 <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson
 <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>,
 "x86@kernel.org" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Andy
 Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran
 Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, "linux-hexagon@vger.kernel.org"
 <linux-hexagon@vger.kernel.org>, "loongarch@lists.linux.dev"
 <loongarch@lists.linux.dev>, "linux-m68k@lists.linux-m68k.org"
 <linux-m68k@lists.linux-m68k.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linux-openrisc@vger.kernel.org"
 <linux-openrisc@vger.kernel.org>, "linux-parisc@vger.kernel.org"
 <linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org"
 <linux-sh@vger.kernel.org>, "sparclinux@vger.kernel.org"
 <sparclinux@vger.kernel.org>, "linux-um@lists.infradead.org"
 <linux-um@lists.infradead.org>, Linux Kernel Functional Testing
 <lkft@linaro.org>
Subject: Re: [PATCH 4/4] vdso: avoid including asm/page.h
In-Reply-To: <80bc4de5-a351-4ac0-93c8-80c8d80fb202@csgroup.eu>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-5-arnd@kernel.org>
 <80bc4de5-a351-4ac0-93c8-80c8d80fb202@csgroup.eu>
Date: Tue, 27 Feb 2024 23:57:25 +1100
Message-ID: <87h6hu5akq.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_045741_983309_D964406E 
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

Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6Cj4g
TGUgMjYvMDIvMjAyNCDDoCAxNzoxNCwgQXJuZCBCZXJnbWFubiBhIMOpY3JpdMKgOgo+PiBGcm9t
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+PiAKPj4gVGhlIHJlY2VudCBjaGFuZ2Ug
dG8gdGhlIHZkc29fZGF0YV9zdG9yZSBicm9rZSBidWlsZGluZyBjb21wYXQgVkRTTwo+PiBvbiBh
dCBsZWFzdCBhcm02NCBiZWNhdXNlIGl0IGluY2x1ZGVzIGhlYWRlcnMgb3V0c2lkZSBvZiB0aGUg
aW5jbHVkZS92ZHNvLwo+PiBuYW1lc3BhY2U6Cj4KPiBJIHVuZGVyc3RhbmQgdGhhdCBwb3dlcnBj
NjQgYWxzbyBoYXMgYW4gaXNzdWUsIHNlZSAKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjMxMjIxMTIwNDEwLjIyMjY2NzgtMS1tcGVA
ZWxsZXJtYW4uaWQuYXUvCgpZZWFoLCBhbmQgdGhhdCBwYXRjaCB3b3VsZCBzaWxlbnRseSBjb25m
bGljdCB3aXRoIHRoaXMgc2VyaWVzLCB3aGljaCBpcwpub3QgaWRlYWwuCgpJIGNvdWxkIGRlbGF5
IG1lcmdpbmcgbXkgcGF0Y2ggYWJvdmUgdW50aWwgYWZ0ZXIgdGhpcyBzZXJpZXMgZ29lcyBpbiwK
bWluZSBvbmx5IGZpeGVzIGEgZmFpcmx5IG9ic2N1cmUgYnVpbGQgd2FybmluZy4KCmNoZWVycwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
