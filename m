Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51A4CF07BB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyexFKNE5nUzYe/WkDXrgxiyRkX1RMTiwH2cwHqY9Hg=; b=z4CQdGIsHMWGIJ
	QoN//gZjH6PbN7cZCjjkHL1+2VEpHl3lLkb5cpt8oIZtGYQndUbtVRni4xTThgMKSyFgKtHz88qKx
	mGh99EHLEZSh2YkEujHhvsQ2d5Jmq/03nS8NQgEHTBRhZWbqmn2dSurpAIfWk327v9pIjlSjA5F9f
	snxNWu3ICtHK992TZj40FQ/QB1FDR4CimNF94GqXYdYhWBhNyj+wXTmdoVESzCGN/Lu8t7RahTaPw
	DDU8LfZyfaPmrXAsMWLnHdsLh1ddou6N3SZlhv16Gsoe7hP878vCH0HqbJhpkeu85PB+Ofq7P+G1a
	BHlLaGGVA60/YXLMrkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1synPV-0000000BoK0-2wNF;
	Thu, 10 Oct 2024 07:16:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBf-0000000Blju-0XxK;
	Thu, 10 Oct 2024 07:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=t/w4SV1Y0dGlBhI60ju8MIn/OjnT25/XGrSV5vQ9VkA=; b=izDsEmJSKSefcD2+4NmgjbXSYV
	cMsUBJq27oafWSVnCXrny2TVrwQa9MlLYKrq/g8LU2H6UhQn/cptkt/wiI6J6tg5TOuZfr7K41DSA
	ZlZUqtopSqAifh5mc/IIarAyBMi/Nun5WDEOAg5B1KO+M2pI+oSLa8wdSIZHR8ZAYJc/aZsVRrDG9
	eFdtCH99m079rA4CYvmNsBs2fsNvWy4yuaTS+g5AH1/VtVjaqsBMgHcrnVUe2upa4aiOZD6o/tciR
	2voIIGsUcvnsE+k4JciBWqc+92flBBJrgjIjJeZfOoWFOM232kn4i9MgUN99AZpCNOjKa+xz5La2E
	MwNI6jQQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1synBX-00000005CoT-2mEM;
	Thu, 10 Oct 2024 07:02:13 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/w4SV1Y0dGlBhI60ju8MIn/OjnT25/XGrSV5vQ9VkA=;
	b=PQ5hRnm0f9UYWTlG6LzTHyD9fPH+nQg/xOsRifCFz96D/eNAPAqPG1vBA+wiPeQBZSOGvj
	PiJkIciUllmrR1BAdqOTzJ0qC0U7h+5030uywATEZwmtat7O78cGT6dUaXq2MHSyIe8UKH
	p8zcqSynsG2FcZdBnnt8XPAY7kasrMRHiyCGOJb+FprXjla6Wl9to5Z/TemOIXavYQD3jT
	WPf5SSBn2UDQpYfbpDUOrrv/lSDf3WFW6ahDCJgyQxWmYPyc/+zPU/bRsTwRPmJbEYjwhy
	ZJpqWynPN6oNR5ViTmGWlwH4/zcEAnVBqeNZoCW2oh804ITwSRKmYzCOdSGdYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/w4SV1Y0dGlBhI60ju8MIn/OjnT25/XGrSV5vQ9VkA=;
	b=gKaavZTXqvJRr+jsvjp+bHPm79VyKKOtnY0AApgyLWhsn2XV8oRWjdhXjNPVpgocX6HGVg
	fqI/T7bPpWSeIRDA==
Date: Thu, 10 Oct 2024 09:01:09 +0200
Subject: [PATCH 07/28] arm: vdso: Remove assembly for datapage access
MIME-Version: 1.0
Message-Id: <20241010-vdso-generic-base-v1-7-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2900;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6Re6IPDsg0EiSptRbunZNSRyEEPrHpkzo4P7+ISqDSI=;
 b=RKzw5wvjbgsa0HF8+jBhQrpsnrQU14AOMrv0q2gs2sUrtA4ASsSZO9n0hyTrQHwhxNNzMRWnU
 NgdQkh9BLtwBXU2tIdz7phptwddOwOAyRAkwG7SWrZwL0R1blOuMFQW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_080207_958236_0A54802F 
