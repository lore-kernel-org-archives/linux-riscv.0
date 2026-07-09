Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174FFC44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khopnCZmLiEDVH2UtNXCb8tpa1IZkYbkG37uljc7DcY=; b=zo2Z+q5xk8tC4x
	8EujoA6xiaiqDiC8r5RqIpgdPAEsBNpsSG8tf0ldSDxPAaZSpbCQaIE8nuq52z+h2tYfDLAnGc5yU
	v3QialHd5huxgJvi9RUtFvuNwKOVqVnq/Nrypd/mYZYc5eFgMA5+CKx/CkEbaeWSfPf6LbgzZr5iY
	5234BN8TUzBuZrX5lJDmMNInuTwJeNFLf4onBZnkpQIxKkXVhR/SEK0eud0QTQ5ojP9e0m0+8umGN
	mSrjwJaZNmcSETrLN8PZyw5buNjjIDChlMTmAZR76CfpEHogMQbUBjCwCgZtYbwQqk1lI6fhfRm7u
	OfHKU5cktmMfAqmxJLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzt-00000002C3L-2Jiu;
	Thu, 09 Jul 2026 11:32:53 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzm-00000002Bp9-348j;
	Thu, 09 Jul 2026 11:32:49 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=js0vaP5nbNwcNIYrCXst9vVmG9tcENf2qeLGcWeiwxA=;
	b=G1B5E6g1lV0WBctrCeAuI2EktZx6NZNOCwaU4W+HwWbS+gvAsponEz1VMyQ8tM40Hc8owF
	+x5uQMIevWKuDtG7FF2RbnPweHb1b0+u7UGRz4RuCN5pKEzPa7ZgAQB3vRWEaYrG1ZfEcd
	huGAFbrT50h4C6acrIhMA6hAirN0klf2sC1OPGwPHQItJQonDNKSvIOQ62djPQJiOQKrZZ
	U6k8VZY9wKLYQZONhdskn+yM2kiUn2rc/aEWr18ieOE5DSr1WJAHa6iZ1RDRcScByCCFQZ
	Xd6y59j2a7OHEsFmjwqJeRHL83aD712bCkozDQotGzUtGi3XqdLPObXOzMnktw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=js0vaP5nbNwcNIYrCXst9vVmG9tcENf2qeLGcWeiwxA=;
	b=cwSqdujTT7iDvRMcmoMRrwAXfht7s86XKdpgPR8idw5KvHg0klV/uFbi10aLdEX93n5iPm
	w+zwV6MbyExus/Ag==
Date: Thu, 09 Jul 2026 13:32:42 +0200
Subject: [PATCH 6/7] clocksource/drivers/timer-riscv: Replace
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
MIME-Version: 1.0
Message-Id: <20260709-vdso-arch-clockmodes-v1-6-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1080;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=7G4NMoLshPcdVswq+VZJCTeRBiPlUiYrF8fwlrRj/uk=;
 b=+3rICIuTC6LYbv8a3J2iDAsVddreeZXz8SonYTwvPP3IpMLBejhyOnRPxIEPY1IWeVWIRnUod
 AqapUTyoS+sA1bO2X6bjVrHoXXReK7U+ezdW0CvqFmzOuexzTPSsCgr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_043246_941674_EBDC1567 
X-CRM114-Status: UNSURE (   8.58  )
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

Tm93IHRoYXQgdGhlcmUgaXMgYSBkdW1teSBkZWNsYXJhdGlvbiBvZiBWRFNPX0NMT0NLTU9ERV9B
UkNIVElNRVIsCmV2ZW4gaWYgbm8gdkRTTyBpcyBidWlsdCwgdGhlIHVnbHkgaWZkZWZmZXJ5IGNh
biBiZSByZXBsYWNlZCB3aXRoCmEgY2xlYW5lciBJU19FTkFCTEVEKCkgY2hlY2suCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5k
ZT4KLS0tCiBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCA3ICsrLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1yaXNjdi5jCmluZGV4IGNmYzRkODNjNDJjMC4uODJiZDM4MGIzZGRhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKKysrIGIvZHJpdmVycy9jbG9j
a3NvdXJjZS90aW1lci1yaXNjdi5jCkBAIC05OCwxMSArOTgsOCBAQCBzdGF0aWMgc3RydWN0IGNs
b2Nrc291cmNlIHJpc2N2X2Nsb2Nrc291cmNlID0gewogCS5tYXNrCQk9IENMT0NLU09VUkNFX01B
U0soNjQpLAogCS5mbGFncwkJPSBDTE9DS19TT1VSQ0VfSVNfQ09OVElOVU9VUywKIAkucmVhZAkJ
PSByaXNjdl9jbG9ja3NvdXJjZV9yZHRpbWUsCi0jaWYgSVNfRU5BQkxFRChDT05GSUdfR0VORVJJ
Q19HRVRUSU1FT0ZEQVkpCi0JLnZkc29fY2xvY2tfbW9kZSA9IFZEU09fQ0xPQ0tNT0RFX0FSQ0hU
SU1FUiwKLSNlbHNlCi0JLnZkc29fY2xvY2tfbW9kZSA9IFZEU09fQ0xPQ0tNT0RFX05PTkUsCi0j
ZW5kaWYKKwkudmRzb19jbG9ja19tb2RlID0gSVNfRU5BQkxFRChDT05GSUdfR0VORVJJQ19HRVRU
SU1FT0ZEQVkpID8KKwkJCQlWRFNPX0NMT0NLTU9ERV9BUkNIVElNRVIgOiBWRFNPX0NMT0NLTU9E
RV9OT05FLAogfTsKIAogc3RhdGljIGludCByaXNjdl90aW1lcl9zdGFydGluZ19jcHUodW5zaWdu
ZWQgaW50IGNwdSkKCi0tIAoyLjU1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
