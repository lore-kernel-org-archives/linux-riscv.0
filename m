Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EF1C44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkW7liC6CdeF5hd0Hyk3wFOGi37uFVKMnPYy5ZT5/UM=; b=ipNOjVR2k3caC6
	N0KzoWViDpKo95GFYRKZYU2hHPs4dLOtEQqC3QgpdPBnWqNVpnjCZBjnPmYst6QKjPhJgwGQz42a/
	UWQL+DNc02PorXbTrvstLyGn9lm2BkE0njIuw/DitDYHdU/9V8Jwd4Xut/29/ev0lT1SFDPDKz99+
	twsIPAKkhR4V0u9ZedoMj8nQGcCkYyjd3+oxboZtmBJaq5tax/fOkqDqXL+lIpPyTYheFCh+UTrlw
	uzc2v5cZYqatNmXG7eCANk9+5uIkt4bYo5x2JB0HYn0WqbuNRlpksyxgctxy8ZFiS0SLyS1XZ++Xq
	ubWhNiPee9MFtPKn0IHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzv-00000002C6v-0PhZ;
	Thu, 09 Jul 2026 11:32:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzp-00000002Bu1-2m7C;
	Thu, 09 Jul 2026 11:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ig+DEThEdu93PL9Y6RxYfj8TwNueHZcwpbqWNPHipMQ=; b=l4dzFjTC4ujzYfjj3HhxkOezyt
	D0Lw+0DNHWua2NETqFry5raTg4RG+J649Wl7WIuW0/5U3IiZS3Vr6XaUTwUdHwqmiqGi3H0Y7KwyL
	3AGsHPQHFoCFcaPzSlyCn9JAjYi9CHBfcFunRe7Ey68GJTbpeGD+nQ8T+fXhLGE+dgNNK50vhmtuo
	FiCeS5PigPIvo65wlXng/BqzMUMjCys8GftX3Gdw8mzHw8uXmqYPmbBouSMlo5nWqZeS5C0eBJ3Bp
	vd5BzisvuDxmVXFFm45zqYF3ATtlzpoyxxXs8aj0+1lhhU4eWmeIRps0otozxMEsGGyzXaop/IPNN
	C9Nsrdaw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whmzl-000000098xd-07Eh;
	Thu, 09 Jul 2026 11:32:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ig+DEThEdu93PL9Y6RxYfj8TwNueHZcwpbqWNPHipMQ=;
	b=XTtNxmBftIu/MuEyBv5NcpO6SIRsipn237MfFlx7TSonp7OgY2UIoXl2AvNfI9F6j+Rlms
	hS07KntUIQPgEQx/PlNm8jaePOqAfVqdTbSenZGaWdLQlhLy9dvG8/25x+wET/ErFKSq5M
	rvEzVK6bX7+simtsL+h3rxTa36pBFopWWJe1ju6QUuPhCE0q48qRN87I+79ghmh3aPyEHx
	cPa20BRIG43799DXjtIXqP7azrLvJ7i6hfiId8mhIGNMj/dTObASOdZMBGWSZgsxmfFSv0
	whKQJuWBZgNd3b7pFbOfXeOhV876KWTbDqaXnJNxv3XmS48fH+dm2E+SFCzaPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ig+DEThEdu93PL9Y6RxYfj8TwNueHZcwpbqWNPHipMQ=;
	b=1XrX6rcc7PYG2uPlLX5PqTQEDfbbYIEXYq56t/8GngEFlHVf7AeZ0HOWQaVfv13O99O3Dd
	F+PS8VM6pQ+A/TCA==
Date: Thu, 09 Jul 2026 13:32:40 +0200
Subject: [PATCH 4/7] clocksource/drivers/mips-gic-timer: Replace
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery with IS_ENABLED()
MIME-Version: 1.0
Message-Id: <20260709-vdso-arch-clockmodes-v1-4-3fd780bbf851@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=988;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Cb6TJFKXRTGuFsy7vLwZziq8FlUUov9IjfcXVp4by3I=;
 b=RqWMWGndZRR40I+i7U91NW8lFYhmkW3JwUOT571+ZTuaS4OojMQf/+6pQOQe6/Lf4q+EONycO
 Khh/sU1tyFFBtvKuLdI1BUf79Qu52hobMz0j1UJgLb4NcuwFphHLTVO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_123245_205797_448266DE 
X-CRM114-Status: UNSURE (   8.93  )
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

Tm93IHRoYXQgdGhlcmUgaXMgYSBkdW1teSBkZWNsYXJhdGlvbiBvZiBWRFNPX0NMT0NLTU9ERV9H
SUMsIGV2ZW4gaWYgbm8KdkRTTyBpcyBidWlsdCwgdGhlIHVnbHkgaWZkZWZmZXJ5IGNhbiBiZSBy
ZXBsYWNlZCB3aXRoIGEgY2xlYW5lcgpJU19FTkFCTEVEKCkgY2hlY2suCgpTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0t
CiBkcml2ZXJzL2Nsb2Nrc291cmNlL21pcHMtZ2ljLXRpbWVyLmMgfCA1ICsrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY2xvY2tzb3VyY2UvbWlwcy1naWMtdGltZXIuYyBiL2RyaXZlcnMvY2xvY2tzb3VyY2Uv
bWlwcy1naWMtdGltZXIuYwppbmRleCBhMTY2OTI2NmM5NGQuLjBkZDMwYmEzY2NlNyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS9taXBzLWdpYy10aW1lci5jCisrKyBiL2RyaXZlcnMv
Y2xvY2tzb3VyY2UvbWlwcy1naWMtdGltZXIuYwpAQCAtMTk4LDkgKzE5OCw4IEBAIHN0YXRpYyBz
dHJ1Y3QgY2xvY2tzb3VyY2UgZ2ljX2Nsb2Nrc291cmNlID0gewogCS5uYW1lCQkJPSAiR0lDIiwK
IAkucmVhZAkJCT0gZ2ljX2hwdF9yZWFkLAogCS5mbGFncwkJCT0gQ0xPQ0tfU09VUkNFX0lTX0NP
TlRJTlVPVVMsCi0jaWZkZWYgQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZCi0JLnZkc29fY2xv
Y2tfbW9kZQk9IFZEU09fQ0xPQ0tNT0RFX0dJQywKLSNlbmRpZgorCS52ZHNvX2Nsb2NrX21vZGUJ
PSBJU19FTkFCTEVEKENPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWSkgPworCQkJCQlWRFNPX0NM
T0NLTU9ERV9HSUMgOiBWRFNPX0NMT0NLTU9ERV9OT05FLAogfTsKIAogc3RhdGljIHZvaWQgZ2lj
X2Nsb2Nrc291cmNlX3Vuc3RhYmxlKGNoYXIgKnJlYXNvbikKCi0tIAoyLjU1LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
