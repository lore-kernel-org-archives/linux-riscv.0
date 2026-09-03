Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1650BC624DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cuq+UB3BcUzUqKCWp2k5m2j4qlgR8pbVSLozZSr2b1E=; b=OCWH5aXsQF1vOY
	+owMYhmZ71f1J3WsvC6xyie6+e6G2lDZ9qKMFO/iZjLpgd1PvqFsjyIX591P964+ADL5Tyj1DQvCV
	IfFTHiVwmawKNB4E5T8eya0/LYRMRQcrnZeveaE5q06wmiVd7qKakQNfcPvjNp9vft6HWagqUPKHe
	Pfllf+3ncbWBykIyz0rdicn3kA9g+Hey3HmMjpFsinpCLJR8t72bqX5UDe8jtEISPtBclqlOANlLK
	0q3wl4AvobGe1OiMnJ0LPLvL8WJxJsglSm09eVVbDQXa75nHbMBzobmTGAnJcoGWmR17W9iCHPBNO
	gpHJWWETzDaTBb3oeTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224r-0000000GcuJ-39bx;
	Thu, 03 Sep 2026 07:41:41 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x224i-0000000GciA-2WqF;
	Thu, 03 Sep 2026 07:41:35 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788421289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTIUO03+vTuzokz+0CLC3jJffqMKEhB1M1saHVAcdrI=;
	b=EAotfmrFrsbPTUu0GtvAGP5xKeex4onVnvkHIsoxrfK/u1t113B/VDkIfcQtC8ZTyOR6zO
	kkmeP5SkZKTSVkPaaQcUL+Q4beh+HHJbJpGVSGRRBhjIHoqdI8s4/u284bWB+YCx80DgAC
	KtJFVQhplo8B8/8GOlbgnK1W0C+YZ3AekXg8duKZYajxT2pX89dgXTjMPhpdVMksBpTcgB
	ZW39MOWr0/vLLnSDDHEFXhugb7f2eoEUWUp9IjQUni2MiRyPYBuQs4WqmdNmeZVBqM3DWP
	+OA+lFOzWNCma3+pGSIsnJ4ablQqkqlRC6JaA1x4up2cN4e0WRWTBK0AY8Vvmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788421289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WTIUO03+vTuzokz+0CLC3jJffqMKEhB1M1saHVAcdrI=;
	b=ds0SsmUaK7hbdxAtIf8vYzrxvul23GNKluaEgREqtkFfgg60aDVcJOUqm3pGFw2WBvcEWa
	nRKqjPhNX/6RcIBA==
Date: Thu, 03 Sep 2026 09:41:18 +0200
Subject: [PATCH v2 03/15] asm-generic: add an in-kernel auxvec.h header
MIME-Version: 1.0
Message-Id: <20260903-at-vector-size-arch-v2-3-5bc32a71e3d8@linutronix.de>
References: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
In-Reply-To: <20260903-at-vector-size-arch-v2-0-5bc32a71e3d8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788421286; l=2467;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Dz+MzkOjlYnWkAvQ/wE+s+kQ2Hop+FhDIVkDntsCAkc=;
 b=ZpM1agafw8vnEzFvvYGBo4mc1Mri6kilHloCGhylalJY3bCPcuVwBQ47m1vZB5zJ4e44kqdg+
 OboO+VdSwkbC2yW6wGK+lHdE+2dw2GWeg6plS8qSz2kJau22a8VmvWB
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004132_800857_F2C9D277 
X-CRM114-Status: GOOD (  10.92  )
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

