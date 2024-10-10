Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C813CF07BA
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ljBUSfQpg154M2i++0iIjIsdSPkhOQWos2cqu02aFM=; b=YJOp/uPguyY340
	Jp9Gt53qrdr/t3KvRuObJTbd9auU4aG6sRWrUAgSFxydEid6W0zgdekrUR5fH5ZTXSwwSxge2Vh7c
	nxYo/9bycAqPn/uv2NWNyq1pBLQrZz/LIgzoktoBBa/ypSKtChLvLs5t9YF5f1afHItaOcu5vPRHN
	au/0+6I3X/cqeL2JdcfFEgVN7G4cJ8N49CoCFxM8jsM5T7lR8qSHmAbt9B3Je0HSwJTfG9WPjgqTj
	ewOkQL/Ts5E+YoGR29SHjCNVQ/7NehQ4CWuHe++k3yhbITbQ96I745zoPKS5pBxIcTHAHG0TYybjb
	gtZ7JwEDoBejfgrx2WXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synZ2-0000000BpfG-0d1g;
	Thu, 10 Oct 2024 07:26:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBl-0000000BloH-0609;
	Thu, 10 Oct 2024 07:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TZZQlViVgS+2LcEo+qdBKA00fw+gxukShi7G3ebpqnY=; b=NgZleAcs9VB30oZfMtEjk2tDiS
	AWqtDvRkr/8Y5+VRYRBRo5zEt+fKCjABKiHH8TcpwSNLbMauAHGKTao7hjxtruovhYyHV6LdB7VEX
	elzLJPHL3j6IeOWZBBiJfbZs3QJRunVLnxMXN4B48FVgCialTG/HLL5u+D9L3SvTezqh3uLdGccij
	g96lSwbj1LSdvzd7su9GjMNMI0n1bv272h0CkQ6EGk1gn+avVL00KhQnIsUXV1KqmUAJmRnGq2jK4
	YhsWhXM5uulanbz72y74PONIcynNQfyJgP9YQne5wv1o3fPjOsJU6Mkz9DuUaAk7bbL3CArnyf0pc
	lc6CtPEA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBe-00000005Cvq-3WTA;
	Thu, 10 Oct 2024 07:02:19 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZZQlViVgS+2LcEo+qdBKA00fw+gxukShi7G3ebpqnY=;
	b=PVsUO368dvql/siKBcpr9l5wYV4gYvcYn+cxK8Bxegv6YBpSjlkgXybg8U/1i1nMy9++e2
	42nElRgzH1PBc+dSbfyFDW8aSC0HBfV3Aadzkj6Cpyp+e59OoY0g+cQndaUKRJbu4CO7DM
	o8rkBzg6kV1RR+JyoGzS2VR73qMblxTf04SSnaKYQK2EYn1rTEb3Pu+SgXzPngSo3ERkQ0
	TofPkQyQHnJ4jtDyurMvGZEZCTa7ECfE4BhsPZlXUYE/Vl6tN9HLshReXkL6u4vAR+7nFs
	SO/EWZU2mJglWlFygDzUbPHhwxnrPFhEH1Vh9KZa/9zbni2aeTD6VtWRsRjEmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZZQlViVgS+2LcEo+qdBKA00fw+gxukShi7G3ebpqnY=;
	b=cLvqHqySEHPZv1US1u8oDr9/h69opZq35kGQUn624MzSrtK+ViZDTJRnanJyDRS+U2H/Hg
	2sObeUVzRaZbQuBg==
Date: Thu, 10 Oct 2024 09:01:20 +0200
Subject: [PATCH 18/28] x86: vdso: Access vdso data without vvar.h
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-18-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2055;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=UVvHeMYo/4L1aZCClOsAJMCXlWGGvhyJSXRP56wXKoU=;
 b=Aw70U3TtTDgXoPoGX+ZU4CBMgh7YOqogGwOrL3DIezjMDNN7aimwPWM/gowDGA3eCE5TmK29N
 cDgvvkWxm5WBH3Pxzm3+MzflaZU+Rl+tz3bBifk8tkeFXLxlyVbS9Y9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080215_319699_106CB32D 
X-CRM114-Status: GOOD (  11.68  )
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

