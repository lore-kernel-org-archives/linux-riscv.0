Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D244CF07C5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHYmPX4jmtKCETKRKqWK1jlQEG1y3hWdDbDl46VnoIg=; b=ASsaC603nJVOjK
	yTlHgz7AK3sCLdlVJNMpWm25o9/wuzh2I22OQ5ZXp4s33VJ8HOT+iXdPB2KBMcjkFj5fgoFtnM+VL
	IE6ypOqyKfY/PX0YBLHWGAJ7ew1qV80kINBlzBB0fOUgP2DUlGRSvngFgtP+yvQIRzUSADwqZj/6u
	tD0tJqVA6QCVqsMECGJoOGn0kfd8W1h9QSCCjCxjYvtkwktz+K24XNKjvYBbpw72N9AaBnGVRvbrv
	LGpnUbT36TxdTT1F1lsU/6tM5HyyQFS9884mwhcImspLt+gWhZj7ntVdaEShWsGm+HrTwJG0jaYfR
	ZRD0Uabm4QGoLyORB/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syoZa-0000000C0vr-1eXw;
	Thu, 10 Oct 2024 08:31:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBh-0000000BllH-1PZd;
	Thu, 10 Oct 2024 07:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jm/2CrqDEYeYltPOiqfTVHvM9k41RoVb5XrgMrSt7cU=; b=hzg2Q3m5/Qw801c2aSlBsDbay4
	MStXEgGvCbF6XsewPqC+6HNO/oY5Ga1cDKT2+bo4CFBkXLeqL5S2i8/4D5gaY2f5bxhbQ4F3OvOl2
	rRkfD2yHg2iO+oPszE2iSUVUnERYOk0udNMW3rqxdZ7ffQt7b8bnXbXR4a3VQTgks1sPU15zDwlH+
	J/7LsJGDdHOrIPDAsmVFboLyi3Bi4hS3gJfKaWqCWZCovoYpopVTF2m475r0zhpJo50TaYrFUvf6n
	ORD2NPKTlZQ2q/vFGBwwuecrt1H9JjgQ+jz91fVRs6dJ2TKmXgHuObviIbkfjEskjfe5T7Zgh0XAd
	qzrPaNCA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBb-00000005Ctj-3Wl2;
	Thu, 10 Oct 2024 07:02:15 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jm/2CrqDEYeYltPOiqfTVHvM9k41RoVb5XrgMrSt7cU=;
	b=iMS7PJJHjGGyQAOWkIhx3mGK1ARhnmCDpqbH+A7Ol3abKmvtUbIKI09X8sqoRtM0ZKQ7mx
	VkqlO+WxdeLwlEadLlMyXEIF6llFbYK2Hwg61Pb5O5A5Q1AKY16r/jM4pX3rF7VSA/DF9y
	IZwtcrMl2rDxxcWTxMz/yqj7U4R/9tRCBHnPW39lEYu75V26scajMqFl/aK8kDco9B48ax
	eL2ChHRfRKdTEesLgyw+IkdE0OH5P4818N5UKXA8qVlrfPXHd2AoG1CygP3avo9LH/5iW8
	ILP/eB0/R/rA4pUVmPPCXr0ktkDqJweoX+/URwLfNXXFsTyEOKjYvlTiPb0NmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jm/2CrqDEYeYltPOiqfTVHvM9k41RoVb5XrgMrSt7cU=;
	b=TV4unc1uGTXtFkaS6TTazfjrGgCVpgn8oa3T0LlB5xj7tiIHkUCT6ic8gdd7YU+gxUremR
	Fx/l51wAvwr0ydBw==
Date: Thu, 10 Oct 2024 09:01:15 +0200
Subject: [PATCH 13/28] x86: vdso: Access rng data from kernel without vvar
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-13-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2500;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=duktGpmPPCjca1hUrFko89iKyD9xPwp39MHzOJo7rR4=;
 b=WV9xCByoqmjr2WpGGsix0xq+nmoYDqmnBGL1soMUsv5PBqkCJwXCKiSkCvmLtX8v8ZY4rieFc
 b8m03BVeYmVDGGnR2GuimURiEeBvWIXoti102NiyP/UhkqFrnOZTg3K
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080212_108617_89DEAFA3 
X-CRM114-Status: GOOD (  14.55  )
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

