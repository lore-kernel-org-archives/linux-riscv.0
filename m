Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896BFCF07B9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwbP4jTCqyfU+3Giu5SnXVEkzOhEmoIGI3ANkRTZRXU=; b=vYWCkjmIi0NW0D
	3/GiGMK0BRDZy8RIrSOTF7Yje4EY6l9GOJSr6S0MFKiR2E6xj1st6IU/Moec9tpCC1F0cP1mDselu
	U6vCcNIG0axv9z+M75fknCRc0hJnEpsHiRj3pN7AKsZkgEgzqYhK4+rHdye+rK2aLmnLZk7204zEX
	xaQUu20tE+7hV/iXHQQkjPpnDFzhgQ9GTuYyxvqt9XhIUO+fmf7zxbfwVXYKjB5SM+1Jj+v0HI2Zi
	MCLci+Vps085UGJzrB97MVMT4tOpu3Dwyvu1e1aUTTD6xtZaUdUpkDMyaG4mRU/Y5BKkI8LRmJWSz
	kSdrAYtmcZVUQj4d8a+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synFp-0000000BnPU-2fVR;
	Thu, 10 Oct 2024 07:06:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBX-0000000Blgv-38Kj;
	Thu, 10 Oct 2024 07:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PTaWPH0GsoC/f/xHFuh5G2lj04S9r5qi58p+jYQJPbk=; b=fKJ3EYWysUhWfiMe9qmUNvY68K
	+dXBfuxhyDdJMMQCzt1OmB65/yUJZcjEiKqexFk6hP7C23NKx/qfkeh5XAO8jVfjH/DMmvnXsx7qH
	sw00j4kscKqIDWicDn0Rx/RWgNqBHgkX/Tu82tZ8olH8eC4TQDSxyOCn8ta8daXu9A5dt1udo+L6X
	abOeBrD4dguVjhRJypwDLaYUNTuvSkWdLvIPDTSCLh9ia3F3LVCZ904YGRNVLLDjsm9VROUD46g9U
	xSNlZww+SDlFqKFR1GSsW9C6SlE556Q0934p2512Z+mMVgSQBqAbb+CBBJbrRQ5wrnp64fT9u4Uod
	llXyZ0AQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBU-00000005CnU-2fHK;
	Thu, 10 Oct 2024 07:02:06 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTaWPH0GsoC/f/xHFuh5G2lj04S9r5qi58p+jYQJPbk=;
	b=lTa7tpZPSMpYqBOTXcrRlaMExCnwkTH8H6hYeS3O+dLE/v1NII2D+NfhOrHIM/HjIOvpKb
	iEjMp5s35jvJ1C4i20pMv9eIftSeqdclfqgPGFKkr5ZBz18rM6WABeHbt9yiQ9AqlEnxB7
	cOL0uzuhW7R/2qz2vnSxj8qEdmiqiCSsllD8wq48lRHWoat4L3iQIcath9RHzcvDXo7mjh
	BcCUk8KDuyaeuMnv+LdLXC0kSp+eoC1/f1Ti3YZNb2ryOJ2A1BebUstcmNJVT/sFAx+eyA
	gjJVwe9Jfig5ovQyz3D9CMKNH5QprqbdDcOdMMVExYTTXiJSBoTqKNoxJVsWCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTaWPH0GsoC/f/xHFuh5G2lj04S9r5qi58p+jYQJPbk=;
	b=/CAqjPr6rxtw1rBkGjYlFRS7wVbrerb1tE7vy4nq86qESK/0YxyCNEBt22Mml7Xgziyxv2
	FQKOjqD3bM9qTdBg==
Date: Thu, 10 Oct 2024 09:01:05 +0200
Subject: [PATCH 03/28] s390/vdso: Drop LBASE_VDSO
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-3-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1973;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=M1UHCDZZZ5fXWxxT1qvNaxpIVftl+fGBVImNfA2mkLk=;
 b=hG1gakiEm8cjk7VRIpvdmQlN9QnPXDvcOtIcU7k1TMbtC8u2E2IXfzi6S1RfiCNX3R9MIKgXJ
 cPnWnTEKA5CC4LuIt9YAXlYWgz716XqXk1/Gb4r134/tWzKtZxY7Eb7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080204_876132_47101480 
X-CRM114-Status: GOOD (  10.42  )
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