VGhlIHZkc29fZGF0YSBpcyBhdCB0aGUgc3RhcnQgb2YgdGhlIHZ2YXIgcGFnZS4KTWFrZSB1c2Ug
b2YgdGhpcyBpbnZhcmlhbnQgdG8gcmVtb3ZlIHRoZSB1c2FnZSBvZiB2dmFyLmguClRoaXMgYWxz
byBtYXRjaGVzIHRoZSBsb2dpYyBmb3IgdGhlIHRpbWVucyBkYXRhLgoKU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXguZGU+Ci0tLQog
YXJjaC94ODYvZW50cnkvdmRzby92ZHNvLWxheW91dC5sZHMuUyAgICB8IDUgLS0tLS0KIGFyY2gv
eDg2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmggfCA2ICsrKy0tLQogMiBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvZW50cnkvdmRzby92ZHNvLWxheW91dC5sZHMuUyBiL2FyY2gveDg2L2VudHJ5L3Zkc28v
dmRzby1sYXlvdXQubGRzLlMKaW5kZXggYzdlMTk0YjZlNDdkZWYzYmZhNjgxYjNlYzVkNDVjZmZm
YmU4MzlkMi4uOWU2MDJjMDYxNTI0M2Y4NjY3NDk4YWMyNDVjMmFhZjFiMzVkY2QxNiAxMDA2NDQK
LS0tIGEvYXJjaC94ODYvZW50cnkvdmRzby92ZHNvLWxheW91dC5sZHMuUworKysgYi9hcmNoL3g4
Ni9lbnRyeS92ZHNvL3Zkc28tbGF5b3V0Lmxkcy5TCkBAIC0yMCwxMSArMjAsNiBAQCBTRUNUSU9O
UwogCXZ2YXJfc3RhcnQgPSAuIC0gNCAqIFBBR0VfU0laRTsKIAl2dmFyX3BhZ2UgID0gdnZhcl9z
dGFydDsKIAotCS8qIFBsYWNlIGFsbCB2dmFycyBhdCB0aGUgb2Zmc2V0cyBpbiBhc20vdnZhci5o
LiAqLwotI2RlZmluZSBFTUlUX1ZWQVIobmFtZSwgb2Zmc2V0KSB2dmFyXyAjIyBuYW1lID0gdnZh
cl9wYWdlICsgb2Zmc2V0OwotI2luY2x1ZGUgPGFzbS92dmFyLmg+Ci0jdW5kZWYgRU1JVF9WVkFS
Ci0KIAl2ZHNvX3JuZ19kYXRhID0gdnZhcl9wYWdlICsgX19WRFNPX1JORF9EQVRBX09GRlNFVDsK
IAogCXB2Y2xvY2tfcGFnZSA9IHZ2YXJfc3RhcnQgKyBQQUdFX1NJWkU7CmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oIGIvYXJjaC94ODYvaW5jbHVk
ZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaAppbmRleCAxZTYxMTYxNzJhNjVjZDA3ZWYyOTA5MmRi
YTYyNDFkNzE5ZjA3NDQ4Li4zNzVhMzRiMGYzNjU3OTJlYzEwODM4MWQ3YzcyMjlmODM1MTQ0OGY3
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oCisr
KyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmgKQEAgLTE0LDEzICsx
NCwxMyBAQAogCiAjaW5jbHVkZSA8dWFwaS9saW51eC90aW1lLmg+CiAjaW5jbHVkZSA8YXNtL3Zn
dG9kLmg+Ci0jaW5jbHVkZSA8YXNtL3Z2YXIuaD4KICNpbmNsdWRlIDxhc20vdW5pc3RkLmg+CiAj
aW5jbHVkZSA8YXNtL21zci5oPgogI2luY2x1ZGUgPGFzbS9wdmNsb2NrLmg+CiAjaW5jbHVkZSA8
Y2xvY2tzb3VyY2UvaHlwZXJ2X3RpbWVyLmg+CiAKLSNkZWZpbmUgX192ZHNvX2RhdGEgKFZWQVIo
X3Zkc29fZGF0YSkpCitleHRlcm4gc3RydWN0IHZkc29fZGF0YSB2dmFyX3BhZ2UKKwlfX2F0dHJp
YnV0ZV9fKCh2aXNpYmlsaXR5KCJoaWRkZW4iKSkpOwogCiBleHRlcm4gc3RydWN0IHZkc29fZGF0
YSB0aW1lbnNfcGFnZQogCV9fYXR0cmlidXRlX18oKHZpc2liaWxpdHkoImhpZGRlbiIpKSk7CkBA
IC0yNzcsNyArMjc3LDcgQEAgc3RhdGljIGlubGluZSB1NjQgX19hcmNoX2dldF9od19jb3VudGVy
KHMzMiBjbG9ja19tb2RlLAogCiBzdGF0aWMgX19hbHdheXNfaW5saW5lIGNvbnN0IHN0cnVjdCB2
ZHNvX2RhdGEgKl9fYXJjaF9nZXRfdmRzb19kYXRhKHZvaWQpCiB7Ci0JcmV0dXJuIF9fdmRzb19k
YXRhOworCXJldHVybiAmdnZhcl9wYWdlOwogfQogCiBzdGF0aWMgaW5saW5lIGJvb2wgYXJjaF92
ZHNvX2Nsb2Nrc291cmNlX29rKGNvbnN0IHN0cnVjdCB2ZHNvX2RhdGEgKnZkKQoKLS0gCjIuNDcu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
