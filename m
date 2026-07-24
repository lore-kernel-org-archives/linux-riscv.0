Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C9FC531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uN63po2aQoiad8YaPSKit+8QGKU4CaduAoO9bxnOhro=; b=Y3119Mh/UrnJeu
	P8Tm6SFeXWYCFFGz/E7txGeOjGQgCqdRUge9rDXy40RyXnwI4gdqOjjqrOd+kTtSLF7dLkgVtdqcB
	Lds78TngXNEKCrORVS53BgkFgV6dUpBPj6wUewmNaaZiXK692IFIp1iQQ18JGrHT0MobV65qHUADh
	Nvm9X1iWI8uiV7SxeO0PMOGzXv3zK/YZIQNrq17DJP7qc7aJ4/ctsYrPw+VdYuc9G+xX8gysLKPEJ
	KaG+6TN3nFgaEWO6CdaOxWHSKSFxGuuBN6KHMe8TitOiuqPQIfxdCqaGSu0tfhkIUdMSR/LceXuHq
	5/ZTZG69sIsnVjsm2iXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6S-0000000GUJD-1MpF;
	Fri, 24 Jul 2026 13:38:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6P-0000000GUGW-1EKQ;
	Fri, 24 Jul 2026 13:38:14 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=w08vNlN/1qP0TE/LEs3JpUNTMcs0fe5tTihU2b5AIsHLb1HS2DmwuvwNS+ZTtmsOdi54hp
	j79csgdIF9NYqEjvu+hvpCC0M0ZieIdbOft2NAhkWY8BH8N+54xCKnYsAHUUcomBiiQBGi
	ooF7WNOCftD2asHsJ08FwOcWE0f3Tfy9BlVe7XeP8luZ52oY/9gfGIUSVL1glTF2v5W1K7
	h6zmgAHkwVUXVn8OXzplJxv+XBa5Csh2IW502AQ96AxvY/I2Pg6XB1CImOq43mwXB6LJdj
	yGkzb5YTRH0S662RyTldlVm+eB5DhJbl4CWwYX3qUwzfl/wDU4naKFw7VAb2Lg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=mICZxiNqacPfXk7IriXNrjH35mh19WZ8bYoPtldamZ94WReuMP7pfPY0H9svB0WbRiI01+
	RolmnmFovvUiUACQ==
Date: Fri, 24 Jul 2026 15:36:20 +0200
Subject: [PATCH v4 3/7] MIPS: csrc-r4k: Remove CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery
MIME-Version: 1.0
Message-Id: <20260724-vdso-arch-clockmodes-v4-3-ddbe447be860@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=1015;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=t3APLy9t2SZVxR8iClS2KaGCf82ju0LDxr/0aH1HIvc=;
 b=ZeqNGUZ8fvsgAE/k9e92r2SrvqOVJqmOU8TykTiEM3Ah7oL/sCvlUn+kXy3/j2iIKYkXoZkLu
 uiEZTPtRcB4CxctGflsRyedBFK6uyBO4RIB3heK52dAYfafL84lNPI9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063813_502524_F53FEF70 
X-CRM114-Status: UNSURE (   7.58  )
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
