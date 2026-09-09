Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE3AC79FBD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lC4MT2AQiSpnLBTYaKt5YJK55xTrSQo6CAQaGCVZweA=; b=dCF8JUmMy/8pMG
	XTR3WiHWv6EsgQi9Gcz5vuI7jhxswa09RCW3pwF+5Ic0Gwg1BceJG/xGVyth9dISGwu/7pDIBnLgu
	plMekjINAJ16WyjR6O5ZH4vgQ6aA6JccV2SAPFYf0pmMDjzZYet3PpDpHW+aF7YZiQYTojLsjszQ+
	WZPLDEAX1dF8txRImOvHv1yYEYrM23iwTSRa66LA0vmLnCAiYzoSly5kaKQOKsCTtBxr1EkBSBsm5
	43RNw6UuBEWed229XuAAGxe2k7aayHjaX0f5W6O9sSm0FitWl1Xe4TvuCsMkOexJus/yA3Sz2VFMn
	9mw0MZfusaIziJimMgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1y-0000000BATO-3LI4;
	Wed, 09 Sep 2026 08:51:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1h-0000000BACN-0kdq;
	Wed, 09 Sep 2026 08:51:30 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2Fb4eCjj+zAUQPiYalGdgIWLIgi0C9tMG4Wk6//rL0=;
	b=eqP8ughIWhO/zWHJqIcpnE1zH5Z6Uff68ylB3fNburq8lG10nepXJX4mazfWoFN07g/dX7
	5wWpfbwXq9syptiaqVr3s9+qB4IaIQrVCTAykoJ3QyyS89SBjIELA0HirxAHeEao/1LMrn
	mYJ99pvmZ+Cf8lKwtDGgAIK2wgT6AyFSHcC68XUyJBj3+gzEtXFKKntUgyQqG8N1vRRiPb
	DHx18kQ5moP+Qf8QI/7uM00WxhtbVuhIFqEZJMDAJy9seLj+k7Uvfcn2IZ5FrBhRjdrWpp
	6RfkROg5QYm6c7U22E17G5cR6V1fJGvzVdEn0cSjxT4h2w+oBW9Z6HQZd5kfkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2Fb4eCjj+zAUQPiYalGdgIWLIgi0C9tMG4Wk6//rL0=;
	b=jVX4AN8Oo8E9jDY7LdgbDqTks4Y9ztR5jIkatGeWIeYHKeeAd8NyDi0CnbjzwTRgsKH/kz
	dZEpI1oJQvAAeWCQ==
Date: Wed, 09 Sep 2026 10:51:19 +0200
Subject: [PATCH 06/15] x86/vdso: Move vDSO page definitions to asm/vdso.h
MIME-Version: 1.0
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-6-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1480;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=9yrup1COiXMcfGgNW5FQUG/LXYB+NuTSGZ1TprnDeUQ=;
 b=8lsoI5rYTpgQdz12XqHek0bQOa8lDAtlAIBJKnJGQxBA5RZp/X59vjJa3XzdUUOBGktVHG8Xt
 hROTC4EoOEOABpAp1sl+WEhhmKISJWSG/lG/6la5vX3KZWy9RTginJR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015129_369171_C55331F9 
X-CRM114-Status: UNSURE (   6.58  )
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

TW9zdCBhcmNoaXRlY3R1cmVzIGRlZmluZSB0aGUgdkRTTyBwYWdlIG1hY3JvcyBpbiBhc20vdmRz
by5oLgoKQWxpZ24gdGhlIHg4NiBoZWFkZXJzLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOf
c2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogYXJjaC94ODYvaW5j
bHVkZS9hc20vdmRzby5oICAgICAgICAgIHwgNyArKysrKysrCiBhcmNoL3g4Ni9pbmNsdWRlL2Fz
bS92ZHNvL3ZzeXNjYWxsLmggfCA3IC0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3Zkc28uaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28uaAppbmRleCA0ZTczNTE1OGMxYjIu
LjA3MWU0YTI2MmI1MCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby5oCisr
KyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28uaApAQCAtNiw2ICs2LDEzIEBACiAjaW5jbHVk
ZSA8bGludXgvbGlua2FnZS5oPgogI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KIAorI2RlZmluZSBf
X1ZEU09fUEFHRVMJNgorCisjZGVmaW5lIFZEU09fTlJfVkNMT0NLX1BBR0VTCTIKKyNkZWZpbmUg
VkRTT19WQ0xPQ0tfUEFHRVNfU1RBUlQoX2IpCSgoX2IpICsgKF9fVkRTT19QQUdFUyAtIFZEU09f
TlJfVkNMT0NLX1BBR0VTKSAqIFBBR0VfU0laRSkKKyNkZWZpbmUgVkRTT19QQUdFX1BWQ0xPQ0tf
T0ZGU0VUCTAKKyNkZWZpbmUgVkRTT19QQUdFX0hWQ0xPQ0tfT0ZGU0VUCTEKKwogI2lmbmRlZiBf
X0FTU0VNQkxFUl9fCiAKICNpbmNsdWRlIDxsaW51eC9tbV90eXBlcy5oPgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20vdmRzby92c3lzY2FsbC5oCmluZGV4IDU3NTk4ZGI4NzYzYi4uNjVkMTBmNGNjNzE4IDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKKysrIGIvYXJjaC94
ODYvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oCkBAIC0yLDEzICsyLDYgQEAKICNpZm5kZWYg
X19BU01fVkRTT19WU1lTQ0FMTF9ICiAjZGVmaW5lIF9fQVNNX1ZEU09fVlNZU0NBTExfSAogCi0j
ZGVmaW5lIF9fVkRTT19QQUdFUwk2Ci0KLSNkZWZpbmUgVkRTT19OUl9WQ0xPQ0tfUEFHRVMJMgot
I2RlZmluZSBWRFNPX1ZDTE9DS19QQUdFU19TVEFSVChfYikJKChfYikgKyAoX19WRFNPX1BBR0VT
IC0gVkRTT19OUl9WQ0xPQ0tfUEFHRVMpICogUEFHRV9TSVpFKQotI2RlZmluZSBWRFNPX1BBR0Vf
UFZDTE9DS19PRkZTRVQJMAotI2RlZmluZSBWRFNPX1BBR0VfSFZDTE9DS19PRkZTRVQJMQotCiAj
aWZuZGVmIF9fQVNTRU1CTEVSX18KIAogI2luY2x1ZGUgPHZkc28vZGF0YXBhZ2UuaD4KCi0tIAoy
LjU1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