VXBjb21pbmcgY2hhbmdlcyB3aWxsIGNyZWF0ZSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgYXNtL2F1
eHZlYy5oIGhlYWRlcnMuCkFkZCBhc20tZ2VuZXJpYyBpbmZyYXN0cnVjdHVyZSB0byBoYW5kbGUg
dGhlIGZhbGxiYWNrcyBmb3IgYXJjaGl0ZWN0dXJlcwp3aGljaCBhcmUgbm90IG1pZ3JhdGVkIHll
dCBhbmQgdGhvc2Ugd2hpY2ggd29uJ3QgcmVxdWlyZSB0aGVpciBvd24KZGVmaW5pdGlvbi4KCkV4
dGVuZCB0aGUgbGlzdCBvZiBpbmNsdWRlcyBpbiBsaW51eC9hdXh2ZWMuaCB0byBjb3ZlciBhbGwg
cG90ZW50aWFsCmxvdy1sZXZlbCBhdXh2ZWMuaCBoZWFkZXJzLgoKU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+ClJldmlld2Vk
LWJ5OiBLZWVzIENvb2sgPGtlZXNAa2VybmVsLm9yZz4KLS0tCiBNQUlOVEFJTkVSUyAgICAgICAg
ICAgICAgICAgIHwgMiArKwogaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVpbGQgICB8IDEgKwogaW5j
bHVkZS9hc20tZ2VuZXJpYy9hdXh2ZWMuaCB8IDcgKysrKysrKwogaW5jbHVkZS9saW51eC9hdXh2
ZWMuaCAgICAgICB8IDIgKysKIDQgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNDI3MTVhZWEyMTBiLi42
OTc0ZjhkYWQxZTkgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBA
IC05ODA4LDEyICs5ODA4LDE0IEBAIEw6CWxpbnV4LW1tQGt2YWNrLm9yZwogUzoJU3VwcG9ydGVk
CiBUOglnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tl
ZXMvbGludXguZ2l0IGZvci1uZXh0L2V4ZWN2ZQogRjoJRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2Ut
YXBpL0VMRi5yc3QKK0Y6CWFyY2gvKi9pbmNsdWRlL2FzbS9hdXh2ZWMuaAogRjoJYXJjaC8qL2lu
Y2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKIEY6CWZzLypiaW5mbXRfKi5jCiBGOglmcy9LY29uZmln
LmJpbmZtdAogRjoJZnMvZXhlYy5jCiBGOglmcy90ZXN0cy9iaW5mbXRfKl9rdW5pdC5jCiBGOglm
cy90ZXN0cy9leGVjX2t1bml0LmMKK0Y6CWluY2x1ZGUvYXNtLWdlbmVyaWMvYXV4dmVjLmgKIEY6
CWluY2x1ZGUvbGludXgvYXV4dmVjLmgKIEY6CWluY2x1ZGUvbGludXgvYmluZm10cy5oCiBGOglp
bmNsdWRlL2xpbnV4L2VsZi5oCmRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL0tidWls
ZCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvS2J1aWxkCmluZGV4IDJiYzAwYzY3ZGM1NC4uOTA2MjYz
NThmOTRiIDEwMDY0NAotLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL0tidWlsZAorKysgYi9pbmNs
dWRlL2FzbS1nZW5lcmljL0tidWlsZApAQCAtNiw2ICs2LDcgQEAKIAogbWFuZGF0b3J5LXkgKz0g
YXRvbWljLmgKIG1hbmRhdG9yeS15ICs9IGFyY2hyYW5kb20uaAorbWFuZGF0b3J5LXkgKz0gYXV4
dmVjLmgKIG1hbmRhdG9yeS15ICs9IGJhcnJpZXIuaAogbWFuZGF0b3J5LXkgKz0gYml0b3BzLmgK
IG1hbmRhdG9yeS15ICs9IGJ1Zy5oCmRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL2F1
eHZlYy5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9hdXh2ZWMuaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwMDAuLmU0YWJkMmE4YzVlZAotLS0gL2Rldi9udWxsCisrKyBiL2lu
Y2x1ZGUvYXNtLWdlbmVyaWMvYXV4dmVjLmgKQEAgLTAsMCArMSw3IEBACisvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworI2lmbmRlZiBfX0FTTV9HRU5FUklDX0FVWFZBTF9I
X18KKyNkZWZpbmUgX19BU01fR0VORVJJQ19BVVhWQUxfSF9fCisKKyNkZWZpbmUgQVRfVkVDVE9S
X1NJWkVfQVJDSCAwCisKKyNlbmRpZgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9hdXh2ZWMu
aCBiL2luY2x1ZGUvbGludXgvYXV4dmVjLmgKaW5kZXggNGIzNjRlNjM5ZjA4Li5kZTFjMzNjNGEy
NTYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvYXV4dmVjLmgKKysrIGIvaW5jbHVkZS9saW51
eC9hdXh2ZWMuaApAQCAtMiw3ICsyLDkgQEAKICNpZm5kZWYgX0xJTlVYX0FVWFZFQ19ICiAjZGVm
aW5lIF9MSU5VWF9BVVhWRUNfSAogCisjaW5jbHVkZSA8dWFwaS9hc20vYXV4dmVjLmg+CiAjaW5j
bHVkZSA8dWFwaS9saW51eC9hdXh2ZWMuaD4KKyNpbmNsdWRlIDxhc20vYXV4dmVjLmg+CiAKICNk
ZWZpbmUgQVRfVkVDVE9SX1NJWkVfQkFTRSAyNCAvKiBORVdfQVVYX0VOVCBlbnRyaWVzIGluIGF1
eGlsaWFyeSB0YWJsZSAqLwogICAvKiBudW1iZXIgb2YgIiNkZWZpbmUgQVRfLioiIGFib3ZlLCBt
aW51cyB7QVRfTlVMTCwgQVRfSUdOT1JFLCBBVF9OT1RFTEZ9ICovCgotLSAKMi41NS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
