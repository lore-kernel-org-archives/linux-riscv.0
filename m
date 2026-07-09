Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32234C44506
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/kOYeo5a5HggVwmSwm/N3WQWnyfyA2MB55DetDmWBk=; b=D3eGIMfSraXvFp
	6DgvNZ7zpdtcSpNlPLuqhfM+9wro89vdKJV0hQzb3D3CllTCqbyJX1zJuMNYuUp/TZ5I6AYjHgMAx
	GKU68GC7159FcdL+aFvhIOzISF/6P9ZrlCBvlounlI9ipPrKXIKqaRGnvdd8wtzvyF1lhT23bqUua
	rIWo/+e0TBFve4L/pPLiT2X94e9Wl02mEQcUzw7Sy/TilIVHHfKZcppJaTmOY6JVUrFeV25d4WIzs
	BDkiUiI6JOxM/zQ6vNgt3n09ZerDlhZKyFg7TO/PAcG2ik/2/wiDv6E73qoRWA3uhBMJwCB2RKEtk
	GDW6kHUNyiPSl7fm0L6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzs-00000002C0b-13Hs;
	Thu, 09 Jul 2026 11:32:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzo-00000002Bsd-3FHl;
	Thu, 09 Jul 2026 11:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zk86msNEN/gnWpX9C3rxNSV4hOokUpTWZRuN8F96/Nc=; b=RvklxzABcTebWV+rW/sabww0jk
	2mNvBlwySshumIDeBCqyfti7pJzkgCT2YSmJz3h8KracR/gJJcdQW5ZDjiyk1VZJGx86Z2tyITDqv
	n9NM/Nf9rzpiyNb7rI059kAxc1CxEOpGm1+KEvoQpA9bWy8KdS55J/pD/HH4x/xooBqdAUDUGeO1d
	khS37B1ufC0cCm9hWQiaQY3mQ8rA29mxchY6LGmLX0Ko5NKTulzIfAAm3wItwxAKkntQINtiM0ZJf
	GekSZlHP1sNrOuGW2TnSsw/H2wHjKPlUxsPyzfl37Dp0sdCMSw3lJOfjNKm7c1Kfu2+6rwl/4DGM3
	FglBecMg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whmzk-000000098xW-1l9A;
	Thu, 09 Jul 2026 11:32:46 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zk86msNEN/gnWpX9C3rxNSV4hOokUpTWZRuN8F96/Nc=;
	b=3Tlr8lwjEQMKUWzx2INzXGyqzMn7U7cffmZUVyqa4EabPGgOlth6pNXkh69SdZD9IyTuva
	P6LcVPAyvPH3BR3XWD80JId7SB7vxgjFqLOoFYZ96eBUfQJ+7qbelhC2Unbdz/e9/LRmRS
	h3tZILA4lKwjjPrtBBwTmXGFxOb/6mO5Ofba3hxsKasNgfNb4LCABYp2ii3FDuD2zF/BY0
	8L8WSMyub4zU02TewatPe06w2I5TmQ7U4+JVhko2v2LVy6s7TOTsc7gkdIYwZnPzIMcrB7
	77BbGmtoZSIrFl5xdnSY3IvvMH6O5q2zThMK3fn7WxLCpVpOu8Xa1fJtP2NnVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zk86msNEN/gnWpX9C3rxNSV4hOokUpTWZRuN8F96/Nc=;
	b=1odo7jSNfz5NW/HvHzWtgVuuOaD6TIOwysekv2u0iL+FsKAjM1a56kySZs9tXkR5a3FEY/
	9DyNKWP5h645jWDg==
