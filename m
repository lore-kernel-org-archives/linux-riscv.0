Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774D1CF07BC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gADQHxN4O0y8KYhNCRzny1VvrQ0YtViOFONgnzU/63I=; b=OfC6iETc3ME6JO
	PIZZP0f80o+fCKBdOGFOtc+sPM9KRJc65ocHdDurrKlTVLdQSORoWWdDFD44PSmJM+3QHTkhK3U/Q
	0qY46/YVX/zBaXEttY6FQ/VE31/UsQio62ukifQXlsS9WdAkpjnaDxi+NI/raX0ETDjkQqCSFTCVF
	bzaQmMALumX34zrpntr9xsT3JzMYYHW/jCQu4rJXaav8k6+oOGB/NSA8tW/2dhwf7uddiduKybSj3
	ASmFXuAqq4TM3w04NpPwPScRRlSvDtgSB4Km3rLkx6GX+K7b1tWIImfpC5xYxf9hMgD5QjBtbkbKS
	sBgtK5++OIYHe9XYi0Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synTe-0000000BpFq-3QIx;
	Thu, 10 Oct 2024 07:20:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBi-0000000BlmC-0Vnq;
	Thu, 10 Oct 2024 07:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=c0jOb+0pBVFtpRBvmlWca4rm6bPz719GqeyVxg9V4Yk=; b=n58sLzAaQMhSuIC3oysq29/Iqx
	SVqBTgXBjdCivwfz/+/Xq7C5sphNgLyK4yRKrj6tAKAgj+UHXUN7TFo2psLHKG9kkLapH46igqiT8
	luH547Q8PgILLVx1NQ/r7XZfKkHUVMxl6ea7rafnda6EkiKuDBC62sjwFr37oUM26I+6XuJ8Pp1lt
	oXeezrL+qJMApLuVbr7rX0A20LSCM0G3G1lMAHnm64WQt3cMnh3Cdk+ElIxKHMlYRsxikCHD3WBVG
	f+y98O6e6dHeqpkoPGItNzwDVh+ciAAfvtI5e0LSH5P6zp4sq9vmyr+sW7GUAFaKh9BF6waZjLuVX
	RtRjp4eg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBb-00000006yD0-1kvo;
	Thu, 10 Oct 2024 07:02:16 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0jOb+0pBVFtpRBvmlWca4rm6bPz719GqeyVxg9V4Yk=;
	b=vcSKL5Ei05MaIvwUWEEkh1o2Ks/eorA8eAEJRD0CuQzgOALnIEbeQVOd0f2FLvUuk9711Q
	tmjQMOz6qR/FSaU590Uhit+apcTIvS6HqZSZBnjaTKGO+jLKVUowkedgLFEeyq4eh5Q57T
	/sBv5eMaiq5R28QJPg2l8Q/b/b0NPmH0LvedMx9h3Ccjpfv4fUQ6F0RpGgk274N++hnkj5
	59rLGt0i4dJYnpcuI1c9gDghiHkvBwQDrj48KYgfMgkCsLRgDHBp3cs4nJ5upXJnypV9+l
	R1g1z2Z2x16M+GL7rp+0QROcQL103T3FYjfOZVs0Y4ucjszEaq1P/PyGDChuKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0jOb+0pBVFtpRBvmlWca4rm6bPz719GqeyVxg9V4Yk=;
	b=gtMxsvQWmbQIKGeUBCn063lFjoQTBpOVE8sqGXxcphJb6jAHTMcx0B08jmt1ST+co49ykp
	nznusCNutY6jRIDw==
Date: Thu, 10 Oct 2024 09:01:16 +0200
Subject: [PATCH 14/28] x86: vdso: Allocate vvar page from C code
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-14-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=4524;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3awjAm9ufpQd1He4UP6AdNApXBAJ0LbyYsxfWiE+63U=;
 b=lKDP23WVMRWJvIoSEl4GRHapesPFvH7pyf318uwEN73rQnQewl633LJdXV98MCj8D0iG9mp5X
 j/cHGTbQmCQCoN3JlHegeGrKD9rS1alFnZxIvXe0Z7RMU6pXnx65LOL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080212_193270_380D71FC 
X-CRM114-Status: GOOD (  15.08  )
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

