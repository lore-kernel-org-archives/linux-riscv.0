Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575B4C02196
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=am3tysaCxD8XIK1dJhll5e4k48M08ZWP2GGMQ0StazA=; b=C/kYWIjc0JhWX9
	2S1k4bblK5nV5hDp7yf59H+nYe8Nq+JKsV5vnrwHwtCAAKDzCjwOwAcpG5AmXAplGchvQTuoamnwv
	7nYVAazYnnGPQmRvRtw3EeVf62Z8m/b2lW7dtdjS3J+iVMlP/hluoVEttxxC/9MvTRWnSz1gDx+8G
	dPysJbTOrgHkIFaUoOISjwx3I6YhG3tGkTLJQJh+rpmAU7mkZc9Qe9fA4Oj/8zBEEoykspGvYq8wc
	5vkMnYd3/u+XpsAxNV264qM45LTqLDKYOV871HP+zqahmCvA9CxXS5fM3N419VR7Udo2TDgkas9Mb
	pMYpAwm/tT6A+xjvpXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfI67-00000000Qjm-482z;
	Tue, 04 Feb 2025 12:32:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHh9-00000000LX4-1LKS;
	Tue, 04 Feb 2025 12:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=roEAdS7GRy2NoEBIGEVrgoE1SBCHacklusP7n5QqKZw=; b=j5u5Dgf3tIluh3vLuIx5zowGvp
	q1e7aMk1W18C+j9Z4k+YPhlU/hP7JlrcTK27T0EpU+pL3rkpq3dkW2PfmizyDclSXONYK+2YExT6z
	OkXm8SXDDIx5/uxMpX7VOq4wSdG1nOiZGouWZ6iCwUzzIlsdMG1iPQR3D/7MiUoc3j0ep5MEDGL3F
	AKCskBLdfm1tDJkeoDdt90DoQMa+BxiWB62RSo8IlzkgVBCkJC2c8sFAb3XJovVRMeZpa7t21ZSSe
	FBUjMsOGaOMVOCgCW9MsRCR6IYX7iOSnQLt+MUuTo71lBP2hq5yRMYVxjgp+VFKN43lNi2CPEAXW4
	b3+XmKqg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHh6-0000000GIN3-0YwH;
	Tue, 04 Feb 2025 12:06:22 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roEAdS7GRy2NoEBIGEVrgoE1SBCHacklusP7n5QqKZw=;
	b=wxK92Pp/r55qShjOBSU0exdyhKwvjhH/7KR82nwP3boIrWI8DOEcXNzmEI/GLTMuKG7f1x
	PkfpPhNlp694PQNIE9JxVVF0RpWJxqD5aD6dRJTgL2KBbo8+mjoASHji5u8OaqosLIhZYS
	I2WpvfYH8WEIAS9wTwTqnQ1ZQeUtq8sBWEr2MyVahakVyltRaNayKDqCym7YG/4nfSw//J
	jDeFgHHpiRWHn2Is5gVbkmGRrNzNZfoZVhXHD66WQ5mmpA0BX49BQFIK5vtjr3EN7X+E2o
	1ySk39mXl3dnbZHdIAb3DZtke3+Trc/kfWfTXMt0py/huHKrI8hV6DQZc87wzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roEAdS7GRy2NoEBIGEVrgoE1SBCHacklusP7n5QqKZw=;
	b=yQ4Xipxdi05s4pgfjTsItukvErNFC8tYL880xKiWzRwOe2Q1tERM9two9suuB4Vi5MstXN
	KvE5bLTn6wcq8sBw==
Date: Tue, 04 Feb 2025 13:05:49 +0100
Subject: [PATCH v3 17/18] vdso: Remove remnants of architecture-specific
 random state storage
MIME-Version: 1.0
Message-Id: <20250204-vdso-store-rng-v3-17-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
In-Reply-To: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
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
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=1909;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HgzmgdwkiaSDMiXf6XJkivPi1ft0DfM/ZF/QqgcCG+g=;
 b=yVdvyiouTW57SLrpHIPuIBmbt1VBsh4joVh2d8Xlt05DpEfmNT3KQwIdq5mEUqPx6MKl9Ku1M
 G3pd8yFEhW/CSALC2XFknkosOiA6chnJdCA+jrJ2s0Bn8d4Kmz2asPR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_120620_387899_7EF12634 
X-CRM114-Status: UNSURE (   9.15  )
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

