Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E13C44507
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtXmrliORrYdfMaLK5WWs1XC0kDpSWafivVgHscvsnM=; b=do1M/wxoXp5q0u
	R9xz+TRNyPhwNBtkk3QbDmmXmIWv8F2lFjOVdrIw3VdQz7hpJYY+GwgePm4mldyIyZELApe18fspL
	hSy+Ky2h3exl7NHxyvatg1cBi2Alg8b5N/JAdkOmUtDUh9IsDpHfwgjpv6CbMZJR+6qT6Eu7EHxST
	+NezXBgBEGyymnDr/r60ip9izbh/ZDV/2O6+U1D+W3JYRrePKp9Qxb+5oVaiY7JkYjppkYllb3WNc
	h8d03z6Uidn/xmiJx54ANL/iodcut9LQr8BRTwFLuRBXdsiMgdo3IZBhYMNPuenRQQqrGEihJvAX2
	YZmvFYPuRICdYrHSCr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbrN-00000001EGQ-3oki;
	Fri, 17 Jul 2026 06:15:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbr0-00000001Dwx-0mJB;
	Fri, 17 Jul 2026 06:15:23 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784268902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNMoDfSuSxJw6SemBX4XpeIAZF6FAMIZenhTrRJVbbc=;
	b=kwP+ZcbEqDHqXFtctAmbUthHdgfiiuFcN2xHVOYaUW7PDhIR6C289v7UXiK1eBtTmNxrMm
	rz8dTIO+98UVlTaDRsll2yY0JCSK1xmhZ8fcr/LSwUsPRvFjXdZx3BSQdpZcczfEDs59du
	ljx+O0aVL+oPKU/5/haP59Ds0Zhelsb8dYL8uQOqCPVlt2kjUEifhVhKVZqgti+d1LDZjW
	Yni/3nNOvYDSiJc3WCS8I1bvDfZqJxeK/QjSlWPkZVGeRqJ39ZRrVnnHjcYYtmTBNj8Q8y
	9kDdXJ8R+z70lvDEPB2ZcU5dZsoZyS9m7S80ob9ywiDoH2FPQ00pcdQOjYr6OA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784268902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNMoDfSuSxJw6SemBX4XpeIAZF6FAMIZenhTrRJVbbc=;
	b=zjvF0lrKY5L8Q5gp78MHGd7S8u1KObPwa73KgVbSZReQycUp5yzr9zhhZcUqRJcMuSV3XD
	+41pq1V3hc4uGiDw==
Date: Fri, 17 Jul 2026 08:14:49 +0200
Subject: [PATCH v2 5/7] clocksource/drivers/arm_arch_timer: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
MIME-Version: 1.0
Message-Id: <20260717-vdso-arch-clockmodes-v2-5-756f5a5d1467@linutronix.de>
References: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
In-Reply-To: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784268894; l=1164;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=lW6xuPaawuRjNMiAq3NjJ0vYClBA5grQp8KXYE1QcYY=;
 b=eXGwaK8fUQKZ2qgKSwMeVNdT1BL4zzlDIrGbovIZgFnCvBWvLcRXwdi1C341Kpq1ckzLl7AP7
 MaEHx4ncMWxAJmsA/+HulnDegxAfFq0oPXuQT/WwGPJdnlJvdSM7+yr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_231522_386686_922F0D8A 
X-CRM114-Status: UNSURE (   7.49  )
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
