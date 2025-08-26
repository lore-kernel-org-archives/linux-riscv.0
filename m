Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B59CA0EFA
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 06:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hW2YtWTq/0as3eODsLxrXxE5DrJ90XUgDe82xaBw3Ns=; b=KVoXTbPdSwpJg1
	sgwZFJa41uiAI2i+DmvFWkSucqYcp9+0xVgS8T3qq1uzKhzH7FROcJyRCfGtyT0mmhuTIAj3eOfFo
	BkHepgdLVjnCjp3yo9ZDLKuPum3sY+M3S2iZuaCa8PjNUE8LNpMXkvbcN0Fd3zfKGff0y+35sQ2Jb
	bz0KNS3JEQeLdizdhzvH+FiNek9J5czk6CjaWnckpCv/9JtYQLQhG0iZ2EYCxnlTvsfpPkKD3YX8X
	jjtYAe1MyAMYwfdDYenRUz8zl+m4B8K6JdrAoU72KZQTMWSZQqf+TVlQVAPomgAyFvpHyWJ3KaaBt
	iiamnec/gAaqRsQa+11w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnGw-0000000Aih1-2tio;
	Tue, 26 Aug 2025 06:35:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0h-0000000AfBD-0LAu;
	Tue, 26 Aug 2025 06:18:25 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/oLlHMS/fCP6P1KLSn+cvJJv6PKUv3DICeaKqETsd4=;
	b=vM/cvVQMAyhS92V8y5yVESyKxIqQ5R3zffJXNT39DFeEehqGvQ4cgcMYsWOtpmbyjLR+Jk
	we8S1VPZLk08HyevreXbtrS0WfURWLCD0C1udndZaGXsxcvNVQ2IAa/sI7wZ5EjfeBV3QB
	Xl1IBk2dQX2DHCg8P+mvsjehyFDzZ/AjK26U/WIM/Dx6E1r9CZ+xl3vYpcz/43dfXeL8zq
	t+0oYU9wuduujEn9b3gXCqd8/s4+brqyYCVM79YY7DmkOuCIKG5XnjOxrX8XloYENkIp6J
	frOXYpfPBh2KaqVqKhcgIbWwZ8GW0EG4XRusd22yhv2ylnUvt+X8LNumqRAcrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/oLlHMS/fCP6P1KLSn+cvJJv6PKUv3DICeaKqETsd4=;
	b=vA9RQwkSkeW435dz89cXdm1JlqEJ1IVbHIFd6A9tNEpJZ0qLZJMeeSzlzAhq24mxpdVhVM
	OJzV+jwkYkep1fAA==
Date: Tue, 26 Aug 2025 08:17:08 +0200
Subject: [PATCH 05/11] time: Build generic update_vsyscall() only with
 generic time vDSO
MIME-Version: 1.0
Message-Id: <20250826-vdso-cleanups-v1-5-d9b65750e49f@linutronix.de>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
In-Reply-To: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=943;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0FWlozWesIsQ0qQyaOP1bY0lFjVrbfKxBVeB1PCnS50=;
 b=9pNh5a5NaguFfKkfKR0EeNJ5Hqk/rS5JHEaeEmX/n8dUdZlkDqHcQrQvn3JOYAA8u+Wl7yvQz
 BQudoqsm8axAvusAQkTMXCgGoVnMLts+duG7XkK6Eop3MTQ6RNupbR9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231823_360015_29B202AA 
X-CRM114-Status: UNSURE (   9.35  )
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

VGhlIGdlbmVyaWMgdkRTTyBjYW4gYmUgdXNlZCB3aXRob3V0IHRoZSB0aW1lLXJlbGF0ZWQgZnVu
Y3Rpb25hbGl0eS4KSW4gdGhhdCBjYXNlIHRoZSBnZW5lcmljIHVwZGF0ZV92c3lzY2FsbCgpIGZy
b20ga2VybmVsL3RpbWUvdnN5c2NhbGwuYwpzaG91bGQgbm90IGJlIGJ1aWx0LgoKU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+
Ci0tLQoga2VybmVsL3RpbWUvTWFrZWZpbGUgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9rZXJuZWwvdGltZS9NYWtlZmls
ZSBiL2tlcm5lbC90aW1lL01ha2VmaWxlCmluZGV4IGU2ZTliODVkNGRiNWY4ZGQ1ZDliNTc0ZWY3
YmIwYTI4MWI5ZGFhNmQuLmY3ZDUyZDk1NDNjYzdhMmQxYTE4ZGIxNzkyMjlhOGQ3OTM2MzE3ZDMg
MTAwNjQ0Ci0tLSBhL2tlcm5lbC90aW1lL01ha2VmaWxlCisrKyBiL2tlcm5lbC90aW1lL01ha2Vm
aWxlCkBAIC0yNiw3ICsyNiw3IEBAIG9iai0kKENPTkZJR19MRUdBQ1lfVElNRVJfVElDSykJCQkr
PSB0aWNrLWxlZ2FjeS5vCiBpZmVxICgkKENPTkZJR19TTVApLHkpCiAgb2JqLSQoQ09ORklHX05P
X0haX0NPTU1PTikJCQkrPSB0aW1lcl9taWdyYXRpb24ubwogZW5kaWYKLW9iai0kKENPTkZJR19I
QVZFX0dFTkVSSUNfVkRTTykJCQkrPSB2c3lzY2FsbC5vCitvYmotJChDT05GSUdfR0VORVJJQ19H
RVRUSU1FT0ZEQVkpCQkrPSB2c3lzY2FsbC5vCiBvYmotJChDT05GSUdfREVCVUdfRlMpCQkJCSs9
IHRpbWVrZWVwaW5nX2RlYnVnLm8KIG9iai0kKENPTkZJR19URVNUX1VERUxBWSkJCQkrPSB0ZXN0
X3VkZWxheS5vCiBvYmotJChDT05GSUdfVElNRV9OUykJCQkJKz0gbmFtZXNwYWNlLm8KCi0tIAoy
LjUwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
