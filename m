Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C6FCA0EFA
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 06:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyhdWNE9x6jnAdwZG/9jliRN9JiKPKUyccDmZcDl9gQ=; b=DyRdphIovLdciA
	qcj39LWVyuqCzQZ1iYC0OBWLNqsfEmMxuC5kEvw31hyoDGUNKRKJkMFj+pne9EcPi8Y0eiRm5T89c
	ZaBTqYIdhBod1iDpUZEZ0tDIpcPsq1uAaEf0C0IFEPJT/dM7czUbXYdnNvt+FBiZHM5P6iSpsNT/M
	f6gOXT/YXlVhP7cn/paQjOYp1+Aw7dzS3ojXwyqQGfDggpaJAy0GIDvrUH84ttAYdZL5fhoeria24
	JngwgQv5kaaMbB43YgRDHclQWCIhSw1bOUV5NI6+atg2FlaVum8q7BV/35yRcpP/L5JYcu00JzK8s
	C9Sfe43YvF3X3sfPx8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnBZ-0000000Ai2r-2tvr;
	Tue, 26 Aug 2025 06:29:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0g-0000000AfAC-0txz;
	Tue, 26 Aug 2025 06:18:24 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nO2JL615du1jOF72APE2zhJ94ZRmncTq0i3UGNr5c1I=;
	b=SkRWsNvTfHbckv53ywkAP2ElLQno6nL35GWoaL2ostie0fB8ZhIrtZ2GpuUn4Yog/ZqbRE
	7Ic6DelZ6GAsCv6r4UwjpNb7cBzSwuWnf7NOkczUv4NJuo6Lqe0iE9DBx6XOvzaIrOUWQo
	ZM0hBzR26cXTRvKvnkNUcchIelDhHzNqPoWVr5FtMu4Nudp2Z1D46OEL1XDCSKSmaZgXIQ
	GVPwi4kCLp7XohVVq/RWPsKA1Z9HMGn618o+O6/M1Ni8zE340s4Kit4LGTyA3C0Me8op4Y
	B3jPvpQhJwWgOn21qfbXuyhpqhYwaUwaTLAGms3NzzYcJcqF5v7lVsAOPnWVQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nO2JL615du1jOF72APE2zhJ94ZRmncTq0i3UGNr5c1I=;
	b=D/AJx/EsJAMGNOGXXQFrdYdT0ZJzLD/RNagxyHMRvN9hYL1zhSX7qy7lWuXYEwi6Dt8f0S
	27kxifT9iftB5EAA==
Date: Tue, 26 Aug 2025 08:17:07 +0200
Subject: [PATCH 04/11] vdso/gettimeofday: Remove !CONFIG_TIME_NS stubs
MIME-Version: 1.0
Message-Id: <20250826-vdso-cleanups-v1-4-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=2241;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=tJipNBF1mCJkcHD6N5bfKjS9Ac/LEi0lcuk3Tu4AjoE=;
 b=7HV/8pMpAQ+4eBDclWEwMfZrJXqv8psYox/k68u7tMzHASoMCDHXlEWrPcIR5Nm0+i+/zA6uc
 bGdBUfDn6tHATjO/gAnAN6QWWAGRNdzrTjLrH/04Nne7yZR3YZZBbeH
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231822_402993_AA6225B1 
X-CRM114-Status: UNSURE (   6.90  )
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

