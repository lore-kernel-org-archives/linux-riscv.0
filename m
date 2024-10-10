Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A87CFC5E2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 17:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wgq287fUzlTe5A2gG+QvgT0jAVM2gfgNCzibwe5Hso0=; b=HhFw9FV+n4GEhv
	bTUfDrNhvx8AR0y8BuqtVRK99eEpxh8281fDgErCza2CPNeGe0UCsuBNhxl5phgPgA+rcSrTSl1Yf
	WPjozPKRatoLeabpQnk3dJvrmmr9hSnOsZG/u5UZFxeepnlojIXZQQsUz4eScn7CVyRL+98Re6Tvx
	EDuc1dP9ZNowLrQ82h71DbC66yybvirr5ga8kuSLOUXA1Ui7M5tzbnd2qXhDAZX5G0+cUJUiipAcW
	x3jL/q6HtZGLOSBVC9tMsi9eTUt5Ub5QCtjMunxiuQeH9qW0/h/gRrXPHUX4E6oZ680jHLxPWPgTS
	jpuz90DhQuQ/hnyM8ncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sywlv-0000000Ddqw-2HLu;
	Thu, 10 Oct 2024 17:16:19 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLT-0000000DOZ9-3IwG;
	Thu, 10 Oct 2024 15:45:11 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/XG6DQ3PsHd/P8r1A05s25oqNbuRg7CSOZvJqQ2RQY=;
	b=dpPnWgCGSIyojR8YOPIODHalfROtG8LEH56sRq5mxfbjyLOjCbAUcmwaMEXu2cZKvV/k45
	TqCsVhu9RjkkmSOOJHJuqXZYoGPFsnkOmbDlhYNvgEwJazOCAwr7sFuf/q/XCr4AxLc7LI
	dGsxxC8lKbH5MGgIEHmr9FLo/VCp+48X0ADki3jRqZ/GrQ8GTJ5MvsMbi/3zfKTl9GhNeF
	/N7gQZM/KxB9RCxX8j9UYsUadv+fsFOCt06p+0Ld11JPrc7spDgGOZClIoMnEmkNtFpvTn
	qiejVdTPUtzvFiteYKw1WjMoVONiwOUIOPbvghvXF0iSUCKHrMeOEpRwaBMY/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/XG6DQ3PsHd/P8r1A05s25oqNbuRg7CSOZvJqQ2RQY=;
	b=yPC6uHm4/dZnVaE4EHlAEdw716wEYkItVZ5dtEr3RPr0fP8aCnTfCm4qYZzbKZLqlRrUy4
	YQ6+oBRsFvnQKADA==
Date: Thu, 10 Oct 2024 17:44:46 +0200
Subject: [PATCH 3/9] arm64: vdso: Remove timekeeper include
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-3-7fe5a3ea4382@linutronix.de>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=720;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=bvh1jJWpx42LXX2Lx1XPkC92g2mUzF72aNPhVvbLrZk=;
 b=YGgVa8cvZKIl5iidwiNogphb+kk0LhZ+d6YHOWerWO8c9r/x3PAzZfBvmQFoMG57QQRIjERP8
 AcrvpsLRlIwDMa7tDFUUIPvzlus1/YLClhqc8iu++BgbyiMoYVBpqbz
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_084456_027675_F118EF83 
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

U2luY2UgdGhlIGdlbmVyaWMgVkRTTyBjbG9jayBtb2RlIHN0b3JhZ2UgaXMgdXNlZCwgdGhpcyBo
ZWFkZXIgZmlsZSBpcwp1bnVzZWQgYW5kIGNhbiBiZSByZW1vdmVkLgoKU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQog
YXJjaC9hcm02NC9rZXJuZWwvdmRzby5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3Zkc28uYyBiL2FyY2gvYXJtNjQv
a2VybmVsL3Zkc28uYwppbmRleCA3MDZjOWMzYTdhNTBhNDU3NGU3N2RhMjk2ZTljODNlMWUyYTlm
NWFiLi44ZWYyMGMxNmJjNDgyZTkyZGU4MDk4ZDU1MDAwYzk5OTliODk4MzBlIDEwMDY0NAotLS0g
YS9hcmNoL2FybTY0L2tlcm5lbC92ZHNvLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvdmRzby5j
CkBAIC0xOSw3ICsxOSw2IEBACiAjaW5jbHVkZSA8bGludXgvc2lnbmFsLmg+CiAjaW5jbHVkZSA8
bGludXgvc2xhYi5oPgogI2luY2x1ZGUgPGxpbnV4L3RpbWVfbmFtZXNwYWNlLmg+Ci0jaW5jbHVk
ZSA8bGludXgvdGltZWtlZXBlcl9pbnRlcm5hbC5oPgogI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2Mu
aD4KICNpbmNsdWRlIDx2ZHNvL2RhdGFwYWdlLmg+CiAjaW5jbHVkZSA8dmRzby9oZWxwZXJzLmg+
CgotLSAKMi40Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
