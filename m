Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7344CFC5EC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GY0MlGl4B0RFbNwp4PXgkOVZDblGCK2MRyD+l0FH5Y4=; b=2WQvyCXjl/lN+s
	DuWFTLFjxt90hKNwhMIae8h9utxNE3MK9U4wEu7KkcagchuWNCuUiKQc6VxpbLQiPJCG2YS1tAlul
	uCARtlqLMBqoprCTnqKtJOq90rrTkBvlhlWKM9XlAfkfOr3jrFvw5wF2SB4wWckKyxkA1kq13HV1E
	LEGgSgsP+ddnk5Dl2u3X8tvJY9sBNWEp0Sy6IkAaJnSapOexlPLxPx8Kej7KMrHVx6YsnT5rIn87O
	2Lqn7RDZBfAZXtIkRP0w7UQrzzfv0F2z67IiIWYB0wQPMY+ob9or3kXmcUcVESre3yimbybkFqaT9
	NgdwJvzmhoBeTmgeeJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sywlw-0000000DdsD-3Ppb;
	Thu, 10 Oct 2024 17:16:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvLT-0000000DOZ0-2QyZ;
	Thu, 10 Oct 2024 15:45:11 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbw860Y8cRi5xxA/qi1H6FVRcI5Ca4sRKMG/9Wo+Ih8=;
	b=UJo35Z9SJbVvJPEtwXQTx640hZGNYd0yx369ZyIlfIt49f3c0x/SjL/N6mlKrtSjlg4mKm
	j/sqpAyhDBuAugTWJ8KWafd7X3EtfHEGBGQ6ptpv3Ls8pkj/g8+l9PlsANmS6SvFRkN97D
	Kon3OvbvB8U59sEuUrx8hhkTfCDfXvtQ5EixPaFMir23HXlcss3yflyAqw1HsFZ/Uwn4zB
	MT2EsHiPspQHHSAmEwOCTRHoE3fDziowLWBbuGwQT0zkhNYyBUe4V0FVlPnMXwtRrADaLX
	Mq6zst83FF1WS0p0ObFMXC0E+hEqbmyU/BYYxdVPrnBo+DSn/+03qzP+zKeZZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbw860Y8cRi5xxA/qi1H6FVRcI5Ca4sRKMG/9Wo+Ih8=;
	b=8B7wL2EthakSTpTkhWHWWbhqFPddFlgbdTyAxK8V1/rzHtm4Gdl+zZqr3iY43yE3KnKYV6
	XvBPZpKZ/PJfdTAw==
Date: Thu, 10 Oct 2024 17:44:44 +0200
Subject: [PATCH 1/9] vdso: Remove timekeeper argument of
 __arch_update_vsyscall()
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-1-7fe5a3ea4382@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=2431;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=P9OFc8LoZinuHPdD6G8mUCCAPZekDQoc9eNGYe6RM5M=;
 b=rRX2lt1HBT3/u9x9JvlnflNmRDWsy5jscJ4NTC/lrOHnd2lofDJUSy4Brb/2qyoNuIuirmMpQ
 EQ5r/daGrFlB91mXesIGTiy54olcuu6phkOtEZCAbUlBJIlrxz2PwJG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_084455_948467_6CF12980 
X-CRM114-Status: GOOD (  11.01  )
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