X-CRM114-Status: GOOD (  12.53  )
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

dmRzby9kYXRhcGFnZS5oIHByb3ZpZGVzIGEgaGlkZGVuIGRlY2xhcmF0aW9uIGZvciBfdmRzb19k
YXRhLgpXaGVuIHVzaW5nIGl0IHRoZSBjb21waWxlciB3aWxsIGF1dG9tYXRpY2FsbHkgZ2VuZXJh
dGUgUEMtcmVsYXRpdmUKYWNjZXNzZXMgd2hpY2ggYXZvaWRzIHRoZSBuZWVkIGZvciBhIGN1c3Rv
bSBhc3NlbWJseS1iYXNlZCBhY2Nlc3Nvci4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3Nj
aHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIGFyY2gvYXJtL2luY2x1
ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5LmggfCAgNCArLS0tCiBhcmNoL2FybS92ZHNvL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtL3Zkc28vZGF0YXBhZ2UuUyAg
ICAgICAgICAgICAgICAgfCAxNiAtLS0tLS0tLS0tLS0tLS0tCiBhcmNoL2FybS92ZHNvL3Zkc28u
bGRzLlMgICAgICAgICAgICAgICAgIHwgIDMgKystCiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5jbHVkZS9h
c20vdmRzby9nZXR0aW1lb2ZkYXkuaCBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGlt
ZW9mZGF5LmgKaW5kZXggMjEzNGNiZDU0NjlmZWVmMDIwZWYzMDQ5NGI2NjdiOTM5NzJmOWZhYy4u
NTkyZDNkMDE1Y2E3Mjk4YjNiYzM1ODcxMzg3ZGJiM2U3ZjgxOTgyNyAxMDA2NDQKLS0tIGEvYXJj
aC9hcm0vaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaAorKysgYi9hcmNoL2FybS9pbmNs
dWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oCkBAIC0xNSw4ICsxNSw2IEBACiAKICNkZWZpbmUg
VkRTT19IQVNfQ0xPQ0tfR0VUUkVTCQkxCiAKLWV4dGVybiBzdHJ1Y3QgdmRzb19kYXRhICpfX2dl
dF9kYXRhcGFnZSh2b2lkKTsKLQogc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQgZ2V0dGltZW9m
ZGF5X2ZhbGxiYWNrKAogCQkJCXN0cnVjdCBfX2tlcm5lbF9vbGRfdGltZXZhbCAqX3R2LAogCQkJ
CXN0cnVjdCB0aW1lem9uZSAqX3R6KQpAQCAtMTM5LDcgKzEzNyw3IEBAIHN0YXRpYyBfX2Fsd2F5
c19pbmxpbmUgdTY0IF9fYXJjaF9nZXRfaHdfY291bnRlcihpbnQgY2xvY2tfbW9kZSwKIAogc3Rh
dGljIF9fYWx3YXlzX2lubGluZSBjb25zdCBzdHJ1Y3QgdmRzb19kYXRhICpfX2FyY2hfZ2V0X3Zk
c29fZGF0YSh2b2lkKQogewotCXJldHVybiBfX2dldF9kYXRhcGFnZSgpOworCXJldHVybiBfdmRz
b19kYXRhOwogfQogCiAjZW5kaWYgLyogIV9fQVNTRU1CTFlfXyAqLwpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vdmRzby9NYWtlZmlsZSBiL2FyY2gvYXJtL3Zkc28vTWFrZWZpbGUKaW5kZXggMDEwNjdh
MmJjNDNiNzRjYzNhNGMwNzFiNGEwZmJlYjA5MzNlOWZmNy4uOGEzMDZiYmVjNGEwYzRkNGI2NTgw
ZmU4ODE4N2ZhZjlmNTQyMmVlZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vdmRzby9NYWtlZmlsZQor
KysgYi9hcmNoL2FybS92ZHNvL01ha2VmaWxlCkBAIC01LDcgKzUsNyBAQCBpbmNsdWRlICQoc3Jj
dHJlZSkvbGliL3Zkc28vTWFrZWZpbGUKIAogaG9zdHByb2dzIDo9IHZkc29tdW5nZQogCi1vYmot
dmRzbyA6PSB2Z2V0dGltZW9mZGF5Lm8gZGF0YXBhZ2UubyBub3RlLm8KK29iai12ZHNvIDo9IHZn
ZXR0aW1lb2ZkYXkubyBub3RlLm8KIAogIyBCdWlsZCBydWxlcwogdGFyZ2V0cyA6PSAkKG9iai12
ZHNvKSB2ZHNvLnNvIHZkc28uc28uZGJnIHZkc28uc28ucmF3IHZkc28ubGRzCmRpZmYgLS1naXQg
YS9hcmNoL2FybS92ZHNvL2RhdGFwYWdlLlMgYi9hcmNoL2FybS92ZHNvL2RhdGFwYWdlLlMKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDljZDczYjcyNWQ5ZmI4OWMyYjliYjFkMTE3OGNj
ZTcwNWJhZmYzOGIuLjAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAKLS0t
IGEvYXJjaC9hcm0vdmRzby9kYXRhcGFnZS5TCisrKyAvZGV2L251bGwKQEAgLTEsMTYgKzAsMCBA
QAotLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KLSNpbmNsdWRlIDxsaW51
eC9saW5rYWdlLmg+Ci0jaW5jbHVkZSA8YXNtL2FzbS1vZmZzZXRzLmg+Ci0KLQkuYWxpZ24gMgot
LkxfdmRzb19kYXRhX3B0cjoKLQkubG9uZwlfc3RhcnQgLSAuIC0gVkRTT19EQVRBX1NJWkUKLQot
RU5UUlkoX19nZXRfZGF0YXBhZ2UpCi0JLmZuc3RhcnQKLQlhZHIJcjAsIC5MX3Zkc29fZGF0YV9w
dHIKLQlsZHIJcjEsIFtyMF0KLQlhZGQJcjAsIHIwLCByMQotCWJ4CWxyCi0JLmZuZW5kCi1FTkRQ
Uk9DKF9fZ2V0X2RhdGFwYWdlKQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vdmRzby92ZHNvLmxkcy5T
IGIvYXJjaC9hcm0vdmRzby92ZHNvLmxkcy5TCmluZGV4IDE2NWQxZDJlYjc2YjNjZWE5YjA1NGZm
YTg5MDZhZmRmZmEwZWFlNTcuLjliZmEwZjUyOTIzYzg1MWI2YjllOTZkNGRiYjUxZWIzZDVkMDk2
MGEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL3Zkc28vdmRzby5sZHMuUworKysgYi9hcmNoL2FybS92
ZHNvL3Zkc28ubGRzLlMKQEAgLTExLDYgKzExLDcgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgv
Y29uc3QuaD4KKyNpbmNsdWRlIDxhc20vYXNtLW9mZnNldHMuaD4KICNpbmNsdWRlIDxhc20vcGFn
ZS5oPgogI2luY2x1ZGUgPGFzbS92ZHNvLmg+CiAKQEAgLTE5LDcgKzIwLDcgQEAgT1VUUFVUX0FS
Q0goYXJtKQogCiBTRUNUSU9OUwogewotCVBST1ZJREUoX3N0YXJ0ID0gLik7CisJUFJPVklERShf
dmRzb19kYXRhID0gLiAtIFZEU09fREFUQV9TSVpFKTsKIAogCS4gPSBTSVpFT0ZfSEVBREVSUzsK
IAoKLS0gCjIuNDcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
