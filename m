Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87525C44515
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 06:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8NGsmSiTLVDXtOoOUaRmbAmLklr5s2rlANoZayh7bXg=; b=sUEI/BnwOp0tIP
	vPFQ/gEurboduLdd+ZlYGLqc/jPbjBLUpTMgENeMVkM3V2l+A9ZVuhABVbv0TQGi/nC28EPXa6iZJ
	nyfjpbWX0Slczd7YD96TaaNUzlfduzr/rabO8XoV+AdeY4W0HBuJnywLfb+FVbLfm51ot7ICEe875
	Qv5bM5Api/sVT4Tm7+x9ToPgvpMMtNePRWSS4pNLHIT22Mw2S4//npEQ7g+jsYyD4VKzlZJ0nOvU4
	ZJPNN/RAo7I75VJ2Rm4xJ6bwAIFCrELQ4zV4PBvO+ZYaqK0UcbFEgWuOjJszb7/YAwlJu3Cx2T/C3
	05t3wfb/6bv6HwacQKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbrF-00000001E7T-0qgG;
	Fri, 17 Jul 2026 06:15:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbqx-00000001Dtn-15CX;
	Fri, 17 Jul 2026 06:15:21 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784268899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vDo3uHkwGXTE/lPbik782MNUamlRta61JxiZ5JxymY8=;
	b=JTbNI3FSHq/Fpng7meaJkQIsEze2XlETAmMvjMKZfNHpobXscI4+cnOJ1lbhuMoKERWzjZ
	96egokN77J+wzn8yTtijN+QwcnZLbe9cEL8NaIGBldkk7rDJX4axCsGiSyhtMdQoCx9SK8
	PJNIxUvQFozleMEMuUWEqglbvwgk7Xjy8SUU86WjazsEKt9WvUuWT9KOWEiCG6+ky2nu36
	Ce+8hcJKoVJujOmFrYFz6CvZNqwXT6fAXmXY+Ji6jEnbcEWsdls5m6791TAUIs6BhBk+M0
	Dfgo7gu7PJuZ5E30O68v0y8Wr9BvIF4PseysMT3tvTa2iNTMvoqzFAU8AG0smg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784268899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vDo3uHkwGXTE/lPbik782MNUamlRta61JxiZ5JxymY8=;
	b=7eoXt+Or1AL6mPmMAetpEU2Tuu1APEAYjpfx2qknwlYY6tK/532jdvQsnfUotbSfFcbZlD
	TflIPpizrvKYHtDg==
Subject: [PATCH v2 0/7] vDSO: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
Date: Fri, 17 Jul 2026 08:14:44 +0200
Message-Id: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2jGlChRW/odhUfqQidiaFhsM4
 d+tuHV5TnLPXSGaQCZCV6wQTKJI3mXghwLUKN3NIOnMwBmvWc0qTDp6lEGNqCav7g+vTcTBKml
 byZU4C8jTZzCWlj177TOPFGcf3vtLKr/2F2xY+z+YSmR4sroRbBisqMrLRO41B+9oOWoD/bZtH
 yDv5Xi8AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784268894; l=1620;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8Y+Yy1ieOzwCkyGF/eXMgH3qclcc67hiENNCHRZvyAk=;
 b=hPrf2I9P1jU+kYEQu+8UEVHQqvJVt9vTUkaHvWWuPnWeyIPtAGGgCMh+q1tvIaF2hG8/+l6fB
 1e3psZgJHTJAzl+YEzQIFGQjtwBaQb6XZCgdGDQxgN9JP9EzMeJ0Zsd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_231519_452822_C7ED77C0 
X-CRM114-Status: UNSURE (   5.75  )
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
dWhAbGludXRyb25peC5kZT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gQWxzbyBkcmVwIHRoZSBJU19F
TkFCTEVEKCkgbG9naWMuCi0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIw
MjYwNzA5LXZkc28tYXJjaC1jbG9ja21vZGVzLXYxLTAtM2ZkNzgwYmJmODUxQGxpbnV0cm9uaXgu
ZGUKCi0tLQpUaG9tYXMgV2Vpw59zY2h1aCAoNyk6CiAgICAgIGtidWlsZDogc3VwcG9ydCBnZW5l
cmF0ZWQgYXNtLWhlYWRlcnMgaW4gc3ViZGlyZWN0b3JpZXMKICAgICAgdkRTTzogTWFrZSBjbG9j
a21vZGUgY29uc3RhbnRzIGF2YWlsYWJsZSB3aXRob3V0IENPTkZJR19HRU5FUklDX0dFVFRJTUVP
RkRBWQogICAgICBNSVBTOiBjc3JjLXI0azogUmVtb3ZlIENPTkZJR19HRU5FUklDX0dFVFRJTUVP
RkRBWSBpZmRlZmZlcnkKICAgICAgY2xvY2tzb3VyY2UvZHJpdmVycy9taXBzLWdpYy10aW1lcjog
UmVtb3ZlIENPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWSBpZmRlZmZlcnkKICAgICAgY2xvY2tz
b3VyY2UvZHJpdmVycy9hcm1fYXJjaF90aW1lcjogUmVtb3ZlIENPTkZJR19HRU5FUklDX0dFVFRJ
TUVPRkRBWSBpZmRlZmZlcnkKICAgICAgY2xvY2tzb3VyY2UvZHJpdmVycy90aW1lci1yaXNjdjog
UmVtb3ZlIENPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWSBpZmRlZmZlcnkKICAgICAgTG9vbmdB
cmNoOiBSZW1vdmUgQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZIGlmZGVmZmVyeQoKIGFyY2gv
bG9vbmdhcmNoL2tlcm5lbC90aW1lLmMgICAgICAgICAgIHwgIDIgLS0KIGFyY2gvbWlwcy9rZXJu
ZWwvY3NyYy1yNGsuYyAgICAgICAgICAgIHwgIDIgLS0KIGRyaXZlcnMvY2xvY2tzb3VyY2UvYXJt
X2FyY2hfdGltZXIuYyAgIHwgIDQgLS0tLQogZHJpdmVycy9jbG9ja3NvdXJjZS9taXBzLWdpYy10
aW1lci5jICAgfCAgMiAtLQogZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jICAgICAg
fCAgNCAtLS0tCiBpbmNsdWRlL2FzbS1nZW5lcmljL0tidWlsZCAgICAgICAgICAgICB8ICAxICsK
IGluY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby9jbG9ja3NvdXJjZS5oIHwgIDAKIGluY2x1ZGUvdmRz
by9jbG9ja3NvdXJjZS5oICAgICAgICAgICAgIHwgIDQgKy0tLQogc2NyaXB0cy9NYWtlZmlsZS5h
c20taGVhZGVycyAgICAgICAgICAgfCAxMSArKysrKy0tLS0tLQogOSBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IGVjYWNjOWM4
ZDNlZDBmNjMwNjVmNGExZTk0YmZkOGJmNjVhM2ZmYWYKY2hhbmdlLWlkOiAyMDI2MDYwNS12ZHNv
LWFyY2gtY2xvY2ttb2Rlcy1iZmNhZjlhMmM4NDgKCkJlc3QgcmVnYXJkcywKLS0gIApUaG9tYXMg
V2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