VGhpcyBjb25zdGFudCBpcyBhbHdheXMgIjAiLCBwcm92aWRpbmcgbm8gdmFsdWUgYW5kIG1ha2lu
ZyB0aGUgbG9naWMKaGFyZGVyIHRvIHVuZGVyc3RhbmQuCkFsc28gcHJlcGFyZSBmb3IgYSBjb25z
b2xpZGF0aW9uIG9mIHRoZSB2ZHNvIGxpbmtlcnNjcmlwdCBsb2dpYyBieQphbGlnbmluZyBpdCB3
aXRoIG90aGVyIGFyY2hpdGVjdHVyZXMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1
aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL3MzOTAvaW5jbHVk
ZS9hc20vdmRzby5oICAgICAgICAgfCAzIC0tLQogYXJjaC9zMzkwL2tlcm5lbC92ZHNvMzIvdmRz
bzMyLmxkcy5TIHwgMiArLQogYXJjaC9zMzkwL2tlcm5lbC92ZHNvNjQvdmRzbzY0Lmxkcy5TIHwg
MiArLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3Zkc28uaCBiL2FyY2gvczM5MC9pbmNs
dWRlL2FzbS92ZHNvLmgKaW5kZXggOTEwNjFmMDI3OWJlNDUyMWEyYjU0NzBiY2Y4ZGU2NzgwYjdk
NjgwNi4uOTJjNzNlNGQ5N2E5M2E5MGNiNjQwZDQ0ZmNhOTg1NmY5M2UwYmUxNCAxMDA2NDQKLS0t
IGEvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3Zkc28uaAorKysgYi9hcmNoL3MzOTAvaW5jbHVkZS9h
c20vdmRzby5oCkBAIC0xMiw5ICsxMiw2IEBAIGludCB2ZHNvX2dldGNwdV9pbml0KHZvaWQpOwog
CiAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovCiAKLS8qIERlZmF1bHQgbGluayBhZGRyZXNzIGZv
ciB0aGUgdkRTTyAqLwotI2RlZmluZSBWRFNPX0xCQVNFCTAKLQogI2RlZmluZSBfX1ZWQVJfUEFH
RVMJMgogCiAjZGVmaW5lIFZEU09fVkVSU0lPTl9TVFJJTkcJTElOVVhfMi42LjI5CmRpZmYgLS1n
aXQgYS9hcmNoL3MzOTAva2VybmVsL3Zkc28zMi92ZHNvMzIubGRzLlMgYi9hcmNoL3MzOTAva2Vy
bmVsL3Zkc28zMi92ZHNvMzIubGRzLlMKaW5kZXggNjViOTUxM2E1YTBlZTJhN2UzNTA4YTFkOTE5
ZjgyNmM0YjQxODRjYS4uYzkxNmM0ZjczZjc2NmViY2M5MzI4YjE4OWU0NjAxNWU2NzM5M2IwZCAx
MDA2NDQKLS0tIGEvYXJjaC9zMzkwL2tlcm5lbC92ZHNvMzIvdmRzbzMyLmxkcy5TCisrKyBiL2Fy
Y2gvczM5MC9rZXJuZWwvdmRzbzMyL3Zkc28zMi5sZHMuUwpAQCAtMTYsNyArMTYsNyBAQCBTRUNU
SU9OUwogI2lmZGVmIENPTkZJR19USU1FX05TCiAJUFJPVklERShfdGltZW5zX2RhdGEgPSBfdmRz
b19kYXRhICsgUEFHRV9TSVpFKTsKICNlbmRpZgotCS4gPSBWRFNPX0xCQVNFICsgU0laRU9GX0hF
QURFUlM7CisJLiA9IFNJWkVPRl9IRUFERVJTOwogCiAJLmhhc2gJCTogeyAqKC5oYXNoKSB9CQkJ
OnRleHQKIAkuZ251Lmhhc2gJOiB7ICooLmdudS5oYXNoKSB9CmRpZmYgLS1naXQgYS9hcmNoL3Mz
OTAva2VybmVsL3Zkc282NC92ZHNvNjQubGRzLlMgYi9hcmNoL3MzOTAva2VybmVsL3Zkc282NC92
ZHNvNjQubGRzLlMKaW5kZXggNzUzMDQwYTRiNWFiMjcxYzQzMmQ0YWJjYWEwNGQ2OWE4OGQ1NGIx
Ny4uZWM0MmI3ZDljYjUzMDk0Yjc4M2M2YjA0OTI5NjJhZjdlNTAyNzgzMSAxMDA2NDQKLS0tIGEv
YXJjaC9zMzkwL2tlcm5lbC92ZHNvNjQvdmRzbzY0Lmxkcy5TCisrKyBiL2FyY2gvczM5MC9rZXJu
ZWwvdmRzbzY0L3Zkc282NC5sZHMuUwpAQCAtMTgsNyArMTgsNyBAQCBTRUNUSU9OUwogI2lmZGVm
IENPTkZJR19USU1FX05TCiAJUFJPVklERShfdGltZW5zX2RhdGEgPSBfdmRzb19kYXRhICsgUEFH
RV9TSVpFKTsKICNlbmRpZgotCS4gPSBWRFNPX0xCQVNFICsgU0laRU9GX0hFQURFUlM7CisJLiA9
IFNJWkVPRl9IRUFERVJTOwogCiAJLmhhc2gJCTogeyAqKC5oYXNoKSB9CQkJOnRleHQKIAkuZ251
Lmhhc2gJOiB7ICooLmdudS5oYXNoKSB9CgotLSAKMi40Ny4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
