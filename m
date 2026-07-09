Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C7AC4450A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 11:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L0lJ6fVovtkN3mTPNTfhgbicBn5gRPYsohUzKbk7WQ4=; b=OoUW8TGSvzNEss
	NWW/75doOrUEpxP+o7lOSAVw2trfKAIpibkqqwp4NFfDOfYDzWL8CGRDKkyRA7LM5loAXVgNjdgGH
	XA2szWUiglSTvFk0Wy5FuCJ7e9s05IjIZNl0VvAdcZgADbJT5vmV5rS3KMFRARVglnJQ0p3/u8JPk
	do4/BeQkjyX7WwjzBTactJpetHqcH6JQ1i28FSXK5ftjbh3y/6DJ8fAFhSkwQJYNRW2LTtwc8F6Rm
	+Rnf+1SDZP8CUf5nF0VgfTEcOp8h110u57gsiRvdMxOsqt1UlnZymOSFbBBA7f+59DCiYKUZPoYCq
	eINKj5ne5AzmQF6S+RKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzq-00000002BxB-1Wfj;
	Thu, 09 Jul 2026 11:32:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmzi-00000002Bjx-2hTz;
	Thu, 09 Jul 2026 11:32:45 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783596759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3h/womV9Fbhg3p/L/491wrRWOveYAatastwr60h0rPA=;
	b=giBxjz3T0P2S6MQBaE7q0V1Y+P8GtU/83OH5yvA/IJYRF6rEaZNH72uhWRmoHYQPBvSeaM
	aYnR4r1jdyxlKCtHofIYIu21ZYJGKVw0zu+eZEOXrVSQ4jqcThtvVq/2UTbCrBN/YEV7Tq
	5tFNpsN0J1iSkT07jP/gg2PBJPINWCi3E3tnw+Fa9V9beR+M/vw5jMh1JmIJ1HAhyEjrfH
	hpRUEFeMrvg4MVEEMmBLkDNRDEghr9gcOcOvOWEXIrt33Fhbgz7NP8tocFyKQBWNFVbmLa
	pbX1QoRmmZ62rssps6gM9ElrjWLJL8LCmFPjAHg1v8EZF9vB/RLuN7DuE5bxiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783596759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3h/womV9Fbhg3p/L/491wrRWOveYAatastwr60h0rPA=;
	b=dhUA7ErG68WNBRzhRd+NtTZFYpT3et+sDudNK/W2f5/GDKNvhVYhhGh6UArQIQUKejGRLk
	3THQK4lIsGB1LlCg==
Subject: [PATCH 0/7] vDSO: Replace CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
 with IS_ENABLED()
Date: Thu, 09 Jul 2026 13:32:36 +0200
Message-Id: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1gZqUVGvMrioaarBGTs0UATx7
 haXb/H/BcpJWGGqLkicRSUeBU1dAW3uWBnFF4M1tje96TB7jegSbUjfSPsvelZcArkwOktDO0B
 J/4mDnO/2M9/3Ayijr3NmAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783596759; l=1590;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=bd62m/ysnHtkfVSUaGn+V8oLxmFUlxg59T9FJQBkVtY=;
 b=v0PUn23gIRlT3wMLw6uvxNhG8MDsFLklGKvI5FMtQ09FTJRHMHBj0/elS9bs0Z3CEgLqrSM8/
 LBkRruGlMC/DM32fLjupE7GsD6pdIWQ+TzzZgMOdIZkoEhk+dyQS3TE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_043242_837735_C56B67D4 
X-CRM114-Status: UNSURE (   4.90  )
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

