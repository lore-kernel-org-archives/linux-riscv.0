Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019ECC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URi0BWbIq5g7o7K7e/wRBycsDmQ5/qp376FnP+HyDVQ=; b=lnI9//FECziRjo
	HuJjke0Eb0e8juMFF1q/iMo4FlJKC7OoOLWVzvlciPjGYMDVh2n8M2JBERiTS8YA9GZs11EvO9RQg
	405ZInCvT984YFw41kRRMe/E97GVECed61tPL+NTjlk84W37A4hjf6DQMauBEOwGHp6ao3b4yQQkO
	UMRSZlHpZkPIdlxhQG8ica9MF27Ez6XoeGidlheftx7bQ9UpIXV587PNUcagrZ6b6Dv8rQPkNRBvF
	H4RI22eRTQCtWWK1NFZYEUQQKeyOtMKimgqhRiZhGO8W6E5jmM3V5OfzsRLuxS+3Kpq9817M+51VR
	uQKwCSKKEdZeAXEf3y5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzu-00000002C4M-07zs;
	Thu, 09 Jul 2026 11:32:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzp-00000002BsY-1UIs;
	Thu, 09 Jul 2026 11:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YlYUd92+ScLDxYlFwSuTjK/TPM/lpz0Ba9+m5/5v7MI=; b=lZDlGAV211zwPT7mFhlNUR73+T
	aBIqNwMflvZhARzkymcYttYNpmei2VgficLzIs42HWl5U1mkquwiaqQZnGalNARqF+bmYpxvAP5HY
	K3/ef6GaJCmcyg7H2J7jxWsJ4isvppyuRQ+I4yYaE4l3Mq3B+m2ZJNbz4UMvWzqSQhDv+lM/ZPw89
	rtmN8l7CPRSWi2592KwA3Yv0SAs4i8kz3UJwvUrL2IcC5CqdalcKUAnyH2JwlrAG2wisKrc3TuIII
	FSgJOU/64YYMdIMhBSCHINqEnbkxk6NMdxLTXYlWHWqve4trGw36oHlapsMS+Du9UTadSE+kb5AZI
	PWR+TFDQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whmzl-000000098xX-088k;
	Thu, 09 Jul 2026 11:32:46 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlYUd92+ScLDxYlFwSuTjK/TPM/lpz0Ba9+m5/5v7MI=;
	b=IlULMl+4CtL6rM7d/CgRXp7QX97GF/Ck8C6qLxe+ic36JA7Bs2T6idMQqbsv46MVmx46uT
	kisfnPSYN+glvvPduDXY4WYQuLUCHypJ3V11FB9c72SOy6SA+iQWm6+5Z3M5okmVfeyPjT
	/td9lRNm3vrMZhzE8MOlzu7ejXjcPa6RNxsMpTEb4PyYzgKSmOzel/tPda942IPlusMGfq
	mH9VxaHynt0XxkfcggEtw/6x1U4OBJhcQ/+JyclLcqKZ6V6WdHGTTk4Oz+F00Ep2NI4Q/f
	DoSek3/iaDnZ9aFFY5Qlo/fBCBCEIGGEtHhyjn9k4njSL+w/mVHmfXOYCoFDJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlYUd92+ScLDxYlFwSuTjK/TPM/lpz0Ba9+m5/5v7MI=;
	b=YcjtO/4GdFIKhisomwnoXc8G8Sedwa6OEkbR8JPSkLF5WeT+Zfua/SsEoQenWHhG5QJA0C
	39OlEKeGNI8qZ9Dw==
Date: Thu, 09 Jul 2026 13:32:39 +0200
Subject: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery with IS_ENABLED()
MIME-Version: 1.0
Message-Id: <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1171;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=quX/1M6S+XbJFv91b3HWqjCqdHAetO18UrSBkVTStFo=;
 b=RdMzhC1r1vxhWsQeyyMDUvhVKhFhq1a8/Y6N7TF4JO+L8CHnocNSx3GgS8L52Oa/cL1JViKs1
 WKAwSV5KsYKBbeI3fvFLUJD7F5c9b/8WKb4l+d+UxyLhioHqM5gTHKq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_123245_188863_AEE857A4 
X-CRM114-Status: UNSURE (   9.65  )
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

Tm93IHRoYXQgdGhlcmUgaXMgYSBkdW1teSBkZWNsYXJhdGlvbiBvZiBWRFNPX0NMT0NLTU9ERV9S
NEssIGV2ZW4gaWYgbm8KdkRTTyBpcyBidWlsdCwgdGhlIHVnbHkgaWZkZWZmZXJ5IGNhbiBiZSBy
ZXBsYWNlZCB3aXRoIGEgY2xlYW5lcgpJU19FTkFCTEVEKCkgY2hlY2suCgpTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0t
CiBhcmNoL21pcHMva2VybmVsL2NzcmMtcjRrLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL21pcHMva2Vy
bmVsL2NzcmMtcjRrLmMgYi9hcmNoL21pcHMva2VybmVsL2NzcmMtcjRrLmMKaW5kZXggMjQxYTkz
NDU0M2E4Li42M2FjYTc0YWIyOTkgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9rZXJuZWwvY3NyYy1y
NGsuYworKysgYi9hcmNoL21pcHMva2VybmVsL2NzcmMtcjRrLmMKQEAgLTEyNiwxNCArMTI2LDEy
IEBAIGludCBfX2luaXQgaW5pdF9yNGtfY2xvY2tzb3VyY2Uodm9pZCkKIAljbG9ja3NvdXJjZV9t
aXBzLnJhdGluZyA9IDIwMDsKIAljbG9ja3NvdXJjZV9taXBzLnJhdGluZyArPSBjbGFtcChtaXBz
X2hwdF9mcmVxdWVuY3kgLyAxMDAwMDAwMCwgMCwgOTkpOwogCi0jaWZkZWYgQ09ORklHX0dFTkVS
SUNfR0VUVElNRU9GREFZCiAJLyoKIAkgKiBSMiBvbndhcmRzIG1ha2VzIHRoZSBjb3VudCBhY2Nl
c3NpYmxlIHRvIHVzZXIgbW9kZSBzbyBpdCBjYW4gYmUgdXNlZAogCSAqIGJ5IHRoZSBWRFNPIChI
V1JFbmEgaXMgY29uZmlndXJlZCBieSBjb25maWd1cmVfaHdyZW5hKCkpLgogCSAqLwotCWlmIChj
cHVfaGFzX21pcHNfcjJfcjYgJiYgcmRod3JfY291bnRfdXNhYmxlKCkpCisJaWYgKElTX0VOQUJM
RUQoQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZKSAmJiBjcHVfaGFzX21pcHNfcjJfcjYgJiYg
cmRod3JfY291bnRfdXNhYmxlKCkpCiAJCWNsb2Nrc291cmNlX21pcHMudmRzb19jbG9ja19tb2Rl
ID0gVkRTT19DTE9DS01PREVfUjRLOwotI2VuZGlmCiAKIAljbG9ja3NvdXJjZV9yZWdpc3Rlcl9o
eigmY2xvY2tzb3VyY2VfbWlwcywgbWlwc19ocHRfZnJlcXVlbmN5KTsKIAoKLS0gCjIuNTUuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
