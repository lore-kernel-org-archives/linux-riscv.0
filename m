Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC8FC531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2eY+eaHpL+SBeifswqp4vGyDI0SoKkNrTOKffcc9hM=; b=NWpkDci7qQxgi5
	Ftk45O8aHfHL7crmTWmTZvijbv6h9wweBhnyAbK5G8gNxqdXrVKUJIDhS/QfrC7VhxpB0uZqI/2u2
	Wk4Z2Za2Ic1tx4WftvPqRJhvZ1brI5Us82eoHOEO+8U7Yka7l7lne+RrH3KfOI3T76bWizxCWt84y
	3hAT/MgGLQysGk+94qu+HOxv/0KTWHCwX/lAYJWz5Dd6GaDJki+RBOXcSbO/KFJ3GLWllqd4XTuA6
	E5Fe98+vfAqRSbwl1WV58nMNrQJhii19uzGrUxoDorNBsJNjKez9GUb9IgsuPG2u3dbZAEZI3egHP
	8ePh3FlLSb95V9VGcRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6g-0000000GUP4-2VCD;
	Fri, 24 Jul 2026 13:38:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6P-0000000GUGY-1DF0;
	Fri, 24 Jul 2026 13:38:15 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wy4A5Bpkj2zzKdn6eNsWOzDqtG3uGM/7aAgamplxzrs=;
	b=2U8jilIgSOX2MesW1TqFhZVOcZum0yVR+Gd7Zq27fM1Y5Bl5046LD6QTN61G5WhM56lgDT
	cN3YkYdSKhGvl+Sn07+Viosz01xADZp6v79ssYcuxuSsQxOajv6G/Nx4Ww6sXfKQXSh8K6
	MxSZ9gi+ZI1RMgMESPFM3ar8injy3V1AKseq5y36/LW/mhTgFI/OX789GubXKnh+cvEstG
	RQT+XEDqpQvQKhqzQpwJjiMmBz2ATyB7r4xoCliD5SyUFRlWnUB+vumNCKNSHbuyhCgu0X
	VP3Sq5QTxIJ/aL45iaoMxxXhwSSdEql5B5GhbWoqyyh5A2IQ2GrgRpKvs+ttCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wy4A5Bpkj2zzKdn6eNsWOzDqtG3uGM/7aAgamplxzrs=;
	b=Q1F31dVhel6UUSlIPpjaopNSvozk4hIYscfNtC1KH/KwTte+yVAJaOSrOKmhQF3b9F4xR2
	sEAk5FUXN35py2CA==
Date: Fri, 24 Jul 2026 15:36:21 +0200
Subject: [PATCH v4 4/7] clocksource/drivers/mips-gic-timer: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
MIME-Version: 1.0
Message-Id: <20260724-vdso-arch-clockmodes-v4-4-ddbe447be860@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=811;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=iYdmmwYnitqCJzJDOgChDbBElLI/0ThiAUZVrCungs4=;
 b=X7Y7/vKfKKbTG+YhMGCzch0cwqw4NfwBkOT+/8sZgEEsO4MMp/0iULjNfrCHGytfA0BAf9G/y
 h6kcR+C8LhjBIiKCio3Jdse0pQ2Y2+4iTSTPHZ3GR7STeAW5PDD3wYG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063813_503008_A3D6CC3A 
X-CRM114-Status: UNSURE (   8.17  )
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

Tm93IHRoYXQgdGhlcmUgaXMgYSBkZWZpbml0aW9uIG9mIFZEU09fQ0xPQ0tNT0RFX0dJQyBldmVu
IGlmIG5vCnZEU08gaXMgYnVpbHQsIHRoZSB1Z2x5IGlmZGVmZmVyeSBjYW4gYmUgcmVtb3ZlZC4K
ClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51
dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvY2xvY2tzb3VyY2UvbWlwcy1naWMtdGltZXIuYyB8IDIg
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xvY2tzb3VyY2UvbWlwcy1naWMtdGltZXIuYyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvbWlwcy1n
aWMtdGltZXIuYwppbmRleCBhMTY2OTI2NmM5NGQuLjE1MDFjN2RiOWE4ZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9jbG9ja3NvdXJjZS9taXBzLWdpYy10aW1lci5jCisrKyBiL2RyaXZlcnMvY2xvY2tz
b3VyY2UvbWlwcy1naWMtdGltZXIuYwpAQCAtMTk4LDkgKzE5OCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
Y2xvY2tzb3VyY2UgZ2ljX2Nsb2Nrc291cmNlID0gewogCS5uYW1lCQkJPSAiR0lDIiwKIAkucmVh
ZAkJCT0gZ2ljX2hwdF9yZWFkLAogCS5mbGFncwkJCT0gQ0xPQ0tfU09VUkNFX0lTX0NPTlRJTlVP
VVMsCi0jaWZkZWYgQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZCiAJLnZkc29fY2xvY2tfbW9k
ZQk9IFZEU09fQ0xPQ0tNT0RFX0dJQywKLSNlbmRpZgogfTsKIAogc3RhdGljIHZvaWQgZ2ljX2Ns
b2Nrc291cmNlX3Vuc3RhYmxlKGNoYXIgKnJlYXNvbikKCi0tIAoyLjU1LjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
