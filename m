Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62FAC531F9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sc7+KV55Ee96z5YMZx8fBryfcMOxQkH8GysRsvMzz+Q=; b=Kf1rpgfyCp4K0F
	3TKqdL6PL1dNS8dq7BkAsIDqNcfuM4xyIqsN+/FYUOd15fZTJQ6HcKNQPqGZQ8iVgpI/7tz/9eZCT
	wQyP4dEqftdil35Q2KHZw7aWDvotOi1Pxu+T4VpehoVimaxJW59+quS3TAcnMukyiKeDEErVVXKJ8
	sqEWkqnfK62wgXK2KLVt2lk0IORxwFmf6dXaEO4hxkDzpTassvusTGnj5qqlQfFv6bonv/tQl+HSd
	9wU7KE7FpQBTVpA+1fH9UXOyYhwg/STGIM8I+XAEvLr/u/R0nn0wke+gQ6dBkyTjyV+p8P4vllDy1
	aTbbTsGwNI/uhlDqM6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG71-0000000GUbj-1jqG;
	Fri, 24 Jul 2026 13:38:51 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6S-0000000GUIS-12Ak;
	Fri, 24 Jul 2026 13:38:17 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb2SX77zyxaYXrQzUmclJ/k81+yHIaZBLWgIqd5QYek=;
	b=fJQA63AhXqN0Wt6TrowHVZuSsMNP0G4WVVoLUsYDckEfWkcsS+utv4/QPUaNH5Bg828tO2
	ZTiTmBU2Z5XxJ/irTdAXpPPtpRqd7/nltgO5vmspMfkiLohJxq4mSeSa+Gh2msVxqp/i9O
	cv7/xUuqPSE29eGuUNPF+01vv6DY500HCfGh2Okt3fMAhmeSzdpVZiL6rU6hKW5z4Os9XD
	1InV/Grh5c8MB9aVWJfaPBqdruV8IbWeAxN2H/yvpPeOTTu0PjydJfuQ1M0R9w2HfCaqSh
	PvifLZ3qpIXrQgiYmLPaM0AfsYJGvnvMKHUjwNcj9o8kQlwDDPqdcsmR/RfwFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wb2SX77zyxaYXrQzUmclJ/k81+yHIaZBLWgIqd5QYek=;
	b=86dQJzWWaZAgS+vRVMF0ZufUKVhSBsgdu+ylGsup4jHHNu757Z3axqD9G1bvaW38+rYPvv
	C+R/sJ+vgrg3XOBg==
Date: Fri, 24 Jul 2026 15:36:23 +0200
Subject: [PATCH v4 6/7] clocksource/drivers/timer-riscv: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
MIME-Version: 1.0
Message-Id: <20260724-vdso-arch-clockmodes-v4-6-ddbe447be860@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=898;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6yZi1E2ORWX3erxZ2iLgMw+pOXO/qHsB3RdbekGUNbY=;
 b=nmad2uoX7O2hqUY1EMlB36avIhjqVM82Dv1sCDRFVS/iKzjJOA2F5DmkLQrmhAf+pwqMcVWqO
 BT3A90/wOmTB3fU2MFpx3uScqaGM9MwiSK27/z2LrHGJXh7kGVc5def
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063816_483875_00D26F0D 
X-CRM114-Status: UNSURE (   7.89  )
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
aEBsaW51dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyB8
IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1l
ci1yaXNjdi5jCmluZGV4IGNmYzRkODNjNDJjMC4uYjMxMGU2NzIxZmFjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKKysrIGIvZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1yaXNjdi5jCkBAIC05OCwxMSArOTgsNyBAQCBzdGF0aWMgc3RydWN0IGNsb2Nrc291
cmNlIHJpc2N2X2Nsb2Nrc291cmNlID0gewogCS5tYXNrCQk9IENMT0NLU09VUkNFX01BU0soNjQp
LAogCS5mbGFncwkJPSBDTE9DS19TT1VSQ0VfSVNfQ09OVElOVU9VUywKIAkucmVhZAkJPSByaXNj
dl9jbG9ja3NvdXJjZV9yZHRpbWUsCi0jaWYgSVNfRU5BQkxFRChDT05GSUdfR0VORVJJQ19HRVRU
SU1FT0ZEQVkpCiAJLnZkc29fY2xvY2tfbW9kZSA9IFZEU09fQ0xPQ0tNT0RFX0FSQ0hUSU1FUiwK
LSNlbHNlCi0JLnZkc29fY2xvY2tfbW9kZSA9IFZEU09fQ0xPQ0tNT0RFX05PTkUsCi0jZW5kaWYK
IH07CiAKIHN0YXRpYyBpbnQgcmlzY3ZfdGltZXJfc3RhcnRpbmdfY3B1KHVuc2lnbmVkIGludCBj
cHUpCgotLSAKMi41NS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
