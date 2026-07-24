Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F7CC531F9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csJ6tX1AYyWckgHt3ooU+X79ODfx+9/RqLKD1wA8kJg=; b=ynJy5J84yH2Nec
	sqfTedc1rU4K/m9zcix+BZ0QGB7h0Q54njfwxVgCvVdYRmLs+ou76RIRnfQtIjHckWgQutXCTS2OC
	GMnZV0uhyeHac10y/945gv9KAxvVQCN2xAJ9ihINfnErOssjrkPcX9PAHStjsdez3sGMbYrX3kM5u
	itn2cUIKVbibsmiCDNpxYaXpBFUfL+xXmZt2HGST7xWXhajwzhtYi+p/68goKQOznglEaAdnNo7X4
	WdQBxgu3LBa+PqOiaUQnK/BMMJWyc0odewXsDMyP3+BmtZ2igTp3rd4qfpfURkgNaNTrDKd+X1xkr
	n/tIa5l/j8Oa2bNtRa/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG7F-0000000GUr2-4B1J;
	Fri, 24 Jul 2026 13:39:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6S-0000000GUIV-11tP;
	Fri, 24 Jul 2026 13:38:18 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIw1nW13D3Q7KVGq3dxw/myoCljjqPSm8YvxUaQYWA0=;
	b=P6QsKIcOM3wbtosTcti1hgVEjlSxJo1mJTRJ9rQNUu9Gh67ntWPVBWiLjkc1UQq8W86rec
	mkoRaM7tWTvj7JlnFKEcQbBCK7Xu44s+GtpNnvPf3a5YIPhd19AKaNj2QG6cb8uJ6p2Ba0
	k9Y+fdhWXtTaIlCaRXYwAbbdB4Eh1xbgavilH8bkOkTuzQ81PFPpfzZQkIu1mnKS1lRd+t
	5w+FIFYIeIht/W3Bjjvpxi48l74/xDMmGY1XgDqkmMD4BI4AIjFS6J6oHbtjg/UT29GFPg
	Ttsqa41wmt4CDOJh3yk+Im3GmR342YQRe6emKn1B91Ucdbx7Mko+uCM7MNBshQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIw1nW13D3Q7KVGq3dxw/myoCljjqPSm8YvxUaQYWA0=;
	b=X6D9RzhInEuUkkie6FUghkOkKZYRkjouvhaiCe6fHww+jTAT6fXLnus2NMw4hEdlj+5uAs
	dGRzbp/3bgB7qFBQ==
Date: Fri, 24 Jul 2026 15:36:24 +0200
Subject: [PATCH v4 7/7] LoongArch: Remove CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery
MIME-Version: 1.0
Message-Id: <20260724-vdso-arch-clockmodes-v4-7-ddbe447be860@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=780;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/YNIeu5dDcZIdRrt5u3jACXGrJAGqwCKT4gDnUxNTGQ=;
 b=ezHXJP72IsCgQjW0X5M8lHPPXidInmHgcdYjAVig8SvM52XGjn7gGTMAJGL/lETzsPys9CJZg
 FdUROq9MD9nDvwQslmoauS+BqUFEbWJPpJvpup8MM2zgYCJObAmPucI
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063816_469031_6EEC9D97 
X-CRM114-Status: UNSURE (   7.55  )
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

Tm93IHRoYXQgdGhlcmUgaXMgYSBkZWZpbml0aW9uIG9mIFZEU09fQ0xPQ0tNT0RFX0NQVSBldmVu
IGlmIG5vCnZEU08gaXMgYnVpbHQsIHRoZSB1Z2x5IGlmZGVmZmVyeSBjYW4gYmUgcmVtb3ZlZC4K
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51
dHJvbml4LmRlPgotLS0KIGFyY2gvbG9vbmdhcmNoL2tlcm5lbC90aW1lLmMgfCAyIC0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJjaC9r
ZXJuZWwvdGltZS5jIGIvYXJjaC9sb29uZ2FyY2gva2VybmVsL3RpbWUuYwppbmRleCBkYmFhYWJj
YWY2ZjAuLjU4OTJmNmRhMDdhNSAxMDA2NDQKLS0tIGEvYXJjaC9sb29uZ2FyY2gva2VybmVsL3Rp
bWUuYworKysgYi9hcmNoL2xvb25nYXJjaC9rZXJuZWwvdGltZS5jCkBAIC0yMTIsOSArMjEyLDcg
QEAgc3RhdGljIHN0cnVjdCBjbG9ja3NvdXJjZSBjbG9ja3NvdXJjZV9jb25zdCA9IHsKIAkucmVh
ZCA9IHJlYWRfY29uc3RfY291bnRlciwKIAkubWFzayA9IENMT0NLU09VUkNFX01BU0soNjQpLAog
CS5mbGFncyA9IENMT0NLX1NPVVJDRV9JU19DT05USU5VT1VTLAotI2lmZGVmIENPTkZJR19HRU5F
UklDX0dFVFRJTUVPRkRBWQogCS52ZHNvX2Nsb2NrX21vZGUgPSBWRFNPX0NMT0NLTU9ERV9DUFUs
Ci0jZW5kaWYKIH07CiAKIGludCBfX2luaXQgY29uc3RhbnRfY2xvY2tzb3VyY2VfaW5pdCh2b2lk
KQoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
