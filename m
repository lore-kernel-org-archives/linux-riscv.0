Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8C8CF07B8
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7zipmxM7V2ibt3yvvS74QnxQFRz4uixElQym++pREU=; b=XIMyyllZ+Az4lm
	RJ/069gazivN+/0EX3tVCKgl5ZU13wFzxmR/7wCJoUkCKsJ0d7EP+iRr09c5SzrzW9b4/T9UKbbN5
	od3bn9PLP3B8zumVnQmpBZvbWK1VzsSL3TklrGl++YIUnROKBjTENoMbBtlPqH3utCABr6KTsL5fj
	99Q3vPAysfq6bLhujf3t3EzF4/EDv6Ww6GYf9DFPQ3KhfxqI6dOcOUmK3OIXgfqC/i+iozny8yLSp
	w1CwyAzL9QgZLe3tWV3VARnDWcv8qVt5nZhL3Q1FtzVb3YhEVg2MoRBn8aD/xu6z/KeHgDurHD4DF
	KN1hdErhSppWpupJ1frg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synHC-0000000Bnir-3LUS;
	Thu, 10 Oct 2024 07:07:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBZ-0000000BliB-1Ymx;
	Thu, 10 Oct 2024 07:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ss7tdeW7PchzSqqaQvkxVTIKlW4rJNWH4B0dpyhMHfI=; b=EEo9UOn+UAvSX4pa8vFU7RE06A
	ML62A4gYEQ/31t6NvfjH7aapI80/SeDH9zFfGGU6HBBvBaILdhSTCvm554cTBXcPSL0Z0qEsaoAoC
	niIy+xD/ocDP7SlTlfDNadJR9QYcHSl14DmtotqM2GbpT5g+4uSgHrUCuDOS+gIXtiJfDJT9BOjrC
	0qXVcwXSd4XxD6QGWFKfi3JQd4/Arx2x9ezb68rfGlxILJLlJC6L1Volp1G3yjv8IbSZ4c2FxycMU
	qoRAA8CVmfyBIWYVzXYwyQyEsn0JgYvEmTyM4LdFZTVEcfyq9GZTRGPgMBlIGdZEFob6rkfyQnKUg
	vOw4B8xg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBV-00000005CnW-01Cw;
	Thu, 10 Oct 2024 07:02:08 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ss7tdeW7PchzSqqaQvkxVTIKlW4rJNWH4B0dpyhMHfI=;
	b=kr0cxFj0gVSlMEE3fBkkaHeRSHUxueF9GFnuHyT8EoBrw5kM8z9A7vT7mHfaziowOHgko4
	emX0mO/Zcc6sAED1W8Q87MyLJ11VijeN3B41A73XSWNkjcjJ0zgFQU7D/4DH84wL07nojO
	+imFEsO8ptFPG62YvSNncYQJr+PMMPl/MlFT0G3GUHSWOc3xOcywW0dwwg21GaR5KbSc8/
	vouWYr8IZE13AcoN9V2+dsL1nR0HrrutlYI31CL28a3RcnoSFcMRJR4cYsbWKscZ0Jn3uu
	f13Da8Zj3tRcomPwpty86r2jmKQt1qRpgQtnGal2/nOn0xwuZzMTEaC0/M3thQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ss7tdeW7PchzSqqaQvkxVTIKlW4rJNWH4B0dpyhMHfI=;
	b=Syd5BM2cviXiq6R6Wad9Ulx87EPU2BhSVsgW+gBdV26KBptPbi9XoZM+1Ol+mh8u6Q5tH5
	SwnQrnYbe0DilLCg==
Date: Thu, 10 Oct 2024 09:01:06 +0200
Subject: [PATCH 04/28] arm64: vdso: Drop LBASE_VDSO
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-4-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2310;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1izBRdFKuR8SiZvLAToZn5vA+gLSTJVX1IAtToMcJlk=;
 b=K3gDGZbsUbGnSEnKjQUn89/rq77MzDDW7/mmzjdHk4rROyRkipKRHf5H1neQZFJ9cgZDkviiF
 x2koXkmvm96DlweT1cv/Qb4IsOdhG841Mya56Frd3qzwTmxH5fdKJKa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080205_212587_B0CDE298 
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

