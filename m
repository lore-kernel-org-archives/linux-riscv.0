Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77642C4453E
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uN63po2aQoiad8YaPSKit+8QGKU4CaduAoO9bxnOhro=; b=1qJCvV4sKu6bPD
	s+ByEbTwVAN9y5g2zoc7THYIC2JszwNPG98J+9KZjm0BcRd4jba6+j2BclWp8+v6b1nMncqyg3o2L
	YVwC9k1FzJnrRksWSTbD2KhnZSV6juVcp/i+DnFR0Xr1PS4vIs4yA1zfKc2NagfDP7tRD9ut9SX2/
	ErhXRDXXAa8UN1la/CISAucNb/+IpwWGlboYtuEb7aWGHtRemsNRXacT92qTz984LoTFtU0FR8In0
	Gl+2xovUHCmrTlOgribvLuOcg3gstCRobpw+mfY078O6BhVNf8VwZEGqwxqSZEwjO3jrif6yltebf
	jDSOeec+Mw/FgEg3iwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmS-0000000BAR8-37qe;
	Wed, 22 Jul 2026 07:54:16 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmI-0000000BAGo-0WKn;
	Wed, 22 Jul 2026 07:54:08 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=LKY7C7tfTK4hNNjqvs9SoRMIMTNRS97ZlznMKPJd/o0VcyqL4oMZxkFKywOjea3+3nl0BC
	MoyoizzY2Fo+pKnDZbz52N4A3PnsKvywIJRJKKgpwfl2Pbpt4E90U4/sxVuVbCVbuOwFtc
	VRCQ6VcQiAkH/a9fhuIpgcEJwhYQu5WLfYMEnl5zhnvFIwkd7mq3mrC+QBKNl3+IKWXdxk
	0wCikdKPMQgp6a15XWf4ROpJ1JcNPAWclud4ARyRf9GJ6LjHzTGmRE00LGLwkuZb2LWo5J
	lawQ8Fh+Do0aKCTOeALJhwL00HkFSniNA2RnlS7UPD8u1XFjoC3PYmcj25DGBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=sqvOfTw0cChbxqmSe7acokNhETxrB9krRBUV+IXGcyS3GfSnA2p9K6i4nTwy2FCkLb/8PK
	tAOHx873s1CDL0BQ==
Date: Wed, 22 Jul 2026 09:53:29 +0200
Subject: [PATCH v3 3/7] MIPS: csrc-r4k: Remove CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery
MIME-Version: 1.0
Message-Id: <20260722-vdso-arch-clockmodes-v3-3-4c5753191cc4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784706840; l=1015;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=t3APLy9t2SZVxR8iClS2KaGCf82ju0LDxr/0aH1HIvc=;
 b=uIxQRvVPAiyarjQZoFTq+WiQV0PMfsm1ed9ZoSCQZBqxSTsN8eNdGkdcFomursBXVd30Qumhx
 +nredqHFZbwDng2K5SrwNJB8xJ6geRjJGvDD5cAay/QdT2uEfhlSRct
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005406_298715_F416EAF6 
X-CRM114-Status: UNSURE (   7.94  )
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

Tm93IHRoYXQgdGhlcmUgaXMgYSBkZWZpbml0aW9uIG9mIFZEU09fQ0xPQ0tNT0RFX1I0SyBldmVu
IGlmIG5vCnZEU08gaXMgYnVpbHQsIHRoZSB1Z2x5IGlmZGVmZmVyeSBjYW4gYmUgcmVtb3ZlZC4K
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51
dHJvbml4LmRlPgotLS0KIGFyY2gvbWlwcy9rZXJuZWwvY3NyYy1yNGsuYyB8IDIgLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9rZXJuZWwv
Y3NyYy1yNGsuYyBiL2FyY2gvbWlwcy9rZXJuZWwvY3NyYy1yNGsuYwppbmRleCAyNDFhOTM0NTQz
YTguLjU5ZWNhMzk3ZjI5NyAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2tlcm5lbC9jc3JjLXI0ay5j
CisrKyBiL2FyY2gvbWlwcy9rZXJuZWwvY3NyYy1yNGsuYwpAQCAtMTI2LDE0ICsxMjYsMTIgQEAg
aW50IF9faW5pdCBpbml0X3I0a19jbG9ja3NvdXJjZSh2b2lkKQogCWNsb2Nrc291cmNlX21pcHMu
cmF0aW5nID0gMjAwOwogCWNsb2Nrc291cmNlX21pcHMucmF0aW5nICs9IGNsYW1wKG1pcHNfaHB0
X2ZyZXF1ZW5jeSAvIDEwMDAwMDAwLCAwLCA5OSk7CiAKLSNpZmRlZiBDT05GSUdfR0VORVJJQ19H
RVRUSU1FT0ZEQVkKIAkvKgogCSAqIFIyIG9ud2FyZHMgbWFrZXMgdGhlIGNvdW50IGFjY2Vzc2li
bGUgdG8gdXNlciBtb2RlIHNvIGl0IGNhbiBiZSB1c2VkCiAJICogYnkgdGhlIFZEU08gKEhXUkVu
YSBpcyBjb25maWd1cmVkIGJ5IGNvbmZpZ3VyZV9od3JlbmEoKSkuCiAJICovCiAJaWYgKGNwdV9o
YXNfbWlwc19yMl9yNiAmJiByZGh3cl9jb3VudF91c2FibGUoKSkKIAkJY2xvY2tzb3VyY2VfbWlw
cy52ZHNvX2Nsb2NrX21vZGUgPSBWRFNPX0NMT0NLTU9ERV9SNEs7Ci0jZW5kaWYKIAogCWNsb2Nr
c291cmNlX3JlZ2lzdGVyX2h6KCZjbG9ja3NvdXJjZV9taXBzLCBtaXBzX2hwdF9mcmVxdWVuY3kp
OwogCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
