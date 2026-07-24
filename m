Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EDEC531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pYqcC3GZhLASSK3Ayd491TrTWVDzgW458dTtqQTv3WU=; b=E+ApmPRueu9J5D
	fkwRGTQn8kSJbfAAuxqBUcz+7XxCRPmcbqv2oglepeGTyaFnMtRWPkP35yZikIPf2BqajuB6WLBEA
	UWB1Cwhsqla3Bfcpau8SnETDK3gFLVf2V92+Dy6/V9DZ3bw3AbkID2CAJBI3r13H2RYKqq13jMkFs
	NXycA2eK8gsFOmEkIt5cqn3SEw1pjNkPycQbk0ZXh5rSt6+tFRZoc4MJvOpUQhKqZ733oycbeqpuH
	txORs7ukL5LCCej3eZmFw77WO7bhsgDCrkR+rdCk5y/n7UIYoIH61qB2O0god5o8Ihf9LcLWOdrN+
	BAwQYlNNybutRxs82PrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6m-0000000GUS3-3Llr;
	Fri, 24 Jul 2026 13:38:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG6P-0000000GUGT-1EVJ;
	Fri, 24 Jul 2026 13:38:15 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784900287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QM9Lp+UCHv2nA/JQ1VGCr81S6Dhpwf0SM7XAotFxf3U=;
	b=rCPIxj/5GrKq7vySuH0J27acfkdy45eS4OkunF7DqNmJWiyv5GotlWxcjvpMClILBS2LJ2
	cwK8pEcQwe9EjN2OWtWYG+ouAlI4ZI+fHxq+RzJc9kykL6QOxgww8Hsvfp9bftkP2Z5lUu
	HqeOighQaG/RVGk4BOuRmJkY6Dm4TD1YVVURPw5NzQTzXEAYopB3VCzhK6H1JjNDF9414J
	01WlY5G4SfJ5zhDBfKfyN2OsfqWY31CreFbs0X5BY1ROZ1JGQxP4mRbWuyavhODvXowIZl
	Q1RRjmSUH7KOL44M6ORH2GbGNm0wq0JmmnF8HYj5RPeib6+0zLk2iVjW5tWF1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784900287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QM9Lp+UCHv2nA/JQ1VGCr81S6Dhpwf0SM7XAotFxf3U=;
	b=dhUeWzjmjXdkv1lOF5bi3OznddEHnV+wyC2rPF3koqyn+0bYsfbAwM07wqFfK3y4pQCEE1
	JgmU+lO4hby65gAw==
Subject: [PATCH v4 0/7] vDSO: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
Date: Fri, 24 Jul 2026 15:36:17 +0200
Message-Id: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XN0Q6CIBTG8VdpXEcDBNGueo/WBR4gWSUNjNmc7
 x7ajWt2+f+28zsjiiY4E9FxN6JgkovOdzn4foegVd3VYKdzI0ZYSUoicNLRYxWgxXD3cHt4bSJ
 uLChbKwYVr1A+fQZj3bCw50vu1sXeh/fyJdF5/YKS1NtgopjgwmpZkaaxlaCnu+teffCdGw7ao
 BlNbAVR+QdiGZKitEIJTXkpt6BiBTH2ByoyxEFIUdCaAvBfaJqmD8nT4PtOAQAA
X-Change-ID: 20260605-vdso-arch-clockmodes-bfcaf9a2c848
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784900286; l=1982;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MP2SkrhK4GMSu5UIhEImPDNR3U350uvYxSPXvYLkbUU=;
 b=NRJ2rvH1f+h/UNlgNbYSlgtGoD45GCI1EXeDV8NzMkGgeC27xjfKz8lFaet2Qpmfgw6n4nBSA
 SE/1fQ32nXjCwqcSE3UpnL6MQz8E955+FZjZq56PwFgaGej21vor2ut
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063813_503841_77F561D1 
X-CRM114-Status: UNSURE (   6.73  )
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

