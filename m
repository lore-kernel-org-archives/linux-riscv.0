Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4680ECA0EE4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 06:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xw6Nt5WIJjOyc53mu+N5Nwnd2ud2gsOrrEKQ/GnVQgc=; b=za4oUAOvxjBxjT
	j7n+LG6Dn8UyacZss//GwLnHJJ4YYmszdOyp9/+0/N+apURgkTKriOr22jc7L3uxTh/6+FoBxeyHs
	5iaoSrIlltlv7QYQ2xw/uyspf8Iyeta0gv8+idX5XrPbltfpoEiiipKRyX6MHR8sITKV5niHN1iOa
	QLmmcUqcGOSKa6uc1zcJZl2oRr2V3yIk2458l/so9nADq5XYrtNMrYDWMTD5LkMM9Tds5CFRVhB+d
	Y1JYYWomE2Gw3ZAyhI1Irn35OVA3anpbr67OD9PhoQB5AErZwZc/ErrTGT4fMod4IuNOywpY95t9P
	jNsO9dISy5WWNxdEJwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnMG-0000000AjLQ-19i3;
	Tue, 26 Aug 2025 06:40:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0i-0000000AfCw-1FJ5;
	Tue, 26 Aug 2025 06:18:26 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrBALLudUMMQIpB9Jb++BwmBRlfN0yHG1/njX6fnTE0=;
	b=s4Tv7+zxFO1UuAQBOJqY36fYzoMoq9HBwuIpEoBOQcWaZh9/ewd4GAmLh1SU0pUebpqr7O
	IrbBTzCLj7CJDuzlV6Dcdr1OqFm6SyO764o/62pnvhkTGUXW7ugMG+bh1U2I/2k0NNBSr5
	OP1XpFRZEaXTaVFqIq3YdSg5+qsRfdKUKvpdsuwozMooSfzSGI0VUbRnkjOqSx5qOrar6I
	ypdEH+UclFWViex+hKIMMrHA9akYZJ7i5W7/rVbBGGVIoe66Tmy8jOSesu8OQcaEiRtLvM
	BHYdoRiODg0CG8wUQD0HRSdvaeLU921bXP6hDATICdIR91DBtxAh0Kw0aN0s1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrBALLudUMMQIpB9Jb++BwmBRlfN0yHG1/njX6fnTE0=;
	b=aMy3eGdfoQdV0esGEjqNzj2T+GNVN9Gu5aP0E8xfdTY9CE2D/Ql6h41CsmHASq33jrTvgS
	d2ksM8s+JfbrYcAg==
