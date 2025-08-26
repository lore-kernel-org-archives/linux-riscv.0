Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C36ECA0EFA
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 06:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9wTur2Mzs12fC8H54UQDyHvFMZesvA6/WWpq3EuXOk=; b=Xnahe6jTMaR2ZS
	mNRukFbAfMAoEEH/GDotEB90t+FqJSskP1lkGUm0NsT8nHAEgyAfZSecylqpuRL8fMX/I/GZz1g8h
	txit+UNGITYB404CFD2YHorOPBrAKxSZFZ9ynCgaD0cRQbTFOdQHJjsF3x9wvoLiKObj1mpRlmnpq
	A/dI5V5D4Sq3OOitXKpTYBNQqIj8nOixry23MyGZCe+59v8gIdQEHV7Vcw/UmEetDCM7McqOP6iZu
	ejV1QjSjGlnlKJ0h3KHD36nZyzFPV641nZSRX6FZozMtHoKm/Qx83RYIHX7gwNHax3H6PsI3xx7yw
	7BliBQDCKdRJUT0MuUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnUD-0000000AkUa-149W;
	Tue, 26 Aug 2025 06:48:53 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn0l-0000000AfGu-1Ue3;
	Tue, 26 Aug 2025 06:18:30 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=00y01OmKPjr+YdPvdy9NsH/C2OJJ9fAEykZ3VyZpYfg=;
	b=DAc4iLrKuN+M+TOt2+xBDr6GUf8Y+cWVjZjW54ZqF9gbyUcomycDMYt0MNd+RCDVDFxGIj
	GWBLzIDOIEBZI2Q3+lI6pDJsjVzN2ky5/94njRSPQaA7XWRC7BOPy1Mz55nIW5YH/9cDx7
	G6899qdmXG1N5aBrGBR5SbfPnYPkKZ8njo6qC7PIonCtPdxCvUB9VNos964+cOQgPbd5r6
	w8cIWWRNKPfx4djdnrulbwrK8dHtTKzVUsXIVZl+HtzorafUAt8NuoNQ1iKJJlZTyBZjSa
	SAC2qNDuNew7qNYdA2d8Y7fs4rF9WW+J9j0qgdNerC8HQxVUXghOykmTYnFhcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=00y01OmKPjr+YdPvdy9NsH/C2OJJ9fAEykZ3VyZpYfg=;
	b=AX9iVgCXqKuu4L6HhXkJ+97B1ymhvpjttVlSkJHN09WecyWSAf6K0wAjn4fwnsw/AEPVrD
	zB+AR9YgMKMJ1XAQ==
Date: Tue, 26 Aug 2025 08:17:13 +0200
Subject: [PATCH 10/11] vdso: Drop kconfig GENERIC_VDSO_TIME_NS
MIME-Version: 1.0
Message-Id: <20250826-vdso-cleanups-v1-10-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=5371;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=N7oBdG4JS+7twrqHzr/Z86nbv0D0RBhgF8hDZPGWiNM=;
 b=vy3GZ3Eshc21Vat8tHZboKb1mtEwhlFsFG8/DJ24/IXqJYOQoeYjtQ3coAR4v/XIPXTGTA7XY
 6MLp0cx58eVBMdqbybOMVOS4l6C3HhEy0OibmDevHkFXDXmPSE/hSy/
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_231827_789471_C4E522DD 
X-CRM114-Status: GOOD (  12.32  )
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

