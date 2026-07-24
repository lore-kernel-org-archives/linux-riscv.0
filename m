Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7F0C531F9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0J6SS1DqZxtTSmc5GeyKwq+EnnX8GKDna7+6H0NIrU=; b=zX/feKF8/Vt586
	Ad3Cqhc6/d9acLDZNaExHNynBs60Uoe6yVH5qumPThLEXUICk/uie+1eMk9EnOFbWIK/QFgeQCiBH
	gS/SRoZZ5m3KJCtNjxG6HLumoXpC+4WifkdG7sGnSD/Yql0AW5tLgoH2MaMfvFZrocNRna8Uw+5T4
	tp94vE8763PGtAtUrk5QiPmZE5nBjyzrWz58qzZ38I+ImFrsOZN96kH+y1zQzLZoKw1fxpaqwPkoI
	1kUbkLi4X7YDfO/lMEaPx+F24UnStiWOgChJxwfiTDzWYszSu2j1495u0jPbGFDGXIlzAVl7eE8DE
	XUsJI1dgaGVxuX78AONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6S-0000000GUJ5-0qwv;
	Fri, 24 Jul 2026 13:38:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6P-0000000GUGV-1E0b;
	Fri, 24 Jul 2026 13:38:14 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k84lHI02AeLCB93IudPhY7UADh7YGZV8FCgpA+ZF7P0=;
	b=BrLLO1tjYhSGwyDAWasIuyNQDXJsuyGklSui5fMZONsKkP1m5sXLh5TEhyFkEwKd5+m3y2
	fzQAc+LlO7nGtNN0ss6VDCzqr3zg0hJjr2Pb7w/keysNILWib9LWJ+eidE8UnlW9VpDnX1
	Qlo7ri+aLG1aKgl6IngIkvzrqz5IFXwm2KRokPKWktQh8+PtJvPs9uzn9+YtK/0Ft/hZpU
	WfOxgGgAxQ1IT4euvdi9YJl9dB4bTtaD/+Z0FkT8cWxd5I2pKlHu1+YsXYRViVO0av0TZI
	P7XUKIxnKoTfjDHLRTJqeanyw4JJw9dunvC8WU2/02aGdPKYQwDeBBCuaV/3nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k84lHI02AeLCB93IudPhY7UADh7YGZV8FCgpA+ZF7P0=;
	b=F1iGaQnCRfR4UqHuVk9ZmdTRJMF80i+Fz/zJGdx/+NAq/m/Y/2SFARDiSyIpBG4x5Ncxup
	Uxil6gsiEIbWfyDA==
Date: Fri, 24 Jul 2026 15:36:18 +0200
Subject: [PATCH v4 1/7] kbuild: support generated asm-headers in
 subdirectories
MIME-Version: 1.0
Message-Id: <20260724-vdso-arch-clockmodes-v4-1-ddbe447be860@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=1603;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Zev+SfOmyEH9fuyzl0FmsV9VVq9RYb3UzolE/5lna3k=;
 b=7LSqC528B3expK5DAr0ccLIPXQLZl0CZ+lRD0g98zRXGLp+iYu3EIKcskmML7CJrbWN3Eagwj
 y/hRMY88MKYAQn0vWRro12snAVO4gtR1Q/2LpUB8ZTb256tJSvFdE/x
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063813_499818_C9274C1A 
X-CRM114-Status: UNSURE (   7.68  )
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