Date: Tue, 26 Aug 2025 08:17:10 +0200
Subject: [PATCH 07/11] vdso: Drop kconfig GENERIC_VDSO_32
MIME-Version: 1.0
Message-Id: <20250826-vdso-cleanups-v1-7-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=1702;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MIu9l2pTXbhJrvGPCmWjImoXUcbBkNjVmM+9aAFDkec=;
 b=VT2YYQvzHfODm57uAqR09c1duKjkkmGSVqmCVlLdgGb/ARCoX9KqMLFcxG4POgZTTs3Rm7rqY
 RTH8Lz9nPvLBWpZeMT5QB55ugWOPWVYU1mHssRVmDUpj+5tIKw9H+EU
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231824_538785_98D72BCC 
X-CRM114-Status: UNSURE (   7.52  )
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
LS0tCiBhcmNoL2FybS9tbS9LY29uZmlnIHwgMSAtCiBhcmNoL3g4Ni9LY29uZmlnICAgIHwgMSAt
CiBsaWIvdmRzby9LY29uZmlnICAgIHwgNyAtLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0vS2NvbmZpZyBiL2FyY2gvYXJtL21t
L0tjb25maWcKaW5kZXggNWMxMDIzYTZkNzhjMWI0ZGI2N2IyZDYyYjcxYWY1YTc5YjdlNzAxZi4u
MjM0Nzk4OGNmNjQxN2I5MWQ4ZDM1ODAzODdiNTNlNjEwZWQ0OWEwMCAxMDA2NDQKLS0tIGEvYXJj
aC9hcm0vbW0vS2NvbmZpZworKysgYi9hcmNoL2FybS9tbS9LY29uZmlnCkBAIC05MjYsNyArOTI2
LDYgQEAgY29uZmlnIFZEU08KIAlkZWZhdWx0IHkgaWYgQVJNX0FSQ0hfVElNRVIKIAlzZWxlY3Qg
SEFWRV9HRU5FUklDX1ZEU08KIAlzZWxlY3QgR0VORVJJQ19USU1FX1ZTWVNDQUxMCi0Jc2VsZWN0
IEdFTkVSSUNfVkRTT18zMgogCXNlbGVjdCBHRU5FUklDX0dFVFRJTUVPRkRBWQogCXNlbGVjdCBH
RU5FUklDX1ZEU09fREFUQV9TVE9SRQogCWhlbHAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L0tjb25m
aWcgYi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IDU4ZDg5MGZlMjEwMGViNjk5MDg4MGJjZjViYTYw
MGNkZWZiMGE3ZDEuLjRmMTIwMDcwYTUxYmQ0ZTIyNTI1NjQ0MDY0OWEyZGFlMTcwMjVjNDEgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L0tjb25maWcKKysrIGIvYXJjaC94ODYvS2NvbmZpZwpAQCAtMTQs
NyArMTQsNiBAQCBjb25maWcgWDg2XzMyCiAJc2VsZWN0IEFSQ0hfV0FOVF9JUENfUEFSU0VfVkVS
U0lPTgogCXNlbGVjdCBDTEtTUkNfSTgyNTMKIAlzZWxlY3QgQ0xPTkVfQkFDS1dBUkRTCi0Jc2Vs
ZWN0IEdFTkVSSUNfVkRTT18zMgogCXNlbGVjdCBIQVZFX0RFQlVHX1NUQUNLT1ZFUkZMT1cKIAlz
ZWxlY3QgS01BUF9MT0NBTAogCXNlbGVjdCBNT0RVTEVTX1VTRV9FTEZfUkVMCmRpZmYgLS1naXQg
YS9saWIvdmRzby9LY29uZmlnIGIvbGliL3Zkc28vS2NvbmZpZwppbmRleCA0NWRmNzY0YjQ5YWQ2
MjQ3OWU2NDU2ZTAwYzA1M2U0NjEzMTkzNmEzLi43NjE1N2MyNjkzMWQyODMyNzc1MGFkNTNiZmNh
ZTUxMDlhMjlkOTk4IDEwMDY0NAotLS0gYS9saWIvdmRzby9LY29uZmlnCisrKyBiL2xpYi92ZHNv
L0tjb25maWcKQEAgLTEyLDEzICsxMiw2IEBAIGNvbmZpZyBHRU5FUklDX0dFVFRJTUVPRkRBWQog
CSAgRWFjaCBhcmNoaXRlY3R1cmUgdGhhdCBlbmFibGVzIHRoaXMgZmVhdHVyZSBoYXMgdG8KIAkg
IHByb3ZpZGUgdGhlIGZhbGxiYWNrIGltcGxlbWVudGF0aW9uLgogCi1jb25maWcgR0VORVJJQ19W
RFNPXzMyCi0JYm9vbAotCWRlcGVuZHMgb24gR0VORVJJQ19HRVRUSU1FT0ZEQVkgJiYgITY0QklU
Ci0JaGVscAotCSAgVGhpcyBjb25maWcgb3B0aW9uIGhlbHBzIHRvIGF2b2lkIHBvc3NpYmxlIHBl
cmZvcm1hbmNlIGlzc3VlcwotCSAgaW4gMzIgYml0IG9ubHkgYXJjaGl0ZWN0dXJlcy4KLQogY29u
ZmlnIEdFTkVSSUNfQ09NUEFUX1ZEU08KIAlib29sCiAJaGVscAoKLS0gCjIuNTAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
