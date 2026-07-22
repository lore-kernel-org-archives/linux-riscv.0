Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8877CC44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 07:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtXmrliORrYdfMaLK5WWs1XC0kDpSWafivVgHscvsnM=; b=CTv7+gHr1vFkGG
	eLcu4HD/U8zt6CjNBF1QXxKuqf4hy1ShPf/1b9cR4zIaf7Rq83oPfVWQTKKOgUuh1Zq5QQOsNyXxq
	bRx8PGHHDAusI2NFVs4uKItwNynDprHHcCkFF1DeOdWufQ3xeX9JLkfeoWPOYrwjGzopdvOdPqObx
	gKCut3HrGMC698fLjQ5P2qXH4tfWxG9Ubke4fNlGUUaXfJB7R7WUyUNnSR87lQQrMpaYQbnoaiOxw
	90i5bL4frii1lY7qKxmY3oTCmUZbARDybkKoVHYDNMyqyji8anC2RWL+pB/uv5kZ/ZcXSudVHVzsB
	bN12Z38gaHSwl19ob5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmW-0000000BAWi-1jga;
	Wed, 22 Jul 2026 07:54:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRmK-0000000BAIF-1GUK;
	Wed, 22 Jul 2026 07:54:10 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784706845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNMoDfSuSxJw6SemBX4XpeIAZF6FAMIZenhTrRJVbbc=;
	b=twHNINz4A2SgJbaSpIoLpDzTN7YT8azPLRBbltI/J5f5JMFChDr8oKpgh4SphRI5q0chFt
	mIPt+MQ2aRzIz07nxSovXnyMXPg1KvtHBtf4JmSzpQfnA04J1OjCyPeWCo8P5hajJ2WY+E
	Thci06srHo7uC+ZeBH0kZyOb5GpxJUuMxCk8aFYNGUNAYFFOhp3eQVvY7quO9bhPE7bk7j
	/eyh5hftII79ZkBHyq3Er3e8v4JqrrXkDg97jlTR82zs9vf7rnReVoqyVVzecVDyyZyhtu
	EIb6A5EgWn6Saho2Fr9g3YE2lWq7KZq0PnQkaRxWjP6SkiT+w9bSY3EkPSYH+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784706845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNMoDfSuSxJw6SemBX4XpeIAZF6FAMIZenhTrRJVbbc=;
	b=lB1XSUsjBnCXqApB7W0QcRzaNLHwWXJ95tO/El8sb5mxMywWYDiELO2wOTmTzx2LdDsz8i
	VxPjEIma+g3/LRDw==
Date: Wed, 22 Jul 2026 09:53:31 +0200
Subject: [PATCH v3 5/7] clocksource/drivers/arm_arch_timer: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
MIME-Version: 1.0
Message-Id: <20260722-vdso-arch-clockmodes-v3-5-4c5753191cc4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784706840; l=1164;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=lW6xuPaawuRjNMiAq3NjJ0vYClBA5grQp8KXYE1QcYY=;
 b=NRifUvpmMshkko5XZJtE/zr5zJOM6EqTDxL7DRbDbjNzbeJRv7QVDtCV+e1/53nNIfaD2atG2
 wBt65asPzndDT9QEKpNeCrDUgSOjQCMFhMZAk9SKEfv5di8/SfedsSz
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_005408_548533_014313F2 
X-CRM114-Status: UNSURE (   7.99  )
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

Tm93IHRoYXQgdGhlcmUgaXMgYSBkZWZpbml0aW9uIG9mIFZEU09fQ0xPQ0tNT0RFX0FSQ0hUSU1F
UgpldmVuIGlmIG5vIHZEU08gaXMgYnVpbHQsIHRoZSB1Z2x5IGlmZGVmZmVyeSBjYW4gYmUgcmVt
b3ZlZC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvY2xvY2tzb3VyY2UvYXJtX2FyY2hfdGltZXIu
YyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbG9ja3NvdXJjZS9hcm1fYXJjaF90aW1lci5jIGIvZHJpdmVycy9jbG9ja3NvdXJj
ZS9hcm1fYXJjaF90aW1lci5jCmluZGV4IDRhZGY3NTY0MjNkZS4uYTUxNTdkOGE4YTEzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL2FybV9hcmNoX3RpbWVyLmMKKysrIGIvZHJpdmVy
cy9jbG9ja3NvdXJjZS9hcm1fYXJjaF90aW1lci5jCkBAIC01NiwxMSArNTYsNyBAQCBzdGF0aWMg
c3RydWN0IGNsb2NrX2V2ZW50X2RldmljZSBfX3BlcmNwdSAqYXJjaF90aW1lcl9ldnQ7CiBzdGF0
aWMgZW51bSBhcmNoX3RpbWVyX3BwaV9uciBhcmNoX3RpbWVyX3VzZXNfcHBpIF9fcm9fYWZ0ZXJf
aW5pdCA9IEFSQ0hfVElNRVJfVklSVF9QUEk7CiBzdGF0aWMgYm9vbCBhcmNoX3RpbWVyX2Mzc3Rv
cCBfX3JvX2FmdGVyX2luaXQ7CiBzdGF0aWMgYm9vbCBhcmNoX2NvdW50ZXJfc3VzcGVuZF9zdG9w
IF9fcm9fYWZ0ZXJfaW5pdDsKLSNpZmRlZiBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkKIHN0
YXRpYyBlbnVtIHZkc29fY2xvY2tfbW9kZSB2ZHNvX2RlZmF1bHQgPSBWRFNPX0NMT0NLTU9ERV9B
UkNIVElNRVI7Ci0jZWxzZQotc3RhdGljIGVudW0gdmRzb19jbG9ja19tb2RlIHZkc29fZGVmYXVs
dCA9IFZEU09fQ0xPQ0tNT0RFX05PTkU7Ci0jZW5kaWYgLyogQ09ORklHX0dFTkVSSUNfR0VUVElN
RU9GREFZICovCiAKIHN0YXRpYyBjcHVtYXNrX3QgZXZ0c3RybV9hdmFpbGFibGUgPSBDUFVfTUFT
S19OT05FOwogc3RhdGljIGJvb2wgZXZ0c3RybV9lbmFibGUgX19yb19hZnRlcl9pbml0ID0gSVNf
RU5BQkxFRChDT05GSUdfQVJNX0FSQ0hfVElNRVJfRVZUU1RSRUFNKTsKCi0tIAoyLjU1LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
