Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDFECCD197
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V35G7cUZ/uc54PzFgTUpNLhC3WnDcNM3CJuStiO8Oiw=; b=yPpNyoH3xCvcRM
	Vf4PAeXuk6W7M4BLhyoQTm1vqydObHm8uRkpgwOsxD8+R00hNVx6pXl+oNjlzY5E/fwBxEgZV/tED
	LvPRssznCmZxbhPhYdAofXHmg9FirQrjHWHkHkI9AUBKWxeCBSq5ZXuD5E2U12klzce13Oev5n/Tm
	ckkFCJSUOOj62/2FTVTQPGPdMvXsMHqcME0LcAKKWamWJY563C7wbBtm7mVzXjxvOOtfoRaUMLMdz
	hLXWGSJ+CCWQhs+ceB73CTn40A8B/JnYKBMx5W13UpWwJnI/prg+Vb3fiq+3BeqNB9bBwjs5ACpxl
	MEfTk9NEY0W+IhvyIcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ej4-0000000GO88-3U3D;
	Tue, 14 Oct 2025 13:06:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eiy-0000000GO0J-3rae
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:05:58 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Jz/fSQ4w2Bn/x6vZR3CdwbYNIGEPKCgvqF2C3xKpfE=;
	b=VKcGupTmWHcLI7Z0F1GJxSKy3HSwtCoEQeb3y3K5GW3tZ3MbEDvktdbAmdZTn+uH1bg0U2
	8h4vhGrWqe38UOZfS2U0a3uu3vCKfGG8Q0PpdxY8IqXdPepPVyHpTeW2ODz2NhN4a47v5H
	w2HA0YBUpXONsWbx/w0WyVCks2VkXQYUKS0zVJY9j53UV6RtdWVlwjecCk6jlGdvpnPXss
	Fa7s1H3Kp/Fwosf+mJH1mNTuNYDtbUPvRrFCvp5xDIL6qiKsOdYirrovpEG8frLO3SSDcp
	aNpv/Ts+hnVhhoqgkUPks10emA9sNZ1crjnWsJb8l+ee7LqwXgW9PEGY31oONg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Jz/fSQ4w2Bn/x6vZR3CdwbYNIGEPKCgvqF2C3xKpfE=;
	b=BPouXKjvuvb+fmaL4NwW0ji9XzPT4qC/zULrhT4erndSmssrS+FBVwoL8r5nMAE7LPOaHo
	LwxtHqhKCr7Nk2DA==
Date: Tue, 14 Oct 2025 15:05:21 +0200
Subject: [PATCH v2 06/10] powerpc: Implement custom CC_CAN_LINK
MIME-Version: 1.0
Message-Id: <20251014-kbuild-userprogs-bits-v2-6-faeec46e887a@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1653;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XzQW4/Bu5moeHZMAHvqFvXBlWcd696K9WDlakbG7iS8=;
 b=iMDR0xOl/X2IGC7IEBYdKs5yuoYP5wjW2LSP8Krtgl2eaP0yhU5aS9qhWhGPYYr0+eb0mEveO
 gg/4WcsNrUBDV10e4SbmIWsMoaYJ+4oJo37KgaWlBCNQAPq/+4MetS8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_060557_212288_9B27CCF8 
X-CRM114-Status: UNSURE (   6.81  )
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

