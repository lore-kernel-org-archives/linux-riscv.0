Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E53C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 11:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uO9g4t0iAbGtrTIcZidFB5XwzgbGe3wxG4w9P28f53Y=; b=FSCxGSXirVmVwH
	IulXFE5KapSNO8glVoVJI2EuApRYWKkGAcKqKeV4Pa95C88ltaNDDKNJCDBSsA2o7SFe8BBVO233R
	QduNqsijNOEuRX5zT99UdULJ00jbLOwBg+so1Dnt/INji68QbC8RT3dem+6PbLO1O9iqe2MkVabeK
	V5G/chOZk3jmueHezUWTRfWJNHQMAOEM7a9IsyQ9SdghoNgnIk04GVRS746e7BpOclFMcxiZwUxd+
	u16+py8T/Qa4mhH0OgPlbiLoaDCNEAf83eIBlQwPWuerzaTjc+/j2zfz7spovsw6ULD3818CE6QHM
	4fBwLSft07prGRj1wTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA76U-000000067GR-3Tbl;
	Thu, 23 May 2024 11:59:26 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA76Q-000000067Du-0SnW
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 11:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716465558;
	bh=MyKrkfyh6coOYh8JbTipr70bfsFYaSpyWOIp4W1neZs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZVFQaf7E2zMMMzhb3+1ZMWVsQ8PClWLWieXPc49DYI1gbsc96gPXIaEoNgy1zBuiL
	 LpqUF+uV07ofe2G1PfOMosiD8+uu3otXR5JROLvcKgNDCUCez/ZAmozlbAyRoDJUGH
	 +OJLO7wpBv+gExkoaJd9O3KKVaCMw4AxSL7IjdAV45GbClx5m1CVfftaRkQtAlYrC6
	 szRqm6ZzRDmZKHFeC1L1HUEV6Z9vA4QzRTQM7csJ5jXXSdChkzOk+lDhOGjQOQ9N4C
	 4/F3hZ9TFP13C8VzsJEgdqLfCLLKFuwIjBqTJBJZww51pStCeiiuXEgUD/4P+eOjEL
	 qXV7J6NFZnJjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VlRY25NmDz4wcg;
	Thu, 23 May 2024 21:59:18 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Palmer Dabbelt
 <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V Patches for the 6.10 Merge Window, Part 1
In-Reply-To: <CAK7LNASVhbtJ2=72TsCu1C7+uLsXySNffPcNZU2NiFKitM6-Ew@mail.gmail.com>
References: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
 <CAK7LNASVhbtJ2=72TsCu1C7+uLsXySNffPcNZU2NiFKitM6-Ew@mail.gmail.com>
Date: Thu, 23 May 2024 21:59:15 +1000
Message-ID: <87ed9s3fjg.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_045922_467953_28C7B0C7 
X-CRM114-Status: GOOD (  11.13  )
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

TWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4gd3JpdGVzOgo+IE9uIFRodSwg
TWF5IDIzLCAyMDI0IGF0IDE6MTPigK9BTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4+Cj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNGNl
Y2U3NjQ5NjUwMjBjMjJjZmY3NjY1YjE4YTAxMjAwNjM1OTA5NToKPj4KPj4gICBMaW51eCA2Ljkt
cmMxICgyMDI0LTAzLTI0IDE0OjEwOjA1IC0wNzAwKQo+Pgo+PiBhcmUgYXZhaWxhYmxlIGluIHRo
ZSBHaXQgcmVwb3NpdG9yeSBhdDoKPj4KPj4gICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0IHRhZ3MvcmlzY3YtZm9yLWxpbnVzLTYu
MTAtbXcxCj4+Cj4+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA5MmNjZTkxOTQ5YTQ5
N2E4YTQ2MTVmOWJhNTgxM2IwM2Y3YTFmMWQ1Ogo+Pgo+PiAgIHJpc2N2OiBkZWZjb25maWc6IEVu
YWJsZSBDT05GSUdfQ0xLX1NPUEhHT19DVjE4MDAgKDIwMjQtMDUtMTMgMTQ6MjY6MzQgLTA3MDAp
Ci4uLgo+Pgo+PiBNYXNhaGlybyBZYW1hZGEgKDIpOgo+PiAgICAgICByaXNjdjogbWVyZ2UgdHdv
IGlmLWJsb2NrcyBmb3IgS0JVSUxEX0lNQUdFCj4+ICAgICAgIGV4cG9ydC5oOiByZW1vdmUgaW5j
bHVkZS9hc20tZ2VuZXJpYy9leHBvcnQuaAo+Cj4KPiBJIGFtIGNvbmZ1c2VkLgo+Cj4KPiBUaGlz
IGNvbW1pdCB3YXMgYXBwbGllZCB0d28gbW9udGhzIGFnbyBieSBteXNlbGYsCj4gYW5kIGl0IGFs
cmVhZHkgZXhpc3RlZCBpbiB0aGUgbWFpbmxpbmUuCj4KPgo+IEFmdGVyIHRoaXMgcHVsbCByZXF1
ZXN0LCBJIGRvIG5vdCBzZWUgbm8gc3VjaCBhIGNvbW1pdAo+IGFwcGxpZWQgYnkgUGFsbWVyLgoK
SXQgaXMgaW4gdGhlcmU6CgokIGdpdCBsb2cgLS1wcmV0dHk9ZnVsbGVyIC0xIDM2ZDM3ZjExZjU1
NTgxMmIwZGVkNWQxNWFhNjg2YTZiOWRhNTdmNjEKY29tbWl0IDM2ZDM3ZjExZjU1NTgxMmIwZGVk
NWQxNWFhNjg2YTZiOWRhNTdmNjEKQXV0aG9yOiAgICAgTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGly
b3lAa2VybmVsLm9yZz4KQXV0aG9yRGF0ZTogU2F0IE1hciAyMyAxODowNjoxNSAyMDI0ICswOTAw
CkNvbW1pdDogICAgIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgpDb21taXRE
YXRlOiBXZWQgTWFyIDI3IDA3OjE0OjE5IDIwMjQgLTA3MDAKCiAgICBleHBvcnQuaDogcmVtb3Zl
IGluY2x1ZGUvYXNtLWdlbmVyaWMvZXhwb3J0LmgKCiAgICBDb21taXQgM2E2ZGQ1ZjYxNGExICgi
cmlzY3Y6IHJlbW92ZSB1bm5lZWRlZCAjaW5jbHVkZQogICAgPGFzbS1nZW5lcmljL2V4cG9ydC5o
PiIpIHJlbW92ZWQgdGhlIGxhc3QgdXNlIG9mCiAgICBpbmNsdWRlL2FzbS1nZW5lcmljL2V4cG9y
dC5oLgoKICAgIFRoaXMgZGVwcmVjYXRlZCBoZWFkZXIgY2FuIGdvIGF3YXkuCgogICAgU2lnbmVk
LW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KICAgIExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAzMjMwOTA2MTUuMTI0NDkwNC0xLW1hc2Fo
aXJveUBrZXJuZWwub3JnCiAgICBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4KCk9yIHZpYToKCiQgZ2l0IGxvZyAtLW9uZWxpbmUgLTIgOTJjY2U5MTk0
OWE0OTdhOGE0NjE1ZjliYTU4MTNiMDNmN2ExZjFkNSBvcmlnaW4vbWFzdGVyIC0tIGluY2x1ZGUv
YXNtLWdlbmVyaWMvZXhwb3J0LmgKMDMxNmU0YjA0ZTAxIGV4cG9ydC5oOiByZW1vdmUgaW5jbHVk
ZS9hc20tZ2VuZXJpYy9leHBvcnQuaAozNmQzN2YxMWY1NTUgZXhwb3J0Lmg6IHJlbW92ZSBpbmNs
dWRlL2FzbS1nZW5lcmljL2V4cG9ydC5oCgpjaGVlcnMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
