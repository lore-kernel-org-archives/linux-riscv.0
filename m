Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4DFCA0EE4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 06:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2h9If+1Bhc+886iixFAJA6NKcVEVzQQ9KK3cqJksPyY=; b=L6x8NCzgVWt22B
	Q0IiN6txaEfkF3SiDatQlGfZAUb5re1qwqH0DSam6xbyv1BOc00BthPI+GtLtocUBY1CDzDCQ87FN
	ZgPK0llpUDbnnkfQiYqfojnpuQo90CShSEOK/79J0m0XIvJ37HTWqqGVuQsjdvcHGTgEufWpCPOHP
	uE31lvwhITXfe9oVad8rKaEPYQm7yyTKQxwCMszfhrwLURAhyL0wneBZvYRv+E7lwh7PT8khAovgL
	/jqaNR+y5149WAiSqeqUn5+yamD7FXFLcji50qItTWbnXDGpndOqZyFKQoT4Oqc4CnHT3iFAQu+o3
	KxHBVQ15TUvfeXPB3H2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnOt-0000000AjiC-3DUN;
	Tue, 26 Aug 2025 06:43:23 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0i-0000000AfDL-1b3k;
	Tue, 26 Aug 2025 06:18:27 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0t+60eV41IKUZ9ezcmekgKTWqNgupDcJulsKXmUteXI=;
	b=RgDlVbjO8jhuoPY4mfKuN7Slnu45ISnAWFOw/cSKuUrM166A5Xf4Erm/D2UDrSZRjb+TRd
	kgmua8gHOCLunG9wwz2DpSTBXdpmSEa71Lb0hP+HK5ysGZ4To/F9r9b4YwQ9GRjarwPVe9
	uS9AhT4Sz0+dbivk9lEzt4gd1nc4bK5HMZCjdAVtZW/0Fq3ATh+T7SGWw+DWsEEnez8l0S
	l+JOMfNCM36pb3xgaN/Xdoh5jXwrQ/yCb90R7Ig/RRuSEtYwhJZ6k4ETPQI7pdrgOQZwVs
	cqIUgd5QTF7ISENOyaqbvQpo+sHhZmxunt2tS6GEfzGIrgBnNf5Lv/0G9tlpGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0t+60eV41IKUZ9ezcmekgKTWqNgupDcJulsKXmUteXI=;
	b=8pcUg9DoAWVBxDLyXzgtGwnNadG0alezHP8Es7YoGFl4eRzHD98RNasRncD8HY+yHWoxjq
	+eUsVcLyCZNMQYCA==
Date: Tue, 26 Aug 2025 08:17:11 +0200
Subject: [PATCH 08/11] vdso: Drop kconfig GENERIC_COMPAT_VDSO
MIME-Version: 1.0
Message-Id: <20250826-vdso-cleanups-v1-8-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=1240;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=t5/9HDmyIs2t4g7FWEeD3BGuAZjUNxjgX5TY/5a0ZYE=;
 b=CNBKp7BJyz4ivh16tO14JDMhakvNZC/uzVXIEyWpElrKLVyg8TDExe/3LZIlXzjfpdnGKz/bi
 sJVuBe1Vf4yBKs8TudfOmPB/74FMQCcA5A/RjRFrYkYOWqYvHO0ISoL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231824_647443_92B9E843 
X-CRM114-Status: UNSURE (   7.50  )
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

VGhpcyBjb25maWd1cmF0aW9uIGlzIG5ldmVyIHVzZWQuCgpSZW1vdmUgaXQuCgpTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4K
LS0tCiBhcmNoL2FybTY0L0tjb25maWcgfCAxIC0KIGxpYi92ZHNvL0tjb25maWcgICB8IDUgLS0t
LS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L0tjb25maWcgYi9hcmNoL2FybTY0L0tjb25maWcKaW5kZXggZTliYmZhY2MzNWE2NGQ3ZWYx
NzkzYTVkN2Y3ZmY4ZGIxMzhmMjgxNC4uNWM2MWIxOWVhOWM4MDU1OWNhM2M0ZDFhYTA3MzJjNjEy
NjQ5NGNiMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9LY29uZmlnCisrKyBiL2FyY2gvYXJtNjQv
S2NvbmZpZwpAQCAtMTc4Miw3ICsxNzgyLDYgQEAgY29uZmlnIENPTVBBVF9WRFNPCiAJYm9vbCAi
RW5hYmxlIHZEU08gZm9yIDMyLWJpdCBhcHBsaWNhdGlvbnMiCiAJZGVwZW5kcyBvbiAhQ1BVX0JJ
R19FTkRJQU4KIAlkZXBlbmRzIG9uIChDQ19JU19DTEFORyAmJiBMRF9JU19MTEQpIHx8ICIkKENS
T1NTX0NPTVBJTEVfQ09NUEFUKSIgIT0gIiIKLQlzZWxlY3QgR0VORVJJQ19DT01QQVRfVkRTTwog
CWRlZmF1bHQgeQogCWhlbHAKIAkgIFBsYWNlIGluIHRoZSBwcm9jZXNzIGFkZHJlc3Mgc3BhY2Ug
b2YgMzItYml0IGFwcGxpY2F0aW9ucyBhbgpkaWZmIC0tZ2l0IGEvbGliL3Zkc28vS2NvbmZpZyBi
L2xpYi92ZHNvL0tjb25maWcKaW5kZXggNzYxNTdjMjY5MzFkMjgzMjc3NTBhZDUzYmZjYWU1MTA5
YTI5ZDk5OC4uMjU5NGRkNzE4NWJlNzYyYTRhOTRhYTM4ZWNlYzVkYjAxNjc3NmY4NSAxMDA2NDQK
LS0tIGEvbGliL3Zkc28vS2NvbmZpZworKysgYi9saWIvdmRzby9LY29uZmlnCkBAIC0xMiwxMSAr
MTIsNiBAQCBjb25maWcgR0VORVJJQ19HRVRUSU1FT0ZEQVkKIAkgIEVhY2ggYXJjaGl0ZWN0dXJl
IHRoYXQgZW5hYmxlcyB0aGlzIGZlYXR1cmUgaGFzIHRvCiAJICBwcm92aWRlIHRoZSBmYWxsYmFj
ayBpbXBsZW1lbnRhdGlvbi4KIAotY29uZmlnIEdFTkVSSUNfQ09NUEFUX1ZEU08KLQlib29sCi0J
aGVscAotCSAgVGhpcyBjb25maWcgb3B0aW9uIGVuYWJsZXMgdGhlIGNvbXBhdCBWRFNPIGxheWVy
LgotCiBjb25maWcgR0VORVJJQ19WRFNPX1RJTUVfTlMKIAlib29sCiAJaGVscAoKLS0gCjIuNTAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
