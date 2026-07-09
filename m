Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA61C44506
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36HsO6blrpC+OaQ1gRJFD9g9HNOXQYFQhP6JBS64KXo=; b=WhOJUVZv3iNLlY
	OLd121KB06KhgG1ZuOkqYLDTBqhDKRdb/YzhdnQNZ5ttQA4+TCHnmhCRIKrNEnN8spORrUrtiaR9W
	FkvCRe9u3YG9n0jUDI9dpkBqBGumHLHoRbEvt0Y2heQlGXBdARChHLFvvM1mKpCvVaVjXPBPyxQKg
	fy86UWvPEioyDwjeaLmiFIYWOXUpwd818rDkrZaIa58E7bYtIOf9tNUlVOdBR06cYIbEWT1HuwhS9
	ySXSpSxSNCCQf8u60NsmQgmssbVPcxQvV/Nac5l8mjjzITUebyWSODmfaJ+Da4jCT52G25+JphlEe
	jC0oP3ITDxO373oFFlfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzm-00000002Bq8-0IBV;
	Thu, 09 Jul 2026 11:32:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzi-00000002Bjt-2i9T;
	Thu, 09 Jul 2026 11:32:45 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzzp3V1NULRIcEaysPzAb8Zz8VZI2+Qui09INH6ftAA=;
	b=dl/Whe90T6ve1O/3BTYidbDlixXrRSZd9phpta7c91ohla4b2Dx2E5iifStTqh2ByHAQ5Z
	tkxbt3jGRk0cuD6PhbVirPC3Szz7eXxPlSqrdeJLbeSnqR/5bykstZo7YMY8a0MqNy/DpK
	zNNKjENFd82sWWrMuLT3VJD5tVgLiIWIhJ/AqmC4KQoK/PULslB1/WFkraP5cU7W05HtPN
	G1vHUzecSCMLSTSFeNWIo2Y9F0MjFeOuMMXH21eT5OOmw4YgI0DvQXSRBiemcgdZXzME2+
	EMb7ulqTR3Qo88BKNqsQQaVvF8yVGO/tHw3MkRlwVocw7YOvNhqvyR5oVuFOOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzzp3V1NULRIcEaysPzAb8Zz8VZI2+Qui09INH6ftAA=;
	b=R0daFp2zs8PkyBEnpzUsW6sYt9fasERLxK+sCcwB8Jh2nM6cgfHoq6gVjXAKhSw4jMJWSg
	KzQu6q79L6+xZHCw==
Date: Thu, 09 Jul 2026 13:32:37 +0200
Subject: [PATCH 1/7] kbuild: support generated asm-headers in
 subdirectories
MIME-Version: 1.0
Message-Id: <20260709-vdso-arch-clockmodes-v1-1-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1604;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KQ1WIDNBrUDk8ykSofgmkt90oehDLy0q9zMVnaVz/hY=;
 b=cuha/aGlOpoUsmDaKjoWXmmeaxuYlmw0QjfAEYle7hMdcStT8E1OxpY4kQA1imhwJAbSZIj6l
 wOmqS1MP1U5Af5duBA66eQXFPP86GmfpscWeOmCAPowqjmZTP7Fdhp0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_043242_852568_5A5138E4 
X-CRM114-Status: UNSURE (   7.63  )
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
TWFrZWZpbGUuYXNtLWhlYWRlcnMKaW5kZXggOGE0ODU2ZTc0MTgwLi43NzJiNTNmZmRlYjQgMTAw
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
KSAtdHlwZSAtZCAtZW1wdHkgLWRlbGV0ZQogCiBxdWlldF9jbWRfc3lzaGRyID0gU1lTSERSICAk
QAogICAgICAgY21kX3N5c2hkciA9ICQoQ09ORklHX1NIRUxMKSAkKHN5c2hkcikgXApAQCAtNzQs
OCArNzMsOCBAQCBhbGw6ICQoZ2VuZXJpYy15KSAkKHN5c2NhbGwteSkKIAkkKGlmICQodW53YW50
ZWQpLCQoY2FsbCBjbWQscmVtb3ZlKSkKIAlAOgogCi0kKG9iaikvJS5oOiAkKHNyY3RyZWUpLyQo
Z2VuZXJpYykvJS5oCi0JJChjYWxsIGNtZCx3cmFwKQorJChvYmopLyUuaDogJChzcmN0cmVlKS8k
KGdlbmVyaWMpLyUuaCBGT1JDRQorCSQoY2FsbCBmaWxlY2hrLHdyYXApCiAKICQob2JqKS91bmlz
dGRfJS5oOiAkKHN5c2NhbGx0YmwpICQoc3lzaGRyKSBGT1JDRQogCSQoY2FsbCBpZl9jaGFuZ2Vk
LHN5c2hkcikKCi0tIAoyLjU1LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