Date: Thu, 09 Jul 2026 13:32:38 +0200
Subject: [PATCH 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
MIME-Version: 1.0
Message-Id: <20260709-vdso-arch-clockmodes-v1-2-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1850;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Xax8qgR+SGGeOkJrm9ZK8P3x7lKX/ptqrxvCpMAlK6g=;
 b=46BCx+9PphfTRayVEAxbIQeVvMzW/0LWqNLBEcXQOqP9X9mObQV+e21QCB2KfVXaitBboNNYq
 iSHkBBI2pMPDE6SOc1YgmV5vYEtwJ8WyMhnDMk7paHoHTHPKge8t1Pz
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_123244_702744_CF8041C5 
X-CRM114-Status: GOOD (  11.02  )
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

U29tZSBjb2RlLCBmb3IgZXhhbXBsZSBjbG9ja3NvdXJjZSBkcml2ZXJzLCBtYXkgd2FudCB0byB1
c2UgdGhlIHZEU08KY2xvY2ttb2RlIGNvbnN0YW50cyBldmVuIHdoZW4gQ09ORklHX0dFTkVSSUNf
R0VUVElNRU9GREFZPW4uCkJ1dCB0aGUgc3ltYm9scyBhcmUgY29tcGxldGVseSBoaWRkZW4gaW4g
dGhhdCBjYXNlLCBtYWtpbmcgdWdseQppZmRlZmZlcnkgbmVjZXNzYXJ5LgoKUHJvdmlkZSB1bmxp
bmthYmxlIGR1bW15IGRlZmluaXRpb25zLiBUaGVzZSBjYW4gYmUgdXNlZCB3aXRoCklTX0VOQUJM
RUQoQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZKS4KCkFzIG5vdCBhbGwgYXJjaGl0ZWN0dXJl
cyBwcm92aWRlIGFzbS92ZHNvL2Nsb2Nrc291cmNlLmgsCnByb3ZpZGUgYW4gZW1wdHkgc3R1YiBp
biBhc20tZ2VuZXJpYyBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBpbmNsdWRlL2FzbS1nZW5lcmlj
L0tidWlsZCAgICAgICAgICAgICB8IDEgKwogaW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNvL2Nsb2Nr
c291cmNlLmggfCAwCiBpbmNsdWRlL3Zkc28vY2xvY2tzb3VyY2UuaCAgICAgICAgICAgICB8IDcg
KysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVpbGQgYi9pbmNsdWRlL2FzbS1n
ZW5lcmljL0tidWlsZAppbmRleCAxNWRmOWRjYjQyYTUuLjJiYzAwYzY3ZGM1NCAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVpbGQKKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9L
YnVpbGQKQEAgLTYyLDYgKzYyLDcgQEAgbWFuZGF0b3J5LXkgKz0gdG9wb2xvZ3kuaAogbWFuZGF0
b3J5LXkgKz0gdHJhY2VfY2xvY2suaAogbWFuZGF0b3J5LXkgKz0gdWFjY2Vzcy5oCiBtYW5kYXRv
cnkteSArPSB1bndpbmRfdXNlci5oCittYW5kYXRvcnkteSArPSB2ZHNvL2Nsb2Nrc291cmNlLmgK
IG1hbmRhdG9yeS15ICs9IHZlcm1hZ2ljLmgKIG1hbmRhdG9yeS15ICs9IHZnYS5oCiBtYW5kYXRv
cnkteSArPSB2aWRlby5oCmRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL3Zkc28vY2xv
Y2tzb3VyY2UuaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby9jbG9ja3NvdXJjZS5oCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZTY5ZGUyOWJiMmQxCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL3Zkc28vY2xvY2tzb3VyY2UuaCBiL2luY2x1ZGUvdmRzby9jbG9ja3NvdXJj
ZS5oCmluZGV4IGM2ODJlN2M2MDI3My4uNjNlZThjNGVhMTVjIDEwMDY0NAotLS0gYS9pbmNsdWRl
L3Zkc28vY2xvY2tzb3VyY2UuaAorKysgYi9pbmNsdWRlL3Zkc28vY2xvY2tzb3VyY2UuaApAQCAt
NCw5ICs0LDEyIEBACiAKICNpbmNsdWRlIDx2ZHNvL2xpbWl0cy5oPgogCi0jaWZkZWYgQ09ORklH
X0dFTkVSSUNfR0VUVElNRU9GREFZCiAjaW5jbHVkZSA8YXNtL3Zkc28vY2xvY2tzb3VyY2UuaD4K
LSNlbmRpZiAvKiBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkgKi8KKworI2lmICFJU19FTkFC
TEVEKENPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWSkgJiYgZGVmaW5lZChWRFNPX0FSQ0hfQ0xP
Q0tNT0RFUykKKy8qIFVubGlua2FibGUgZHVtbXkgc3R1YnMgKi8KK2V4dGVybiBpbnQgVkRTT19B
UkNIX0NMT0NLTU9ERVM7CisjZW5kaWYKIAogZW51bSB2ZHNvX2Nsb2NrX21vZGUgewogCVZEU09f
Q0xPQ0tNT0RFX05PTkUsCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