RXh0ZW5kIHRoZSBhc20taGVhZGVyIHN0dWIgZ2VuZXJhdGlvbiB0byBhbHNvIGhhbmRsZSBzdWJk
aXJlY3Rvcmllcy4KQW4gdXBjb21pbmcgdmRzby8gaGVhZGVyIHJlZmFjdG9yaW5nIHJlcXVpcmVz
IHRoaXMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZT4KLS0tCiBzY3JpcHRzL01ha2VmaWxlLmFzbS1oZWFkZXJzIHwgMTEg
KysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9NYWtlZmlsZS5hc20taGVhZGVycyBiL3NjcmlwdHMv
TWFrZWZpbGUuYXNtLWhlYWRlcnMKaW5kZXggOGE0ODU2ZTc0MTgwLi5iMzg5MzEzMTRhZDcgMTAw
NjQ0Ci0tLSBhL3NjcmlwdHMvTWFrZWZpbGUuYXNtLWhlYWRlcnMKKysrIGIvc2NyaXB0cy9NYWtl
ZmlsZS5hc20taGVhZGVycwpAQCAtNDgsMTQgKzQ4LDEzIEBAIHN5c2NhbGwteSAgIDo9ICQoYWRk
cHJlZml4ICQob2JqKS8sICQoc3lzY2FsbC15KSkKIGdlbmVyYXRlZC15IDo9ICQoYWRkcHJlZml4
ICQob2JqKS8sICQoZ2VuZXJhdGVkLXkpKQogCiAjIFJlbW92ZSBzdGFsZSB3cmFwcGVycyB3aGVu
IHRoZSBjb3JyZXNwb25kaW5nIGZpbGVzIGFyZSByZW1vdmVkIGZyb20gZ2VuZXJpYy15Ci1vbGQt
aGVhZGVycyA6PSAkKHdpbGRjYXJkICQob2JqKS8qLmgpCitvbGQtaGVhZGVycyA6PSAkKHNoZWxs
IHRlc3QgLWQgJChvYmopICYmIGZpbmQgJChvYmopIC1uYW1lICouaCkKIHVud2FudGVkICAgIDo9
ICQoZmlsdGVyLW91dCAkKGdlbmVyaWMteSkgJChnZW5lcmF0ZWQteSkgJChzeXNjYWxsLXkpLCQo
b2xkLWhlYWRlcnMpKQogCi1xdWlldF9jbWRfd3JhcCA9IFdSQVAgICAgJEAKLSAgICAgIGNtZF93
cmFwID0gZWNobyAiXCNpbmNsdWRlIDxhc20tZ2VuZXJpYy8kKi5oPiIgPiAkQAorZmlsZWNoa193
cmFwID0gZWNobyAiXCNpbmNsdWRlIDxhc20tZ2VuZXJpYy8kKi5oPiIKIAogcXVpZXRfY21kX3Jl
bW92ZSA9IFJFTU9WRSAgJCh1bndhbnRlZCkKLSAgICAgIGNtZF9yZW1vdmUgPSBybSAtZiAkKHVu
d2FudGVkKQorICAgICAgY21kX3JlbW92ZSA9IHJtIC1mICQodW53YW50ZWQpOyBmaW5kICQob2Jq
KSAtdHlwZSBkIC1lbXB0eSAtZGVsZXRlCiAKIHF1aWV0X2NtZF9zeXNoZHIgPSBTWVNIRFIgICRA
CiAgICAgICBjbWRfc3lzaGRyID0gJChDT05GSUdfU0hFTEwpICQoc3lzaGRyKSBcCkBAIC03NCw4
ICs3Myw4IEBAIGFsbDogJChnZW5lcmljLXkpICQoc3lzY2FsbC15KQogCSQoaWYgJCh1bndhbnRl
ZCksJChjYWxsIGNtZCxyZW1vdmUpKQogCUA6CiAKLSQob2JqKS8lLmg6ICQoc3JjdHJlZSkvJChn
ZW5lcmljKS8lLmgKLQkkKGNhbGwgY21kLHdyYXApCiskKG9iaikvJS5oOiAkKHNyY3RyZWUpLyQo
Z2VuZXJpYykvJS5oIEZPUkNFCisJJChjYWxsIGZpbGVjaGssd3JhcCkKIAogJChvYmopL3VuaXN0
ZF8lLmg6ICQoc3lzY2FsbHRibCkgJChzeXNoZHIpIEZPUkNFCiAJJChjYWxsIGlmX2NoYW5nZWQs
c3lzaGRyKQoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