VGhlIGdlbmVyaWMgQ0NfQ0FOX0xJTksgZGV0ZWN0aW9uIGRvZXMgbm90IGhhbmRsZSBkaWZmZXJl
bnQgYnl0ZSBvcmRlcnMuClRoaXMgbWF5IGxlYWQgdG8gdXNlcnByb2dzIHdoaWNoIGFyZSBub3Qg
YWN0dWFsbHkgcnVubmFibGUgb24gdGhlIHRhcmdldAprZXJuZWwuCgpVc2UgYXJjaGl0ZWN0dXJl
LXNwZWNpZmljIGxvZ2ljIHN1cHBvcnRpbmcgYnl0ZSBvcmRlcnMgaW5zdGVhZC4KClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRl
PgotLS0KIGFyY2gvcG93ZXJwYy9LY29uZmlnIHwgMTUgKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29u
ZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKaW5kZXggZTI0ZjRkODg4ODVhZTUyZTc3ZmNiNTIz
MDQwZThkMzFmMTY3NTcxZi4uYzY4ODdhMmI5NzUzMGI5YzViOGMzNGRkMGJhYTNlZjg1NDhjYjQz
ZCAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcKKysrIGIvYXJjaC9wb3dlcnBjL0tj
b25maWcKQEAgLTEyNyw2ICsxMjcsNyBAQCBjb25maWcgUFBDCiAJc2VsZWN0IEFSQ0hfRE1BX0RF
RkFVTFRfQ09IRVJFTlQJaWYgIU5PVF9DT0hFUkVOVF9DQUNIRQogCXNlbGVjdCBBUkNIX0VOQUJM
RV9NRU1PUllfSE9UUExVRwogCXNlbGVjdCBBUkNIX0VOQUJMRV9NRU1PUllfSE9UUkVNT1ZFCisJ
c2VsZWN0IEFSQ0hfSEFTX0NDX0NBTl9MSU5LCiAJc2VsZWN0IEFSQ0hfSEFTX0NPUFlfTUMJCQlp
ZiBQUEM2NAogCXNlbGVjdCBBUkNIX0hBU19DVVJSRU5UX1NUQUNLX1BPSU5URVIKIAlzZWxlY3Qg
QVJDSF9IQVNfREVCVUdfVklSVFVBTApAQCAtMTM0MSw2ICsxMzQyLDIwIEBAIGVuZGlmCiBjb25m
aWcgUFBDX0xJQl9SSEVBUAogCWJvb2wKIAorY29uZmlnIEFSQ0hfQ0NfQ0FOX0xJTksKKwlib29s
CisJZGVmYXVsdCAkKGNjX2Nhbl9saW5rX3VzZXIsLW02NCAtbWxpdHRsZS1lbmRpYW4pIGlmIDY0
QklUICYmIENQVV9MSVRUTEVfRU5ESUFOCisJZGVmYXVsdCAkKGNjX2Nhbl9saW5rX3VzZXIsLW02
NCAtbWJpZy1lbmRpYW4pIGlmIDY0QklUICYmIENQVV9CSUdfRU5ESUFOCisJZGVmYXVsdCAkKGNj
X2Nhbl9saW5rX3VzZXIsLW0zMiAtbWxpdHRsZS1lbmRpYW4pIGlmIENQVV9MSVRUTEVfRU5ESUFO
CisJZGVmYXVsdCAkKGNjX2Nhbl9saW5rX3VzZXIsLW0zMiAtbWJpZy1lbmRpYW4pIGlmIENQVV9C
SUdfRU5ESUFOCisKK2NvbmZpZyBBUkNIX1VTRVJGTEFHUworCXN0cmluZworCWRlZmF1bHQgIi1t
NjQgLW1saXR0bGUtZW5kaWFuIiBpZiA2NEJJVCAmJiBDUFVfTElUVExFX0VORElBTgorCWRlZmF1
bHQgIi1tNjQgLW1iaWctZW5kaWFuIiBpZiA2NEJJVCAmJiBDUFVfQklHX0VORElBTgorCWRlZmF1
bHQgIi1tMzIgLW1saXR0bGUtZW5kaWFuIiBpZiBDUFVfTElUVExFX0VORElBTgorCWRlZmF1bHQg
Ii1tMzIgLW1iaWctZW5kaWFuIiBpZiBDUFVfQklHX0VORElBTgorCiBzb3VyY2UgImFyY2gvcG93
ZXJwYy9rdm0vS2NvbmZpZyIKIAogc291cmNlICJrZXJuZWwvbGl2ZXBhdGNoL0tjb25maWciCgot
LSAKMi41MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