QWxsb2NhdGUgdGhlIHZ2YXIgcGFnZSB0aHJvdWdoIHRoZSBzdGFuZGFyZCB1bmlvbiB2ZHNvX2Rh
dGFfc3RvcmUKYW5kIHJlbW92ZSB0aGUgY3VzdG9tIGxpbmtlciBzY3JpcHQgbG9naWMuCgpTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25p
eC5kZT4KLS0tCiBhcmNoL3g4Ni9lbnRyeS92ZHNvL3ZtYS5jICAgICAgICAgICAgfCAxNiArKysr
Ky0tLS0tLS0tLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggfCAgNiAr
KysrLS0KIGFyY2gveDg2L2tlcm5lbC92bWxpbnV4Lmxkcy5TICAgICAgICB8IDIzIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiBhcmNoL3g4Ni90b29scy9yZWxvY3MuYyAgICAgICAgICAgICAgfCAg
MSAtCiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYvZW50cnkvdmRzby92bWEuYyBiL2FyY2gveDg2L2VudHJ5L3Zk
c28vdm1hLmMKaW5kZXggODQzNzkwNmZkNGIzNTNhZDBmZTIwOGQ4MTE4MTdhMWI2ZjhmOGRjYi4u
NTczMWRjMzVkMWQyYzBiODFjMzdhZGYxMzNmYzZmYTM1YzQxY2JhMSAxMDA2NDQKLS0tIGEvYXJj
aC94ODYvZW50cnkvdmRzby92bWEuYworKysgYi9hcmNoL3g4Ni9lbnRyeS92ZHNvL3ZtYS5jCkBA
IC0yMCwyNSArMjAsMTkgQEAKICNpbmNsdWRlIDxhc20vdmd0b2QuaD4KICNpbmNsdWRlIDxhc20v
cHJvdG8uaD4KICNpbmNsdWRlIDxhc20vdmRzby5oPgotI2luY2x1ZGUgPGFzbS92dmFyLmg+CiAj
aW5jbHVkZSA8YXNtL3RsYi5oPgogI2luY2x1ZGUgPGFzbS9wYWdlLmg+CiAjaW5jbHVkZSA8YXNt
L2Rlc2MuaD4KICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgogI2luY2x1ZGUgPGNsb2Nrc291
cmNlL2h5cGVydl90aW1lci5oPgogCi0jdW5kZWYgX0FTTV9YODZfVlZBUl9ICi0jZGVmaW5lIEVN
SVRfVlZBUihuYW1lLCBvZmZzZXQpCVwKLQljb25zdCBzaXplX3QgbmFtZSAjIyBfb2Zmc2V0ID0g
b2Zmc2V0OwotI2luY2x1ZGUgPGFzbS92dmFyLmg+Ci0KIHN0cnVjdCB2ZHNvX2RhdGEgKmFyY2hf
Z2V0X3Zkc29fZGF0YSh2b2lkICp2dmFyX3BhZ2UpCiB7Ci0JcmV0dXJuIChzdHJ1Y3QgdmRzb19k
YXRhICopKHZ2YXJfcGFnZSArIF92ZHNvX2RhdGFfb2Zmc2V0KTsKKwlyZXR1cm4gKHN0cnVjdCB2
ZHNvX2RhdGEgKil2dmFyX3BhZ2U7CiB9Ci0jdW5kZWYgRU1JVF9WVkFSCiAKLURFRklORV9WVkFS
KHN0cnVjdCB2ZHNvX2RhdGEsIF92ZHNvX2RhdGEpOworc3RhdGljIHVuaW9uIHZkc29fZGF0YV9z
dG9yZSB2ZHNvX2RhdGFfc3RvcmUgX19wYWdlX2FsaWduZWRfZGF0YTsKK3N0cnVjdCB2ZHNvX2Rh
dGEgKnZkc29fZGF0YSA9IHZkc29fZGF0YV9zdG9yZS5kYXRhOwogCiB1bnNpZ25lZCBpbnQgdmNs
b2Nrc191c2VkIF9fcmVhZF9tb3N0bHk7CiAKQEAgLTE1Myw3ICsxNDcsNyBAQCBzdGF0aWMgdm1f
ZmF1bHRfdCB2dmFyX2ZhdWx0KGNvbnN0IHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcgKnNtLAog
CWlmIChzeW1fb2Zmc2V0ID09IGltYWdlLT5zeW1fdnZhcl9wYWdlKSB7CiAJCXN0cnVjdCBwYWdl
ICp0aW1lbnNfcGFnZSA9IGZpbmRfdGltZW5zX3Z2YXJfcGFnZSh2bWEpOwogCi0JCXBmbiA9IF9f
cGFfc3ltYm9sKCZfX3Z2YXJfcGFnZSkgPj4gUEFHRV9TSElGVDsKKwkJcGZuID0gX19wYV9zeW1i
b2wodmRzb19kYXRhKSA+PiBQQUdFX1NISUZUOwogCiAJCS8qCiAJCSAqIElmIGEgdGFzayBiZWxv
bmdzIHRvIGEgdGltZSBuYW1lc3BhY2UgdGhlbiBhIG5hbWVzcGFjZQpAQCAtMjAwLDcgKzE5NCw3
IEBAIHN0YXRpYyB2bV9mYXVsdF90IHZ2YXJfZmF1bHQoY29uc3Qgc3RydWN0IHZtX3NwZWNpYWxf
bWFwcGluZyAqc20sCiAJCWlmICghdGltZW5zX3BhZ2UpCiAJCQlyZXR1cm4gVk1fRkFVTFRfU0lH
QlVTOwogCi0JCXBmbiA9IF9fcGFfc3ltYm9sKCZfX3Z2YXJfcGFnZSkgPj4gUEFHRV9TSElGVDsK
KwkJcGZuID0gX19wYV9zeW1ib2wodmRzb19kYXRhKSA+PiBQQUdFX1NISUZUOwogCQlyZXR1cm4g
dm1mX2luc2VydF9wZm4odm1hLCB2bWYtPmFkZHJlc3MsIHBmbik7CiAJfQogCmRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmggYi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS92ZHNvL3ZzeXNjYWxsLmgKaW5kZXggMmNiYjMyYThhNDVlMmY1YzdiYzAyMTcyYWYwZmEw
OTE3M2YzMzkyNC4uNWQ2NzYwNzQ2ZDE1YjBlMTJjN2JmMGViNzI3MjQxZTc1NzZjYTljNyAxMDA2
NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby92c3lzY2FsbC5oCisrKyBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL3Zkc28vdnN5c2NhbGwuaApAQCAtOSwyMCArOSwyMiBAQAogI2luY2x1
ZGUgPGFzbS92Z3RvZC5oPgogI2luY2x1ZGUgPGFzbS92dmFyLmg+CiAKK2V4dGVybiBzdHJ1Y3Qg
dmRzb19kYXRhICp2ZHNvX2RhdGE7CisKIC8qCiAgKiBVcGRhdGUgdGhlIHZEU08gZGF0YSBwYWdl
IHRvIGtlZXAgaW4gc3luYyB3aXRoIGtlcm5lbCB0aW1la2VlcGluZy4KICAqLwogc3RhdGljIF9f
YWx3YXlzX2lubGluZQogc3RydWN0IHZkc29fZGF0YSAqX194ODZfZ2V0X2tfdmRzb19kYXRhKHZv
aWQpCiB7Ci0JcmV0dXJuIF92ZHNvX2RhdGE7CisJcmV0dXJuIHZkc29fZGF0YTsKIH0KICNkZWZp
bmUgX19hcmNoX2dldF9rX3Zkc29fZGF0YSBfX3g4Nl9nZXRfa192ZHNvX2RhdGEKIAogc3RhdGlj
IF9fYWx3YXlzX2lubGluZQogc3RydWN0IHZkc29fcm5nX2RhdGEgKl9feDg2X2dldF9rX3Zkc29f
cm5nX2RhdGEodm9pZCkKIHsKLQlyZXR1cm4gKHZvaWQgKikmX192dmFyX3BhZ2UgKyBfX1ZEU09f
Uk5EX0RBVEFfT0ZGU0VUOworCXJldHVybiAodm9pZCAqKXZkc29fZGF0YSArIF9fVkRTT19STkRf
REFUQV9PRkZTRVQ7CiB9CiAjZGVmaW5lIF9fYXJjaF9nZXRfa192ZHNvX3JuZ19kYXRhIF9feDg2
X2dldF9rX3Zkc29fcm5nX2RhdGEKIApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL3ZtbGlu
dXgubGRzLlMgYi9hcmNoL3g4Ni9rZXJuZWwvdm1saW51eC5sZHMuUwppbmRleCA2NzI2YmU4OWI3
YTY2M2ExNTU0ZjhmNGIyOTdiYmE2NWI0ZWJkZjYxLi5lN2UxOTg0MjczNmE3NzQxOTExNDJiNmNl
NDNiZjU1Njc1NDBjYjgwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvdm1saW51eC5sZHMu
UworKysgYi9hcmNoL3g4Ni9rZXJuZWwvdm1saW51eC5sZHMuUwpAQCAtMTkzLDI5ICsxOTMsNiBA
QCBTRUNUSU9OUwogCiAJT1JDX1VOV0lORF9UQUJMRQogCi0JLiA9IEFMSUdOKFBBR0VfU0laRSk7
Ci0JX192dmFyX3BhZ2UgPSAuOwotCi0JLnZ2YXIgOiBBVChBRERSKC52dmFyKSAtIExPQURfT0ZG
U0VUKSB7Ci0JCS8qIHdvcmsgYXJvdW5kIGdvbGQgYnVnIDEzMDIzICovCi0JCV9fdnZhcl9iZWdp
bm5pbmdfaGFjayA9IC47Ci0KLQkJLyogUGxhY2UgYWxsIHZ2YXJzIGF0IHRoZSBvZmZzZXRzIGlu
IGFzbS92dmFyLmguICovCi0jZGVmaW5lIEVNSVRfVlZBUihuYW1lLCBvZmZzZXQpCQkJCVwKLQkJ
LiA9IF9fdnZhcl9iZWdpbm5pbmdfaGFjayArIG9mZnNldDsJXAotCQkqKC52dmFyXyAjIyBuYW1l
KQotI2luY2x1ZGUgPGFzbS92dmFyLmg+Ci0jdW5kZWYgRU1JVF9WVkFSCi0KLQkJLyoKLQkJICog
UGFkIHRoZSByZXN0IG9mIHRoZSBwYWdlIHdpdGggemVyb3MuICBPdGhlcndpc2UgdGhlIGxvYWRl
cgotCQkgKiBjYW4gbGVhdmUgZ2FyYmFnZSBoZXJlLgotCQkgKi8KLQkJLiA9IF9fdnZhcl9iZWdp
bm5pbmdfaGFjayArIFBBR0VfU0laRTsKLQl9IDpkYXRhCi0KLQkuID0gQUxJR04oX192dmFyX3Bh
Z2UgKyBQQUdFX1NJWkUsIFBBR0VfU0laRSk7Ci0KIAkvKiBJbml0IGNvZGUgYW5kIGRhdGEgLSB3
aWxsIGJlIGZyZWVkIGFmdGVyIGluaXQgKi8KIAkuID0gQUxJR04oUEFHRV9TSVpFKTsKIAkuaW5p
dC5iZWdpbiA6IEFUKEFERFIoLmluaXQuYmVnaW4pIC0gTE9BRF9PRkZTRVQpIHsKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3Rvb2xzL3JlbG9jcy5jIGIvYXJjaC94ODYvdG9vbHMvcmVsb2NzLmMKaW5k
ZXggYzEwMWJlZDYxOTQwMDAwMDRiZDg0ZTE2NzkyNTljY2U5OTc3ZDI5MC4uNmFmZTJlNWU5MTAy
ODczNjM0YzZhZDlhM2EwYjljNjZiYmE1ZGE1MCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvdG9vbHMv
cmVsb2NzLmMKKysrIGIvYXJjaC94ODYvdG9vbHMvcmVsb2NzLmMKQEAgLTg5LDcgKzg5LDYgQEAg
c3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdAlzeW1fcmVnZXhfa2VybmVsW1NfTlNZTVRZUEVTXSA9
IHsKIAkiaW5pdF9wZXJfY3B1X18uKnwiCiAJIl9fZW5kX3JvZGF0YV9ocGFnZV9hbGlnbnwiCiAj
ZW5kaWYKLQkiX192dmFyX3BhZ2V8IgogCSJfZW5kKSQiCiB9OwogCgotLSAKMi40Ny4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