VGhpcyBjb25zdGFudCBpcyBhbHdheXMgIjAiLCBwcm92aWRpbmcgbm8gdmFsdWUgYW5kIG1ha2lu
ZyB0aGUgbG9naWMKaGFyZGVyIHRvIHVuZGVyc3RhbmQuCkFsc28gcHJlcGFyZSBmb3IgYSBjb25z
b2xpZGF0aW9uIG9mIHRoZSB2ZHNvIGxpbmtlcnNjcmlwdCBsb2dpYyBieQphbGlnbmluZyBpdCB3
aXRoIG90aGVyIGFyY2hpdGVjdHVyZXMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1
aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4KLS0tCiBhcmNoL2FybTY0L2luY2x1
ZGUvYXNtL3Zkc28uaCAgICAgICB8IDkgKy0tLS0tLS0tCiBhcmNoL2FybTY0L2tlcm5lbC92ZHNv
L3Zkc28ubGRzLlMgICB8IDIgKy0KIGFyY2gvYXJtNjQva2VybmVsL3Zkc28zMi92ZHNvLmxkcy5T
IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdmRzby5oIGIvYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS92ZHNvLmgKaW5kZXggNDMwNTk5NWM4ZjgyZjQxNmU2Y2UxMTI4MGFjMWRk
MTlmYmUyNWVlYy4uM2UzYzNmZGIxODQyNzRhYmQyMDY0NzMzNWIxOWU4MWU3MDk1MDZkYiAxMDA2
NDQKLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS92ZHNvLmgKKysrIGIvYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS92ZHNvLmgKQEAgLTUsMTMgKzUsNiBAQAogI2lmbmRlZiBfX0FTTV9WRFNPX0gK
ICNkZWZpbmUgX19BU01fVkRTT19ICiAKLS8qCi0gKiBEZWZhdWx0IGxpbmsgYWRkcmVzcyBmb3Ig
dGhlIHZEU08uCi0gKiBTaW5jZSB3ZSByYW5kb21pc2UgdGhlIFZEU08gbWFwcGluZywgdGhlcmUn
cyBsaXR0bGUgcG9pbnQgaW4gdHJ5aW5nCi0gKiB0byBwcmVsaW5rIHRoaXMuCi0gKi8KLSNkZWZp
bmUgVkRTT19MQkFTRQkweDAKLQogI2RlZmluZSBfX1ZWQVJfUEFHRVMgICAgMgogCiAjaWZuZGVm
IF9fQVNTRU1CTFlfXwpAQCAtMjAsNyArMTMsNyBAQAogCiAjZGVmaW5lIFZEU09fU1lNQk9MKGJh
c2UsIG5hbWUpCQkJCQkJICAgXAogKHsJCQkJCQkJCQkgICBcCi0JKHZvaWQgKikodmRzb19vZmZz
ZXRfIyNuYW1lIC0gVkRTT19MQkFTRSArICh1bnNpZ25lZCBsb25nKShiYXNlKSk7IFwKKwkodm9p
ZCAqKSh2ZHNvX29mZnNldF8jI25hbWUgKyAodW5zaWduZWQgbG9uZykoYmFzZSkpOyBcCiB9KQog
CiBleHRlcm4gY2hhciB2ZHNvX3N0YXJ0W10sIHZkc29fZW5kW107CmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2tlcm5lbC92ZHNvL3Zkc28ubGRzLlMgYi9hcmNoL2FybTY0L2tlcm5lbC92ZHNvL3Zk
c28ubGRzLlMKaW5kZXggZjIwNGE5ZGRjODMzNTlmY2JlODdmMjQxNzEzODliYjY0ZTdhZGNlYi4u
NGVjMzJlODZhOGRhMjJkNWUyMzE1ZTU1YWUyZTg2ZWM4ZTdmNWY5YSAxMDA2NDQKLS0tIGEvYXJj
aC9hcm02NC9rZXJuZWwvdmRzby92ZHNvLmxkcy5TCisrKyBiL2FyY2gvYXJtNjQva2VybmVsL3Zk
c28vdmRzby5sZHMuUwpAQCAtMjUsNyArMjUsNyBAQCBTRUNUSU9OUwogI2lmZGVmIENPTkZJR19U
SU1FX05TCiAJUFJPVklERShfdGltZW5zX2RhdGEgPSBfdmRzb19kYXRhICsgUEFHRV9TSVpFKTsK
ICNlbmRpZgotCS4gPSBWRFNPX0xCQVNFICsgU0laRU9GX0hFQURFUlM7CisJLiA9IFNJWkVPRl9I
RUFERVJTOwogCiAJLmhhc2gJCTogeyAqKC5oYXNoKSB9CQkJOnRleHQKIAkuZ251Lmhhc2gJOiB7
ICooLmdudS5oYXNoKSB9CmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC92ZHNvMzIvdmRz
by5sZHMuUyBiL2FyY2gvYXJtNjQva2VybmVsL3Zkc28zMi92ZHNvLmxkcy5TCmluZGV4IDhkOTVk
N2QzNTA1N2QyNzgzNWRjZDA2NDNiYjZhNDBhZGZjZDhkNWIuLjczMjcwMmExODdlOWU4YjYyOTcy
ZWUwYWFkNzVjMjM1NjhlNWU3NzkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQva2VybmVsL3Zkc28z
Mi92ZHNvLmxkcy5TCisrKyBiL2FyY2gvYXJtNjQva2VybmVsL3Zkc28zMi92ZHNvLmxkcy5TCkBA
IC0yMiw3ICsyMiw3IEBAIFNFQ1RJT05TCiAjaWZkZWYgQ09ORklHX1RJTUVfTlMKIAlQUk9WSURF
X0hJRERFTihfdGltZW5zX2RhdGEgPSBfdmRzb19kYXRhICsgUEFHRV9TSVpFKTsKICNlbmRpZgot
CS4gPSBWRFNPX0xCQVNFICsgU0laRU9GX0hFQURFUlM7CisJLiA9IFNJWkVPRl9IRUFERVJTOwog
CiAJLmhhc2gJCTogeyAqKC5oYXNoKSB9CQkJOnRleHQKIAkuZ251Lmhhc2gJOiB7ICooLmdudS5o
YXNoKSB9CgotLSAKMi40Ny4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