UHJvdmlkZSBkdW1teSBkZWNsYXJhdGlvbnMgb2YgdGhlIFZEU09fQ0xPQ0tNT0RFXyogY29uc3Rh
bnRzIGFuZCB1c2UKdGhvc2UgdG8gcmVwbGFjZSBzb21lIHVnbHkgaWZkZWZmZXJ5IHdpdGggY2xl
YW5lciBJU19FTkFCTEVEKCkgY2hlY2tzLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2No
dWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQpUaG9tYXMgV2Vpw59zY2h1
aCAoNyk6CiAgICAgIGtidWlsZDogc3VwcG9ydCBnZW5lcmF0ZWQgYXNtLWhlYWRlcnMgaW4gc3Vi
ZGlyZWN0b3JpZXMKICAgICAgdkRTTzogTWFrZSBjbG9ja21vZGUgY29uc3RhbnRzIGF2YWlsYWJs
ZSB3aXRob3V0IENPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWQogICAgICBNSVBTOiBjc3JjLXI0
azogUmVwbGFjZSBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkgaWZkZWZmZXJ5IHdpdGggSVNf
RU5BQkxFRCgpCiAgICAgIGNsb2Nrc291cmNlL2RyaXZlcnMvbWlwcy1naWMtdGltZXI6IFJlcGxh
Y2UgQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZIGlmZGVmZmVyeSB3aXRoIElTX0VOQUJMRUQo
KQogICAgICBjbG9ja3NvdXJjZS9kcml2ZXJzL2FybV9hcmNoX3RpbWVyOiBSZXBsYWNlIENPTkZJ
R19HRU5FUklDX0dFVFRJTUVPRkRBWSBpZmRlZmZlcnkgd2l0aCBJU19FTkFCTEVEKCkKICAgICAg
Y2xvY2tzb3VyY2UvZHJpdmVycy90aW1lci1yaXNjdjogUmVwbGFjZSBDT05GSUdfR0VORVJJQ19H
RVRUSU1FT0ZEQVkgaWZkZWZmZXJ5IHdpdGggSVNfRU5BQkxFRCgpCiAgICAgIExvb25nQXJjaDog
UmVwbGFjZSBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkgaWZkZWZmZXJ5IHdpdGggSVNfRU5B
QkxFRCgpCgogYXJjaC9sb29uZ2FyY2gva2VybmVsL3RpbWUuYyAgICAgICAgICAgfCAgNSArKy0t
LQogYXJjaC9taXBzL2tlcm5lbC9jc3JjLXI0ay5jICAgICAgICAgICAgfCAgNCArLS0tCiBkcml2
ZXJzL2Nsb2Nrc291cmNlL2FybV9hcmNoX3RpbWVyLmMgICB8ICA3ICsrLS0tLS0KIGRyaXZlcnMv
Y2xvY2tzb3VyY2UvbWlwcy1naWMtdGltZXIuYyAgIHwgIDUgKystLS0KIGRyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItcmlzY3YuYyAgICAgIHwgIDcgKystLS0tLQogaW5jbHVkZS9hc20tZ2VuZXJp
Yy9LYnVpbGQgICAgICAgICAgICAgfCAgMSArCiBpbmNsdWRlL2FzbS1nZW5lcmljL3Zkc28vY2xv
Y2tzb3VyY2UuaCB8ICAwCiBpbmNsdWRlL3Zkc28vY2xvY2tzb3VyY2UuaCAgICAgICAgICAgICB8
ICA3ICsrKysrLS0KIHNjcmlwdHMvTWFrZWZpbGUuYXNtLWhlYWRlcnMgICAgICAgICAgIHwgMTEg
KysrKystLS0tLS0KIDkgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRp
b25zKC0pCi0tLQpiYXNlLWNvbW1pdDogZGM1OWU0ZmVhOWQ4M2YwM2JhZDZiZGRmM2ZhMmU1MjQ5
MTc3NzQ4MgpjaGFuZ2UtaWQ6IDIwMjYwNjA1LXZkc28tYXJjaC1jbG9ja21vZGVzLWJmY2FmOWEy
Yzg0OAoKQmVzdCByZWdhcmRzLAotLSAgClRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3Nz
Y2h1aEBsaW51dHJvbml4LmRlPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