QWxsIHVzZXJzIG9mIHRoZSByYW5kb20gdkRTTyBhcmUgdXNpbmcgdGhlIGdlbmVyaWMgc3RvcmFn
ZQppbXBsZW1lbnRhdGlvbi4gUmVtb3ZlIHRoZSBub3cgdW5uZWNlc3NhcnkgY29tcGF0aWJpbGl0
eSBhY2Nlc3NvcgpmdW5jdGlvbnMgYW5kIHN5bWJvbHMuCgpDby1kZXZlbG9wZWQtYnk6IE5hbSBD
YW8gPG5hbWNhb0BsaW51dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBOYW0gQ2FvIDxuYW1jYW9A
bGludXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53
ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQogaW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNvL3Zz
eXNjYWxsLmggfCA1IC0tLS0tCiBpbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaCAgICAgICAgICAgICB8
IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvYXNtLWdlbmVyaWMvdmRzby92c3lzY2FsbC5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNv
L3ZzeXNjYWxsLmgKaW5kZXggYTVmOTczZTRlMjcyM2VmMTgxNWM4OGE3ODQ2ZjdjNDc3ZTNmZWJk
OS4uMTNlMmFjMzczNmVlOWI0YWVhNjgwMDExNzk5N2VlMTY1YTdlMmI5ZCAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9hc20tZ2VuZXJpYy92ZHNvL3ZzeXNjYWxsLmgKKysrIGIvaW5jbHVkZS9hc20tZ2Vu
ZXJpYy92ZHNvL3ZzeXNjYWxsLmgKQEAgLTMyLDExICszMiw2IEBAIHN0YXRpYyBfX2Fsd2F5c19p
bmxpbmUgc3RydWN0IHZkc29fZGF0YSAqX19hcmNoX2dldF9rX3Zkc29fZGF0YSh2b2lkKQogCiAj
ZGVmaW5lIF9fYXJjaF9nZXRfdmRzb191X3RpbWVfZGF0YSBfX2FyY2hfZ2V0X3Zkc29fZGF0YQog
Ci0jaWZuZGVmIF9fYXJjaF9nZXRfdmRzb191X3JuZ19kYXRhCi0jZGVmaW5lIF9fYXJjaF9nZXRf
dmRzb191X3JuZ19kYXRhKCkgX19hcmNoX2dldF92ZHNvX3JuZ19kYXRhKCkKLSNlbmRpZgotI2Rl
ZmluZSB2ZHNvX2tfcm5nX2RhdGEgX19hcmNoX2dldF9rX3Zkc29fcm5nX2RhdGEoKQotCiAjZW5k
aWYgLyogQ09ORklHX0dFTkVSSUNfVkRTT19EQVRBX1NUT1JFICovCiAKICNpZm5kZWYgX19hcmNo
X3VwZGF0ZV92c3lzY2FsbApkaWZmIC0tZ2l0IGEvaW5jbHVkZS92ZHNvL2RhdGFwYWdlLmggYi9p
bmNsdWRlL3Zkc28vZGF0YXBhZ2UuaAppbmRleCA0NjY1OGIzOWMyODI1MGU5NzdmNWEzNDU0MjI0
YzNlZDBmYjRjODFkLi40OTc5MDdjM2FhMTFmY2FlOTEzZjYyZWY3MzczYmJlNmExMDI2YmQ2IDEw
MDY0NAotLS0gYS9pbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaAorKysgYi9pbmNsdWRlL3Zkc28vZGF0
YXBhZ2UuaApAQCAtMTUyLDcgKzE1Miw2IEBAIHN0cnVjdCB2ZHNvX3JuZ19kYXRhIHsKICNpZm5k
ZWYgQ09ORklHX0dFTkVSSUNfVkRTT19EQVRBX1NUT1JFCiBleHRlcm4gc3RydWN0IHZkc29fdGlt
ZV9kYXRhIF92ZHNvX2RhdGFbQ1NfQkFTRVNdIF9fYXR0cmlidXRlX18oKHZpc2liaWxpdHkoImhp
ZGRlbiIpKSk7CiBleHRlcm4gc3RydWN0IHZkc29fdGltZV9kYXRhIF90aW1lbnNfZGF0YVtDU19C
QVNFU10gX19hdHRyaWJ1dGVfXygodmlzaWJpbGl0eSgiaGlkZGVuIikpKTsKLWV4dGVybiBzdHJ1
Y3QgdmRzb19ybmdfZGF0YSBfdmRzb19ybmdfZGF0YSBfX2F0dHJpYnV0ZV9fKCh2aXNpYmlsaXR5
KCJoaWRkZW4iKSkpOwogI2Vsc2UKIGV4dGVybiBzdHJ1Y3QgdmRzb190aW1lX2RhdGEgdmRzb191
X3RpbWVfZGF0YVtDU19CQVNFU10gX19hdHRyaWJ1dGVfXygodmlzaWJpbGl0eSgiaGlkZGVuIikp
KTsKIGV4dGVybiBzdHJ1Y3QgdmRzb19ybmdfZGF0YSB2ZHNvX3Vfcm5nX2RhdGEgX19hdHRyaWJ1
dGVfXygodmlzaWJpbGl0eSgiaGlkZGVuIikpKTsKCi0tIAoyLjQ4LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
