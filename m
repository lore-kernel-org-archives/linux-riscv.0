Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD399C531F9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLrVyecw7S127jkY1SkDqSb4X43WUEQ9gWYjfDFsJns=; b=lSAIZKMougEDCW
	jx9jlktyt6YR2BTEkwIAMdaHbF9yp42+3zTSBaZiQ2mognvCg7QMGJ0QTvbkK8zV4GYoSuBta9Tnx
	r/4sQfRQ3azPVhm22ST7V4KQIdkHIDgnYdfM6//PxYjuvBMxLdSSfswDkM1mi4zzWu7Ywx+19/OQM
	jNM0e0QhQlIlc5kODU3ndJxIvuwrUPCUVypNuhv2ovT9FRYxkxzRnz7leyXvXb6U/tWU01y3d5XNk
	3rvUjDGavrroiKJzD8rtmx7zPiodzdi3MKHXOmIavJBQeKGtOspONFfxEaHykRYp1cglpH1Zp9BKR
	URkm0mK4mktQMK88ZjuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG78-0000000GUiQ-2vy1;
	Fri, 24 Jul 2026 13:38:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6S-0000000GUIT-11bd;
	Fri, 24 Jul 2026 13:38:17 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQMLx+20gZIPhu6fhJcix+G46/n6BMZRZhFfen7tOCo=;
	b=uqUzV0NYFb7ieencYml2faMhFQzti7121pHxXW9cmMkJRXRbna9CO2POLwIjHKLsM1H4xK
	Dd+sjptgKWWJd6EX+F9KhC/hpNGJ0/GO9+4oJzoxqiGxR0DK7cW0wjEYKWjC2balVEEKc6
	e2rVK+ayx0idQ7Sl6p5ptYgn6hmKFQ/Ta9AhmHnlW9+BH4ADrGPR071uSVSDDFADEWAB0f
	NY4ws6fqfIjtqUDPOpP9BsAZyPdeOhrc2WikDFnliqMoY4uOUt4GWRsM0PHHLgGJ2RA6HF
	+BWuJ1FIgDdlpFf1S6CXSkfIpc3FdehXz5UsqnlJu1e2VLFIXwAamCl1mGKyKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XQMLx+20gZIPhu6fhJcix+G46/n6BMZRZhFfen7tOCo=;
	b=QdpEAYG5R2YSM0ionPd/7GINsEOmj9QnFSv5exEX+24Cp6+grLf8aMdPl8z4sH7AibE+E3
	8QTPGdJjY08s/lBQ==
Date: Fri, 24 Jul 2026 15:36:22 +0200
Subject: [PATCH v4 5/7] clocksource/drivers/arm_arch_timer: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
MIME-Version: 1.0
Message-Id: <20260724-vdso-arch-clockmodes-v4-5-ddbe447be860@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=1205;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6njepM9aoRoFusxbCJ2Ptn3ocLjwqPODCMiHZfeqmAQ=;
 b=YJHIR6wb3YNPF73ed+3uprMQgLye4yx87dQoWXQ018PvGabImJT4D4l3VYkwXmofSixRkGii1
 OkSo794dInuAtIcjhdqMoxSjVlGQJ9s9KPkzCm00ye2yWwqDYaX18XD
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063816_490707_6C7237B5 
X-CRM114-Status: UNSURE (   7.72  )
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
aEBsaW51dHJvbml4LmRlPgpBY2tlZC1ieTogTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4K
LS0tCiBkcml2ZXJzL2Nsb2Nrc291cmNlL2FybV9hcmNoX3RpbWVyLmMgfCA0IC0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3Vy
Y2UvYXJtX2FyY2hfdGltZXIuYyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvYXJtX2FyY2hfdGltZXIu
YwppbmRleCA0YWRmNzU2NDIzZGUuLmE1MTU3ZDhhOGExMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9j
bG9ja3NvdXJjZS9hcm1fYXJjaF90aW1lci5jCisrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvYXJt
X2FyY2hfdGltZXIuYwpAQCAtNTYsMTEgKzU2LDcgQEAgc3RhdGljIHN0cnVjdCBjbG9ja19ldmVu
dF9kZXZpY2UgX19wZXJjcHUgKmFyY2hfdGltZXJfZXZ0Owogc3RhdGljIGVudW0gYXJjaF90aW1l
cl9wcGlfbnIgYXJjaF90aW1lcl91c2VzX3BwaSBfX3JvX2FmdGVyX2luaXQgPSBBUkNIX1RJTUVS
X1ZJUlRfUFBJOwogc3RhdGljIGJvb2wgYXJjaF90aW1lcl9jM3N0b3AgX19yb19hZnRlcl9pbml0
Owogc3RhdGljIGJvb2wgYXJjaF9jb3VudGVyX3N1c3BlbmRfc3RvcCBfX3JvX2FmdGVyX2luaXQ7
Ci0jaWZkZWYgQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZCiBzdGF0aWMgZW51bSB2ZHNvX2Ns
b2NrX21vZGUgdmRzb19kZWZhdWx0ID0gVkRTT19DTE9DS01PREVfQVJDSFRJTUVSOwotI2Vsc2UK
LXN0YXRpYyBlbnVtIHZkc29fY2xvY2tfbW9kZSB2ZHNvX2RlZmF1bHQgPSBWRFNPX0NMT0NLTU9E
RV9OT05FOwotI2VuZGlmIC8qIENPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWSAqLwogCiBzdGF0
aWMgY3B1bWFza190IGV2dHN0cm1fYXZhaWxhYmxlID0gQ1BVX01BU0tfTk9ORTsKIHN0YXRpYyBi
b29sIGV2dHN0cm1fZW5hYmxlIF9fcm9fYWZ0ZXJfaW5pdCA9IElTX0VOQUJMRUQoQ09ORklHX0FS
TV9BUkNIX1RJTUVSX0VWVFNUUkVBTSk7CgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