QWxsIGNhbGxzIG9mIHRoZXNlIGZ1bmN0aW9ucyBhcmUgYWxyZWFkeSBnYXRlZCBiZWhpbmQgQ09O
RklHX1RJTUVfTlMuIFRoZQpjb21waWxlciB3aWxsIGFscmVhZHkgb3B0aW1pemUgdGhlbSBhd2F5
IGlmIHRpbWUgbmFtZXNwYWNlcyBhcmUgZGlzYWJsZWQuCgpEcm9wIHRoZSB1bm5lY2Vzc2FyeSBz
dHVicy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPgotLS0KIGxpYi92ZHNvL2dldHRpbWVvZmRheS5jIHwgMjUgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2xpYi92ZHNvL2dldHRpbWVvZmRheS5jIGIvbGliL3Zkc28vZ2V0dGltZW9mZGF5
LmMKaW5kZXggMDJlYTE5ZjY3MTY0N2U5YTFiOGMzZTdlYTBjYmZmMzNiNDAyNDcxMS4uMWUyYTQw
YjhkMmM2YzIzNTZjZmM2NzhhMWVhNDQxZWMxYmFkMTgxYSAxMDA2NDQKLS0tIGEvbGliL3Zkc28v
Z2V0dGltZW9mZGF5LmMKKysrIGIvbGliL3Zkc28vZ2V0dGltZW9mZGF5LmMKQEAgLTEwOCw4ICsx
MDgsNiBAQCBib29sIHZkc29fZ2V0X3RpbWVzdGFtcChjb25zdCBzdHJ1Y3QgdmRzb190aW1lX2Rh
dGEgKnZkLCBjb25zdCBzdHJ1Y3QgdmRzb19jbG9jawogCXJldHVybiB0cnVlOwogfQogCi0jaWZk
ZWYgQ09ORklHX1RJTUVfTlMKLQogI2lmZGVmIENPTkZJR19HRU5FUklDX1ZEU09fREFUQV9TVE9S
RQogc3RhdGljIF9fYWx3YXlzX2lubGluZQogY29uc3Qgc3RydWN0IHZkc29fdGltZV9kYXRhICpf
X2FyY2hfZ2V0X3Zkc29fdV90aW1lbnNfZGF0YShjb25zdCBzdHJ1Y3QgdmRzb190aW1lX2RhdGEg
KnZkKQpAQCAtMTQ5LDIwICsxNDcsNiBAQCBib29sIGRvX2hyZXNfdGltZW5zKGNvbnN0IHN0cnVj
dCB2ZHNvX3RpbWVfZGF0YSAqdmRucywgY29uc3Qgc3RydWN0IHZkc29fY2xvY2sgKgogCiAJcmV0
dXJuIHRydWU7CiB9Ci0jZWxzZQotc3RhdGljIF9fYWx3YXlzX2lubGluZQotY29uc3Qgc3RydWN0
IHZkc29fdGltZV9kYXRhICpfX2FyY2hfZ2V0X3Zkc29fdV90aW1lbnNfZGF0YShjb25zdCBzdHJ1
Y3QgdmRzb190aW1lX2RhdGEgKnZkKQotewotCXJldHVybiBOVUxMOwotfQotCi1zdGF0aWMgX19h
bHdheXNfaW5saW5lCi1ib29sIGRvX2hyZXNfdGltZW5zKGNvbnN0IHN0cnVjdCB2ZHNvX3RpbWVf
ZGF0YSAqdmRucywgY29uc3Qgc3RydWN0IHZkc29fY2xvY2sgKnZjbnMsCi0JCSAgICBjbG9ja2lk
X3QgY2xrLCBzdHJ1Y3QgX19rZXJuZWxfdGltZXNwZWMgKnRzKQotewotCXJldHVybiBmYWxzZTsK
LX0KLSNlbmRpZgogCiBzdGF0aWMgX19hbHdheXNfaW5saW5lCiBib29sIGRvX2hyZXMoY29uc3Qg
c3RydWN0IHZkc29fdGltZV9kYXRhICp2ZCwgY29uc3Qgc3RydWN0IHZkc29fY2xvY2sgKnZjLApA
QCAtMjA0LDcgKzE4OCw2IEBAIGJvb2wgZG9faHJlcyhjb25zdCBzdHJ1Y3QgdmRzb190aW1lX2Rh
dGEgKnZkLCBjb25zdCBzdHJ1Y3QgdmRzb19jbG9jayAqdmMsCiAJcmV0dXJuIHRydWU7CiB9CiAK
LSNpZmRlZiBDT05GSUdfVElNRV9OUwogc3RhdGljIF9fYWx3YXlzX2lubGluZQogYm9vbCBkb19j
b2Fyc2VfdGltZW5zKGNvbnN0IHN0cnVjdCB2ZHNvX3RpbWVfZGF0YSAqdmRucywgY29uc3Qgc3Ry
dWN0IHZkc29fY2xvY2sgKnZjbnMsCiAJCSAgICAgIGNsb2NraWRfdCBjbGssIHN0cnVjdCBfX2tl
cm5lbF90aW1lc3BlYyAqdHMpCkBAIC0yMzMsMTQgKzIxNiw2IEBAIGJvb2wgZG9fY29hcnNlX3Rp
bWVucyhjb25zdCBzdHJ1Y3QgdmRzb190aW1lX2RhdGEgKnZkbnMsIGNvbnN0IHN0cnVjdCB2ZHNv
X2Nsb2NrCiAKIAlyZXR1cm4gdHJ1ZTsKIH0KLSNlbHNlCi1zdGF0aWMgX19hbHdheXNfaW5saW5l
Ci1ib29sIGRvX2NvYXJzZV90aW1lbnMoY29uc3Qgc3RydWN0IHZkc29fdGltZV9kYXRhICp2ZG5z
LCBjb25zdCBzdHJ1Y3QgdmRzb19jbG9jayAqdmNucywKLQkJICAgICAgY2xvY2tpZF90IGNsaywg
c3RydWN0IF9fa2VybmVsX3RpbWVzcGVjICp0cykKLXsKLQlyZXR1cm4gZmFsc2U7Ci19Ci0jZW5k
aWYKIAogc3RhdGljIF9fYWx3YXlzX2lubGluZQogYm9vbCBkb19jb2Fyc2UoY29uc3Qgc3RydWN0
IHZkc29fdGltZV9kYXRhICp2ZCwgY29uc3Qgc3RydWN0IHZkc29fY2xvY2sgKnZjLAoKLS0gCjIu
NTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