Tm8gaW1wbGVtZW50YXRpb24gb2YgdGhpcyBob29rIHVzZXMgdGhlIHBhc3NlZCBpbiB0aW1la2Vl
cGVyIGFueW1vcmUuCgpUaGlzIGF2b2lkcyBpbmNsdWRpbmcgYSBub24tVkRTTyBoZWFkZXIgd2hp
bGUgYnVpbGRpbmcgdGhlIFZEU08sCndoaWNoIGNhbiBsZWFkIHRvIGNvbXBpbGF0aW9uIGVycm9y
cy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBs
aW51dHJvbml4LmRlPgotLS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5o
IHwgMyArLS0KIGluY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby92c3lzY2FsbC5oICAgIHwgMyArLS0K
IGtlcm5lbC90aW1lL3ZzeXNjYWxsLmMgICAgICAgICAgICAgICAgIHwgMiArLQogMyBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggYi9hcmNoL2FybTY0L2luY2x1ZGUv
YXNtL3Zkc28vdnN5c2NhbGwuaAppbmRleCA1YjZkMGRkM2NlZjU0ODNhYjgxNjZhMjRhYjNjN2Nh
OTU2OTI3MzUwLi5lZWE1MTk0NmQ0NWEyZjhjN2VlYmZmZjk3MWQ3NDg3OGJlNTNhNzk4IDEwMDY0
NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaAorKysgYi9hcmNo
L2FybTY0L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaApAQCAtNiw3ICs2LDYgQEAKIAogI2lm
bmRlZiBfX0FTU0VNQkxZX18KIAotI2luY2x1ZGUgPGxpbnV4L3RpbWVrZWVwZXJfaW50ZXJuYWwu
aD4KICNpbmNsdWRlIDx2ZHNvL2RhdGFwYWdlLmg+CiAKIGVudW0gdnZhcl9wYWdlcyB7CkBAIC0z
Nyw3ICszNiw3IEBAIHN0cnVjdCB2ZHNvX3JuZ19kYXRhICpfX2FybTY0X2dldF9rX3Zkc29fcm5k
X2RhdGEodm9pZCkKICNkZWZpbmUgX19hcmNoX2dldF9rX3Zkc29fcm5nX2RhdGEgX19hcm02NF9n
ZXRfa192ZHNvX3JuZF9kYXRhCiAKIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUKLXZvaWQgX19hcm02
NF91cGRhdGVfdnN5c2NhbGwoc3RydWN0IHZkc29fZGF0YSAqdmRhdGEsIHN0cnVjdCB0aW1la2Vl
cGVyICp0aykKK3ZvaWQgX19hcm02NF91cGRhdGVfdnN5c2NhbGwoc3RydWN0IHZkc29fZGF0YSAq
dmRhdGEpCiB7CiAJdmRhdGFbQ1NfSFJFU19DT0FSU0VdLm1hc2sJPSBWRFNPX1BSRUNJU0lPTl9N
QVNLOwogCXZkYXRhW0NTX1JBV10ubWFzawkJPSBWRFNPX1BSRUNJU0lPTl9NQVNLOwpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNvL3ZzeXNjYWxsLmggYi9pbmNsdWRlL2FzbS1n
ZW5lcmljL3Zkc28vdnN5c2NhbGwuaAppbmRleCBjODM1NjA3Zjc4YWU5OTBlNzQ3OTg3ODc2N2Iw
NWNjY2QzYTk5ODM3Li4wMWRhZmQ2MDQxODhmYjA1MTJkMjFjNGNlNGIwMjdmN2RhNTRmNWEwIDEw
MDY0NAotLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL3Zkc28vdnN5c2NhbGwuaAorKysgYi9pbmNs
dWRlL2FzbS1nZW5lcmljL3Zkc28vdnN5c2NhbGwuaApAQCAtMTIsOCArMTIsNyBAQCBzdGF0aWMg
X19hbHdheXNfaW5saW5lIHN0cnVjdCB2ZHNvX2RhdGEgKl9fYXJjaF9nZXRfa192ZHNvX2RhdGEo
dm9pZCkKICNlbmRpZiAvKiBfX2FyY2hfZ2V0X2tfdmRzb19kYXRhICovCiAKICNpZm5kZWYgX19h
cmNoX3VwZGF0ZV92c3lzY2FsbAotc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIF9fYXJjaF91
cGRhdGVfdnN5c2NhbGwoc3RydWN0IHZkc29fZGF0YSAqdmRhdGEsCi0JCQkJCQkgICBzdHJ1Y3Qg
dGltZWtlZXBlciAqdGspCitzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19hcmNoX3VwZGF0
ZV92c3lzY2FsbChzdHJ1Y3QgdmRzb19kYXRhICp2ZGF0YSkKIHsKIH0KICNlbmRpZiAvKiBfX2Fy
Y2hfdXBkYXRlX3ZzeXNjYWxsICovCmRpZmYgLS1naXQgYS9rZXJuZWwvdGltZS92c3lzY2FsbC5j
IGIva2VybmVsL3RpbWUvdnN5c2NhbGwuYwppbmRleCA5MTkzZDYxMzNlNWQ2ODgzNDJiZTg0ODVi
OWEwZWZiN2FmOWVlMTQ4Li4yODcwNmExM2MyMjJkZjI5NjM1ZmQyMmQyM2YyMWVhY2IwNjg4NTVj
IDEwMDY0NAotLS0gYS9rZXJuZWwvdGltZS92c3lzY2FsbC5jCisrKyBiL2tlcm5lbC90aW1lL3Zz
eXNjYWxsLmMKQEAgLTExOSw3ICsxMTksNyBAQCB2b2lkIHVwZGF0ZV92c3lzY2FsbChzdHJ1Y3Qg
dGltZWtlZXBlciAqdGspCiAJaWYgKGNsb2NrX21vZGUgIT0gVkRTT19DTE9DS01PREVfTk9ORSkK
IAkJdXBkYXRlX3Zkc29fZGF0YSh2ZGF0YSwgdGspOwogCi0JX19hcmNoX3VwZGF0ZV92c3lzY2Fs
bCh2ZGF0YSwgdGspOworCV9fYXJjaF91cGRhdGVfdnN5c2NhbGwodmRhdGEpOwogCiAJdmRzb193
cml0ZV9lbmQodmRhdGEpOwogCgotLSAKMi40Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