UmVtb3ZlIHRoZSB1c2FnZSBvZiB0aGUgdnZhciBfdmRzb19ybmdfZGF0YSBmcm9tIHRoZSBrZXJu
ZWwtc3BhY2UgY29kZSwKYXMgdGhlIHg4NiB2dmFyIG1hY2hpbmVyeSBpcyBhYm91dCB0byBiZSBy
ZW1vdmVkLgpUaGUgZGVmaW5pdGlvbiBvZiB0aGUgc3RydWN0dXJlIGlzIHVubmVjZXNzYXJ5LCBh
cyB0aGUgZGF0YSBsaXZlcyBpbiBhCnBhZ2UgcHJlLWFsbG9jYXRlZCBieSB0aGUgbGlua2VyIGFu
eXdheXMuClRoZSB2ZHNvIHVzZXItc3BhY2UgYWNjZXNzIHRvIHRoZSBybmcgZGF0YSB3aWxsIGJl
IHN3aXRjaGVkIHNvb24uCgpERUZJTkVfVlZBUl9TSU5HTEUoKSBpcyBub3cgdW51c2VkLiBJdCB3
aWxsIGJlIHJlbW92ZWQgbGF0ZXIgdG9nZWh0ZXIKd2l0aCB0aGUgcmVzdCBvZiB2dmFyLmguCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRy
b25peC5kZT4KLS0tCiBhcmNoL3g4Ni9lbnRyeS92ZHNvL3ZtYS5jICAgICAgICAgICAgfCAxIC0K
IGFyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaCB8IDIgKy0KIGFyY2gveDg2L2lu
Y2x1ZGUvYXNtL3Z2YXIuaCAgICAgICAgICB8IDQgKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvZW50cnkv
dmRzby92bWEuYyBiL2FyY2gveDg2L2VudHJ5L3Zkc28vdm1hLmMKaW5kZXggYjhmZWQ4YjhiOWNj
ZGIyY2RkOTkxMmQ1ZWM0Y2ZkNjM2NmE2MDEyZS4uODQzNzkwNmZkNGIzNTNhZDBmZTIwOGQ4MTE4
MTdhMWI2ZjhmOGRjYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvZW50cnkvdmRzby92bWEuYworKysg
Yi9hcmNoL3g4Ni9lbnRyeS92ZHNvL3ZtYS5jCkBAIC0zOSw3ICszOSw2IEBAIHN0cnVjdCB2ZHNv
X2RhdGEgKmFyY2hfZ2V0X3Zkc29fZGF0YSh2b2lkICp2dmFyX3BhZ2UpCiAjdW5kZWYgRU1JVF9W
VkFSCiAKIERFRklORV9WVkFSKHN0cnVjdCB2ZHNvX2RhdGEsIF92ZHNvX2RhdGEpOwotREVGSU5F
X1ZWQVJfU0lOR0xFKHN0cnVjdCB2ZHNvX3JuZ19kYXRhLCBfdmRzb19ybmdfZGF0YSk7CiAKIHVu
c2lnbmVkIGludCB2Y2xvY2tzX3VzZWQgX19yZWFkX21vc3RseTsKIApkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
dmRzby92c3lzY2FsbC5oCmluZGV4IDY3ZmVkZjE2OThiNWUyYjcxMGUwNTA0Njg2MzE4OTQ5Yzcz
OGJmMjkuLjJjYmIzMmE4YTQ1ZTJmNWM3YmMwMjE3MmFmMGZhMDkxNzNmMzM5MjQgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaAorKysgYi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgKQEAgLTIyLDcgKzIyLDcgQEAgc3RydWN0IHZkc29f
ZGF0YSAqX194ODZfZ2V0X2tfdmRzb19kYXRhKHZvaWQpCiBzdGF0aWMgX19hbHdheXNfaW5saW5l
CiBzdHJ1Y3QgdmRzb19ybmdfZGF0YSAqX194ODZfZ2V0X2tfdmRzb19ybmdfZGF0YSh2b2lkKQog
ewotCXJldHVybiAmX3Zkc29fcm5nX2RhdGE7CisJcmV0dXJuICh2b2lkICopJl9fdnZhcl9wYWdl
ICsgX19WRFNPX1JORF9EQVRBX09GRlNFVDsKIH0KICNkZWZpbmUgX19hcmNoX2dldF9rX3Zkc29f
cm5nX2RhdGEgX194ODZfZ2V0X2tfdmRzb19ybmdfZGF0YQogCmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS92dmFyLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92dmFyLmgKaW5kZXgg
MDFlNjBlMGY2NzFlOTYyNTY2OWRjOGZkYWNmM2NkZGRmOGNiZjRmYi4uZmUzNDM0ZDNiNWIxZWVm
ODA2ZTgzMjhiODY2NTBlMDAxYjE3N2RlMiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9h
c20vdnZhci5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Z2YXIuaApAQCAtMTksNiArMTks
OCBAQAogI2lmbmRlZiBfQVNNX1g4Nl9WVkFSX0gKICNkZWZpbmUgX0FTTV9YODZfVlZBUl9ICiAK
KyNkZWZpbmUgX19WRFNPX1JORF9EQVRBX09GRlNFVCAgNjQwCisKICNpZmRlZiBFTUlUX1ZWQVIK
IC8qCiAgKiBFTUlUX1ZWQVIoKSBpcyB1c2VkIGJ5IHRoZSBrZXJuZWwgbGlua2VyIHNjcmlwdCB0
byBwdXQgdnZhcnMgaW4gdGhlCkBAIC02Miw3ICs2NCw3IEBAIERFQ0xBUkVfVlZBUigwLCBzdHJ1
Y3QgdmRzb19kYXRhLCBfdmRzb19kYXRhKQogCiAjaWYgIWRlZmluZWQoX1NJTkdMRV9EQVRBKQog
I2RlZmluZSBfU0lOR0xFX0RBVEEKLURFQ0xBUkVfVlZBUl9TSU5HTEUoNjQwLCBzdHJ1Y3QgdmRz
b19ybmdfZGF0YSwgX3Zkc29fcm5nX2RhdGEpCitERUNMQVJFX1ZWQVJfU0lOR0xFKF9fVkRTT19S
TkRfREFUQV9PRkZTRVQsIHN0cnVjdCB2ZHNvX3JuZ19kYXRhLCBfdmRzb19ybmdfZGF0YSkKICNl
bmRpZgogCiAjdW5kZWYgREVDTEFSRV9WVkFSCgotLSAKMi40Ny4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