QWxsIGFyY2hpdGVjdHVyZXMgaW1wbGVtZW50aW5nIHRpbWUtcmVsYXRlZCBmdW5jdGlvbmFsaXR5
IGluIHRoZSB2RFNPIGFyZQp1c2luZyB0aGUgZ2VuZXJpYyB2RFNPIGxpYnJhcnkgd2hpY2ggaGFu
ZGxlcyB0aW1lIG5hbWVzcGFjZXMgcHJvcGVybHkuCgpSZW1vdmUgdGhlIG5vdyB1bm5lY2Vzc2Fy
eSBrY29uZmlnIHN5bWJvbC4KCkVuYWJsZXMgdGhlIHVzZSBvZiB0aW1lIG5hbWVzcGFjZXMgb24g
YXJjaGl0ZWN0dXJlcywgd2hpY2ggdXNlIHRoZQpnZW5lcmljIHZEU08gYnV0IGRpZCBub3QgZW5h
YmxlIEdFTkVSSUNfVkRTT19USU1FX05TLCBuYW1lbHkgTUlQUyBhbmQgYXJtLgoKU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+
CgotLS0KVGVjaG5pY2FsbHkgdGhpcyBpcyBzdGlsbCB0b28gcmVzdHJpY3RpdmUsIGFzIGl0IHBy
ZXZlbnRzIGFyY2hpdGVjdHVyZXMKd2l0aG91dCBhIHJlYWwgdkRTTyB0byBlbmFibGUgQ09ORklH
X1RJTUVfTlMuIFJpZ2h0IG5vdyB0aGlzIHJlc3RyaWN0aW9uCm9ubHkgcHJvdGVjdHMgdGhlIFNQ
QVJDIHZEU08uIEkgaGF2ZSBwYXRjaGVzIHRvIGRyb3AgaXQgY29tcGxldGVseSwKYXMgc29vbiBh
cyBTUEFSQyBpcyB1c2luZ3RoZSBnZW5lcmljIHZEU08uCi0tLQogYXJjaC9hcm02NC9LY29uZmln
ICAgICAgICAgICAgICAgICAgIHwgMSAtCiBhcmNoL2xvb25nYXJjaC9LY29uZmlnICAgICAgICAg
ICAgICAgfCAxIC0KIGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAgICAgICAgICB8IDEgLQog
YXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgIHwgMSAtCiBhcmNoL3MzOTAvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgfCAxIC0KIGFyY2gveDg2L0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICB8IDEgLQogaW5pdC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MiArLQogbGliL3Zkc28vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgNiAtLS0tLS0KIHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3BpZGZkL2NvbmZpZyB8IDEgLQogOSBmaWxlcyBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9LY29uZmlnIGIvYXJjaC9hcm02NC9LY29uZmlnCmluZGV4IGIwZjAwN2IzOTZjODE5MDZkM2Ew
YTY2ZjhhMjQwZDk3ZTBhZTJkODguLmUxOWIwMDY4NDJlMjIzNDQxYjg3MzcwYTVhZTIzNzU2ZTBl
ODU4ODMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvS2NvbmZpZworKysgYi9hcmNoL2FybTY0L0tj
b25maWcKQEAgLTE2Miw3ICsxNjIsNiBAQCBjb25maWcgQVJNNjQKIAlzZWxlY3QgR0VORVJJQ19T
TVBfSURMRV9USFJFQUQKIAlzZWxlY3QgR0VORVJJQ19USU1FX1ZTWVNDQUxMCiAJc2VsZWN0IEdF
TkVSSUNfR0VUVElNRU9GREFZCi0Jc2VsZWN0IEdFTkVSSUNfVkRTT19USU1FX05TCiAJc2VsZWN0
IEhBUkRJUlFTX1NXX1JFU0VORAogCXNlbGVjdCBIQVNfSU9QT1JUCiAJc2VsZWN0IEhBVkVfTU9W
RV9QTUQKZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcgYi9hcmNoL2xvb25nYXJj
aC9LY29uZmlnCmluZGV4IGQxNWIyMDFkNTVmOTUxZDk1NDM1YTM4Nzg5Y2Y0N2VhOWYwYWRhYzku
Ljc1NDYyNmI1OGI5MjllNjA1ZDUxYzQ0MWNmYTg2MmJkNTA0YjU4OTIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvbG9vbmdhcmNoL0tjb25maWcKKysrIGIvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZwpAQCAtMTA4
LDcgKzEwOCw2IEBAIGNvbmZpZyBMT09OR0FSQ0gKIAlzZWxlY3QgR0VORVJJQ19TQ0hFRF9DTE9D
SwogCXNlbGVjdCBHRU5FUklDX1NNUF9JRExFX1RIUkVBRAogCXNlbGVjdCBHRU5FUklDX1RJTUVf
VlNZU0NBTEwKLQlzZWxlY3QgR0VORVJJQ19WRFNPX1RJTUVfTlMKIAlzZWxlY3QgR1BJT0xJQgog
CXNlbGVjdCBIQVNfSU9QT1JUCiAJc2VsZWN0IEhBVkVfQVJDSF9BVURJVFNZU0NBTEwKZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKaW5kZXgg
NzhjODJhZjk1NTYxNmM1N2FiMzhlYTEyNDFlMzQ3MWViOGQwYTY1ZC4uZDcxNWUzZDY1YjVjMjll
MDAxMGIwYTVlNTgyMWFlZTM0ZTMxZTE3NiAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25m
aWcKKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKQEAgLTIwNyw3ICsyMDcsNiBAQCBjb25maWcg
UFBDCiAJc2VsZWN0IEdFTkVSSUNfUENJX0lPTUFQCQlpZiBQQ0kKIAlzZWxlY3QgR0VORVJJQ19T
TVBfSURMRV9USFJFQUQKIAlzZWxlY3QgR0VORVJJQ19USU1FX1ZTWVNDQUxMCi0Jc2VsZWN0IEdF
TkVSSUNfVkRTT19USU1FX05TCiAJc2VsZWN0IEhBU19JT1BPUlQJCQlpZiBQQ0kKIAlzZWxlY3Qg
SEFWRV9BUkNIX0FVRElUU1lTQ0FMTAogCXNlbGVjdCBIQVZFX0FSQ0hfSFVHRV9WTUFMTE9DCQlp
ZiBIQVZFX0FSQ0hfSFVHRV9WTUFQCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9h
cmNoL3Jpc2N2L0tjb25maWcKaW5kZXggZjZjZjkxODBjY2YyYzk3NzQyNDhmZWE5M2E4Mjc2ZGUz
NzkxYWQ3MS4uNmU1ZWZiZWI4M2Q3ZjBmZTU1NmJjMDRlYzlmNThiODBkMjc4MGI0MyAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMTIx
LDcgKzEyMSw2IEBAIGNvbmZpZyBSSVNDVgogCXNlbGVjdCBHRU5FUklDX1NDSEVEX0NMT0NLCiAJ
c2VsZWN0IEdFTkVSSUNfU01QX0lETEVfVEhSRUFECiAJc2VsZWN0IEdFTkVSSUNfVElNRV9WU1lT
Q0FMTCBpZiBHRU5FUklDX0dFVFRJTUVPRkRBWQotCXNlbGVjdCBHRU5FUklDX1ZEU09fVElNRV9O
UyBpZiBHRU5FUklDX0dFVFRJTUVPRkRBWQogCXNlbGVjdCBIQVJESVJRU19TV19SRVNFTkQKIAlz
ZWxlY3QgSEFTX0lPUE9SVCBpZiBNTVUKIAlzZWxlY3QgSEFWRV9BTElHTkVEX1NUUlVDVF9QQUdF
CmRpZmYgLS1naXQgYS9hcmNoL3MzOTAvS2NvbmZpZyBiL2FyY2gvczM5MC9LY29uZmlnCmluZGV4
IDY5NmQyMjQzZDY0YjA0ZTc3YjliNDYzMWZjOGJjMzAxOTE2YjQ4YWUuLmUwNmViYmQ4NjBkYTkz
YThjODM4MTEzYzNjMWI5NDZkNTFkZmUxYjQgMTAwNjQ0Ci0tLSBhL2FyY2gvczM5MC9LY29uZmln
CisrKyBiL2FyY2gvczM5MC9LY29uZmlnCkBAIC0xNjcsNyArMTY3LDYgQEAgY29uZmlnIFMzOTAK
IAlzZWxlY3QgR0VORVJJQ19HRVRUSU1FT0ZEQVkKIAlzZWxlY3QgR0VORVJJQ19TTVBfSURMRV9U
SFJFQUQKIAlzZWxlY3QgR0VORVJJQ19USU1FX1ZTWVNDQUxMCi0Jc2VsZWN0IEdFTkVSSUNfVkRT
T19USU1FX05TCiAJc2VsZWN0IEdFTkVSSUNfSU9SRU1BUCBpZiBQQ0kKIAlzZWxlY3QgSEFWRV9B
TElHTkVEX1NUUlVDVF9QQUdFCiAJc2VsZWN0IEhBVkVfQVJDSF9BVURJVFNZU0NBTEwKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IDFlNzRiMmEz
NTZlNDJiZGMwZWRlMjU4ZjQ0ZTE4YmEyOWRkOTAxNzQuLmQxOTYxODExZTI5MWU4YWRjZjBiNDZm
YWZiZDUzZjBhNDRiNWQyNWIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L0tjb25maWcKKysrIGIvYXJj
aC94ODYvS2NvbmZpZwpAQCAtMTgxLDcgKzE4MSw2IEBAIGNvbmZpZyBYODYKIAlzZWxlY3QgR0VO
RVJJQ19TTVBfSURMRV9USFJFQUQKIAlzZWxlY3QgR0VORVJJQ19USU1FX1ZTWVNDQUxMCiAJc2Vs
ZWN0IEdFTkVSSUNfR0VUVElNRU9GREFZCi0Jc2VsZWN0IEdFTkVSSUNfVkRTT19USU1FX05TCiAJ
c2VsZWN0IEdFTkVSSUNfVkRTT19PVkVSRkxPV19QUk9URUNUCiAJc2VsZWN0IEdVUF9HRVRfUFhY
X0xPV19ISUdICQlpZiBYODZfUEFFCiAJc2VsZWN0IEhBUkRJUlFTX1NXX1JFU0VORApkaWZmIC0t
Z2l0IGEvaW5pdC9LY29uZmlnIGIvaW5pdC9LY29uZmlnCmluZGV4IDgzNjMyMDI1MTIxOTM3NTI3
NTIzZjU5NzdhNDkzYmQzYWUyNGVkOWYuLjVjNDI5YTE4NGQxYjA1NTBkZGE5ZjA3NWZmY2JmZmI2
OGM2ZDhmNTAgMTAwNjQ0Ci0tLSBhL2luaXQvS2NvbmZpZworKysgYi9pbml0L0tjb25maWcKQEAg
LTEzNDYsNyArMTM0Niw3IEBAIGNvbmZpZyBVVFNfTlMKIAogY29uZmlnIFRJTUVfTlMKIAlib29s
ICJUSU1FIG5hbWVzcGFjZSIKLQlkZXBlbmRzIG9uIEdFTkVSSUNfVkRTT19USU1FX05TCisJZGVw
ZW5kcyBvbiBHRU5FUklDX0dFVFRJTUVPRkRBWQogCWRlZmF1bHQgeQogCWhlbHAKIAkgIEluIHRo
aXMgbmFtZXNwYWNlIGJvb3R0aW1lIGFuZCBtb25vdG9uaWMgY2xvY2tzIGNhbiBiZSBzZXQuCmRp
ZmYgLS1naXQgYS9saWIvdmRzby9LY29uZmlnIGIvbGliL3Zkc28vS2NvbmZpZwppbmRleCA0OGZm
YjBmNmZhNDEzZWE3ZGE0ZTQzYzdmN2EyNGNiMjMyYjM4ZWExLi4zZDJjMmI5MGQxOTNmOTg0ZTNh
MjAyZTcwMWZhN2YwYmZhOGYxOTM4IDEwMDY0NAotLS0gYS9saWIvdmRzby9LY29uZmlnCisrKyBi
L2xpYi92ZHNvL0tjb25maWcKQEAgLTEyLDEyICsxMiw2IEBAIGNvbmZpZyBHRU5FUklDX0dFVFRJ
TUVPRkRBWQogCSAgRWFjaCBhcmNoaXRlY3R1cmUgdGhhdCBlbmFibGVzIHRoaXMgZmVhdHVyZSBo
YXMgdG8KIAkgIHByb3ZpZGUgdGhlIGZhbGxiYWNrIGltcGxlbWVudGF0aW9uLgogCi1jb25maWcg
R0VORVJJQ19WRFNPX1RJTUVfTlMKLQlib29sCi0JaGVscAotCSAgU2VsZWN0ZWQgYnkgYXJjaGl0
ZWN0dXJlcyB3aGljaCBzdXBwb3J0IHRpbWUgbmFtZXNwYWNlcyBpbiB0aGUKLQkgIFZEU08KLQog
Y29uZmlnIEdFTkVSSUNfVkRTT19PVkVSRkxPV19QUk9URUNUCiAJYm9vbAogCWhlbHAKZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3BpZGZkL2NvbmZpZyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL3BpZGZkL2NvbmZpZwppbmRleCA2MTMzNTI0NzEwZjc5MGMxZjgzYWY2ZjJi
NjI4ZGU5YjYyZWVlNmMzLi5jZjdjYzBjZTAyNDg0ZTkxNzk5YjdjYjEzMjQ0NzI4M2Y4MThkNzI5
IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9waWRmZC9jb25maWcKKysrIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcGlkZmQvY29uZmlnCkBAIC00LDYgKzQsNSBAQCBDT05G
SUdfVVNFUl9OUz15CiBDT05GSUdfUElEX05TPXkKIENPTkZJR19ORVRfTlM9eQogQ09ORklHX1RJ
TUVfTlM9eQotQ09ORklHX0dFTkVSSUNfVkRTT19USU1FX05TPXkKIENPTkZJR19DR1JPVVBTPXkK
IENPTkZJR19DSEVDS1BPSU5UX1JFU1RPUkU9eQoKLS0gCjIuNTAuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
