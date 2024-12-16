Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55DBE7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIGjAwmyZYUB72bSNwgYyCSAWDxJ8kuehdSGT7iizmc=; b=q5BLoy7dJBc7Pa
	oNp08Pgv46gNFhAMdnwoDF5dTm9/WxB9XbzbbAeHOCJ8RRxWTjiDGhJhBh0VoMbT1e7Nt3hLkdVci
	X9b6Zp4atApSXBesplRLU/LzuaePMVSs6H7nZAHFkeC+nAfPQD7fqU3baq2PNAD07/SmU49DqFebJ
	hAKv+9mtR5Ykiony5Euh74xw2LMFJje7ZfktwWx3w03ftuWum/l3RR8DBIzhWzkyuWNf3BqkR2pYD
	DAxd0tf63K7Wa1b5SwU+SVVVHiym/2WsBDz6VP4KUnZoWDHiSfXTasOliFUfEL0PxwPB7Xeok7aZY
	uR8kpJ2YDaQxSAzNRlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBvU-0000000ADbs-2Ky1;
	Mon, 16 Dec 2024 14:18:24 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBoE-0000000ABNO-21lJ;
	Mon, 16 Dec 2024 14:10:55 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbUS2hSpGUfA91ZBUqWCU2EUGjDUwjlK6bc3CIpIefE=;
	b=GuH2uzo5FyR0o68VJgLh22/tvAh4VO3tEUIc29jvZ8lPLWfEUfhNVtSSK4HXCnohLAwbXo
	gEvHjDWSFgEqrnTfKdaUVzxP8s5vskJ2urPXPUkPw83/2mrnYmmUmtERhGRPRyqbznf4z/
	TVaywADhuO62/QPyaae+wx5X5FFV9M6xrmUCZwtSxnJjI7TGlFQtv14U1ie1HeMP7FyoI3
	c1H/xkAQk/cMW7DvQZU32HKaDQtXwDyR962kNnn2WJH5P5qddPMfspglgzNhxbDwOoN8y+
	dtTDWffUBFUBMw1UmRJd6JaZJDQjLnMLryFw+HzWyUuw08nbuaNBceWbkpr+/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbUS2hSpGUfA91ZBUqWCU2EUGjDUwjlK6bc3CIpIefE=;
	b=hHswSq9RfYopT6aqpSY7CX9cu9WJ1N9ZlLIWnRYrgQChCxsQi0dPawuK/Q9SjHGdFt/Ezg
	DmHWkKKYf0nrzRBw==
Date: Mon, 16 Dec 2024 15:09:57 +0100
Subject: [PATCH 01/17] parisc: Remove unused symbol vdso_data
MIME-Version: 1.0
Message-Id: <20241216-vdso-store-rng-v1-1-f7aed1bdb3b2@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
In-Reply-To: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=796;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NPXgHz1pg7k88XY5Q1tIpqIToZjmPGQbKRJBGkTsdlQ=;
 b=qIq583Nq2J6WTZk5uFF7tgmMVMT+mFXj9RQI8M6crN6E2uuxfEuALnkyGREgmp/vYO82I170d
 yKTyVvOCDqzB5fc8Z9c7wx+qHEKzuwOd6U9tdpzQYbFVujg6jSoRO3t
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_061054_689273_2BA6941E 
X-CRM114-Status: UNSURE (   8.33  )
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

VGhlIHN5bWJvbCB2ZHNvX2RhdGEgaXMgYW5kIGhhcyBiZWVuIHVudXNlZC4KUmVtb3ZlIGl0LgoK
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0
cm9uaXguZGU+Ci0tLQogYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vdmRzby5oIHwgMiAtLQogMSBm
aWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wYXJpc2MvaW5j
bHVkZS9hc20vdmRzby5oIGIvYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vdmRzby5oCmluZGV4IDJh
MmRjMTFiNTU0NWZjNjQyYTdhZTQ1OTZkYzE3NDExMTQzM2U5NDguLjVmNTgxYzFkNjQ2MDZiM2Vj
OGY5OTY3ZWZlMzFkZDNkNTUxYWRmNzYgMTAwNjQ0Ci0tLSBhL2FyY2gvcGFyaXNjL2luY2x1ZGUv
YXNtL3Zkc28uaAorKysgYi9hcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS92ZHNvLmgKQEAgLTEyLDgg
KzEyLDYgQEAKICNkZWZpbmUgVkRTTzY0X1NZTUJPTCh0c2ssIG5hbWUpICgodHNrKS0+bW0tPmNv
bnRleHQudmRzb19iYXNlICsgKHZkc282NF9vZmZzZXRfIyNuYW1lKSkKICNkZWZpbmUgVkRTTzMy
X1NZTUJPTCh0c2ssIG5hbWUpICgodHNrKS0+bW0tPmNvbnRleHQudmRzb19iYXNlICsgKHZkc28z
Ml9vZmZzZXRfIyNuYW1lKSkKIAotZXh0ZXJuIHN0cnVjdCB2ZHNvX2RhdGEgKnZkc29fZGF0YTsK
LQogI2VuZGlmIC8qIF9fQVNTRU1CTFkgX18gKi8KIAogLyogRGVmYXVsdCBsaW5rIGFkZHJlc3Nl
cyBmb3IgdGhlIHZEU09zICovCgotLSAKMi40Ny4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
