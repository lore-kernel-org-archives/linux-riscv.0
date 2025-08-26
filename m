Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA11BCA0EE4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eh7d4dhX0KMGsgTmxKUSzaqP/SySDr5h83/84kFFVk=; b=ETrO4gWDD7Shp6
	4YnQrj8+d1KSOGQwiw3btqkRQ7k69awch/LA8NtVuf2aP1l/YSycKVcUvrp8YkOIIyaCvcwghsPKk
	kO8ILZqNbnny5VACR3dK6sDEdxyAZceddQr/xbGcO3qxLUJp8Dx/69jFO3z48jDpr6Q7SVkWz/SOq
	tqOLaZhIvC0cf+8bnNP4lgRjYLmlSCeCkfswAQ+dAou1RW20T9zHTckqQuhCGSvpDyXYca++uehdH
	o2G3iEWAwP/eIksWnlhvIAHWzFfZr+Wk4sEoIqXL9IybG62S3NbYgyxgg+x+9Rt/e/XzP4MA9JB/c
	0JBwiPcZdKtXudPT3xvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnWr-0000000AkwZ-2kOT;
	Tue, 26 Aug 2025 06:51:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0m-0000000AfI7-0om0;
	Tue, 26 Aug 2025 06:18:31 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUyzbl96JnTO9V3eNt5MssqL9K7R8ZPYrzwmUDypjtQ=;
	b=qff84UmwLm8iFQvqm09Om+iEel23vC9BJ1wHMhpnGuRjjiVtocG2gJc/efnzy7UGv0bqDh
	X4YctMH0aSIUxDd3i6X4JoDQFU5IM3b5mriVj4iiUX/4ke9TsrEXJU+QjgXN9L2Hvg/r1e
	gVrERdEyqsHFDbRTatoD2jUbrkzofjIHreOcsZGCDEtvBgy1C9OjuykTbsIoRwvmsiEo67
	TT3uKBDVEPfUk1K7JbyuNP89aqNk5szSg7Q98Esgpnao8uytgt5ztulcsAYjKovknEd1Gv
	DdfAb+Xqa/DsFSf6/Qptu/gAQ+92+1NXjLnQVTycTHPHpfQqUdNFtsZzBM1PEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUyzbl96JnTO9V3eNt5MssqL9K7R8ZPYrzwmUDypjtQ=;
	b=faCkWxdjd3FeEyW+rea8Q+WUcDNk36hjcPMaS1Mmo0pdEShLBn6gpn0pA+neXsTYaNOZIy
	GVnfWQSajoT7S0Ag==
Date: Tue, 26 Aug 2025 08:17:14 +0200
Subject: [PATCH 11/11] vdso: Gate VDSO_GETRANDOM behind HAVE_GENERIC_VDSO
MIME-Version: 1.0
Message-Id: <20250826-vdso-cleanups-v1-11-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=740;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=e70kJzk3rr3WiO6RHhXGvE8arznJOv7er7zNzG1lBZY=;
 b=Q6ersM0eWZuFWFRqw7St9QnfIHgjvUfXPslz3bmlle7dR6R1Tm8FlCD46/a/HTAHi+acl41TM
 HHiIuT3vNAnDyILoXrbvH+hSpTHjerUzqwG/UiWNkrt8K08Oly20NA4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231828_408690_93E1010F 
X-CRM114-Status: UNSURE (   8.62  )
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

QWxsIGFyY2hpdGVjdHVyZXMgd2hpY2ggd2FudCB0byBpbXBsZW1lbnQgZ2V0cmFuZG9tKCkgaW4g
dGhlIHZEU08gbmVlZCB0bwp1c2UgdGhlIGdlbmVyaWMgdkRTTyBsaWJyYXJ5LgoKU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+
Ci0tLQogbGliL3Zkc28vS2NvbmZpZyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvdmRzby9LY29uZmlnIGIv
bGliL3Zkc28vS2NvbmZpZwppbmRleCAzZDJjMmI5MGQxOTNmOTg0ZTNhMjAyZTcwMWZhN2YwYmZh
OGYxOTM4Li5kYjg3YmEzNGVmMTkyOGZhYzBkNWM1OGFiY2E4NjMxMjY4N2NjMTU5IDEwMDY0NAot
LS0gYS9saWIvdmRzby9LY29uZmlnCisrKyBiL2xpYi92ZHNvL0tjb25maWcKQEAgLTE5LDkgKzE5
LDkgQEAgY29uZmlnIEdFTkVSSUNfVkRTT19PVkVSRkxPV19QUk9URUNUCiAJICB0aW1lIGdldHRl
ciBmdW5jdGlvbnMgZm9yIHRoZSBwcmljZSBvZiBhbiBleHRyYSBjb25kaXRpb25hbAogCSAgaW4g
dGhlIGhvdHBhdGguCiAKLWVuZGlmCi0KIGNvbmZpZyBWRFNPX0dFVFJBTkRPTQogCWJvb2wKIAlo
ZWxwCiAJICBTZWxlY3RlZCBieSBhcmNoaXRlY3R1cmVzIHRoYXQgc3VwcG9ydCB2RFNPIGdldHJh
bmRvbSgpLgorCitlbmRpZgoKLS0gCjIuNTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