QWx3YXlzIHByb3ZpZGUgdGhlIGRlZmluaXRpb25zIG9mIHRoZSBWRFNPX0NMT0NLTU9ERV8qIGNv
bnN0YW50cyBhbmQKcmVtb3ZlIHNvbWUgaWZkZWZmZXJ5IGZyb20gdGhlIGNsb2Nrc291cmNlIGRy
aXZlcnMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZT4KLS0tCkNoYW5nZXMgaW4gdjQ6Ci0gUGljayB1cCBBY2sgZnJvbSBN
YXJrIFp5bmdpZXIuCi0gRml4ICctdHlwZSBkJyBhcmd1bWVudCB0byBmaW5kLgotIExpbmsgdG8g
djM6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDcyMi12ZHNvLWFyY2gtY2xvY2ttb2Rl
cy12My0wLTRjNTc1MzE5MWNjNEBsaW51dHJvbml4LmRlCgpDaGFuZ2VzIGluIHYzOgotIFVwZGF0
ZSAqYWxsKiBjb21taXQgbWVzc2FnZXMgdG8gdGhlIGxhdGVzdCBsb2dpYy4KLSBMaW5rIHRvIHYy
OiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA3MTctdmRzby1hcmNoLWNsb2NrbW9kZXMt
djItMC03NTZmNWE1ZDE0NjdAbGludXRyb25peC5kZQoKQ2hhbmdlcyBpbiB2MjoKLSBBbHNvIGRy
b3AgdGhlIElTX0VOQUJMRUQoKSBsb2dpYy4KLSBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNoLm1z
Z2lkLmxpbmsvMjAyNjA3MDktdmRzby1hcmNoLWNsb2NrbW9kZXMtdjEtMC0zZmQ3ODBiYmY4NTFA
bGludXRyb25peC5kZQoKLS0tClRob21hcyBXZWnDn3NjaHVoICg3KToKICAgICAga2J1aWxkOiBz
dXBwb3J0IGdlbmVyYXRlZCBhc20taGVhZGVycyBpbiBzdWJkaXJlY3RvcmllcwogICAgICB2RFNP
OiBNYWtlIGNsb2NrbW9kZSBjb25zdGFudHMgYXZhaWxhYmxlIHdpdGhvdXQgQ09ORklHX0dFTkVS
SUNfR0VUVElNRU9GREFZCiAgICAgIE1JUFM6IGNzcmMtcjRrOiBSZW1vdmUgQ09ORklHX0dFTkVS
SUNfR0VUVElNRU9GREFZIGlmZGVmZmVyeQogICAgICBjbG9ja3NvdXJjZS9kcml2ZXJzL21pcHMt
Z2ljLXRpbWVyOiBSZW1vdmUgQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZIGlmZGVmZmVyeQog
ICAgICBjbG9ja3NvdXJjZS9kcml2ZXJzL2FybV9hcmNoX3RpbWVyOiBSZW1vdmUgQ09ORklHX0dF
TkVSSUNfR0VUVElNRU9GREFZIGlmZGVmZmVyeQogICAgICBjbG9ja3NvdXJjZS9kcml2ZXJzL3Rp
bWVyLXJpc2N2OiBSZW1vdmUgQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZIGlmZGVmZmVyeQog
ICAgICBMb29uZ0FyY2g6IFJlbW92ZSBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkgaWZkZWZm
ZXJ5CgogYXJjaC9sb29uZ2FyY2gva2VybmVsL3RpbWUuYyAgICAgICAgICAgfCAgMiAtLQogYXJj
aC9taXBzL2tlcm5lbC9jc3JjLXI0ay5jICAgICAgICAgICAgfCAgMiAtLQogZHJpdmVycy9jbG9j
a3NvdXJjZS9hcm1fYXJjaF90aW1lci5jICAgfCAgNCAtLS0tCiBkcml2ZXJzL2Nsb2Nrc291cmNl
L21pcHMtZ2ljLXRpbWVyLmMgICB8ICAyIC0tCiBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJp
c2N2LmMgICAgICB8ICA0IC0tLS0KIGluY2x1ZGUvYXNtLWdlbmVyaWMvS2J1aWxkICAgICAgICAg
ICAgIHwgIDEgKwogaW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNvL2Nsb2Nrc291cmNlLmggfCAgMAog
aW5jbHVkZS92ZHNvL2Nsb2Nrc291cmNlLmggICAgICAgICAgICAgfCAgNCArLS0tCiBzY3JpcHRz
L01ha2VmaWxlLmFzbS1oZWFkZXJzICAgICAgICAgICB8IDExICsrKysrLS0tLS0tCiA5IGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1p
dDogZWNhY2M5YzhkM2VkMGY2MzA2NWY0YTFlOTRiZmQ4YmY2NWEzZmZhZgpjaGFuZ2UtaWQ6IDIw
MjYwNjA1LXZkc28tYXJjaC1jbG9ja21vZGVzLWJmY2FmOWEyYzg0OAoKQmVzdCByZWdhcmRzLAot
LSAgClRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
